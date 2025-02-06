Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A32214209
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842504; cv=none; b=mqie6zfXHm+sVs7MuEOzsNsFM43pvb9f42RsQ4eIMJzEvF6r5R5YCER14eIE3g9RHjRJU1dTOmIc+DDyIKQAnCYaiBo+IP3nvDmdzHImCg0sjIhvHBngadXEMlI5b81Y80IpXBf4wZwuCfCzCTMf9XYnwSpcCTiQOzKgENHf04k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842504; c=relaxed/simple;
	bh=PiJ40gXy5ngnydgoQKkaQ1FuaBUx4yrq+N/7Jr5I5Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PP1fyHyk0DV3QP0CeM5rp6vHoC9waDk64js7BwMjEi5DfHPTCwyKikVqfIqcusbJ2P+ya6C+om2ocMgEJool1aCP6JIX/my666whjDMPGmSIK5L/WxZkvzWxIIPYPVg6d0UmnJQYT1CSI6HeV6q8jDZx9cKT8+30PBpeSrtntKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A47312FC;
	Thu,  6 Feb 2025 03:48:44 -0800 (PST)
Received: from [10.163.34.115] (unknown [10.163.34.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0405E3F5A1;
	Thu,  6 Feb 2025 03:48:14 -0800 (PST)
Message-ID: <bdd08da7-d978-437a-849f-8a6115933e19@arm.com>
Date: Thu, 6 Feb 2025 17:18:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/16] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
To: Ryan Roberts <ryan.roberts@arm.com>,
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
 <20250205151003.88959-7-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-7-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/25 20:39, Ryan Roberts wrote:
> Refactor __set_ptes(), set_pmd_at() and set_pud_at() so that they are
> all a thin wrapper around a generic ___set_ptes(), which takes pgsize

s/generic/common - as generic might be misleading for being generic MM.

> parameter. This cleans up the code to remove the confusing
> __set_pte_at() (which was only ever used for pmd/pud) and will allow us
> to perform future barrier optimizations in a single place. Additionally,
> it will permit the huge_pte API to efficiently batch-set pgtable entries
> and take advantage of the future barrier optimizations.

Makes sense.

> 
> ___set_ptes() calls the correct page_table_check_*_set() function based
> on the pgsize. This means that huge_ptes be able to get proper coverage
> regardless of their size, once it's plumbed into huge_pte. Currently the
> huge_pte API always uses the pte API which assumes an entry only covers
> a single page.

Right

> 
> While we are at it, refactor __ptep_get_and_clear() and
> pmdp_huge_get_and_clear() to use a common ___ptep_get_and_clear() which
> also takes a pgsize parameter. This will provide the huge_pte API the
> means to clear ptes corresponding with the way they were set.

__ptep_get_and_clear() refactoring does not seem to be related to the
previous __set_ptes(). Should they be separated out into two different
patches instead - for better clarity and review ? Both these clean ups
have enough change and can stand own their own.

> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 108 +++++++++++++++++++------------
>  1 file changed, 67 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0b2a2ad1b9e8..3b55d9a15f05 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -420,23 +420,6 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>  	return pfn_pte(pte_pfn(pte) + nr, pte_pgprot(pte));
>  }
>  
> -static inline void __set_ptes(struct mm_struct *mm,
> -			      unsigned long __always_unused addr,
> -			      pte_t *ptep, pte_t pte, unsigned int nr)
> -{
> -	page_table_check_ptes_set(mm, ptep, pte, nr);
> -	__sync_cache_and_tags(pte, nr);
> -
> -	for (;;) {
> -		__check_safe_pte_update(mm, ptep, pte);
> -		__set_pte(ptep, pte);
> -		if (--nr == 0)
> -			break;
> -		ptep++;
> -		pte = pte_advance_pfn(pte, 1);
> -	}
> -}
> -
>  /*
>   * Hugetlb definitions.
>   */
> @@ -641,30 +624,59 @@ static inline pgprot_t pud_pgprot(pud_t pud)
>  	return __pgprot(pud_val(pfn_pud(pfn, __pgprot(0))) ^ pud_val(pud));
>  }
>  
> -static inline void __set_pte_at(struct mm_struct *mm,
> -				unsigned long __always_unused addr,
> -				pte_t *ptep, pte_t pte, unsigned int nr)
> +static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> +			       unsigned int nr, unsigned long pgsize)

