Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCC200127
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576691; cv=none; b=qArEretGuBVWqJ6iPxBEnkZU6a/6LbsgIFh8sN4hhkpEl+lGKCrf8Sutuu7sNkG6oQDojaeXWORh1G+q+FgWmisg5hB31QVpnAvHYmTJ98cHj/MxMCautBo2FKZ84RNjOBlR+TKmqUHXSe4QVe9sGgqiQTXTIdWxGgugV/LwUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576691; c=relaxed/simple;
	bh=wQB7FChqnrt8lzf67MgS27rpO3Q2KIoL9AdOfNEtOZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpNThvuA6mGiDtMOcppRK1ffXZ4SzBusKxOXh42KubHqYeGQHJVSEOEfwvLPminrZZyETP5O47jg0kZPwLWzJV2muzgwym7YgYaSkRNtogy+VsXMjuLW5zF9MTxAGECcZ+m2CPAD6eFm8bv9wzTXpeFoWyidtKObsJyVawL6hkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QZymytbR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QZymytbR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43675b1155bso49025205e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738576688; x=1739181488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeD4zer0SwhO1vY20QVHV1mXu+FN5WI4OZDMZzjZdsA=;
        b=QZymytbRDpLOiif1t7iRC5bBCGl0lql/apuT/sMPFXysLEG4i60daHSClP0chvImda
         8LPtVgXna6tFVRRx7gg+mYKa5PpH+2ucJYG4OizMPX8UuxZudqXRs6achaDFImwvov+M
         BojWcybelVS0SiBNPFCcD1wNnpQq/lltgcDiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576688; x=1739181488;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GeD4zer0SwhO1vY20QVHV1mXu+FN5WI4OZDMZzjZdsA=;
        b=C+ocCBtMs2+zF8UrxVf2TK94vv2KefZA/sstNKKs4nNwo1IXJe7udk4fsw5VvgumhF
         gso85V3R2xZdjZEnXUt54U63Ne8E/IX73u1hZzwgXtTMJsHHXokLWay4rHud//3wmrJE
         xi/Op+K7qqt72C7RZVhNbSh33k6DwB2bwBpLdXg+O0jAggq4R6V2UaTqqPdK0Mz+RmDv
         jow/3ee1nYmzrk+mH1nU18hMBIXtJ1JdgNkoZq3PtBiVPnRzz/kcAW3CD1CB3HMiOBxM
         XTTTGc/jjPN+kXYnlIB17YcxqUnSYfENZoCAtQcvlCPwL8ObhEW59MJ1Ap64DVJd9h82
         FaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy5K8xSGHqtBkdfGE3Hr4tKXiSoFWI+dtbdxrP9Na+kMNm+cgKsK/aJdip4l9ut8ixIQQA5OCq663CMgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT52/QnYfyeqy1MepXNkRA/PtIhHqUW901tduFCTV73Fchr9Fz
	jL6xF8oJhz5Fd63hkWbOqZuKJZDO6V1DeH9ts8uD1kY902NMQDFixosu7npJtQI=
X-Gm-Gg: ASbGncsDDYpvqtSQL92/RqRiZWr9Q7/WCIpHGJdnBipEQG3U5lFfRKpdQwZbjkDhY/6
	O5On4AnXHwI0qDfCw+z2Trl/sEFeqr0feW2NhmO/1HjFSyxV1Lt1Y+rc96KaMPTOhL4VjbAOqfu
	OgZ0US7vDhIsBKja96jMYNC+IyThwWi9LMbThkVPXPtcX4ibhtyl+GFTLTCynGVl9ZyQRarRHAO
	5D3zzdds1I/awUtexR6AQnkdiW2RXFKJDClIDmmfT7sPV8yjAvrG8BE4dJQKOBtehUCOZkMPt1+
	tU851KK2wu92dp+34ZXWj0OA/hc=
X-Google-Smtp-Source: AGHT+IGorkrzHjX4R3pZdGwk+hHms7tlUcrC4qehkpQJ03KFCFxuLmGP8ZR27Vt03TxvRXb7uHx+vw==
X-Received: by 2002:a05:600c:4594:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-438dc435389mr183716805e9.31.1738576687704;
        Mon, 03 Feb 2025 01:58:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm185941355e9.21.2025.02.03.01.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:58:07 -0800 (PST)
Date: Mon, 3 Feb 2025 10:58:04 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <Z6CTLB2NggwYafi9@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
> This series refactors the existing Page wrapper to support borrowing
> `struct page` objects without ownership on the Rust side, and converting
> page references to/from physical memory addresses.
> 
> The series overlaps with the earlier submission in [1] and follows a
> different approach, based on the discussion that happened there.
> 
> The primary use case for this is implementing IOMMU-style page table
> management in Rust. This allows drivers for IOMMUs and MMU-containing
> SoC devices to be written in Rust (such as embedded GPUs). The intended
> logic is similar to how ARM SMMU page tables are managed in the
> drivers/iommu tree.
> 
> First, introduce a concept of Owned<T> and an Ownable trait. These are
> similar to ARef<T> and AlwaysRefCounted, but are used for types which
> are not ref counted but rather have a single intended owner.
> 
> Then, refactor the existing Page support to use the new mechanism. Pages
> returned from the page allocator are not intended to be ref counted by
> consumers (see previous discussion in [1]), so this keeps Rust's view of
> page ownership as a simple "owned or not". Of course, this is still
> composable as Arc<Owned<Page>> if Rust code needs to reference count its
> own Page allocations for whatever reason.

