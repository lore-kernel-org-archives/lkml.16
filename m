Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3F721127D;
	Tue,  4 Feb 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674363; cv=none; b=B/APSUvCfMTv6dE5XDS8xdkhVkbVlVDgTFXX5n9ChFLEVMi4+4syOTUNs5hbBTp346C4NmNj8bi/lUa2bkye7PXTcA2m5ucDUdxmAU3bFsVB+rFpvxKNDbcJJ77LWDWp5BfgElFTIY+zAQHvY5dIM+GxmwJ/Aqruykr1EsMojh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674363; c=relaxed/simple;
	bh=JtJpZ9JBg5RMa5R66H7G5tBoKD7wUf+pEfL69vJi/hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZjB/SR3GCa+qVVTMMn1VupVsI2lJmgtOfh4q5QAQHKYwbjy0s11Lv3BS7Ahfm4hPqV6QZ8CEaJpaG/UaAXMXeSIBKECqHb/AArBV0nbFCkMV88gSxQnTUSTnyMfB01ydhkKKYHU0M9y3Qc1Gb19T+HhYO15VGPFCtCtohw3uN7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=JZj/AK23; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="JZj/AK23"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 6F997431CA;
	Tue,  4 Feb 2025 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738674353;
	bh=JtJpZ9JBg5RMa5R66H7G5tBoKD7wUf+pEfL69vJi/hk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JZj/AK230WWVFZSYwpKbzwfvAuQltV+/J9aH+mPhEfG2V6eoZ19CrmBzpbnnx7cIz
	 Nt8sFsF1nzsfukcW6YJpzf3n7J9RmOMDpSTZl/0MYuZj2W/YU9rerq6RtlqFFP15aw
	 KSbdvUlFRm61deoGjuGJKiBWrQ9HGZn4cLxt7JjcTHGqMNhVaY/A1kwnb8c6fPcCCY
	 ZIl7J0xxp3VqMFE+88kFhhqYUh2OOq61iO8GUs8TYeDaMZOjCqOBYoe/jgKg/Trnqs
	 Wi4/Jo5dK9LQurSj8ilZdDrqklw68cQ8y5qqQedCQNWGBlyBavq0R3gvUjiQSRF8iM
	 F0vTel4kjjmsw==
Message-ID: <1e9ae833-4293-4e48-83b2-c0af36cb3fdc@asahilina.net>
Date: Tue, 4 Feb 2025 22:05:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
 asahi@lists.linux.dev, Oscar Salvador <osalvador@suse.de>,
 Muchun Song <muchun.song@linux.dev>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
 <37A0729B-A711-4D45-B9F0-328FDB9ADD28@nvidia.com>
 <0e19e1c3-293b-4740-93f3-2c410893288b@redhat.com>
 <82047858-480a-45e3-b826-3a46fbebe842@asahilina.net>
 <f1498b22-0bc1-489a-8c2c-35aa48c7fe7d@redhat.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <f1498b22-0bc1-489a-8c2c-35aa48c7fe7d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/4/25 8:59 PM, David Hildenbrand wrote:
>>>> Add DavidH and OscarS for memory hot-remove questions.
>>>>
>>>> IIUC, struct page could be freed if a chunk of memory is hot-removed.
>>>
>>> Right, but only after there are no users anymore (IOW, memory was freed
>>> back to the buddy). PFN walkers might still stumble over them, but I
>>> would not expect (or recommend) rust to do that.
>>
>> The physaddr to page function does look up pages by pfn, but it's
>> intended to be used by drivers that know what they're doing. There are
>> two variants of the API, one that is completely unchecked (a fast path
>> for cases where the driver definitely allocated these pages itself, for
>> example just grabbing the `struct page` back from a decoded PTE it
>> wrote), and one that has this check:
>>
>> pfn_valid(pfn) && page_is_ram(pfn)
>>
>> Which is intended as a safety net to allow drivers to look up
>> firmware-reserved pages too, and fail gracefully if the kernel doesn't
>> know about them (because they weren't declared in the
>> bootloader/firmware memory map correctly) or doesn't have them mapped in
>> the direct map (because they were declared no-map).
>> > Is there anything else that can reasonably be done here to make the API
>> safer to call on an arbitrary pfn?
> 
> In PFN walkers we use pfn_to_online_page() to make sure that (1) the
> memmap really exists; and (2) that it has meaning (e.g., was actually
> initialized).
> 
> It can still race with memory offlining, and it refuses ZONE_DEVICE
> pages. For the latter, we have a different way to check validity. See
> memory_failure() that first calls pfn_to_online_page() to then check
> get_dev_pagemap().

I'll give it a shot with these functions. If they work for my use case,
then it's good to have extra checks and I'll add them for v2. Thanks!

