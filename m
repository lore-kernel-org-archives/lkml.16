Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A931C32
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681589; cv=none; b=WCi3eTMHVG0uMwPmMMjMheQVcOetZ+4zV28OunyfZGvwECKDsc7M+pw8Tb6v7rzvvN8WiSISIe/LhYp7ZmpGrYbFuOFV0mBf3K34Vj/OIwUlaSiCFXCxPTvsuOP3UQ/ovibRGnmej7NBZ2B34SBpmt7zmLCnFUH+VdCDgXvCmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681589; c=relaxed/simple;
	bh=1MOSHMF1O/tT/h18a1lavN7Yp8dTmu1B+5qrZHpe/MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fipCRRLJpSzyit4wj8ZwMC3/uyC2beOveYaETBn57wyATiQnz21rFBUOM+PoEXLhy09IXC4DabsjlbhRv7qTduLI46EfA54SqPX8MzF45GokNKBtbXEk+lKTIxqzcnWXpGybs/88+9QHfhNRzB0Noj/0E8o1gnHIVal0RWAjSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EEDE113E;
	Mon, 23 Jun 2025 05:26:09 -0700 (PDT)
Received: from [10.1.29.169] (XHFQ2J9959.cambridge.arm.com [10.1.29.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126FA3F58B;
	Mon, 23 Jun 2025 05:26:25 -0700 (PDT)
Message-ID: <3bc77e2c-66d6-40d3-a30f-07139e8e8f43@arm.com>
Date: Mon, 23 Jun 2025 13:26:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not
 supported on secondary CPUs
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-5-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250531024545.1101304-5-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2025 03:41, Yang Shi wrote:
> The kernel linear mapping is painted in very early stage of system boot.
> The cpufeature has not been finalized yet at this point.  So the linear
> mapping is determined by the capability of boot CPU.  If the boot CPU
> supports BBML2, large block mapping will be used for linear mapping.
> 
> But the secondary CPUs may not support BBML2, so repaint the linear mapping
> if large block mapping is used and the secondary CPUs don't support BBML2
> once cpufeature is finalized on all CPUs.
> 
> If the boot CPU doesn't support BBML2 or the secondary CPUs have the
> same BBML2 capability with the boot CPU, repainting the linear mapping
> is not needed.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/mmu.h   |   3 +
>  arch/arm64/kernel/cpufeature.c |  16 +++++
>  arch/arm64/mm/mmu.c            | 108 ++++++++++++++++++++++++++++++++-
>  arch/arm64/mm/proc.S           |  41 +++++++++++++
>  4 files changed, 166 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 2693d63bf837..ad38135d1aa1 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -56,6 +56,8 @@ typedef struct {
>   */
>  #define ASID(mm)	(atomic64_read(&(mm)->context.id) & 0xffff)
>  
> +extern bool block_mapping;

Is this really useful to cache? Why not just call force_pte_mapping() instead?
Its the inverse. It's also not a great name for a global variable.

But perhaps it is better to cache a boolean that also reflects the bbml2 status:

bool linear_map_requires_bbml2;

Then create_idmap() will only bother to add to the idmap if there is a chance
you will need to repaint. And repaint_linear_mappings() won't need to explcitly
check !rodata_full.

I think this can be __initdata too?

> +
>  static inline bool arm64_kernel_unmapped_at_el0(void)
>  {
>  	return alternative_has_cap_unlikely(ARM64_UNMAP_KERNEL_AT_EL0);
> @@ -72,6 +74,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>  extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>  extern void mark_linear_text_alias_ro(void);
>  extern int split_linear_mapping(unsigned long start, unsigned long end);
> +extern int __repaint_linear_mappings(void *__unused);

nit: "repaint_linear_mappings" is a bit vague. How about
linear_map_split_to_ptes() or similar?

>  
>  /*
>   * This check is triggered during the early boot before the cpufeature
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5fc2a4a804de..5151c101fbaf 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -85,6 +85,7 @@
>  #include <asm/insn.h>
>  #include <asm/kvm_host.h>
>  #include <asm/mmu_context.h>
> +#include <asm/mmu.h>
>  #include <asm/mte.h>
>  #include <asm/hypervisor.h>
>  #include <asm/processor.h>
> @@ -2005,6 +2006,20 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  	return 0;
>  }
>  
> +static void __init repaint_linear_mappings(void)
> +{
> +	if (!block_mapping)
> +		return;
> +
> +	if (!rodata_full)
> +		return;
> +
> +	if (system_supports_bbml2_noabort())
> +		return;
> +
> +	stop_machine(__repaint_linear_mappings, NULL, cpu_online_mask);

With the above suggestions, I think this can be simplified to something like:

static void __init linear_map_maybe_split_to_ptes(void)
{
	if (linear_map_requires_bbml2 && !system_supports_bbml2_noabort())
		stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
}

> +}
> +
>  static void __init kpti_install_ng_mappings(void)
>  {
>  	/* Check whether KPTI is going to be used */
> @@ -3868,6 +3883,7 @@ void __init setup_system_features(void)
>  {
>  	setup_system_capabilities();
>  
> +	repaint_linear_mappings();
>  	kpti_install_ng_mappings();
>  
>  	sve_setup();
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 4c5d3aa35d62..3922af89abbb 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -209,6 +209,8 @@ static void split_pmd(pmd_t pmd, phys_addr_t pte_phys, int flags)
>  	/* It must be naturally aligned if PMD is leaf */
>  	if ((flags & NO_CONT_MAPPINGS) == 0)
>  		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
> +	else
> +		prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
>  
>  	for (int i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>  		__set_pte_nosync(ptep, pfn_pte(pfn, prot));
> @@ -230,6 +232,8 @@ static void split_pud(pud_t pud, phys_addr_t pmd_phys, int flags)
>  	/* It must be naturally aligned if PUD is leaf */
>  	if ((flags & NO_CONT_MAPPINGS) == 0)
>  		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
> +	else
> +		prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
>  
>  	for (int i = 0; i < PTRS_PER_PMD; i++, pmdp++) {
>  		__set_pmd_nosync(pmdp, pfn_pmd(pfn, prot));
> @@ -833,6 +837,86 @@ void __init mark_linear_text_alias_ro(void)
>  			    PAGE_KERNEL_RO);
>  }
>  
> +static phys_addr_t repaint_pgtable_alloc(int shift)
> +{
> +	void *ptr;
> +
> +	ptr = (void *)__get_free_page(GFP_ATOMIC);
> +	if (!ptr)
> +		return -1;
> +
> +	return __pa(ptr);
> +}
> +
> +extern u32 repaint_done;
> +
> +int __init __repaint_linear_mappings(void *__unused)
> +{
> +	typedef void (repaint_wait_fn)(void);
> +	extern repaint_wait_fn bbml2_wait_for_repainting;
> +	repaint_wait_fn *wait_fn;
> +
> +	phys_addr_t kernel_start = __pa_symbol(_stext);
> +	phys_addr_t kernel_end = __pa_symbol(__init_begin);
> +	phys_addr_t start, end;
> +	unsigned long vstart, vend;
> +	u64 i;
> +	int ret;
> +	int flags = NO_EXEC_MAPPINGS | NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS |
> +		    SPLIT_MAPPINGS;
> +	int cpu = smp_processor_id();

nit: most of these variables are only needed by cpu 0 so you could defer their
initialization until inside the if condition below.

> +
> +	wait_fn = (void *)__pa_symbol(bbml2_wait_for_repainting);
> +
> +	/*
> +	 * Repainting just can be run on CPU 0 because we just can be sure
> +	 * CPU 0 supports BBML2.
> +	 */
> +	if (!cpu) {
> +		/*
> +		 * Wait for all secondary CPUs get prepared for repainting
> +		 * the linear mapping.
> +		 */
> +wait_for_secondary:
> +		if (READ_ONCE(repaint_done) != num_online_cpus())
> +			goto wait_for_secondary;

This feels suspect when comparing against the assembly code that does a similar
sync operation in idmap_kpti_install_ng_mappings:

	/* We're the boot CPU. Wait for the others to catch up */
	sevl
1:	wfe
	ldaxr	w17, [flag_ptr]
	eor	w17, w17, num_cpus
	cbnz	w17, 1b

The acquire semantics of the ldaxr are needed here to ensure that program-order
future memory accesses don't get reordered before. READ_ONCE() is relaxed so
permits reordering.

The wfe means the CPU is not just furiously spinning, but actually waiting for a
secondary cpu exclusively write to the variable at flag_ptr.

I think you can drop the whole loop and just call:

	smp_cond_load_acquire(&repaint_done, VAL == num_online_cpus());

> +
> +		memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> +		/* Split the whole linear mapping */
> +		for_each_mem_range(i, &start, &end) {
> +			if (start >= end)
> +				return -EINVAL;
> +
> +			vstart = __phys_to_virt(start);
> +			vend = __phys_to_virt(end);
> +			ret = __create_pgd_mapping_locked(init_mm.pgd, start,
> +					vstart, (end - start), __pgprot(0),
> +					repaint_pgtable_alloc, flags);
> +			if (ret)
> +				panic("Failed to split linear mappings\n");
> +
> +			flush_tlb_kernel_range(vstart, vend);
> +		}
> +		memblock_clear_nomap(kernel_start, kernel_end - kernel_start);

You're relyng on the memblock API here. Is that valid, given we are quite late
into the boot at this point and we have transferred control to the buddy?

I was thinking you would just need to traverse the the linear map region of the
kernel page table, splitting each large leaf you find into the next size down?

> +
> +		WRITE_ONCE(repaint_done, 0);

I think this depends on the dsb(ish) in flush_tlb_kernel_range() to ensure it is
not re-ordered before any pgtable split operations? Might be worth a comment.


> +	} else {
> +		/*
> +		 * The secondary CPUs can't run in the same address space
> +		 * with CPU 0 because accessing the linear mapping address
> +		 * when CPU 0 is repainting it is not safe.
> +		 *
> +		 * Let the secondary CPUs run busy loop in idmap address
> +		 * space when repainting is ongoing.
> +		 */
> +		cpu_install_idmap();
> +		wait_fn();
> +		cpu_uninstall_idmap();
> +	}
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_KFENCE
>  
>  bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
> @@ -887,6 +971,8 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>  
>  #endif /* CONFIG_KFENCE */
>  
> +bool block_mapping;
> +>  static inline bool force_pte_mapping(void)
>  {
>  	/*
> @@ -915,6 +1001,8 @@ static void __init map_mem(pgd_t *pgdp)
>  	int flags = NO_EXEC_MAPPINGS;
>  	u64 i;
>  
> +	block_mapping = true;
> +
>  	/*
>  	 * Setting hierarchical PXNTable attributes on table entries covering
>  	 * the linear region is only possible if it is guaranteed that no table
> @@ -930,8 +1018,10 @@ static void __init map_mem(pgd_t *pgdp)
>  
>  	early_kfence_pool = arm64_kfence_alloc_pool();
>  
> -	if (force_pte_mapping())
> +	if (force_pte_mapping()) {
> +		block_mapping = false;
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> +	}
>  
>  	/*
>  	 * Take care not to create a writable alias for the
> @@ -1063,7 +1153,8 @@ void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>  		    int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
>  
>  static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
> -	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
> +	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
> +	  bbml2_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
>  
>  static void __init create_idmap(void)
>  {
> @@ -1088,6 +1179,19 @@ static void __init create_idmap(void)
>  			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>  			       __phys_to_virt(ptep) - ptep);
>  	}
> +
> +	/*
> +	 * Setup idmap mapping for repaint_done flag.  It will be used if
> +	 * repainting the linear mapping is needed later.
> +	 */
> +	if (block_mapping) {
> +		u64 pa = __pa_symbol(&repaint_done);
> +		ptep = __pa_symbol(bbml2_ptes);
> +
> +		__pi_map_range(&ptep, pa, pa + sizeof(u32), pa, PAGE_KERNEL,
> +			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
> +			       __phys_to_virt(ptep) - ptep);
> +	}
>  }
>  
>  void __init paging_init(void)
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index fb30c8804f87..c40e6126c093 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -440,6 +440,47 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
>  	.popsection
>  #endif
>  
> +/*
> + * Wait for repainting is done. Run on secondary CPUs
> + * only.
> + */
> +	.pushsection	".data", "aw", %progbits
> +SYM_DATA(repaint_done, .long 1)
> +	.popsection
> +
> +	.pushsection ".idmap.text", "a"
> +SYM_TYPED_FUNC_START(bbml2_wait_for_repainting)
> +	swapper_ttb	.req	x0
> +	flag_ptr	.req	x1
> +
> +	mrs	swapper_ttb, ttbr1_el1
> +	adr_l	flag_ptr, repaint_done
> +
> +	/* Uninstall swapper before surgery begins */
> +	__idmap_cpu_set_reserved_ttbr1 x16, x17
> +
> +	/* Increment the flag to let the boot CPU we're ready */
> +1:	ldxr	w16, [flag_ptr]
> +	add	w16, w16, #1
> +	stxr	w17, w16, [flag_ptr]
> +	cbnz	w17, 1b
> +
> +	/* Wait for the boot CPU to finish repainting */
> +	sevl
> +1:	wfe
> +	ldxr	w16, [flag_ptr]
> +	cbnz	w16, 1b
> +
> +	/* All done, act like nothing happened */
> +	msr	ttbr1_el1, swapper_ttb
> +	isb
> +	ret
> +
> +	.unreq	swapper_ttb
> +	.unreq	flag_ptr
> +SYM_FUNC_END(bbml2_wait_for_repainting)
> +	.popsection

This is identical to __idmap_kpti_secondary. Can't we just refactor it into a
common function? I think you can even reuse the same refcount variable (i.e. no
need for both repaint_done and __idmap_kpti_flag).

Thanks,
Ryan


> +
>  /*
>   *	__cpu_setup
>   *

