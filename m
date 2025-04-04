Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092952E62D1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 03:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743738649; cv=none; b=QpSeyJym0ExP0CeuwupmYLxLmkUcZ7agdKLD1DFRa6uwevfTRX59ioUMfCfR9o7/smf6yc2U/esaKBEVrqP2ZKZcn8dJAKjJqa6Pih+aHthyuMKjKlFWa4yXE9XS/y/kFILgQdrxA0IkBdfHUvXkElK15whh3ef/3iUFXUHGito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743738649; c=relaxed/simple;
	bh=831a3b/szRXFhs4u6BKC5Yc43cN0QKhK1rfCUJc1Hd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvLFRKSnoLZX1ymJK71CfQDo8nTe5aijyLHVB+4mOa0ZoOs3RlHdwwdtuI/Rj3EvWptPXkMJIEh1QwLePlrmvrA6udGpEiISGxWuE+cctjoW/H78aQ5Zmx2tH4ep5Joo7vr7pblYf38dK+5ePxvB8J4/vlqoxwzR9W+/eevx+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE041516;
	Thu,  3 Apr 2025 20:50:48 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10FBC3F694;
	Thu,  3 Apr 2025 20:50:40 -0700 (PDT)
Message-ID: <6e4e11ef-d0d2-48e8-9ecd-4ba6575c8e52@arm.com>
Date: Fri, 4 Apr 2025 09:20:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] arm64: hugetlb: Refine tlb maintenance scope
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
 <20250304150444.3788920-3-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-3-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/25 20:34, Ryan Roberts wrote:
> When operating on contiguous blocks of ptes (or pmds) for some hugetlb
> sizes, we must honour break-before-make requirements and clear down the
> block to invalid state in the pgtable then invalidate the relevant tlb
> entries before making the pgtable entries valid again.
> 
> However, the tlb maintenance is currently always done assuming the worst
> case stride (PAGE_SIZE), last_level (false) and tlb_level
> (TLBI_TTL_UNKNOWN). We can do much better with the hinting; In reality,
> we know the stride from the huge_pte pgsize, we are always operating
> only on the last level, and we always know the tlb_level, again based on
> pgsize. So let's start providing these hints.
> 
> Additionally, avoid tlb maintenace in set_huge_pte_at().
> Break-before-make is only required if we are transitioning the
> contiguous pte block from valid -> valid. So let's elide the
> clear-and-flush ("break") if the pte range was previously invalid.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/hugetlb.h | 29 +++++++++++++++++++----------
>  arch/arm64/mm/hugetlbpage.c      |  9 ++++++---
>  2 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index 07fbf5bf85a7..2a8155c4a882 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -69,29 +69,38 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>  
>  #include <asm-generic/hugetlb.h>
>  
> -#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
> -static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> -					   unsigned long start,
> -					   unsigned long end)
> +static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> +					     unsigned long start,
> +					     unsigned long end,
> +					     unsigned long stride,
> +					     bool last_level)
>  {
> -	unsigned long stride = huge_page_size(hstate_vma(vma));
> -
>  	switch (stride) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
> +		__flush_tlb_range(vma, start, end, PUD_SIZE, last_level, 1);
>  		break;
>  #endif
>  	case CONT_PMD_SIZE:
>  	case PMD_SIZE:
> -		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
> +		__flush_tlb_range(vma, start, end, PMD_SIZE, last_level, 2);
>  		break;
>  	case CONT_PTE_SIZE:
> -		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, 3);
>  		break;
>  	default:
> -		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, TLBI_TTL_UNKNOWN);
>  	}
>  }
>  
> +#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
> +static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> +					   unsigned long start,
> +					   unsigned long end)
> +{
> +	unsigned long stride = huge_page_size(hstate_vma(vma));
> +
> +	__flush_hugetlb_tlb_range(vma, start, end, stride, false);
> +}
> +
>  #endif /* __ASM_HUGETLB_H */
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 6a2af9fb2566..065be8650aa5 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -183,8 +183,9 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
>  {
>  	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
>  	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
> +	unsigned long end = addr + (pgsize * ncontig);
>  
> -	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
> +	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, true);
>  	return orig_pte;
>  }
>  
> @@ -209,7 +210,7 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		__ptep_get_and_clear(mm, addr, ptep);
>  
> -	flush_tlb_range(&vma, saddr, addr);
> +	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> @@ -238,7 +239,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	dpfn = pgsize >> PAGE_SHIFT;
>  	hugeprot = pte_pgprot(pte);
>  
> -	clear_flush(mm, addr, ptep, pgsize, ncontig);
> +	/* Only need to "break" if transitioning valid -> valid. */
> +	if (pte_valid(__ptep_get(ptep)))
> +		clear_flush(mm, addr, ptep, pgsize, ncontig);
>  
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
>  		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);


LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
