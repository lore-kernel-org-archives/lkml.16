Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDF2690F9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846616; cv=none; b=c5zPwxvCTyKDlB+XW1ecQO6Z4UKU/frro4cKCDBbkyFrdMuMma577IAWRIh30vBE0LM+GkzN/eOl3cMuuWczlUQEvt2iuqvgsir7alccBasGyFrFzL4J7DfUEMl0HDWDja7CgxGsfgrOHcWVAzL5e9VOL9+EjpK6jix8ZhoQR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846616; c=relaxed/simple;
	bh=wpc9QTSjTNiKBhsTcu4EGr1jK0YJNp7R1I2Ihug9VOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opK/yMgWwlIWE/Bqrh9FyLo9gLEgEHD4VMbdSfA3I48Yjp+05aoejA0bT7jiCFYoShGSLoPjVRYWy6DAjF7fFtMHiKly32n13vZmXEewMZq4o58ggmZNGEd/7xsTQZGjRTg2ogQHbuw87PApxJGnVWYJ2HME1n1dPq40/JCqh04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VU8VOs8X; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VU8VOs8X"
Message-ID: <12dd5cdf-6255-4645-b132-b79a3a01f492@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745846612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6OvVULSMnVqxjIcXe5c/gS9iiRSrJXCtK4Gv9I6sXU=;
	b=VU8VOs8XYESOTAi+d224zLezIQx56aTpzXhqKHFzvCP7BZLvUX7R9EZd0wKIKdkuiEWrBz
	7PNE3WkzyXJYQfgEK4C1ymaX/K+BtlizgOz0whaBeB4C+klL4UrQCH1zH0zwyNFnq8VOVm
	guSrINGnNA/HB6lOBUKc/baftPh8bFA=
Date: Mon, 28 Apr 2025 21:23:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] mm: Batch around can_change_pte_writable()
Content-Language: en-US
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250428120414.12101-1-dev.jain@arm.com>
 <20250428120414.12101-7-dev.jain@arm.com>
 <edf768ec-e874-4ca6-9fd7-b94ccc1c1059@linux.dev>
 <083865e8-572b-41b2-9221-3cee01349fab@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <083865e8-572b-41b2-9221-3cee01349fab@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/4/28 20:59, Dev Jain wrote:
