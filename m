Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1E13AA2F;
	Thu, 26 Jun 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960712; cv=none; b=Sc3Mpfs22Nr87n3QZqYNRafZChzHfxWxlYffM2yRmyAW4zurQV84bxl3k79+Ffl3MjFmCncokGmV6f1ylojoFNZ1PmKUxc5Qm6YxMhapcUkwhzmJjvYS59D8eMZKwiT4c7uCp19nO6CIY3pIP+VGaGZ2TB8RBZP25W3TOcTDWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960712; c=relaxed/simple;
	bh=9kSgYJslI9669W5ZX/ZizxoETZvyBzl6RRzfWIJiGB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHTk1QX1mxyEBGIv0zquE+XCttJVa0cAOLqfq4+fIDSnwjY/IcgIV2CeE0B4q1/q8b0OpblP8kY/A8q2Solt7iEVlpStDRUgHlc1tvKpuLY3YY+u80IqVKmPKIS9UfzpGNf34HiwE4aCrK8vNTMrg2eN+Qfqf54cqXM+Z2FkT/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6ZuqU0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6ZuqU0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736EDC4CEEB;
	Thu, 26 Jun 2025 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750960712;
	bh=9kSgYJslI9669W5ZX/ZizxoETZvyBzl6RRzfWIJiGB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6ZuqU0AhMSVruGouu0fykiZUjYFBqnqPMY7yrwYikDukfBzc6r1l9K4ybVUugEIN
	 6CvVcyh5euPloItJxGwUVtgghYi17OJYPIIgNrzx/N8tn9j6LNdGbCcLyY+GgEmDdy
	 OC4VCDAOEaYpGxASwwKQSUnVuJXTQo/rjLzqaWWoOkV23OemTpHxO7qLvUH+9s4dhW
	 gntSwkv9pHypP0O8HI6M749L3HKZ5v+mIxFxRnhIdMl5Tf+9MjSnWaMnmOy5sw7F+F
	 UdkwFEyvXl+MKPLGnU6pkFIINh1A6qYQtrtj6mhmapCcOuz0prj3v2AI+l25LFGqJ0
	 SeG2/nMYA0bnA==
Date: Thu, 26 Jun 2025 19:58:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 3/4] rust: support large alignments in allocations
Message-ID: <aF2KQyUZRVNDPf-y@cassiopeiae>
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
 <20250626083642.3596388-1-vitaly.wool@konsulko.se>
 <aF0-tYomGe7nB5vX@pollux>
 <72365C10-D984-4BC5-A081-B058C1619D06@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72365C10-D984-4BC5-A081-B058C1619D06@konsulko.se>

On Thu, Jun 26, 2025 at 06:29:24PM +0200, Vitaly Wool wrote:
> 
> 
> > On Jun 26, 2025, at 2:36 PM, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > On Thu, Jun 26, 2025 at 10:36:42AM +0200, Vitaly Wool wrote:
> >> void * __must_check __realloc_size(2)
> >> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> >> +rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags)
> >> {
> >> return krealloc(objp, new_size, flags);
> >> }
> >> 
> >> void * __must_check __realloc_size(2)
> >> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
> >> +rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
> >> {
> >> return kvrealloc(p, size, flags);
> >> }
> > 
> > I think you forgot to add comments explaining why we have the additional
> > discarded align argument.
> > 
> > Also please keep those helpers as they are. You can write an identical inline
> > function in Rust that discards the align argument and calls bindings::krealloc,
> > etc.
> > 
> > For instance:
> > 
> > unsafe extern "C" fn krealloc_align(
> >    ptr: *const c_void,
> >    size: usize,
> >    _align: c_ulong
> >    flags: u32,
> > ) -> *mut c_void {
> >    bindings::krealloc(ptr, size, flags)
> > }
> > 
> 
> Ugh. This is indeed a mistake from my side but I don’t quite agree with your variant here too.
> The thing is that the new patchset has a patch #2 which adds kvrealloc_node and realloc_node so this chunk IMO should have looked like
> 
> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
> +rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
>  {
>  -      return kvrealloc(p, size, flags);
>  +      return kvrealloc_node(p, size, align, flags, NUMA_NO_NODE);
> 
>  }

No for two reasons:

  1) Rust helpers are transparent wrappers for  C functions / macros slipping
     through bindgen. We don't add any logic to them, as you do here.

  2) This patch is only about supporting large alignments for VMALLOC. There's
     no need to introduce kvrealloc_node() (yet).

The only thing you want here is to keep the signature common between all realloc
functions. Hence, you want

	unsafe extern "C" fn krealloc_align(
	   ptr: *const c_void,
	   size: usize,
	   _align: c_ulong
	   flags: u32,
	) -> *mut c_void {
	   bindings::krealloc(ptr, size, flags)
	}

