Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988CF2F5B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992203; cv=none; b=ktF4Aj54M89CAzpmcDFl8r6nHnm+mqfiH1B0nkaolnazoF/E7LxOVA1D3VGB3EjFknr1ZLDg6QITE+esRtVs9fDgtuzWAhezJ96Kc7/uMJ+PQMekmRwYJ7wOhg52Py/Fuwhqhv3sJYCFbXRMvwrrTV1aAJp6dH0glIuPRcVt3I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992203; c=relaxed/simple;
	bh=tGpMwysnsq2TxilekSkNHmsw859wisrfWTcmDCeAUYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnK6OJgIcR7+ygz6tgporiLxzb7Bud4ydxv3et4orRDnB+JIMDlLhqj2C2iMahtLEbYtN/l9/KCrZDCa45X1K0C0QxvvuCLX7kxGnpoYSzYtQbNuPk7v5qwMRRrPu4+Iy/3TjIklQKnGnFK4TecWIvwjMaaKkNmsHYd1bXQUApw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3902106F;
	Tue, 29 Apr 2025 22:49:53 -0700 (PDT)
Received: from [10.163.79.251] (unknown [10.163.79.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 327DD3F5A1;
	Tue, 29 Apr 2025 22:49:50 -0700 (PDT)
Message-ID: <5eebef24-6c98-4407-a4f1-5a97f08b76a4@arm.com>
Date: Wed, 30 Apr 2025 11:19:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: Add batched version of
 ptep_modify_prot_start
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
 <20250429052336.18912-5-dev.jain@arm.com>
 <e2c10562-2504-434f-9239-32d67955a9af@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e2c10562-2504-434f-9239-32d67955a9af@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/04/25 11:13 am, Anshuman Khandual wrote:
> On 4/29/25 10:53, Dev Jain wrote:
>> Override the generic definition to use get_and_clear_full_ptes(), so that
>> we do a TLBI possibly only on the "contpte-edges" of the large PTE block,
>> instead of doing it for every contpte block, which happens for ptep_get_and_clear().
> 
> Could you please explain what does "contpte-edges" really signify in the
> context of large PTE blocks ? Also how TLBI operation only on these edges
> will never run into the risk of missing TLB invalidation of some other
> mapped areas ?

We are doing a TLBI over the whole range already, in the mprotect code:
see tlb_flush_pte_range. What the arm64 internal API does, irrespective 
of the caller, is to do a TLBI for every contpte block in case of 
unfolding. We don't need that for the intermediate blocks because the 
caller does that. We do need a TLBI for the start and end contpte block,
because in case the range we are invalidating partially covers them, 
then the caller will not do a TLBI for the non-overlapped PTEs of the block.
I'll explain some more in the changelog next version.

> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h |  5 +++++
>>   arch/arm64/mm/mmu.c              | 12 +++++++++---
>>   include/linux/pgtable.h          |  4 ++++
>>   mm/pgtable-generic.c             | 16 +++++++++++-----
>>   4 files changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 2a77f11b78d5..8872ea5f0642 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   				    unsigned long addr, pte_t *ptep,
>>   				    pte_t old_pte, pte_t new_pte);
>>   
>> +#define modify_prot_start_ptes modify_prot_start_ptes
>> +extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +				    unsigned long addr, pte_t *ptep,
>> +				    unsigned int nr);
>> +
>>   #ifdef CONFIG_ARM64_CONTPTE
>>   
>>   /*
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..fe60be8774f4 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
>>   early_initcall(prevent_bootmem_remove_init);
>>   #endif
>>   
>> -pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>> +pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t *ptep, unsigned int nr)
>>   {
>>   	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>>   		/*
>> @@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>>   		 * in cases where cpu is affected with errata #2645198.
>>   		 */
>>   		if (pte_user_exec(ptep_get(ptep)))
>> -			return ptep_clear_flush(vma, addr, ptep);
>> +			return clear_flush_ptes(vma, addr, ptep, nr);
>>   	}
>> -	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
>> +	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
>> +}
>> +
>> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>> +{
>> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>>   }
>>   
>>   void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index ed287289335f..10cdb87ccecf 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
>>   			      pte_t *ptep);
>>   #endif
>>   
>> +extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
>> +			      unsigned long address,
>> +			      pte_t *ptep, unsigned int nr);
>> +
>>   #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
>>   extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
>>   			      unsigned long address,
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index 5a882f2b10f9..e238f88c3cac 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   }
>>   #endif
>>   
>> -#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
>> -pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
>> -		       pte_t *ptep)
>> +pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
>> +		       pte_t *ptep, unsigned int nr)
>>   {
>>   	struct mm_struct *mm = (vma)->vm_mm;
>>   	pte_t pte;
>> -	pte = ptep_get_and_clear(mm, address, ptep);
>> +	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
>>   	if (pte_accessible(mm, pte))
>> -		flush_tlb_page(vma, address);
>> +		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>>   	return pte;
>>   }
>> +
>> +#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
>> +pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
>> +		       pte_t *ptep)
>> +{
>> +	return clear_flush_ptes(vma, address, ptep, 1);
>> +}
>>   #endif
>>   
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE

