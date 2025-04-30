Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569CB1CD0C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019109; cv=none; b=OCvNkgMoiCgu4hAQ1TUGVbqw+MmBQCA3zTMa8SA332SRJ/uErt7664zuKaYulw5FtJnFpXBS5MFtUlPlCG8A9FVJV6px9CFNMUTh/USQvU8P+t1XXvRIzZlBqOGKKz54MAOANwoCqQFIM10p+CF9ywonYnQGvE3nl/8BXwb1wTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019109; c=relaxed/simple;
	bh=RjNbOMEc6VzjN67u7cWuW3x1hNGUQR2Zn+I/VajPoJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LphN1rggfvTEiVxrwnxgtGqXkf7ogtclmD810WRhDLQJu6aM/7JkCULp6FwZkFAWjPXd3uLpGZ2BP0xsbkWVi3qkpwTrLq+tdPw9Co7uq94pcZ+wNGn10umfsIJaC6Z/Rzu3j+zu7fISj0njbQb1YeG7C+XExBDyK3A9gJ1/ovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5979B106F;
	Wed, 30 Apr 2025 06:18:19 -0700 (PDT)
Received: from [10.57.84.121] (unknown [10.57.84.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A46223F5A1;
	Wed, 30 Apr 2025 06:18:21 -0700 (PDT)
Message-ID: <40826f42-07d2-4c00-8173-a5eb19d2335c@arm.com>
Date: Wed, 30 Apr 2025 14:18:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: Optimize mprotect() by batch-skipping PTEs
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-3-dev.jain@arm.com>
 <f4a90024-3cc7-4536-84b0-665021d96125@lucifer.local>
 <9687592f-ec04-410f-9fb2-9777edfe1178@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9687592f-ec04-410f-9fb2-9777edfe1178@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/04/2025 07:37, Dev Jain wrote:
> 
> 
> On 29/04/25 6:49 pm, Lorenzo Stoakes wrote:
>> Very very very nitty on subject (sorry I realise this is annoying :P) -
>> generally don't need to capitalise 'Optimize' here :>)
>>
>> Generally I like the idea here. But some issues on impl.
>>
>> On Tue, Apr 29, 2025 at 10:53:31AM +0530, Dev Jain wrote:
>>> In case of prot_numa, there are various cases in which we can skip to the
>>> next iteration. Since the skip condition is based on the folio and not
>>> the PTEs, we can skip a PTE batch.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   mm/mprotect.c | 27 ++++++++++++++++++++-------
>>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index 70f59aa8c2a8..ec5d17af7650 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma,
>>> struct folio *folio,
>>>       bool toptier;
>>>       int nid;
>>>
>>> +    if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>>> +        return true;
>>> +
>>
>> Hm why not just put this here from the start? I think you should put this back
>> in the prior commit.
>>
>>>       /* Also skip shared copy-on-write pages */
>>>       if (is_cow_mapping(vma->vm_flags) &&
>>>           (folio_maybe_dma_pinned(folio) ||
>>> @@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma,
>>> struct folio *folio,
>>>   }
>>>
>>>   static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>>> -        unsigned long addr, pte_t oldpte, int target_node)
>>> +        unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
>>> +        int max_nr, int *nr)
>>
>> Hate this ptr to nr.
>>
>> Why not just return nr, if it's 0 then skip? Simple!
>>
>>>   {
>>> +    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>       struct folio *folio;
>>>       int ret;
>>>
>>> @@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct
>>> *vma,
>>>           return true;
>>>
>>>       folio = vm_normal_folio(vma, addr, oldpte);
>>> -    if (!folio || folio_is_zone_device(folio) ||
>>> -        folio_test_ksm(folio))
>>> +    if (!folio)
>>>           return true;
>>> +
>>
>> Very nitty, but stray extra line unless intended...
>>
>> Not sure why we can't just put this !folio check in prot_numa_skip()?
> 
> Because we won't be able to batch if the folio is NULL.
> 
> I think I really messed up by having separate patch 1 and 2. The real intent of
> patch 1 was to do batching in patch 2 *and* not have insane indentation. Perhaps
> I should merge them, or completely separate them logically, I'll figure this out.

I'd be inclined to just merge into single patch...

> 
>>
>>>       ret = prot_numa_skip(vma, folio, target_node);
>>> -    if (ret)
>>> +    if (ret) {
>>> +        if (folio_test_large(folio) && max_nr != 1)
>>> +            *nr = folio_pte_batch(folio, addr, pte, oldpte,
>>> +                          max_nr, flags, NULL, NULL, NULL);
>>
>> So max_nr can <= 0 too? Shouldn't this be max_nr > 1?
>>
>>>           return ret;
>>
>> Again x = fn_return_bool(); if (x) { return x; } is a bit silly, just do if
>> (fn_return_bool()) { return true; }.
>>
>> If we return the number of pages, then this can become really simple, like:
>>
>> I feel like maybe we should abstract the folio large handling here, though it'd
>> be a tiny function so hm.
>>
>> Anyway assuming we leave it in place, and return number of pages processed, this
>> can become:
>>
>> if (prot_numa_skip(vma, folio, target_node)) {
>>     if (folio_test_large(folio) && max_nr > 1)
>>         return folio_pte_batch(folio, addr, pte, oldpte, max_nr, flags,
>>                 NULL, NULL, NULL);
>>     return 1;
>> }
>>
>> Which is neater I think!
>>
>>
>>> +    }
>>>       if (folio_use_access_time(folio))
>>>           folio_xchg_access_time(folio,
>>>               jiffies_to_msecs(jiffies));
>>> @@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>       bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>>       bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>>       bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>>> +    int nr;
>>>
>>>       tlb_change_page_size(tlb, PAGE_SIZE);
>>>       pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>>> @@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>       flush_tlb_batched_pending(vma->vm_mm);
>>>       arch_enter_lazy_mmu_mode();
>>>       do {
>>> +        nr = 1;
>>>           oldpte = ptep_get(pte);
>>>           if (pte_present(oldpte)) {
>>> +            int max_nr = (end - addr) >> PAGE_SHIFT;
>>
>> Not a fan of open-coding this. Since we already provide addr, why not just
>> provide end as well and have prot_numa_avoid_fault() calculate it?
>>
>>>               pte_t ptent;
>>>
>>>               /*
>>> @@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                * pages. See similar comment in change_huge_pmd.
>>>                */
>>>               if (prot_numa &&
>>> -                prot_numa_avoid_fault(vma, addr,
>>> -                          oldpte, target_node))
>>> +                prot_numa_avoid_fault(vma, addr, pte,
>>> +                          oldpte, target_node,
>>> +                              max_nr, &nr))
>>>                       continue;
>>>
>>>               oldpte = ptep_modify_prot_start(vma, addr, pte);
>>> @@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                   pages++;
>>>               }
>>>           }
>>> -    } while (pte++, addr += PAGE_SIZE, addr != end);
>>> +    } while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
>>
>> This is icky, having 'nr' here like this.

For better or worse, this is the pattern we have already established in other
loops that are batching-aware. See zap_pte_range(), copy_pte_range(), etc. So
I'd prefer to follow that pattern here, as Dev has done.

Thanks.
Ryan

>>
>> But alternatives might be _even more_ icky (that is advancing both on
>> prot_numa_avoid_fault() so probably we need to keep it like this.
>>
>> Maybe more a moan at the C programming language tbh haha!
>>
>>
>>>       arch_leave_lazy_mmu_mode();
>>>       pte_unmap_unlock(pte - 1, ptl);
>>>
>>> -- 
>>> 2.30.2
>>>
> 

