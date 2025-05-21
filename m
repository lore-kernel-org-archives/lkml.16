Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F5818EFD1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836868; cv=none; b=MWS3MYAsJKDwuwTVY7ZbIlRMOGlbbzwDSTOGDDG9HKXQIjet/+ld0ogLvGzIjnC/9B9PqPp6sgLcMRyMlcq0HOu4PvMcbdDumcaY4h5WsExs5l6+7hJ6mWb0o6BSPIE07Zw3eL/Fs27F/+rckaTR0qhp/oT+a3X8tDPa15iXLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836868; c=relaxed/simple;
	bh=IoxOUjr6fXQzKKredPLraY17208/esIaeSVKNDzenVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMiGc79sOgPGHjB6GLLhK6QzwSot8D7U/8oL4tIdoFssQOlYvKaj+eFwbIZhW39DIi3y2nDGs01r1RQlg58SUOfqX+4O8TjORBsu3X/7zzafvSSD4XJHuF3Eeh1nKAio4cCrQmOFCrK7BCrdKSH/Yr5P5cIWQzO0o2zc1J5l15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 267E11515;
	Wed, 21 May 2025 07:14:12 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C36F3F5A1;
	Wed, 21 May 2025 07:14:22 -0700 (PDT)
Message-ID: <eb57601d-abac-492a-8e62-dc1c406af572@arm.com>
Date: Wed, 21 May 2025 15:14:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: Add batched version of
 ptep_modify_prot_start
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-5-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250519074824.42909-5-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:48, Dev Jain wrote:
> Override the generic definition to use get_and_clear_full_ptes(). This helper
> does a TLBI only for the starting and ending contpte block of the range, whereas
> the current implementation will call ptep_get_and_clear() for every contpte block,
> thus doing a TLBI on every contpte block. Therefore, we have a performance win.
> The arm64 definition of pte_accessible() allows us to batch around it in clear_flush_ptes():
> #define pte_accessible(mm, pte)	\
> 	(mm_tlb_flush_pending(mm) ? pte_present(pte) : pte_valid(pte))
> 
> All ptes are obviously present in the folio batch, and they are also valid.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Please squash this with the 

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

I think we can do this more precisely with respect to tlbis and also without 
needing to create a new clear_flush_ptes() helper:


pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
			     pte_t *ptep, unsigned int nr)
{
	pte_t pte = get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);

	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
		/*
		 * Break-before-make (BBM) is required for all user space mappings
		 * when the permission changes from executable to non-executable
		 * in cases where cpu is affected with errata #2645198.
		 */
		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
					  PAGE_SIZE, true, 3);
	}

	return pte;
}


> +
> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
> +{
> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>  }
>  
>  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e40ed57e034d..41f4a8de5c28 100644
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

Let's not create a new generic helper if only arm64 is using it. We would 
also want to add a doc header to describe this helper. My proposal avoids 
this.

Thanks,
Ryan

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