I think there's a bit a potential mess here because the conversion to
folios isn't far enough yet that we can entirely ignore page refcounts and
just use folio refcounts. But I guess we can deal with that oddity if we
hit it (maybe folio conversion moves fast enough), since this only really
starts to become relevant for hmm/svm gpu stuff.

iow I think anticipating the future where struct page really doesn't have
a refcount is the right move. Aside from that it's really not a refcount
that works in the rust ARef sense, since struct page cannot disappear for
system memory, and for dev_pagemap memory it's an entirely different
reference you need (and then there's a few more special cases).

For dma/iommu stuff there's also a push to move towards pfn + metadata
model, so that p2pdma doesn't need struct page. But I haven't looked into
that much yet.

Cheers, Sima

> Then, make some existing private methods public, since this is needed to
> reasonably use allocated pages as IOMMU page tables.
> 
> Along the way we also add a small module to represent a core kernel
> address types (PhysicalAddr, DmaAddr, ResourceSize, Pfn). In the future,
> this might grow with helpers to make address math safer and more
> Rust-like.
> 
> Finally, add methods to:
> - Get a page's physical address
> - Convert an owned Page into its physical address
> - Convert a physical address back to its owned Page
> - Borrow a Page from a physical address, in both checked (with checks
>   that a struct page exists and is accessible as regular RAM) and not
>   checked forms (useful when the user knows the physaddr is valid,
>   for example because it got it from Page::into_phys()).
> 
> Of course, all but the first two have to be `unsafe` by nature, but that
> comes with the territory of writing low level memory management code.
> 
> These methods allow page table code to know the physical address of
> pages (needed to build intermediate level PTEs) and to essentially
> transfer ownership of the pages into the page table structure itself,
> and back into Page objects when freeing page tables. Without that, the
> code would have to keep track of page allocations in duplicate, once in
> Rust code and once in the page table structure itself, which is less
> desirable.
> 
> For Apple GPUs, the address space shared between firmware and the driver
> is actually pre-allocated by the bootloader, with the top level page
> table already pre-allocated, and the firmware owning some PTEs within it
> while the kernel populates others. This cooperation works well when the
> kernel can reference this top level page table by physical address. The
> only thing the driver needs to ensure is that it never attempts to free
> it in this case, nor the page tables corresponding to virtual address
> ranges it doesn't own. Without the ability to just borrow the
> pre-allocated top level page and access it, the driver would have to
> special-case this and manually manage the top level PTEs outside the
> main page table code, as well as introduce different page table
> configurations with different numbers of levels so the kernel's view is
> one lever shallower.
> 
> The physical address borrow feature is also useful to generate virtual
> address space dumps for crash dumps, including firmware pages. The
> intent is that firmware pages are configured in the Device Tree as
> reserved System RAM (without no-map), which creates struct page objects
> for them and makes them available in the kernel's direct map. Then the
> driver's page table code can walk the page tables and make a snapshot of
> the entire address space, including firmware code and data pages,
> pre-allocated shared segments, and driver-allocated objects (which are
> GEM objects), again without special casing anything. The checks in
> `Page::borrow_phys()` should ensure that the page is safe to access as
> RAM, so this will skip MMIO pages and anything that wasn't declared to
> the kernel in the DT.
> 
> Example usage:
> https://github.com/AsahiLinux/linux/blob/gpu/rust-wip/drivers/gpu/drm/asahi/pgtable.rs
> 
> The last patch is a minor cleanup to the Page abstraction noticed while
> preparing this series.
> 
> [1] https://lore.kernel.org/lkml/20241119112408.779243-1-abdiel.janulgue@gmail.com/T/#u
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> Asahi Lina (6):
>       rust: types: Add Ownable/Owned types
>       rust: page: Convert to Ownable
>       rust: page: Make with_page_mapped() and with_pointer_into_page() public
>       rust: addr: Add a module to declare core address types
>       rust: page: Add physical address conversion functions
>       rust: page: Make Page::as_ptr() pub(crate)
> 
>  rust/helpers/page.c  |  26 ++++++++++++
>  rust/kernel/addr.rs  |  15 +++++++
>  rust/kernel/lib.rs   |   1 +
>  rust/kernel/page.rs  | 101 ++++++++++++++++++++++++++++++++++++++--------
>  rust/kernel/types.rs | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 236 insertions(+), 17 deletions(-)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250202-rust-page-80892069fc78
> 
> Cheers,
> ~~ Lina
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