on the Rust side of things. And in the next patch you want

	unsafe extern "C" fn krealloc_node_align(
	   ptr: *const c_void,
	   size: usize,
	   _align: c_ulong
	   flags: u32,
	   c_int: nid,
	) -> *mut c_void {
	   bindings::krealloc_node(ptr, size, flags, nid)
	}

> …exactly like for vmalloc, see also my comment below.
> 
> >> diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
> >> index 80d34501bbc0..4618c0b79283 100644
> >> --- a/rust/helpers/vmalloc.c
> >> +++ b/rust/helpers/vmalloc.c
> >> @@ -3,7 +3,7 @@
> >> #include <linux/vmalloc.h>
> >> 
> >> void * __must_check __realloc_size(2)
> >> -rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
> >> +rust_helper_vrealloc(const void *p, size_t size, unsigned long align, gfp_t flags)
> >> {
> >> - return vrealloc(p, size, flags);
> >> + return vrealloc_node(p, size, align, flags, NUMA_NO_NODE);
> >> }
> > 
> > Same here, just make this a "real" helper for vrealloc_node() and create a Rust
> > function vrealloc_align() like in the example above.
> 
> Wait, why? What’s the use of vrealloc() if it doesn’t provide the align functionality that we need?

That's fine, then this should be

	void * __must_check __realloc_size(2)
	rust_helper_vrealloc_node(const void *p, size_t size,
				  unsigned long align,
				  gfp_t flags, int nid)
	{
		return vrealloc_node(p, size, align, flags, nid);
	}

and on the Rust side, for this patch, you want:

	unsafe extern "C" fn vrealloc_align(
	   ptr: *const c_void,
	   size: usize,
	   align: c_ulong
	   flags: u32,
	   c_int: nid,
	) -> *mut c_void {
	   bindings::vrealloc_node(ptr, size, align, flags, bindings::NUMA_NO_NODE)
	}

The diff between the patches may come out nicer if you do it the other way
around though, i.e. first support node IDs and then support larger alignments
than PAGE_SIZE for VMALLOC.

> > 
> >> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> >> index aa2dfa9dca4c..a0d78c497974 100644
> >> --- a/rust/kernel/alloc/allocator.rs
> >> +++ b/rust/kernel/alloc/allocator.rs
> >> @@ -58,7 +58,7 @@ fn aligned_size(new_layout: Layout) -> usize {
> >> ///
> >> /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
> >> struct ReallocFunc(
> >> -    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
> >> +    unsafe extern "C" fn(*const crate::ffi::c_void, usize, usize, u32) -> *mut crate::ffi::c_void,
> > 
> > Should be c_ulong instead of usize.
> > 
> 
> Noted.
> 
> >> );
> >> 
> >> impl ReallocFunc {
> >> @@ -110,7 +110,7 @@ unsafe fn call(
> >>         // - Those functions provide the guarantees of this function.
> >>         let raw_ptr = unsafe {
> >>             // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
> >> -            self.0(ptr.cast(), size, flags.0).cast()
> >> +            self.0(ptr.cast(), size, layout.align(), flags.0).cast()
> >>         };
> >> 
> >>         let ptr = if size == 0 {
> >> @@ -152,12 +152,6 @@ unsafe fn realloc(
> >>         old_layout: Layout,
> >>         flags: Flags,
> >>     ) -> Result<NonNull<[u8]>, AllocError> {
> >> -        // TODO: Support alignments larger than PAGE_SIZE.
> >> -        if layout.align() > bindings::PAGE_SIZE {
> >> -            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> >> -            return Err(AllocError);
> >> -        }
> >> -
> >>         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
> >>         // allocated with this `Allocator`.
> >>         unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
> >> @@ -176,12 +170,6 @@ unsafe fn realloc(
> >>         old_layout: Layout,
> >>         flags: Flags,
> >>     ) -> Result<NonNull<[u8]>, AllocError> {
> >> -        // TODO: Support alignments larger than PAGE_SIZE.
> >> -        if layout.align() > bindings::PAGE_SIZE {
> >> -            pr_warn!("KVmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> >> -            return Err(AllocError);
> >> -        }
> > 
> > Didn't you propose to use VREALLOC if layout.align() > bindings::PAGE_SIZE?
> > 
> 
> I did, and this is what happens on the C side now, please see the #2 patch in series.

I'm fine doing it on the C side if the C side maintainers agree.

However, I don't see you doing it. kvrealloc_node_noprof() does not even have an
align argument AFAICS.

> I think it’s better this way because of uniformity but I don’t have a strong opinion on this.

I agree, but again, I don't think you do it yet. :)

> 
> >>         // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
> >>         // allocated with this `Allocator`.
> >>         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
> > 
> 
