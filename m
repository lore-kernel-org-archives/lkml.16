Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C521E1C1A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185503; cv=none; b=GSgQyjENI638v/Pw5fzqgdA/LlElklJO4aN2/1jPhaza2GnF+uBcWfzcJRGQfbVkIqj8ruHoL+uViwchYqQgHK1bqfTo9LdY4xzUaj+uy+Kp/ioC+NriQG03if5tW3emr/VFWJEmm0kBrTW4FYJc4/SaS+9j7aG/Xejhttsj95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185503; c=relaxed/simple;
	bh=1AeM6btpSBjKowSWbEOE/D0W0FlorRV0wIjyDh1kUHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHGG84RzDwz7jlljdaMwkwVju3lhiuiBHgpcTF9L8lwb1gtr49Uj9srcoK06I2R06L4VJ0rDH7w/bDZlWTggkQzQX7Qft3N/6UTKvHLZwtebueIP7Nm3LPMioxx5bpxHkek72WYMfF9IESIJLrli4rfqqnSMNgbdb4Q+v5PL9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC26F1BC0;
	Mon, 10 Feb 2025 03:05:21 -0800 (PST)
Received: from [10.57.81.206] (unknown [10.57.81.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A7193F5A1;
	Mon, 10 Feb 2025 03:04:57 -0800 (PST)
Message-ID: <ff93eb30-ddb6-476b-a209-3329d6e3b06f@arm.com>
Date: Mon, 10 Feb 2025 11:04:55 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/16] mm: Generalize arch_sync_kernel_mappings()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-16-ryan.roberts@arm.com>
 <43c256b6-7e44-41bb-b0c5-866fd4faab5c@arm.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <43c256b6-7e44-41bb-b0c5-866fd4faab5c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 07:45, Anshuman Khandual wrote:
> 
> 
> On 2/5/25 20:39, Ryan Roberts wrote:
>> arch_sync_kernel_mappings() is an optional hook for arches to allow them
>> to synchonize certain levels of the kernel pgtables after modification.
>> But arm64 could benefit from a hook similar to this, paired with a call
>> prior to starting the batch of modifications.
>>
>> So let's introduce arch_update_kernel_mappings_begin() and
>> arch_update_kernel_mappings_end(). Both have a default implementation
>> which can be overridden by the arch code. The default for the former is
>> a nop, and the default for the latter is to call
>> arch_sync_kernel_mappings(), so the latter replaces previous
>> arch_sync_kernel_mappings() callsites. So by default, the resulting
>> behaviour is unchanged.
>>
>> To avoid include hell, the pgtbl_mod_mask type and it's associated
>> macros are moved to their own header.
>>
>> In a future patch, arm64 will opt-in to overriding both functions.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  include/linux/pgtable.h         | 24 +----------------
>>  include/linux/pgtable_modmask.h | 32 ++++++++++++++++++++++
>>  include/linux/vmalloc.h         | 47 +++++++++++++++++++++++++++++++++
>>  mm/memory.c                     |  5 ++--
>>  mm/vmalloc.c                    | 15 ++++++-----
>>  5 files changed, 92 insertions(+), 31 deletions(-)
>>  create mode 100644 include/linux/pgtable_modmask.h
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 94d267d02372..7f70786a73b3 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -4,6 +4,7 @@
>>  
>>  #include <linux/pfn.h>
>>  #include <asm/pgtable.h>
>> +#include <linux/pgtable_modmask.h>
>>  
>>  #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
>>  #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
>> @@ -1786,29 +1787,6 @@ static inline bool arch_has_pfn_modify_check(void)
>>  # define PAGE_KERNEL_EXEC PAGE_KERNEL
>>  #endif
>>  
>> -/*
>> - * Page Table Modification bits for pgtbl_mod_mask.
>> - *
>> - * These are used by the p?d_alloc_track*() set of functions an in the generic
>> - * vmalloc/ioremap code to track at which page-table levels entries have been
>> - * modified. Based on that the code can better decide when vmalloc and ioremap
>> - * mapping changes need to be synchronized to other page-tables in the system.
>> - */
>> -#define		__PGTBL_PGD_MODIFIED	0
>> -#define		__PGTBL_P4D_MODIFIED	1
>> -#define		__PGTBL_PUD_MODIFIED	2
>> -#define		__PGTBL_PMD_MODIFIED	3
>> -#define		__PGTBL_PTE_MODIFIED	4
>> -
>> -#define		PGTBL_PGD_MODIFIED	BIT(__PGTBL_PGD_MODIFIED)
>> -#define		PGTBL_P4D_MODIFIED	BIT(__PGTBL_P4D_MODIFIED)
>> -#define		PGTBL_PUD_MODIFIED	BIT(__PGTBL_PUD_MODIFIED)
>> -#define		PGTBL_PMD_MODIFIED	BIT(__PGTBL_PMD_MODIFIED)
>> -#define		PGTBL_PTE_MODIFIED	BIT(__PGTBL_PTE_MODIFIED)
>> -
>> -/* Page-Table Modification Mask */
>> -typedef unsigned int pgtbl_mod_mask;
>> -
>>  #endif /* !__ASSEMBLY__ */
>>  
>>  #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
>> diff --git a/include/linux/pgtable_modmask.h b/include/linux/pgtable_modmask.h
>> new file mode 100644
>> index 000000000000..5a21b1bb8df3
>> --- /dev/null
>> +++ b/include/linux/pgtable_modmask.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_PGTABLE_MODMASK_H
>> +#define _LINUX_PGTABLE_MODMASK_H
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +/*
>> + * Page Table Modification bits for pgtbl_mod_mask.
>> + *
>> + * These are used by the p?d_alloc_track*() set of functions an in the generic
>> + * vmalloc/ioremap code to track at which page-table levels entries have been
>> + * modified. Based on that the code can better decide when vmalloc and ioremap
>> + * mapping changes need to be synchronized to other page-tables in the system.
>> + */
>> +#define		__PGTBL_PGD_MODIFIED	0
>> +#define		__PGTBL_P4D_MODIFIED	1
>> +#define		__PGTBL_PUD_MODIFIED	2
>> +#define		__PGTBL_PMD_MODIFIED	3
>> +#define		__PGTBL_PTE_MODIFIED	4
>> +
>> +#define		PGTBL_PGD_MODIFIED	BIT(__PGTBL_PGD_MODIFIED)
>> +#define		PGTBL_P4D_MODIFIED	BIT(__PGTBL_P4D_MODIFIED)
>> +#define		PGTBL_PUD_MODIFIED	BIT(__PGTBL_PUD_MODIFIED)
>> +#define		PGTBL_PMD_MODIFIED	BIT(__PGTBL_PMD_MODIFIED)
>> +#define		PGTBL_PTE_MODIFIED	BIT(__PGTBL_PTE_MODIFIED)
>> +
>> +/* Page-Table Modification Mask */
>> +typedef unsigned int pgtbl_mod_mask;
>> +
>> +#endif /* !__ASSEMBLY__ */
>> +
>> +#endif /* _LINUX_PGTABLE_MODMASK_H */
>> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>> index 16dd4cba64f2..cb5d8f1965a1 100644
>> --- a/include/linux/vmalloc.h
>> +++ b/include/linux/vmalloc.h
>> @@ -11,6 +11,7 @@
>>  #include <asm/page.h>		/* pgprot_t */
>>  #include <linux/rbtree.h>
>>  #include <linux/overflow.h>
>> +#include <linux/pgtable_modmask.h>
>>  
>>  #include <asm/vmalloc.h>
>>  
>> @@ -213,6 +214,26 @@ extern int remap_vmalloc_range(struct vm_area_struct *vma, void *addr,
>>  int vmap_pages_range(unsigned long addr, unsigned long end, pgprot_t prot,
>>  		     struct page **pages, unsigned int page_shift);
>>  
>> +#ifndef arch_update_kernel_mappings_begin
>> +/**
>> + * arch_update_kernel_mappings_begin - A batch of kernel pgtable mappings are
>> + * about to be updated.
>> + * @start: Virtual address of start of range to be updated.
>> + * @end: Virtual address of end of range to be updated.
>> + *
>> + * An optional hook to allow architecture code to prepare for a batch of kernel
>> + * pgtable mapping updates. An architecture may use this to enter a lazy mode
>> + * where some operations can be deferred until the end of the batch.
>> + *
>> + * Context: Called in task context and may be preemptible.
>> + */
>> +static inline void arch_update_kernel_mappings_begin(unsigned long start,
>> +						     unsigned long end)
>> +{
>> +}
>> +#endif
>> +
>> +#ifndef arch_update_kernel_mappings_end
>>  /*
>>   * Architectures can set this mask to a combination of PGTBL_P?D_MODIFIED values
>>   * and let generic vmalloc and ioremap code know when arch_sync_kernel_mappings()
>> @@ -229,6 +250,32 @@ int vmap_pages_range(unsigned long addr, unsigned long end, pgprot_t prot,
>>   */
>>  void arch_sync_kernel_mappings(unsigned long start, unsigned long end);
>>  
>> +/**
>> + * arch_update_kernel_mappings_end - A batch of kernel pgtable mappings have
>> + * been updated.
>> + * @start: Virtual address of start of range that was updated.
>> + * @end: Virtual address of end of range that was updated.
>> + *
>> + * An optional hook to inform architecture code that a batch update is complete.
>> + * This balances a previous call to arch_update_kernel_mappings_begin().
>> + *
>> + * An architecture may override this for any purpose, such as exiting a lazy
>> + * mode previously entered with arch_update_kernel_mappings_begin() or syncing
>> + * kernel mappings to a secondary pgtable. The default implementation calls an
>> + * arch-provided arch_sync_kernel_mappings() if any arch-defined pgtable level
>> + * was updated.
>> + *
>> + * Context: Called in task context and may be preemptible.
>> + */
>> +static inline void arch_update_kernel_mappings_end(unsigned long start,
>> +						   unsigned long end,
>> +						   pgtbl_mod_mask mask)
>> +{
>> +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>> +		arch_sync_kernel_mappings(start, end);
>> +}
> 
> One arch call back calling yet another arch call back sounds bit odd. 

It's no different from the default implementation of arch_make_huge_pte()
calling pte_mkhuge() is it?

> Also
> should not ARCH_PAGE_TABLE_SYNC_MASK be checked both for __begin and __end
> callbacks in case a platform subscribes into this framework. 

I'm not sure how that would work? The mask is accumulated during the pgtable
walk. So we don't have a mask until we get to the end.

> Instead the
> following changes sound more reasonable, but will also require some more
> updates for the current platforms using arch_sync_kernel_mappings().
> 
> if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> 	arch_update_kernel_mappings_begin()

This makes no sense. mask is always 0 before doing the walk.

> 
> if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> 	arch_update_kernel_mappings_end()
> 
> Basically when any platform defines ARCH_PAGE_TABLE_SYNC_MASK and subscribes
> this framework, it will also provide arch_update_kernel_mappings_begin/end()
> callbacks as required.

Personally I think it's cleaner to just pass mask to
arch_update_kernel_mappings_end() and it the function decide what it wants to do.

But it's a good question as to whether we should refactor x86 and arm to
directly implement arch_update_kernel_mappings_end() instead of
arch_sync_kernel_mappings(). Personally I thought it was better to avoid the
churn. But interested in others opinions.

Thanks,
Ryan

> 
>> +#endif
>> +
>>  /*
>>   *	Lowlevel-APIs (not for driver use!)
>>   */
>> diff --git a/mm/memory.c b/mm/memory.c
>> index a15f7dd500ea..f80930bc19f6 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3035,6 +3035,8 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>>  	if (WARN_ON(addr >= end))
>>  		return -EINVAL;
>>  
>> +	arch_update_kernel_mappings_begin(start, end);
>> +
>>  	pgd = pgd_offset(mm, addr);
>>  	do {
>>  		next = pgd_addr_end(addr, end);
>> @@ -3055,8 +3057,7 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>>  			break;
>>  	} while (pgd++, addr = next, addr != end);
>>  
>> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>> -		arch_sync_kernel_mappings(start, start + size);
>> +	arch_update_kernel_mappings_end(start, end, mask);
>>  
>>  	return err;
>>  }
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 50fd44439875..c5c51d86ef78 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -312,10 +312,10 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>>  	pgtbl_mod_mask mask = 0;
>>  	int err;
>>  
>> +	arch_update_kernel_mappings_begin(addr, end);
>>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>>  				 ioremap_max_page_shift, &mask);
>> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>> -		arch_sync_kernel_mappings(addr, end);
>> +	arch_update_kernel_mappings_end(addr, end, mask);
>>  
>>  	flush_cache_vmap(addr, end);
>>  	if (!err)
>> @@ -463,6 +463,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>>  	pgtbl_mod_mask mask = 0;
>>  
>>  	BUG_ON(addr >= end);
>> +
>> +	arch_update_kernel_mappings_begin(start, end);
>> +
>>  	pgd = pgd_offset_k(addr);
>>  	do {
>>  		next = pgd_addr_end(addr, end);
>> @@ -473,8 +476,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>>  		vunmap_p4d_range(pgd, addr, next, &mask);
>>  	} while (pgd++, addr = next, addr != end);
>>  
>> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>> -		arch_sync_kernel_mappings(start, end);
>> +	arch_update_kernel_mappings_end(start, end, mask);
>>  }
>>  
>>  void vunmap_range_noflush(unsigned long start, unsigned long end)
>> @@ -625,6 +627,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>  
>>  	WARN_ON(page_shift < PAGE_SHIFT);
>>  
>> +	arch_update_kernel_mappings_begin(start, end);
>> +
>>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>>  			page_shift == PAGE_SHIFT) {
>>  		err = vmap_small_pages_range_noflush(addr, end, prot, pages,
>> @@ -642,8 +646,7 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>  		}
>>  	}
>>  
>> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>> -		arch_sync_kernel_mappings(start, end);
>> +	arch_update_kernel_mappings_end(start, end, mask);
>>  
>>  	return err;
>>  }

