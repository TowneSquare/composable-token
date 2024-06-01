/*
    Module of composability.

    - Forked from aptos_token_objects::aptos_token.move
    - This contract represents the core of the studio.
    - Allows to create collections and mint tokens.
    - Leverages aptos_token_objects.
    - All functions are internals and has limited visibility (check NOTES).
    - A user can create the following:
        - Collections using aptos_token_objects/collection.move
        - Trait token: A token V2 that represents a trait.
        - Composable token (cNFT): A token V2 that can hold Trait tokens.
    TODOs:
        - !!!improve error handling: should implement assert functions to eliminate redundancy.
        - Organize the functions based on alphabetical order.
        - when creating token common, check if vectors are not empty, if so, add the vectors instead of creating empty ones.
        - tokens uri mutability is valid when tokens does not have children (aka list of tokens is empty).
        - changing the URI of Trait and DA will require us to update the URI of the parent token as well (from parent field) if exists.
        - some functions can be generic.
        - Fix typo in comment (create collection params).
        - Work on rarities
*/

module composable_token::composable_token {

    use aptos_framework::event;
    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;

    use aptos_std::simple_map::{Self, SimpleMap};
    use aptos_std::type_info;

    use aptos_token_objects::collection::{Self, Collection as CollectionV2};
    use aptos_token_objects::property_map;
    use aptos_token_objects::royalty;
    use aptos_token_objects::token;

    use std::error;
    use std::option::{Self, Option};
    use std::signer;
    use std::string::{Self, String};
    use std::vector;
    use minter::token_components;
    use minter::collection_components;
    use minter::collection_properties;

    // -------
    // Asserts
    // -------

    /// The collection type is not recognised.
    const EUNKNOWN_COLLECTION_TYPE: u64 = 0;
    /// The token type is not recognised.
    const EUNKNOWN_TOKEN_TYPE: u64 = 1;
    /// The naming style is not recognised.
    const EUNKNOWN_NAMING_TYPE: u64 = 2;
    /// The collection does not exist.
    const ECOLLECTION_DOES_NOT_EXIST: u64 = 3;
    /// The composable token does not exist.
    const ECOMPOSABLE_DOES_NOT_EXIST: u64 = 4;
    /// The trait token does not exist.
    const ETRAIT_DOES_NOT_EXIST: u64 = 5;
    /// The signer is not the collection owner
    const ENOT_COLLECTION_OWNER: u64 = 6;
    /// The field is not mutable.
    const EFIELD_NOT_MUTABLE: u64 = 7;
    /// The properties are not mutable.
    const EPROPERTIES_NOT_MUTABLE: u64 = 8;
    /// The ungated transfer is disabled.
    const EUNGATED_TRANSFER_DISABLED: u64 = 9;
    /// The signer is not the owner of the token.
    const ENOT_OWNER: u64 = 10;
    /// The references does not exist.
    const EREFS_DOES_NOT_EXIST: u64 = 11;
    /// The digital asset does not exist.
    const EDA_DOES_NOT_EXIST: u64 = 12;
    /// The process type is not recognised.
    const EUNKNOWN_PROCESS_TYPE: u64 = 13;

    // TODO: add asserts functions here.

    // ---------
    // Resources
    // ---------

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    /// Storage state for collections
    struct Collection has key {
        // Name of the collection
        name: String,
        // Symbol of the collection
        symbol: String,
        // Supply type of the collection; can be fixed, unlimited or concurrent
        supply_type: String,
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    /// Storage state for composable_token; aka, the atom/primary of the token
    struct Composable has key {
        traits: vector<Object<Trait>>,
        digital_assets: vector<Object<DA>>,
        mutator_ref: token::MutatorRef
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    /// Storage state for traits
    struct Trait has key {
        parent: Option<address>, // address of parent token if equipped
        index: u64, // index of the trait in the traits vector from composable_token
        digital_assets: vector<Object<DA>>, // digital assets that the trait holds
        mutator_ref: token::MutatorRef,
        transfer_ref: object::TransferRef
    }

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    /// Storage state for digital assets
    struct DA has key {
        parent: Option<address>, // address of parent token if equipped
        index: u64, // index of the da in the digital_assets vector from composable_token or traits
        transfer_ref: object::TransferRef
    }

    // Used to determine the naming style of the token
    struct Indexed has key {}
    struct Named has key {}

    // Used to determine the type of the process
    struct Equip has key {}
    struct Unequip has key {}

    // ------
    // Events
    // ------

    /// Collection related
    struct CollectionMetadata has drop, store {
        creator: address,
        collection_addr: address,
        supply_type: String,   // Fixed, Unlimited or Concurrent
        description: String,
        max_supply: Option<u64>,    // if the collection is set to haved a fixed or concurrent supply.
        name: String,
        symbol: String,
        uri: String,
        mutable_description: bool,
        mutable_royalty: bool,
        mutable_uri: bool,
        mutable_token_description: bool,
        mutable_token_name: bool,
        mutable_token_properties: bool,
        mutable_token_uri: bool,
        tokens_burnable_by_collection_owner: bool,
        tokens_transferable_by_collection_owner: bool,
        royalty_numerator: Option<u64>,
        royalty_denominator: Option<u64>
    }

    inline fun collection_metadata(
        collection_object: Object<Collection>,
        max_supply: Option<u64>,
        royalty_numerator: Option<u64>,
        royalty_denominator: Option<u64>
    ): CollectionMetadata acquires Collection {
        let creator_addr = collection::creator(collection_object);
        let collection_addr = object::object_address(&collection_object);
        let supply_type = collection_supply_type(collection_object);
        let description = collection::description(collection_object);
        let name = collection::name(collection_object);
        let symbol = collection_symbol(collection_object);
        let uri = collection::uri(collection_object);
        let mutable_description = collection_properties::is_mutable_description(collection_object);
        let mutable_royalty = collection_properties::is_mutable_royalty(collection_object);
        let mutable_uri = collection_properties::is_mutable_uri(collection_object);
        let mutable_token_description = collection_properties::is_mutable_token_description(collection_object);
        let mutable_token_name = collection_properties::is_mutable_token_name(collection_object);
        let mutable_token_properties =collection_properties::is_mutable_token_properties(collection_object);
        let mutable_token_uri = collection_properties::is_mutable_token_uri(collection_object);
        let tokens_burnable_by_collection_owner = collection_properties::is_tokens_burnable_by_collection_owner(collection_object);
        let tokens_transferable_by_collection_owner = collection_properties::is_tokens_transferable_by_collection_owner(collection_object);

        CollectionMetadata {
            creator: creator_addr,
            collection_addr,
            supply_type,
            description,
            max_supply,
            name,
            symbol,
            uri,
            mutable_description,
            mutable_royalty,
            mutable_uri,
            mutable_token_description,
            mutable_token_name,
            mutable_token_properties,
            mutable_token_uri,
            tokens_burnable_by_collection_owner,
            tokens_transferable_by_collection_owner,
            royalty_numerator,
            royalty_denominator
        }
    }

    #[event]
    struct CollectionCreatedEvent has drop, store { metadata: CollectionMetadata }
    fun emit_collection_created_event<SupplyType: key>(
        collection_object: Object<Collection>,
        max_supply: Option<u64>,
        royalty_numerator: Option<u64>,
        royalty_denominator: Option<u64>
    ) acquires Collection {
        let metadata = collection_metadata(
            collection_object,
            max_supply,
            royalty_numerator,
            royalty_denominator
        );
        event::emit<CollectionCreatedEvent>( CollectionCreatedEvent { metadata });
    }

