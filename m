Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAF327932E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075088; cv=none; b=cOUvUH56QuQL+WuxyULV07511TQlKyYTKKxAYdZq8kItrf4aq/4AgB+0ta/B+CAbXcYXy2HO4GIrGa9qiLlICbnOt5bPyZcrOD4strJ9CjWP6vTU95BgpEJF/8oh8T+qsG61KWXatJjXDsHgIiBF4WRlqHqgZkqhG9HqqPwOHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075088; c=relaxed/simple;
	bh=Cx2/DWKuz93g/0pw0FTLUdC//4qDuU0wdH8/FBAEUjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF9B1IKGNtV5ZtLX+bXm7YMmJTEUMrFvfuaDH8cXte2KfNEzcUgkpJp9WPrpoDZ2ElVe/IpqoZUCG0PIj5fXDJd1SQ2LOg1b99+rP5M3JRrkHqkb1Tawk/5ZclPbDFtDi0bXANhsU9RpRIznXx0+sg2E6zT9GYLj+gCtFe389bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBE3A150C;
	Mon, 16 Jun 2025 04:57:43 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEDA03F58B;
	Mon, 16 Jun 2025 04:58:03 -0700 (PDT)
Message-ID: <60a7e30e-73f4-4e0f-aee5-606808a18a61@arm.com>
Date: Mon, 16 Jun 2025 12:58:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-4-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250531024545.1101304-4-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2025 03:41, Yang Shi wrote:
> When rodata=full is specified, kernel linear mapping has to be mapped at
> PTE level since large page table can't be split due to break-before-make
> rule on ARM64.
> 
> This resulted in a couple of problems:
>   - performance degradation
>   - more TLB pressure
>   - memory waste for kernel page table
> 
> With FEAT_BBM level 2 support, splitting large block page table to
> smaller ones doesn't need to make the page table entry invalid anymore.
> This allows kernel split large block mapping on the fly.
> 
> Add kernel page table split support and use large block mapping by
> default when FEAT_BBM level 2 is supported for rodata=full.  When
> changing permissions for kernel linear mapping, the page table will be
> split to smaller size.
> 
> The machine without FEAT_BBM level 2 will fallback to have kernel linear
> mapping PTE-mapped when rodata=full.
> 
> With this we saw significant performance boost with some benchmarks and
> much less memory consumption on my AmpereOne machine (192 cores, 1P) with
> 256GB memory.
> 
> * Memory use after boot
> Before:
> MemTotal:       258988984 kB
> MemFree:        254821700 kB
> 
> After:
> MemTotal:       259505132 kB
> MemFree:        255410264 kB
> 
> Around 500MB more memory are free to use.  The larger the machine, the
> more memory saved.
> 
> * Memcached
> We saw performance degradation when running Memcached benchmark with
> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
> With this patchset we saw ops/sec is increased by around 3.5%, P99
> latency is reduced by around 9.6%.
> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
> MPKI is reduced by 28.5%.
> 
> The benchmark data is now on par with rodata=on too.
> 
> * Disk encryption (dm-crypt) benchmark
> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
> encryption (by dm-crypt).
> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>     --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>     --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>     --name=iops-test-job --eta-newline=1 --size 100G
> 
> The IOPS is increased by 90% - 150% (the variance is high, but the worst
> number of good case is around 90% more than the best number of bad case).
> The bandwidth is increased and the avg clat is reduced proportionally.
> 
> * Sequential file read
> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
> The bandwidth is increased by 150%.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/cpufeature.h |  26 +++
>  arch/arm64/include/asm/mmu.h        |   1 +
>  arch/arm64/include/asm/pgtable.h    |  12 +-
>  arch/arm64/kernel/cpufeature.c      |   2 +-
>  arch/arm64/mm/mmu.c                 | 269 +++++++++++++++++++++++++---
>  arch/arm64/mm/pageattr.c            |  37 +++-
>  6 files changed, 319 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 8f36ffa16b73..a95806980298 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -1053,6 +1053,32 @@ static inline bool cpu_has_lpa2(void)
>  #endif
>  }
>  
> +bool cpu_has_bbml2_noabort(unsigned int cpu_midr);
> +
> +static inline bool has_nobbml2_override(void)
> +{
> +	u64 mmfr2;
> +	unsigned int bbm;
> +
> +	mmfr2 = read_sysreg_s(SYS_ID_AA64MMFR2_EL1);
> +	mmfr2 &= ~id_aa64mmfr2_override.mask;
> +	mmfr2 |= id_aa64mmfr2_override.val;
> +	bbm = cpuid_feature_extract_unsigned_field(mmfr2,
> +						   ID_AA64MMFR2_EL1_BBM_SHIFT);
> +	return bbm == 0;
> +}
> +
> +/*
> + * Called at early boot stage on boot CPU before cpu info and cpu feature
> + * are ready.
> + */
> +static inline bool bbml2_noabort_available(void)
> +{
> +	return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) &&
> +	       cpu_has_bbml2_noabort(read_cpuid_id()) &&
> +	       !has_nobbml2_override();