So address got dropped and page size got added as an argument.
s/___set_ptes/___set_pxds ? to be more generic for all levels.

>  {
> -	__sync_cache_and_tags(pte, nr);
> -	__check_safe_pte_update(mm, ptep, pte);
> -	__set_pte(ptep, pte);
> +	unsigned long stride = pgsize >> PAGE_SHIFT;
> +
> +	switch (pgsize) {
> +	case PAGE_SIZE:
> +		page_table_check_ptes_set(mm, ptep, pte, nr);
> +		break;
> +	case PMD_SIZE:
> +		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
> +		break;
> +	case PUD_SIZE:
> +		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
> +		break;

This is where the new page table check APIs get used for batch testing.

> +	default:
> +		VM_WARN_ON(1);
> +	}
> +
> +	__sync_cache_and_tags(pte, nr * stride);
> +
> +	for (;;) {
> +		__check_safe_pte_update(mm, ptep, pte);
> +		__set_pte(ptep, pte);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		pte = pte_advance_pfn(pte, stride);
> +	}
>  }

LGTM

>  
> -static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> -			      pmd_t *pmdp, pmd_t pmd)
> +static inline void __set_ptes(struct mm_struct *mm,
> +			      unsigned long __always_unused addr,
> +			      pte_t *ptep, pte_t pte, unsigned int nr)
>  {
> -	page_table_check_pmd_set(mm, pmdp, pmd);
> -	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd),
> -						PMD_SIZE >> PAGE_SHIFT);
> +	___set_ptes(mm, ptep, pte, nr, PAGE_SIZE);
>  }
>  
> -static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
> -			      pud_t *pudp, pud_t pud)
> +static inline void __set_pmds(struct mm_struct *mm,
> +			      unsigned long __always_unused addr,
> +			      pmd_t *pmdp, pmd_t pmd, unsigned int nr)
> +{
> +	___set_ptes(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
> +}
> +#define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, 1)
> +
> +static inline void __set_puds(struct mm_struct *mm,
> +			      unsigned long __always_unused addr,
> +			      pud_t *pudp, pud_t pud, unsigned int nr)
>  {
> -	page_table_check_pud_set(mm, pudp, pud);
> -	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
> -						PUD_SIZE >> PAGE_SHIFT);
> +	___set_ptes(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
>  }
> +#define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, 1)

LGTM

>  
>  #define __p4d_to_phys(p4d)	__pte_to_phys(p4d_pte(p4d))
>  #define __phys_to_p4d_val(phys)	__phys_to_pte_val(phys)
> @@ -1276,16 +1288,34 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
>  
> -static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
> -				       unsigned long address, pte_t *ptep)
> +static inline pte_t ___ptep_get_and_clear(struct mm_struct *mm, pte_t *ptep,
> +				       unsigned long pgsize)

So address got dropped and page size got added as an argument.

>  {
>  	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
>  
> -	page_table_check_pte_clear(mm, pte);
> +	switch (pgsize) {
> +	case PAGE_SIZE:
> +		page_table_check_pte_clear(mm, pte);
> +		break;
> +	case PMD_SIZE:
> +		page_table_check_pmd_clear(mm, pte_pmd(pte));
> +		break;
> +	case PUD_SIZE:
> +		page_table_check_pud_clear(mm, pte_pud(pte));
> +		break;
> +	default:
> +		VM_WARN_ON(1);
> +	}
>  
>  	return pte;
>  }
>  
> +static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
> +				       unsigned long address, pte_t *ptep)
> +{
> +	return ___ptep_get_and_clear(mm, ptep, PAGE_SIZE);
> +}
> +
>  static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, unsigned int nr, int full)
>  {
> @@ -1322,11 +1352,7 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
>  static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  					    unsigned long address, pmd_t *pmdp)
>  {
> -	pmd_t pmd = __pmd(xchg_relaxed(&pmd_val(*pmdp), 0));
> -
> -	page_table_check_pmd_clear(mm, pmd);
> -
> -	return pmd;
> +	return pte_pmd(___ptep_get_and_clear(mm, (pte_t *)pmdp, PMD_SIZE));
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  

Although currently there is no pudp_huge_get_and_clear() helper on arm64
reworked ___ptep_get_and_clear() will be able to support that as well if
and when required as it now supports PUD_SIZE page size.