    // Token related

    #[event]
    struct TokenBurnedEvent has drop, store { token_addr: address, token_type: String }
    fun emit_token_burned_event(
        token_addr: address,
        token_type: String
    ) {
        event::emit<TokenBurnedEvent>( TokenBurnedEvent { token_addr, token_type });
    }

    #[event]
    struct TokenDescriptionUpdatedEvent has drop, store {
        token_addr: address,
        token_type: String,
        old_description: String,
        new_description: String
    }
    fun emit_token_description_updated_event(
        token_addr: address,
        token_type: String,
        old_description: String,
        new_description: String
    ) {
        event::emit<TokenDescriptionUpdatedEvent>(
            TokenDescriptionUpdatedEvent {
                token_addr,
                token_type,
                old_description,
                new_description
            }
        );
    }

    #[event]
    struct TokenNameUpdatedEvent has drop, store {
        token_addr: address,
        token_type: String,
        old_name: String,
        new_name: String
    }
    fun emit_token_name_updated_event(
        token_addr: address,
        token_type: String,
        old_name: String,
        new_name: String
    ) {
        event::emit<TokenNameUpdatedEvent>(
            TokenNameUpdatedEvent {
                token_addr,
                token_type,
                old_name,
                new_name
            }
        );
    }

    #[event]
    struct TokenUriUpdatedEvent has drop, store {
        token_addr: address,
        token_type: String,
        old_uri: String,
        new_uri: String
    }
    fun emit_token_uri_updated_event(
        token_addr: address,
        token_type: String,
        old_uri: String,
        new_uri: String
    ) {
        event::emit<TokenUriUpdatedEvent>(
            TokenUriUpdatedEvent {
                token_addr,
                token_type,
                old_uri,
                new_uri
            }
        );
    }

    #[event]
    struct PropertyAddedEvent has drop, store {
        token_addr: address,
        token_type: String,
        key: String,
        type: String,
        value: vector<u8>
    }
    fun emit_property_added_event(
        token_addr: address,
        token_type: String,
        key: String,
        type: String,
        value: vector<u8>
    ) {
        event::emit<PropertyAddedEvent>(
            PropertyAddedEvent {
                token_addr,
                token_type,
                key,
                type,
                value
            }
        );
    }

    #[event]
    struct TypedPropertyAddedEvent has drop, store {
        token_addr: address,
        token_type: String,
        key: String,
        value: String
    }
    fun emit_typed_property_added_event(
        token_addr: address,
        token_type: String,
        key: String,
        value: String
    ) {
        event::emit<TypedPropertyAddedEvent>(
            TypedPropertyAddedEvent {
                token_addr,
                token_type,
                key,
                value
            }
        );
    }

    #[event]
    struct PropertyRemovedEvent has drop, store {
        token_addr: address,
        token_type: String,
        key: String
    }
    fun emit_property_removed_event(
        token_addr: address,
        token_type: String,
        key: String
    ) {
        event::emit<PropertyRemovedEvent>(
            PropertyRemovedEvent {
                token_addr,
                token_type,
                key
            }
        );
    }

    #[event]
    struct PropertyUpdatedEvent has drop, store {
        token_addr: address,
        token_type: String,
        key: String,
        old_value: vector<u8>,
        new_value: vector<u8>
    }
    fun emit_property_updated_event(
        token_addr: address,
        token_type: String,
        key: String,
        old_value: vector<u8>,
        new_value: vector<u8>
    ) {
        event::emit<PropertyUpdatedEvent>(
            PropertyUpdatedEvent {
                token_addr,
                token_type,
                key,
                old_value,
                new_value
            }
        );
    }

    // Composable

    struct ComposableMetadata has drop, store {
        creator: address,
        token_address: address,
        name: String,
        uri: String,
        mutable_description: bool,
        mutable_name: bool,
        mutable_uri: bool,
        mutable_properties: bool,
        burnable: bool,
        transferable: bool
    }

    inline fun composable_metadata(
        composable_object: Object<Composable>
    ): ComposableMetadata {
        let creator_addr = token::creator<Composable>(composable_object);
        let token_address = object::object_address(&composable_object);
        let name = token::name<Composable>(composable_object);
        let uri = token::uri<Composable>(composable_object);
        let mutable_description = collection_properties::is_mutable_description(token::collection_object(composable_object));
        let mutable_name = collection_properties::is_mutable_token_name(token::collection_object(composable_object));
        let mutable_uri = collection_properties::is_mutable_uri(token::collection_object(composable_object));
        let mutable_properties = collection_properties::is_mutable_token_properties(token::collection_object(composable_object));
        let burnable = collection_properties::is_tokens_burnable_by_collection_owner(token::collection_object(composable_object));
        let transferable = collection_properties::is_tokens_transferable_by_collection_owner(token::collection_object(composable_object));

        ComposableMetadata {
            creator: creator_addr,
            token_address,
            name,
            uri,
            mutable_description,
            mutable_name,
            mutable_uri,
            mutable_properties,
            burnable,
            transferable
        }
    }

    #[event]
    struct ComposableCreatedEvent has drop, store { metadata: ComposableMetadata }
    fun emit_composable_created_event(composable_object: Object<Composable>) {
        let metadata = composable_metadata(composable_object);
        event::emit<ComposableCreatedEvent>( ComposableCreatedEvent { metadata });
    }

    // Trait

    struct TraitMetadata has drop, store {
        creator: address,
        token_address: address,
        name: String,
        uri: String,
        mutable_description: bool,
        mutable_name: bool,
        mutable_uri: bool,
        mutable_properties: bool,
        burnable: bool,
        transferable: bool
    }

    inline fun trait_metadata(trait_object: Object<Trait>): TraitMetadata {
        let creator_addr = token::creator(trait_object);
        let token_address = object::object_address(&trait_object);
        let name = token::name(trait_object);
        let uri = token::uri(trait_object);
        let mutable_description = collection_properties::is_mutable_description(token::collection_object(trait_object));
        let mutable_name = collection_properties::is_mutable_token_name(token::collection_object(trait_object));
        let mutable_uri = collection_properties::is_mutable_uri(token::collection_object(trait_object));
        let mutable_properties = collection_properties::is_mutable_token_properties(token::collection_object(trait_object));
        let burnable = collection_properties::is_tokens_burnable_by_collection_owner(token::collection_object(trait_object));
        let transferable = collection_properties::is_tokens_transferable_by_collection_owner(token::collection_object(trait_object));

        TraitMetadata {
            creator: creator_addr,
            token_address,
            name,
            uri,
            mutable_description,
            mutable_name,
            mutable_uri,
            mutable_properties,
            burnable,
            transferable,
        }
    }

    #[event]
    struct TraitCreatedEvent has drop, store { metadata: TraitMetadata }
    fun emit_trait_created_event(trait_object: Object<Trait>) {
        let metadata = trait_metadata(trait_object);
        event::emit<TraitCreatedEvent>( TraitCreatedEvent { metadata });
    }

    // DA

    struct DAMetadata has drop, store {
        creator: address,
        token_address: address,
        name: String,
        uri: String,
        mutable_description: bool,
        mutable_name: bool,
        mutable_uri: bool,
        mutable_properties: bool,
        burnable: bool,
        transferable: bool
    }

