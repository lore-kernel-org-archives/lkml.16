Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A7D307487
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850187; cv=none; b=DJxyX01mA1rycJ+7JaqE2xP/gZi9Xq7l+yxm0rME14JHNsly/g5zYhvaJiSUKSDwWZ7VOmSU0CczIpCL3rm7CkzEVbdy9hFui36h2ogfDkfnOZC+vas1fu4LQzo7vZrr4Tn6ts5w+8xFsOMLzd1cloycwfDNwfszAUCj1BAqvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850187; c=relaxed/simple;
	bh=ltfsTOrz74bgz+hG1GM0GVVrvIkEttiUBrzMdHW/BPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiHKWCwy7K7xKzpaO9Pumt6Hz/u3SZEiyoO9u/yNB/YBZGGBHQ9l3QCGW0r8gRokCYhvz0MH7my/aIo3i12TSZ4uJCDQxfkOLEZhPOacTdZu8FcHS/0ItE9YWkKJ2kWUWFw+VHGaqbFdcwWhAke3pO7rqg7BWuRPtnYj+PsY6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A48106F;
	Wed, 25 Jun 2025 04:16:07 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A61D3F58B;
	Wed, 25 Jun 2025 04:16:23 -0700 (PDT)
Message-ID: <79677ade-3743-4663-8699-08a069ecdf09@arm.com>
Date: Wed, 25 Jun 2025 12:16:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <01b48f6c-81cf-499c-97f7-0b537364c5e7@arm.com>
 <805f60c7-9c76-4adc-a679-658d60e08a3e@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <805f60c7-9c76-4adc-a679-658d60e08a3e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 12:12, Dev Jain wrote:
> 
> On 25/06/25 4:05 pm, Ryan Roberts wrote:
>> On 16/06/2025 11:33, Dev Jain wrote:
>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>> because an intermediate table may be removed, potentially causing the
>>> ptdump code to dereference an invalid address. We want to be able to
>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>> between two different vm_structs; two vmalloc objects running this same
>>> code path will point to different page tables, hence there is no race.
>>>
>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>> 512 times again via pmd_free_pte_page().
>>>
>>> We implement the locking mechanism using static keys, since the chance
>>> of a race is very small. Observe that the synchronization is needed
>>> to avoid the following race:
>>>
>>> CPU1                            CPU2
>>>                         take reference of PMD table
>>> pud_clear()
>>> pte_free_kernel()
>>>                         walk freed PMD table
>>>
>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>
>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>> we are safe. If not, then the patched-in read and write locks help us
>>> avoid the race.
>>>
>>> To implement the mechanism, we need the static key access from mmu.c and
>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>> target in the Makefile, therefore we cannot initialize the key there, as
>>> is being done, for example, in the static key implementation of
>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>> the jump_label mechanism. Declare the key there and define the key to false
>>> in mmu.c.
>>>
>>> No issues were observed with mm-selftests. No issues were observed while
>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>> sysfs in a loop.
>>>
>>> v2->v3:
>>>   - Use static key mechanism
>>>
>>> v1->v2:
>>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>     the lock 512 times again via pmd_free_pte_page()
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>   arch/arm64/mm/ptdump.c              |  5 +++
>>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/
>>> cpufeature.h
>>> index c4326f1cb917..3e386563b587 100644
>>> --- a/arch/arm64/include/asm/cpufeature.h
>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>> @@ -26,6 +26,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/cpumask.h>
>>>   +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>> Is this really the correct header file for this declaration? Perhaps it would be
>> better in arch/arm64/include/asm/ptdump.h ?
> 
> I tried a lot of things; this didn't work. I get the following:
> 
> ld: arch/arm64/mm/mmu.o:(__jump_table+0x8): undefined reference to
> `ptdump_lock_key'
> ld: arch/arm64/mm/mmu.o:(__jump_table+0x48): undefined reference to
> `ptdump_lock_key'
> 
> in case of !CONFIG_PTDUMP_DEBUGFS.

I think you're talking about *defining*. I'm talking about *declaring*. By all
means define it in mmu.c. Then you always have it. But the declaration doesn't
need to live in cpufeature.h does it? Why can't it live in ptdump.h? The
declaration is just a compiler directive really; it doesn't control the output
of any symbols.

