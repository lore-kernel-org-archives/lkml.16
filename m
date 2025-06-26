Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D52E06DC;
	Thu, 26 Jun 2025 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941370; cv=none; b=jGuezSQtTfnJUzfAm2b+7k2/1RZ3C0ytWe3AEoqAsabIRylRovRmT26OWKIIRxt6P4Oc/mlgfNBA4zmnm1xfn4DveZiYe8kijxRjdt+uoCt1B6gR1BvwJyXzPyCglXod6TNTZj2zjmwHClENllBR4XcrzF4JgtUPLdeHbZ0MNW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941370; c=relaxed/simple;
	bh=jkStiqdbqvgUGXirSUwGLlQ14O9y2yDoXve1z9ZZLrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUL6altk7gX0uTc5DNcWuIsG+gl7qJeLwpxo1AYtVWYERmR4+r+RiVyPwxk2GM2VjM2H17lZkxEDtThbLh2dr5LfXSenfnnN6eq/J4RiRxMuy/gomCJSFFz6zxu7g06WbrZiokB/Rhm65BD55bIBtj2DvAMjFg5WvOHYphpGKIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btwmvuk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btwmvuk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31622C4CEEB;
	Thu, 26 Jun 2025 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750941369;
	bh=jkStiqdbqvgUGXirSUwGLlQ14O9y2yDoXve1z9ZZLrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btwmvuk+bO9gLYGz+YI78oe3GQAdzrtVOFrnJ+7VpTuBgU3XriDWEyFilP20Dfwff
	 RvsOeFtSvwhyAFH2PLYxk+o+bIkHR8htzLZLIBRNjMfT6xF83FWSSIRF43h6er7wfl
	 Zv2vFPY0Pid0UvAH+qL5nX7zzQg3AY+U+g7ihFrfuMjYYkeI9yUrbHVctfA+TBUS+d
	 j51s/34aOiCU4L7TVyEP7uTFRhKRbLDUdzjjFAhtcLzj+XddOI48odU0jumgah7RT7
	 R7V8nmlbdSFsV8S/7DG6UaN1FxAxuyC6tKVayouA2hSWo4nRUEzAyRAaI3dxYWv0A5
	 CzyPtIZVWv5pA==
Date: Thu, 26 Jun 2025 14:36:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 3/4] rust: support large alignments in allocations
Message-ID: <aF0-tYomGe7nB5vX@pollux>
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
 <20250626083642.3596388-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626083642.3596388-1-vitaly.wool@konsulko.se>

On Thu, Jun 26, 2025 at 10:36:42AM +0200, Vitaly Wool wrote:
>  void * __must_check __realloc_size(2)
> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> +rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags)
>  {
>  	return krealloc(objp, new_size, flags);
>  }
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
> +rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
>  {
>  	return kvrealloc(p, size, flags);
>  }

I think you forgot to add comments explaining why we have the additional
discarded align argument.

Also please keep those helpers as they are. You can write an identical inline
function in Rust that discards the align argument and calls bindings::krealloc,
etc.

For instance:

	unsafe extern "C" fn krealloc_align(
	    ptr: *const c_void,
	    size: usize,
	    _align: c_ulong
	    flags: u32,
	) -> *mut c_void {
	    bindings::krealloc(ptr, size, flags)
	}

> diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
> index 80d34501bbc0..4618c0b79283 100644
> --- a/rust/helpers/vmalloc.c
> +++ b/rust/helpers/vmalloc.c
> @@ -3,7 +3,7 @@
>  #include <linux/vmalloc.h>
>  
>  void * __must_check __realloc_size(2)
> -rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
> +rust_helper_vrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
>  {
> -	return vrealloc(p, size, flags);
> +	return vrealloc_node(p, size, align, flags, NUMA_NO_NODE);
>  }

Same here, just make this a "real" helper for vrealloc_node() and create a Rust
function vrealloc_align() like in the example above.

> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index aa2dfa9dca4c..a0d78c497974 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -58,7 +58,7 @@ fn aligned_size(new_layout: Layout) -> usize {
>  ///
>  /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
>  struct ReallocFunc(
> -    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
> +    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, u32) -> *mut crate::ffi::c_void,

Should be c_ulong instead of usize.

>  );
>  
>  impl ReallocFunc {
> @@ -110,7 +110,7 @@ unsafe fn call(
>          // - Those functions provide the guarantees of this function.
>          let raw_ptr = unsafe {
>              // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
> -            self.0(ptr.cast(), size, flags.0).cast()
> +            self.0(ptr.cast(), size, layout.align(), flags.0).cast()
>          };
>  
>          let ptr = if size == 0 {
> @@ -152,12 +152,6 @@ unsafe fn realloc(
>          old_layout: Layout,
>          flags: Flags,
>      ) -> Result<NonNull<[u8]>, AllocError> {
> -        // TODO: Support alignments larger than PAGE_SIZE.
> -        if layout.align() > bindings::PAGE_SIZE {
> -            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> -            return Err(AllocError);
> -        }
> -
>          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
>          // allocated with this `Allocator`.
>          unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
> @@ -176,12 +170,6 @@ unsafe fn realloc(
>          old_layout: Layout,
>          flags: Flags,
>      ) -> Result<NonNull<[u8]>, AllocError> {
> -        // TODO: Support alignments larger than PAGE_SIZE.
> -        if layout.align() > bindings::PAGE_SIZE {
> -            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> -            return Err(AllocError);
> -        }

Didn't you propose to use VREALLOC if layout.align() > bindings::PAGE_SIZE?

>          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
>          // allocated with this `Allocator`.
>          unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
