Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22721D9663
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566502; cv=none; b=QsMp5VvEXt0VOveFTco3QutCLiYElalTtJNVX86Wccb92OJ+hbTit+mY9Ur3NEiak8Vwf9tAn1rzONTuJkUitSkb6fI5TiHou/gTmNh/5VHekCQ3MyAN5Hty6PGa8TRd5ziNS85IOyHVnFvzOHYS3c9cAn8bbSUwSXMyzRCTUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566502; c=relaxed/simple;
	bh=72iE8ISlaAHsCkUARy9MnNsybXlXmfXmUu2xLVG8tJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sjrb2sGrZ9BD2ASHlTqcB7C2GDIYJv5HaCk1fPQyj/8wtvb9Cd9gDAu06+G/SazVPkqHYwyd7Gnuq5/jTznddDmLeHNro3SG/BjmVQwNAovtjaMiOQl2uPPhWkn4Q7AX5tQaZtgrG11hk58BrQ9oQhVLvlGGYw5LOG02NJUnGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B41CD14BF;
	Tue, 10 Jun 2025 07:41:20 -0700 (PDT)
Received: from [10.1.33.221] (XHFQ2J9959.cambridge.arm.com [10.1.33.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 729763F673;
	Tue, 10 Jun 2025 07:41:36 -0700 (PDT)
Message-ID: <dc2ead47-3f8c-498b-bc64-1abe3d3ba56b@arm.com>
Date: Tue, 10 Jun 2025 15:41:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250610114401.7097-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2025 12:44, Dev Jain wrote:
> Since apply_to_page_range does not support operations on block mappings,
> use the generic pagewalk API to enable changing permissions for kernel
> block mappings. This paves the path for enabling huge mappings by default
> on kernel space mappings, thus leading to more efficient TLB usage.
> 
> We only require that the start and end of a given range lie on leaf mapping
> boundaries. Return EINVAL in case a partial block mapping is detected; add

nit: return -EINVAL

> a corresponding comment in ___change_memory_common() to warn that
> eliminating such a condition is the responsibility of the caller.
> 
> apply_to_page_range ultimately uses the lazy MMU hooks at the pte level
> function (apply_to_pte_range) - we want to use this functionality after
> this patch too. Ryan says:
> "The only reason we traditionally confine the lazy mmu mode to a single
> page table is because we want to enclose it within the PTL. But that
> requirement doesn't stand for kernel mappings. As long as the walker can
> guarantee that it doesn't allocate any memory (because with certain debug
> settings that can cause lazy mmu nesting) or try to sleep then I think we
> can just bracket the entire call."

It would be better to state the facts here rather than repeat what I previously
wrote on another thread :)

How about something like:

"""
apply_to_page_range() performs all pte level callbacks while in lazy mmu mode.
Since arm64 can optimize performance by batching barriers when modifying kernel
pgtables in lazy mmu mode, we would like to continue to benefit from this
optimisation. Unfortunately walk_kernel_page_table_range() does not use lazy mmu
mode. However, since the pagewalk framework is not allocating any memory, we can
safely bracket the whole operation inside lazy mmu mode ourselves.
"""

> Therefore, wrap the call to walk_kernel_page_table_range() with the
> lazy MMU helpers.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 158 +++++++++++++++++++++++++++++++--------
>  1 file changed, 126 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..2c118c0922ef 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -8,6 +8,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
> +#include <linux/pagewalk.h>
>  
>  #include <asm/cacheflush.h>
>  #include <asm/pgtable-prot.h>
> @@ -20,6 +21,100 @@ struct page_change_data {
>  	pgprot_t clear_mask;
>  };
>  
> +static pteval_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)

val is ptdesc_t on entry and pteval_t on return. Let's use ptdesc_t throughout
since it's intended to represent a "pgtable descriptor at any level".

