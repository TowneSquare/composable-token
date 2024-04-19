
<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint"></a>

# Module `0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a::batch_mint`



-  [Resource `MintData`](#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_MintData)
-  [Constants](#@Constants_0)
-  [Function `initialize`](#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_initialize)
-  [Function `batch_create_composable_token`](#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_batch_create_composable_token)
-  [Function `batch_create_traits`](#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_batch_create_traits)
-  [Function `mint_token`](#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_mint_token)
-  [Function `base_mint_price`](#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_base_mint_price)


<pre><code><b>use</b> <a href="">0x1::aptos_coin</a>;
<b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::object</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::type_info</a>;
<b>use</b> <a href="">0x4::token</a>;
<b>use</b> <a href="composable_token.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_composable_token">0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a::composable_token</a>;
<b>use</b> <a href="resource_manager.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_resource_manager">0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a::resource_manager</a>;
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_MintData"></a>

## Resource `MintData`



<pre><code><b>struct</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_MintData">MintData</a> <b>has</b> key
</code></pre>



<a id="@Constants_0"></a>

## Constants


<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_ENOT_ADMIN"></a>



<pre><code><b>const</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_ENOT_ADMIN">ENOT_ADMIN</a>: u64 = 0;
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_EINSUFFICIENT_FUNDS"></a>



<pre><code><b>const</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_EINSUFFICIENT_FUNDS">EINSUFFICIENT_FUNDS</a>: u64 = 2;
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_ESHOULD_MINT_AT_LEAST_ONE"></a>



<pre><code><b>const</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_ESHOULD_MINT_AT_LEAST_ONE">ESHOULD_MINT_AT_LEAST_ONE</a>: u64 = 3;
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_ETYPE_NOT_RECOGNIZED"></a>



<pre><code><b>const</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_ETYPE_NOT_RECOGNIZED">ETYPE_NOT_RECOGNIZED</a>: u64 = 1;
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_initialize"></a>

## Function `initialize`



<pre><code><b>public</b> entry <b>fun</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_initialize">initialize</a>(signer_ref: &<a href="">signer</a>)
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_batch_create_composable_token"></a>

## Function `batch_create_composable_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_batch_create_composable_token">batch_create_composable_token</a>(creator_signer: &<a href="">signer</a>, <a href="">collection</a>: <a href="_String">string::String</a>, number_of_tokens_to_mint: u64, description: <a href="_String">string::String</a>, name_with_index_prefix: <a href="_String">string::String</a>, name_with_index_suffix: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: <a href="_Option">option::Option</a>&lt;u64&gt;, royalty_denominator: <a href="_Option">option::Option</a>&lt;u64&gt;, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_batch_create_traits"></a>

## Function `batch_create_traits`



<pre><code><b>public</b> entry <b>fun</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_batch_create_traits">batch_create_traits</a>(creator_signer: &<a href="">signer</a>, <a href="">collection</a>: <a href="_String">string::String</a>, number_of_tokens_to_mint: u64, description: <a href="_String">string::String</a>, name_with_index_prefix: <a href="_String">string::String</a>, name_with_index_suffix: <a href="_String">string::String</a>, uri: <a href="_String">string::String</a>, royalty_numerator: <a href="_Option">option::Option</a>&lt;u64&gt;, royalty_denominator: <a href="_Option">option::Option</a>&lt;u64&gt;, property_keys: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_types: <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;, property_values: <a href="">vector</a>&lt;<a href="">vector</a>&lt;u8&gt;&gt;)
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_mint_token"></a>

## Function `mint_token`



<pre><code><b>public</b> entry <b>fun</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_mint_token">mint_token</a>&lt;Type: key&gt;(signer_ref: &<a href="">signer</a>, token_addr: <b>address</b>)
</code></pre>



<a id="0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_base_mint_price"></a>

## Function `base_mint_price`



<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="batch_mint.md#0xacf659101f2f39123e5c9ff5486100c78a84d2ab8319c52e3795aeb29ea8db3a_batch_mint_base_mint_price">base_mint_price</a>(token_addr: <b>address</b>): u64
</code></pre>
