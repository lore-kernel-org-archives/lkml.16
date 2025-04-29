Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA3429DB9B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917169; cv=none; b=H1Urzvl9TryvEijFOZxAr8wKR3IuMOyxeP1F+HDdvE6u1KLdZG3f76pxPUzF5JbONxbpM0e+8AvdAnHieL22+39oMtSPpNK4X/beCSJdPKjMpU/T0vQwMH6MHbQ1aZdT5yvrdBDCmzQSPKs3LZr4Mh1YLdSlby4xPbc5Ix9oE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917169; c=relaxed/simple;
	bh=+GhfafEzYP5vPOgXCfvc8wvhKT0+V97ZCyBqu2nN76k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuQUOgfhO+7n9vIw1DJoiuseAfWBQcEaPflhtoE3c2Oj3j3NBoimvCSRZ6nWn8QFqDd3+cchuKBj/nVE/NoszyTfYA/Uym6TRd/4av86CIxFGXMWiiNT0w2UZAOCJW7doTT7JEwmaR7Ql30mAOOIC8Aus9zo5cn9zayemal3FE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAC0A1515;
	Tue, 29 Apr 2025 01:59:19 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78FBB3F673;
	Tue, 29 Apr 2025 01:59:16 -0700 (PDT)
Message-ID: <33e8d9fe-d30a-4cbb-b141-133b8989019e@arm.com>
Date: Tue, 29 Apr 2025 14:29:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: Optimize mprotect() by batch-skipping PTEs
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-3-dev.jain@arm.com>
 <ebf73f29-dab4-4551-b1a0-951cae76b5ce@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ebf73f29-dab4-4551-b1a0-951cae76b5ce@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/25 12:44 pm, Anshuman Khandual wrote:
> On 4/29/25 10:53, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 70f59aa8c2a8..ec5d17af7650 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>>   	bool toptier;
>>   	int nid;
>>   
>> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>> +		return true;
>> +
> 
> Moving these here from prot_numa_avoid_fault() could have been done
> earlier, while adding prot_numa_skip() itself in the previous patch
> (in case this helper is determined to be really required).

True. I'll do that.

> 
>>   	/* Also skip shared copy-on-write pages */
>>   	if (is_cow_mapping(vma->vm_flags) &&
>>   	    (folio_maybe_dma_pinned(folio) ||
>> @@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>>   }
>>   
>>   static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>> -		unsigned long addr, pte_t oldpte, int target_node)
>> +		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
>> +		int max_nr, int *nr)
>>   {
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> 
> Flags are all correct.
> 
>>   	struct folio *folio;
>>   	int ret;
>>   
>> @@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>>   		return true;
>>   
>>   	folio = vm_normal_folio(vma, addr, oldpte);
>> -	if (!folio || folio_is_zone_device(folio) ||
>> -	    folio_test_ksm(folio))
>> +	if (!folio)
>>   		return true;
>> +
>>   	ret = prot_numa_skip(vma, folio, target_node);
>> -	if (ret)
>> +	if (ret) {
>> +		if (folio_test_large(folio) && max_nr != 1)
> 
> Conditional checks are all correct.
> 
>> +			*nr = folio_pte_batch(folio, addr, pte, oldpte,
>> +					      max_nr, flags, NULL, NULL, NULL);
>>   		return ret;
>> +	}
>>   	if (folio_use_access_time(folio))
>>   		folio_xchg_access_time(folio,
>>   			jiffies_to_msecs(jiffies));
>> @@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		nr = 1;
> 
> 'nr' resets each iteration.
> 
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>> +			int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> Small nit - 'max_nr' declaration could be moved earlier along with 'nr'.

Sure.

> 
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa &&
>> -			    prot_numa_avoid_fault(vma, addr,
>> -						  oldpte, target_node))
>> +			    prot_numa_avoid_fault(vma, addr, pte,
>> +						  oldpte, target_node,
>> +							  max_nr, &nr))
>>   					continue;
>>   
>>   			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> @@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				pages++;
>>   			}
>>   		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
>>   	arch_leave_lazy_mmu_mode();
>>   	pte_unmap_unlock(pte - 1, ptl);
>>   
> 
> Otherwise LGTM

