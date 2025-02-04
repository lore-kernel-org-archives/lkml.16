Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0E2165E6;
	Tue,  4 Feb 2025 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691968; cv=none; b=QLo1b16hYkRMedMI5W2r8lwYd6w1ggtPNJ7OmrMexAf14c6oNsK21rSIMMVo03o8fLLXXA/2ajr3ctK0vIG+A/VW4AR3qfjTE+XAMgm/BTx4psf/JwUmqKOfsG45elUDJ5VGPluZ/YNWDybQTDNcWtPbyBL8CNjmsEio1M1siGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691968; c=relaxed/simple;
	bh=/rVm9YEoZhdiOQ06BmWgyQh7ifYyYuNCFa4+cujve8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUBgnRj7j8epFG+DglWUmy/8YcsaGAoJM6hJxBuCyJY4ULNyL8FAJQmNNEG+2u/H5t+dO5lqV6GXXcMtdFwiLMqqV8ZOqmKwEmIaTWdTvJfQXRxkLfe/NNZJXm3ayfuPIMdk8vjcHi0+zpltDWfmo2TJbg4CDZTGc5N+pm8C0IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=XHJC4HKk; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="XHJC4HKk"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 1BC424331F;
	Tue,  4 Feb 2025 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738691956;
	bh=/rVm9YEoZhdiOQ06BmWgyQh7ifYyYuNCFa4+cujve8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XHJC4HKk2AmSYgF+J4GiNO1qFz0iplaSiElxa6DIw4pkkake8uMn40Xwd72JDNOOr
	 akIpDjTVZANc98/yJJW+EWQ89rvO3x2RVn6XWPpBYVVDIt6IT1Pc6DlvetkfvhePgK
	 HpLzWaDMwi3gSOajU70N7fHtkiQF3s4tncMwgsMHuu4JRbHJTZ5CuVANSmOHnriM8x
	 4LH8EIBngBKbM6hL9ZHJWfYi4RZ0c1g34I8GFp9ziShd/YMuB9S4fi0M2TX/TFjYHp
	 bzsQ+Od2aaE+p01jgQVSCSQT3tMfvvwlLDfoivawqIAXg1o+AnEo4vtDsnchhRiCnG
	 7fw5AWY61grQA==
Message-ID: <cc1cd991-1871-4929-851e-d9672a45dcf0@asahilina.net>
Date: Wed, 5 Feb 2025 02:59:13 +0900
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
 <1e9ae833-4293-4e48-83b2-c0af36cb3fdc@asahilina.net>
 <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/4/25 11:38 PM, David Hildenbrand wrote:
>>>> If the answer is "no" then that's fine. It's still an unsafe function
>>>> and we need to document in the safety section that it should only be
>>>> used for memory that is either known to be allocated and pinned and
>>>> will
>>>> not be freed while the `struct page` is borrowed, or memory that is
>>>> reserved and not owned by the buddy allocator, so in practice correct
>>>> use would not be racy with memory hot-remove anyway.
>>>>
>>>> This is already the case for the drm/asahi use case, where the pfns
>>>> looked up will only ever be one of:
>>>>
>>>> - GEM objects that are mapped to the GPU and whose physical pages are
>>>> therefore pinned (and the VM is locked while this happens so the
>>>> objects
>>>> cannot become unpinned out from under the running code),
>>>
>>> How exactly are these pages pinned/obtained?
>>
>> Under the hood it's shmem. For pinning, it winds up at
>> `drm_gem_get_pages()`, which I think does a `shmem_read_folio_gfp()` on
>> a mapping set as unevictable.
> 
> Thanks. So we grab another folio reference via shmem_read_folio_gfp()-
>>shmem_get_folio_gfp().
> 
> Hm, I wonder if we might end up holding folios residing in ZONE_MOVABLE/
> MIGRATE_CMA longer than we should.
> 
> Compared to memfd_pin_folios(), which simulates FOLL_LONGTERM and makes
> sure to migrate pages out of ZONE_MOVABLE/MIGRATE_CMA.
> 
> But that's a different discussion, just pointing it out, maybe I'm
> missing something :)

I think this is a little over my head. Though I only just realized that
we seem to be keeping the GEM objects pinned forever, even after unmap,
in the drm-shmem core API (I see no drm-shmem entry point that would
allow the sgt to be freed and its corresponding pages ref to be dropped,
other than a purge of purgeable objects or final destruction of the
object). I'll poke around since this feels wrong, I thought we were
supposed to be able to have shrinker support for swapping out whole GPU
VMs in the modern GPU MM model, but I guess there's no implementation of
that for gem-shmem drivers yet...?

That's a discussion for the DRM side though.

> 
>>
>> I'm not very familiar with the innards of that codepath, but it's
>> definitely an invariant that GEM objects have to be pinned while they
>> are mapped in GPU page tables (otherwise the GPU would end up accessing
>> freed memory).
> 
> Right, there must be a raised reference.
> 