    inline fun da_metadata(da_object: Object<DA>): DAMetadata {
        let creator_addr = token::creator<DA>(da_object);
        let token_address = object::object_address(&da_object);
        let name = token::name<DA>(da_object);
        let uri = token::uri<DA>(da_object);
        let mutable_description = collection_properties::is_mutable_description(token::collection_object(da_object));
        let mutable_name = collection_properties::is_mutable_token_name(token::collection_object(da_object));
        let mutable_uri = collection_properties::is_mutable_uri(token::collection_object(da_object));
        let mutable_properties = collection_properties::is_mutable_token_properties(token::collection_object(da_object));
        let burnable = collection_properties::is_tokens_burnable_by_collection_owner(token::collection_object(da_object));
        let transferable = collection_properties::is_tokens_transferable_by_collection_owner(token::collection_object(da_object));

        DAMetadata {
            creator: creator_addr,
            token_address,
            name,
            uri,
            mutable_description,
            mutable_name,
            mutable_uri,
            mutable_properties,
            burnable,
            transferable,
        }
    }

    #[event]
    struct DACreatedEvent has drop, store { metadata: DAMetadata }
    fun emit_da_created_event(da_object: Object<DA>) {
        let metadata = da_metadata(da_object);
        event::emit<DACreatedEvent>( DACreatedEvent { metadata });
    }

    // Composition related

    #[event]
    struct TraitEquippedEvent has drop, store {
        composable: ComposableMetadata,
        trait: TraitMetadata,
        index: u64,
        new_uri: String
    }
    fun emit_trait_equipped_event(
        composable_object: Object<Composable>,
        trait_object: Object<Trait>,
        index: u64,
        new_uri: String
    ) {
        let composable_metadata = composable_metadata(composable_object);
        let trait_metadata = trait_metadata(trait_object);
        event::emit<TraitEquippedEvent>(
            TraitEquippedEvent {
                composable: composable_metadata,
                trait: trait_metadata,
                index,
                new_uri
            }
        );
    }

    #[event]
    struct TraitUnequippedEvent has drop, store {
        composable: ComposableMetadata,
        trait: TraitMetadata,
        index: u64,
        new_uri: String
    }
    fun emit_trait_unequipped_event(
        composable_object: Object<Composable>,
        trait_object: Object<Trait>,
        index: u64,
        new_uri: String
    ) {
        let composable_metadata = composable_metadata(composable_object);
        let trait_metadata = trait_metadata(trait_object);
        event::emit<TraitUnequippedEvent>(
            TraitUnequippedEvent {
                composable: composable_metadata,
                trait: trait_metadata,
                index,
                new_uri
            }
        );
    }

    struct TokenMetadata has drop, store {
        creator: address,
        token_address: address,
        name: String,
        uri: String,
        mutable_description: bool,
        mutable_name: bool,
        mutable_uri: bool,
        mutable_properties: bool,
        burnable: bool,
        transferable: bool
    }

    inline fun digital_asset_metadata(token_object: Object<DA>): TokenMetadata {
        let creator_addr = token::creator<DA>(token_object);
        let token_address = object::object_address(&token_object);
        let name = token::name<DA>(token_object);
        let uri = token::uri<DA>(token_object);

        let mutable_description = collection_properties::is_mutable_description(token::collection_object(token_object));
        let mutable_name = collection_properties::is_mutable_token_name(token::collection_object(token_object));
        let mutable_uri = collection_properties::is_mutable_uri(token::collection_object(token_object));
        let mutable_properties = collection_properties::is_mutable_token_properties(token::collection_object(token_object));
        let burnable = collection_properties::is_tokens_burnable_by_collection_owner(token::collection_object(token_object));
        let transferable = collection_properties::is_tokens_transferable_by_collection_owner(token::collection_object(token_object));

        TokenMetadata {
            creator: creator_addr,
            token_address,
            name,
            uri,
            mutable_description,
            mutable_name,
            mutable_uri,
            mutable_properties,
            burnable,
            transferable,
        }
    }

    #[event]
    struct DigitalAssetEquippedEvent has drop, store {
        parent_addr: address,
        da: TokenMetadata,
        index: u64,
        new_uri: String
    }
    fun emit_digital_asset_equipped_event(
        parent_addr: address,
        da_object: Object<DA>,
        index: u64,
        new_uri: String
    ) {
        let da_metadata = digital_asset_metadata(da_object);
        event::emit<DigitalAssetEquippedEvent>(
            DigitalAssetEquippedEvent {
                parent_addr,
                da: da_metadata,
                index,
                new_uri
            }
        );
    }

    #[event]
    struct DigitalAssetUnequippedEvent has drop, store {
        parent: address,
        da: TokenMetadata,
        index: u64,
        new_uri: String
    }
    fun emit_digital_asset_unequipped_event(
        parent: address,
        da_object: Object<DA>,
        index: u64,
        new_uri: String
    ) {
        let da_metadata = digital_asset_metadata(da_object);
        event::emit<DigitalAssetUnequippedEvent>(
            DigitalAssetUnequippedEvent {
                parent,
                da: da_metadata,
                index,
                new_uri
            }
        );
    }

    // FA related

    #[event]
    struct FAEquippedEvent has drop, store {
        composable: ComposableMetadata,
        fa: address,
        amount: u64
    }
    fun emit_fa_equipped_event(
        composable_object: Object<Composable>,
        fa: address,
        amount: u64
    ) {
        let composable_metadata = composable_metadata(composable_object);
        event::emit<FAEquippedEvent>(
            FAEquippedEvent {
                composable: composable_metadata,
                fa,
                amount
            }
        );
    }

    #[event]
    struct FAUnequippedEvent has drop, store {
        composable: ComposableMetadata,
        fa: address,
        amount: u64
    }
    fun emit_fa_unequipped_event(
        composable_object: Object<Composable>,
        fa: address,
        amount: u64
    ) {
        let composable_metadata = composable_metadata(composable_object);
        event::emit<FAUnequippedEvent>(
            FAUnequippedEvent {
                composable: composable_metadata,
                fa,
                amount
            }
        );
    }

    // Transfer related

    #[event]
    struct TokenTransferredEvent has drop, store {
        token_addr: address,
        from: address,
        to: address
    }
    fun emit_token_transferred_event(
        token_addr: address,
        from: address,
        to: address
    ) {
        event::emit<TokenTransferredEvent>( TokenTransferredEvent { token_addr, from, to });
    }

    #[event]
    struct FATransferredEvent has drop, store {
        fa: address,
        from: address,
        to: address,
        amount: u64
    }
    fun emit_fa_transferred_event(
        fa: address,
        from: address,
        to: address,
        amount: u64
    ) {
        event::emit<FATransferredEvent>( FATransferredEvent { fa, from, to, amount });
    }

    #[event]
    struct TransferFrozenEvent has drop, store { token_addr: address, token_type: String }
    fun emit_transfer_frozen_event(token_addr: address, token_type: String) {
        event::emit<TransferFrozenEvent>( TransferFrozenEvent { token_addr, token_type });
    }

    #[event]
    struct TransferUnfrozenEvent has drop, store { token_addr: address, token_type: String }
    fun emit_transfer_unfrozen_event(token_addr: address, token_type: String) {
        event::emit<TransferUnfrozenEvent>( TransferUnfrozenEvent { token_addr, token_type });
    }

    // ------------------
    // Internal Functions
    // ------------------

