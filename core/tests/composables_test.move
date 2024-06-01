#[test_only]
module composable_token::composable_token_test {

    use aptos_framework::account;
    use aptos_framework::object;
    use aptos_std::debug;
    use aptos_std::simple_map::SimpleMap;
    use aptos_token_objects::collection::{FixedSupply, UnlimitedSupply};
    use aptos_token_objects::token;
    use std::option;
    use std::signer;
    use std::string::{Self, String};

    use composable_token::composable_token::{Self, Collection, Composable, Trait};
    use composable_token::test_utils;

    use minter::migration_helper;

    const COLLECTION_1_NAME: vector<u8> = b"Collection 1";
    const COLLECTION_2_NAME: vector<u8> = b"Collection 2";

    const COMPOSABLE_1_NAME: vector<u8> = b"Composable 1";
    const COMPOSABLE_2_NAME: vector<u8> = b"Composable 2";

    const TRAIT_1_NAME: vector<u8> = b"Trait 1";
    const TRAIT_2_NAME: vector<u8> = b"Trait 2";

    #[test(std = @0x1, creator = @0x123)]
    // create a collection with unlimited supply
    fun create_collection_with_unlimited_supply(std: signer, creator: &signer) {
        test_utils::prepare_for_test(std);
        let collection_constructor_ref = test_utils::create_collection_helper<UnlimitedSupply>(
            creator,
            COLLECTION_1_NAME, 
            option::none()
        );

        let collection_obj = object::object_from_constructor_ref<Collection>(&collection_constructor_ref);
        // TODO: check that the collection is created correctly
        // TODO: check events are emited correctly
    }

    #[test(std = @0x1, creator = @0x123)]
    // create a collection with fixed supply
    fun create_collection_with_fixed_supply(std: signer, creator: &signer) {
        test_utils::prepare_for_test(std);
        let collection_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            creator,
            COLLECTION_1_NAME, 
            option::some(100)
        );

