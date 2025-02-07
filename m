Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DFA40C03
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901383; cv=none; b=FjCvxcwIBJhwPnHLMjSFHY8+QYtp4o5bsUdLFi7iQb+v1Sk16Apo6ZITQ4hSOVk9pyStdTXmTcQQyReFxqdZUIfTHWqPts5WgLvL1ttT6Wh6JI6LoObMuRamRQjACC3C+amjCYOVopkyLhbQgbgx0ejAynVJpnJxnPLPXRL6a7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901383; c=relaxed/simple;
	bh=D6VsKlx6yQBeQKSTpfYYHRpyAtSuykD8W8kHcbMWQHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+by4R+o89TsTcqN6Np4vlUGaQGTdb/INCE/JlMeaL0ViuPxuhTfx4FTpQOLxM2NVyhg8APulnAwzGwVUGKkYf7sd94HJC3z4fhONRI8JzY96gn1HlrGfS4bTlXNqCR2Xz24hL6Gfq5TLYERz90f2pA2GB04Ax3DJyvJOHQg1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4B38106F;
	Thu,  6 Feb 2025 20:10:01 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69983F63F;
	Thu,  6 Feb 2025 20:09:33 -0800 (PST)
Message-ID: <c804485f-d042-4013-9fef-ad7eb91c3a85@arm.com>
Date: Fri, 7 Feb 2025 09:39:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/16] arm64: hugetlb: Use ___set_ptes() and
 ___ptep_get_and_clear()
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
 <20250205151003.88959-8-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-8-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/25 20:39, Ryan Roberts wrote:
> Refactor the huge_pte helpers to use the new generic ___set_ptes() and
> ___ptep_get_and_clear() APIs.
> 
> This provides 2 benefits; First, when page_table_check=on, hugetlb is
> now properly/fully checked. Previously only the first page of a hugetlb

PAGE_TABLE_CHECK will be fully supported now in hugetlb irrespective of
the page table level. This is definitely an improvement.

> folio was checked. Second, instead of having to call __set_ptes(nr=1)
> for each pte in a loop, the whole contiguous batch can now be set in one
> go, which enables some efficiencies and cleans up the code.

Improvements done to common __set_ptes() will automatically be available
for hugetlb pages as well. This converges all batch updates in a single
i.e __set_ptes() which can be optimized further in a single place. Makes
sense.

> 
> One detail to note is that huge_ptep_clear_flush() was previously
> calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
> block mapping). This has a couple of disadvantages; first
> ptep_clear_flush() calls ptep_get_and_clear() which transparently
> handles contpte. Given we only call for non-contiguous ptes, it would be
> safe, but a waste of effort. It's preferable to go stright to the layer

A small nit - typo s/stright/straight

> below. However, more problematic is that ptep_get_and_clear() is for
> PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
> clear the whole hugetlb folio. So let's stop special-casing the non-cont
> case and just rely on get_clear_contig_flush() to do the right thing for
> non-cont entries.

Like before, this change is unrelated to all the conversions done earlier for
the set and clear paths above using the new helpers. Hence ideally it should
be separated out into a different patch.

> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 50 ++++++++-----------------------------
>  1 file changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index e870d01d12ea..02afee31444e 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -166,12 +166,12 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>  	pte_t pte, tmp_pte;
>  	bool present;
>  
> -	pte = __ptep_get_and_clear(mm, addr, ptep);
> +	pte = ___ptep_get_and_clear(mm, ptep, pgsize);
>  	present = pte_present(pte);
>  	while (--ncontig) {
>  		ptep++;
>  		addr += pgsize;
> -		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> +		tmp_pte = ___ptep_get_and_clear(mm, ptep, pgsize);
>  		if (present) {
>  			if (pte_dirty(tmp_pte))
>  				pte = pte_mkdirty(pte);
> @@ -215,7 +215,7 @@ static void clear_flush(struct mm_struct *mm,
>  	unsigned long i, saddr = addr;
>  
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
> -		__ptep_get_and_clear(mm, addr, ptep);
> +		___ptep_get_and_clear(mm, ptep, pgsize);
>  
>  	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }

___ptep_get_and_clear() will have the opportunity to call page_table_check_pxx_clear()
depending on the page size passed unlike the current scenario.

> @@ -226,32 +226,20 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
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
> +			___set_ptes(mm, ptep, pte, 1, pgsize);

IIUC __set_ptes() wrapper is still around in the header. So what's the benefit of
converting this into ___set_ptes() ? __set_ptes() gets dropped eventually ?

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
> +	___set_ptes(mm, ptep, pte, ncontig, pgsize);
>  }

Similarly __set_ptes() will have the opportunity to call page_table_check_pxx_set()
depending on the page size passed unlike the current scenario.

>  
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -441,11 +429,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
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
> @@ -454,7 +440,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> -	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
> @@ -469,19 +454,14 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	if (pte_young(orig_pte))
>  		pte = pte_mkyoung(pte);
>  
> -	hugeprot = pte_pgprot(pte);
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> -
> +	___set_ptes(mm, ptep, pte, ncontig, pgsize);
>  	return 1;
>  }

This makes huge_ptep_set_access_flags() cleaner and simpler as well.

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
> @@ -494,16 +474,11 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
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
> +	___set_ptes(mm, ptep, pte, ncontig, pgsize);
>  }

This makes huge_ptep_set_wrprotect() cleaner and simpler as well.

>  
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> @@ -517,10 +492,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	pte = __ptep_get(ptep);
>  	VM_WARN_ON(!pte_present(pte));
>  
> -	if (!pte_cont(pte))
> -		return ptep_clear_flush(vma, addr, ptep);
> -
> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> +	ncontig = num_contig_ptes(page_size(pte_page(pte)), &pgsize);

A VMA argument is present in this function huge_ptep_clear_flush(). Why not just
use that to get the huge page size here, instead of retrieving the PFN contained
in page table entry which might be safer ?

s/page_size(pte_page(pte))/huge_page_size(hstate_vma(vma))

>  	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>  }
>  
