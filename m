Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B841A265E;
	Thu,  6 Feb 2025 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870030; cv=none; b=vF5xBCWMbIohMH2Kbkh+Mp74GCZm3Bt7F0+olFmXroLnETtzXU437lo4QRMONyylrLkzxI9Chg75WthJQHhfdxexnHnqaxpkE9Oqimwtv0vihm5ineHTEJe53QPQpEP/WTCDxIVhtcy+lj4QDoZ7tgVPB0kleXZpv5qEEGXsxeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870030; c=relaxed/simple;
	bh=qHsDIMSnMO+UhiUHidlGUCZdOYjw5XeytvPgDK4sl7U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oHWt3KhC2x9iSos2cPYaG5KzK7/LqL7HYs/dvvhrAS9tw/2xwYlwy54xtC7Xm/Mo6sHRNlj4wbz3tFMvorSQrUeSff/xy9Y86eyTgOLBwQM5CWJgS68es73gqm9R+XbTW63a5w6yr1c0R19E9cwO/m3Lj9I/1M/B+sfbWPr1vnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=p46vPZlZ; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="p46vPZlZ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 341A243A93;
	Thu,  6 Feb 2025 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738870026;
	bh=qHsDIMSnMO+UhiUHidlGUCZdOYjw5XeytvPgDK4sl7U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=p46vPZlZFxUf1PpFJOUC/UW8cXEK7O2icsdPGVLA7R9Om0SPgD1xByZl4AciOBJYh
	 nHKBmrq4/LzYmL6Qqh09iOzYkkINCBsUL8+9CSm7+N9RxF6dqjZaSpwiaNmXDifnQ+
	 /mJg7YPC9hYxbdEyg6dzxIT70RP6WlnUUmxFGXuN4dfSMUysNs2ENyd1vXYdbRMnFm
	 O00lCUTn9xt/ZuuWEgGDTFYE2E0RMHA9psx0Y/o1ZZ6tV740p3zDozJ9W54AhphpUc
	 SLW4v+IuYpdTOue41UIpmsCy+YdaZatQi1ePz8XJZpzuo71yZFvoEqXxjTKPraPy+F
	 5lnv/HBbcXcFw==
Message-ID: <f042dcf3-10b9-4b58-9c98-5b83910ab188@asahilina.net>
Date: Fri, 7 Feb 2025 04:27:03 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
From: Asahi Lina <lina@asahilina.net>
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
 <cc1cd991-1871-4929-851e-d9672a45dcf0@asahilina.net>
 <6bcd3315-a0f9-463c-ab97-a43736f9b4f4@redhat.com>
 <2a513c3e-818c-4040-b3d3-7835861bab4f@asahilina.net>
 <0dffaa7d-340f-4ce1-9a2e-54cfd9079266@redhat.com>
 <bfc81fb0-917a-4518-851b-c7fcf3a91c5b@asahilina.net>
