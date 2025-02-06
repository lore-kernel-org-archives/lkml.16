Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545B719CCF5
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864690; cv=none; b=tph9UdiERELyDSvgEGH+T4WviTUxqJ/up+mQmRcXGgfSmuk4cBulGExlZaYNyFIbiBJz5/zreu5E2V5Lz3JIn7SXBAjxjS1rQj6aJB9IIvtQHKKBIpHjlDVS5x71FsHNZRT1UFqkz55NWfo3eURAEMnJt99i/WhRrLlUk0KZqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864690; c=relaxed/simple;
	bh=YmHapirqvk/ngdiGC6T/xxUFtO17FTPrBiw5vtm84Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGOAdOPwiuySUNRbzAS1Z6GAJ1uew0yHro6ecCVkCbFa1VyB7HDvUXXhGyqBn3CLH08ZFYVMZDf10vsOafihyxeAOPMweng9Wdwaecyx4WG9Qtkf/ULFS+0a+5Fk+vOymzyZ5d35Eg6/cJLKzav4oI0JrTbZJF41yRlqQL9dMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ok8sc1Mu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ok8sc1Mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738864687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SKbbANEF+87OBIL+65pN5q1lm52hJsu8mb9TW2ODNS4=;
	b=Ok8sc1MuQzEQ6ltyoAIvl3/CAYEDNdnKRLCOhqdn/kbjDA/zuPIDolj+wj/vCINP6AyMt5
	M7Z5e+8VcVL8hpE8eneiazDWtCAIDcTrj21kLaeXDqfn/jxrWenPR9pvk5rZEL85fIIAnl
	yU7BpzjogF2j9H1xm3DlBAwbSjFHC6E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-cpKM-pWzOG-IPx57XahRUA-1; Thu, 06 Feb 2025 12:58:06 -0500
X-MC-Unique: cpKM-pWzOG-IPx57XahRUA-1
X-Mimecast-MFC-AGG-ID: cpKM-pWzOG-IPx57XahRUA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso7340005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864685; x=1739469485;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SKbbANEF+87OBIL+65pN5q1lm52hJsu8mb9TW2ODNS4=;
        b=lMmdhqJ2+FqS5vYY8PIsfQj43104jOrowqwg8QVAj5XC9wIGa3vg/8M0AVJHl0r+Pb
         5HBPKEltsB/ShbocVmgiauP4AVu0Z4AzooTLpp0FTVEwkT9g5xXitnlgluwWz5MXKb9r
         14p56BAW1cbQYMI0llaL2fpZAEJXYRTTaahuM3KgsP6kLLWFLHnYOFqRmjMec6RseLcA
         CJ5LzaUAqofouvJaI5jlsJiLSPnrNOEoPz4oewZ9jwqjWNMyHVxCmAPQZpj3QGKhdZyk
         ThD90cTTNN8kPMRYZk3ewu8pjbsZCrwtiJncWoUi5sY7fjpew18CZGGUgar0O7W8TQfu
         Vr+A==
X-Forwarded-Encrypted: i=1; AJvYcCX+KyHxsNUYaM/CRdguxUyWAZ+9PoDG0VwFj6X1qUdvAncJSl6jIOsnI9g3W/vsDyN0FCIH55kS9mg8EPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HM/Bj7QaUbbmHchIQMdaQZCiMJjPCGIwuS2AeTOg3kGuzAQZ
	5yTUiMtqWpQXKNRc2+inDJLXrRZle68Svff4RKT/v4KVJLYOuqZ8aS/Xl79KGhaqa6mrdKrpI8T
	DmzqudOBoDipiED/84FAgAH/AoWAX851w/GHNahahfgP4Yp/hIHQXr/lsLLdiKA==
