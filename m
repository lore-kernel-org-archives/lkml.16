Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979017BA1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128580; cv=none; b=WYjdQCgjz03fmeArZs4D6ChURmKIxSQvNxrONy0UPD8EMM1fyv5Q/Dr4BvnlE2omvNbsuehRrxKCBuuQz3o2XpraFX+R5T7/9YXb/cRwhC17ZPC1J/h5ZP7JU8jpkHhUJTJtl0AWK4AEmzCVUb1Q2oppKuz2Rdqn5Vf9lbU+5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128580; c=relaxed/simple;
	bh=xkx+irIvlkv6UWYcr3Dt/KXGcAI0Qd/8P4oUQAhirqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giZFJLzZjCG80flfkpNesh2nue+ChPzBs59FCPsMC7qLHSUPPYEZpAWcb+nV0LbfjpEmlvzjQEls6Je4EPGTGL4aerabDOXqea/lwzNlRL+OIRNGD2ms2DyjJqI3KCtCCXmL+XWAu8p3PEm0xjrtPeiGI8NR0xKgSKw2GAZlcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3YFCAD3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3YFCAD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750128578; x=1781664578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xkx+irIvlkv6UWYcr3Dt/KXGcAI0Qd/8P4oUQAhirqs=;
  b=k3YFCAD3NxP4WwG2dh4PL6oRmMQg0j67pugv6byV/ykM1l7FEMcRg4Yi
   XlLNMfUUAdzuJ1wnbrpro0Tll9ha91KoJzhMD1Dnrpzw3GcPNAZPxvR84
   LGycQrSiRPmNr8QeiNLK5lyiKosmzR6yyO2436QRf6HOJmX+W45QtKqSg
   oaFf7/7cuZdvt3nKqtV2WkJzK9A84l5gQbQQ3NISX/TXMPn+1rmGtWLP7
   uxcMn2u1zuJmAwCFmLSXzdkn7Dptf2fqw+gG78osMfDw5W0wVGUYpOb3f
   wMrGMVxm6gHgbL9N5hFME8BdPaB8joSSglJQNfC/y+JQnPrSRCdhel5m/
   g==;
X-CSE-ConnectionGUID: CpLvgvLETkyu+07YyyajDQ==
X-CSE-MsgGUID: 1Wc+ETm1QWCuSBN1rdHMrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56093745"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="56093745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 19:49:37 -0700
X-CSE-ConnectionGUID: 0ATzQ+nwT12QQMJuvzgHDw==
X-CSE-MsgGUID: mheAy0wrR3iwN4Xuxb9V8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="149528943"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jun 2025 19:49:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRMOB-000FWm-1v;
	Tue, 17 Jun 2025 02:49:31 +0000
Date: Tue, 17 Jun 2025 10:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: Khalid Ali <khaliidcaliy@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hpa@zytor.com,
	linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH] x86/startup: Let the caller retrieve encryption mask
Message-ID: <202506171012.Ji3c5sJh-lkp@intel.com>
References: <20250616123605.927-1-khaliidcaliy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616123605.927-1-khaliidcaliy@gmail.com>

Hi Khalid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.16-rc2 next-20250616]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Ali/x86-startup-Let-the-caller-retrieve-encryption-mask/20250616-204024
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250616123605.927-1-khaliidcaliy%40gmail.com
patch subject: [PATCH] x86/startup: Let the caller retrieve encryption mask
config: x86_64-buildonly-randconfig-001-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171012.Ji3c5sJh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171012.Ji3c5sJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171012.Ji3c5sJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.S:114:2: warning: '/*' within block comment [-Wcomment]
     114 |         /* Form the CR3 value being sure to include the CR3 modifier */
         |         ^
   1 warning generated.


vim +114 arch/x86/kernel/head_64.S

