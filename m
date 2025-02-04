Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD7213259
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679906; cv=none; b=A/kCjunRyTek4XhCgJWq5CzKQ9L2eRpc4ngZg0niuePz2P8GTzclaNc7W92gauJ1Xl+8Gwab1cmYJhPq1uffyu6hYmLFmA590i04Ftf2gptqX1KoXnHf4uQjYij8G2K6INhHXOOnaSFx74Alsu3VsxIkk8uRsw/AfYzfQ/sBves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679906; c=relaxed/simple;
	bh=hXau5O2caZ7rp1JWyuOqifzJ9dhaYosNTmRPUETvFdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCE2DsxTeq050/praQ1lY1p6DGmiIzMrL73PrI13F6KNGku1Vlt9EfTxsblFeifTG/6z09R7D9FTzW7djhDIbx89/hltklyFVwdocrA4PBOb5ssL8oXhZeCiqXRloLhvmJ5PCj1pPEI5TM/51Ucu3Tz/6aOyhbMhr+U3N8EFO/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEkGbTz6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cEkGbTz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738679903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0e0mruGnMwGPmc/NrxBHwwuLHVLUaZKdPzjoEYXvcj0=;
	b=cEkGbTz6ZBf+V8+DYveyec1GXpYE6eixOIlkYzggD6pdsgAQ341TDFeg83MdU9+E0nxYrN
	JNxcvev8AtK68v/tjxV0Id8o+yHWvyQWzy7vQARggPgK1Djdh19HTCp1Agz1UjtM/RauT7
	Zrj+nZTbzmM2tzauxrjbbotu1O0hj+s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-huh-KShJNmap_u6ZJa_taA-1; Tue, 04 Feb 2025 09:38:22 -0500
X-MC-Unique: huh-KShJNmap_u6ZJa_taA-1
X-Mimecast-MFC-AGG-ID: huh-KShJNmap_u6ZJa_taA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so29674425e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679901; x=1739284701;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0e0mruGnMwGPmc/NrxBHwwuLHVLUaZKdPzjoEYXvcj0=;
        b=W1Hw1CbetTkKJYpB5fFUMkfjrK346VMg5gu7h/PI4BHNBKcJnSSkqaDK30vBE5mXt2
         Pcd5kTzGoKiq/D8+9xHcgubU4BzE5KpV53nqwSIyMu84nFNTlt5DLlmhjHvPMal8aoCG
         qVvOXhUv892v3cV/paRsSUnQhjneYqSmIFBTFflI6pzj7appdzjRxrJgMaDnkSfe3e/9
         pw2wf4QyjMjquo9r66ymJ/KKv/x4GxRNnXZ+n0ePSIt0qCouHhnOvLE+c/Mz3V7hiXGP
         pLtUrndG99cv7JEKRTgkiQaj8hUAH+bqRf3Q1uStkNx3WCq21jHAUMHmGaKAViU9kPTG
         aPRA==
X-Forwarded-Encrypted: i=1; AJvYcCVO5LDGHp1Kd0HIDz3pw1y9iX2AuU+a4MDzQ2EtJQBE68wtjwhpiNo5cPzIyMMCSo1sqeQAjnrXsK90HtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtiYkhEqpKfFpU7rVpfUKaXt4kG7k7S8goGDe6qPUnkoV0s8lS
	PvtOrOXuu6adTvtbQT+mLmeDB1uMGZW9WdhcCgCisHtwt8teeiEGV9GJMoaERxG2MR+xBacn9BX
	nb5i4C3DlfSz8MSmyCtvcZXxvEfTYHbSrMNeOmYiHUDDHLb9VPUbCJSzKs8ihSA==
X-Gm-Gg: ASbGnctuv1+J1EnqX6UDN8LUoNcUCsbz4hpXGE9fBQwcVzKJQhOhpqDTyxx8BahTYWs
	HFthuuioK1xWOLZpJY4O0cwnAIQ3HZ+XkXRA+8pc7d7mtbKuBKC4BeHW+/qEvvQGBg+GLaeVGK7
	xwhf3DcMcQJcECld73u4QYhuCoFYj49r+oz3kxB7PYTWcHa+M/pfLG3ASWp0TXIEF+klRZKU8PZ
	4UU+XZXoFwzwzrXlpfRFOt+3Qt3aT/mYoh/47Am7ghd7ad/mIgvCJ0Zbj9vkqXw/mvuoatLVyCG
	rYLsVArfdiyT8SWDOVebzUzQP+2+NHwn34wzIcXxBqW2lAntaHVmdi0aldowpvOvB/TWe8WVRMS
	1EqnIGuXN1eNlrACXzOtKqnWsGz4=
X-Received: by 2002:a5d:5988:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38c5167b477mr23236912f8f.0.1738679901122;
        Tue, 04 Feb 2025 06:38:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI4IGrCFQbb7RqQRviN6FtHZtDEVfjbcBsjFUO9cGnzjF7imq8c25U7i1e04iqyZI5RcWbxw==
X-Received: by 2002:a5d:5988:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38c5167b477mr23236872f8f.0.1738679900227;
        Tue, 04 Feb 2025 06:38:20 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1028d0sm15707943f8f.25.2025.02.04.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 06:38:19 -0800 (PST)
Message-ID: <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
Date: Tue, 4 Feb 2025 15:38:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Asahi Lina <lina@asahilina.net>, Zi Yan <ziy@nvidia.com>
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1e9ae833-4293-4e48-83b2-c0af36cb3fdc@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> It can still race with memory offlining, and it refuses ZONE_DEVICE
>> pages. For the latter, we have a different way to check validity. See
>> memory_failure() that first calls pfn_to_online_page() to then check
>> get_dev_pagemap().
> 
> I'll give it a shot with these functions. If they work for my use case,
 > then it's good to have extra checks and I'll add them for v2. Thanks!

