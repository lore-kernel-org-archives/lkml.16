Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0F83085A0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275271; cv=none; b=BDXeX/4KeS7OESEcgzJ76XYgKFusoUhFgfL1BNYISM2uJmplkqmTzJWcb8oYJ5yCUpxBRCLwqaxGX3t4E2qH9iPA2p9tjyf8HqTxXPsbRFTDKEcR6Z2boeY60VyUV9UEOIWzygxZpD4wFNEo6pWaMPn+wisUHwn5dTHY5CScK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275271; c=relaxed/simple;
	bh=Z4B3YfZLGJWG0aXMKL7hGeK0JHTGPALHeIVsS+selyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCBg2fvC84r0TiGeGaPR1CSm+5QSCpnJ3MRGJ56RGBKLT4QFw8n+RoxC/oAQNGQf9ufJprvn8H3Qeu7T2KcGu2NUpSB7BJHopAK30iap1h7fp9NMPBFlHLiZMKlvr6NJ/QmxhGggTILT3yMNRLEndVC7G2K48CyTTbG6ismRXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7SB2tuL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7SB2tuL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750275271; x=1781811271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4B3YfZLGJWG0aXMKL7hGeK0JHTGPALHeIVsS+selyM=;
  b=j7SB2tuLmwlJql0ATjNFN4iwBy3TTCEBFdzjgfpV7qs6Oqwjg/EAb1pB
   vAc3U6IOR6xJTmBdGqIn0AIYKuMWEODJkKsERtLWhugf2EulanJE5X0Sx
   CZImaAiUEvJQtQoX99hViPvmK3nJP8+bvHmnmV/ML0IbvsMPDhQhJjAqn
   0GZrdqLFYxC8R+46GqtI0VCPLcsGNQyZgLhJjfuwf5L5GYbX1NEkJFt8V
   GQxTnLtkb0IncNufIxnWAZdv1SiaTFB9PwbAN/m1gVPWd+UTxR5MJqIaZ
   KWpF0Th+QMBaHukR18tmKOnzu16zWE5zi4j1q5FI+xHATS9VWfQ4s7S8p
   Q==;
X-CSE-ConnectionGUID: VqZfl569RO6xAJSHV/iunw==
X-CSE-MsgGUID: 2URR5cIbT+ymVPjgat110A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56193912"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="56193912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 12:34:30 -0700
X-CSE-ConnectionGUID: QC+06Ua8QX25jRNxeobu7Q==
X-CSE-MsgGUID: Of1+HyOXSCCTweqLapI5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="154833296"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2025 12:34:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRyYC-000K6I-0W;
	Wed, 18 Jun 2025 19:34:24 +0000
Date: Thu, 19 Jun 2025 03:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Khalid Ali <khaliidcaliy@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, ardb@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hpa@zytor.com,
	linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH v3] x86/boot: Don't return encryption mask from
 __startup_64()
Message-ID: <202506190255.i7td2YOj-lkp@intel.com>
References: <20250617084705.619-1-khaliidcaliy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617084705.619-1-khaliidcaliy@gmail.com>

Hi Khalid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.16-rc2 next-20250618]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Ali/x86-boot-Don-t-return-encryption-mask-from-__startup_64/20250617-164938
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250617084705.619-1-khaliidcaliy%40gmail.com
patch subject: [PATCH v3] x86/boot: Don't return encryption mask from __startup_64()
config: x86_64-randconfig-161-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190255.i7td2YOj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190255.i7td2YOj-lkp@intel.com/

smatch warnings:
arch/x86/boot/startup/map_kernel.c:211 __startup_64() warn: inconsistent indenting

