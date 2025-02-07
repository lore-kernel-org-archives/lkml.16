Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981F01D31B8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922678; cv=none; b=rXAQKDx79PgZmNbxNHBtowpDJUP89qhYSG64Bhvc5tBeU+QNdeS1Vez1aBMkodTThChrEX/uB76litx3vh+5t/QdI58qtr+hUxF4zKKe9bYsFm1fbyQ/3y8O3QNb+f2D/D59oaV/IV4jgZzlsIfpi5L7+hPGYn/tMbZrIsWq7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922678; c=relaxed/simple;
	bh=1rXf4MmnOOia2nRJZ1m4OM7yvQpplpAVBWZo/sEV7dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhWpvNkMiDpWYqNfaR902BaGPJyoRDatk8DEcUDMx/nKgTPiuyglSeaioHENgr1m1PITsOtXN9ZU9LwnI4IK8ATnEnnu7zqi1J5EXcx6PeCruZ5PATECgpJSAr9tobT+X5kdYNfia3MsR96A+HU0V4RJ7TO8zuCbpUOvzr5VMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABBE9106F;
	Fri,  7 Feb 2025 02:04:58 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B212D3F63F;
	Fri,  7 Feb 2025 02:04:30 -0800 (PST)
Message-ID: <9a0d3009-18fc-4b53-941a-b6d830fce36a@arm.com>
Date: Fri, 7 Feb 2025 15:34:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/16] arm64/mm: Support huge pte-mapped pages in vmap
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
 <20250205151003.88959-13-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-13-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 20:39, Ryan Roberts wrote:
> Implement the required arch functions to enable use of contpte in the
> vmap when VM_ALLOW_HUGE_VMAP is specified. This speeds up vmap
> operations due to only having to issue a DSB and ISB per contpte block
> instead of per pte. But it also means that the TLB pressure reduces due
> to only needing a single TLB entry for the whole contpte block.

Right.

> 
> Since vmap uses set_huge_pte_at() to set the contpte, that API is now
> used for kernel mappings for the first time. Although in the vmap case
> we never expect it to be called to modify a valid mapping so
> clear_flush() should never be called, it's still wise to make it robust
> for the kernel case, so amend the tlb flush function if the mm is for
> kernel space.

Makes sense.

> 
> Tested with vmalloc performance selftests:
> 
>   # kself/mm/test_vmalloc.sh \
> 	run_test_mask=1
> 	test_repeat_count=5
> 	nr_pages=256
> 	test_loop_count=100000
> 	use_huge=1
> 
> Duration reduced from 1274243 usec to 1083553 usec on Apple M2 for 15%
> reduction in time taken.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 40 ++++++++++++++++++++++++++++++++
>  arch/arm64/mm/hugetlbpage.c      |  5 +++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 38fafffe699f..fbdeb40f3857 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,6 +23,46 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>  	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>  }
>  
> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> +						unsigned long end, u64 pfn,
> +						unsigned int max_page_shift)
> +{
> +	if (max_page_shift < CONT_PTE_SHIFT)
> +		return PAGE_SIZE;
> +
> +	if (end - addr < CONT_PTE_SIZE)
> +		return PAGE_SIZE;
> +
> +	if (!IS_ALIGNED(addr, CONT_PTE_SIZE))
> +		return PAGE_SIZE;
> +
> +	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> +		return PAGE_SIZE;
> +
> +	return CONT_PTE_SIZE;

A small nit:

Should the rationale behind picking CONT_PTE_SIZE be added here as an in code
comment or something in the function - just to make things bit clear.

> +}
> +
> +#define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
> +static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
> +							   pte_t *ptep)
> +{
> +	/*
> +	 * The caller handles alignment so it's sufficient just to check
> +	 * PTE_CONT.
> +	 */
> +	return pte_valid_cont(__ptep_get(ptep)) ? CONT_PTE_SIZE : PAGE_SIZE;

I guess it is safe to query the CONT_PTE from the mapped entry itself.

> +}
> +
> +#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
> +static inline int arch_vmap_pte_supported_shift(unsigned long size)
> +{
> +	if (size >= CONT_PTE_SIZE)
> +		return CONT_PTE_SHIFT;
> +
> +	return PAGE_SHIFT;
> +}
> +
>  #endif
>  
>  #define arch_vmap_pgprot_tagged arch_vmap_pgprot_tagged
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 02afee31444e..a74e43101dad 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -217,7 +217,10 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		___ptep_get_and_clear(mm, ptep, pgsize);
>  
> -	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
> +	if (mm == &init_mm)
> +		flush_tlb_kernel_range(saddr, addr);
> +	else
> +		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,

Otherwise LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
