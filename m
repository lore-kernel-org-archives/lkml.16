Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3961A841C;
	Fri, 27 Jun 2025 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023216; cv=none; b=fnriWsWb4SlxGLIFUCuj1E2kP0wkc9CXts85W9EYZDTxfUFXM2RxTOPC7rKAg+ZOEDknHesnnh7l7MU0y1eEiaTZhsFO0CjdtM12BkvkuJi42mckTsZUMaQT0wgBTcUN1Pmk9W4JZ2BlUfZ7jNmByVKbYhsaXaq6FK+NfSkyydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023216; c=relaxed/simple;
	bh=LlMs2RYEoSyATnOfokVMPOkgG73vQ701gJIshNUkVJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PF21c30GTfxPH1Bi3pd4eEDZzsLYOnxtqk/vODzHr8m+orUl0U31QPkrd1t7DJBtkYib8AYkcG6VuFPhVVaBdf4N/VVXUpWyjs1H/VuPu983W/eEsRYR+Y403Y0Oh+N1rjrNNqytZOdsbLrwc3mfQJO3Epk5H1zoKiPcTB5ImWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl8+5wB9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl8+5wB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC69FC4CEE3;
	Fri, 27 Jun 2025 11:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751023215;
	bh=LlMs2RYEoSyATnOfokVMPOkgG73vQ701gJIshNUkVJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hl8+5wB9xLillD0nK5nrroF9IjtyhcV9bEzcfVOKQ7snWYDSS9iMEzqcYqPdxWBYj
	 S1almeYH4kttJ/ukqfYDBdBhNnxLht1FdZktgJs9qC208XhrUv62g04yzzja0WPRAS
	 neT4NtjNIHTTkblM7jebiaqNyLodx9EiZJTH54xrO9TVDECslDQHPEmvZHmqi9pcSf
	 F016Zu+XO3wd9LYPdWOAJ1U/TOQGMb3fQx2pSlyDChp8gKvfkSoFTfijRsdTr16Nhh
	 /Nq6yocw77YZUh3++gbRX/3oBwl//rTTsJ8enoVWsjDa/wr/mAmd2He7m+v5AtZe67
	 K+9kpd785IwKA==
Date: Fri, 27 Jun 2025 13:20:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 3/4] rust: add support for NUMA ids in allocations
Message-ID: <aF5-a-bUp1pD5tiS@pollux>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093858.413855-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627093858.413855-1-vitaly.wool@konsulko.se>

On Fri, Jun 27, 2025 at 11:38:58AM +0200, Vitaly Wool wrote:
> +    /// Allocate memory based on `layout`, `flags` and `nid`.

The semantical meanting of layout and flags is rather obvious due to its type.

We should probably introduce a new type NumaNode with a constant for
NUMA_NODE_NONE.

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

Please rename to realloc_node() and expand the documentation explaining what
happens for invalid nid numbers and what happens if nid changes throughout
invocations.

Also, please introduce realloc() which calls realloc_node() with NUMA_NODE_NONE.

>  
>      /// Free an existing memory allocation.
> @@ -211,7 +235,7 @@ unsafe fn free(ptr: NonNull<u8>, layout: Layout) {
>          // SAFETY: The caller guarantees that `ptr` points at a valid allocation created by this
>          // allocator. We are passing a `Layout` with the smallest possible alignment, so it is
>          // smaller than or equal to the alignment previously used with this allocation.
> -        let _ = unsafe { Self::realloc(Some(ptr), Layout::new::<()>(), layout, Flags(0)) };
> +        let _ = unsafe { Self::realloc(Some(ptr), Layout::new::<()>(), layout, Flags(0), None) };
>      }
>  }
>  
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index aa2dfa9dca4c..4f0fe2b67593 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -58,18 +58,20 @@ fn aligned_size(new_layout: Layout) -> usize {
>  ///
>  /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
>  struct ReallocFunc(
> -    unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut crate::ffi::c_void,
> +    unsafe extern "C" fn(*const crate::ffi::c_void, usize, crate::ffi::c_ulong, u32,
> +                         crate::ffi::c_int
> +    ) -> *mut crate::ffi::c_void,
>  );
>  
>  impl ReallocFunc {
> -    // INVARIANT: `krealloc` satisfies the type invariants.
> -    const KREALLOC: Self = Self(bindings::krealloc);
> +    // INVARIANT: `krealloc_node` satisfies the type invariants.
> +    const KREALLOC_NODE: Self = Self(bindings::krealloc_node);
>  
> -    // INVARIANT: `vrealloc` satisfies the type invariants.
> -    const VREALLOC: Self = Self(bindings::vrealloc);
> +    // INVARIANT: `vrealloc_node` satisfies the type invariants.
> +    const VREALLOC_NODE: Self = Self(bindings::vrealloc_node);
>  
> -    // INVARIANT: `kvrealloc` satisfies the type invariants.
> -    const KVREALLOC: Self = Self(bindings::kvrealloc);
> +    // INVARIANT: `kvrealloc_node` satisfies the type invariants.
> +    const KVREALLOC_NODE: Self = Self(bindings::kvrealloc_node);

I think those constants can remain to be named just KREALLOC, etc.
