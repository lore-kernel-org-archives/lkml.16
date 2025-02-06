Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479C423312B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738839314; cv=none; b=JBOZj6SLfuIXIXdWLYenrUORJw3qAo6qyaLw44/C4s/KfCSDmGwVAH0pxq5376epnIarZP4H8PtPF+ekXMMUKw2rBqYzZZoh7udE7ypOkgEue9lpaE2paKnyaDoY6wXyHlWh8R5hdn+Y8RBOS7EdcZyL/evhM8QS467qUcaUyok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738839314; c=relaxed/simple;
	bh=jMcGVCI1J6kvORZQree7+zQxH4uuJbEvuZOH9DPiaXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbTiMipCQ4+1eZeT0/vZnFR+ybY6fLhw3P+Sg6naCGNyxCaedVaRK8XgH/Kjb+4WbwVbd6RocZj1UxYO4E/BCO70GLiL2d56gjN1eNp8XsmTm2nwMfrgG4NGqB7rptRiqCm9Upfn0f4wlURHVRRhv1xIEklTNzypciWErbEPtg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1D9712FC;
	Thu,  6 Feb 2025 02:55:34 -0800 (PST)
Received: from [10.163.34.115] (unknown [10.163.34.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D6723F5A1;
	Thu,  6 Feb 2025 02:55:06 -0800 (PST)
Message-ID: <d86b6d7f-0ab3-4737-85cd-70cddcffc1e8@arm.com>
Date: Thu, 6 Feb 2025 16:25:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/16] mm/page_table_check: Batch-check pmds/puds just
 like ptes
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
 <20250205151003.88959-6-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-6-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/25 20:39, Ryan Roberts wrote:
> Convert page_table_check_p[mu]d_set(...) to
> page_table_check_p[mu]ds_set(..., nr) to allow checking a contiguous set
> of pmds/puds in single batch. We retain page_table_check_p[mu]d_set(...)
> as macros that call new batch functions with nr=1 for compatibility.
> 
> arm64 is about to reorganise its pte/pmd/pud helpers to reuse more code
> and to allow the implementation for huge_pte to more efficiently set
> ptes/pmds/puds in batches. We need these batch-helpers to make the
> refactoring possible.

A very small nit.

Although this justification here is reasonable enough but not sure if
platform specific requirements, need to be spelled out in such detail
for a generic MM change.

> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---

Regardless, LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  include/linux/page_table_check.h | 30 +++++++++++++++++-----------
>  mm/page_table_check.c            | 34 +++++++++++++++++++-------------
>  2 files changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 6722941c7cb8..289620d4aad3 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -19,8 +19,10 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
>  void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
>  void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>  		unsigned int nr);
> -void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
> -void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
> +void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
> +		unsigned int nr);
> +void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> +		unsigned int nr);
>  void __page_table_check_pte_clear_range(struct mm_struct *mm,
>  					unsigned long addr,
>  					pmd_t pmd);
> @@ -74,22 +76,22 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>  	__page_table_check_ptes_set(mm, ptep, pte, nr);
>  }
>  
> -static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
> -					    pmd_t pmd)
> +static inline void page_table_check_pmds_set(struct mm_struct *mm,
> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>  {
>  	if (static_branch_likely(&page_table_check_disabled))
>  		return;
>  
> -	__page_table_check_pmd_set(mm, pmdp, pmd);
> +	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
>  }
>  
> -static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
> -					    pud_t pud)
> +static inline void page_table_check_puds_set(struct mm_struct *mm,
> +		pud_t *pudp, pud_t pud, unsigned int nr)
>  {
>  	if (static_branch_likely(&page_table_check_disabled))
>  		return;
>  
> -	__page_table_check_pud_set(mm, pudp, pud);
> +	__page_table_check_puds_set(mm, pudp, pud, nr);
>  }
>  
>  static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
> @@ -129,13 +131,13 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
>  {
>  }
>  
> -static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
> -					    pmd_t pmd)
> +static inline void page_table_check_pmds_set(struct mm_struct *mm,
> +		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>  {
>  }
>  
> -static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
> -					    pud_t pud)
> +static inline void page_table_check_puds_set(struct mm_struct *mm,
> +		pud_t *pudp, pud_t pud, unsigned int nr)
>  {
>  }
>  
> @@ -146,4 +148,8 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
>  }
>  
>  #endif /* CONFIG_PAGE_TABLE_CHECK */
> +
> +#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
> +#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
> +
>  #endif /* __LINUX_PAGE_TABLE_CHECK_H */
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 509c6ef8de40..dae4a7d776b3 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -234,33 +234,39 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
>  		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
>  }
>  
> -void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
> +void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
> +		unsigned int nr)
>  {
> +	unsigned int i;
> +	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
> +
>  	if (&init_mm == mm)
>  		return;
>  
>  	page_table_check_pmd_flags(pmd);
>  
> -	__page_table_check_pmd_clear(mm, *pmdp);
> -	if (pmd_user_accessible_page(pmd)) {
> -		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
> -				     pmd_write(pmd));
> -	}
> +	for (i = 0; i < nr; i++)
> +		__page_table_check_pmd_clear(mm, *(pmdp + i));
> +	if (pmd_user_accessible_page(pmd))
> +		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
>  }
> -EXPORT_SYMBOL(__page_table_check_pmd_set);
> +EXPORT_SYMBOL(__page_table_check_pmds_set);
>  
> -void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
> +void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
> +		unsigned int nr)
>  {
> +	unsigned int i;
> +	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
> +
>  	if (&init_mm == mm)
>  		return;
>  
> -	__page_table_check_pud_clear(mm, *pudp);
> -	if (pud_user_accessible_page(pud)) {
> -		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
> -				     pud_write(pud));
> -	}
> +	for (i = 0; i < nr; i++)
> +		__page_table_check_pud_clear(mm, *(pudp + i));
> +	if (pud_user_accessible_page(pud))
> +		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
>  }
> -EXPORT_SYMBOL(__page_table_check_pud_set);
> +EXPORT_SYMBOL(__page_table_check_puds_set);
>  
>  void __page_table_check_pte_clear_range(struct mm_struct *mm,
>  					unsigned long addr,
