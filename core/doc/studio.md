
<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio"></a>

# Module `0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6::studio`



-  [Struct `CollectionCreatedEvent`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_CollectionCreatedEvent)
-  [Struct `TokenCreatedEvent`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_TokenCreatedEvent)
-  [Function `create_collection_with_fixed_supply_and_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_fixed_supply_and_royalty)
-  [Function `create_collection_with_fixed_supply_and_no_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_fixed_supply_and_no_royalty)
-  [Function `create_collection_with_unlimited_supply_and_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_unlimited_supply_and_royalty)
-  [Function `create_collection_with_unlimited_supply_and_no_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_unlimited_supply_and_no_royalty)
-  [Function `create_named_composable_token_with_no_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_composable_token_with_no_royalty)
-  [Function `create_named_composable_token_with_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_composable_token_with_royalty)
-  [Function `create_indexed_composable_token_with_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_composable_token_with_royalty)
-  [Function `create_indexed_composable_token_with_no_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_composable_token_with_no_royalty)
-  [Function `create_named_trait_token_with_no_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_trait_token_with_no_royalty)
-  [Function `create_named_trait_token_with_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_trait_token_with_royalty)
-  [Function `create_indexed_trait_token_with_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_trait_token_with_royalty)
-  [Function `create_indexed_trait_token_with_no_royalty`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_trait_token_with_no_royalty)
-  [Function `burn_token`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_burn_token)
-  [Function `equip_trait`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_equip_trait)
-  [Function `equip_fungible_asset`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_equip_fungible_asset)
-  [Function `unequip_trait`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_unequip_trait)
-  [Function `unequip_fungible_asset`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_unequip_fungible_asset)
-  [Function `decompose_entire_composable_token`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_decompose_entire_composable_token)
-  [Function `transfer_digital_asset`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_transfer_digital_asset)
-  [Function `transfer_fungible_asset`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_transfer_fungible_asset)
-  [Function `set_token_name`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_token_name)
-  [Function `set_token_description`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_token_description)
-  [Function `set_trait_token_uri`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_trait_token_uri)
-  [Function `add_property_to_token`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_add_property_to_token)
-  [Function `add_typed_property_to_token`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_add_typed_property_to_token)
-  [Function `update_property_from_token`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_update_property_from_token)
-  [Function `remove_property_from_token`](#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_remove_property_from_token)


<pre><code><b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x4::collection</a>;
<b>use</b> <a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token">0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6::composable_token</a>;
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_CollectionCreatedEvent"></a>

## Struct `CollectionCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_CollectionCreatedEvent">CollectionCreatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_TokenCreatedEvent"></a>

## Struct `TokenCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_TokenCreatedEvent">TokenCreatedEvent</a>&lt;T&gt; <b>has</b> drop, store
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_fixed_supply_and_royalty"></a>

## Function `create_collection_with_fixed_supply_and_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_fixed_supply_and_royalty">create_collection_with_fixed_supply_and_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, max_supply: u64, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, mutable_token_uri: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool, royalty_numerator: u64, royalty_denominator: u64)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_fixed_supply_and_no_royalty"></a>

## Function `create_collection_with_fixed_supply_and_no_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_fixed_supply_and_no_royalty">create_collection_with_fixed_supply_and_no_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, max_supply: u64, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_unlimited_supply_and_royalty"></a>

## Function `create_collection_with_unlimited_supply_and_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_unlimited_supply_and_royalty">create_collection_with_unlimited_supply_and_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool, royalty_numerator: u64, royalty_denominator: u64)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_unlimited_supply_and_no_royalty"></a>

## Function `create_collection_with_unlimited_supply_and_no_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_collection_with_unlimited_supply_and_no_royalty">create_collection_with_unlimited_supply_and_no_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_composable_token_with_no_royalty"></a>

## Function `create_named_composable_token_with_no_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_composable_token_with_no_royalty">create_named_composable_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_composable_token_with_royalty"></a>

## Function `create_named_composable_token_with_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_composable_token_with_royalty">create_named_composable_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_composable_token_with_royalty"></a>

## Function `create_indexed_composable_token_with_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_composable_token_with_royalty">create_indexed_composable_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_composable_token_with_no_royalty"></a>

## Function `create_indexed_composable_token_with_no_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_composable_token_with_no_royalty">create_indexed_composable_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_trait_token_with_no_royalty"></a>

## Function `create_named_trait_token_with_no_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_trait_token_with_no_royalty">create_named_trait_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_trait_token_with_royalty"></a>

## Function `create_named_trait_token_with_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_named_trait_token_with_royalty">create_named_trait_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_trait_token_with_royalty"></a>

## Function `create_indexed_trait_token_with_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_trait_token_with_royalty">create_indexed_trait_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_trait_token_with_no_royalty"></a>

## Function `create_indexed_trait_token_with_no_royalty`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_create_indexed_trait_token_with_no_royalty">create_indexed_trait_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_burn_token"></a>

## Function `burn_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_burn_token">burn_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_equip_trait"></a>

## Function `equip_trait`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_equip_trait">equip_trait</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Composable">composable_token::Composable</a>&gt;, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_equip_fungible_asset"></a>

## Function `equip_fungible_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_equip_fungible_asset">equip_fungible_asset</a>&lt;FA: key, TokenType: key&gt;(signer_ref: &<a href="">signer</a>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, token_obj: <a href="_Object">object::Object</a>&lt;TokenType&gt;, amount: u64)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_unequip_trait"></a>

## Function `unequip_trait`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_unequip_trait">unequip_trait</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Composable">composable_token::Composable</a>&gt;, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_unequip_fungible_asset"></a>

## Function `unequip_fungible_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_unequip_fungible_asset">unequip_fungible_asset</a>&lt;FA: key, TokenType: key&gt;(signer_ref: &<a href="">signer</a>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, token_obj: <a href="_Object">object::Object</a>&lt;TokenType&gt;, amount: u64)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_decompose_entire_composable_token"></a>

## Function `decompose_entire_composable_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_decompose_entire_composable_token">decompose_entire_composable_token</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Composable">composable_token::Composable</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_transfer_digital_asset"></a>

## Function `transfer_digital_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_transfer_digital_asset">transfer_digital_asset</a>&lt;T: key&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, new_owner_address: <b>address</b>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_transfer_fungible_asset"></a>

## Function `transfer_fungible_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_transfer_fungible_asset">transfer_fungible_asset</a>&lt;FA: key&gt;(signer_ref: &<a href="">signer</a>, recipient: <b>address</b>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, amount: u64)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_token_name"></a>

## Function `set_token_name`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_token_name">set_token_name</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, new_name: <a href="_String">string::String</a>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_token_description"></a>

## Function `set_token_description`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_token_description">set_token_description</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, new_description: <a href="_String">string::String</a>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_trait_token_uri"></a>

## Function `set_trait_token_uri`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_set_trait_token_uri">set_trait_token_uri</a>(signer_ref: &<a href="">signer</a>, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_add_property_to_token"></a>

## Function `add_property_to_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_add_property_to_token">add_property_to_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, type: <a href="_String">string::String</a>, value: <a href="">vector</a>&lt;u8&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_add_typed_property_to_token"></a>

## Function `add_typed_property_to_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_add_typed_property_to_token">add_typed_property_to_token</a>&lt;T: key, V: drop&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, value: V)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_update_property_from_token"></a>

## Function `update_property_from_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_update_property_from_token">update_property_from_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, value: <a href="">vector</a>&lt;u8&gt;)
</code></pre>



<a id="0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_remove_property_from_token"></a>

## Function `remove_property_from_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="studio.md#0x69ef0832ab2fba22869ad8c174f5a8872d3d2f16b941bf7a36916c00f7f8c6c6_studio_remove_property_from_token">remove_property_from_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>)
</code></pre>