> 
>>
>>>   /*
>>>    * CPU feature register tracking
>>>    *
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8fcf59ba39db..e242ba428820 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -41,11 +41,14 @@
>>>   #include <asm/tlbflush.h>
>>>   #include <asm/pgalloc.h>
>>>   #include <asm/kfence.h>
>>> +#include <asm/cpufeature.h>
>>>     #define NO_BLOCK_MAPPINGS    BIT(0)
>>>   #define NO_CONT_MAPPINGS    BIT(1)
>>>   #define NO_EXEC_MAPPINGS    BIT(2)    /* assumes FEAT_HPDS is not used */
>>>   +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>>> +
>>>   enum pgtable_type {
>>>       TABLE_PTE,
>>>       TABLE_PMD,
>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>       return 1;
>>>   }
>>>   -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>>   {
>>> +    bool lock_taken = false;
>> As David commented, no need for this.
>>
>>>       pte_t *table;
>>>       pmd_t pmd;
>>>   @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>           return 1;
>>>       }
>>>   +    /* See comment in pud_free_pmd_page for static key logic */
>>>       table = pte_offset_kernel(pmdp, addr);
>>>       pmd_clear(pmdp);
>>>       __flush_tlb_kernel_pgtable(addr);
>>> +    if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>> +        mmap_read_lock(&init_mm);
>>> +        lock_taken = true;
>>> +    }
>>> +    if (unlikely(lock_taken))
>>> +        mmap_read_unlock(&init_mm);
>>> +
>> As per David's comment this can just be:
>>
>> if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>     mmap_read_lock(&init_mm);
>>     mmap_read_unlock(&init_mm);
>> }
>>
>>>       pte_free_kernel(NULL, table);
>>>       return 1;
>>>   }
>>>   +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>> +{
>>> +    return __pmd_free_pte_page(pmdp, addr, true);
>>> +}
>>> +
>>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>   {
>>> +    bool lock_taken = false;
>> Same comment.
>>
>>>       pmd_t *table;
>>>       pmd_t *pmdp;
>>>       pud_t pud;
>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>       }
>>>         table = pmd_offset(pudp, addr);
>>> +    /*
>>> +     * Isolate the PMD table; in case of race with ptdump, this helps
>>> +     * us to avoid taking the lock in __pmd_free_pte_page().
>>> +     *
>>> +     * Static key logic:
>>> +     *
>>> +     * Case 1: If ptdump does static_branch_enable(), and after that we
>>> +     * execute the if block, then this patches in the read lock, ptdump has
>>> +     * the write lock patched in, therefore ptdump will never read from
>>> +     * a potentially freed PMD table.
>>> +     *
>>> +     * Case 2: If the if block starts executing before ptdump's
>>> +     * static_branch_enable(), then no locking synchronization
>>> +     * will be done. However, pud_clear() + the dsb() in
>>> +     * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>>> +     * empty PUD. Thus, it will never walk over a potentially freed
>>> +     * PMD table.
>>> +     */
>>> +    pud_clear(pudp);
>>> +    __flush_tlb_kernel_pgtable(addr);
>>> +    if (static_branch_unlikely(&ptdump_lock_key)) {
>>> +        mmap_read_lock(&init_mm);
>>> +        lock_taken = true;
>>> +    }
>>> +    if (unlikely(lock_taken))
>>> +        mmap_read_unlock(&init_mm);
>> Same comment.
>>
>>> +
>>>       pmdp = table;
>>>       next = addr;
>>>       end = addr + PUD_SIZE;
>>>       do {
>>> -        pmd_free_pte_page(pmdp, next);
>>> +        __pmd_free_pte_page(pmdp, next, false);
>>>       } while (pmdp++, next += PMD_SIZE, next != end);
>>>   -    pud_clear(pudp);
>>> -    __flush_tlb_kernel_pgtable(addr);
>>>       pmd_free(NULL, table);
>>>       return 1;
>>>   }
>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>> index 421a5de806c6..f75e12a1d068 100644
>>> --- a/arch/arm64/mm/ptdump.c
>>> +++ b/arch/arm64/mm/ptdump.c
>>> @@ -25,6 +25,7 @@
>>>   #include <asm/pgtable-hwdef.h>
>>>   #include <asm/ptdump.h>
>>>   +#include <asm/cpufeature.h>
>>>     #define pt_dump_seq_printf(m, fmt, args...)    \
>>>   ({                        \
>>> @@ -311,7 +312,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info
>>> *info)
>>>           }
>>>       };
>>>   +    static_branch_enable(&ptdump_lock_key);
>>>       ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>>> +    static_branch_disable(&ptdump_lock_key);
>>>   }
>>>     static void __init ptdump_initialize(void)
>>> @@ -353,7 +356,9 @@ bool ptdump_check_wx(void)
>>>           }
>>>       };
>>>   +    static_branch_enable(&ptdump_lock_key);
>>>       ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>>> +    static_branch_disable(&ptdump_lock_key);
>>>         if (st.wx_pages || st.uxn_pages) {
>>>           pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu
>>> non-UXN pages found\n",
>>
>> With the improvements as suggested, LGTM:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
>>