    /// create royalty; used when creating a collection or a token
    inline fun create_royalty_internal(
        royalty_numerator: Option<u64>,
        royalty_denominator: Option<u64>,
        payee_addr: address
    ): Option<royalty::Royalty> {
        if (option::is_some(&royalty_numerator) && option::is_some(&royalty_denominator)) {
            let royalty_resource = royalty::create(
                option::extract(&mut royalty_numerator),
                option::extract(&mut royalty_denominator),
                payee_addr
            );
            option::some<royalty::Royalty>(royalty_resource)
        } else { option::none<royalty::Royalty>() }
    }
    /// setup collection; internal function used when creating a collection
    inline fun collection_create_common(
        signer_ref: &signer,
        constructor_ref: &object::ConstructorRef,
        name: String,
        symbol: String,
        supply_type: String,
        mutable_description: bool,
        mutable_uri: bool,
        mutable_token_description: bool,
        mutable_token_name: bool,
        mutable_token_properties: bool,
        mutable_token_uri: bool,
        tokens_burnable_by_collection_owner: bool,
        tokens_freezable_by_collection_owner: bool,
        mutable_royalty: bool
    ) {
        collection_components::create_refs_and_properties(constructor_ref);

        set_collection_properties(
            signer_ref,
            object::object_from_constructor_ref(constructor_ref),
            mutable_description,
            mutable_uri,
            mutable_token_description,
            mutable_token_name,
            mutable_token_properties,
            mutable_token_uri,
            mutable_royalty,
            tokens_burnable_by_collection_owner,
            tokens_freezable_by_collection_owner
        );

        // move the collection resource to the object
        // TODO: should not be transferable, test it.
        let obj_signer = object::generate_signer(constructor_ref);
        move_to(&obj_signer, Collection { name, symbol, supply_type });
    }

    /// create a collection internal
    inline fun create_collection_internal<SupplyType: key>(
        signer_ref: &signer,
        description: String,
        max_supply: Option<u64>, // if the collection is set to haved a fixed supply.
        name: String,
        symbol: String,
        uri: String,
        mutable_description: bool,
        mutable_royalty: bool,
        mutable_uri: bool,
        mutable_token_description: bool,
        mutable_token_name: bool,
        mutable_token_properties: bool,
        mutable_token_uri: bool,
        tokens_burnable_by_collection_owner: bool,
        tokens_freezable_by_collection_owner: bool,
        royalty: Option<royalty::Royalty>
    ): object::ConstructorRef {
        let supply_type = type_info::type_name<SupplyType>();
        // constructor reference, needed to generate signer object and references.
        let constructor_ref = if (type_info::type_of<SupplyType>() == type_info::type_of<collection::FixedSupply>()) {
            collection::create_fixed_collection(
                signer_ref,
                description,
                option::extract(&mut max_supply),
                name,
                // payee address is the creator by default, it can be changed after creation.
                royalty,
                uri
            )
        } else if (type_info::type_of<SupplyType>() == type_info::type_of<collection::UnlimitedSupply>()) {
            // if type is unlimited
            collection::create_unlimited_collection(
                signer_ref,
                description,
                name,
                // payee address is the creator by default, it can be changed after creation.
                royalty,
                uri
            )
        } else {
            // if type is concurrent
            // else if (type_info::type_of<SupplyType>() == type_info::type_of<collection::ConcurrentSupply>()) {}
            // If type is not recognised, abort.
            abort EUNKNOWN_COLLECTION_TYPE
        };

        collection_create_common(
            signer_ref,
            &constructor_ref,
            name,
            symbol,
            supply_type,
            mutable_description,
            mutable_uri,
            mutable_token_description,
            mutable_token_name,
            mutable_token_properties,
            mutable_token_uri,
            tokens_burnable_by_collection_owner,
            tokens_freezable_by_collection_owner,
            mutable_royalty
        );

        constructor_ref
    }

    /// Create a collection;
    /// this will create a collection resource, a collection object,
    /// and returns the constructor reference of the collection.
    public fun create_collection<SupplyType: key>(
        signer_ref: &signer,
        description: String,
        max_supply: Option<u64>, // if the collection is set to haved a fixed supply.
        name: String,
        symbol: String,
        uri: String,
        mutable_description: bool,
        mutable_royalty: bool,
        mutable_uri: bool,
        mutable_token_description: bool,
        mutable_token_name: bool,
        mutable_token_properties: bool,
        mutable_token_uri: bool,
        tokens_burnable_by_collection_owner: bool,
        tokens_freezable_by_collection_owner: bool,
        royalty_numerator: Option<u64>,
        royalty_denominator: Option<u64>
        // TODO: add payee address option that if it is ignored then the payee addr will be the signer.
    ): object::ConstructorRef acquires Collection {
        // TODO: assert supply type is either fixed, unlimited, or concurrent.
        let signer_addr = signer::address_of(signer_ref);
        let royalty = create_royalty_internal(royalty_numerator, royalty_denominator, signer_addr);
        let constructor_ref = create_collection_internal<SupplyType>(
            signer_ref,
            description,
            max_supply,
            name,
            symbol,
            uri,
            mutable_description,
            mutable_royalty,
            mutable_uri,
            mutable_token_description,
            mutable_token_name,
            mutable_token_properties,
            mutable_token_uri,
            tokens_burnable_by_collection_owner,
            tokens_freezable_by_collection_owner,
            royalty
        );

        // emit event
        emit_collection_created_event<SupplyType>(
            object::object_from_constructor_ref(&constructor_ref),
            max_supply,
            royalty_numerator,
            royalty_denominator
        );

        constructor_ref
    }

    /// create token internal
    inline fun create_token_internal<Type: key, NamingStyle: key>(
        signer_ref: &signer,
        collection: Object<Collection>,
        description: String,
        name: String,
        name_with_index_prefix: String,
        name_with_index_suffix: String,
        uri: String,
        royalty: Option<royalty::Royalty>,
        property_keys: vector<String>,
        property_types: vector<String>,
        property_values: vector<vector<u8>>
    ): object::ConstructorRef {
        let collection_name = collection::name(collection);
        // Naming style is named
        let constructor_ref = if (type_info::type_of<NamingStyle>() == type_info::type_of<Named>()) {
            // constructor reference, needed to generate signer object and references.
            token::create_named_token(
                signer_ref,
                collection_name,
                description,
                name,
                royalty,
                uri,
            )
        } else if (type_info::type_of<NamingStyle>() == type_info::type_of<Indexed>()) {
            // constructor reference, needed to generate signer object and references.
            token::create_numbered_token(
                signer_ref,
                collection_name,
                description,
                name_with_index_prefix,
                name_with_index_suffix,
                royalty,
                uri,
            )
        } else { abort EUNKNOWN_NAMING_TYPE };

        // create token commons
        token_create_common<Type>(&constructor_ref);

        initialize_token_properties(&constructor_ref, property_keys, property_types, property_values);

        constructor_ref
    }

    inline fun initialize_token_properties(
        constructor_ref: &object::ConstructorRef,
        property_keys: vector<String>,
        property_types: vector<String>,
        property_values: vector<vector<u8>>,
    ) {
        let mutator_ref = &property_map::generate_mutator_ref(constructor_ref);
        for (i in 0..vector::length(&property_keys)) {
            let key = *vector::borrow(&property_keys, i);
            let type = *vector::borrow(&property_types, i);
            let value = *vector::borrow(&property_values, i);
            property_map::add(mutator_ref, key, type, value);
        };
    }

