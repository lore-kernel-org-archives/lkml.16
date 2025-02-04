Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7735D14A4F0;
	Tue,  4 Feb 2025 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669325; cv=none; b=YI24+HZ1oKWyvqokTqKgyLEHPojqOkfz9vxvN9ThdDrki1haOYHaKXQr8fqXL1HzZCezUQj9uzrqAJRNqbbMyVA3dru9jeqnJRLtlYLnkTzcGu+NjhvVrJHBt6Eso5PdwDmgJ/nPWiD7SUVxKposrz1D9l/EIrcjKZCn7B1Ioak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669325; c=relaxed/simple;
	bh=YcqqO/hrKpo9hyJephw1EAUxvsRF8MKK/O43246BHlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u72p+kGg3H1SjI6Bx8D7+MDQDk2d8XmLlcsjiha35rAQ4uSummWEaneOZsXMC56Jnb/dHrfzg/m0kT2O+u/l47aLDE6sNI3YGkSvnoiSTMzKdmzQBlNNJ6bdV5TKzn8BuwYJf8G8E6rt14zPbpfJr5y1NIekwDF2reY+ayQ4nTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=B3GZvqud; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="B3GZvqud"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 92E15431CA;
	Tue,  4 Feb 2025 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738669319;
	bh=YcqqO/hrKpo9hyJephw1EAUxvsRF8MKK/O43246BHlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B3GZvqudUEanyornP5hwIXCocoa99uQbmbRC7DxtDYIXKnaj9mYK6LmR+/Y5xu/ao
	 c5RIuCcVSVMPhyTSoBNuaY34hzMOsRsHAoKSJJ9K7TA1vKaC6ArHKmvMPaVk6fJbBl
	 CRVMgzK8Vbr1R5+5Q+9i4mfNEbovKiWZ4A716pxEIGdCuC4n6LQWFsSvnvadr/nWsX
	 kdzbK1g+lftrNDR8knp6K/vku8vrkRdIthyZr7NXuL8ify7YwFHIHU0fNbYNshdmDc
	 RQYtQ+1vbKzvFd2IvUvqukLZb1wi59lGBCPlp/ujfINu7WhUqzGVsvqz6ulg+a0XdB
	 vkXA9Hq6NvmOQ==