        let collection_obj = object::object_from_constructor_ref<Collection>(&collection_constructor_ref);
        // TODO: check that the collection is created correctly
        // TODO: check events are emited correctly
    }

    #[test(std = @0x1, creator = @0x123)]
    fun create_composable_token(std: signer, creator: &signer) {
        test_utils::prepare_for_test(std);
        let collection_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            creator,
            COLLECTION_1_NAME, 
            option::some(100)
        );
        let collection_obj = object::object_from_constructor_ref<Collection>(&collection_constructor_ref);
        
        let composable_constructor_ref = test_utils::create_named_composable_token_helper(
            creator,
            collection_obj,
            COMPOSABLE_1_NAME
        );

        // let composable_obj = object::object_from_constructor_ref<Composable>(&composable_constructor_ref);
        // TODO: check that the composable is created correctly
        // TODO: check events are emited correctly
    }

    #[test(std = @0x1, creator = @0x123)]
    fun create_trait_token(std: signer, creator: &signer) {
        test_utils::prepare_for_test(std);
        let collection_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            creator,
            COLLECTION_1_NAME, 
            option::some(100)
        );
        let collection_obj = object::object_from_constructor_ref<Collection>(&collection_constructor_ref);
        
        let trait_constructor_ref = test_utils::create_named_trait_token_helper(
            creator,
            collection_obj,
            TRAIT_1_NAME
        );

        // let trait_obj = object::object_from_constructor_ref<Trait>(&trait_constructor_ref);
        // TODO: check that the trait is created correctly
        // TODO: check events are emited correctly
    }

    #[test(std = @0x1, creator = @0x123)]
    fun equip_unequip_trait(std: signer, creator: &signer) {
        test_utils::prepare_for_test(std);

        let collection_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            creator,
            COLLECTION_1_NAME, 
            option::some(100)
        );
        let collection_obj = object::object_from_constructor_ref<Collection>(&collection_constructor_ref);
        
        let composable_constructor_ref = test_utils::create_named_composable_token_helper(
            creator,
            collection_obj,
            COMPOSABLE_1_NAME
        );

        let trait_constructor_ref = test_utils::create_named_trait_token_helper(
            creator,
            collection_obj,
            TRAIT_1_NAME
        );

        let composable_obj = object::object_from_constructor_ref<Composable>(&composable_constructor_ref);
        let trait_obj = object::object_from_constructor_ref<Trait>(&trait_constructor_ref);
        // let collection_obj = object::object_from_constructor_ref<Collection>(&collection_constructor_ref);

        // equip the trait to the composable
        let uri_after_equipping_trait = string::utf8(b"URI after equipping trait");
        composable_token::equip_trait(creator, composable_obj, trait_obj, uri_after_equipping_trait);
        // TODO: check that the trait is equipped correctly
        // TODO: check events are emited correctly

        // unequip the trait from the composable  
        let uri_after_unequipping_trait = string::utf8(b"URI after unequipping trait");  
        composable_token::unequip_trait(creator, composable_obj, trait_obj, uri_after_unequipping_trait);
        // TODO: check that the trait is unequipped correctly
        // TODO: check events are emited correctly
    }

    #[test(std = @0x1, creator = @0x123)]
    // equip trait from collection 1 in a composable from collection 2
    fun equip_trait_from_different_collection(std: signer, creator: &signer) {
        test_utils::prepare_for_test(std);

        let collection_1_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            creator,
            COLLECTION_1_NAME, 
            option::some(100)
        );
        let collection_obj_1 = object::object_from_constructor_ref(&collection_1_constructor_ref);

        let collection_2_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            creator,
            COLLECTION_2_NAME, 
            option::some(100)
        );
        let collection_obj_2 = object::object_from_constructor_ref(&collection_2_constructor_ref);
        
        let composable_constructor_ref = test_utils::create_named_composable_token_helper(
            creator,
            collection_obj_1,
            COMPOSABLE_1_NAME
        );

        let trait_constructor_ref = test_utils::create_named_trait_token_helper(
            creator,
            collection_obj_2,
            TRAIT_1_NAME
        );

        let composable_obj = object::object_from_constructor_ref<Composable>(&composable_constructor_ref);
        let trait_obj = object::object_from_constructor_ref<Trait>(&trait_constructor_ref);

        // debug::print<address>(&object::owner<Collection>(collection_1_obj));
        // debug::print<address>(&object::owner<Composable>(composable_obj));
        // debug::print<address>(&object::owner<Trait>(trait_obj));

        // equip the trait to the composable
        let uri_after_equipping_trait = string::utf8(b"URI after equipping trait");
        composable_token::equip_trait(creator, composable_obj, trait_obj, uri_after_equipping_trait);
        // TODO: check that the trait is equipped correctly
        // TODO: check events are emited correctly
    }

    #[test(std = @0x1, alice = @0x123, bob = @0x456)]
    // test transfer and equip; alice creates a token, transfers it to bob, and alice tries to equip a trait to it
    fun transfer_and_equip(std: signer, alice: &signer, bob: &signer) {
        test_utils::prepare_for_test(std);

        let collection_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            alice,
            COLLECTION_1_NAME, 
            option::some(100)
        );
        let collection_obj = object::object_from_constructor_ref(&collection_constructor_ref);
        debug::print<address>(&object::address_from_constructor_ref(&collection_constructor_ref));
        debug::print<address>(&migration_helper::migration_object_address());
        let composable_constructor_ref = test_utils::create_named_composable_token_helper(
            alice,
            collection_obj,
            COMPOSABLE_1_NAME
        );
        let composable_obj = object::object_from_constructor_ref(&composable_constructor_ref);

        let trait1_constructor_ref = test_utils::create_named_trait_token_helper(
            alice,
            collection_obj,
            TRAIT_1_NAME
        );
        let trait2_constructor_ref = test_utils::create_named_trait_token_helper(
            alice,
            collection_obj,
            TRAIT_2_NAME
        );

        let trait1_obj = object::object_from_constructor_ref(&trait1_constructor_ref);
        let trait2_obj = object::object_from_constructor_ref(&trait2_constructor_ref);

        // get types of the objects
        let composable_addr = object::object_address<Composable>(&composable_obj);
        let trait1_addr = object::object_address<Trait>(&trait1_obj);
        let trait2_addr = object::object_address<Trait>(&trait2_obj);
        // debug::print<SimpleMap<address, String>>(&composable_token::object_types(vector[composable_addr, trait_addr]));
        // transfer trait and composable to bob
        composable_token::transfer_token<Composable>(alice, composable_obj, signer::address_of(bob));
        composable_token::transfer_token<Trait>(alice, trait1_obj, signer::address_of(bob));
        composable_token::transfer_token<Trait>(alice, trait2_obj, signer::address_of(bob));

        // check that transfer is successful
        let bob_address = signer::address_of(bob);
        assert!(object::is_owner<Composable>(composable_obj, bob_address), 1);
        assert!(object::is_owner<Trait>(trait1_obj, bob_address), 1);
        assert!(object::is_owner<Trait>(trait2_obj, bob_address), 1);
        // TODO: check events are emited correctly
        
        // bob equip trait to composable - only bob can do this as he is the owner of both tokens
        let uri_after_equipping_trait = string::utf8(b"URI after equipping the traits");

        // only bob can call equip_traits, as bob is the current owner of both tokens
        // debug::print<address>(&object::owner<Composable>(composable_obj));
        // debug::print<address>(&object::owner<Trait>(trait_obj));
        // debug::print<address>(&object::owner<Collection>(collection_obj));

        composable_token::equip_traits(
            bob, 
            composable_obj, 
            vector[trait1_obj, trait2_obj], 
            uri_after_equipping_trait
        );
        // check that the trait is equipped correctly
        debug::print<object::Object<Trait>>(&trait1_obj);
        debug::print<object::Object<Trait>>(&trait2_obj);
        let traits_in_composable = composable_token::traits_from_composable(composable_obj);
        debug::print<vector<object::Object<Trait>>>(&traits_in_composable);
        // assert uri is updated correctly
        debug::print<String>(&token::uri(composable_obj));

        // unequip traits
        let uri_after_unequipping_trait = string::utf8(b"URI after unequipping the traits");
        composable_token::unequip_traits(
            bob, 
            composable_obj, 
            vector[trait1_obj, trait2_obj], 
            uri_after_unequipping_trait
        );

        // check that the trait is unequipped correctly
        let traits_in_composable = composable_token::traits_from_composable(composable_obj);
        debug::print<vector<object::Object<Trait>>>(&traits_in_composable);
        // assert uri is updated correctly
        debug::print<String>(&token::uri(composable_obj));
    }

    #[test(std = @0x1, alice = @0x123, bob = @0x456)]
    // test create multiple collections under the same creator
    fun create_multiple_collections(std: signer, alice: &signer, bob: &signer) {
        test_utils::prepare_for_test(std);

        let collection_1_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            alice,
            COLLECTION_1_NAME, 
            option::some(100)
        );
        let collection_2_constructor_ref = test_utils::create_collection_helper<FixedSupply>(
            alice,
            COLLECTION_2_NAME, 
            option::some(100)
        );
        
        let collection_obj_1 = object::object_from_constructor_ref<Collection>(&collection_1_constructor_ref);
        let collection_obj_2 = object::object_from_constructor_ref<Collection>(&collection_2_constructor_ref);

        // check that the collections are created correctly
    }
}