bcce829083339b arch/x86/kernel/head_64.S Michael Roth          2022-02-09   96  
04633df0c43d71 arch/x86/kernel/head_64.S Borislav Petkov       2015-11-05   97  	/* Sanitize CPU configuration */
04633df0c43d71 arch/x86/kernel/head_64.S Borislav Petkov       2015-11-05   98  	call verify_cpu
04633df0c43d71 arch/x86/kernel/head_64.S Borislav Petkov       2015-11-05   99  
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  100  	/*
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  101  	 * Derive the kernel's physical-to-virtual offset from the physical and
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  102  	 * virtual addresses of common_startup_64().
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  103  	 */
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  104  	leaq	common_startup_64(%rip), %rdi
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  105  	subq	.Lcommon_startup_64(%rip), %rdi
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  106  
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  107  	/*
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  108  	 * Perform pagetable fixups. Additionally, if SME is active, encrypt
8b4b3620a6b25c arch/x86/kernel/head_64.S Khalid Ali            2025-06-16  109  	 * the kernel.
8b4b3620a6b25c arch/x86/kernel/head_64.S Khalid Ali            2025-06-16  110  	 /
2f69a81ad68732 arch/x86/kernel/head_64.S Ard Biesheuvel        2023-08-07  111  	movq	%r15, %rsi
c88d71508e36b5 arch/x86/kernel/head_64.S Kirill A. Shutemov    2017-06-06  112  	call	__startup_64
^1da177e4c3f41 arch/x86_64/kernel/head.S Linus Torvalds        2005-04-16  113  
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17 @114  	/* Form the CR3 value being sure to include the CR3 modifier */
8b4b3620a6b25c arch/x86/kernel/head_64.S Khalid Ali            2025-06-16  115  	leaq	early_top_pgt(%rip), %rax
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  116) 	
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  117) #ifdef CONFIG_AMD_MEM_ENCRYPT
8b4b3620a6b25c arch/x86/kernel/head_64.S Khalid Ali            2025-06-16  118  	addq	sme_me_mask(%rip), %rax
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  119) 	mov	%rax, %rdi
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  120) 
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  121) 	/*
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  122) 	 * For SEV guests: Verify that the C-bit is correct. A malicious
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  123) 	 * hypervisor could lie about the C-bit position to perform a ROP
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  124) 	 * attack on the guest by writing to the unencrypted stack and wait for
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  125) 	 * the next RET instruction.
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  126) 	 */
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  127) 	call	sev_verify_cbit
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  128) #endif
30579c8baa5b4b arch/x86/kernel/head_64.S Borislav Petkov (AMD  2023-11-30  129) 
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  130  	/*
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  131  	 * Switch to early_top_pgt which still has the identity mappings
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  132  	 * present.
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  133  	 */
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  134  	movq	%rax, %cr3
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  135  
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  136  	/* Branch to the common startup code at its kernel virtual address */
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  137  	ANNOTATE_RETPOLINE_SAFE
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  138  	jmp	*.Lcommon_startup_64(%rip)
37818afd15fe72 arch/x86/kernel/head_64.S Jiri Slaby            2019-10-11  139  SYM_CODE_END(startup_64)
37818afd15fe72 arch/x86/kernel/head_64.S Jiri Slaby            2019-10-11  140  
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  141  	__INITRODATA
093562198e1a63 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-12-05  142  SYM_DATA_LOCAL(.Lcommon_startup_64, .quad common_startup_64)
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  143  
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  144  	.text
bc7b11c04ee9c9 arch/x86/kernel/head_64.S Jiri Slaby            2019-10-11  145  SYM_CODE_START(secondary_startup_64)
fb799447ae2974 arch/x86/kernel/head_64.S Josh Poimboeuf        2023-03-01  146  	UNWIND_HINT_END_OF_STACK
3e3f069504344c arch/x86/kernel/head_64.S Peter Zijlstra        2022-03-08  147  	ANNOTATE_NOENDBR
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  148  	/*
1256276c98dbcf arch/x86/kernel/head_64.S Konrad Rzeszutek Wilk 2013-02-25  149  	 * At this point the CPU runs in 64bit mode CS.L = 1 CS.D = 0,
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  150  	 * and someone has loaded a mapped page table.
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  151  	 *
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  152  	 * We come here either from startup_64 (using physical addresses)
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  153  	 * or from trampoline.S (using virtual addresses).
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  154  	 *
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  155  	 * Using virtual addresses from trampoline.S removes the need
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  156  	 * to have any identity mapped pages in the kernel page table
1ab60e0f72f71e arch/x86_64/kernel/head.S Vivek Goyal           2007-05-02  157  	 * after the boot processor executes this code.
^1da177e4c3f41 arch/x86_64/kernel/head.S Linus Torvalds        2005-04-16  158  	 */
^1da177e4c3f41 arch/x86_64/kernel/head.S Linus Torvalds        2005-04-16  159  
04633df0c43d71 arch/x86/kernel/head_64.S Borislav Petkov       2015-11-05  160  	/* Sanitize CPU configuration */
04633df0c43d71 arch/x86/kernel/head_64.S Borislav Petkov       2015-11-05  161  	call verify_cpu
04633df0c43d71 arch/x86/kernel/head_64.S Borislav Petkov       2015-11-05  162  
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  163  	/*
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  164  	 * The secondary_startup_64_no_verify entry point is only used by
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  165  	 * SEV-ES guests. In those guests the call to verify_cpu() would cause
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  166  	 * #VC exceptions which can not be handled at this stage of secondary
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  167  	 * CPU bringup.
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  168  	 *
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  169  	 * All non SEV-ES systems, especially Intel systems, need to execute
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  170  	 * verify_cpu() above to make sure NX is enabled.
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  171  	 */
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  172  SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
fb799447ae2974 arch/x86/kernel/head_64.S Josh Poimboeuf        2023-03-01  173  	UNWIND_HINT_END_OF_STACK
3e3f069504344c arch/x86/kernel/head_64.S Peter Zijlstra        2022-03-08  174  	ANNOTATE_NOENDBR
3ecacdbd23956a arch/x86/kernel/head_64.S Joerg Roedel          2020-09-07  175  
2f69a81ad68732 arch/x86/kernel/head_64.S Ard Biesheuvel        2023-08-07  176  	/* Clear %R15 which holds the boot_params pointer on the boot CPU */
721f791ce1cddf arch/x86/kernel/head_64.S Uros Bizjak           2024-01-24  177  	xorl	%r15d, %r15d
2f69a81ad68732 arch/x86/kernel/head_64.S Ard Biesheuvel        2023-08-07  178  
d6a41f184dcea0 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  179  	/* Derive the runtime physical address of init_top_pgt[] */
d6a41f184dcea0 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  180  	movq	phys_base(%rip), %rax
d6a41f184dcea0 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  181  	addq	$(init_top_pgt - __START_KERNEL_map), %rax
d6a41f184dcea0 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  182  
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  183  	/*
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  184  	 * Retrieve the modifier (SME encryption mask if SME is active) to be
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  185  	 * added to the initial pgdir entry that will be programmed into CR3.
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  186  	 */
469693d8f62299 arch/x86/kernel/head_64.S Michael Roth          2022-02-09  187  #ifdef CONFIG_AMD_MEM_ENCRYPT
d6a41f184dcea0 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  188  	addq	sme_me_mask(%rip), %rax
469693d8f62299 arch/x86/kernel/head_64.S Michael Roth          2022-02-09  189  #endif
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  190  	/*
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  191  	 * Switch to the init_top_pgt here, away from the trampoline_pgd and
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  192  	 * unmap the identity mapped ranges.
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  193  	 */
828263957611c2 arch/x86/kernel/head_64.S Ard Biesheuvel        2024-02-27  194  	movq	%rax, %cr3
5868f3651fa0df arch/x86/kernel/head_64.S Tom Lendacky          2017-07-17  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
