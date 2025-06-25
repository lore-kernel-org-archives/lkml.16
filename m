Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B72D9EC6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848610; cv=none; b=ZeIgww9m3JZf00Ngcgdv9fS48pRFBIf2/E1VvFPQE9rLXpeYe02XpxQYcr5KDLKJUgMvbPP1gAEGuf/cZo5P+3/kTJPsx7+Jj9oFHpGJDdQmYttYFaCE0Czb+UWULPu1ZieowsbOKAmKjAnuPJztdkL9U0sF7jNTdBsVikdM+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848610; c=relaxed/simple;
	bh=a/XhZxkhyY2VCrgd2a0JvE+6WLZK8BuYS7cCPw6DRMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTeg5Pu8hbh2VbOSfBEug35XoDBxC5FZTWyX1EoFM1VSzJvlTCFRdGrMWOC7/V9YEnf6m8Z3kQrr8xouNqSAThB3AGpQrS4Xa+7lUQMQmg1UIMcmh/tgelMIpqte3T3zceGQnP4pgN9C2tC5i719a+kXzRRYzi7FlK8OC7RC6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L7NT5HEO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L7NT5HEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750848605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9gRgjAak7xJTTxVLyGXCxsxOciNk+TsX5x7MsFcRu/Y=;
	b=L7NT5HEO+PB8gxo8CVmWCKs+SjUWizC/8jVYYM73ERRFzg6xMuI7+xVlTBNl0jI1UG1fGG
	48mqioa73TZcb1e5lxMvXASTvIFdDOoqTabnnyye4TBgOSfW+sXKmrrztuTlbMunPmpJLQ
	MYL3ZfiqJ4+0ueGmdXn876byUbHz88E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-ERBeMk_9NuKPSkgvMTrVxw-1; Wed, 25 Jun 2025 06:49:59 -0400
X-MC-Unique: ERBeMk_9NuKPSkgvMTrVxw-1
X-Mimecast-MFC-AGG-ID: ERBeMk_9NuKPSkgvMTrVxw_1750848598
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so2547210f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848598; x=1751453398;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9gRgjAak7xJTTxVLyGXCxsxOciNk+TsX5x7MsFcRu/Y=;
        b=u0DDxrwfQq4+rLGkbgNrLfs2bhVvHl5E1b4NR43MP5wGMXU6xNOKi5zf2+AHYDqGye
         dYQau0bIALVSDNSm7Powr/PKFAkB1JRrbikIxfwddK26octknQgswB9GPUIZwaTS6FRV
         1SJtEAZAtJB9ON39ndlubOWaCt7ZgaAzI0VONsP7ZRsMaOK+gvhDBtJ08OyNS2cYZ02c
         0vtzkEbzf6kcfQpXajqtgsS7IUEGe/WMaF7XPpYqP3reFoHsuo4BtwQt9lSSQ/jE8V2q
         5aDELqkmIVeQvFaVES0BeVnsD7U6FUq9VCLCKXn/fXVeMreL8gZN8D8WufxOXZ2TAOzc
         5lmg==
X-Forwarded-Encrypted: i=1; AJvYcCV2c63kftWhv7rEHnyZh2/rEGB5sJQ9W0YPdyUsKBis1OsVUqAMtFJD3ihOvHW4lHPlZOYV0nJ2f0kFc2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4VLaJff6UJFAHYCL96v1kqU4G0e2vjKB3qZd6Ea/SkO3IMFL
	ARq6Qb6yh7V3u9XTUCx5aEYRrB4O49rT7nLD9SHZ4QeEPKU2CsWxXPp0mUlFFqvlwnFDar7zWf0
	kUzNmiDVXpFyl6gSMmwV96QPSSyChhLjuZe9OzxW4Orw9naB5K81FokAsgLqbJQGXPQ==
X-Gm-Gg: ASbGnct1dn2wupdCtHCON8G24pYGM15Q+iTJO7Tvvbc5AwzgjpeQPyDO/2aGBzBo09k
	Jq5ixBCClN+WrjxSGd2wpeZOrrDfLJg7pr2YGKWSL6ZVbMIVhtfkQp2wtEbBCKlO3kZhkO0Kora
	VKy0Zu1NpBQ7lp1G0YuOHqz+pqO8HU1WiViZFI/B+Z7rwD9GBGKT6nWeBBrlFCh3gUmbQZebshb
	CgKK7N1d7+3iG85oIPurZ9JbAdjXpRjMNBWD6ptd6S4UuwD1ryi49dRW/HNtkSp5tCRR9W3C2Le
	+UwAAjHLlaz34nbO+bkWYtSrSrkjEaH7gpIvS9xha47huGLiBjhuX1GBPnu4eAxTo5Si+TQcD6t
	NM1nRHzx4yrxIT5JL2DZpzP0kJ6KQVzM70FlsfjM5l52j