X-Gm-Gg: ASbGncv0jNc4qrxL/XkZHo0YNvvD3vcxXa4hAXIrAHRTUATAds/A6ARawh01f9Ft+c2
	yA4t2gWdGHAfPNRhP0xw19svgU1o3FUPSnHDRTtw0WDq+/SC2U6/ZAapJODZku5RPE/uViBBBLy
	QQUgLZ4e53bUiEZ53wNH6CMgblkvdwBd6PiHPz+6/g7vH6nd+A71X61RiCdHV0/qoeDlKqxFS4x
	tTTEdVYettUDeCwwq5UG/HHMzaVtRPNbnI4q5kNeEu7mGcGsuKlhi3cKGpOPG5LwqUum7DwWhw4
	pr5Cv8V7WeKiyULirXmF4QzSaY5ymEy3eNSgjM+pBsBQItYQaHwwGf1mET5cD3I0Let4dY4VMt8
	UaPGm+ybCM8jbidx5iqq+RmsFy1naLRZW
X-Received: by 2002:a05:600c:3ac7:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-43924988cc1mr3185205e9.10.1738864684747;
        Thu, 06 Feb 2025 09:58:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELRlMVRsMWOao9zzpz6Rufi04usTrvUtUoFfSASS5M5qjhhPoS146Q9D71cphcNkBb8xHqlQ==