    /// create token commons
    inline fun token_create_common<Type>(constructor_ref: &object::ConstructorRef) {
        // Create token refs
        token_components::create_refs(constructor_ref);
        let obj_signer = object::generate_signer(constructor_ref);
        let mutator_ref = token::generate_mutator_ref(constructor_ref);
        let transfer_ref = object::generate_transfer_ref(constructor_ref);
        // if type is composable
        if (type_info::type_of<Type>() == type_info::type_of<Composable>()) {
            let traits = vector::empty();
            let digital_assets = vector::empty();
            // create the composable resource
            move_to(
                &obj_signer,
                Composable { traits, digital_assets, mutator_ref }
            );
        } else if (type_info::type_of<Type>() == type_info::type_of<Trait>()) {
            let index = 0;
            // create the trait resource
            move_to(
                &obj_signer,
                Trait { parent: option::none(), index, digital_assets: vector::empty(), mutator_ref, transfer_ref }
            );
        } else if (type_info::type_of<Type>() == type_info::type_of<DA>()) {
            let index = 0;
            // create the trait resource
            move_to(
                &obj_signer,
                DA { parent: option::none(), index, transfer_ref }
            );
        } else { abort EUNKNOWN_TOKEN_TYPE };
    }

    /// setup token; internal function used when creating a token

    /// Create a token based on type. Either a trait or a composable;
    /// this will create a token resource, a token object,
    /// and returns the constructor reference of the token.
    public fun create_token<Type: key, NamingStyle: key>(
        signer_ref: &signer,
        collection: Object<Collection>,
        description: String,
        name: String,
        name_with_index_prefix: String,
        name_with_index_suffix: String,
        uri: String,
        royalty_numerator: Option<u64>,
        royalty_denominator: Option<u64>,
        property_keys: vector<String>,
        property_types: vector<String>,
        property_values: vector<vector<u8>>
    ): object::ConstructorRef {
        // TODO: assert Type is either trait or composable.
        let signer_addr = signer::address_of(signer_ref);
        let royalty = create_royalty_internal(royalty_numerator, royalty_denominator, signer_addr);
        let constructor_ref = create_token_internal<Type, NamingStyle>(
            signer_ref,
            collection,
            description,
            name,
            name_with_index_prefix,
            name_with_index_suffix,
            uri,
            royalty,
            property_keys,
            property_types,
            property_values
        );

        // emit event
        if (type_info::type_of<Type>() == type_info::type_of<Composable>()) {
            emit_composable_created_event(object::object_from_constructor_ref(&constructor_ref));
        } else if (type_info::type_of<Type>() == type_info::type_of<Trait>()) {
            emit_trait_created_event(object::object_from_constructor_ref(&constructor_ref));
        } else if (type_info::type_of<Type>() == type_info::type_of<DA>()) {
            emit_da_created_event(object::object_from_constructor_ref(&constructor_ref));
        } else { abort EUNKNOWN_TOKEN_TYPE };

        constructor_ref
    }

    /// Update parent of a token; used when equipping or unequipping a token
    inline fun update_parent<Parent: key, Child: key, Process: key>(
        signer_ref: &signer,
        parent_obj: Object<Parent>,
        child_obj: Object<Child>
    ) acquires Trait {
        let parent_addr = object::object_address(&parent_obj);

        if (type_info::type_of<Process>() == type_info::type_of<Equip>()) {
            if (type_info::type_of<Child>() == type_info::type_of<Trait>()) {
                let child = authorized_trait_mut_borrow(&object::convert<Child, Trait>(child_obj), signer_ref);
                child.parent = option::some(parent_addr);
            } else if (type_info::type_of<Child>() == type_info::type_of<DA>()) {
                let child = authorized_da_mut_borrow(&object::convert<Child, DA>(child_obj), signer_ref);
                child.parent = option::some(parent_addr);
            } else { abort EUNKNOWN_TOKEN_TYPE };
        } else if (type_info::type_of<Process>() == type_info::type_of<Unequip>()) {
            if (type_info::type_of<Child>() == type_info::type_of<Trait>()) {
                let child = authorized_trait_mut_borrow(&object::convert<Child, Trait>(child_obj), signer_ref);
                child.parent = option::none();
            } else if (type_info::type_of<Child>() == type_info::type_of<DA>()) {
                let child = authorized_da_mut_borrow(&object::convert<Child, DA>(child_obj), signer_ref);
                child.parent = option::none();
            } else { abort EUNKNOWN_TOKEN_TYPE };
        } else { abort EUNKNOWN_PROCESS_TYPE };
    }

    /// Compose trait to a composable token
    public fun equip_trait(
        signer_ref: &signer,
        composable_object: Object<Composable>,
        trait_object: Object<Trait>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        // Assert ungated transfer enabled for the object token.
        assert!(object::ungated_transfer_allowed(trait_object), EUNGATED_TRANSFER_DISABLED);
        // Add the object to the end of the vector
        vector::push_back<Object<Trait>>(&mut authorized_composable_mut_borrow(&composable_object, signer_ref).traits, trait_object);
        // Update parent
        update_parent<Composable, Trait, Equip>(signer_ref, composable_object, trait_object);
        // Transfer object as collection owner
        object::transfer_to_object(signer_ref, trait_object, composable_object);
        // Disable ungated transfer for trait object
        freeze_transfer<Trait>(object::convert(trait_object));
        // Update the composable uri
        update_uri(composable_object, new_uri);
        // emit event
        emit_trait_equipped_event(
            composable_object,
            trait_object,
            index<Trait>(trait_object),
            token::uri<Trait>(trait_object)
        );
    }

    /// Compose multiple traits to a composable token
    public fun equip_traits(
        signer_ref: &signer,
        composable_object: Object<Composable>,
        trait_objects: vector<Object<Trait>>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        for (i in 0..vector::length(&trait_objects)) {
            // Assert ungated transfer enabled for the object token.
            let trait_object = *vector::borrow(&trait_objects, i);
            equip_trait(signer_ref, composable_object, trait_object, new_uri);
        };
        // Update the composable uri
        update_uri(composable_object, new_uri);
    }

    /// Composose a digital asset to a composable
    public fun equip_digital_asset(
        signer_ref: &signer,
        composable_object: Object<Composable>,
        da_object: Object<DA>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        // Assert ungated transfer enabled for the object token.
        assert!(object::ungated_transfer_allowed(da_object) == true, EUNGATED_TRANSFER_DISABLED);
        // Add the object to the end of the vector
        vector::push_back<Object<DA>>(&mut authorized_composable_mut_borrow(&composable_object, signer_ref).digital_assets, da_object);
        // Update parent
        update_parent<Composable, DA, Equip>(signer_ref, composable_object, da_object);
        // Transfer
        object::transfer_to_object(signer_ref, da_object, composable_object);
        // Disable ungated transfer for digital asset object
        freeze_transfer<DA>(object::convert(da_object));
        // Update the composable uri
        update_uri<Composable>(composable_object, new_uri);
        // emit event
        emit_digital_asset_equipped_event(
            object::object_address(&composable_object),
            da_object,
            index<DA>(da_object),
            token::uri<DA>(da_object)
        );
    }

    /// Compose a digital asset to a trait
    public fun equip_digital_asset_to_trait(
        signer_ref: &signer,
        trait_object: Object<Trait>,
        da_object: Object<DA>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        // Assert ungated transfer enabled for the object token.
        assert!(object::ungated_transfer_allowed(da_object), EUNGATED_TRANSFER_DISABLED);
        // Add the object to the end of the vector
        vector::push_back<Object<DA>>(&mut authorized_trait_mut_borrow(&trait_object, signer_ref).digital_assets, da_object);
        // Transfer
        object::transfer_to_object(signer_ref, da_object, trait_object);
        // Disable ungated transfer for trait object
        freeze_transfer<DA>(object::convert(trait_object));
        // Update the trait uri
        update_uri<Trait>(trait_object, new_uri);
        // emit event
        emit_digital_asset_equipped_event(
            object::object_address(&trait_object),
            da_object,
            index<DA>(da_object),
            token::uri<DA>(da_object)
        );
    }

