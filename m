Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6217B2206BE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487657; cv=none; b=NXYHxBZfS5YpKVWRY7TGZHvvHYawGHbBeERiIVYQWxdtdBxKgS2HD/WaYl3CMVtR5GSxbvJH453As99pcXuITvb5518f6K2wPxMPStyd90MPYmkvkHOK/SVMOtPeQMN1FBrAS2MdOiC+7WqMmM4g28loZsOFlF4ySPqEJ9P3dME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487657; c=relaxed/simple;
	bh=rwsA2JE1/+UvvFybJG5UJ9J/kmWAeTtT6lSY2toq4Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7XW5sNIsIMxk+5ODtOOdPNFK1ZIG3xJQ6lwLwHR3D6edLf21NO3oduQ3x7/pChVqG4m/ai24CvN7jg5xKXRu9wsvkddUnd+334LKoKPyWYYbsv6y7L88AdQqCxXNmBiRnBIEKFHjHSDbGgoYCkyvD6y0rWgcmDL+thXQmwMcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AEEA1063;
	Thu, 24 Apr 2025 02:40:49 -0700 (PDT)
Received: from [10.163.49.106] (unknown [10.163.49.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FC063F66E;
	Thu, 24 Apr 2025 02:40:49 -0700 (PDT)
Message-ID: <1e148263-1155-411b-9b1d-16599bd875cd@arm.com>
Date: Thu, 24 Apr 2025 15:10:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] arm64: hugetlb: Use __set_ptes_anysz() and
 __ptep_get_and_clear_anysz()
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
 <20250422081822.1836315-6-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250422081822.1836315-6-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/22/25 13:48, Ryan Roberts wrote:
> Refactor the huge_pte helpers to use the new common __set_ptes_anysz()
> and __ptep_get_and_clear_anysz() APIs.
> 
> This provides 2 benefits; First, when page_table_check=on, hugetlb is
> now properly/fully checked. Previously only the first page of a hugetlb
> folio was checked. Second, instead of having to call __set_ptes(nr=1)
> for each pte in a loop, the whole contiguous batch can now be set in one
> go, which enables some efficiencies and cleans up the code.
> 
> One detail to note is that huge_ptep_clear_flush() was previously
> calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
> block mapping). This has a couple of disadvantages; first
> ptep_clear_flush() calls ptep_get_and_clear() which transparently
> handles contpte. Given we only call for non-contiguous ptes, it would be
> safe, but a waste of effort. It's preferable to go straight to the layer
> below. However, more problematic is that ptep_get_and_clear() is for
> PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
> clear the whole hugetlb folio. So let's stop special-casing the non-cont
> case and just rely on get_clear_contig_flush() to do the right thing for
> non-cont entries.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 53 +++++++------------------------------
>  1 file changed, 10 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 087fc43381c6..d34703846ef4 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -159,12 +159,11 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>  	pte_t pte, tmp_pte;
>  	bool present;
>  
> -	pte = __ptep_get_and_clear(mm, addr, ptep);
> +	pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  	present = pte_present(pte);
>  	while (--ncontig) {
>  		ptep++;
> -		addr += pgsize;
> -		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> +		tmp_pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  		if (present) {
>  			if (pte_dirty(tmp_pte))
>  				pte = pte_mkdirty(pte);
> @@ -208,7 +207,7 @@ static void clear_flush(struct mm_struct *mm,
>  	unsigned long i, saddr = addr;
>  
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
> -		__ptep_get_and_clear(mm, addr, ptep);
> +		__ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  
>  	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }
> @@ -219,32 +218,20 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	size_t pgsize;
>  	int i;
>  	int ncontig;
> -	unsigned long pfn, dpfn;
> -	pgprot_t hugeprot;
>  
>  	ncontig = num_contig_ptes(sz, &pgsize);
>  
>  	if (!pte_present(pte)) {
>  		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
> -			__set_ptes(mm, addr, ptep, pte, 1);
> +			__set_ptes_anysz(mm, ptep, pte, 1, pgsize);
>  		return;
>  	}
>  
> -	if (!pte_cont(pte)) {
> -		__set_ptes(mm, addr, ptep, pte, 1);
> -		return;
> -	}
> -
> -	pfn = pte_pfn(pte);
> -	dpfn = pgsize >> PAGE_SHIFT;
> -	hugeprot = pte_pgprot(pte);
> -
>  	/* Only need to "break" if transitioning valid -> valid. */
> -	if (pte_valid(__ptep_get(ptep)))
> +	if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
>  		clear_flush(mm, addr, ptep, pgsize, ncontig);
>  
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
>  }
>  
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -434,11 +421,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  			       unsigned long addr, pte_t *ptep,
>  			       pte_t pte, int dirty)
>  {
> -	int ncontig, i;
> +	int ncontig;
>  	size_t pgsize = 0;
> -	unsigned long pfn = pte_pfn(pte), dpfn;
>  	struct mm_struct *mm = vma->vm_mm;
> -	pgprot_t hugeprot;
>  	pte_t orig_pte;
>  
>  	VM_WARN_ON(!pte_present(pte));
> @@ -447,7 +432,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
>  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
> -	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
> @@ -462,19 +446,14 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	if (pte_young(orig_pte))
>  		pte = pte_mkyoung(pte);
>  
> -	hugeprot = pte_pgprot(pte);
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> -
> +	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
>  	return 1;
>  }
>  
>  void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  			     unsigned long addr, pte_t *ptep)
>  {
> -	unsigned long pfn, dpfn;
> -	pgprot_t hugeprot;
> -	int ncontig, i;
> +	int ncontig;
>  	size_t pgsize;
>  	pte_t pte;
>  
> @@ -487,16 +466,11 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	}
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> -	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>  	pte = pte_wrprotect(pte);
>  
> -	hugeprot = pte_pgprot(pte);
> -	pfn = pte_pfn(pte);
> -
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
>  }
>  
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> @@ -505,13 +479,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	struct mm_struct *mm = vma->vm_mm;
>  	size_t pgsize;
>  	int ncontig;
> -	pte_t pte;
> -
> -	pte = __ptep_get(ptep);
> -	VM_WARN_ON(!pte_present(pte));
> -
> -	if (!pte_cont(pte))
> -		return ptep_clear_flush(vma, addr, ptep);
>  
>  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
