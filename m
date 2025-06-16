Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D30287511
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091079; cv=none; b=deFqq+itQlM6PbkvApOYB+9wlFeQacNg2LCfL3GGxbw72UpoegeWhdS7WK4w+e9ggkbnMP+7eWgCtO8O773GqqLSnHzu7W2pTlwOjimO8EPe7TWHwn6iiTtgtuM6FYC59G4FNst5019L/L4Eq9LkQJa4KiFX28YAp1IMTgdFu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091079; c=relaxed/simple;
	bh=ttbG6LwIGUvmIT0PPvt+0hUi0RRx6eIhLwlVsHe6whQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeGqKTGXTe22WxxIo64aVhDs3mdm6vLlwr1tbzsWHYSRZ4EfRH/ephNfRp6pt2qaihIR2l6lROftsHfIrT24dwyCJyjudEB8xAKVcb/ruQONBR+hIV9vxMgeRqLW2hnAFhOeTAMPN43gwA1UsjKJkAwgIkFVYah3ON7Nb3PnwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC9EA1424;
	Mon, 16 Jun 2025 09:24:13 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5A63F673;
	Mon, 16 Jun 2025 09:24:33 -0700 (PDT)
Message-ID: <f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com>
Date: Mon, 16 Jun 2025 17:24:31 +0100
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

[...] (I gave comments on this part in previous reply)

I'm focussing on teh table walker in mmu.c here - i.e. implementation of
split_linear_mapping()...