> +{
> +	struct page_change_data *masks = walk->private;
> +
> +	val &= ~(pgprot_val(masks->clear_mask));
> +	val |= (pgprot_val(masks->set_mask));
> +
> +	return val;
> +}
> +
> +static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pgd_t val = pgdp_get(pgd);
> +
> +	if (pgd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
> +			return -EINVAL;
> +		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
> +		set_pgd(pgd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	p4d_t val = p4dp_get(p4d);
> +
> +	if (p4d_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
> +			return -EINVAL;
> +		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
> +		set_p4d(p4d, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pud_t val = pudp_get(pud);
> +
> +	if (pud_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
> +			return -EINVAL;
> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
> +		set_pud(pud, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pmd_t val = pmdp_get(pmd);
> +
> +	if (pmd_leaf(val)) {
> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
> +			return -EINVAL;
> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
> +		set_pmd(pmd, val);
> +		walk->action = ACTION_CONTINUE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
> +			      unsigned long next, struct mm_walk *walk)
> +{
> +	pte_t val = __ptep_get(pte);
> +
> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
> +	__set_pte(pte, val);
> +
> +	return 0;
> +}
> +
> +static const struct mm_walk_ops pageattr_ops = {
> +	.pgd_entry	= pageattr_pgd_entry,
> +	.p4d_entry	= pageattr_p4d_entry,

I may have been wrong when I told you that we would need to support pgd and p4d
for certain configs. Looking again at the code, I'm not sure.

Let's say we have 64K page size with 42 bit VA. That gives 2 levels of lookup.
We would normally think of that as a PGD table and a PTE table. But I think for
the purposes of this, pte_entry and pmd_entry will be called? I'm not really
sure - I don't have a great grasp on how pgtable folding works.

Trouble is, if pte_entry and pgd_entry get called (as I originally thought),
pgd_leaf() is always false on arm64, which would clearly be a bug...

I'm hoping someone else can pipe up to clarify. Or perhaps you can build the
config and do a test?

If it turns out that the "lower" callbacks will always be called, we should
probably remove pgd_entry and p4d_entry in the name of performance.

> +	.pud_entry	= pageattr_pud_entry,
> +	.pmd_entry	= pageattr_pmd_entry,
> +	.pte_entry	= pageattr_pte_entry,
> +	.walk_lock	= PGWALK_NOLOCK,
> +};
> +
>  bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>  
>  bool can_set_direct_map(void)
> @@ -37,22 +132,7 @@ bool can_set_direct_map(void)
>  		arm64_kfence_can_set_direct_map() || is_realm_world();
>  }
>  
> -static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
> -{
> -	struct page_change_data *cdata = data;
> -	pte_t pte = __ptep_get(ptep);
> -
> -	pte = clear_pte_bit(pte, cdata->clear_mask);
> -	pte = set_pte_bit(pte, cdata->set_mask);
> -
> -	__set_pte(ptep, pte);
> -	return 0;
> -}
> -
> -/*
> - * This function assumes that the range is mapped with PAGE_SIZE pages.
> - */
> -static int __change_memory_common(unsigned long start, unsigned long size,
> +static int ___change_memory_common(unsigned long start, unsigned long size,
>  				pgprot_t set_mask, pgprot_t clear_mask)
>  {
>  	struct page_change_data data;
> @@ -61,9 +141,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>  
> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> -					&data);
> +	arch_enter_lazy_mmu_mode();
> +
> +	/*
> +	 * The caller must ensure that the range we are operating on does not
> +	 * partially overlap a block mapping. Any such case should either not
> +	 * exist, or must be eliminated by splitting the mapping - which for
> +	 * kernel mappings can be done only on BBML2 systems.
> +	 *
> +	 */
> +	ret = walk_kernel_page_table_range(start, start + size, &pageattr_ops,
> +					   NULL, &data);
> +	arch_leave_lazy_mmu_mode();
> +
> +	return ret;
> +}
>  
> +static int __change_memory_common(unsigned long start, unsigned long size,
> +				  pgprot_t set_mask, pgprot_t clear_mask)
> +{
> +	int ret;
> +
> +	ret = ___change_memory_common(start, size, set_mask, clear_mask);
>  	/*
>  	 * If the memory is being made valid without changing any other bits
>  	 * then a TLBI isn't required as a non-valid entry cannot be cached in
> @@ -71,6 +170,7 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	 */
>  	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
>  		flush_tlb_kernel_range(start, start + size);
> +
>  	return ret;
>  }
>  
> @@ -174,32 +274,26 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
>  
>  int set_direct_map_invalid_noflush(struct page *page)
>  {
> -	struct page_change_data data = {
> -		.set_mask = __pgprot(0),
> -		.clear_mask = __pgprot(PTE_VALID),
> -	};
> +	pgprot_t clear_mask = __pgprot(PTE_VALID);
> +	pgprot_t set_mask = __pgprot(0);
>  
>  	if (!can_set_direct_map())
>  		return 0;
>  
> -	return apply_to_page_range(&init_mm,
> -				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +	return ___change_memory_common((unsigned long)page_address(page), PAGE_SIZE,
> +					set_mask, clear_mask);
>  }
>  
>  int set_direct_map_default_noflush(struct page *page)
>  {
> -	struct page_change_data data = {
> -		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
> -		.clear_mask = __pgprot(PTE_RDONLY),
> -	};
> +	pgprot_t set_mask = __pgprot(PTE_VALID | PTE_WRITE);
> +	pgprot_t clear_mask = __pgprot(PTE_RDONLY);
>  
>  	if (!can_set_direct_map())
>  		return 0;
>  
> -	return apply_to_page_range(&init_mm,
> -				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +	return ___change_memory_common((unsigned long)page_address(page), PAGE_SIZE,

nit: you're at 85 chars here. Given you are breaking anyway, why not put
PAGE_SIZE on the next line? Same for set_direct_map_invalid_noflush().

> +					set_mask, clear_mask);
>  }
>  
>  static int __set_memory_enc_dec(unsigned long addr,


This is looking good to me overall - nearly there!

Thanks,
Ryan


