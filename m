Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CCC2AE7F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991979; cv=none; b=NWirk5POcySs6MQt+78leOkwdVCaUreAXKxlTOJPtBwjVlodgozUCnA8O9+XynVbOSPCEEXPxH7CMImRlpPYgmNTyfHI2n4KEkFqsbDfho0GksfrudJBzd5Yz/OfYlFlKAnX3wG98f3roRdERN/wmZ1HyZjmC3XvTwGA+ap9OBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991979; c=relaxed/simple;
	bh=B59v+IvNsmnaorjIyh3dZ9NgCQZ2KF+vHvFz0KbpMgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHEzrqGU8J++nmsmYaRZFC9FLHJ0Fad57Mj1MBfClDWlRWIov2pKuFloMx6IpY+IQGf2qdhkmYveof871tendHdXi2GWoZ/DDyB0rW7A9IiC9L6nNDXVRqUXJHafHpumJYJ6yH3jKZLjQ9gJetAPzeMedAxVP/RCveyhMt9lwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIgywVq9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIgywVq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745991978; x=1777527978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B59v+IvNsmnaorjIyh3dZ9NgCQZ2KF+vHvFz0KbpMgE=;
  b=YIgywVq94qrVe6X0dgujg2+LSESd71TveclOCer6GEtroHNFXWsTLBJ3
   yjrf85T8ia5FUgzVIV84a2Ebb9OzKcB5ugVI5vZd+KizfPNBYQshE6Njw
   LHTOeZxiu3PAOisssqqAqqlUbh2OmX3lyK3SiIlF3cm7G/rV+ZdQSBnzv
   vgaYdUY2qvLxqeAhnDH4MVJsoUh1Q5UUBCXq+0iafqU0rArAv4ghMf/MD
   Usv2FrS1mBk68bZgb9KHxTpgPt7fY5itxRdOjJPXI6+8CPCkyA7VqWc3N
   P/zuXv2IRtL88gVJ45jEX8D168zEHfFhLiWVKpYOjkAXVuvmIuZtoxF/V
   g==;
X-CSE-ConnectionGUID: kSwx0hysR3edSqQqTPi78w==
X-CSE-MsgGUID: jYKNaqKiQ2OH7pMXWbJ72g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73023717"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="73023717"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:46:16 -0700
X-CSE-ConnectionGUID: mv+A/y/RQrCyY35Lon7BEA==
X-CSE-MsgGUID: e4thOnXNQpWq2L2samo24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133931527"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 22:46:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA0Gj-0003CH-0W;
	Wed, 30 Apr 2025 05:46:05 +0000
Date: Wed, 30 Apr 2025 13:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
	ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
	ziy@nvidia.com, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <202504301328.ltLGuTxD-lkp@intel.com>
References: <20250429052336.18912-4-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-4-dev.jain@arm.com>

Hi Dev,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Refactor-code-in-mprotect/20250429-133151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250429052336.18912-4-dev.jain%40arm.com
patch subject: [PATCH v2 3/7] mm: Add batched versions of ptep_modify_prot_start/commit
config: arm-randconfig-003-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301328.ltLGuTxD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301328.ltLGuTxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301328.ltLGuTxD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:31:
>> include/linux/pgtable.h:901:8: error: call to undeclared function 'ptep_modify_prot_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     901 |         pte = ptep_modify_prot_start(vma, addr, ptep);
         |               ^
>> include/linux/pgtable.h:921:3: error: call to undeclared function 'ptep_modify_prot_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     921 |                 ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |                 ^
>> include/linux/pgtable.h:1356:21: error: static declaration of 'ptep_modify_prot_start' follows non-static declaration
    1356 | static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
         |                     ^
   include/linux/pgtable.h:901:8: note: previous implicit declaration is here
     901 |         pte = ptep_modify_prot_start(vma, addr, ptep);
         |               ^
   include/linux/pgtable.h:1367:20: error: static declaration of 'ptep_modify_prot_commit' follows non-static declaration
    1367 | static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
         |                    ^
   include/linux/pgtable.h:921:3: note: previous implicit declaration is here
     921 |                 ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |                 ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:


vim +/ptep_modify_prot_start +901 include/linux/pgtable.h

   893	
   894	/* See the comment for ptep_modify_prot_start */
   895	#ifndef modify_prot_start_ptes
   896	static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
   897			unsigned long addr, pte_t *ptep, unsigned int nr)
   898	{
   899		pte_t pte, tmp_pte;
   900	
 > 901		pte = ptep_modify_prot_start(vma, addr, ptep);
   902		while (--nr) {
   903			ptep++;
   904			addr += PAGE_SIZE;
   905			tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
   906			if (pte_dirty(tmp_pte))
   907				pte = pte_mkdirty(pte);
   908			if (pte_young(tmp_pte))
   909				pte = pte_mkyoung(pte);
   910		}
   911		return pte;
   912	}
   913	#endif
   914	
   915	/* See the comment for ptep_modify_prot_commit */
   916	#ifndef modify_prot_commit_ptes
   917	static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
   918			pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
   919	{
   920		for (;;) {
 > 921			ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
   922			if (--nr == 0)
   923				break;
   924			ptep++;
   925			addr += PAGE_SIZE;
   926			old_pte = pte_next_pfn(old_pte);
   927			pte = pte_next_pfn(pte);
   928		}
   929	}
   930	#endif
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