X-Received: by 2002:a05:600c:3ac7:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-43924988cc1mr3184855e9.10.1738864684304;
        Thu, 06 Feb 2025 09:58:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:3000:a06b:56f1:d152:db83? (p200300cbc7073000a06b56f1d152db83.dip0.t-ipconnect.de. [2003:cb:c707:3000:a06b:56f1:d152:db83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd84b9sm25919955e9.39.2025.02.06.09.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:58:03 -0800 (PST)
Message-ID: <0dffaa7d-340f-4ce1-9a2e-54cfd9079266@redhat.com>
Date: Thu, 6 Feb 2025 18:58:01 +0100
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
 <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
 <cc1cd991-1871-4929-851e-d9672a45dcf0@asahilina.net>
 <6bcd3315-a0f9-463c-ab97-a43736f9b4f4@redhat.com>
 <2a513c3e-818c-4040-b3d3-7835861bab4f@asahilina.net>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2a513c3e-818c-4040-b3d3-7835861bab4f@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.02.25 22:06, Asahi Lina wrote:
> 
> 
> On 2/5/25 5:10 AM, David Hildenbrand wrote:
>> On 04.02.25 18:59, Asahi Lina wrote:
>>> On 2/4/25 11:38 PM, David Hildenbrand wrote:
>>>>>>> If the answer is "no" then that's fine. It's still an unsafe function
>>>>>>> and we need to document in the safety section that it should only be
>>>>>>> used for memory that is either known to be allocated and pinned and
>>>>>>> will
>>>>>>> not be freed while the `struct page` is borrowed, or memory that is
>>>>>>> reserved and not owned by the buddy allocator, so in practice correct
>>>>>>> use would not be racy with memory hot-remove anyway.
>>>>>>>
>>>>>>> This is already the case for the drm/asahi use case, where the pfns
>>>>>>> looked up will only ever be one of:
>>>>>>>
>>>>>>> - GEM objects that are mapped to the GPU and whose physical pages are
>>>>>>> therefore pinned (and the VM is locked while this happens so the
>>>>>>> objects
>>>>>>> cannot become unpinned out from under the running code),
>>>>>>
>>>>>> How exactly are these pages pinned/obtained?
>>>>>
>>>>> Under the hood it's shmem. For pinning, it winds up at
>>>>> `drm_gem_get_pages()`, which I think does a `shmem_read_folio_gfp()` on
>>>>> a mapping set as unevictable.
>>>>
>>>> Thanks. So we grab another folio reference via shmem_read_folio_gfp()-
>>>>> shmem_get_folio_gfp().
>>>>
>>>> Hm, I wonder if we might end up holding folios residing in ZONE_MOVABLE/
>>>> MIGRATE_CMA longer than we should.
>>>>
>>>> Compared to memfd_pin_folios(), which simulates FOLL_LONGTERM and makes
>>>> sure to migrate pages out of ZONE_MOVABLE/MIGRATE_CMA.
>>>>
>>>> But that's a different discussion, just pointing it out, maybe I'm
>>>> missing something :)
>>>
>>> I think this is a little over my head. Though I only just realized that
>>> we seem to be keeping the GEM objects pinned forever, even after unmap,
>>> in the drm-shmem core API (I see no drm-shmem entry point that would
>>> allow the sgt to be freed and its corresponding pages ref to be dropped,
>>> other than a purge of purgeable objects or final destruction of the
>>> object). I'll poke around since this feels wrong, I thought we were
>>> supposed to be able to have shrinker support for swapping out whole GPU
>>> VMs in the modern GPU MM model, but I guess there's no implementation of
>>> that for gem-shmem drivers yet...?
>>
>> I recall that shrinker as well, ... or at least a discussion around it.
>>
>> [...]
>>
>>>>
>>>> If it's only for crash dumps etc. that might even be opt-in, it makes
>>>> the whole thing a lot less scary. Maybe this could be opt-in somewhere,
>>>> to "unlock" this interface? Just an idea.
>>>
>>> Just to make sure we're on the same page, I don't think there's anything
>>> to unlock in the Rust abstraction side (this series). At the end of the
>>> day, if nothing else, the unchecked interface (which the regular
>>> non-crash page table management code uses for performance) will let you
>>> use any pfn you want, it's up to documentation and human review to
>>> specify how it should be used by drivers. What Rust gives us here is the
>>> mandatory `unsafe {}`, so any attempts to use this API will necessarily
>>> stick out during review as potentially dangerous code that needs extra
>>> scrutiny.
>>>
>>> For the client driver itself, I could gate the devcoredump stuff behind
>>> a module parameter or something... but I don't think it's really worth
>>> it. We don't have a way to reboot the firmware or recover from this
>>> condition (platform limitations), so end users are stuck rebooting to
>>> get back a usable machine anyway. If something goes wrong in the
>>> crashdump code and the machine oopses or locks up worse... it doesn't
>>> really make much of a difference for normal end users. I don't think
>>> this will ever really happen given the constraints I described, but if
>>> somehow it does (some other bug somewhere?), well... the machine was
>>> already in an unrecoverable state anyway.
>>>
>>> It would be nice to have userspace tooling deployed by default that
>>> saves off the devcoredump somewhere, so we can have a chance at
>>> debugging hard-to-hit firmware crashes... if it's opt-in, it would only
>>> really be useful for developers and CI machines.
>>
>> Is this something that possibly kdump can save or analyze? Because that
>> is our default "oops, kernel crashed, let's dump the old content so we
>> can dump it" mechanism on production systems.
> 
> kdump does not work on Apple ARM systems because kexec is broken and
> cannot be fully fixed, due to multiple platform/firmware limitations. A
> very limited version of kexec might work well enough for kdump, but I
> don't think anyone has looked into making that work yet...
> 
>> but ... I am not familiar with devcoredump. So I don't know when/how it
>> runs, and if the source system is still alive (and remains alive --  in
>> contrast to a kernel crash).
> 
> Devcoredump just makes the dump available via /sys so it can be
> collected by the user. The system is still alive, the GPU is just dead
> and all future GPU job submissions fail. You can still SSH in or (at
> least in theory, if enough moving parts are graceful about it) VT-switch
> to a TTY. The display controller is not part of the GPU, it is separate
> hardware.


Thanks for all the details (and sorry for the delay, I'm on PTO until 
Monday ... :)

(regarding the other mail) Adding that stuff to rust just so we have a 
devcoredump that ideally wouldn't exist is a bit unfortunate.

So I'm curious: we do have /proc/kcore, where we do all of the required 
filtering, only allowing for reading memory that is online, not 
hwpoisoned etc.

makedumpfile already supports /proc/kcore.

Would it be possible to avoid Devcoredump completely either by dumping 
/proc/kcore directly or by having a user-space script that walks the 
page tables to dump the content purely based on /proc/kcore?

If relevant memory ranges are inaccessible from /proc/kcore, we could 
look into exposing them.

-- 
Cheers,

David / dhildenb