    /// Decompose a digital asset from a composable
    public fun unequip_digital_asset_from_composable(
        signer_ref: &signer,
        composable_object: Object<Composable>,
        da_object: Object<DA>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        let (da_exists, index) = vector::index_of(&mut authorized_composable_mut_borrow(&composable_object, signer_ref).digital_assets, &da_object);
        assert!(da_exists == true, EDA_DOES_NOT_EXIST);
        // Enable ungated transfer for digital asset object
        unfreeze_transfer<DA>(object::convert(da_object));
        // Transfer trait object to owner
        object::transfer(signer_ref, da_object, signer::address_of(signer_ref));
        // Remove the object from the vector
        vector::remove(&mut authorized_composable_mut_borrow(&composable_object, signer_ref).digital_assets, index);
        // Update parent
        update_parent<Composable, DA, Unequip>(signer_ref, composable_object, da_object);
        // Update the composable uri
        update_uri<Composable>(composable_object, new_uri);
        // emit event
        emit_digital_asset_unequipped_event(
            object::object_address(&composable_object),
            da_object,
            index,
            token::uri<DA>(da_object)
        );
    }

    /// Decompose a digital asset from a trait
    public fun unequip_digital_asset_from_trait(
        signer_ref: &signer,
        trait_object: Object<Trait>,
        da_object: Object<DA>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        let (da_exists, index) = vector::index_of(&mut authorized_trait_mut_borrow(&trait_object, signer_ref).digital_assets, &da_object);
        assert!(da_exists, EDA_DOES_NOT_EXIST);
        // Enable ungated transfer for trait object
        unfreeze_transfer<DA>(object::convert(trait_object));
        // Transfer digital asset object to owner
        object::transfer(signer_ref, da_object, signer::address_of(signer_ref));
        // Remove the object from the vector
        vector::remove(&mut authorized_trait_mut_borrow(&trait_object, signer_ref).digital_assets, index);
        // Update parent
        update_parent<Trait, DA, Unequip>(signer_ref, trait_object, da_object);
        // Update the trait uri
        update_uri<Trait>(trait_object, new_uri);
        // emit event
        emit_digital_asset_unequipped_event(
            object::object_address(&trait_object),
            da_object,
            index,
            token::uri<DA>(da_object)
        );
    }

    inline fun update_uri<T: key>(
        token_obj: Object<T>,
        new_uri: String
    ) {
        let old_uri = token::uri<T>(token_obj);
        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            let token_res = borrow_global<Composable>(object::object_address(&token_obj));
            token::set_uri(&token_res.mutator_ref, new_uri);
            emit_token_uri_updated_event(
                object::object_address(&token_obj),
                type_info::type_name<Composable>(),
                old_uri,
                new_uri
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            let token_res = borrow_global<Trait>(object::object_address(&token_obj));
            token::set_uri(&token_res.mutator_ref, new_uri);
            emit_token_uri_updated_event(
                object::object_address(&token_obj),
                type_info::type_name<Trait>(),
                old_uri,
                new_uri
            );
        } else { abort EUNKNOWN_TOKEN_TYPE };
    }

    /// equip fa; transfer fa to a token; token can be either composable or trait
    public fun equip_fa_to_token<FA: key, Token: key>(
        signer_ref: &signer,
        fa: Object<FA>,
        token_obj: Object<Token>,
        amount: u64
    ) {
        // assert signer is the owner of the token object
        assert!(object::is_owner<Token>(token_obj, signer::address_of(signer_ref)), ENOT_OWNER);
        let token_obj_addr = object::object_address(&token_obj);
        // assert Token is either composable or trait
        assert!(
            type_info::type_of<Token>() == type_info::type_of<Composable>() || type_info::type_of<Token>() == type_info::type_of<Trait>(),
            EUNKNOWN_TOKEN_TYPE
        );
        // transfer
        primary_fungible_store::transfer(signer_ref, fa, token_obj_addr, amount);
        // emit event
        emit_fa_equipped_event(
            object::address_to_object<Composable>(token_obj_addr),
            signer::address_of(signer_ref),
            amount
        );
    }

    /// unequip fa; transfer fa from a token to the owner
    public fun unequip_fa_from_token<FA: key, Token: key>(
        signer_ref: &signer,
        fa: Object<FA>,
        token_obj: Object<Token>,
        amount: u64
    ) {
        // assert signer is the owner of the token object
        assert!(object::is_owner<Token>(token_obj, signer::address_of(signer_ref)), ENOT_OWNER);
        // assert Token is either composable or trait
        assert!(
            type_info::type_of<Token>() == type_info::type_of<Composable>() || type_info::type_of<Token>() == type_info::type_of<Trait>(),
            EUNKNOWN_TOKEN_TYPE
        );
        // transfer
        primary_fungible_store::transfer(signer_ref, fa, signer::address_of(signer_ref), amount);
        // emit event
        emit_fa_unequipped_event(
            object::address_to_object<Composable>(object::object_address(&token_obj)),
            signer::address_of(signer_ref),
            amount
        );
    }

    /// Decompose a trait from a composable token.
    public fun unequip_trait(
        signer_ref: &signer,
        composable_object: Object<Composable>,
        trait_object: Object<Trait>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        let (trait_exists, index) = vector::index_of(&mut authorized_composable_mut_borrow(&composable_object, signer_ref).traits, &trait_object);
        assert!(trait_exists, ETRAIT_DOES_NOT_EXIST);
        // Enable ungated transfer for trait object
        unfreeze_transfer<Trait>(object::convert(trait_object));
        // Transfer trait object to owner
        object::transfer(signer_ref, trait_object, signer::address_of(signer_ref));
        // Remove the object from the vector
        vector::remove(&mut authorized_composable_mut_borrow(&composable_object, signer_ref).traits, index);
        // Update the composable uri
        update_uri(composable_object, new_uri);
        // emit event
        emit_trait_unequipped_event(
            composable_object,
            trait_object,
            index,
            new_uri
        );
    }

    /// Decompose a list of traits from a composable token.
    public fun unequip_traits(
        signer_ref: &signer,
        composable_object: Object<Composable>,
        trait_objects: vector<Object<Trait>>,
        new_uri: String
    ) acquires Composable, Trait, DA {
        for (i in 0..vector::length(&trait_objects)) {
            let trait_object = *vector::borrow(&trait_objects, i);
            unequip_trait(signer_ref, composable_object, trait_object, new_uri);
        };
        // Update the composable uri
        update_uri(composable_object, new_uri);
    }

    /// transfer digital assets; from user to user.
    public fun transfer_token<Token: key>(
        signer_ref: &signer,
        token: Object<Token>,
        new_owner: address
    ) {
        // assert Token is either composable, trait or FA
        assert!(
            type_info::type_of<Token>() == type_info::type_of<Composable>()
                || type_info::type_of<Token>() == type_info::type_of<Trait>()
                || type_info::type_of<Token>() == type_info::type_of<DA>(),
            EUNKNOWN_TOKEN_TYPE
        );

        // assert new owner is not a token
        assert!(!object::object_exists<token::Token>(new_owner), ENOT_OWNER);

        // transfer
        object::transfer(signer_ref, token, new_owner);
        // emit event
        emit_token_transferred_event(
            object::object_address(&token),
            signer::address_of(signer_ref),
            new_owner
        );
    }

