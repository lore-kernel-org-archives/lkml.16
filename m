Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1C2E06C2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160968; cv=none; b=CWF+okMmZhKUzzQtPTLrx7Bev23tUnvt0UZ/wNckyIDxJv7iS8V9mUVFItn3eXQ7FRF18G5RJDyLEUaefluINEw0TnIt1OuAj+cMWWjRiHLyTzdoSdCo/hJBeMOdmWDuNjkP1+pFKTz0E7HutrtjUGx2syAcmoC8Onf5m7nXVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160968; c=relaxed/simple;
	bh=JNmTYLOp+P+t/Cb2ACD7zV51Bf89soE1pAZIHyqsCOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbCVhnXRZXcm9GCQ+/bYNSUnGVO9fZPL3H6HUBAr5/0Y6oqueg3ReadqJJN6OJ3XrMpofeumjeqVRVInkrRJseFYsBBOJTuVirJTsanKq3bdyyj2JI0m7FWtBTGJadMzMhtFYWdjNviRtiWpoifCP+GgdbawcCP32/EDyK8oE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HotaY1pt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HotaY1pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750160965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hE4jQf30NhDONzaYTp5udghTJVFFQmiX++mtkRc+5ps=;
	b=HotaY1ptd6XOk3YpYihCscZOMkB3BIIvBigdw8PrxZj4DBrVsT7LyYsOzATPuzXgb0Y5KS
	mSAXbU5pCNM/dvl8IOY5UcCCRMaIsng38JO4Ejh9srqDIaxHGOKJWJXZbpcLcQ7zquAbi0
	q5ZrZJFdIe10MmMSpJBO+rnkBM1VhRw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-V_G2taS1Mqec8eGRmqBLKA-1; Tue, 17 Jun 2025 07:49:24 -0400
X-MC-Unique: V_G2taS1Mqec8eGRmqBLKA-1
X-Mimecast-MFC-AGG-ID: V_G2taS1Mqec8eGRmqBLKA_1750160963
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cf229025so19939165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160963; x=1750765763;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hE4jQf30NhDONzaYTp5udghTJVFFQmiX++mtkRc+5ps=;
        b=fytEzELL2VJfUL0/1fyp3sIRR4/vVgGPpabrY8HwruvnvhmI3Z6Z5oBZe7/w1DHq9S
         Jg7mkWaKcuyxbe2aOSfertCW6PKyMvYJp8DWpA2ZF/ZQ4gwVo8MeGPvTqhw8q56E+hxZ
         ko2w3S1D+ChLq2B77TcQLgTUYv9ypurpiVbLCzxHcQAzQl69queBhbsNCBowNrJ6Cfld
         TRG2k9qEzdxnGhJCw8UV3qZ8CEAdkb8TyY2bldr89coH/feMI7p77BRa+ECbcyDQi6L5
         hEtDx5alAvrkJYXCjGNQB43235F9bAf/ywOzMMfqt5DfDZaljGkf4DFM9sLy0fCFG7Gb
         G4Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWhtbt37OamTzAlA1ahKsniNC4XwME70zh5wfnvTzwlSbCz3X9+2/rMm0yFhH0w8Ey3uQtQ1ZPU2zy0tng=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjAQ6+7PrlsLWt6RXfcDJ5jWBeYyP4wI2JVx7T3D4UGU35MRn
	RHwQImTqqM+2a4nTuuN5PnaWMkI6slwHvyUKvSooIjNRIhrLKObyxEVsHPks+1hpPAYHAafPizn
	4fvHtC0C/Svf5aOFB/3G8yj1t4FtblpH7CRSmvIy7yC1qXVXZcjvsu2+g0qB+EoUPsg==
X-Gm-Gg: ASbGncv4QI9qaJT3wSKShK02QQk8uh1hxvcQwdcbXZHKrppiVE05g/EGWkKqjKCcISa
	NajDltqeDib2MQJG2/QoASA+WmTD/8nQs9/ossgO4mTbncncZ7UYrnBrwtOEMX65H/O/lHhrni5
	AFK6emlpkf4jyjAEtATyeM59hBlUVetRaA75o0hGxGvPuGKW77LTpQXcfNDbpyhHxXXAUnJQ1V3
	hCcfx1/4XwKISJuOHvCbNbwQj1nkN6jLMMKEA+SqtBjOkt5BLqiLywCuXMp9jNYefydLo2LApo1
	Bnt/sf/flo03iw/G7Y3HpyyOZmr69z48BUhid1BpACXlURBbhAU3tfXstRlsQOOhbwqa2EbImq/
	CE8d6i84g4WU8V/R9dLMtGZy8B6ZXjvu2MLwCKfjvofEiDNY=
X-Received: by 2002:a05:6000:40c9:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a572e897camr10382750f8f.55.1750160963221;
        Tue, 17 Jun 2025 04:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlBsMyHOaTTPLqmqFnkM6OJpPPZgQeYrXfiZldtxrH7SiO0M2P1VW30LutSVUXkr0Rwtv4aA==
X-Received: by 2002:a05:6000:40c9:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a572e897camr10382706f8f.55.1750160962736;
        Tue, 17 Jun 2025 04:49:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5546asm13560837f8f.3.2025.06.17.04.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:49:22 -0700 (PDT)
