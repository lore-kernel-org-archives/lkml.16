Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F311722CBD8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610701; cv=none; b=rP6FAupvFGtOLyKv+kAeqlAJpt5Xg/AhiZZ4OiWNflA4OjtkjQW4G6oSRnhY5okaaMaqMIUp+abzyj50lV9FK3VJ1f766FW/4UMdnOXcI3I5Uoy+vCeqFpaj/TuYdnTQ9hJY9aN6zljAssA4YA9+Fa2OBoFevTFU1Mry37xfmr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610701; c=relaxed/simple;
	bh=CyA5LWLUTK4+xaagvwD2rJ+sMM3eFUJK4DSimyZmLgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhBC4YkstAhHlWVlEu8dyaAOznXGFJ4nV2fGxWfqxHoFRDO6f5Ok6Z1V27FDcOjGkW7QtBT/cK63B7mLKiIGSKjckWRN0HxyDM3EN9Dx7ar2OOISYnWZM/ybP1T9ye76uYo0HRYGnWp3TPENZF5nOra+wbcaWqjnW3lgiNNxnjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9B1C1692;
	Fri, 30 May 2025 06:11:22 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9744B3F5A1;
	Fri, 30 May 2025 06:11:37 -0700 (PDT)
Message-ID: <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
Date: Fri, 30 May 2025 14:11:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com,
 anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250530123527.GA30463@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2025 13:35, Will Deacon wrote:
> On Fri, May 30, 2025 at 12:50:40PM +0100, Ryan Roberts wrote:
>> On 30/05/2025 10:14, Dev Jain wrote:
>>>
>>> On 30/05/25 2:10 pm, Ryan Roberts wrote:
>>>> On 30/05/2025 09:20, Dev Jain wrote:
>>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>>> because an intermediate table may be removed, potentially causing the
>>>>> ptdump code to dereference an invalid address. We want to be able to
>>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>>> between two different vm_structs; two vmalloc objects running this same
>>>>> code path will point to different page tables, hence there is no race.
>>>
>>> My "correction" from race->no problem was incorrect after all :) There will
>>> be no race too since the vm_struct object has exclusive access to whatever
>>> table it is clearing.
>>>
>>>>>
>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>> ---
>>>>>   arch/arm64/include/asm/vmalloc.h | 6 ++----
>>>>>   arch/arm64/mm/mmu.c              | 7 +++++++
>>>>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>>>>> index 38fafffe699f..28b7173d8693 100644
>>>>> --- a/arch/arm64/include/asm/vmalloc.h
>>>>> +++ b/arch/arm64/include/asm/vmalloc.h
>>>>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>>>>       /*
>>>>>        * SW table walks can't handle removal of intermediate entries.
>>>>>        */
>>>>> -    return pud_sect_supported() &&
>>>>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>>> +    return pud_sect_supported();
>>>>>   }
>>>>>     #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>>>>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>>>>   {
>>>>> -    /* See arch_vmap_pud_supported() */
>>>>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>>> +    return true;
>>>>>   }
>>>>>     #endif
>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>> index ea6695d53fb9..798cebd9e147 100644
>>>>> --- a/arch/arm64/mm/mmu.c
>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>>>       }
>>>>>         table = pte_offset_kernel(pmdp, addr);
>>>>> +
>>>>> +    /* Synchronize against ptdump_walk_pgd() */
>>>>> +    mmap_read_lock(&init_mm);
>>>>>       pmd_clear(pmdp);
>>>>> +    mmap_read_unlock(&init_mm);
>>>> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
>>>> exclusive with any read_lock holders) for the duration of the table walk, so it
>>>> will either consistently see the pgtables before or after this removal. It will
>>>> never disappear during the walk, correct?
>>>>
>>>> I guess there is a risk of this showing up as contention with other init_mm
>>>> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
>>>> are called sufficiently rarely that the risk is very small. Let's fix any perf
>>>> problem if/when we see it.
>>>
>>> We can avoid all of that by my initial approach - to wrap the lock around
>>> CONFIG_PTDUMP_DEBUGFS.
>>> I don't have a strong opinion, just putting it out there.
>>
>> (I wrote then failed to send earlier):
>>
>> It's ugly though. Personally I'd prefer to keep it simple unless we have clear
>> evidence that its needed. I was just laying out my justification for not needing
>> to doing the conditional wrapping in this comment.
> 
> I really don't think we should be adding unconditional locking overhead
> to core mm routines purely to facilitate a rarely used debug option.
> 
> Instead, can we either adopt something like the RCU-like walk used by
> fast GUP or stick the locking behind a static key that's only enabled
> when a ptdump walk is in progress (a bit like how
> hugetlb_vmemmap_optimize_folio() manipulates hugetlb_optimize_vmemmap_key)?

My sense is that the static key will be less effort and can be contained fully
in arm64. I think we would need to enable the key around the call to
ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx(). Then where Dev is
currently taking the read lock, that would be contingent on the key being
enabled and the unlock would be contingent on having taken the lock.

Does that sound like an acceptable approach?

> 
> Will