    /// transfer fa from user to user.
    public fun transfer_fa<FA: key>(
        signer_ref: &signer,
        recipient: address,
        fa: Object<FA>,
        amount: u64
    ) {
        assert!(!object::is_object(recipient), ENOT_OWNER);
        primary_fungible_store::transfer<FA>(signer_ref, fa, recipient, amount);
        // emit event
        emit_fa_transferred_event(
            object::object_address(&fa),
            signer::address_of(signer_ref),
            recipient,
            amount
        );
    }

    // ---------
    // Accessors
    // ---------

    /// Helper function to set collection properties
    inline fun set_collection_properties(
        creator: &signer,
        collection: Object<CollectionV2>,
        mutable_description: bool,
        mutable_uri: bool,
        mutable_token_description: bool,
        mutable_token_name: bool,
        mutable_token_properties: bool,
        mutable_token_uri: bool,
        mutable_royalty: bool,
        tokens_burnable_by_collection_owner: bool,
        tokens_freezable_by_collection_owner: bool,
    ) {
        collection_properties::set_mutable_description(creator, collection, mutable_description);
        collection_properties::set_mutable_uri(creator, collection, mutable_uri);
        collection_properties::set_mutable_token_description(creator, collection, mutable_token_description);
        collection_properties::set_mutable_token_name(creator, collection, mutable_token_name);
        collection_properties::set_mutable_token_properties(creator, collection, mutable_token_properties);
        collection_properties::set_mutable_token_uri(creator, collection, mutable_token_uri);
        collection_properties::set_mutable_royalty(creator, collection, mutable_royalty);
        collection_properties::set_tokens_burnable_by_collection_owner(creator, collection, tokens_burnable_by_collection_owner);
        collection_properties::set_tokens_transferable_by_collection_owner(creator, collection, tokens_freezable_by_collection_owner);
    }