Based on Will's feedback, The Kconfig and the cmdline override will both
disappear in Miko's next version and we will only use the MIDR list to decide
BBML2_NOABORT status, so this will significantly simplify. Sorry about the churn
here.

> +}
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 6e8aa8e72601..2693d63bf837 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -71,6 +71,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>  			       pgprot_t prot, bool page_mappings_only);
>  extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>  extern void mark_linear_text_alias_ro(void);
> +extern int split_linear_mapping(unsigned long start, unsigned long end);

nit: Perhaps split_leaf_mapping() or split_kernel_pgtable_mapping() or something
similar is more generic which will benefit us in future when using this for
vmalloc too?

>  
>  /*
>   * This check is triggered during the early boot before the cpufeature
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..bf3cef31d243 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -293,6 +293,11 @@ static inline pmd_t pmd_mkcont(pmd_t pmd)
>  	return __pmd(pmd_val(pmd) | PMD_SECT_CONT);
>  }
>  
> +static inline pmd_t pmd_mknoncont(pmd_t pmd)
> +{
> +	return __pmd(pmd_val(pmd) & ~PMD_SECT_CONT);
> +}
> +
>  static inline pte_t pte_mkdevmap(pte_t pte)
>  {
>  	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
> @@ -769,7 +774,7 @@ static inline bool in_swapper_pgdir(void *addr)
>  	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
>  }
>  
> -static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
> +static inline void __set_pmd_nosync(pmd_t *pmdp, pmd_t pmd)
>  {
>  #ifdef __PAGETABLE_PMD_FOLDED
>  	if (in_swapper_pgdir(pmdp)) {
> @@ -779,6 +784,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  
>  	WRITE_ONCE(*pmdp, pmd);
> +}
> +
> +static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
> +{
> +	__set_pmd_nosync(pmdp, pmd);
>  
>  	if (pmd_valid(pmd)) {
>  		dsb(ishst);
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index e879bfcf853b..5fc2a4a804de 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2209,7 +2209,7 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>  }
>  
> -static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
> +bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>  {
>  	/*
>  	 * We want to allow usage of bbml2 in as wide a range of kernel contexts


[...] I'll send a separate response for the mmu.c table walker changes.

>  
> +int split_linear_mapping(unsigned long start, unsigned long end)
> +{
> +	int ret = 0;
> +
> +	if (!system_supports_bbml2_noabort())
> +		return 0;

Hmm... I guess the thinking here is that for !BBML2_NOABORT you are expecting
this function should only be called in the first place if we know we are
pte-mapped. So I guess this is ok... it just means that if we are not
pte-mapped, warnings will be emitted while walking the pgtables (as is the case
today). So I think this approach is ok.

> +
> +	mmap_write_lock(&init_mm);

What is the lock protecting? I was orignally thinking no locking should be
needed because it's not needed for permission changes today; But I think you are
right here and we do need locking; multiple owners could share a large leaf
mapping, I guess? And in that case you could get concurrent attempts to split
from both owners.

I'm not really a fan of adding the extra locking though; It might introduce a
new bottleneck. I wonder if there is a way we could do this locklessly? i.e.
allocate the new table, then cmpxchg to insert and the loser has to free? That
doesn't work for contiguous mappings though...

> +	/* NO_EXEC_MAPPINGS is needed when splitting linear map */
> +	ret = __create_pgd_mapping_locked(init_mm.pgd, virt_to_phys((void *)start),
> +					  start, (end - start), __pgprot(0),
> +					  __pgd_pgtable_alloc,
> +					  NO_EXEC_MAPPINGS | SPLIT_MAPPINGS);
> +	mmap_write_unlock(&init_mm);
> +	flush_tlb_kernel_range(start, end);