X-Received: by 2002:a05:6000:65a:b0:3a5:7967:cdb9 with SMTP id ffacd0b85a97d-3a6ed64b5f4mr1819009f8f.46.1750848598303;
        Wed, 25 Jun 2025 03:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPdnEmT0LicnyngP4DkPh4YUruLW0U3BgglpiHQRqZaWtUeIj3qNtHNoxkgOet2hSIfITdfQ==
X-Received: by 2002:a05:6000:65a:b0:3a5:7967:cdb9 with SMTP id ffacd0b85a97d-3a6ed64b5f4mr1818969f8f.46.1750848597763;
        Wed, 25 Jun 2025 03:49:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805caf3sm4259252f8f.22.2025.06.25.03.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:49:57 -0700 (PDT)
Message-ID: <de1f984c-d3d3-4b18-9681-03db2464fbe4@redhat.com>
Date: Wed, 25 Jun 2025 12:49:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.06.25 12:47, Lance Yang wrote:
> 
> 
> On 2025/6/25 18:00, David Hildenbrand wrote:
>> On 24.06.25 18:25, Lance Yang wrote:
>>> On 2025/6/24 23:34, David Hildenbrand wrote:
>>>> On 24.06.25 17:26, Lance Yang wrote:
>>>>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>>>>> On 14.02.25 10:30, Barry Song wrote:
>>>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>> [...]
>>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>>> index 89e51a7a9509..8786704bd466 100644
>>>>>>> --- a/mm/rmap.c
>>>>>>> +++ b/mm/rmap.c
>>>>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio
>>>>>>> *folio,
>>>>>>> struct page *page,
>>>>>>>      #endif
>>>>>>>      }
>>>>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>>>> +            struct folio *folio, pte_t *ptep)
>>>>>>> +{
>>>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>>> +    int max_nr = folio_nr_pages(folio);
>>>>>>
>>>>>> Let's assume we have the first page of a folio mapped at the last page
>>>>>> table entry in our page table.
>>>>>
>>>>> Good point. I'm curious if it is something we've seen in practice ;)
>>>>
>>>> I challenge you to write a reproducer :P I assume it might be doable
>>>> through simple mremap().
>>>>
>>>>>
>>>>>>
>>>>>> What prevents folio_pte_batch() from reading outside the page table?
>>>>>
>>>>> Assuming such a scenario is possible, to prevent any chance of an
>>>>> out-of-bounds read, how about this change:
>>>>>
>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>> index fb63d9256f09..9aeae811a38b 100644
>>>>> --- a/mm/rmap.c
>>>>> +++ b/mm/rmap.c
>>>>> @@ -1852,6 +1852,25 @@ static inline bool
>>>>> can_batch_unmap_folio_ptes(unsigned long addr,
>>>>>         const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>         int max_nr = folio_nr_pages(folio);
>>>>>         pte_t pte = ptep_get(ptep);
>>>>> +    unsigned long end_addr;
>>>>> +
>>>>> +    /*
>>>>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>>>>> +     * and mapped within the same PTE page table, which corresponds to
>>>>> +     * a single PMD entry. Before calling folio_pte_batch(), which
>>>>> does
>>>>> +     * not perform boundary checks itself, we must verify that the
>>>>> +     * address range covered by the folio does not cross a PMD
>>>>> boundary.
>>>>> +     */
>>>>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>>>>> +
>>>>> +    /*
>>>>> +     * A fast way to check for a PMD boundary cross is to align both
>>>>> +     * the start and end addresses to the PMD boundary and see if they
>>>>> +     * are different. If they are, the range spans across at least two
>>>>> +     * different PMD-managed regions.
>>>>> +     */
>>>>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>>>>> +        return false;
>>>>
>>>> You should not be messing with max_nr = folio_nr_pages(folio) here at
>>>> all. folio_pte_batch() takes care of that.
>>>>
>>>> Also, way too many comments ;)
>>>>
>>>> You may only batch within a single VMA and within a single page table.
>>>>
>>>> So simply align the addr up to the next PMD, and make sure it does not
>>>> exceed the vma end.
>>>>
>>>> ALIGN and friends can help avoiding excessive comments.
>>>
>>> Thanks! How about this updated version based on your suggestion:
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index fb63d9256f09..241d55a92a47 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio
>>> *folio, struct page *page,
>>>    /* We support batch unmapping of PTEs for lazyfree large folios */
>>>    static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>> -            struct folio *folio, pte_t *ptep)
>>> +                          struct folio *folio, pte_t *ptep,
>>> +                          struct vm_area_struct *vma)
>>>    {
>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    unsigned long next_pmd, vma_end, end_addr;
>>>        int max_nr = folio_nr_pages(folio);
>>>        pte_t pte = ptep_get(ptep);
>>> +    /*
>>> +     * Limit the batch scan within a single VMA and within a single
>>> +     * page table.
>>> +     */
>>> +    vma_end = vma->vm_end;
>>> +    next_pmd = ALIGN(addr + 1, PMD_SIZE);
>>> +    end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
>>> +
>>> +    if (end_addr > min(next_pmd, vma_end))
>>> +        return false;
>>
>> May I suggest that we clean all that up as we fix it?
> 
> Yeah, that looks much better. Thanks for the suggestion!
> 
>>
>> Maybe something like this:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 3b74bb19c11dd..11fbddc6ad8d6 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio,
>> struct page *page,
>>    #endif
>>    }
>>
>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> -                       struct folio *folio, pte_t *ptep)
>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
>> +               pte_t pte)
>>    {
>>           const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> -       int max_nr = folio_nr_pages(folio);
>> -       pte_t pte = ptep_get(ptep);
>> +       struct vm_area_struct *vma = pvmw->vma;
>> +       unsigned long end_addr, addr = pvmw->address;
>> +       unsigned int max_nr;
>> +
>> +       if (flags & TTU_HWPOISON)
>> +               return 1;
>> +       if (!folio_test_large(folio))
>> +               return 1;
>> +
>> +       /* We may only batch within a single VMA and a single page
>> table. */
>> +       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma-
>>   >vm_end);
>> +       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>
>> +       /* We only support lazyfree batching for now ... */
>>           if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> -               return false;
>> +               return 1;
>>           if (pte_unused(pte))
>> -               return false;
>> -       if (pte_pfn(pte) != folio_pfn(folio))
>> -               return false;
>> +               return 1;
>> +       /* ... where we must be able to batch the whole folio. */
>> +       if (pte_pfn(pte) != folio_pfn(folio) || max_nr !=
>> folio_nr_pages(folio))
>> +               return 1;
>> +       max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr,
>> fpb_flags,
>> +                                NULL, NULL, NULL);
>>
>> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr,
>> fpb_flags, NULL,
>> -                              NULL, NULL) == max_nr;
>> +       if (max_nr != folio_nr_pages(folio))
>> +               return 1;
>> +       return max_nr;
>>    }
>>
>>    /*
>> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio,
>> struct vm_area_struct *vma,
>>                           if (pte_dirty(pteval))
>>                                   folio_mark_dirty(folio);
>>                   } else if (likely(pte_present(pteval))) {
>> -                       if (folio_test_large(folio) && !(flags &
>> TTU_HWPOISON) &&
>> -                           can_batch_unmap_folio_ptes(address, folio,
>> pvmw.pte))
>> -                               nr_pages = folio_nr_pages(folio);
>> +                       nr_pages = folio_unmap_pte_batch(folio, &pvmw,
>> flags, pteval);
>>                           end_addr = address + nr_pages * PAGE_SIZE;
>>                           flush_cache_range(vma, address, end_addr);
>>
>>
>> Note that I don't quite understand why we have to batch the whole thing
>> or fallback to
>> individual pages. Why can't we perform other batches that span only some
>> PTEs? What's special
>> about 1 PTE vs. 2 PTEs vs. all PTEs?
> 
> That's a good point about the "all-or-nothing" batching logic ;)
> 
> It seems the "all-or-nothing" approach is specific to the lazyfree use
> case, which needs to unmap the entire folio for reclamation. If that's
> not possible, it falls back to the single-page slow path.
> 
> Also, supporting partial batches would be useful, but not common case
> I guess, so let's leave it as is ;p

We can literally make this code less complicated if we just support it? :)

I mean, it's dropping 3 if conditions from the code I shared.

-- 
Cheers,

David / dhildenb