> 
>>
>> If the answer is "no" then that's fine. It's still an unsafe function
>> and we need to document in the safety section that it should only be
>> used for memory that is either known to be allocated and pinned and will
>> not be freed while the `struct page` is borrowed, or memory that is
>> reserved and not owned by the buddy allocator, so in practice correct
>> use would not be racy with memory hot-remove anyway.
>>
>> This is already the case for the drm/asahi use case, where the pfns
>> looked up will only ever be one of:
>>
>> - GEM objects that are mapped to the GPU and whose physical pages are
>> therefore pinned (and the VM is locked while this happens so the objects
>> cannot become unpinned out from under the running code),
> 
> How exactly are these pages pinned/obtained?

Under the hood it's shmem. For pinning, it winds up at
`drm_gem_get_pages()`, which I think does a `shmem_read_folio_gfp()` on
a mapping set as unevictable.

I'm not very familiar with the innards of that codepath, but it's
definitely an invariant that GEM objects have to be pinned while they
are mapped in GPU page tables (otherwise the GPU would end up accessing
freed memory).

Since the code that walks the PT to dump pages is part of the same PT
object and takes a mutable reference, the Rust guarantees mean it's
impossible for the PT to be concurrently mutated or anything like that.
So if one of these objects *were* unpinned/freed somehow while the dump
code is running, that would be a major bug somewhere else, since there
would be dangling PTEs left over.

In practice, there's a big lock around each PT/VM at a higher level of
the driver, so any attempts to unmap/free any of those objects will be
stuck waiting for the lock on the VM they are mapped into.

> 
>> - Raw pages allocated from the page allocator for use as GPU page tables,
> 
> That makes sense.
> 
>> - System memory that is marked reserved by the firmware/bootloader,
> 
> E.g., in arch/x86/mm/ioremap.c:__ioremap_check_ram() we refuse anything
> that has a valid memmap and is *not* marked as PageReserved, to prevent
> remapping arbitrary *real* RAM.
> 
> Is that case here similar?

I don't have an explicit check for that here but yes, the pages wind up
marked PageReserved. This includes both no-map ranges and map ranges.
The no-map ranges also have a valid struct page if within the declared
RAM range but they would oops if we try to access the contents via
direct map, so the page_is_ram() check is there to reject those (and
MMIO and anything else that isn't normally mapped as RAM even if it
winds up with a struct page).

>> - (Potentially) invalid PFNs that aren't part of the System RAM region
>> at all and don't have a struct page to begin with, which we check for,
>> so the API returns an error. This would only happen if the bootloader
>> didn't declare some used firmware ranges at all, so Linux doesn't know
>> about them.
>>
>>>
>>>>
>>>> Another case struct page can be freed is when hugetlb vmemmap
>>>> optimization
>>>> is used. Muchun (cc'd) is the maintainer of hugetlbfs.
>>>
>>> Here, the "struct page" remains valid though; it can still be accessed,
>>> although we disallow writes (which would be wrong).
>>>
>>> If you only allocate a page and free it later, there is no need to worry
>>> about either on the rust side.
>>
>> This is what the safe API does. (Also the unsafe physaddr APIs if all
>> you ever do is convert an allocated page to a physaddr and back, which
>> is the only thing the GPU page table code does during normal use. The
>> walking leaf PFNs story is only for GPU device coredumps when the
>> firmware crashes.)
> 
> I would hope that we can lock down this interface as much as possible.

Right, that's why the safe API never does any of the weird pfn->page
stuff. Rust driver code has to use unsafe {} to access the raw pfn->page
interface, which requires a // SAFETY comment explaining why what it's
doing is safe, and then we need to document in the function signature
what the safety requirements are so those comments can be reviewed.

> Ideally, we would never go from pfn->page, unless
> 
> (a) we remember somehow that we came from page->pfn. E.g., we allocated
>     these pages or someone else provided us with these pages. The memmap
>     cannot go away. I know it's hard.

This is the common case for the page tables. 99% of the time this is
what the driver will be doing, with a single exception (the root page
table of the firmware/privileged VM is a system reserved memory region,
and falls under (b). It's one single page globally in the system.).

The driver actually uses the completely unchecked interface in this
case, since it knows the pfns are definitely OK. I do a single check
with the checked interface at probe time for that one special-case pfn
so it can fail gracefully instead of oops if the DT config is
unusable/wrong.

> (b) the pages are flagged as being special, similar to
>     __ioremap_check_ram().

This only ever happens during firmware crash dumps (plus the one
exception above).

The missing (c) case is the kernel/firmware shared memory GEM objects
during crash dumps. But I really need those to diagnose firmware
crashes. Of course, I could dump them separately through other APIs in
principle, but that would complicate the crashdump code quite a bit
since I'd have to go through all the kernel GPU memory allocators and
dig out all their backing GEM objects and copy the memory through their
vmap (they are all vmapped, which is yet another reason in practice the
pages are pinned) and merge it into the coredump file. I also wouldn't
have easy direct access to the matching GPU PTEs if I do that (I store
the PTE permission/caching bits in the coredump file, since those are
actually kind of critical to diagnose exactly what happened, as caching
issues are one major cause of firmware problems). Since I need the page
table walker code to grab the firmware pages anyway, I hope I can avoid
having to go through a completely different codepath for the kernel GEM
objects...

~~ Lina