Message-ID: <7beef290-e68b-4599-aedb-994c2e9fa237@redhat.com>
Date: Tue, 17 Jun 2025 13:49:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Harry Yoo <harry.yoo@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <aFFOTjLtPNp7S8sP@hyeyoo>
 <7f22dec0-680b-4e3d-9aab-cd516dda8ed7@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7f22dec0-680b-4e3d-9aab-cd516dda8ed7@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 13:24, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 08:15:52PM +0900, Harry Yoo wrote:
>> On Mon, Jun 09, 2025 at 02:26:35PM +0100, Lorenzo Stoakes wrote:
>>> When mremap() moves a mapping around in memory, it goes to great lengths to
>>> avoid having to walk page tables as this is expensive and
>>> time-consuming.
>>>
>>> Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
>>> page offset stored in the VMA at vma->vm_pgoff will remain the same, as
>>> well all the folio indexes pointed at the associated anon_vma object.
>>>
>>> This means the VMA and page tables can simply be moved and this affects the
>>> change (and if we can move page tables at a higher page table level, this
>>> is even faster).
>>>
>>> While this is efficient, it does lead to big problems with VMA merging - in
>>> essence it causes faulted anonymous VMAs to not be mergeable under many
>>> circumstances once moved.
>>>
>>> This is limiting and leads to both a proliferation of unreclaimable,
>>> unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
>>> impact on further use of mremap(), which has a requirement that the VMA
>>> moved (which can also be a partial range within a VMA) may span only a
>>> single VMA.
>>>
>>> This makes the mergeability or not of VMAs in effect a uAPI concern.
>>>
>>> In some use cases, users may wish to accept the overhead of actually going
>>> to the trouble of updating VMAs and folios to affect mremap() moves. Let's
>>> provide them with the choice.
>>>
>>> This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
>>> attempts to perform such an operation. If it is unable to do so, it cleanly
>>> falls back to the usual method.
>>>
>>> It carefully takes the rmap locks such that at no time will a racing rmap
>>> user encounter incorrect or missing VMAs.
>>>
>>> It is also designed to interact cleanly with the existing mremap() error
>>> fallback mechanism (inverting the remap should the page table move fail).
>>>
>>> Also, if we could merge cleanly without such a change, we do so, avoiding
>>> the overhead of the operation if it is not required.
>>>
>>> In the instance that no merge may occur when the move is performed, we
>>> still perform the folio and VMA updates to ensure that future mremap() or
>>> mprotect() calls will result in merges.
>>>
>>> In this implementation, we simply give up if we encounter large folios. A
>>> subsequent commit will extend the functionality to allow for these cases.
>>>
>>> We restrict this flag to purely anonymous memory only.
>>>
>>> we separate out the vma_had_uncowed_parents() helper function for checking
>>> in should_relocate_anon() and introduce a new function
>>> vma_maybe_has_shared_anon_folios() which combines a check against this and
>>> any forked child anon_vma's.
>>>
>>> We carefully check for pinned folios in case a caller who holds a pin might
>>> make assumptions about index, mapping fields which we are about to
>>> manipulate.
>>>
>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> ---
>>>   include/linux/rmap.h             |   4 +
>>>   include/uapi/linux/mman.h        |   1 +
>>>   mm/internal.h                    |   1 +
>>>   mm/mremap.c                      | 403 +++++++++++++++++++++++++++++--
>>>   mm/vma.c                         |  77 ++++--
>>>   mm/vma.h                         |  36 ++-
>>>   tools/testing/vma/vma.c          |   5 +-
>>>   tools/testing/vma/vma_internal.h |  38 +++
>>>   8 files changed, 520 insertions(+), 45 deletions(-)
>>
>> [...snip...]
>>
>>> @@ -754,6 +797,209 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
>>>   	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
>>>   }
>>>
>>> +/*
>>> + * If the folio mapped at the specified pte entry can have its index and mapping
>>> + * relocated, then do so.
>>> + *
>>> + * Returns the number of pages we have traversed, or 0 if the operation failed.
>>> + */
>>> +static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
>>> +		struct pte_state *state, bool undo)
>>> +{
>>> +	struct folio *folio;
>>> +	struct vm_area_struct *old, *new;
>>> +	pgoff_t new_index;
>>> +	pte_t pte;
>>> +	unsigned long ret = 1;
>>> +	unsigned long old_addr = state->old_addr;
>>> +	unsigned long new_addr = state->new_addr;
>>> +
>>> +	old = pmc->old;
>>> +	new = pmc->new;
>>> +
>>> +	pte = ptep_get(state->ptep);
>>> +
>>> +	/* Ensure we have truly got an anon folio. */
>>> +	folio = vm_normal_folio(old, old_addr, pte);
>>> +	if (!folio)
>>> +		return ret;
>>> +
>>> +	folio_lock(folio);
>>> +
>>> +	/* No-op. */
>>> +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
>>> +		goto out;
>>
>> I think the kernel should not observe any KSM pages during mremap
>> because it breaks KSM pages in prep_move_vma()?

Ah, that's the maigc bit, thanks!

> 
> Right, nor should we observe !anon pages here since we already checked for
> that...
> 
> This is belt + braces. Maybe we should replace with VM_WARN_ON_ONCE()'s...?

Sure. Anything you can throw out probably reduces the overhead :)

-- 
Cheers,

David / dhildenb