Message-ID: <82047858-480a-45e3-b826-3a46fbebe842@asahilina.net>
Date: Tue, 4 Feb 2025 20:41:55 +0900
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
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <0e19e1c3-293b-4740-93f3-2c410893288b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/4/25 7:26 PM, David Hildenbrand wrote:
> On 03.02.25 22:05, Zi Yan wrote:
>> On 3 Feb 2025, at 9:32, Asahi Lina wrote:
>>
>>> On 2/3/25 6:58 PM, Simona Vetter wrote:
>>>> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>>>>> This series refactors the existing Page wrapper to support borrowing
>>>>> `struct page` objects without ownership on the Rust side, and
>>>>> converting
>>>>> page references to/from physical memory addresses.
>>>>>
>>>>> The series overlaps with the earlier submission in [1] and follows a
>>>>> different approach, based on the discussion that happened there.
>>>>>
>>>>> The primary use case for this is implementing IOMMU-style page table
>>>>> management in Rust. This allows drivers for IOMMUs and MMU-containing
>>>>> SoC devices to be written in Rust (such as embedded GPUs). The
>>>>> intended
>>>>> logic is similar to how ARM SMMU page tables are managed in the
>>>>> drivers/iommu tree.
>>>>>
>>>>> First, introduce a concept of Owned<T> and an Ownable trait. These are
>>>>> similar to ARef<T> and AlwaysRefCounted, but are used for types which
>>>>> are not ref counted but rather have a single intended owner.
>>>>>
>>>>> Then, refactor the existing Page support to use the new mechanism.
>>>>> Pages
>>>>> returned from the page allocator are not intended to be ref counted by
>>>>> consumers (see previous discussion in [1]), so this keeps Rust's
>>>>> view of
>>>>> page ownership as a simple "owned or not". Of course, this is still
>>>>> composable as Arc<Owned<Page>> if Rust code needs to reference
>>>>> count its
>>>>> own Page allocations for whatever reason.
>>>>
>>>> I think there's a bit a potential mess here because the conversion to
>>>> folios isn't far enough yet that we can entirely ignore page
>>>> refcounts and
>>>> just use folio refcounts. But I guess we can deal with that oddity
>>>> if we
>>>> hit it (maybe folio conversion moves fast enough), since this only
>>>> really
>>>> starts to become relevant for hmm/svm gpu stuff.
>>>>
>>>> iow I think anticipating the future where struct page really doesn't
>>>> have
>>>> a refcount is the right move. Aside from that it's really not a
>>>> refcount
>>>> that works in the rust ARef sense, since struct page cannot
>>>> disappear for
>>>> system memory, and for dev_pagemap memory it's an entirely different
>>>> reference you need (and then there's a few more special cases).
>>>
>>> Right, as far as this abstraction is concerned, all that needs to hold
>>> is that:
>>>
>>> - alloc_pages() and __free_pages() work as intended, however that may
>>> be, to reserve and return one page (for now, though I think extending
>>> the Rust abstraction to handle higher-order folios is pretty easy, but
>>> that can happen later).
>>> - Whatever borrows pages knows what it's doing. In this case there's
>>> only support for borrowing pages by physaddr, and it's only going to be
>>> used in a driver for a platform without memory hot remove (so far) and
>>> only for pages which have known usage (in principle) and are either
>>> explicitly allocated or known pinned or reserved, so it's not a problem
>>> right now. Future abstractions that return borrowed pages can do their
>>> own locking/bookkeeping/whatever is necessary to keep it safe.
>>>
>>> I would like to hear how memory hot-remove is supposed to work though,
>>> to see if we should be doing something to make the abstraction safer
>>> (though it's still unsafe and always will be). Is there a chance a
>>> `struct page` could vanish out from under us under some conditions?
>>
>> Add DavidH and OscarS for memory hot-remove questions.
>>
>> IIUC, struct page could be freed if a chunk of memory is hot-removed.
> 
> Right, but only after there are no users anymore (IOW, memory was freed
> back to the buddy). PFN walkers might still stumble over them, but I
> would not expect (or recommend) rust to do that.

The physaddr to page function does look up pages by pfn, but it's
intended to be used by drivers that know what they're doing. There are
two variants of the API, one that is completely unchecked (a fast path
for cases where the driver definitely allocated these pages itself, for
example just grabbing the `struct page` back from a decoded PTE it
wrote), and one that has this check:

pfn_valid(pfn) && page_is_ram(pfn)

Which is intended as a safety net to allow drivers to look up
firmware-reserved pages too, and fail gracefully if the kernel doesn't
know about them (because they weren't declared in the
bootloader/firmware memory map correctly) or doesn't have them mapped in
the direct map (because they were declared no-map).

Is there anything else that can reasonably be done here to make the API
safer to call on an arbitrary pfn?

If the answer is "no" then that's fine. It's still an unsafe function
and we need to document in the safety section that it should only be
used for memory that is either known to be allocated and pinned and will
not be freed while the `struct page` is borrowed, or memory that is
reserved and not owned by the buddy allocator, so in practice correct
use would not be racy with memory hot-remove anyway.

This is already the case for the drm/asahi use case, where the pfns
looked up will only ever be one of:

- GEM objects that are mapped to the GPU and whose physical pages are
therefore pinned (and the VM is locked while this happens so the objects
cannot become unpinned out from under the running code),
- Raw pages allocated from the page allocator for use as GPU page tables,
- System memory that is marked reserved by the firmware/bootloader,
- (Potentially) invalid PFNs that aren't part of the System RAM region
at all and don't have a struct page to begin with, which we check for,
so the API returns an error. This would only happen if the bootloader
didn't declare some used firmware ranges at all, so Linux doesn't know
about them.

> 
>>
>> Another case struct page can be freed is when hugetlb vmemmap
>> optimization
>> is used. Muchun (cc'd) is the maintainer of hugetlbfs.
> 
> Here, the "struct page" remains valid though; it can still be accessed,
> although we disallow writes (which would be wrong).
> 
> If you only allocate a page and free it later, there is no need to worry
> about either on the rust side.

This is what the safe API does. (Also the unsafe physaddr APIs if all
you ever do is convert an allocated page to a physaddr and back, which
is the only thing the GPU page table code does during normal use. The
walking leaf PFNs story is only for GPU device coredumps when the
firmware crashes.)

~~ Lina

