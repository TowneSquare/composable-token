
<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry"></a>

# Module `0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e::composable_token_entry`



-  [Struct `CollectionCreatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_CollectionCreatedEvent)
-  [Struct `TokenCreatedEvent`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_TokenCreatedEvent)
-  [Constants](#@Constants_0)
-  [Function `create_collection_with_fixed_supply_and_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_fixed_supply_and_royalty)
-  [Function `create_collection_with_fixed_supply_and_no_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_fixed_supply_and_no_royalty)
-  [Function `create_collection_with_unlimited_supply_and_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_unlimited_supply_and_royalty)
-  [Function `create_collection_with_unlimited_supply_and_no_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_unlimited_supply_and_no_royalty)
-  [Function `create_named_composable_token_with_no_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_composable_token_with_no_royalty)
-  [Function `create_named_composable_token_with_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_composable_token_with_royalty)
-  [Function `create_indexed_composable_token_with_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_composable_token_with_royalty)
-  [Function `create_indexed_composable_token_with_no_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_composable_token_with_no_royalty)
-  [Function `create_named_trait_token_with_no_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_trait_token_with_no_royalty)
-  [Function `create_named_trait_token_with_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_trait_token_with_royalty)
-  [Function `create_indexed_trait_token_with_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_trait_token_with_royalty)
-  [Function `create_indexed_trait_token_with_no_royalty`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_trait_token_with_no_royalty)
-  [Function `burn_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_burn_token)
-  [Function `equip_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_trait)
-  [Function `equip_traits`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_traits)
-  [Function `equip_fungible_asset`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_fungible_asset)
-  [Function `unequip_trait`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_trait)
-  [Function `unequip_traits`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_traits)
-  [Function `unequip_fungible_asset`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_fungible_asset)
-  [Function `decompose_entire_composable_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_decompose_entire_composable_token)
-  [Function `replace_traits_of_composable`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_replace_traits_of_composable)
-  [Function `transfer_digital_asset`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_transfer_digital_asset)
-  [Function `transfer_fungible_asset`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_transfer_fungible_asset)
-  [Function `set_token_name`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_token_name)
-  [Function `set_token_description`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_token_description)
-  [Function `set_trait_token_uri`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_trait_token_uri)
-  [Function `add_property_to_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_add_property_to_token)
-  [Function `add_typed_property_to_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_add_typed_property_to_token)
-  [Function `update_property_from_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_update_property_from_token)
-  [Function `remove_property_from_token`](#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_remove_property_from_token)


<pre><code><b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x4::collection</a>;
<b>use</b> <a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token">0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e::composable_token</a>;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_CollectionCreatedEvent"></a>

## Struct `CollectionCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_CollectionCreatedEvent">CollectionCreatedEvent</a> <b>has</b> drop, store
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_TokenCreatedEvent"></a>

## Struct `TokenCreatedEvent`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_TokenCreatedEvent">TokenCreatedEvent</a>&lt;T&gt; <b>has</b> drop, store
</code></pre>



<a id="@Constants_0"></a>

## Constants


<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_ENOT_OWNER"></a>

The signer is not the owner of the object


<pre><code><b>const</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_ENOT_OWNER">ENOT_OWNER</a>: u64 = 1;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_ETOKEN_NOT_EQUIPPED"></a>

The token is not equipped


<pre><code><b>const</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_ETOKEN_NOT_EQUIPPED">ETOKEN_NOT_EQUIPPED</a>: u64 = 2;
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_fixed_supply_and_royalty"></a>

## Function `create_collection_with_fixed_supply_and_royalty`

Create a new collection with fixed supply and royalty on


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_fixed_supply_and_royalty">create_collection_with_fixed_supply_and_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, max_supply: u64, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, mutable_token_uri: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool, royalty_numerator: u64, royalty_denominator: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_fixed_supply_and_no_royalty"></a>

## Function `create_collection_with_fixed_supply_and_no_royalty`

Create a new collection with fixed supply and royalty off.
token uri mutibility is enforced to be true to allow composibility


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_fixed_supply_and_no_royalty">create_collection_with_fixed_supply_and_no_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, max_supply: u64, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_unlimited_supply_and_royalty"></a>

## Function `create_collection_with_unlimited_supply_and_royalty`

Create a new collection with unlimited supply and royalty on.
token uri mutibility is enforced to be true to allow composibility


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_unlimited_supply_and_royalty">create_collection_with_unlimited_supply_and_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool, royalty_numerator: u64, royalty_denominator: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_unlimited_supply_and_no_royalty"></a>

## Function `create_collection_with_unlimited_supply_and_no_royalty`

Create a new collection with unlimited supply and royalty off.
token uri mutibility is enforced to be true to allow composibility


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_collection_with_unlimited_supply_and_no_royalty">create_collection_with_unlimited_supply_and_no_royalty</a>(signer_ref: &<a href="">signer</a>, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, mutable_description: bool, mutable_royalty: bool, mutable_uri: bool, mutable_token_description: bool, mutable_token_name: bool, mutable_token_properties: bool, tokens_burnable_by_creator: bool, tokens_freezable_by_creator: bool)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_composable_token_with_no_royalty"></a>

## Function `create_named_composable_token_with_no_royalty`

Create a named composable token with no royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_composable_token_with_no_royalty">create_named_composable_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_composable_token_with_royalty"></a>

## Function `create_named_composable_token_with_royalty`

Create a named composable token with royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_composable_token_with_royalty">create_named_composable_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_composable_token_with_royalty"></a>

## Function `create_indexed_composable_token_with_royalty`

Create an indexed composable token with royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_composable_token_with_royalty">create_indexed_composable_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_composable_token_with_no_royalty"></a>

## Function `create_indexed_composable_token_with_no_royalty`

Create an indexed composable token without royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_composable_token_with_no_royalty">create_indexed_composable_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_trait_token_with_no_royalty"></a>

## Function `create_named_trait_token_with_no_royalty`

Create a named trait token with no royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_trait_token_with_no_royalty">create_named_trait_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_trait_token_with_royalty"></a>

## Function `create_named_trait_token_with_royalty`

Create a named trait token with royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_named_trait_token_with_royalty">create_named_trait_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, name: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_trait_token_with_royalty"></a>

## Function `create_indexed_trait_token_with_royalty`

Create an indexed trait token with royalty


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_trait_token_with_royalty">create_indexed_trait_token_with_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: u64, royalty_denominator: u64, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_trait_token_with_no_royalty"></a>

## Function `create_indexed_trait_token_with_no_royalty`

Create an indexed trait token with royalty off


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_create_indexed_trait_token_with_no_royalty">create_indexed_trait_token_with_no_royalty</a>(signer_ref: &<a href="">signer</a>, <a href="">collection</a>: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Collection">composable_token::Collection</a>&gt;, description: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_burn_token"></a>

## Function `burn_token`

Burn a token


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_burn_token">burn_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_trait"></a>

## Function `equip_trait`

Equip trait to a composable


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_trait">equip_trait</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_traits"></a>

## Function `equip_traits`

Equip a list of traits to a composable


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_traits">equip_traits</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, traits: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_fungible_asset"></a>

## Function `equip_fungible_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_equip_fungible_asset">equip_fungible_asset</a>&lt;FA: key, TokenType: key&gt;(signer_ref: &<a href="">signer</a>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, token_obj: <a href="_Object">object::Object</a>&lt;TokenType&gt;, amount: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_trait"></a>

## Function `unequip_trait`



<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_trait">unequip_trait</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_traits"></a>

## Function `unequip_traits`

Unequip a list of traits from a composable


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_traits">unequip_traits</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, traits: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_fungible_asset"></a>

## Function `unequip_fungible_asset`



<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_unequip_fungible_asset">unequip_fungible_asset</a>&lt;FA: key, TokenType: key&gt;(signer_ref: &<a href="">signer</a>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, token_obj: <a href="_Object">object::Object</a>&lt;TokenType&gt;, amount: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_decompose_entire_composable_token"></a>

## Function `decompose_entire_composable_token`

Decompose an entire composable token


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_decompose_entire_composable_token">decompose_entire_composable_token</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_replace_traits_of_composable"></a>

## Function `replace_traits_of_composable`

Replace traits of a composable token
This function will replace the selected traits from the composable token with the input traits.


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_replace_traits_of_composable">replace_traits_of_composable</a>(owner: &<a href="">signer</a>, composable_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Composable">composable_token::Composable</a>&gt;, traits_to_remove: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;, traits_to_add: <a href="">vector</a>&lt;<a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_transfer_digital_asset"></a>

## Function `transfer_digital_asset`

Directly transfer a token to a user.


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_transfer_digital_asset">transfer_digital_asset</a>&lt;T: key&gt;(owner: &<a href="">signer</a>, <a href="">token</a>: <a href="_Object">object::Object</a>&lt;T&gt;, new_owner_address: <b>address</b>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_transfer_fungible_asset"></a>

## Function `transfer_fungible_asset`

Directly transfer a token to a user.


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_transfer_fungible_asset">transfer_fungible_asset</a>&lt;FA: key&gt;(signer_ref: &<a href="">signer</a>, recipient: <b>address</b>, fa: <a href="_Object">object::Object</a>&lt;FA&gt;, amount: u64)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_token_name"></a>

## Function `set_token_name`

set token name


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_token_name">set_token_name</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, new_name: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_token_description"></a>

## Function `set_token_description`

set token description


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_token_description">set_token_description</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, new_description: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_trait_token_uri"></a>

## Function `set_trait_token_uri`

set trait token uri


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_set_trait_token_uri">set_trait_token_uri</a>(signer_ref: &<a href="">signer</a>, trait_obj: <a href="_Object">object::Object</a>&lt;<a href="composable_token.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_Trait">composable_token::Trait</a>&gt;, new_uri: <a href="_String">string::String</a>)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_add_property_to_token"></a>

## Function `add_property_to_token`

add a property to a token


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_add_property_to_token">add_property_to_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, type: <a href="_String">string::String</a>, value: <a href="">vector</a>&lt;u8&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_add_typed_property_to_token"></a>

## Function `add_typed_property_to_token`

add a typed property to a token


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_add_typed_property_to_token">add_typed_property_to_token</a>&lt;T: key, V: drop&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, value: V)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_update_property_from_token"></a>

## Function `update_property_from_token`

update a property from a token


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_update_property_from_token">update_property_from_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>, value: <a href="">vector</a>&lt;u8&gt;)
</code></pre>



<a id="0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_remove_property_from_token"></a>

## Function `remove_property_from_token`

remove a property from a token


<pre><code><b>public</b> entry <b>fun</b> <a href="composable_token_entry.md#0x5fe4421182921f3f4c847bb30127e25138ef463455c5981e7726fa08ce42855e_composable_token_entry_remove_property_from_token">remove_property_from_token</a>&lt;T: key&gt;(signer_ref: &<a href="">signer</a>, token_obj: <a href="_Object">object::Object</a>&lt;T&gt;, key: <a href="_String">string::String</a>)
</code></pre>
