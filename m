Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466DE20B80B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366062; cv=none; b=q4ACXahVB5xQ09vj30I7gtgCN3UQvb+S5YE/nGynX5lxzC3Vcw3JDLOadl5yBsTL/WWNERqJ6UnJW5TYfagR0wMYb1QCPSklK3mPv75NB1tsOl7Neh3Jw9KDetLE9u2EekUOOgxt0n60VCNFi01Cd+UbVtxn+L3Z0RwZdciX3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366062; c=relaxed/simple;
	bh=I5mrvGlIhRbJlxQ8eVXQCIvLA2D3zDa5EyQuNgkm5ro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J1/tACrDOlfgpbLdYf/fqlQzkdHjfAP55yFNYmnLgigoNNDHWecF0/9D4o/ajsDn1oDibYgwSnRVH4N4XcgnwRjeNUdRsOmkX8Qv+6BYQ34DsTc7C5vKHlBoM9imWkA4POaxVqeusdvQMyZUUc+nHYAHM4fUKfAM84TLaaTUo98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W7Ql/uHP; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W7Ql/uHP"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2570245f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751366058; x=1751970858; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9eYpIWWOyUDfBdnF6w5EzWxG6nDSQGMmFCg+4mWFSaM=;
        b=W7Ql/uHPu57+EntIi7rgmExXZ5vuBZnpDlIz+dpAQagiXcHzO5JxrxgkqgFJhFmryZ
         9GtU5xB/dnQOTqam3b5u/AmMtZtTXfnvuvpLVWTroGSAPdTx32uSmzeQbSJeEGwyrS5R
         WnSTLPJVks/o7THb2qTX31U+VLBsX9zOqEx/sTlVRYnXpV0bGBDZh3RzoYOlI2IgVVah
         N2fuTgegu6A1A4KUUXGT9d8XtRejjFD2GwrlBaSkpuAuNjsd9y20J1N1OUGX8+RZpDQ9
         HS1TZwOMBwcP8rXvUy/jbbfnYPdnyRM36k7g66US1asyo9JyHy0pyIK3Yt7WNv4PX33C
         dgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366058; x=1751970858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eYpIWWOyUDfBdnF6w5EzWxG6nDSQGMmFCg+4mWFSaM=;
        b=gfvJLidaXtz35zmG75hONg7qP/XDSDZq9RP+4fmZMUFr5rMcLQ3Ylxb2lElt69i6OY
         Znusj4K7tBCSKpjRuOkzIZ0avJxWhe/lcw4HkPdtCcUX/Q464lEnGTwOdMY8ERXCuBMI
         ByNh4nbU6IrD6EHUdry7SMFeTKU5+LaNJYijvzDKzxN+PLDNjvANV2R3lzvmEC5eNtDn
         LLdXFLo3YESbmCtu5qAoxljrY2XB/rmIO49+t4I2qf+umksIqQ/38Fy4rAtTXPWb9aP9
         ATXUS8mHZzjgMwZ2S7XnVplfoovXTJdsC27iIm5g1qDiN7bjLGoqYoLsLv841xoqSf5g
         mC1A==
X-Forwarded-Encrypted: i=1; AJvYcCW3au2MrW0FRE8e+Fb7V6ltNLIR/YMFjvNuFhzoYwH4j2ElrnwoOt2xqrLwqq/vsIQe+G5OoLdryNAJ5+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJekoL6LIZphbXhjCJvGDILX2et4vRFdPoWCrL6QoDfgO95S9
	5VczluDmBQvFQ4bebsN4HkBO0DIXrUeWRpqkl/f2Cl9MICPmkAGXnlkpKJpYp5scTNIQ3novQ8c
	IsfARaZdNGgwpJu/kwQ==
X-Google-Smtp-Source: AGHT+IExCFB+P+olVhWi69uc4CgDaEnI8SE94UUo0CxDvKCx5CZn1RoH+3jT8lmx3jEG2VJ7mPnAhF7D8TcmUIk=
X-Received: from wmbds13.prod.google.com ([2002:a05:600c:628d:b0:450:da87:cebb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:646:b0:3a5:8600:7cff with SMTP id ffacd0b85a97d-3a8fdb2a82fmr15767911f8f.1.1751366058480;
 Tue, 01 Jul 2025 03:34:18 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:34:17 +0000
In-Reply-To: <20250630221640.3325306-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se> <20250630221640.3325306-1-vitaly.wool@konsulko.se>
Message-ID: <aGO5qadROziFuO35@google.com>
Subject: Re: [PATCH v9 3/4] rust: add support for NUMA ids in allocations
From: Alice Ryhl <aliceryhl@google.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 01, 2025 at 12:16:40AM +0200, Vitaly Wool wrote:
> Add a new type to support specifying NUMA identifiers in Rust
> allocators and extend the allocators to have NUMA id as a
> parameter. Thus, modify ReallocFunc to use the new extended realloc
> primitives from the C side of the kernel (i. e.
> k[v]realloc_node_align/vrealloc_node_align) and add the new function
> alloc_node to the Allocator trait while keeping the existing one
> (alloc) for backward compatibility.
> 
> This will allow to specify node to use for allocation of e. g.
> {KV}Box, as well as for future NUMA aware users of the API.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

My main feedback is that we should consider introducing a new trait
instead of modifying Allocator. What we could do is have a NodeAllocator
trait that is a super-trait of Allocator and has additional methods with
a node parameter.

A sketch:

pub unsafe trait NodeAllocator: Allocator {
    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
                -> Result<NonNull<[u8]>, AllocError>;

    unsafe fn realloc_node(
        ptr: Option<NonNull<u8>>,
        layout: Layout,
        old_layout: Layout,
        flags: Flags,
        nid: NumaNode,
    ) -> Result<NonNull<[u8]>, AllocError>;
}

By doing this, it's possible to have allocators that do not support
specifying the numa node which only implement Allocator, and to have
other allocators that implement both Allocator and NumaAllocator where
you are able to specify the node.

If all allocators in the kernel support numa nodes, then you can ignore
this.
> +/// Non Uniform Memory Access (NUMA) node identifier
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct NumaNode(i32);
> +
> +impl NumaNode {
> +    /// create a new NUMA node identifer (non-negative integer)
> +    /// returns EINVAL if a negative id or an id exceeding MAX_NUMNODES is specified
> +    pub fn new(node: i32) -> Result<Self> {
> +        // SAFETY: MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10
> +        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
> +            return Err(EINVAL);
> +        }
> +        Ok(Self(node))
> +    }
> +}
> +
> +/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
> +/// about the NUMA node to allocate memory from.
> +pub mod numa {
> +    use super::NumaNode;
> +
> +    /// No preference for NUMA node
> +    pub const NUMA_NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
> +}

Instead of using a module, you can make it an associated constant of the
struct.

impl NumaNode {
    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
}

This way you can access the constant as NumaNode::NO_NODE.

>  /// The kernel's [`Allocator`] trait.
>  ///
>  /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
> @@ -148,7 +175,7 @@ pub unsafe trait Allocator {
>      ///
>      /// When the return value is `Ok(ptr)`, then `ptr` is
>      /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
> -    ///   [`Allocator::free`] or [`Allocator::realloc`],
> +    ///   [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`],
>      /// - aligned to `layout.align()`,
>      ///
>      /// Additionally, `Flags` are honored as documented in
> @@ -159,7 +186,38 @@ fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
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
> +    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
> +                -> Result<NonNull<[u8]>, AllocError> {

I don't think this is how rustfmt would format this. Can you run rustfmt
on your patch?

Alice
