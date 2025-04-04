Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D4BA95E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743742469; cv=none; b=N8kS/Ijz21rjXUCF6bhR/q6oqCS8znvqFrqghmJJPGNnxoDQPZJ1AxmCfvXDAZN+f6XKWS3d7DsdUpeNayfIEDwEaFctRX7eVd/suTKEQ/MdiPvCq5bZ+I2GY26L6dqzsj8OMNaJwpZLUixdEOQXA6WG/bDI0K6n6E0cpW36nSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743742469; c=relaxed/simple;
	bh=DVsGWBffIxs5oGnbNeh2kPBlbJNcw8YtrJF5Mx0qJaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlSQQCvwMml+ZoNLrBX9A+PyHV2WGBuVBZpsP/4mTh0RLJcQI3U3TKRuu28TWW8NdVE0Br2BPGDptjCgUwRBEg2eZQtQw9ABfnIJSg7+hUJ2WN63kpVV2xhwOaXc3Jo1yUD0oolM83ZvXSe3xN6pYIZONnwh9xm5t2XGjoc66DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE2A1516;
	Thu,  3 Apr 2025 21:54:28 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5A633F59E;
	Thu,  3 Apr 2025 21:54:20 -0700 (PDT)
Message-ID: <39d4d1d4-3d22-4d31-bfc6-1d583e9d3f9b@arm.com>
Date: Fri, 4 Apr 2025 10:24:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] mm/vmalloc: Enter lazy mmu mode while
 manipulating vmalloc ptes
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
 <20250304150444.3788920-11-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-11-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/25 20:34, Ryan Roberts wrote:
> Wrap vmalloc's pte table manipulation loops with
> arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
> the arch code with the opportunity to optimize the pte manipulations.
> 
> Note that vmap_pfn() already uses lazy mmu mode since it delegates to
> apply_to_page_range() which enters lazy mmu mode for both user and
> kernel mappings.
> 
> These hooks will shortly be used by arm64 to improve vmalloc
> performance.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6111ce900ec4..b63ca0b7dd40 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -104,6 +104,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
>  			if (pfn_valid(pfn)) {
> @@ -127,6 +130,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -354,6 +359,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
>  		size = arch_vmap_pte_range_unmap_size(addr, pte);
> @@ -370,6 +377,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			ptent = ptep_get_and_clear(&init_mm, addr, pte);
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> @@ -515,6 +524,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		struct page *page = pages[*nr];
>  
> @@ -528,6 +540,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