I don't believe we should need to flush the TLB when only changing entry sizes
when BBML2 is supported. Miko's series has a massive comment explaining the
reasoning. That applies to user space though. We should consider if this all
works safely for kernel space too, and hopefully remove the flush.

> +
> +	return ret;
> +}
> +
>  /*
>   * This function can only be used to modify existing table entries,
>   * without allocating new levels of table. Note that this permits the
> @@ -676,6 +887,24 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>  
>  #endif /* CONFIG_KFENCE */
>  
> +static inline bool force_pte_mapping(void)
> +{
> +	/*
> +	 * Can't use cpufeature API to determine whether BBML2 supported
> +	 * or not since cpufeature have not been finalized yet.
> +	 *
> +	 * Checking the boot CPU only for now.  If the boot CPU has
> +	 * BBML2, paint linear mapping with block mapping.  If it turns
> +	 * out the secondary CPUs don't support BBML2 once cpufeature is
> +	 * fininalized, the linear mapping will be repainted with PTE
> +	 * mapping.
> +	 */
> +	return (rodata_full && !bbml2_noabort_available()) ||

So this is the case where we don't have BBML2 and need to modify protections at
page granularity - I agree we need to force pte mappings here.

> +		debug_pagealloc_enabled() ||

This is the case where every page is made invalid on free and valid on
allocation, so no point in having block mappings because it will soon degenerate
into page mappings because we will have to split on every allocation. Agree here
too.

> +		arm64_kfence_can_set_direct_map() ||

After looking into how kfence works, I don't agree with this one. It has a
dedicated pool where it allocates from. That pool may be allocated early by the
arch or may be allocated late by the core code. Either way, kfence will only
modify protections within that pool. You current approach is forcing pte
mappings if the pool allocation is late (i.e. not performed by the arch code
during boot). But I think "late" is the most common case; kfence is compiled
into the kernel but not active at boot. Certainly that's how my Ubuntu kernel is
configured. So I think we should just ignore kfence here. If it's "early" then
we map the pool with page granularity (as an optimization). If it's "late" your
splitter will degenerate the whole kfence pool to page mappings over time as
kfence_protect_page() -> set_memory_valid() is called. But the bulk of the
linear map will remain mapped with large blocks.

> +		is_realm_world();

I think the only reason this requires pte mappings is for
__set_memory_enc_dec(). But that can now deal with block mappings given the
ability to split the mappings as needed. So I think this condition can be
removed too.

> +}

Additionally, for can_set_direct_map(); at minimum it's comment should be tidied
up, but really I think it should return true if "BBML2_NOABORT ||
force_pte_mapping()". Because they are the conditions under which we can now
safely modify the linear map.

