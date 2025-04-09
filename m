Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0BEEB3;
	Wed,  9 Apr 2025 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189629; cv=none; b=Oaolpbtqv+wPtQ/HdCyHP/PUrVWydILca5P6XUIJo8nIAy3eE1s4qdUSff4i3c+KLxT8OdvQVqkxtPbsxay3QneGrCOOX35ziZ9Gvq7LFwSHIX77XYPjZ8RiQrs1ABZldc418jFkVwKRsz9AR5fN1hirovq690+JVfY4Zv1VFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189629; c=relaxed/simple;
	bh=x9nhbmOIlw56xbdOdESfx0hXwQDB+04i9Y6IFm4nco4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8Z1T6ERZ76rjOiS0JyzoEbB8gzPDQNwxHG9lg0qAdaq1cecPH0cAGV01BqFHv9nbm6zG/chnCs4yicEDB283KBWL5eE0/B5RZY2o5UKRwPds3OPq9IaE7AebEpj8hHsXgVan+tjgsGOF8k9ulB4Wug+W4ufegk/yaJb+QASZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rL+UUiYM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rL+UUiYM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5009AC4CEE3;
	Wed,  9 Apr 2025 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744189628;
	bh=x9nhbmOIlw56xbdOdESfx0hXwQDB+04i9Y6IFm4nco4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rL+UUiYMQzU7f8gO0Ve5ujemkNeuOvwDeVU6QV74Gg2A0vS6gJSzBudbwzhn9FEDF
	 KME4VqZQeMnVrY19XuRrgSUaHQCTxyYTdGWMLI+V1DNKvqv6w/xmycJV08ij3IJ8qq
	 IuUQumScp0NlLQgyCpbEWd7dwmRTvRd1SA6dm6yZGOYH89W8iAVM7N5NYUYobcVVM8
	 epLh2pOBqCqEnci1HJSL5kSIQThOBIR+J2hl65YKPTnEqsAPsz5eaq1YKCHfJAwXhu
	 5+zitLv+k16QgS9aqsGs3/UvRz6MErrK0XQWxRFTrc+ZyfLs1XlcbCRQ8z+N9rQLng
	 ZegmDBm8Drhng==
Date: Wed, 9 Apr 2025 11:07:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com, robin.murphy@arm.com,
	a.hindborg@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rust: conditionally compile dma abstraction based on
 CONFIG_HAS_DMA
Message-ID: <Z_Y4tuyyYIleFj_E@pollux>
References: <20250409055501.136672-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409055501.136672-1-fujita.tomonori@gmail.com>

On Wed, Apr 09, 2025 at 02:55:01PM +0900, FUJITA Tomonori wrote:
> Make dma abstraction conditional on CONFIG_HAS_DMA.

I'm not convinced that this is the correct fix. This would require drivers to
depend on CONFIG_HAS_DMA if they want to use the DMA API. The C side does not do
this either.

Instead, for functions like dma_alloc_attrs(), there is an empty implementation
if CONFIG_HAS_DMA is not set [1].

However, this definition is not picked up by bindgen. Hence, I think the actual
fix would be to introduce the corresponding Rust helpers.

[1] https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/dma-mapping.h#L189

> This fixes the following build error on UML:
> 
> error[E0425]: cannot find function `dma_alloc_attrs` in crate `bindings`
>      --> rust/kernel/dma.rs:171:23
>       |
> 171   |               bindings::dma_alloc_attrs(
>       |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_alloc_pages`
>       |
>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44568:5
>       |
> 44568 | /     pub fn dma_alloc_pages(
> 44569 | |         dev: *mut device,
> 44570 | |         size: usize,
> 44571 | |         dma_handle: *mut dma_addr_t,
> 44572 | |         dir: dma_data_direction,
> 44573 | |         gfp: gfp_t,
> 44574 | |     ) -> *mut page;
>       | |___________________- similarly named function `dma_alloc_pages` defined here
> 
> error[E0425]: cannot find function `dma_free_attrs` in crate `bindings`
>      --> rust/kernel/dma.rs:293:23
>       |
> 293   |               bindings::dma_free_attrs(
>       |                         ^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_free_pages`
>       |
>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44577:5
>       |
> 44577 | /     pub fn dma_free_pages(
> 44578 | |         dev: *mut device,
> 44579 | |         size: usize,
> 44580 | |         page: *mut page,
> 44581 | |         dma_handle: dma_addr_t,
> 44582 | |         dir: dma_data_direction,
> 44583 | |     );
>       | |______- similarly named function `dma_free_pages` defined here
> 
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/lib.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index de07aadd1ff5..9d743af69dc8 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -46,6 +46,7 @@
>  pub mod device;
>  pub mod device_id;
>  pub mod devres;
> +#[cfg(CONFIG_HAS_DMA)]
>  pub mod dma;
>  pub mod driver;
>  pub mod error;
> 
> base-commit: c59026c0570a2a97ce2e7d5ae5e9c48fc841542b
> -- 
> 2.43.0
> 
