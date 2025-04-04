Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0331459F7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 03:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743735797; cv=none; b=QPelSDBPyjhtS7RzpRzvLOhZH8+NSw0Ts12SUTl1hyQQLVhMEnuaWLOaouCK410tg0CO7C4DmxIgczkIvEUGng3RTkEZDtDC77/gumAfcf9g6pcDuhCvQEDoZG3TJkYHrMG+oDNN68Fbo4SyQkxpt4Ox/I72UtKmMCvDSLiqBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743735797; c=relaxed/simple;
	bh=Ome5pwAP7+ufG+UWVHGaF4hd266qd5Z2Y3euD3sq/28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bA/LQgRs/pudv7fNb/B9mfir6HDtvZtQkuPCiOek7WyYTDwnn9KWP/VJjN6PsI+WQKYP/+jQH216JoF6NYuocunr5DTxGHKvjRmIX/Qzkq5GAFkGEZIKOFH86vw7s7ivqW/9mT+RJ7KjPU3q3gLLcj7nRr4MNqzJJyOGMPDqQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E4741516;
	Thu,  3 Apr 2025 20:03:15 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84AB23F694;
	Thu,  3 Apr 2025 20:03:07 -0700 (PDT)
Message-ID: <1d7c0c14-6758-4842-965c-2978c4a7f345@arm.com>
Date: Fri, 4 Apr 2025 08:33:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] arm64: hugetlb: Cleanup huge_pte size discovery
 mechanisms
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
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-2-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/25 20:34, Ryan Roberts wrote:
> Not all huge_pte helper APIs explicitly provide the size of the
> huge_pte. So the helpers have to depend on various methods to determine
> the size of the huge_pte. Some of these methods are dubious.
> 
> Let's clean up the code to use preferred methods and retire the dubious
> ones. The options in order of preference:
> 
>  - If size is provided as parameter, use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If vma is provided as a parameter, retrieve size via
>    huge_page_size(hstate_vma(vma)) and use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If the pte is present and contiguous, use find_num_contig() to walk
>    the pgtable to find the level and infer the number of ptes from
>    level. Only works for *present* ptes.
> 
>  - If the pte is present and not contiguous and you can infer from this
>    that only 1 pte needs to be operated on. This is ok if you don't care
>    about the absolute size, and just want to know the number of ptes.
> 
>  - NEVER rely on resolving the PFN of a present pte to a folio and
>    getting the folio's size. This is fragile at best, because there is
>    nothing to stop the core-mm from allocating a folio twice as big as
>    the huge_pte then mapping it across 2 consecutive huge_ptes. Or just
>    partially mapping it.
> 
> Where we require that the pte is present, add warnings if not-present.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index b3a7fafe8892..6a2af9fb2566 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -129,7 +129,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>  	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
>  		return orig_pte;
>  
> -	ncontig = num_contig_ptes(page_size(pte_page(orig_pte)), &pgsize);
> +	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>  	for (i = 0; i < ncontig; i++, ptep++) {
>  		pte_t pte = __ptep_get(ptep);
>  
> @@ -438,16 +438,19 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	pgprot_t hugeprot;
>  	pte_t orig_pte;
>  
> +	VM_WARN_ON(!pte_present(pte));
> +
>  	if (!pte_cont(pte))
>  		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> +	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
>  
>  	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
> +	VM_WARN_ON(!pte_present(orig_pte));
>  
>  	/* Make sure we don't lose the dirty or young state */
>  	if (pte_dirty(orig_pte))
> @@ -472,7 +475,10 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	size_t pgsize;
>  	pte_t pte;
>  
> -	if (!pte_cont(__ptep_get(ptep))) {
> +	pte = __ptep_get(ptep);
> +	VM_WARN_ON(!pte_present(pte));
> +
> +	if (!pte_cont(pte)) {
>  		__ptep_set_wrprotect(mm, addr, ptep);
>  		return;
>  	}
> @@ -496,11 +502,15 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	struct mm_struct *mm = vma->vm_mm;
>  	size_t pgsize;
>  	int ncontig;
> +	pte_t pte;
> +
> +	pte = __ptep_get(ptep);
> +	VM_WARN_ON(!pte_present(pte));
>  
> -	if (!pte_cont(__ptep_get(ptep)))
> +	if (!pte_cont(pte))
>  		return ptep_clear_flush(vma, addr, ptep);
>  
> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> +	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>  }
>  

Should a comment be added before all the VM_WARN_ON() explaining the rationale
about why the page table entries need to be present, before checking for their
contiguous attribute before subsequently calling into find_num_contig() ?

Regardless, LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
