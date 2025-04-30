Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27311E47CA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991807; cv=none; b=UtD4zCOwu5Efj9LMLFGVHTrh+vtdiMdawI8jbNEy9t0mKooK2d8XzsCmjCmGBuzEBfTB/Mwx5sUJ578Gg3Kb8SJdyUutcSXe/98QQsTQVRic6ORqobRAq1ODUl15pXjL8uRS2Z7JVTW5Wdt2m3xLsukPojKYYakixyjleji4ZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991807; c=relaxed/simple;
	bh=BBepbYs5c3xF+rGmywv56auWs6yzMNsgKg69D6ethps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hl28PFfLSd/5+X09qOSg08Yk2PI9AiJDSm9EayqBBxG8CmOmaLvJMDeOIh3yPWAFBwV3Ib5ELZfjNcBV0KiJMkbhIP16vDUO0LEoxjJNwhw+dXmEoC6rXNATTjKNJ0tsh+ocdBm3c+/gIim23onJ6OCmg8E8AvjzNfWAQ0wPv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1F98106F;
	Tue, 29 Apr 2025 22:43:17 -0700 (PDT)
Received: from [10.163.50.23] (unknown [10.163.50.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9B183F5A1;
	Tue, 29 Apr 2025 22:43:14 -0700 (PDT)
Message-ID: <e2c10562-2504-434f-9239-32d67955a9af@arm.com>
Date: Wed, 30 Apr 2025 11:13:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: Add batched version of
 ptep_modify_prot_start
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
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
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250429052336.18912-5-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 10:53, Dev Jain wrote:
> Override the generic definition to use get_and_clear_full_ptes(), so that
> we do a TLBI possibly only on the "contpte-edges" of the large PTE block,
> instead of doing it for every contpte block, which happens for ptep_get_and_clear().

Could you please explain what does "contpte-edges" really signify in the
context of large PTE blocks ? Also how TLBI operation only on these edges
will never run into the risk of missing TLB invalidation of some other
mapped areas ?

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h |  5 +++++
>  arch/arm64/mm/mmu.c              | 12 +++++++++---
>  include/linux/pgtable.h          |  4 ++++
>  mm/pgtable-generic.c             | 16 +++++++++++-----
>  4 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 2a77f11b78d5..8872ea5f0642 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  				    unsigned long addr, pte_t *ptep,
>  				    pte_t old_pte, pte_t new_pte);
>  
> +#define modify_prot_start_ptes modify_prot_start_ptes
> +extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +				    unsigned long addr, pte_t *ptep,
> +				    unsigned int nr);
> +
>  #ifdef CONFIG_ARM64_CONTPTE
>  
>  /*
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..fe60be8774f4 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
>  early_initcall(prevent_bootmem_remove_init);
>  #endif
>  
> -pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
> +pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t *ptep, unsigned int nr)
>  {
>  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>  		/*
> @@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
>  		if (pte_user_exec(ptep_get(ptep)))
> -			return ptep_clear_flush(vma, addr, ptep);
> +			return clear_flush_ptes(vma, addr, ptep, nr);
>  	}
> -	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
> +	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
> +}
> +
> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
> +{
> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>  }
>  
>  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index ed287289335f..10cdb87ccecf 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
>  			      pte_t *ptep);
>  #endif
>  
> +extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      pte_t *ptep, unsigned int nr);
> +
>  #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
>  extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
>  			      unsigned long address,
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 5a882f2b10f9..e238f88c3cac 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
>  }
>  #endif
>  
> -#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
> -pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
> -		       pte_t *ptep)
> +pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
> +		       pte_t *ptep, unsigned int nr)
>  {
>  	struct mm_struct *mm = (vma)->vm_mm;
>  	pte_t pte;
> -	pte = ptep_get_and_clear(mm, address, ptep);
> +	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
>  	if (pte_accessible(mm, pte))
> -		flush_tlb_page(vma, address);
> +		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>  	return pte;
>  }
> +
> +#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
> +pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
> +		       pte_t *ptep)
> +{
> +	return clear_flush_ptes(vma, address, ptep, 1);
> +}
>  #endif
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
