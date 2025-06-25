Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6BE8F5B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848492; cv=none; b=M9fWQ8tpzHwTKuD8OffVNmd0brfedqTVx4xbZ1KYe+ivjah5a6g+wbzGfTmRNTwNrf++D96Zwsqtp21GLTR8VWSugq/daE+qltLXXyYn5ppDG61reHzURS4DJJwe+oEkiwEjzX2C3GOUSBZRY6IxWMRwuCe+l00pKHrKCYvLXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848492; c=relaxed/simple;
	bh=ohKYVBjLzuE44bFrbh1c5o+/XEd3tbE2iUIkC1bfg90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2T1wHeKV9gDWVPF6pqx98IiJrtJknwU3HU5Uv4g3RZBlSfMcYY3+VuKFqlfmxdzr2QdDKD8BLBDcZO+Di02jGUCCS+QJ9Sn3KjL3Ptds9iLneJ5N0qzj2vdjpenkuoF1BGPn6zWDfc9fvNmZ4QAgf/3lXRlTxcO4woWW0hMBn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BWB+hSf9; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BWB+hSf9"
Message-ID: <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750848488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csN3NGyJz0Plq+DSLlEX2Pakhu0xabELB8Wjy8HXAeM=;
	b=BWB+hSf9s40JKUag99JUhdHNhY+hi/eWwJYO4YD9eHSuRniIiKbey15lYX6sZe0B1ZFnok
	sZPk4HhuguE7ZuMeAVTkLE7Zes+IVipMQAhigbH1G++5xpJpTMC8j8KZxnXpNdNO2AFCWs
	FaaRff8WSDn24xARtP5xY/nLqjGRjxI=