[...]

>>>>>> Another case struct page can be freed is when hugetlb vmemmap
>>>>>> optimization
>>>>>> is used. Muchun (cc'd) is the maintainer of hugetlbfs.
>>>>>
>>>>> Here, the "struct page" remains valid though; it can still be
>>>>> accessed,
>>>>> although we disallow writes (which would be wrong).
>>>>>
>>>>> If you only allocate a page and free it later, there is no need to
>>>>> worry
>>>>> about either on the rust side.
>>>>
>>>> This is what the safe API does. (Also the unsafe physaddr APIs if all
>>>> you ever do is convert an allocated page to a physaddr and back, which
>>>> is the only thing the GPU page table code does during normal use. The
>>>> walking leaf PFNs story is only for GPU device coredumps when the
>>>> firmware crashes.)
>>>
>>> I would hope that we can lock down this interface as much as possible.
>>
>> Right, that's why the safe API never does any of the weird pfn->page
>> stuff. Rust driver code has to use unsafe {} to access the raw pfn->page
>> interface, which requires a // SAFETY comment explaining why what it's
>> doing is safe, and then we need to document in the function signature
>> what the safety requirements are so those comments can be reviewed.
>>
>>> Ideally, we would never go from pfn->page, unless
>>>
>>> (a) we remember somehow that we came from page->pfn. E.g., we allocated
>>>      these pages or someone else provided us with these pages. The
>>> memmap
>>>      cannot go away. I know it's hard.
>>
>> This is the common case for the page tables. 99% of the time this is
>> what the driver will be doing, with a single exception (the root page
>> table of the firmware/privileged VM is a system reserved memory region,
>> and falls under (b). It's one single page globally in the system.).
> 
> Makes sense.
> 
>>
>> The driver actually uses the completely unchecked interface in this
>> case, since it knows the pfns are definitely OK. I do a single check
>> with the checked interface at probe time for that one special-case pfn
>> so it can fail gracefully instead of oops if the DT config is
>> unusable/wrong.
>>
>>> (b) the pages are flagged as being special, similar to
>>>      __ioremap_check_ram().
>>
>> This only ever happens during firmware crash dumps (plus the one
>> exception above).
>>
>> The missing (c) case is the kernel/firmware shared memory GEM objects
>> during crash dumps.
> 
> If it's only for crash dumps etc. that might even be opt-in, it makes
> the whole thing a lot less scary. Maybe this could be opt-in somewhere,
> to "unlock" this interface? Just an idea.

Just to make sure we're on the same page, I don't think there's anything
to unlock in the Rust abstraction side (this series). At the end of the
day, if nothing else, the unchecked interface (which the regular
non-crash page table management code uses for performance) will let you
use any pfn you want, it's up to documentation and human review to
specify how it should be used by drivers. What Rust gives us here is the
mandatory `unsafe {}`, so any attempts to use this API will necessarily
stick out during review as potentially dangerous code that needs extra
scrutiny.

For the client driver itself, I could gate the devcoredump stuff behind
a module parameter or something... but I don't think it's really worth
it. We don't have a way to reboot the firmware or recover from this
condition (platform limitations), so end users are stuck rebooting to
get back a usable machine anyway. If something goes wrong in the
crashdump code and the machine oopses or locks up worse... it doesn't
really make much of a difference for normal end users. I don't think
this will ever really happen given the constraints I described, but if
somehow it does (some other bug somewhere?), well... the machine was
already in an unrecoverable state anyway.

It would be nice to have userspace tooling deployed by default that
saves off the devcoredump somewhere, so we can have a chance at
debugging hard-to-hit firmware crashes... if it's opt-in, it would only
really be useful for developers and CI machines.

There *is* a system-global devcoredump disable, but it's not exposed
outside of the devcoredump core. It just lets coredumps happen and then
throws away the result. It might be worth sending out a patch to expose
that to drivers, so they can skip the whole coredump generation
machinery if it's unnecessary.

>> But I really need those to diagnose firmware
>> crashes. Of course, I could dump them separately through other APIs in
>> principle, but that would complicate the crashdump code quite a bit
>> since I'd have to go through all the kernel GPU memory allocators and
>> dig out all their backing GEM objects and copy the memory through their
>> vmap (they are all vmapped, which is yet another reason in practice the
>> pages are pinned) and merge it into the coredump file. I also wouldn't
>> have easy direct access to the matching GPU PTEs if I do that (I store
>> the PTE permission/caching bits in the coredump file, since those are
>> actually kind of critical to diagnose exactly what happened, as caching
>> issues are one major cause of firmware problems). Since I need the page
>> table walker code to grab the firmware pages anyway, I hope I can avoid
>> having to go through a completely different codepath for the kernel GEM
>> objects...
> 
> Makes sense.
> 

~~ Lina