Let me know if you run into any issues.

> 
>>
>>>
>>> If the answer is "no" then that's fine. It's still an unsafe function
>>> and we need to document in the safety section that it should only be
>>> used for memory that is either known to be allocated and pinned and will
>>> not be freed while the `struct page` is borrowed, or memory that is
>>> reserved and not owned by the buddy allocator, so in practice correct
>>> use would not be racy with memory hot-remove anyway.
>>>
>>> This is already the case for the drm/asahi use case, where the pfns
>>> looked up will only ever be one of:
>>>
>>> - GEM objects that are mapped to the GPU and whose physical pages are
>>> therefore pinned (and the VM is locked while this happens so the objects
>>> cannot become unpinned out from under the running code),
>>
>> How exactly are these pages pinned/obtained?
> 
> Under the hood it's shmem. For pinning, it winds up at
> `drm_gem_get_pages()`, which I think does a `shmem_read_folio_gfp()` on
> a mapping set as unevictable.

Thanks. So we grab another folio reference via 
shmem_read_folio_gfp()->shmem_get_folio_gfp().

Hm, I wonder if we might end up holding folios residing in 
ZONE_MOVABLE/MIGRATE_CMA longer than we should.

Compared to memfd_pin_folios(), which simulates FOLL_LONGTERM and makes 
sure to migrate pages out of ZONE_MOVABLE/MIGRATE_CMA.

But that's a different discussion, just pointing it out, maybe I'm 
missing something :)

> 
> I'm not very familiar with the innards of that codepath, but it's
> definitely an invariant that GEM objects have to be pinned while they
> are mapped in GPU page tables (otherwise the GPU would end up accessing
> freed memory).

Right, there must be a raised reference.

> 
> Since the code that walks the PT to dump pages is part of the same PT
> object and takes a mutable reference, the Rust guarantees mean it's
> impossible for the PT to be concurrently mutated or anything like that.
> So if one of these objects *were* unpinned/freed somehow while the dump
> code is running, that would be a major bug somewhere else, since there
> would be dangling PTEs left over.
> 
> In practice, there's a big lock around each PT/VM at a higher level of
> the driver, so any attempts to unmap/free any of those objects will be
> stuck waiting for the lock on the VM they are mapped into.

Understood, thanks.

[...]

>>>>>
>>>>> Another case struct page can be freed is when hugetlb vmemmap
>>>>> optimization
>>>>> is used. Muchun (cc'd) is the maintainer of hugetlbfs.
>>>>
>>>> Here, the "struct page" remains valid though; it can still be accessed,
>>>> although we disallow writes (which would be wrong).
>>>>
>>>> If you only allocate a page and free it later, there is no need to worry
>>>> about either on the rust side.
>>>
>>> This is what the safe API does. (Also the unsafe physaddr APIs if all
>>> you ever do is convert an allocated page to a physaddr and back, which
>>> is the only thing the GPU page table code does during normal use. The
>>> walking leaf PFNs story is only for GPU device coredumps when the
>>> firmware crashes.)
>>
>> I would hope that we can lock down this interface as much as possible.
> 
> Right, that's why the safe API never does any of the weird pfn->page
> stuff. Rust driver code has to use unsafe {} to access the raw pfn->page
> interface, which requires a // SAFETY comment explaining why what it's
> doing is safe, and then we need to document in the function signature
> what the safety requirements are so those comments can be reviewed.
> 
>> Ideally, we would never go from pfn->page, unless
>>
>> (a) we remember somehow that we came from page->pfn. E.g., we allocated
>>      these pages or someone else provided us with these pages. The memmap
>>      cannot go away. I know it's hard.
> 
> This is the common case for the page tables. 99% of the time this is
> what the driver will be doing, with a single exception (the root page
> table of the firmware/privileged VM is a system reserved memory region,
> and falls under (b). It's one single page globally in the system.).

Makes sense.

> 
> The driver actually uses the completely unchecked interface in this
> case, since it knows the pfns are definitely OK. I do a single check
> with the checked interface at probe time for that one special-case pfn
> so it can fail gracefully instead of oops if the DT config is
> unusable/wrong.
> 
>> (b) the pages are flagged as being special, similar to
>>      __ioremap_check_ram().
> 
> This only ever happens during firmware crash dumps (plus the one
> exception above).
> 
> The missing (c) case is the kernel/firmware shared memory GEM objects
> during crash dumps.

If it's only for crash dumps etc. that might even be opt-in, it makes 
the whole thing a lot less scary. Maybe this could be opt-in somewhere, 
to "unlock" this interface? Just an idea.

> But I really need those to diagnose firmware
> crashes. Of course, I could dump them separately through other APIs in
> principle, but that would complicate the crashdump code quite a bit
> since I'd have to go through all the kernel GPU memory allocators and
> dig out all their backing GEM objects and copy the memory through their
> vmap (they are all vmapped, which is yet another reason in practice the
> pages are pinned) and merge it into the coredump file. I also wouldn't
> have easy direct access to the matching GPU PTEs if I do that (I store
> the PTE permission/caching bits in the coredump file, since those are
> actually kind of critical to diagnose exactly what happened, as caching
> issues are one major cause of firmware problems). Since I need the page
> table walker code to grab the firmware pages anyway, I hope I can avoid
> having to go through a completely different codepath for the kernel GEM
> objects...

Makes sense.

-- 
Cheers,

David / dhildenb