> 
> 
> On 28/04/25 6:20 pm, Lance Yang wrote:
>> Hey Dev,
>>
>> On 2025/4/28 20:04, Dev Jain wrote:
>>> In preparation for patch 7, we need to properly batch around
>>> can_change_pte_writable(). We batch around pte_needs_soft_dirty_wp() by
>>> the corresponding fpb flag, we batch around the page-anon exclusive 
>>> check
>>> using folio_maybe_mapped_shared(); modify_prot_start_ptes() collects the
>>> dirty and access bits across the batch, therefore batching across
>>> pte_dirty(): this is correct since the dirty bit on the PTE really
>>> is just an indication that the folio got written to, so even if
>>> the PTE is not actually dirty (but one of the PTEs in the batch is),
>>> the wp-fault optimization can be made.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   include/linux/mm.h | 4 ++--
>>>   mm/gup.c           | 2 +-
>>>   mm/huge_memory.c   | 4 ++--
>>>   mm/memory.c        | 6 +++---
>>>   mm/mprotect.c      | 9 ++++++---
>>>   5 files changed, 14 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 5eb0d77c4438..ffa02e15863f 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -2710,8 +2710,8 @@ int get_cmdline(struct task_struct *task, char 
>>> *buffer, int buflen);
>>>   #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>>>                           MM_CP_UFFD_WP_RESOLVE)
>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> -                 pte_t pte);
>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> +                 pte_t pte, struct folio *folio, unsigned int nr);
>>>   extern long change_protection(struct mmu_gather *tlb,
>>>                     struct vm_area_struct *vma, unsigned long start,
>>>                     unsigned long end, unsigned long cp_flags);
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 84461d384ae2..6a605fc5f2cb 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -614,7 +614,7 @@ static inline bool can_follow_write_common(struct 
>>> page *page,
>>>           return false;
>>>       /*
>>> -     * See can_change_pte_writable(): we broke COW and could map the 
>>> page
>>> +     * See can_change_ptes_writable(): we broke COW and could map 
>>> the page
>>>        * writable if we have an exclusive anonymous page ...
>>>        */
>>>       return page && PageAnon(page) && PageAnonExclusive(page);
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 28c87e0e036f..e5496c0d9e7e 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2032,12 +2032,12 @@ static inline bool 
>>> can_change_pmd_writable(struct vm_area_struct *vma,
>>>           return false;
>>>       if (!(vma->vm_flags & VM_SHARED)) {
>>> -        /* See can_change_pte_writable(). */
>>> +        /* See can_change_ptes_writable(). */
>>>           page = vm_normal_page_pmd(vma, addr, pmd);
>>>           return page && PageAnon(page) && PageAnonExclusive(page);
>>>       }
>>> -    /* See can_change_pte_writable(). */
>>> +    /* See can_change_ptes_writable(). */
>>>       return pmd_dirty(pmd);
>>>   }
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index b9e8443aaa86..b1fda3de8d27 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -750,7 +750,7 @@ static void restore_exclusive_pte(struct 
>>> vm_area_struct *vma,
>>>           pte = pte_mkuffd_wp(pte);
>>>       if ((vma->vm_flags & VM_WRITE) &&
>>> -        can_change_pte_writable(vma, address, pte)) {
>>> +        can_change_ptes_writable(vma, address, pte, NULL, 1)) {
>>>           if (folio_test_dirty(folio))
>>>               pte = pte_mkdirty(pte);
>>>           pte = pte_mkwrite(pte, vma);
>>> @@ -5767,7 +5767,7 @@ static void numa_rebuild_large_mapping(struct 
>>> vm_fault *vmf, struct vm_area_stru
>>>               ptent = pte_modify(ptent, vma->vm_page_prot);
>>>               writable = pte_write(ptent);
>>>               if (!writable && pte_write_upgrade &&
>>> -                can_change_pte_writable(vma, addr, ptent))
>>> +                can_change_ptes_writable(vma, addr, ptent, NULL, 1))
>>>                   writable = true;
>>>           }
>>> @@ -5808,7 +5808,7 @@ static vm_fault_t do_numa_page(struct vm_fault 
>>> *vmf)
>>>        */
>>>       writable = pte_write(pte);
>>>       if (!writable && pte_write_upgrade &&
>>> -        can_change_pte_writable(vma, vmf->address, pte))
>>> +        can_change_ptes_writable(vma, vmf->address, pte, NULL, 1))
>>>           writable = true;
>>>       folio = vm_normal_folio(vma, vmf->address, pte);
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index 33eabc995584..362fd7e5457d 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -40,8 +40,8 @@
>>>   #include "internal.h"
>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> -                 pte_t pte)
>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> +                  pte_t pte, struct folio *folio, unsigned int nr)
>>>   {
>>>       struct page *page;
>>> @@ -67,6 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct 
>>> *vma, unsigned long addr,
>>>            * write-fault handler similarly would map them writable 
>>> without
>>>            * any additional checks while holding the PT lock.
>>>            */
>>> +        if (unlikely(nr != 1))
>>> +            return !folio_maybe_mapped_shared(folio);
>>> +
>>>           page = vm_normal_page(vma, addr, pte);
>>>           return page && PageAnon(page) && PageAnonExclusive(page);
>>>       }
>>
>> IIUC, As mentioned in the comment above, we should do the same 
>> anonymous check
>> to large folios. And folio_maybe_mapped_shared() already handles both 
>> order-0
>> and large folios nicely, so we could simplify the logic as follows:
> 
> Thanks. Although we will have to call vm_normal_folio() in case of ! 
> folio, since we may not have the folio already for nr == 1 case.

Ah, I see. Should we still check folio_test_anon() when nr != 1?

Thanks,
Lance

> 
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 1605e89349d2..df56a30bb241 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -43,8 +43,6 @@
>>   bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned 
>> long addr,
>>                                pte_t pte, struct folio *folio, 
>> unsigned int nr)
>>   {
>> -       struct page *page;
>> -
>>          if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>                  return false;
>>
>> @@ -67,11 +65,7 @@ bool can_change_ptes_writable(struct vm_area_struct 
>> *vma, unsigned long addr,
>>                   * write-fault handler similarly would map them 
>> writable without
>>                   * any additional checks while holding the PT lock.
>>                   */
>> -               if (unlikely(nr != 1))
>> -                       return !folio_maybe_mapped_shared(folio);
>> -
>> -               page = vm_normal_page(vma, addr, pte);
>> -               return page && PageAnon(page) && PageAnonExclusive(page);
>> +               return folio_test_anon(folio) && ! 
>> folio_maybe_mapped_shared(folio);
>>          }
>>
>>          VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>> -- 
>>
>> Thanks,
>> Lance
>>
>>> @@ -222,7 +225,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                */
>>>               if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>                   !pte_write(ptent) &&
>>> -                can_change_pte_writable(vma, addr, ptent))
>>> +                can_change_ptes_writable(vma, addr, ptent, folio, 1))
>>>                   ptent = pte_mkwrite(ptent, vma);
>>>               ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>>
>>
> 

