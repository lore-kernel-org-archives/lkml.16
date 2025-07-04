Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5145C1917D6;
	Fri,  4 Jul 2025 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642606; cv=none; b=YSEXU3LyLUdhiJOARIOujhYb1o8zsrT/a7/t86brGoqScPrelUA3DjbwPxH2qixu5nNHjCSdPz8ZSxdcCh8zdsMkrH271rSwCPhagxUOeNl2/7cZhoya374yGib95nAoHJzBNAjL3qabMvciYbsv6WfnIn6xiImVyKpBdY6BJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642606; c=relaxed/simple;
	bh=VMeaW3Ht2VUKwFFv83ENRZAVecXmY4f2VHjBo+Z4deM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4WWTq1XI1hQXM9jdTF1FjkEE0Ohk/OXc9CQApKF+1t8WotLu62ToBq9/PsnjLWxg3MhvOLzilXaMOGP8vC/6uBlyE1VfwjRKad+Zvj4qvJBMf9wHlrejQLHo9GfMtcfrmutN2ECsMBtXU9cAG4eFqQRtI14WS14svGMbmZEJ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtgRfuFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtgRfuFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FC3C4CEE3;
	Fri,  4 Jul 2025 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751642605;
	bh=VMeaW3Ht2VUKwFFv83ENRZAVecXmY4f2VHjBo+Z4deM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtgRfuFOSIlrv1J6PondeD5tMTcQPAWDgcTh/Sgpwph3ZTopWVQ21ITkHdrBkgTNw
	 NqQNQad87f92ic6VOXt6Oa+DMzjyb9s3cJTN94jftILJLpbUjGPEqhCWwyJL3QtcoX
	 jbkiGUU62m9ukRVMH62BXjpdDji+OtEE8JLXZPFzItwFXiUhtfHTNkdKz/2KIvfbHP
	 Jdf/WtxGpZkiVE37RYqLxtTdnMFqIOvL1lk0XweVgaPttfvRbhq3K9ygTJ0hix34fR
	 MnCMK3LngdKNlh35dGNm+IfEVweBqhgUoudgsKszkdVDbG+PiFKQBhO7u86HfoVPBM
	 UbxY+imH3+kZg==
Date: Fri, 4 Jul 2025 17:23:21 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v10 3/4] rust: add support for NUMA ids in allocations
Message-ID: <aGfx6c72FgHn3NNW@pollux>
References: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
 <20250702160910.3610134-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702160910.3610134-1-vitaly.wool@konsulko.se>

On Wed, Jul 02, 2025 at 06:09:10PM +0200, Vitaly Wool wrote:
>  /// The kernel's [`Allocator`] trait.
>  ///
>  /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
> @@ -148,7 +172,7 @@ pub unsafe trait Allocator {
>      ///
>      /// When the return value is `Ok(ptr)`, then `ptr` is
>      /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
> -    ///   [`Allocator::free`] or [`Allocator::realloc`],
> +    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`],
>      /// - aligned to `layout.align()`,
>      ///
>      /// Additionally, `Flags` are honored as documented in
> @@ -159,7 +183,41 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
>          unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags) }
>      }
>  
> -    /// Re-allocate an existing memory allocation to satisfy the requested `layout`.
> +    /// Allocate memory based on `layout`, `flags` and `nid`.
> +    ///
> +    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the layout
> +    /// constraints (i.e. minimum size and alignment as specified by `layout`).
> +    ///
> +    /// This function is equivalent to `realloc_node` when called with `None`.
> +    ///
> +    /// # Guarantees
> +    ///
> +    /// When the return value is `Ok(ptr)`, then `ptr` is
> +    /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
> +    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`],
> +    /// - aligned to `layout.align()`,
> +    ///
> +    /// Additionally, `Flags` are honored as documented in
> +    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
> +    fn alloc_node(
> +        layout: Layout,
> +        flags: Flags,
> +        nid: NumaNode,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        // SAFETY: Passing `None` to `realloc_node` is valid by its safety requirements and
> +        // asks for a new memory allocation.
> +        unsafe { Self::realloc_node(None, layout, Layout::new::<()>(), flags, nid) }
> +    }
> +
> +    /// Re-allocate an existing memory allocation to satisfy the requested `layout` and
> +    /// a specific NUMA node request to allocate the memory for.
> +    ///
> +    /// Systems employing a Non Uniform Memory Access (NUMA) architecture contain collections of
> +    /// hardware resources including processors, memory, and I/O buses, that comprise what is
> +    /// commonly known as a NUMA node.
> +    ///
> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which is a non-negative
> +    /// integer if a node needs to be specified, or NO_NODE if the caller doesn't care.
>      ///
>      /// If the requested size is zero, `realloc` behaves equivalent to `free`.
>      ///
> @@ -191,13 +249,27 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
>      ///   and old size, i.e. `ret_ptr[0..min(layout.size(), old_layout.size())] ==
>      ///   p[0..min(layout.size(), old_layout.size())]`.
>      /// - when the return value is `Err(AllocError)`, then `ptr` is still valid.
> -    unsafe fn realloc(
> +    unsafe fn realloc_node(
>          ptr: Option<NonNull<u8>>,
>          layout: Layout,
>          old_layout: Layout,
>          flags: Flags,
> +        nid: NumaNode,
>      ) -> Result<NonNull<[u8]>, AllocError>;
>  
> +    /// Re-allocate an existing memory allocation to satisfy the requested `layout`. This
> +    /// function works exactly as realloc_node() but it doesn't give the ability to specify
> +    /// the NUMA node in the call.
> +    unsafe fn realloc(
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        old_layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        // SAFETY: guaranteed by realloc_node()
> +        unsafe { Self::realloc_node(ptr, layout, old_layout, flags, NumaNode::NO_NODE) }
> +    }

I think Alice suggested to just drop alloc_node() and realloc_node() and make
alloc() and realloc() always take a NumaNode argument.

I don't have a strong preference, but keeping only alloc() and realloc() for
seems indeed simpler, so let's remove the _node() variants.

Regardless, please note that realloc() as you implemented it above misses the
safaety requirement, which should just mention that the safety requirements are
identical to realloc_node().

The safety comment on the subsequent call to realloc_node() would then be
justified with realloc() having identical safety requirements as realloc_node().
