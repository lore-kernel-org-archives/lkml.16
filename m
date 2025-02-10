Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ACD130E58
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739171490; cv=none; b=aC8e5XKiozUsYfjhNLuIJOZqtYabAOZA0fmvkHhQkDcXj1xNNsM5BdxO8BON2IvNwThdKvM4OUyICqqCCodUsvLU92cCw4NIiXDvZC20nP+DBACZkDOmxK+ClZC/4h8JMSaAj86qpTIt+/hDCzhmuWNu4h+0fSyYpBelB7jIyeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739171490; c=relaxed/simple;
	bh=5o+wL5SmjRL0jubzmEd9mYGGELCtkhqC7XzWMClBHzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsjyxhCBRnqsTr1cCqfJxayZOrKu9MI7jEqzXip6oQ666svTCAWXarmH5U1LdHsXyJxWEcO6ViSI7NVziTXV9eaE6vCpKSwX5UbzjYTWfsRiXuWms8lP/yPF5A/jX0spIwOocwrRA2wzf0ZOkd6ljvTPTyIz3sEA1xIP+ZNLhl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4217A1BA8;
	Sun,  9 Feb 2025 23:11:43 -0800 (PST)
Received: from [10.163.35.99] (unknown [10.163.35.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3504B3F58B;
	Sun,  9 Feb 2025 23:11:12 -0800 (PST)
Message-ID: <7e184caf-2447-48d4-8d7c-1b63deb0f418@arm.com>
Date: Mon, 10 Feb 2025 12:41:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/16] mm/vmalloc: Batch arch_sync_kernel_mappings()
 more efficiently
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
 <20250205151003.88959-15-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-15-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/5/25 20:39, Ryan Roberts wrote:
> When page_shift is greater than PAGE_SIZE, __vmap_pages_range_noflush()
> will call vmap_range_noflush() for each individual huge page. But
> vmap_range_noflush() would previously call arch_sync_kernel_mappings()
> directly so this would end up being called for every huge page.
> 
> We can do better than this; refactor the call into the outer
> __vmap_pages_range_noflush() so that it is only called once for the
> entire batch operation.

This makes sense.

> 
> This will benefit performance for arm64 which is about to opt-in to
> using the hook.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 60 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 68950b1824d0..50fd44439875 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -285,40 +285,38 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>  
>  static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
> -			unsigned int max_page_shift)
> +			unsigned int max_page_shift, pgtbl_mod_mask *mask)
>  {
>  	pgd_t *pgd;
> -	unsigned long start;
>  	unsigned long next;
>  	int err;
> -	pgtbl_mod_mask mask = 0;
>  
>  	might_sleep();
>  	BUG_ON(addr >= end);
>  
> -	start = addr;
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
> -					max_page_shift, &mask);
> +					max_page_shift, mask);
>  		if (err)
>  			break;
>  	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
>  
> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> -		arch_sync_kernel_mappings(start, end);
> -
>  	return err;
>  }

arch_sync_kernel_mappings() gets dropped here and moved to existing
vmap_range_noflush() callers instead.

>  
>  int vmap_page_range(unsigned long addr, unsigned long end,
>  		    phys_addr_t phys_addr, pgprot_t prot)
>  {
> +	pgtbl_mod_mask mask = 0;
>  	int err;
>  
>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> -				 ioremap_max_page_shift);
> +				 ioremap_max_page_shift, &mask);
> +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> +		arch_sync_kernel_mappings(addr, end);
> +

arch_sync_kernel_mappings() gets moved here.

>  	flush_cache_vmap(addr, end);
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> @@ -587,29 +585,24 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  }
>  
>  static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages)
> +		pgprot_t prot, struct page **pages, pgtbl_mod_mask *mask)
>  {
> -	unsigned long start = addr;
>  	pgd_t *pgd;
>  	unsigned long next;
>  	int err = 0;
>  	int nr = 0;
> -	pgtbl_mod_mask mask = 0;
>  
>  	BUG_ON(addr >= end);
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
> -			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +			*mask |= PGTBL_PGD_MODIFIED;
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, mask);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
>  
> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> -		arch_sync_kernel_mappings(start, end);
> -
>  	return err;
>  }
>  
> @@ -626,26 +619,33 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
>  	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> +	unsigned long start = addr;
> +	pgtbl_mod_mask mask = 0;
> +	int err = 0;
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
> -
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> -		int err;
> -
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> -					page_to_phys(pages[i]), prot,
> -					page_shift);
> -		if (err)
> -			return err;
> +			page_shift == PAGE_SHIFT) {
> +		err = vmap_small_pages_range_noflush(addr, end, prot, pages,
> +						&mask);

Unlike earlier don't return here until arch_sync_kernel_mappings()
gets covered later.

> +	} else {
> +		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> +			err = vmap_range_noflush(addr,
> +						addr + (1UL << page_shift),
> +						page_to_phys(pages[i]), prot,
> +						page_shift, &mask);
> +			if (err)
> +				break;
>  
> -		addr += 1UL << page_shift;
> +			addr += 1UL << page_shift;
> +		}
>  	}
>  
> -	return 0;
> +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> +		arch_sync_kernel_mappings(start, end);

arch_sync_kernel_mappings() gets moved here after getting dropped
from both vmap_range_noflush() and vmap_small_pages_range_noflush().

> +
> +	return err;
>  }
>  
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,

LGTM, and this can stand on its own as well.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
