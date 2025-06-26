Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFEB2E0B50;
	Thu, 26 Jun 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941627; cv=none; b=ZQyX2X896XHVFE8A1YURouzo0blgQKdoTNuqRRmV0/PhBpcUcCmYAdFusOg7tZN7HBR2YVwOWt1YLLlbos/98cZ7/pEM5J4dQM/OsljfyWQOb3RNS04VArjxcVHluxf0Y11iq3yjOusmjaOHnD+eH/M71RLbruigoKIRpAuE8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941627; c=relaxed/simple;
	bh=tjTOGPjzJnUG43hJmlfmYnj58c2q6lIlyqKtZ0yQ1RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciaj3siTnqZUengHbZ4D0DUKQK0nAOFFubcChlBBKhTurAIwH4TTSEmW+wDNCGJlw8zPe8q320+YEPHSs6zlg3HTE5Cj5EiIb8m85RvaMSSwtbS7UrJPahM1SdIq0q4qDUrOXFf2zyWetLjRyNQiKp8nHuyQAqt04l+JUQ7sFCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iov/UuMO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iov/UuMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75679C4CEEB;
	Thu, 26 Jun 2025 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750941627;
	bh=tjTOGPjzJnUG43hJmlfmYnj58c2q6lIlyqKtZ0yQ1RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iov/UuMO5gwHm/ahFOfhswkjoJiwTLF0guIiN2DoAeTvTTAIlPiojVkwzlTXYx4vQ
	 n7c8xYy3Z5Z+WmYxcQYKD/CcUCgKC4RyMNGrtiHhPg1GVdP0R2qx5q5piZ9+1+qhB/
	 5Fw8JdyvakCmqTI6tlvzPkXosO6zUtrOV4g5i02mNj0otQZVZsdK7cXoeYIRheVvQL
	 HVC9ElJWilf+okF+PTPkAYE+OD7hSTg1awFFPF6+oU6+LRcX1xBq2rZ+fmdVt2Sl1j
	 9BlyLKSsrs0preOaFymh8sfhsdkm6/G0jEkq9jLK62L+9gohRBt1MC9tcMClAIDvMv
	 TVoI95NoeUElg==
Date: Thu, 26 Jun 2025 14:40:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 4/4] rust: support NUMA ids in allocations
Message-ID: <aF0_tm04Y8MsqVzZ@pollux>
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
 <20250626083653.3596424-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626083653.3596424-1-vitaly.wool@konsulko.se>

On Thu, Jun 26, 2025 at 10:36:53AM +0200, Vitaly Wool wrote:
> Add support for specifying NUMA ids in Rust allocators as an Option
> (i. e. providing `None` as nid corresponds to NUMA_NO_NODE). This
> will allow to specify node to use for allocation of e. g. {KV}Box.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
>  rust/helpers/slab.c            |  9 +++++----
>  rust/helpers/vmalloc.c         |  4 ++--
>  rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++++++--
>  rust/kernel/alloc/allocator.rs | 26 ++++++++++++++++++--------
>  rust/kernel/alloc/kvec.rs      |  3 ++-
>  5 files changed, 53 insertions(+), 17 deletions(-)
> 
> diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> index 5e9e8dd2bba0..ab1cf72f8353 100644
> --- a/rust/helpers/slab.c
> +++ b/rust/helpers/slab.c
> @@ -3,13 +3,14 @@
>  #include <linux/slab.h>
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags)
> +rust_helper_krealloc_node(const void *objp, size_t new_size, unsigned long align, gfp_t flags,
> +			  int nid)
>  {
> -	return krealloc(objp, new_size, flags);
> +	return krealloc_node(objp, new_size, flags, nid);
>  }
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
> +rust_helper_kvrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
>  {
> -	return kvrealloc(p, size, flags);
> +	return kvrealloc_node(p, size, flags, nid);
>  }

Same as in the previous patch, please keep those as "normal" helpers for
*realloc_node() and create the corresponding *realloc_node_align() helpers
discarding the argument on the Rust side.

> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index a2c49e5494d3..1e26c2a7f47c 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -156,7 +156,30 @@ pub unsafe trait Allocator {
>      fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
>          // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a
>          // new memory allocation.
> -        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags) }
> +        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags, None) }
> +    }
> +
> +    /// Allocate memory based on `layout`, `flags` and `nid`.
> +    ///
> +    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the layout
> +    /// constraints (i.e. minimum size and alignment as specified by `layout`).
> +    ///
> +    /// This function is equivalent to `realloc` when called with `None`.
> +    ///
> +    /// # Guarantees
> +    ///
> +    /// When the return value is `Ok(ptr)`, then `ptr` is
> +    /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
> +    ///   [`Allocator::free`] or [`Allocator::realloc`],
> +    /// - aligned to `layout.align()`,
> +    ///
> +    /// Additionally, `Flags` are honored as documented in
> +    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
> +    fn alloc_node(layout: Layout, flags: Flags, nid: Option<i32>)
> +                -> Result<NonNull<[u8]>, AllocError> {
> +        // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a
> +        // new memory allocation.
> +        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags, nid) }
>      }
>  
>      /// Re-allocate an existing memory allocation to satisfy the requested `layout`.
> @@ -196,6 +219,7 @@ unsafe fn realloc(
>          layout: Layout,
>          old_layout: Layout,
>          flags: Flags,
> +        nid: Option<i32>,
>      ) -> Result<NonNull<[u8]>, AllocError>;

I think you did forget to add realloc_node() as requested in the last iteration.
