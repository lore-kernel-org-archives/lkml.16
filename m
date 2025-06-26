Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567E2E1C7E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946006; cv=none; b=iukg3H9oK6cXzm23y8Lex92x2XOP2SyGuZuOc08PCVXPKRv5oZW8BOmRXuw282wzqcyX0Ivy6YSRnNQ2bxI2xf5FscxcXfvnSqIf2o09w1tAX4WexjOKuUWsqjB66rwCrRW+MVMWMmYSN1NeUKceCrAEOnUkVISPDFHIQ8BK9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946006; c=relaxed/simple;
	bh=LlYcHhhOG/0FJHMeiGgwvZN+L/7vCreg0CAoStg7Dec=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b1iSYEmgVoIt0i2hKoU89GM1e4KPFjCCvHL1WutgTCR0mdUh3RqCJemcgj7IGYI534ptWRwld2RH+4SRIu0l08+chB5pD8ew+PMjesOXwdZrgucJ5VGjiI9t/9MfiQ3NaMNzQ1kwMDyAzxg/UWRVPGCHlEmFpD2m/7yiRwDJ+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q3Rv2EQw; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q3Rv2EQw"
Message-ID: <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750946001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxJ/+GIT8i2T2VJ1n6tfW4Ns7LsKzLgWRa8bu373EG0=;
	b=q3Rv2EQwghbWQOo1XaSDbcFu49quE13kRIvVREM0PKjnsNVV1rc3AS10a0Mx3LudcEXvHs
	sDaC2vuB+PvgI3l8Q1InsFKXX5w4xajOJHTVvZnsY2a+Aa4C7FzZrtH3nn7i95qwN2ot5Z
	QHjYdgduBbJf/3HTfvAdwv0zsn5hlAM=
Date: Thu, 26 Jun 2025 21:52:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
 <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
Content-Language: en-US
In-Reply-To: <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/26 21:16, David Hildenbrand wrote:
> On 26.06.25 14:44, Lance Yang wrote:
>>
>> On 2025/6/26 17:29, Lance Yang wrote:
>>> Before I send out the real patch, I'd like to get some quick feedback to
>>> ensure I've understood the discussion correctly ;)
>>>
>>> Does this look like the right direction?
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index fb63d9256f09..5ebffe2137e4 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio 
>>> *folio, struct page *page,
>>>    #endif
>>>    }
>>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>> -            struct folio *folio, pte_t *ptep)
>>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>> +            struct page_vma_mapped_walk *pvmw,
>>> +            enum ttu_flags flags, pte_t pte)
>>>    {
>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> -    int max_nr = folio_nr_pages(folio);
>>> -    pte_t pte = ptep_get(ptep);
>>> +    unsigned long end_addr, addr = pvmw->address;
>>> +    struct vm_area_struct *vma = pvmw->vma;
>>> +    unsigned int max_nr;
>>> +
>>> +    if (flags & TTU_HWPOISON)
>>> +        return 1;
>>> +    if (!folio_test_large(folio))
>>> +        return 1;
>>> +    /* We may only batch within a single VMA and a single page 
>>> table. */
>>> +    end_addr = pmd_addr_end(addr, vma->vm_end);
>>> +    max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>> +
>>> +    /* We only support lazyfree batching for now ... */
>>>        if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>> -        return false;
>>> +        return 1;
>>>        if (pte_unused(pte))
>>> -        return false;
>>> -    if (pte_pfn(pte) != folio_pfn(folio))
>>> -        return false;
>>> +        return 1;
>>> +
>>> +    /* ... where we must be able to batch the whole folio. */
>>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr != 
>>> folio_nr_pages(folio))
>>> +        return 1;
>>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 
>>> fpb_flags,
>>> +                 NULL, NULL, NULL);
>>> -    return folio_pte_batch(folio, addr, ptep, pte, max_nr, 
>>> fpb_flags, NULL,
>>> -                   NULL, NULL) == max_nr;
>>> +    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>>    }
>>>    /*
>>> @@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio 
>>> *folio, struct vm_area_struct *vma,
>>>                if (pte_dirty(pteval))
>>>                    folio_mark_dirty(folio);
>>>            } else if (likely(pte_present(pteval))) {
>>> -            if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
>>> -                can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
>>> -                nr_pages = folio_nr_pages(folio);
>>> +            nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, 
>>> pteval);
>>>                end_addr = address + nr_pages * PAGE_SIZE;
>>>                flush_cache_range(vma, address, end_addr);
>>> @@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio 
>>> *folio, struct vm_area_struct *vma,
>>>                hugetlb_remove_rmap(folio);
>>>            } else {
>>>                folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>>> -            folio_ref_sub(folio, nr_pages - 1);
>>>            }
>>>            if (vma->vm_flags & VM_LOCKED)
>>>                mlock_drain_local();
>>> -        folio_put(folio);
>>> -        /* We have already batched the entire folio */
>>> -        if (nr_pages > 1)
>>> +        folio_put_refs(folio, nr_pages);
>>> +
>>> +        /*
>>> +         * If we are sure that we batched the entire folio and cleared
>>> +         * all PTEs, we can just optimize and stop right here.
>>> +         */
>>> +        if (nr_pages == folio_nr_pages(folio))
>>>                goto walk_done;
>>>            continue;
>>>    walk_abort:
>>> -- 
>>
>> Oops ... Through testing on my machine, I found that the logic doesn't
>> behave as expected because I messed up the meaning of max_nr (the 
>> available
>> scan room in the page table) with folio_nr_pages(folio) :(
>>
>> With the following change:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 5ebffe2137e4..b1407348e14e 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1850,9 +1850,9 @@ static inline unsigned int 
>> folio_unmap_pte_batch(struct folio *folio,
>>               enum ttu_flags flags, pte_t pte)
>>   {
>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    unsigned int max_nr, nr_pages = folio_nr_pages(folio);
>>       unsigned long end_addr, addr = pvmw->address;
>>       struct vm_area_struct *vma = pvmw->vma;
>> -    unsigned int max_nr;
>>       if (flags & TTU_HWPOISON)
>>           return 1;
>> @@ -1870,12 +1870,13 @@ static inline unsigned int 
>> folio_unmap_pte_batch(struct folio *folio,
>>           return 1;
>>       /* ... where we must be able to batch the whole folio. */
> 
> Why is that still required? :)

Sorry ... I was still stuck in the "all-or-nothing" mindset ...

So, IIUC, you mean we should completely remove the "max_nr < nr_pages"
check and just let folio_pte_batch handle whatever partial batch it
safely can.

> 
>> -    if (pte_pfn(pte) != folio_pfn(folio) || max_nr != 
>> folio_nr_pages(folio))
>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
>>           return 1;
>> -    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 
>> fpb_flags,
>> -                 NULL, NULL, NULL);
>> -    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
>> +                 fpb_flags, NULL, NULL, NULL);
>> +
>> +    return (max_nr != nr_pages) ? 1 : max_nr;
> 
> Why is that still required? :)

Then simply return the number of PTEs that consecutively map to the
large folio. Right?