    /// Helper function to freeze transfer for a trait or DA token.
    inline fun freeze_transfer_internal<T: key>(token_obj: Object<T>) acquires Trait, DA {
        if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            let trait_res = borrow_global<Trait>(object::object_address(&token_obj));
            object::disable_ungated_transfer(&trait_res.transfer_ref);
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            let da_res = borrow_global<DA>(object::object_address(&token_obj));
            object::disable_ungated_transfer(&da_res.transfer_ref);
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    /// Helper function to unfreeze transfer for a trait or DA token.
    inline fun unfreeze_transfer_internal<T: key>(token_obj: Object<T>) acquires Trait, DA {
        if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            let trait_res = borrow_global<Trait>(object::object_address(&token_obj));
            object::enable_ungated_transfer(&trait_res.transfer_ref);
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            let da_res = borrow_global<DA>(object::object_address(&token_obj));
            object::enable_ungated_transfer(&da_res.transfer_ref);
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    #[view]
    /// Returns the name of the collection
    public fun collection_name(collection_object: Object<Collection>): String acquires Collection {
        let object_address = object::object_address(&collection_object);
        borrow_global<Collection>(object_address).name
    }

    #[view]
    /// Returns the symbol of the collection
    public fun collection_symbol(collection_object: Object<Collection>): String acquires Collection {
        let object_address = object::object_address(&collection_object);
        borrow_global<Collection>(object_address).symbol
    }

    #[view]
    /// Returns the supply type of the collection
    public fun collection_supply_type(collection_object: Object<Collection>): String acquires Collection {
        let object_address = object::object_address(&collection_object);
        borrow_global<Collection>(object_address).supply_type
    }

    #[view]
    /// Returns the description of the collection
    public fun parent_token<T: key>(token: Object<T>): address acquires Trait, DA {
        let obj_addr = object::object_address(&token);
        if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            let parent = borrow_global<Trait>(obj_addr).parent;
            option::extract<address>(&mut parent)
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            let parent = borrow_global<DA>(obj_addr).parent;
            option::extract<address>(&mut parent)
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    #[view]
    /// Returns the index of the token
    public fun index<T: key>(token_obj: Object<T>): u64 acquires Trait, DA {
        let obj_addr = object::object_address(&token_obj);
        if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            borrow_global<Trait>(obj_addr).index
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            borrow_global<DA>(obj_addr).index
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    #[view]
    /// Returns the uri of the token
    public fun traits_from_composable(composable_object: Object<Composable>): vector<Object<Trait>> acquires Composable {
        let object_address = object::object_address(&composable_object);
        borrow_global<Composable>(object_address).traits
    }

    #[view]
    /// Gets an object address and returns the resource name stored within
    public fun object_type(obj_addr: address): String {
        if (exists<Collection>(obj_addr)) {
            string::utf8(b"Collection")
        } else if (exists<Composable>(obj_addr)) {
            string::utf8(b"Composable")
        } else if (exists<Trait>(obj_addr)) {
            string::utf8(b"Trait")
        } else if (exists<DA>(obj_addr)) {
            string::utf8(b"DA")
        } else {
            string::utf8(b"none")
        }
    }

    #[view]
    /// Gets a list of object addresses and returns the resource name stored within
    public fun object_types(obj_addrs: vector<address>): SimpleMap<address, String> {
        let types = vector::empty<String>();
        for (i in 0..vector::length(&obj_addrs)) {
            vector::push_back<String>(&mut types, object_type(*vector::borrow(&obj_addrs, i)));
        };

        simple_map::new_from<address, String>(obj_addrs, types)
    }

    // --------
    // Mutators
    // --------

    /// Asserts the signer is the owner of the token's collection.
    /// Returns the `Composable` reference
    inline fun authorized_composable_borrow(token: &Object<Composable>, owner: &signer): &Composable {
        let token_addr = object::object_address(token);
        assert!(
            exists<Composable>(token_addr),
            error::not_found(ECOMPOSABLE_DOES_NOT_EXIST),
        );

        assert!(
            object::is_owner(token::collection_object(*token), signer::address_of(owner)),
            error::permission_denied(ENOT_COLLECTION_OWNER),
        );
        borrow_global<Composable>(token_addr)
    }

    inline fun authorized_composable_mut_borrow(token: &Object<Composable>, owner: &signer): &mut Composable {
        assert!(object::is_owner<Composable>(*token, signer::address_of(owner)), ENOT_OWNER);
        let token_addr = object::object_address(token);
        assert!(
            exists<Composable>(token_addr),
            error::not_found(ECOMPOSABLE_DOES_NOT_EXIST),
        );

        borrow_global_mut<Composable>(token_addr)
    }

    inline fun authorized_trait_mut_borrow(token: &Object<Trait>, owner: &signer): &mut Trait {
        assert!(object::is_owner<Trait>(*token, signer::address_of(owner)), ENOT_OWNER);
        let token_addr = object::object_address(token);
        assert!(
            exists<Trait>(token_addr),
            error::not_found(ETRAIT_DOES_NOT_EXIST),
        );

        borrow_global_mut<Trait>(token_addr)
    }

    inline fun authorized_da_mut_borrow(token: &Object<DA>, owner: &signer): &mut DA {
        assert!(object::is_owner<DA>(*token, signer::address_of(owner)), ENOT_OWNER);
        let token_addr = object::object_address(token);
        assert!(
            exists<DA>(token_addr),
            error::not_found(EDA_DOES_NOT_EXIST),
        );

        borrow_global_mut<DA>(token_addr)
    }

    // owner burns token based on type
    public fun burn_token<Type: key>(owner: &signer, token: Object<Type>) acquires Composable, Trait, DA {
        // TODO: assert is a composable, trait or DA
        let token_addr = object::object_address(&token);
        let token_object = object::convert(token);

        if (type_info::type_of<Type>() == type_info::type_of<Composable>()) {
            let composable = object::convert<Type, Composable>(token);
            let _composable = authorized_composable_borrow(&composable, owner);
            assert!(
                exists<Composable>(token_addr),
                error::not_found(ECOMPOSABLE_DOES_NOT_EXIST),
            );
            let Composable { traits: _, digital_assets: _, mutator_ref: _ } = move_from<Composable>(token_addr);
            emit_token_burned_event(token_addr, type_info::type_name<Composable>());
        } else if (type_info::type_of<Type>() == type_info::type_of<Trait>()) {
            assert!(
                exists<Trait>(token_addr),
                error::not_found(ETRAIT_DOES_NOT_EXIST),
            );
            let Trait { parent: _, index: _, digital_assets: _, mutator_ref: _, transfer_ref: _ } = move_from<Trait>(token_addr);
            emit_token_burned_event(token_addr, type_info::type_name<Trait>());
        } else if (type_info::type_of<Type>() == type_info::type_of<DA>()) {
            assert!(
                exists<DA>(token_addr),
                error::not_found(EDA_DOES_NOT_EXIST),
            );
            let DA { parent: _, index: _, transfer_ref: _ } = move_from<DA>(token_addr);
            emit_token_burned_event(token_addr, type_info::type_name<DA>());
        } else { abort EUNKNOWN_TOKEN_TYPE };

        // This function checks if the owner owns the token and if the token is burnable.
        token_components::burn(owner, token_object);
    }

    // freeze token based on type
    fun freeze_transfer<T: key>(token: Object<T>) acquires Trait, DA {
        freeze_transfer_internal<T>(token);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_transfer_frozen_event(object::object_address(&token), type_info::type_name<Composable>());
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_transfer_frozen_event(object::object_address(&token), type_info::type_name<Trait>());
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_transfer_frozen_event(object::object_address(&token), type_info::type_name<DA>());
        } else { abort EUNKNOWN_TOKEN_TYPE };

    }

    // unfreeze token based on type
    fun unfreeze_transfer<T: key>(token: Object<T>) acquires Trait, DA {
        unfreeze_transfer_internal<T>(token);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_transfer_unfrozen_event(object::object_address(&token), type_info::type_name<Composable>());
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_transfer_unfrozen_event(object::object_address(&token), type_info::type_name<Trait>());
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_transfer_unfrozen_event(object::object_address(&token), type_info::type_name<DA>());
        } else { abort EUNKNOWN_TOKEN_TYPE };
    }

    // set token description
    public fun set_description<T: key>(
        creator: &signer,
        token: Object<T>,
        description: String,
    ) {
        let old_description = token::description(token);
        token_components::set_description(creator, object::convert(token), description);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_token_description_updated_event(
                object::object_address(&token),
                type_info::type_name<Composable>(),
                old_description,
                description,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_token_description_updated_event(
                object::object_address(&token),
                type_info::type_name<Trait>(),
                old_description,
                description,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_token_description_updated_event(
                object::object_address(&token),
                type_info::type_name<DA>(),
                old_description,
                description,
            );
        } else { abort EUNKNOWN_TOKEN_TYPE };
    }

    // set token name
    public fun set_name<T: key>(
        creator: &signer,
        token: Object<T>,
        name: String,
    ) {
        let old_name = token::name(token);
        token_components::set_name(creator, object::convert(token), name);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_token_name_updated_event(
                object::object_address(&token),
                type_info::type_name<Composable>(),
                old_name,
                name,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_token_name_updated_event(
                object::object_address(&token),
                type_info::type_name<Trait>(),
                old_name,
                name,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_token_name_updated_event(
                object::object_address(&token),
                type_info::type_name<DA>(),
                old_name,
                name,
            );
        } else { abort EUNKNOWN_TOKEN_TYPE };
    }

    /// set token uri
    /// Can be used only on traits that have a mutable uri.
    /// token_components asserts that the signer is the owner of the collection of the token.
    public fun set_trait_uri(
        owner: &signer,
        trait_obj: Object<Trait>,
        uri: String,
    ) {
        // TODO: assert trait does not have DAs inside, otherwise, it is not possible to update the uri.
        // TODO: is this needed
        let old_uri = token::uri(trait_obj);
        token_components::set_uri(owner, object::convert(trait_obj), uri);
        emit_token_uri_updated_event(
            object::object_address<Trait>(&trait_obj),
            type_info::type_name<Trait>(),
            old_uri,
            uri,
        );
    }

    // set token properties
    public fun add_property<T: key>(
        owner: &signer,
        token: Object<T>,
        key: String,
        type: String,
        value: vector<u8>,
    ) {
        token_components::add_property(owner, object::convert(token), key, type, value);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_property_added_event(
                object::object_address(&token),
                type_info::type_name<Composable>(),
                key,
                type,
                value,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_property_added_event(
                object::object_address(&token),
                type_info::type_name<Trait>(),
                key,
                type,
                value,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_property_added_event(
                object::object_address(&token),
                type_info::type_name<DA>(),
                key,
                type,
                value,
            );
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    public fun add_typed_property<T: key, V: drop>(
        owner: &signer,
        token: Object<T>,
        key: String,
        value: V,
    ) {
        token_components::add_typed_property(owner, object::convert(token), key, value);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_typed_property_added_event(
                object::object_address(&token),
                type_info::type_name<Composable>(),
                key,
                type_info::type_name<V>(),
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_typed_property_added_event(
                object::object_address(&token),
                type_info::type_name<Trait>(),
                key,
                type_info::type_name<V>(),
            );
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_typed_property_added_event(
                object::object_address(&token),
                type_info::type_name<DA>(),
                key,
                type_info::type_name<V>(),
            );
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    // remove token properties
    public fun remove_property<T: key>(
        owner: &signer,
        token: Object<T>,
        key: String,
    ) {
        token_components::remove_property(owner, object::convert(token), key);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_property_removed_event(
                object::object_address(&token),
                type_info::type_name<Composable>(),
                key,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_property_removed_event(
                object::object_address(&token),
                type_info::type_name<Trait>(),
                key,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_property_removed_event(
                object::object_address(&token),
                type_info::type_name<DA>(),
                key,
            );
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }

    // update token properties
    public fun update_property<T: key>(
        owner: &signer,
        token: Object<T>,
        key: String,
        value: vector<u8>,
    ) {
        let (_, old_value) = property_map::read(&token, &key);
        token_components::update_typed_property(owner, object::convert(token), key, value);

        if (type_info::type_of<T>() == type_info::type_of<Composable>()) {
            emit_property_updated_event(
                object::object_address(&token),
                type_info::type_name<Composable>(),
                key,
                old_value,
                value,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<Trait>()) {
            emit_property_updated_event(
                object::object_address(&token),
                type_info::type_name<Trait>(),
                key,
                old_value,
                value,
            );
        } else if (type_info::type_of<T>() == type_info::type_of<DA>()) {
            emit_property_updated_event(
                object::object_address(&token),
                type_info::type_name<DA>(),
                key,
                old_value,
                value,
            );
        } else { abort EUNKNOWN_TOKEN_TYPE }
    }
}