Content-Language: en-US
In-Reply-To: <bfc81fb0-917a-4518-851b-c7fcf3a91c5b@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/7/25 4:18 AM, Asahi Lina wrote:
> 
> 
> On 2/7/25 2:58 AM, David Hildenbrand wrote:
>> On 04.02.25 22:06, Asahi Lina wrote:
>>>
>>>
>>> On 2/5/25 5:10 AM, David Hildenbrand wrote:
>>>> On 04.02.25 18:59, Asahi Lina wrote:
>>>>> On 2/4/25 11:38 PM, David Hildenbrand wrote:
>>>>>>>>> If the answer is "no" then that's fine. It's still an unsafe
>>>>>>>>> function
>>>>>>>>> and we need to document in the safety section that it should
>>>>>>>>> only be
>>>>>>>>> used for memory that is either known to be allocated and pinned and
>>>>>>>>> will
>>>>>>>>> not be freed while the `struct page` is borrowed, or memory that is
>>>>>>>>> reserved and not owned by the buddy allocator, so in practice
>>>>>>>>> correct
>>>>>>>>> use would not be racy with memory hot-remove anyway.
>>>>>>>>>
>>>>>>>>> This is already the case for the drm/asahi use case, where the pfns
>>>>>>>>> looked up will only ever be one of:
>>>>>>>>>
>>>>>>>>> - GEM objects that are mapped to the GPU and whose physical
>>>>>>>>> pages are
>>>>>>>>> therefore pinned (and the VM is locked while this happens so the
>>>>>>>>> objects
>>>>>>>>> cannot become unpinned out from under the running code),
>>>>>>>>
>>>>>>>> How exactly are these pages pinned/obtained?
>>>>>>>
>>>>>>> Under the hood it's shmem. For pinning, it winds up at
>>>>>>> `drm_gem_get_pages()`, which I think does a
>>>>>>> `shmem_read_folio_gfp()` on
>>>>>>> a mapping set as unevictable.
>>>>>>
>>>>>> Thanks. So we grab another folio reference via shmem_read_folio_gfp()-
>>>>>>> shmem_get_folio_gfp().
>>>>>>
>>>>>> Hm, I wonder if we might end up holding folios residing in
>>>>>> ZONE_MOVABLE/
>>>>>> MIGRATE_CMA longer than we should.
>>>>>>
>>>>>> Compared to memfd_pin_folios(), which simulates FOLL_LONGTERM and
>>>>>> makes
>>>>>> sure to migrate pages out of ZONE_MOVABLE/MIGRATE_CMA.
>>>>>>
>>>>>> But that's a different discussion, just pointing it out, maybe I'm
>>>>>> missing something :)
>>>>>
>>>>> I think this is a little over my head. Though I only just realized that
>>>>> we seem to be keeping the GEM objects pinned forever, even after unmap,
>>>>> in the drm-shmem core API (I see no drm-shmem entry point that would
>>>>> allow the sgt to be freed and its corresponding pages ref to be
>>>>> dropped,
>>>>> other than a purge of purgeable objects or final destruction of the
>>>>> object). I'll poke around since this feels wrong, I thought we were
>>>>> supposed to be able to have shrinker support for swapping out whole GPU
>>>>> VMs in the modern GPU MM model, but I guess there's no
>>>>> implementation of
>>>>> that for gem-shmem drivers yet...?
>>>>
>>>> I recall that shrinker as well, ... or at least a discussion around it.
>>>>
>>>> [...]
>>>>
>>>>>>
>>>>>> If it's only for crash dumps etc. that might even be opt-in, it makes
>>>>>> the whole thing a lot less scary. Maybe this could be opt-in
>>>>>> somewhere,
>>>>>> to "unlock" this interface? Just an idea.
>>>>>
>>>>> Just to make sure we're on the same page, I don't think there's
>>>>> anything
>>>>> to unlock in the Rust abstraction side (this series). At the end of the
>>>>> day, if nothing else, the unchecked interface (which the regular
>>>>> non-crash page table management code uses for performance) will let you
>>>>> use any pfn you want, it's up to documentation and human review to
>>>>> specify how it should be used by drivers. What Rust gives us here is
>>>>> the
>>>>> mandatory `unsafe {}`, so any attempts to use this API will necessarily
>>>>> stick out during review as potentially dangerous code that needs extra
>>>>> scrutiny.
>>>>>
>>>>> For the client driver itself, I could gate the devcoredump stuff behind
>>>>> a module parameter or something... but I don't think it's really worth
>>>>> it. We don't have a way to reboot the firmware or recover from this
>>>>> condition (platform limitations), so end users are stuck rebooting to
>>>>> get back a usable machine anyway. If something goes wrong in the
>>>>> crashdump code and the machine oopses or locks up worse... it doesn't
>>>>> really make much of a difference for normal end users. I don't think
>>>>> this will ever really happen given the constraints I described, but if
>>>>> somehow it does (some other bug somewhere?), well... the machine was
>>>>> already in an unrecoverable state anyway.
>>>>>
>>>>> It would be nice to have userspace tooling deployed by default that
>>>>> saves off the devcoredump somewhere, so we can have a chance at
>>>>> debugging hard-to-hit firmware crashes... if it's opt-in, it would only
>>>>> really be useful for developers and CI machines.
>>>>
>>>> Is this something that possibly kdump can save or analyze? Because that
>>>> is our default "oops, kernel crashed, let's dump the old content so we
>>>> can dump it" mechanism on production systems.
>>>
>>> kdump does not work on Apple ARM systems because kexec is broken and
>>> cannot be fully fixed, due to multiple platform/firmware limitations. A
>>> very limited version of kexec might work well enough for kdump, but I
>>> don't think anyone has looked into making that work yet...
>>>
>>>> but ... I am not familiar with devcoredump. So I don't know when/how it
>>>> runs, and if the source system is still alive (and remains alive --  in
>>>> contrast to a kernel crash).
>>>
>>> Devcoredump just makes the dump available via /sys so it can be
>>> collected by the user. The system is still alive, the GPU is just dead
>>> and all future GPU job submissions fail. You can still SSH in or (at
>>> least in theory, if enough moving parts are graceful about it) VT-switch
>>> to a TTY. The display controller is not part of the GPU, it is separate
>>> hardware.
>>
>>
>> Thanks for all the details (and sorry for the delay, I'm on PTO until
>> Monday ... :)
>>
>> (regarding the other mail) Adding that stuff to rust just so we have a
>> devcoredump that ideally wouldn't exist is a bit unfortunate.
>>
>> So I'm curious: we do have /proc/kcore, where we do all of the required
>> filtering, only allowing for reading memory that is online, not
>> hwpoisoned etc.
>>
>> makedumpfile already supports /proc/kcore.
>>
>> Would it be possible to avoid Devcoredump completely either by dumping /
>> proc/kcore directly or by having a user-space script that walks the page
>> tables to dump the content purely based on /proc/kcore?
>>
>> If relevant memory ranges are inaccessible from /proc/kcore, we could
>> look into exposing them.
> 
> I'm not sure that's a good idea... the dump code runs when the GPU
> crashes, and makes copies of all the memory pages into newly allocated
> pages (this is around 16MB for a typical dump, and if allocation fails
> we just bail and clean up). Then userspace can read the coredump at its
> leisure. AIUI, this is exactly the intended use case of devcoredump. It
> also means that anyone can grab a core dump with just a `cp`, without
> needing any bespoke tools.
> 
> After the snapshot is taken, the kernel will complete (fail) all GPU
> jobs, which means much of the shared memory will be freed and some
> structures will change contents. If we defer the coredump to userspace,
> then it would not be able to capture the state of all relevant memory
> exactly at the crash time, which could be very confusing.
> 
> In theory I could change the allocators to not free or touch anything
> after a crash, and add guards to any mutations in the driver to avoid
> any changes after a crash... but that feels a lot more brittle and
> error-prone than just taking the core dump at the right time.
> 

If the arbitrary page lookups are that big a problem, I think I would
rather just memremap the all the bootloader-mapped firmware areas, hook
into all the allocators to provide a backdoor into the backing objects,
and just piece everything together by mapping page addresses to those.
It would be a bunch of extra code and scaffolding in the driver, and
require device tree and bootloader changes to link up the GPU node to
its firmware nodes, but it's still better than trying to do it all from
userspace IMO...

~~ Lina