> index 775c0536b194..4c5d3aa35d62 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -45,6 +45,7 @@
>  #define NO_BLOCK_MAPPINGS	BIT(0)
>  #define NO_CONT_MAPPINGS	BIT(1)
>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
> +#define SPLIT_MAPPINGS		BIT(3)
>  
>  u64 kimage_voffset __ro_after_init;
>  EXPORT_SYMBOL(kimage_voffset);
> @@ -166,12 +167,91 @@ static void init_clear_pgtable(void *table)
>  	dsb(ishst);
>  }
>  
> +static void split_cont_pte(pte_t *ptep)
> +{
> +	pte_t *_ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
> +	pte_t _pte;
> +
> +	for (int i = 0; i < CONT_PTES; i++, _ptep++) {
> +		_pte = READ_ONCE(*_ptep);
> +		_pte = pte_mknoncont(_pte);
> +		__set_pte_nosync(_ptep, _pte);

This is not atomic but I don't think that matters for kernel mappings since we
don't care about HW-modified access/dirty bits.

> +	}
> +
> +	dsb(ishst);
> +	isb();

I think we can use lazy_mmu_mode here to potentially batch the barriers for
multiple levels. This also avoids the need for adding __set_pmd_nosync().

> +}
> +
> +static void split_cont_pmd(pmd_t *pmdp)
> +{
> +	pmd_t *_pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
> +	pmd_t _pmd;
> +
> +	for (int i = 0; i < CONT_PMDS; i++, _pmdp++) {
> +		_pmd = READ_ONCE(*_pmdp);
> +		_pmd = pmd_mknoncont(_pmd);
> +		set_pmd(_pmdp, _pmd);

Without lazy_mmu_mode this is issuing barriers per entry. With lazy_mmu_mode
this will defer the barriers until we exit the mode so this will get a bit
faster. (in practice it will be a bit like what you have done for contpte but
potentially even better because we can batch across levels.

> +	}
> +}
> +
> +static void split_pmd(pmd_t pmd, phys_addr_t pte_phys, int flags)
> +{
> +	pte_t *ptep;
> +	unsigned long pfn;
> +	pgprot_t prot;
> +
> +	pfn = pmd_pfn(pmd);
> +	prot = pmd_pgprot(pmd);
> +	prot = __pgprot((pgprot_val(prot) & ~PMD_TYPE_MASK) | PTE_TYPE_PAGE);
> +
> +	ptep = (pte_t *)phys_to_virt(pte_phys);
> +
> +	/* It must be naturally aligned if PMD is leaf */
> +	if ((flags & NO_CONT_MAPPINGS) == 0)

I'm not sure we have a use case for avoiding CONT mappings? Suggest doing it
unconditionally.

> +		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
> +
> +	for (int i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
> +		__set_pte_nosync(ptep, pfn_pte(pfn, prot));
> +
> +	dsb(ishst);
> +}
> +
> +static void split_pud(pud_t pud, phys_addr_t pmd_phys, int flags)
> +{
> +	pmd_t *pmdp;
> +	unsigned long pfn;
> +	pgprot_t prot;
> +	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
> +
> +	pfn = pud_pfn(pud);
> +	prot = pud_pgprot(pud);
> +	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
> +
> +	/* It must be naturally aligned if PUD is leaf */
> +	if ((flags & NO_CONT_MAPPINGS) == 0)
> +		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
> +
> +	for (int i = 0; i < PTRS_PER_PMD; i++, pmdp++) {
> +		__set_pmd_nosync(pmdp, pfn_pmd(pfn, prot));
> +		pfn += step;
> +	}
> +
> +	dsb(ishst);
> +}
> +
>  static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
> -		     phys_addr_t phys, pgprot_t prot)
> +		     phys_addr_t phys, pgprot_t prot, int flags)
>  {
>  	do {
>  		pte_t old_pte = __ptep_get(ptep);
>  
> +		if (flags & SPLIT_MAPPINGS) {
> +			if (pte_cont(old_pte))
> +				split_cont_pte(ptep);
> +
> +			continue;
> +		}
> +
>  		/*
>  		 * Required barriers to make this visible to the table walker
>  		 * are deferred to the end of alloc_init_cont_pte().
> @@ -199,11 +279,20 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  	pmd_t pmd = READ_ONCE(*pmdp);
>  	pte_t *ptep;
>  	int ret = 0;
> +	bool split = flags & SPLIT_MAPPINGS;
> +	pmdval_t pmdval;
> +	phys_addr_t pte_phys;
>  
> -	BUG_ON(pmd_sect(pmd));
> -	if (pmd_none(pmd)) {
> -		pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
> -		phys_addr_t pte_phys;
> +	if (!split)
> +		BUG_ON(pmd_sect(pmd));
> +
> +	if (pmd_none(pmd) && split) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (pmd_none(pmd) || (split && pmd_leaf(pmd))) {
> +		pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>  
>  		if (flags & NO_EXEC_MAPPINGS)
>  			pmdval |= PMD_TABLE_PXN;
> @@ -213,6 +302,18 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  			ret = -ENOMEM;
>  			goto out;
>  		}
> +	}
> +
> +	if (split) {
> +		if (pmd_leaf(pmd)) {
> +			split_pmd(pmd, pte_phys, flags);
> +			__pmd_populate(pmdp, pte_phys, pmdval);
> +		}
> +		ptep = pte_offset_kernel(pmdp, addr);
> +		goto split_pgtable;
> +	}
> +
> +	if (pmd_none(pmd)) {
>  		ptep = pte_set_fixmap(pte_phys);
>  		init_clear_pgtable(ptep);
>  		ptep += pte_index(addr);
> @@ -222,17 +323,28 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  		ptep = pte_set_fixmap_offset(pmdp, addr);
>  	}
>  
> +split_pgtable:
>  	do {
>  		pgprot_t __prot = prot;
>  
>  		next = pte_cont_addr_end(addr, end);
>  
> +		if (split) {
> +			pte_t pteval = READ_ONCE(*ptep);
> +			bool cont = pte_cont(pteval);
> +
> +			if (cont &&
> +			    ((addr | next) & ~CONT_PTE_MASK) == 0 &&
> +			    (flags & NO_CONT_MAPPINGS) == 0)
> +				continue;
> +		}
> +
>  		/* use a contiguous mapping if the range is suitably aligned */
>  		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
>  		    (flags & NO_CONT_MAPPINGS) == 0)
>  			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> -		init_pte(ptep, addr, next, phys, __prot);
> +		init_pte(ptep, addr, next, phys, __prot, flags);
>  
>  		ptep += pte_index(next) - pte_index(addr);
>  		phys += next - addr;
> @@ -243,7 +355,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  	 * ensure that all previous pgtable writes are visible to the table
>  	 * walker.
>  	 */
> -	pte_clear_fixmap();
> +	if (!split)
> +		pte_clear_fixmap();
>  
>  out:
>  	return ret;
> @@ -255,15 +368,29 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  {
>  	unsigned long next;
>  	int ret = 0;
> +	bool split = flags & SPLIT_MAPPINGS;
> +	bool cont;
>  
>  	do {
>  		pmd_t old_pmd = READ_ONCE(*pmdp);
>  
>  		next = pmd_addr_end(addr, end);
>  
> +		if (split && pmd_leaf(old_pmd)) {
> +			cont = pgprot_val(pmd_pgprot(old_pmd)) & PTE_CONT;
> +			if (cont)
> +				split_cont_pmd(pmdp);
> +
> +			/* The PMD is fully contained in the range */
> +			if (((addr | next) & ~PMD_MASK) == 0 &&
> +			    (flags & NO_BLOCK_MAPPINGS) == 0)
> +				continue;
> +		}
> +
>  		/* try section mapping first */
>  		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
> +		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
> +		    (flags & SPLIT_MAPPINGS) == 0) {
>  			pmd_set_huge(pmdp, phys, prot);
>  
>  			/*
> @@ -278,7 +405,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  			if (ret)
>  				break;
>  
> -			BUG_ON(pmd_val(old_pmd) != 0 &&
> +			BUG_ON(!split && pmd_val(old_pmd) != 0 &&
>  			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
>  		}
>  		phys += next - addr;
> @@ -296,14 +423,23 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  	int ret = 0;
>  	pud_t pud = READ_ONCE(*pudp);
>  	pmd_t *pmdp;
> +	bool split = flags & SPLIT_MAPPINGS;
> +	pudval_t pudval;
> +	phys_addr_t pmd_phys;
>  
>  	/*
>  	 * Check for initial section mappings in the pgd/pud.
>  	 */
> -	BUG_ON(pud_sect(pud));
> -	if (pud_none(pud)) {
> -		pudval_t pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
> -		phys_addr_t pmd_phys;
> +	if (!split)
> +		BUG_ON(pud_sect(pud));
> +
> +	if (pud_none(pud) && split) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (pud_none(pud) || (split && pud_leaf(pud))) {
> +		pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>  
>  		if (flags & NO_EXEC_MAPPINGS)
>  			pudval |= PUD_TABLE_PXN;
> @@ -313,6 +449,18 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  			ret = -ENOMEM;
>  			goto out;
>  		}
> +	}
> +
> +	if (split) {
> +		if (pud_leaf(pud)) {
> +			split_pud(pud, pmd_phys, flags);
> +			__pud_populate(pudp, pmd_phys, pudval);
> +		}
> +		pmdp = pmd_offset(pudp, addr);
> +		goto split_pgtable;
> +	}
> +
> +	if (pud_none(pud)) {
>  		pmdp = pmd_set_fixmap(pmd_phys);
>  		init_clear_pgtable(pmdp);
>  		pmdp += pmd_index(addr);
> @@ -322,11 +470,22 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  		pmdp = pmd_set_fixmap_offset(pudp, addr);
>  	}
>  
> +split_pgtable:
>  	do {
>  		pgprot_t __prot = prot;
>  
>  		next = pmd_cont_addr_end(addr, end);
>  
> +		if (split) {
> +			pmd_t pmdval = READ_ONCE(*pmdp);
> +			bool cont = pgprot_val(pmd_pgprot(pmdval)) & PTE_CONT;
> +
> +			if (cont &&
> +			    ((addr | next) & ~CONT_PMD_MASK) == 0 &&
> +			    (flags & NO_CONT_MAPPINGS) == 0)
> +				continue;
> +		}
> +
>  		/* use a contiguous mapping if the range is suitably aligned */
>  		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
>  		    (flags & NO_CONT_MAPPINGS) == 0)
> @@ -340,7 +499,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  		phys += next - addr;
>  	} while (addr = next, addr != end);
>  
> -	pmd_clear_fixmap();
> +	if (!split)
> +		pmd_clear_fixmap();
>  
>  out:
>  	return ret;
> @@ -355,6 +515,16 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  	int ret = 0;
>  	p4d_t p4d = READ_ONCE(*p4dp);
>  	pud_t *pudp;
> +	bool split = flags & SPLIT_MAPPINGS;
> +
> +	if (split) {
> +		if (p4d_none(p4d)) {
> +			ret= -EINVAL;
> +			goto out;
> +		}
> +		pudp = pud_offset(p4dp, addr);
> +		goto split_pgtable;
> +	}
>  
>  	if (p4d_none(p4d)) {
>  		p4dval_t p4dval = P4D_TYPE_TABLE | P4D_TABLE_UXN | P4D_TABLE_AF;
> @@ -377,17 +547,26 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  		pudp = pud_set_fixmap_offset(p4dp, addr);
>  	}
>  
> +split_pgtable:
>  	do {
>  		pud_t old_pud = READ_ONCE(*pudp);
>  
>  		next = pud_addr_end(addr, end);
>  
> +		if (split && pud_leaf(old_pud)) {
> +			/* The PUD is fully contained in the range */
> +			if (((addr | next) & ~PUD_MASK) == 0 &&
> +			    (flags & NO_BLOCK_MAPPINGS) == 0)
> +				continue;
> +		}
> +
>  		/*
>  		 * For 4K granule only, attempt to put down a 1GB block
>  		 */
>  		if (pud_sect_supported() &&
>  		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
> +		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
> +		    (flags & SPLIT_MAPPINGS) == 0) {
>  			pud_set_huge(pudp, phys, prot);
>  
>  			/*
> @@ -402,13 +581,14 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  			if (ret)
>  				break;
>  
> -			BUG_ON(pud_val(old_pud) != 0 &&
> +			BUG_ON(!split && pud_val(old_pud) != 0 &&
>  			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
>  		}
>  		phys += next - addr;
>  	} while (pudp++, addr = next, addr != end);
>  
> -	pud_clear_fixmap();
> +	if (!split)
> +		pud_clear_fixmap();
>  
>  out:
>  	return ret;
> @@ -423,6 +603,16 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  	int ret = 0;
>  	pgd_t pgd = READ_ONCE(*pgdp);
>  	p4d_t *p4dp;
> +	bool split = flags & SPLIT_MAPPINGS;
> +
> +	if (split) {
> +		if (pgd_none(pgd)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		p4dp = p4d_offset(pgdp, addr);
> +		goto split_pgtable;
> +	}

I really don't like the way the split logic has been added to the existing table
walker; there are so many conditionals, it's not clear that there is really any
advantage. I know I proposed it originally, but I changed my mind last cycle and
made the case for keeping it separate. That's still my opinon I'm afraid; I'm
proposing a patch below showing how I would prefer to see this implemented.

>  
>  	if (pgd_none(pgd)) {
>  		pgdval_t pgdval = PGD_TYPE_TABLE | PGD_TABLE_UXN | PGD_TABLE_AF;
> @@ -445,6 +635,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  		p4dp = p4d_set_fixmap_offset(pgdp, addr);
>  	}
>  
> +split_pgtable:
>  	do {
>  		p4d_t old_p4d = READ_ONCE(*p4dp);
>  
> @@ -461,7 +652,8 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  		phys += next - addr;
>  	} while (p4dp++, addr = next, addr != end);
>  
> -	p4d_clear_fixmap();
> +	if (!split)
> +		p4d_clear_fixmap();
>  
>  out:
>  	return ret;
> @@ -557,6 +749,25 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>  	return pa;
>  }
>  
> +int split_linear_mapping(unsigned long start, unsigned long end)
> +{
> +	int ret = 0;
> +
> +	if (!system_supports_bbml2_noabort())
> +		return 0;
> +
> +	mmap_write_lock(&init_mm);
> +	/* NO_EXEC_MAPPINGS is needed when splitting linear map */
> +	ret = __create_pgd_mapping_locked(init_mm.pgd, virt_to_phys((void *)start),
> +					  start, (end - start), __pgprot(0),
> +					  __pgd_pgtable_alloc,
> +					  NO_EXEC_MAPPINGS | SPLIT_MAPPINGS);

Implementing this on top of __create_pgd_mapping_locked() is problematic because
(I think) it assumes that the virtual range is physically contiguous? That's
fine for the linear map, but I'd like to reuse this primitive for vmalloc too.

> +	mmap_write_unlock(&init_mm);

As already mentioned, I don't like this locking. I think we can make it work
locklessly as long as we are only ever splitting and not collapsing.

> +	flush_tlb_kernel_range(start, end);
> +
> +	return ret;
> +}

I had a go at creating a version to try to illustrate how I have been thinking
about this. What do you think? I've only compile tested it (and it fails because
I don't have pmd_mknoncont() and system_supports_bbml2_noabort() in my tree -
but the rest looks ok). It's on top of v6.16-rc1, where the pgtable allocation
functions have changed a bit. And I don't think you need patch 2 from your
series with this change. I haven't implemented the cmpxchg part that I think
would make it safe to be used locklessly yet, but I've marked the sites up with
TODO. Once implemented, the idea is that concurrent threads trying to split on
addresses that all lie within the same block/contig mapping should be safe.

---8<---
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8fcf59ba39db..22a09cc7a2aa 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -480,6 +480,9 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys,
unsigned long virt,
 			     int flags);
 #endif

+/* Sentinel used to represent failure to allocate for phys_addr_t type. */
+#define INVALID_PHYS_ADDR -1
+
 static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 				       enum pgtable_type pgtable_type)
 {
@@ -487,7 +490,9 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
 	phys_addr_t pa;

-	BUG_ON(!ptdesc);
+	if (!ptdesc)
+		return INVALID_PHYS_ADDR;
+
 	pa = page_to_phys(ptdesc_page(ptdesc));

 	switch (pgtable_type) {
@@ -509,15 +514,27 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
 }

 static phys_addr_t __maybe_unused
-pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
+try_pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
 {
 	return __pgd_pgtable_alloc(&init_mm, pgtable_type);
 }

+static phys_addr_t __maybe_unused
+pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
+{
+	phys_addr_t pa = __pgd_pgtable_alloc(&init_mm, pgtable_type);
+
+	BUG_ON(!pa);
+	return pa;
+}
+
 static phys_addr_t
 pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
 {
-	return __pgd_pgtable_alloc(NULL, pgtable_type);
+	phys_addr_t pa = __pgd_pgtable_alloc(NULL, pgtable_type);
+
+	BUG_ON(!pa);
+	return pa;
 }

 /*
@@ -1616,3 +1633,202 @@ int arch_set_user_pkey_access(struct task_struct *tsk,
int pkey, unsigned long i
 	return 0;
 }
 #endif
+
+static void split_contpte(pte_t *ptep)
+{
+	int i;
+
+	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
+	for (i = 0; i < CONT_PTES; i++, ptep++)
+		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
+}
+
+static int split_pmd(pmd_t *pmdp, pmd_t pmd)
+{
+	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
+	unsigned long pfn = pmd_pfn(pmd);
+	pgprot_t prot = pmd_pgprot(pmd);
+	phys_addr_t pte_phys;
+	pte_t *ptep;
+	int i;
+
+	pte_phys = try_pgd_pgtable_alloc_init_mm(TABLE_PTE);
+	if (pte_phys == INVALID_PHYS_ADDR)
+		return -ENOMEM;
+	ptep = (pte_t *)phys_to_virt(pte_phys);
+
+	if (pgprot_val(prot) & PMD_SECT_PXN)
+		tableprot |= PMD_TABLE_PXN;
+
+	prot = __pgprot((pgprot_val(prot) & ~PTE_TYPE_MASK) | PTE_TYPE_PAGE);
+	prot = __pgprot(pgprot_val(prot) | PTE_CONT);
+
+	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
+		__set_pte(ptep, pfn_pte(pfn, prot));
+
+	/*
+	 * Ensure the pte entries are visible to the table walker by the time
+	 * the pmd entry that points to the ptes is visible.
+	 */
+	dsb(ishst);
+
+	// TODO: THIS NEEDS TO BE CMPXCHG THEN FREE THE TABLE IF WE LOST.
+	__pmd_populate(pmdp, pte_phys, tableprot);
+
+	return 0;
+}
+
+static void split_contpmd(pmd_t *pmdp)
+{
+	int i;
+
+	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
+	for (i = 0; i < CONT_PMDS; i++, pmdp++)
+		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
+}
+
+static int split_pud(pud_t *pudp, pud_t pud)
+{
+	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
+	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
+	unsigned long pfn = pud_pfn(pud);
+	pgprot_t prot = pud_pgprot(pud);
+	phys_addr_t pmd_phys;
+	pmd_t *pmdp;
+	int i;
+
+	pmd_phys = try_pgd_pgtable_alloc_init_mm(TABLE_PMD);
+	if (pmd_phys == INVALID_PHYS_ADDR)
+		return -ENOMEM;
+	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
+
+	if (pgprot_val(prot) & PMD_SECT_PXN)
+		tableprot |= PUD_TABLE_PXN;
+
+	prot = __pgprot((pgprot_val(prot) & ~PMD_TYPE_MASK) | PMD_TYPE_SECT);
+	prot = __pgprot(pgprot_val(prot) | PTE_CONT);
+
+	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
+		set_pmd(pmdp, pfn_pmd(pfn, prot));
+
+	/*
+	 * Ensure the pmd entries are visible to the table walker by the time
+	 * the pud entry that points to the pmds is visible.
+	 */
+	dsb(ishst);
+
+	// TODO: THIS NEEDS TO BE CMPXCHG THEN FREE THE TABLE IF WE LOST.
+	__pud_populate(pudp, pmd_phys, tableprot);
+
+	return 0;
+}
+
+int split_leaf_mapping(unsigned long addr)
+{
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+	pte_t *ptep, pte;
+	int ret = 0;
+
+	/*
+	 * !BBML2_NOABORT systems should not be trying to change permissions on
+	 * anything that is not pte-mapped in the first place. Just return early
+	 * and let the permission change code raise a warning if not already
+	 * pte-mapped.
+	 */
+	if (!system_supports_bbml2_noabort())
+		return 0;
+
+	/*
+	 * Ensure addr is at least page-aligned since this is the finest
+	 * granularity we can split to.
+	 */
+	if (addr != PAGE_ALIGN(addr))
+		return -EINVAL;
+
+	arch_enter_lazy_mmu_mode();
+
+	/*
+	 * PGD: If addr is PGD aligned then addr already describes a leaf
+	 * boundary. If not present then there is nothing to split.
+	 */
+	if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
+		goto out;
+	pgdp = pgd_offset_k(addr);
+	pgd = pgdp_get(pgdp);
+	if (!pgd_present(pgd))
+		goto out;
+
+	/*
+	 * P4D: If addr is P4D aligned then addr already describes a leaf
+	 * boundary. If not present then there is nothing to split.
+	 */
+	if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
+		goto out;
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = p4dp_get(p4dp);
+	if (!p4d_present(p4d))
+		goto out;
+
+	/*
+	 * PUD: If addr is PUD aligned then addr already describes a leaf
+	 * boundary. If not present then there is nothing to split. Otherwise,
+	 * if we have a pud leaf, split to contpmd.
+	 */
+	if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
+		goto out;
+	pudp = pud_offset(p4dp, addr);
+	pud = pudp_get(pudp);
+	if (!pud_present(pud))
+		goto out;
+	if (pud_leaf(pud)) {
+		ret = split_pud(pudp, pud);
+		if (ret)
+			goto out;
+	}
+
+	/*
+	 * CONTPMD: If addr is CONTPMD aligned then addr already describes a
+	 * leaf boundary. If not present then there is nothing to split.
+	 * Otherwise, if we have a contpmd leaf, split to pmd.
+	 */
+	if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
+		goto out;
+	pmdp = pmd_offset(pudp, addr);
+	pmd = pmdp_get(pmdp);
+	if (!pmd_present(pmd))
+		goto out;
+	if (pmd_leaf(pmd)) {
+		if (pmd_cont(pmd))
+			split_contpmd(pmdp);
+		/*
+		 * PMD: If addr is PMD aligned then addr already describes a
+		 * leaf boundary. Otherwise, split to contpte.
+		 */
+		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
+			goto out;
+		ret = split_pmd(pmdp, pmd);
+		if (ret)
+			goto out;
+	}
+
+	/*
+	 * CONTPTE: If addr is CONTPTE aligned then addr already describes a
+	 * leaf boundary. If not present then there is nothing to split.
+	 * Otherwise, if we have a contpte leaf, split to pte.
+	 */
+	if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
+		goto out;
+	ptep = pte_offset_kernel(pmdp, addr);
+	pte = __ptep_get(ptep);
+	if (!pte_present(pte))
+		goto out;
+	if (pte_cont(pte))
+		split_contpte(ptep);
+
+out:
+	arch_leave_lazy_mmu_mode();
+	return ret;
+}
---8<---

Thanks,
Ryan

