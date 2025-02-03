Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036FD2080E6;
	Mon,  3 Feb 2025 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593149; cv=none; b=Ht0T3Ec4Fbr71YSWG/L55pv2OHlC4EinuNPZ3wuoC1E7UxsZ+whLMS8f/vrJtmy5VfSN/G04Mm+GEMlkhsBgzEf88v0KCOslIbBnkWtBZGn/rFDbTl2Lh5/zmQIsOctFLDmxplbtaAPj5xU6ow39iloPgUh5Acnw13mz+YLotr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593149; c=relaxed/simple;
	bh=o2atDu1PWcl9Kgs88c64C/EyOfqDqKG+Y34fJ02LYlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XHNE/0DOjV5YPxGPtNwrNUCQzQCUrAjnHai7hy0k7hSvnIHArc5UfNab9MB5jcLpja1eePpwZRc7GKs2eod5oP4DpApfHgpU7G/NmgFlzposPs8/JuWUUU9Ka47ehxlvghoupy71IfVOmQ32jrVeod5Ez8IonQbYOVAt5tJt5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=zZtvrsfE; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="zZtvrsfE"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D59D13FA6A;
	Mon,  3 Feb 2025 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738593144;
	bh=o2atDu1PWcl9Kgs88c64C/EyOfqDqKG+Y34fJ02LYlY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=zZtvrsfEWZHYSIaS690wPRQu+ZMjSgYb3OctW6aa1PyNYqyc83s12Dv/5OyJkfOaG
	 l038s4t7eFIhWV1biQVmOXMrTF3Mud7NAxnfp5Bg+hY7RRhj9poKYb0ut0Gs4ZrIt6
	 FqC/yck1wBkJn+9d0DtVu63mR7alYox6d0aRIAwZaLwDAQ50gEjqcMXtyWJv9fy71N
	 +pp2fMaqyYMW4Xv5BJJEsqr58mJq9ne7vhI1bblz4fdaumqbfwHD8bmWKSGiF26Zsk
	 lF+CEx7Tvv46k9mp5Qim4msJFFx/9cXzCvQA51YCKUrqVjuHCGrlfY3WAGLSfz789c
	 6QFtir98VcDgA==
