
<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token"></a>

# Module `0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e::composable_token`



-  [Resource `Collection`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection)
-  [Resource `Composable`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable)
-  [Resource `Trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait)
-  [Resource `DA`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA)
-  [Resource `Indexed`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Indexed)
-  [Resource `Named`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Named)
-  [Resource `Equip`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Equip)
-  [Resource `Unequip`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Unequip)
-  [Struct `CollectionMetadata`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_CollectionMetadata)
-  [Struct `CollectionCreatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_CollectionCreatedEvent)
-  [Struct `TokenBurnedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenBurnedEvent)
-  [Struct `TokenDescriptionUpdatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenDescriptionUpdatedEvent)
-  [Struct `TokenNameUpdatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenNameUpdatedEvent)
-  [Struct `TokenUriUpdatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenUriUpdatedEvent)
-  [Struct `PropertyAddedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyAddedEvent)
-  [Struct `TypedPropertyAddedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TypedPropertyAddedEvent)
-  [Struct `PropertyRemovedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyRemovedEvent)
-  [Struct `PropertyUpdatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyUpdatedEvent)
-  [Struct `ComposableMetadata`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ComposableMetadata)
-  [Struct `ComposableCreatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ComposableCreatedEvent)
-  [Struct `TraitMetadata`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitMetadata)
-  [Struct `TraitCreatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitCreatedEvent)
-  [Struct `DAMetadata`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DAMetadata)
-  [Struct `DACreatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DACreatedEvent)
-  [Struct `TraitEquippedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitEquippedEvent)
-  [Struct `TraitUnequippedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitUnequippedEvent)
-  [Struct `TokenMetadata`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenMetadata)
-  [Struct `DigitalAssetEquippedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DigitalAssetEquippedEvent)
-  [Struct `DigitalAssetUnequippedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DigitalAssetUnequippedEvent)
-  [Struct `FAEquippedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FAEquippedEvent)
-  [Struct `FAUnequippedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FAUnequippedEvent)
-  [Struct `TokenTransferredEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenTransferredEvent)
-  [Struct `FATransferredEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FATransferredEvent)
-  [Struct `TransferFrozenEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TransferFrozenEvent)
-  [Struct `TransferUnfrozenEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TransferUnfrozenEvent)
-  [Struct `MigatedToComposableEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_MigatedToComposableEvent)
-  [Constants](#@Constants_0)
-  [Function `create_collection`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_create_collection)
-  [Function `create_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_create_token)
-  [Function `equip_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_trait)
-  [Function `equip_soulbound_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_soulbound_trait)
-  [Function `equip_traits`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_traits)
-  [Function `equip_soulbound_traits`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_soulbound_traits)
-  [Function `equip_digital_asset`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_digital_asset)
-  [Function `equip_digital_asset_to_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_digital_asset_to_trait)
-  [Function `unequip_digital_asset_from_composable`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_digital_asset_from_composable)
-  [Function `unequip_digital_asset_from_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_digital_asset_from_trait)
-  [Function `equip_fa_to_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_fa_to_token)
-  [Function `unequip_fa_from_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_fa_from_token)
-  [Function `unequip_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_trait)
-  [Function `unequip_traits`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_traits)
-  [Function `transfer_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_transfer_token)
-  [Function `transfer_fa`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_transfer_fa)
-  [Function `collection_name`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_name)
-  [Function `collection_symbol`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_symbol)
-  [Function `collection_supply_type`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_supply_type)
-  [Function `parent_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parent_token)
-  [Function `parents`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parents)
-  [Function `parents_by_address`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parents_by_address)
-  [Function `index`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_index)
-  [Function `traits_from_composable`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_traits_from_composable)
-  [Function `object_type`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_object_type)
-  [Function `object_types`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_object_types)
-  [Function `burn_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_burn_token)
-  [Function `set_description`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_description)
-  [Function `set_name`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_name)
-  [Function `set_trait_uri`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_trait_uri)
-  [Function `add_property`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_add_property)
-  [Function `add_typed_property`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_add_typed_property)
-  [Function `remove_property`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_remove_property)
-  [Function `update_property`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_update_property)
-  [Function `wrap_token_in_composable`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_wrap_token_in_composable)


<pre><code><b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::primary_fungible_store</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::simple_map</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::type_info</a>;
<b>use</b> <a href="">0x1::vector</a>;
<b>use</b> <a href="">0x4::collection</a>;
<b>use</b> <a href="">0x4::property_map</a>;
<b>use</b> <a href="">0x4::royalty</a>;
<b>use</b> <a href="">0x4::token</a>;
<b>use</b> <a href="">0xa89295004505a2394a3ed756dec801f7579c3484c499973a4b28eb071419abd6::collection_components</a>;
<b>use</b> <a href="">0xa89295004505a2394a3ed756dec801f7579c3484c499973a4b28eb071419abd6::collection_properties</a>;
<b>use</b> <a href="">0xa89295004505a2394a3ed756dec801f7579c3484c499973a4b28eb071419abd6::token_components</a>;
<b>use</b> <a href="">0xa89295004505a2394a3ed756dec801f7579c3484c499973a4b28eb071419abd6::transfer_token</a>;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection"></a>

## Resource `Collection`

Storage state for collections


<pre><code>#[resource_group_member(#[group = <a href="_ObjectGroup">0x1::object::ObjectGroup</a>])]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">Collection</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable"></a>

## Resource `Composable`

Storage state for composable_token; aka, the atom/primary of the token


<pre><code>#[resource_group_member(#[group = <a href="_ObjectGroup">0x1::object::ObjectGroup</a>])]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">Composable</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait"></a>

## Resource `Trait`

Storage state for traits


<pre><code>#[resource_group_member(#[group = <a href="_ObjectGroup">0x1::object::ObjectGroup</a>])]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">Trait</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA"></a>

## Resource `DA`

Storage state for digital assets


<pre><code>#[resource_group_member(#[group = <a href="_ObjectGroup">0x1::object::ObjectGroup</a>])]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA">DA</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Indexed"></a>

## Resource `Indexed`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Indexed">Indexed</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Named"></a>

## Resource `Named`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Named">Named</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Equip"></a>

## Resource `Equip`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Equip">Equip</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Unequip"></a>

## Resource `Unequip`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Unequip">Unequip</a> <b>has</b> key
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_CollectionMetadata"></a>

## Struct `CollectionMetadata`

Collection related


<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_CollectionMetadata">CollectionMetadata</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_CollectionCreatedEvent"></a>

## Struct `CollectionCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_CollectionCreatedEvent">CollectionCreatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenBurnedEvent"></a>

## Struct `TokenBurnedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenBurnedEvent">TokenBurnedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenDescriptionUpdatedEvent"></a>

## Struct `TokenDescriptionUpdatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenDescriptionUpdatedEvent">TokenDescriptionUpdatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenNameUpdatedEvent"></a>

## Struct `TokenNameUpdatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenNameUpdatedEvent">TokenNameUpdatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenUriUpdatedEvent"></a>

## Struct `TokenUriUpdatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenUriUpdatedEvent">TokenUriUpdatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyAddedEvent"></a>

## Struct `PropertyAddedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyAddedEvent">PropertyAddedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TypedPropertyAddedEvent"></a>

## Struct `TypedPropertyAddedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TypedPropertyAddedEvent">TypedPropertyAddedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyRemovedEvent"></a>

## Struct `PropertyRemovedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyRemovedEvent">PropertyRemovedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyUpdatedEvent"></a>

## Struct `PropertyUpdatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_PropertyUpdatedEvent">PropertyUpdatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ComposableMetadata"></a>

## Struct `ComposableMetadata`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ComposableMetadata">ComposableMetadata</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ComposableCreatedEvent"></a>

## Struct `ComposableCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ComposableCreatedEvent">ComposableCreatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitMetadata"></a>

## Struct `TraitMetadata`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitMetadata">TraitMetadata</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitCreatedEvent"></a>

## Struct `TraitCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitCreatedEvent">TraitCreatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DAMetadata"></a>

## Struct `DAMetadata`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DAMetadata">DAMetadata</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DACreatedEvent"></a>

## Struct `DACreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DACreatedEvent">DACreatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitEquippedEvent"></a>

## Struct `TraitEquippedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitEquippedEvent">TraitEquippedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitUnequippedEvent"></a>

## Struct `TraitUnequippedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TraitUnequippedEvent">TraitUnequippedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenMetadata"></a>

## Struct `TokenMetadata`



<pre><code><b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenMetadata">TokenMetadata</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DigitalAssetEquippedEvent"></a>

## Struct `DigitalAssetEquippedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DigitalAssetEquippedEvent">DigitalAssetEquippedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DigitalAssetUnequippedEvent"></a>

## Struct `DigitalAssetUnequippedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DigitalAssetUnequippedEvent">DigitalAssetUnequippedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FAEquippedEvent"></a>

## Struct `FAEquippedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FAEquippedEvent">FAEquippedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FAUnequippedEvent"></a>

## Struct `FAUnequippedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FAUnequippedEvent">FAUnequippedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenTransferredEvent"></a>

## Struct `TokenTransferredEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TokenTransferredEvent">TokenTransferredEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FATransferredEvent"></a>

## Struct `FATransferredEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_FATransferredEvent">FATransferredEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TransferFrozenEvent"></a>

## Struct `TransferFrozenEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TransferFrozenEvent">TransferFrozenEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TransferUnfrozenEvent"></a>

## Struct `TransferUnfrozenEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_TransferUnfrozenEvent">TransferUnfrozenEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_MigatedToComposableEvent"></a>

## Struct `MigatedToComposableEvent`

Emitted when a digital asset is migrated to a composable token.


<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_MigatedToComposableEvent">MigatedToComposableEvent</a> <b>has</b> drop, store
</code></pre>



<a id="@Constants_0"></a>

## Constants


<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ENOT_OWNER"></a>

The signer is not the owner of the token.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ENOT_OWNER">ENOT_OWNER</a>: u64 = 10;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ECOLLECTION_DOES_NOT_EXIST"></a>

The collection does not exist.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ECOLLECTION_DOES_NOT_EXIST">ECOLLECTION_DOES_NOT_EXIST</a>: u64 = 3;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EFIELD_NOT_MUTABLE"></a>

The field is not mutable.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EFIELD_NOT_MUTABLE">EFIELD_NOT_MUTABLE</a>: u64 = 7;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EPROPERTIES_NOT_MUTABLE"></a>

The properties are not mutable.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EPROPERTIES_NOT_MUTABLE">EPROPERTIES_NOT_MUTABLE</a>: u64 = 8;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ECOMPOSABLE_DOES_NOT_EXIST"></a>

The composable token does not exist.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ECOMPOSABLE_DOES_NOT_EXIST">ECOMPOSABLE_DOES_NOT_EXIST</a>: u64 = 4;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EDA_DOES_NOT_EXIST"></a>

The digital asset does not exist.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EDA_DOES_NOT_EXIST">EDA_DOES_NOT_EXIST</a>: u64 = 12;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ENOT_COLLECTION_OWNER"></a>

The signer is not the collection owner


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ENOT_COLLECTION_OWNER">ENOT_COLLECTION_OWNER</a>: u64 = 6;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EREFS_DOES_NOT_EXIST"></a>

The references does not exist.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EREFS_DOES_NOT_EXIST">EREFS_DOES_NOT_EXIST</a>: u64 = 11;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ETOKEN_HAS_RESOURCE"></a>

The token already has Composable, Trait, or DA resource.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ETOKEN_HAS_RESOURCE">ETOKEN_HAS_RESOURCE</a>: u64 = 14;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ETRAIT_DOES_NOT_EXIST"></a>

The trait token does not exist.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_ETRAIT_DOES_NOT_EXIST">ETRAIT_DOES_NOT_EXIST</a>: u64 = 5;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNGATED_TRANSFER_DISABLED"></a>

The ungated transfer is disabled.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNGATED_TRANSFER_DISABLED">EUNGATED_TRANSFER_DISABLED</a>: u64 = 9;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_COLLECTION_TYPE"></a>

The collection type is not recognised.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_COLLECTION_TYPE">EUNKNOWN_COLLECTION_TYPE</a>: u64 = 0;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_NAMING_TYPE"></a>

The naming style is not recognised.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_NAMING_TYPE">EUNKNOWN_NAMING_TYPE</a>: u64 = 2;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_PROCESS_TYPE"></a>

The process type is not recognised.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_PROCESS_TYPE">EUNKNOWN_PROCESS_TYPE</a>: u64 = 13;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_TOKEN_TYPE"></a>

The token type is not recognised.


<pre><code><b>const</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_EUNKNOWN_TOKEN_TYPE">EUNKNOWN_TOKEN_TYPE</a>: u64 = 1;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_create_collection"></a>

## Function `create_collection`

Create a collection;
this will create a collection resource, a collection object,
and returns the constructor reference of the collection.


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_create_collection">create_collection</a>&lt;SupplyType: key&gt;(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, max_supply: <a href="_Option">option::Option</a>&lt;u64&gt;, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, mutable_token_uri: bool, tokens_burnable_by_collection_owner: bool, tokens_freezable_by_collection_owner: bool, royalty_numerator: <a href="_Option">option::Option</a>&lt;u64&gt;, royalty_denominator: <a href="_Option">option::Option</a>&lt;u64&gt;): <a href="_ConstructorRef">object::ConstructorRef</a>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_create_token"></a>

## Function `create_token`

setup token; internal function used when creating a token
Create a token based on type. Either a trait or a composable;
this will create a token resource, a token object,
and returns the constructor reference of the token.


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_create_token">create_token</a>&lt;Type: key, NamingStyle: key&gt;(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, name_with_index_prefix: <a href="_String">string::String</a>, name_with_index_suffix: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: <a href="_Option">option::Option</a>&lt;u64&gt;, royalty_denominator: <a href="_Option">option::Option</a>&lt;u64&gt;, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;): <a href="_ConstructorRef">object::ConstructorRef</a>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_trait"></a>

## Function `equip_trait`

Compose trait to a composable token


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_trait">equip_trait</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_soulbound_trait"></a>

## Function `equip_soulbound_trait`

Compose a trait to a composable and make it soulbound


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_soulbound_trait">equip_soulbound_trait</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_constructor_ref: &<a href="_ConstructorRef">object::ConstructorRef</a>, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_traits"></a>

## Function `equip_traits`

Compose multiple traits to a composable token


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_traits">equip_traits</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_objects: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_soulbound_traits"></a>

## Function `equip_soulbound_traits`

Compose multiple traits to a composable token and make them soulbound


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_soulbound_traits">equip_soulbound_traits</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, traits_constructors: <a href="">vector</a>&lt;<a href="_ConstructorRef">object::ConstructorRef</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_digital_asset"></a>

## Function `equip_digital_asset`

Composose a digital asset to a composable


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_digital_asset">equip_digital_asset</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, da_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA">composable_token::DA</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_digital_asset_to_trait"></a>

## Function `equip_digital_asset_to_trait`

Compose a digital asset to a trait


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_digital_asset_to_trait">equip_digital_asset_to_trait</a>(signer_ref: &<a href="">signer</a>, trait_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, da_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA">composable_token::DA</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_digital_asset_from_composable"></a>

## Function `unequip_digital_asset_from_composable`

Decompose a digital asset from a composable


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_digital_asset_from_composable">unequip_digital_asset_from_composable</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, da_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA">composable_token::DA</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_digital_asset_from_trait"></a>

## Function `unequip_digital_asset_from_trait`

Decompose a digital asset from a trait


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_digital_asset_from_trait">unequip_digital_asset_from_trait</a>(signer_ref: &<a href="">signer</a>, trait_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, da_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_DA">composable_token::DA</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_fa_to_token"></a>

## Function `equip_fa_to_token`

equip fa; transfer fa to a token; token can be either composable or trait


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_equip_fa_to_token">equip_fa_to_token</a>&lt;FA: key, Token: key&gt;(signer_ref: &<a href="">signer</a>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, token_obj: <a href="_Object">object::Object</a>&lt;Token&gt;, amount: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_fa_from_token"></a>

## Function `unequip_fa_from_token`

unequip fa; transfer fa from a token to the owner


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_fa_from_token">unequip_fa_from_token</a>&lt;FA: key, Token: key&gt;(signer_ref: &<a href="">signer</a>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, token_obj: <a href="_Object">object::Object</a>&lt;Token&gt;, amount: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_trait"></a>

## Function `unequip_trait`

Decompose a trait from a composable token.


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_trait">unequip_trait</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_traits"></a>

## Function `unequip_traits`

Decompose a list of traits from a composable token.


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_unequip_traits">unequip_traits</a>(signer_ref: &<a href="">signer</a>, composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_objects: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_transfer_token"></a>

## Function `transfer_token`

transfer digital assets; from user to user.


<pre><code><b>public</b> <b>fun</b> <a href="">transfer_token</a>&lt;Token: key&gt;(signer_ref: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;Token&gt;, new_owner: <b>address</b>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_transfer_fa"></a>

## Function `transfer_fa`

transfer fa from user to user.


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_transfer_fa">transfer_fa</a>&lt;FA: key&gt;(signer_ref: &<a href="">signer</a>, recipient: <b>address</b>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, amount: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_name"></a>

## Function `collection_name`

Returns the name of the collection


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_name">collection_name</a>(collection_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;): <a href="_String">string::String</a>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_symbol"></a>

## Function `collection_symbol`

Returns the symbol of the collection


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_symbol">collection_symbol</a>(collection_object: <a href="_Object">object::Object</a>&lt;<a href="_Collection">collection::Collection</a>&gt;): <a href="_String">string::String</a>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_supply_type"></a>

## Function `collection_supply_type`

Returns the supply type of the collection


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_collection_supply_type">collection_supply_type</a>(collection_object: <a href="_Object">object::Object</a>&lt;<a href="_Collection">collection::Collection</a>&gt;): <a href="_String">string::String</a>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parent_token"></a>

## Function `parent_token`

Returns the parent token of the input token


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parent_token">parent_token</a>&lt;T: key&gt;(<a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;): <b>address</b>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parents"></a>

## Function `parents`

Returns a table with input tokens as keys and their parent tokens as values
if the token has no parent, the value will be None
NOTE: Type T must be the same for all tokens in the input vector


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parents">parents</a>&lt;T: key&gt;(tokens: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;T&gt;&gt;): <a href="_SimpleMap">simple_map::SimpleMap</a>&lt;<b>address</b>, <a href="_Option">option::Option</a>&lt;<b>address</b>&gt;&gt;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parents_by_address"></a>

## Function `parents_by_address`

Returns a table with input tokens addresses as keys and their parent tokens as values
if the token has no parent, the value will be None
NOTE: Type T must be the same for all tokens in the input vector


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_parents_by_address">parents_by_address</a>&lt;T: key&gt;(token_addrs: <a href="">vector</a>&lt;<b>address</b>&gt;): <a href="_SimpleMap">simple_map::SimpleMap</a>&lt;<b>address</b>, <a href="_Option">option::Option</a>&lt;<b>address</b>&gt;&gt;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_index"></a>

## Function `index`

Returns the index of the token


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_index">index</a>&lt;T: key&gt;(token_obj: <a href="_Object">object::Object</a>&lt;T&gt;): u64
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_traits_from_composable"></a>

## Function `traits_from_composable`

Returns the children traits from the parent composable


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_traits_from_composable">traits_from_composable</a>(composable_object: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;): <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_object_type"></a>

## Function `object_type`

Gets an object address and returns the resource name stored within


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_object_type">object_type</a>(obj_addr: <b>address</b>): <a href="_String">string::String</a>
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_object_types"></a>

## Function `object_types`

Gets a list of object addresses and returns the resource name stored within


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_object_types">object_types</a>(obj_addrs: <a href="">vector</a>&lt;<b>address</b>&gt;): <a href="_SimpleMap">simple_map::SimpleMap</a>&lt;<b>address</b>, <a href="_String">string::String</a>&gt;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_burn_token"></a>

## Function `burn_token`



<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_burn_token">burn_token</a>&lt;Type: key&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;Type&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_description"></a>

## Function `set_description`



<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_description">set_description</a>&lt;T: key&gt;(creator: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, description: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_name"></a>

## Function `set_name`



<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_name">set_name</a>&lt;T: key&gt;(creator: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, name: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_trait_uri"></a>

## Function `set_trait_uri`

set token uri
Can be used only on traits that have a mutable uri.
token_components asserts that the signer is the owner of the collection of the token.


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_set_trait_uri">set_trait_uri</a>(owner: &<a href="">signer</a>, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_add_property"></a>

## Function `add_property`



<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_add_property">add_property</a>&lt;T: key&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, type: <a href="_String">string::String</a>, value: <a href="">vector</a>&lt;u8&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_add_typed_property"></a>

## Function `add_typed_property`



<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_add_typed_property">add_typed_property</a>&lt;T: key, V: drop&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, value: V)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_remove_property"></a>

## Function `remove_property`



<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_remove_property">remove_property</a>&lt;T: key&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_update_property"></a>

## Function `update_property`

update token properties


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_update_property">update_property</a>&lt;T: key&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, value: <a href="">vector</a>&lt;u8&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_wrap_token_in_composable"></a>

## Function `wrap_token_in_composable`

Add a Composable wrapper to a digital asset
Used to make plain digital assets compatible with the hirearchical structure


<pre><code><b>public</b> <b>fun</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_wrap_token_in_composable">wrap_token_in_composable</a>(<a href="">token</a>: <a href="_Object">object::Object</a>&lt;<a href="_Token">token::Token</a>&gt;, object_signer_ref: &<a href="">signer</a>, mutator_ref: <a href="_MutatorRef">token::MutatorRef</a>)
</code></pre>
