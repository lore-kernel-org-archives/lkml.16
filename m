Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24841CAA7B;
	Wed, 25 Jun 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877766; cv=none; b=M4FBt2DGFqGmVCIz/I2VV7GDEOoXKIf/Xh0uDGVGKNpeuP6i80bdu3/A8YbcPEwOEVPbXf1Ql+MJ90Uadyxy4odKIUl53ozpDon63RiDBhJRKoATBp+LYCSrKGaQyugfsi/KhtaInYc2p0JVOuY9dkRE3kyDZJIKAEMh4wywtLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877766; c=relaxed/simple;
	bh=xOFkaPALEr96n45ZXxDSSZiyNX3n+26t1/APa5EPG6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb7N5dSC9EW5TlHZ4Weq6lvo00mIvuFOUB7FfRdMNza1S3q1qGdcBh2yfAGrQvrMaJI1mj/Ohjls9OQ5e5/ULxce3DEgB9ITwrb7g5EuIxwbm1p7QyvXCKhdrHYVUPCI3koMdVnOKXFCfz+aAgRu1c0MxaVRejd+mMKNCgmQPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpV8Fk4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpV8Fk4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331A3C4CEEA;
	Wed, 25 Jun 2025 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877765;
	bh=xOFkaPALEr96n45ZXxDSSZiyNX3n+26t1/APa5EPG6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpV8Fk4wsOTCJ3F3AtTznHgsqgYKNDh8sLJiuj0nYF8J3Y5RULc+AdRPI7rhxlTNg
	 x2XAWU6ybjtHLxU8/dMJ451MxNjgBIpErQ4kFIbqc6q0Bv+P5lz1Lv4JkGIv+pGsa3
	 i+E8oQt9XZDSAHD84wquU+7alWnYb96T4ed3DNmx8Np4g8tRBP2P+IDfZJ9fYfCyAI
	 y50sjF/Dur0QuvfXYVVEFR1DFuSun3GJVF1xvWdBsOJMCtheNbJYrpDVhl5kEWE8S/
	 MWWfUXbUWmETzq4yZATnGKLJRAXpmuVY9OSqgf3dv0Vm3qRicUhH/72tkSQGiw2T6q
	 ElabgicGpHggw==
Date: Wed, 25 Jun 2025 20:56:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFxGQWG_81Peu7mP@cassiopeiae>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625063026.3379921-1-vitaly.wool@konsulko.se>

On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
> Add support for large (> PAGE_SIZE) alignments in Rust allocators
> (Kmalloc support for large alignments is limited to the requested
> size, which is a reasonable limitation anyway).

Please split this..

> Besides, add support for NUMA id to Vmalloc.

and this into separate patches.

Please also add some information to the commit message what you need node
support for. Do you also have patches to add node support to Box and Vec?

> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
>  rust/helpers/slab.c            |  8 +++++--
>  rust/helpers/vmalloc.c         |  4 ++--
>  rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++--
>  rust/kernel/alloc/allocator.rs | 40 +++++++++++++++++++---------------
>  rust/kernel/alloc/kvec.rs      |  3 ++-
>  5 files changed, 59 insertions(+), 24 deletions(-)
> 
> diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> index a842bfbddcba..221c517f57a1 100644
> --- a/rust/helpers/slab.c
> +++ b/rust/helpers/slab.c
> @@ -3,13 +3,17 @@
>  #include <linux/slab.h>
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> +rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags, int nid)

This should have a comment making it obvious why the function has two arguments
that are discarded. I think we should even separate it with an additional inline
function.

I do agree with discarding the align argument, given that it's not exposed to
users though the Allocator API.

I do disagree with discarding the nid argument though, since you change the
generic Allocator::realloc() API to take a node argument, which for KREALLOC and
KVREALLOC is silently discarded. If we introduce it, we should do so for all
three allocators.

>  {
> +	if (WARN_ON(new_size & (align - 1)))
> +		return NULL;

I don't think we should have this WARN_ON(). If we want to warn about this, we
should already do so on the Rust side. The helper functions in this file should
not contain any logic.

>  	return krealloc(objp, new_size, flags);
>  }
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
> +rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
>  {
> +	if (WARN_ON(size & (align - 1)))
> +		return NULL;
>  	return kvrealloc(p, size, flags);
>  }

Same as above.

> diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
> index 80d34501bbc0..9131279222fa 100644
> --- a/rust/helpers/vmalloc.c
> +++ b/rust/helpers/vmalloc.c
> @@ -3,7 +3,7 @@
>  #include <linux/vmalloc.h>
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
> +rust_helper_vrealloc_node(const void *p, size_t size, unsigned long align, gfp_t flags, int node)
>  {
> -	return vrealloc(p, size, flags);
> +	return vrealloc_node(p, size, align, flags, node);
>  }
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 2e377c52fa07..12a723bf6092 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -161,7 +161,30 @@ pub unsafe trait Allocator {
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
> @@ -201,6 +224,7 @@ unsafe fn realloc(
>          layout: Layout,
>          old_layout: Layout,
>          flags: Flags,
> +        nid: Option<i32>,
>      ) -> Result<NonNull<[u8]>, AllocError>;

I think we should rename this to realloc_node() and introduce realloc(), which
just calls realloc_node() with None.