Date: Wed, 25 Jun 2025 18:47:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/25 18:00, David Hildenbrand wrote:
> On 24.06.25 18:25, Lance Yang wrote:
>> On 2025/6/24 23:34, David Hildenbrand wrote:
>>> On 24.06.25 17:26, Lance Yang wrote:
>>>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>>>> On 14.02.25 10:30, Barry Song wrote:
>>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>> [...]
>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>> index 89e51a7a9509..8786704bd466 100644
>>>>>> --- a/mm/rmap.c
>>>>>> +++ b/mm/rmap.c
>>>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio 
>>>>>> *folio,
>>>>>> struct page *page,
>>>>>>     #endif
>>>>>>     }
>>>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>>> +            struct folio *folio, pte_t *ptep)
>>>>>> +{
>>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | 
>>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>> +    int max_nr = folio_nr_pages(folio);
>>>>>
>>>>> Let's assume we have the first page of a folio mapped at the last page
>>>>> table entry in our page table.
>>>>
>>>> Good point. I'm curious if it is something we've seen in practice ;)
>>>
>>> I challenge you to write a reproducer :P I assume it might be doable
>>> through simple mremap().
>>>
>>>>
>>>>>
>>>>> What prevents folio_pte_batch() from reading outside the page table?
>>>>
>>>> Assuming such a scenario is possible, to prevent any chance of an
>>>> out-of-bounds read, how about this change:
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index fb63d9256f09..9aeae811a38b 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1852,6 +1852,25 @@ static inline bool
>>>> can_batch_unmap_folio_ptes(unsigned long addr,
>>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | 
>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>        int max_nr = folio_nr_pages(folio);
>>>>        pte_t pte = ptep_get(ptep);
>>>> +    unsigned long end_addr;
>>>> +
>>>> +    /*
>>>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>>>> +     * and mapped within the same PTE page table, which corresponds to
>>>> +     * a single PMD entry. Before calling folio_pte_batch(), which 
>>>> does
>>>> +     * not perform boundary checks itself, we must verify that the
>>>> +     * address range covered by the folio does not cross a PMD 
>>>> boundary.
>>>> +     */
>>>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>>>> +
>>>> +    /*
>>>> +     * A fast way to check for a PMD boundary cross is to align both
>>>> +     * the start and end addresses to the PMD boundary and see if they
>>>> +     * are different. If they are, the range spans across at least two
>>>> +     * different PMD-managed regions.
>>>> +     */
>>>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>>>> +        return false;
>>>
>>> You should not be messing with max_nr = folio_nr_pages(folio) here at
>>> all. folio_pte_batch() takes care of that.
>>>
>>> Also, way too many comments ;)
>>>
>>> You may only batch within a single VMA and within a single page table.
>>>
>>> So simply align the addr up to the next PMD, and make sure it does not
>>> exceed the vma end.
>>>
>>> ALIGN and friends can help avoiding excessive comments.
>>
>> Thanks! How about this updated version based on your suggestion:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..241d55a92a47 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio 
>> *folio, struct page *page,
>>   /* We support batch unmapping of PTEs for lazyfree large folios */
>>   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> -            struct folio *folio, pte_t *ptep)
>> +                          struct folio *folio, pte_t *ptep,
>> +                          struct vm_area_struct *vma)
>>   {
>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    unsigned long next_pmd, vma_end, end_addr;
>>       int max_nr = folio_nr_pages(folio);
>>       pte_t pte = ptep_get(ptep);
>> +    /*
>> +     * Limit the batch scan within a single VMA and within a single
>> +     * page table.
>> +     */
>> +    vma_end = vma->vm_end;
>> +    next_pmd = ALIGN(addr + 1, PMD_SIZE);
>> +    end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
>> +
>> +    if (end_addr > min(next_pmd, vma_end))
>> +        return false;
> 
> May I suggest that we clean all that up as we fix it?

Yeah, that looks much better. Thanks for the suggestion!

> 
> Maybe something like this:
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..11fbddc6ad8d6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio, 
> struct page *page,
>   #endif
>   }
> 
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
> +               pte_t pte)
>   {
>          const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> -       int max_nr = folio_nr_pages(folio);
> -       pte_t pte = ptep_get(ptep);
> +       struct vm_area_struct *vma = pvmw->vma;
> +       unsigned long end_addr, addr = pvmw->address;
> +       unsigned int max_nr;
> +
> +       if (flags & TTU_HWPOISON)
> +               return 1;
> +       if (!folio_test_large(folio))
> +               return 1;
> +
> +       /* We may only batch within a single VMA and a single page 
> table. */
> +       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma- 
>  >vm_end);
> +       max_nr = (end_addr - addr) >> PAGE_SHIFT;
> 
> +       /* We only support lazyfree batching for now ... */
>          if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -               return false;
> +               return 1;
>          if (pte_unused(pte))
> -               return false;
> -       if (pte_pfn(pte) != folio_pfn(folio))
> -               return false;
> +               return 1;
> +       /* ... where we must be able to batch the whole folio. */
> +       if (pte_pfn(pte) != folio_pfn(folio) || max_nr != 
> folio_nr_pages(folio))
> +               return 1;
> +       max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 
> fpb_flags,
> +                                NULL, NULL, NULL);
> 
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 
> fpb_flags, NULL,
> -                              NULL, NULL) == max_nr;
> +       if (max_nr != folio_nr_pages(folio))
> +               return 1;
> +       return max_nr;
>   }
> 
>   /*
> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio, 
> struct vm_area_struct *vma,
>                          if (pte_dirty(pteval))
>                                  folio_mark_dirty(folio);
>                  } else if (likely(pte_present(pteval))) {
> -                       if (folio_test_large(folio) && !(flags & 
> TTU_HWPOISON) &&
> -                           can_batch_unmap_folio_ptes(address, folio, 
> pvmw.pte))
> -                               nr_pages = folio_nr_pages(folio);
> +                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, 
> flags, pteval);
>                          end_addr = address + nr_pages * PAGE_SIZE;
>                          flush_cache_range(vma, address, end_addr);
> 
> 
> Note that I don't quite understand why we have to batch the whole thing 
> or fallback to
> individual pages. Why can't we perform other batches that span only some 
> PTEs? What's special
> about 1 PTE vs. 2 PTEs vs. all PTEs?

That's a good point about the "all-or-nothing" batching logic ;)

It seems the "all-or-nothing" approach is specific to the lazyfree use
case, which needs to unmap the entire folio for reclamation. If that's
not possible, it falls back to the single-page slow path.

Also, supporting partial batches would be useful, but not common case
I guess, so let's leave it as is ;p

Thanks,
Lance

> 
> 
> Can someone enlighten me why that is required?
> 