vim +211 arch/x86/boot/startup/map_kernel.c

    72	
    73	/*
    74	 * This code is compiled using PIC codegen because it will execute from the
    75	 * early 1:1 mapping of memory, which deviates from the mapping expected by the
    76	 * linker. Due to this deviation, taking the address of a global variable will
    77	 * produce an ambiguous result when using the plain & operator.  Instead,
    78	 * rip_rel_ptr() must be used, which will return the RIP-relative address in
    79	 * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
    80	 * subtracting p2v_offset from the RIP-relative address.
    81	 */
    82	void __head __startup_64(unsigned long p2v_offset,
    83					  struct boot_params *bp)
    84	{
    85		pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
    86		unsigned long physaddr = (unsigned long)rip_rel_ptr(_text);
    87		unsigned long va_text, va_end;
    88		unsigned long pgtable_flags;
    89		unsigned long load_delta;
    90		pgdval_t *pgd;
    91		p4dval_t *p4d;
    92		pudval_t *pud;
    93		pmdval_t *pmd, pmd_entry;
    94		bool la57;
    95		int i;
    96	
    97		la57 = check_la57_support();
    98	
    99		/* Is the address too large? */
   100		if (physaddr >> MAX_PHYSMEM_BITS)
   101			for (;;);
   102	
   103		/*
   104		 * Compute the delta between the address I am compiled to run at
   105		 * and the address I am actually running at.
   106		 */
   107		phys_base = load_delta = __START_KERNEL_map + p2v_offset;
   108	
   109		/* Is the address not 2M aligned? */
   110		if (load_delta & ~PMD_MASK)
   111			for (;;);
   112	
   113		va_text = physaddr - p2v_offset;
   114		va_end  = (unsigned long)rip_rel_ptr(_end) - p2v_offset;
   115	
   116		/* Include the SME encryption mask in the fixup value */
   117		load_delta += sme_get_me_mask();
   118	
   119		/* Fixup the physical addresses in the page table */
   120	
   121		pgd = rip_rel_ptr(early_top_pgt);
   122		pgd[pgd_index(__START_KERNEL_map)] += load_delta;
   123	
   124		if (la57) {
   125			p4d = (p4dval_t *)rip_rel_ptr(level4_kernel_pgt);
   126			p4d[MAX_PTRS_PER_P4D - 1] += load_delta;
   127	
   128			pgd[pgd_index(__START_KERNEL_map)] = (pgdval_t)p4d | _PAGE_TABLE;
   129		}
   130	
   131		level3_kernel_pgt[PTRS_PER_PUD - 2].pud += load_delta;
   132		level3_kernel_pgt[PTRS_PER_PUD - 1].pud += load_delta;
   133	
   134		for (i = FIXMAP_PMD_TOP; i > FIXMAP_PMD_TOP - FIXMAP_PMD_NUM; i--)
   135			level2_fixmap_pgt[i].pmd += load_delta;
   136	
   137		/*
   138		 * Set up the identity mapping for the switchover.  These
   139		 * entries should *NOT* have the global bit set!  This also
   140		 * creates a bunch of nonsense entries but that is fine --
   141		 * it avoids problems around wraparound.
   142		 */
   143	
   144		pud = &early_pgts[0]->pmd;
   145		pmd = &early_pgts[1]->pmd;
   146		next_early_pgt = 2;
   147	
   148		pgtable_flags = _KERNPG_TABLE_NOENC + sme_get_me_mask();
   149	
   150		if (la57) {
   151			p4d = &early_pgts[next_early_pgt++]->pmd;
   152	
   153			i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
   154			pgd[i + 0] = (pgdval_t)p4d + pgtable_flags;
   155			pgd[i + 1] = (pgdval_t)p4d + pgtable_flags;
   156	
   157			i = physaddr >> P4D_SHIFT;
   158			p4d[(i + 0) % PTRS_PER_P4D] = (pgdval_t)pud + pgtable_flags;
   159			p4d[(i + 1) % PTRS_PER_P4D] = (pgdval_t)pud + pgtable_flags;
   160		} else {
   161			i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
   162			pgd[i + 0] = (pgdval_t)pud + pgtable_flags;
   163			pgd[i + 1] = (pgdval_t)pud + pgtable_flags;
   164		}
   165	
   166		i = physaddr >> PUD_SHIFT;
   167		pud[(i + 0) % PTRS_PER_PUD] = (pudval_t)pmd + pgtable_flags;
   168		pud[(i + 1) % PTRS_PER_PUD] = (pudval_t)pmd + pgtable_flags;
   169	
   170		pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
   171		pmd_entry += sme_get_me_mask();
   172		pmd_entry +=  physaddr;
   173	
   174		for (i = 0; i < DIV_ROUND_UP(va_end - va_text, PMD_SIZE); i++) {
   175			int idx = i + (physaddr >> PMD_SHIFT);
   176	
   177			pmd[idx % PTRS_PER_PMD] = pmd_entry + i * PMD_SIZE;
   178		}
   179	
   180		/*
   181		 * Fixup the kernel text+data virtual addresses. Note that
   182		 * we might write invalid pmds, when the kernel is relocated
   183		 * cleanup_highmap() fixes this up along with the mappings
   184		 * beyond _end.
   185		 *
   186		 * Only the region occupied by the kernel image has so far
   187		 * been checked against the table of usable memory regions
   188		 * provided by the firmware, so invalidate pages outside that
   189		 * region. A page table entry that maps to a reserved area of
   190		 * memory would allow processor speculation into that area,
   191		 * and on some hardware (particularly the UV platform) even
   192		 * speculative access to some reserved areas is caught as an
   193		 * error, causing the BIOS to halt the system.
   194		 */
   195	
   196		pmd = rip_rel_ptr(level2_kernel_pgt);
   197	
   198		/* invalidate pages before the kernel image */
   199		for (i = 0; i < pmd_index(va_text); i++)
   200			pmd[i] &= ~_PAGE_PRESENT;
   201	
   202		/* fixup pages that are part of the kernel image */
   203		for (; i <= pmd_index(va_end); i++)
   204			if (pmd[i] & _PAGE_PRESENT)
   205				pmd[i] += load_delta;
   206	
   207		/* invalidate pages after the kernel image */
   208		for (; i < PTRS_PER_PMD; i++)
   209			pmd[i] &= ~_PAGE_PRESENT;
   210	
 > 211		 sme_postprocess_startup(bp, pmd, p2v_offset);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