Message-ID: <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
Date: Mon, 3 Feb 2025 23:32:21 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Z6CTLB2NggwYafi9@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/3/25 6:58 PM, Simona Vetter wrote:
> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>> This series refactors the existing Page wrapper to support borrowing
>> `struct page` objects without ownership on the Rust side, and converting
>> page references to/from physical memory addresses.
>>
>> The series overlaps with the earlier submission in [1] and follows a
>> different approach, based on the discussion that happened there.
>>
>> The primary use case for this is implementing IOMMU-style page table
>> management in Rust. This allows drivers for IOMMUs and MMU-containing
>> SoC devices to be written in Rust (such as embedded GPUs). The intended
>> logic is similar to how ARM SMMU page tables are managed in the
>> drivers/iommu tree.
>>
>> First, introduce a concept of Owned<T> and an Ownable trait. These are
>> similar to ARef<T> and AlwaysRefCounted, but are used for types which
>> are not ref counted but rather have a single intended owner.
>>
>> Then, refactor the existing Page support to use the new mechanism. Pages
>> returned from the page allocator are not intended to be ref counted by
>> consumers (see previous discussion in [1]), so this keeps Rust's view of
>> page ownership as a simple "owned or not". Of course, this is still
>> composable as Arc<Owned<Page>> if Rust code needs to reference count its
>> own Page allocations for whatever reason.
> 
> I think there's a bit a potential mess here because the conversion to
> folios isn't far enough yet that we can entirely ignore page refcounts and
> just use folio refcounts. But I guess we can deal with that oddity if we
> hit it (maybe folio conversion moves fast enough), since this only really
> starts to become relevant for hmm/svm gpu stuff.
> 
> iow I think anticipating the future where struct page really doesn't have
> a refcount is the right move. Aside from that it's really not a refcount
> that works in the rust ARef sense, since struct page cannot disappear for
> system memory, and for dev_pagemap memory it's an entirely different
> reference you need (and then there's a few more special cases).

Right, as far as this abstraction is concerned, all that needs to hold
is that:

- alloc_pages() and __free_pages() work as intended, however that may
be, to reserve and return one page (for now, though I think extending
the Rust abstraction to handle higher-order folios is pretty easy, but
that can happen later).
- Whatever borrows pages knows what it's doing. In this case there's
only support for borrowing pages by physaddr, and it's only going to be
used in a driver for a platform without memory hot remove (so far) and
only for pages which have known usage (in principle) and are either
explicitly allocated or known pinned or reserved, so it's not a problem
right now. Future abstractions that return borrowed pages can do their
own locking/bookkeeping/whatever is necessary to keep it safe.

I would like to hear how memory hot-remove is supposed to work though,
to see if we should be doing something to make the abstraction safer
(though it's still unsafe and always will be). Is there a chance a
`struct page` could vanish out from under us under some conditions?

For dev_pagemap memory I imagine we'd have an entirely different
abstraction wrapping that, that can just return a borrowed &Page to give
the user access to page operations without going through Owned<Page>.

> For dma/iommu stuff there's also a push to move towards pfn + metadata
> model, so that p2pdma doesn't need struct page. But I haven't looked into
> that much yet.

Yeah, I don't know how that stuff works...

> 
> Cheers, Sima
> 
>> Then, make some existing private methods public, since this is needed to
>> reasonably use allocated pages as IOMMU page tables.
>>
>> Along the way we also add a small module to represent a core kernel
>> address types (PhysicalAddr, DmaAddr, ResourceSize, Pfn). In the future,
>> this might grow with helpers to make address math safer and more
>> Rust-like.
>>
>> Finally, add methods to:
>> - Get a page's physical address
>> - Convert an owned Page into its physical address
>> - Convert a physical address back to its owned Page
>> - Borrow a Page from a physical address, in both checked (with checks
>>   that a struct page exists and is accessible as regular RAM) and not
>>   checked forms (useful when the user knows the physaddr is valid,
>>   for example because it got it from Page::into_phys()).
>>
>> Of course, all but the first two have to be `unsafe` by nature, but that
>> comes with the territory of writing low level memory management code.
>>
>> These methods allow page table code to know the physical address of
>> pages (needed to build intermediate level PTEs) and to essentially
>> transfer ownership of the pages into the page table structure itself,
>> and back into Page objects when freeing page tables. Without that, the
>> code would have to keep track of page allocations in duplicate, once in
>> Rust code and once in the page table structure itself, which is less
>> desirable.
>>
>> For Apple GPUs, the address space shared between firmware and the driver
>> is actually pre-allocated by the bootloader, with the top level page
>> table already pre-allocated, and the firmware owning some PTEs within it
>> while the kernel populates others. This cooperation works well when the
>> kernel can reference this top level page table by physical address. The
>> only thing the driver needs to ensure is that it never attempts to free
>> it in this case, nor the page tables corresponding to virtual address
>> ranges it doesn't own. Without the ability to just borrow the
>> pre-allocated top level page and access it, the driver would have to
>> special-case this and manually manage the top level PTEs outside the
>> main page table code, as well as introduce different page table
>> configurations with different numbers of levels so the kernel's view is
>> one lever shallower.
>>
>> The physical address borrow feature is also useful to generate virtual
>> address space dumps for crash dumps, including firmware pages. The
>> intent is that firmware pages are configured in the Device Tree as
>> reserved System RAM (without no-map), which creates struct page objects
>> for them and makes them available in the kernel's direct map. Then the
>> driver's page table code can walk the page tables and make a snapshot of
>> the entire address space, including firmware code and data pages,
>> pre-allocated shared segments, and driver-allocated objects (which are
>> GEM objects), again without special casing anything. The checks in
>> `Page::borrow_phys()` should ensure that the page is safe to access as
>> RAM, so this will skip MMIO pages and anything that wasn't declared to
>> the kernel in the DT.
>>
>> Example usage:
>> https://github.com/AsahiLinux/linux/blob/gpu/rust-wip/drivers/gpu/drm/asahi/pgtable.rs
>>
>> The last patch is a minor cleanup to the Page abstraction noticed while
>> preparing this series.
>>
>> [1] https://lore.kernel.org/lkml/20241119112408.779243-1-abdiel.janulgue@gmail.com/T/#u
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>> Asahi Lina (6):
>>       rust: types: Add Ownable/Owned types
>>       rust: page: Convert to Ownable
>>       rust: page: Make with_page_mapped() and with_pointer_into_page() public
>>       rust: addr: Add a module to declare core address types
>>       rust: page: Add physical address conversion functions
>>       rust: page: Make Page::as_ptr() pub(crate)
>>
>>  rust/helpers/page.c  |  26 ++++++++++++
>>  rust/kernel/addr.rs  |  15 +++++++
>>  rust/kernel/lib.rs   |   1 +
>>  rust/kernel/page.rs  | 101 ++++++++++++++++++++++++++++++++++++++--------
>>  rust/kernel/types.rs | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 236 insertions(+), 17 deletions(-)
>> ---
>> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
>> change-id: 20250202-rust-page-80892069fc78
>>
>> Cheers,
>> ~~ Lina
>>
> 

~~ Lina