> +
>  static void __init map_mem(pgd_t *pgdp)
>  {
>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> @@ -701,7 +930,7 @@ static void __init map_mem(pgd_t *pgdp)
>  
>  	early_kfence_pool = arm64_kfence_alloc_pool();
>  
> -	if (can_set_direct_map())
> +	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
>  	/*
> @@ -1402,7 +1631,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  
>  	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>  
> -	if (can_set_direct_map())
> +	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
>  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..25c068712cb5 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -10,6 +10,7 @@
>  #include <linux/vmalloc.h>
>  
>  #include <asm/cacheflush.h>
> +#include <asm/mmu.h>
>  #include <asm/pgtable-prot.h>
>  #include <asm/set_memory.h>
>  #include <asm/tlbflush.h>
> @@ -42,6 +43,8 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>  	struct page_change_data *cdata = data;
>  	pte_t pte = __ptep_get(ptep);
>  
> +	BUG_ON(pte_cont(pte));

I don't think this is required; We want to enable using contiguous mappings
where it makes sense. As long as we have BBML2, we can update contiguous pte
mappings in place, as long as we update all of the ptes in the contiguous block.
split_linear_map() should either have converted to non-cont mappings if the
contiguous block straddled the split point, or would have left as is (or
downgraded a PMD-block to a contpte block) if fully contained within the split
range.

> +
>  	pte = clear_pte_bit(pte, cdata->clear_mask);
>  	pte = set_pte_bit(pte, cdata->set_mask);
>  
> @@ -80,8 +83,9 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	unsigned long start = addr;
>  	unsigned long size = PAGE_SIZE * numpages;
>  	unsigned long end = start + size;
> +	unsigned long l_start;
>  	struct vm_struct *area;
> -	int i;
> +	int i, ret;
>  
>  	if (!PAGE_ALIGNED(addr)) {
>  		start &= PAGE_MASK;
> @@ -118,7 +122,12 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>  			    pgprot_val(clear_mask) == PTE_RDONLY)) {
>  		for (i = 0; i < area->nr_pages; i++) {
> -			__change_memory_common((u64)page_address(area->pages[i]),
> +			l_start = (u64)page_address(area->pages[i]);
> +			ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
> +			if (WARN_ON_ONCE(ret))
> +				return ret;

I don't think this is the right place to integrate; I think the split should be
done inside __change_memory_common(). Then it caters to all possibilities (i.e.
set_memory_valid() and __set_memory_enc_dec()). This means it will run for
vmalloc too, but for now, that will be a nop because everything should already
be split as required on entry and in future we will get that for free.

Once you have integrated Dev's series, the hook becomes
___change_memory_common() (3 underscores)...

> +
> +			__change_memory_common(l_start,
>  					       PAGE_SIZE, set_mask, clear_mask);
>  		}
>  	}
> @@ -174,6 +183,9 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
>  
>  int set_direct_map_invalid_noflush(struct page *page)
>  {
> +	unsigned long l_start;
> +	int ret;
> +
>  	struct page_change_data data = {
>  		.set_mask = __pgprot(0),
>  		.clear_mask = __pgprot(PTE_VALID),
> @@ -182,13 +194,21 @@ int set_direct_map_invalid_noflush(struct page *page)
>  	if (!can_set_direct_map())
>  		return 0;
>  
> +	l_start = (unsigned long)page_address(page);
> +	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
>  	return apply_to_page_range(&init_mm,
> -				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +				   l_start, PAGE_SIZE, change_page_range,
> +				   &data);

...and once integrated with Dev's series you don't need any changes here...

>  }
>  
>  int set_direct_map_default_noflush(struct page *page)
>  {
> +	unsigned long l_start;
> +	int ret;
> +
>  	struct page_change_data data = {
>  		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
>  		.clear_mask = __pgprot(PTE_RDONLY),
> @@ -197,9 +217,14 @@ int set_direct_map_default_noflush(struct page *page)
>  	if (!can_set_direct_map())
>  		return 0;
>  
> +	l_start = (unsigned long)page_address(page);
> +	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
>  	return apply_to_page_range(&init_mm,
> -				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +				   l_start, PAGE_SIZE, change_page_range,
> +				   &data);

...or here.

Thanks,
Ryan

>  }
>  
>  static int __set_memory_enc_dec(unsigned long addr,

