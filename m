Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C32E401
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991376; cv=none; b=Zb7yj0rLXmRg4gismkjk1fFkOMgCMDvX1W37zZRSpMMe9zWdOCBlP2QICJD/w8nJzCew897AalAB9bZaixLzd/L9c7Xt6ApscxFraGccjU7QefSzNKs9TTE+Ud2MY9b/q3I6p3LvNiQcWVtbDW0fJQ17nZ2a3ULfT3qujiFETwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991376; c=relaxed/simple;
	bh=qkNRqzaLetnXbthDZ+02HWpZDM7Dejcb6Ifv+OyI2gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO0TiQwzEq8qHGKu6ufFOumapQ7TdsyMIXHDPqtt0rQISGMhZQtAVJP8rDFEw95M2CmcgorozbuswspUpSsSiy8ELmOeVXRXbgh6ah0GQJerOGHO1l6Wm1uvUAOxIwtf/nTRCRTin3z16hy6O51sabh7WHGXznpTcb/TvWvgijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlEAl+3Z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlEAl+3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745991375; x=1777527375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkNRqzaLetnXbthDZ+02HWpZDM7Dejcb6Ifv+OyI2gI=;
  b=LlEAl+3ZEZB8QhjCTwKz/QCbSJ/LwcweMPjOzTA1QlG89KlkSrbpprmG
   6kx/GFkGgUZVq4jUh/nXOIc2U8B1wEHlDKJf1nl0zXADh2u8JzsQzwpGb
   PkIM5kknRvXMPSQQgVgx6b8UPm8U9Od0kQf0W7+qfjxIjQ5kAZOnZ28bY
   eXYNyNKyLOIRJMTPuPVl8Sl9X3AS0pPuEAjjS/yME0Ev4twIIwJfZzL2f
   5ksJP5J24lAsI2sBInEqCGHcBt4u+8HjmB9TU57z4Ngtyy8M/Z74LVqrw
   RyqXJePKOAE0rKGaIl65zWPNqe6k8ijElViAIovWgt5Lb9yjM8iL0SfPT
   Q==;
X-CSE-ConnectionGUID: oDdEOSHYTWq+KUT6zOMj1g==
X-CSE-MsgGUID: C2T8bSmcS224szWOP1zrPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73022535"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="73022535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:36:14 -0700
X-CSE-ConnectionGUID: Tm8+kCPLQKmrtyrTulHBOQ==
X-CSE-MsgGUID: rpoIVj1rTmaU9sTCPIEO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133929533"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 22:36:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA072-0003Bh-0e;
	Wed, 30 Apr 2025 05:36:04 +0000
Date: Wed, 30 Apr 2025 13:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, ryan.roberts@arm.com, david@redhat.com,
	willy@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	will@kernel.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
	ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
	ziy@nvidia.com, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <202504301319.aph2eccP-lkp@intel.com>
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
config: arm-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301319.aph2eccP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301319.aph2eccP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301319.aph2eccP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/pgtable.h: In function 'modify_prot_start_ptes':
   include/linux/pgtable.h:901:8: error: implicit declaration of function 'ptep_modify_prot_start' [-Werror=implicit-function-declaration]
     901 |  pte = ptep_modify_prot_start(vma, addr, ptep);
         |        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'modify_prot_commit_ptes':
   include/linux/pgtable.h:921:3: error: implicit declaration of function 'ptep_modify_prot_commit' [-Werror=implicit-function-declaration]
     921 |   ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:1356:21: error: conflicting types for 'ptep_modify_prot_start'
    1356 | static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:901:8: note: previous implicit declaration of 'ptep_modify_prot_start' was here
     901 |  pte = ptep_modify_prot_start(vma, addr, ptep);
         |        ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pgtable.h:1367:20: warning: conflicting types for 'ptep_modify_prot_commit'
    1367 | static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1367:20: error: static declaration of 'ptep_modify_prot_commit' follows non-static declaration
   include/linux/pgtable.h:921:3: note: previous implicit declaration of 'ptep_modify_prot_commit' was here
     921 |   ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |   ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:98: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=2044487564
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=2044487564
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2044487564
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2044487564
   make: Target 'prepare' not remade because of errors.


vim +/ptep_modify_prot_start +1356 include/linux/pgtable.h

1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1340  
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1341  #ifndef __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1342  /*
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1343   * Start a pte protection read-modify-write transaction, which
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1344   * protects against asynchronous hardware modifications to the pte.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1345   * The intention is not to prevent the hardware from making pte
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1346   * updates, but to prevent any updates it may make from being lost.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1347   *
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1348   * This does not protect against other software modifications of the
2eb70aab25dd9b include/linux/pgtable.h       Bhaskar Chowdhury   2021-05-06  1349   * pte; the appropriate pte lock must be held over the transaction.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1350   *
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1351   * Note that this interface is intended to be batchable, meaning that
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1352   * ptep_modify_prot_commit may not actually update the pte, but merely
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1353   * queue the update to be done at some later time.  The update must be
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1354   * actually committed before the pte lock is released, however.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1355   */
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05 @1356  static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1357  					   unsigned long addr,
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1358  					   pte_t *ptep)
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1359  {
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05  1360  	return __ptep_modify_prot_start(vma, addr, ptep);
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1361  }
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1362  
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1363  /*
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1364   * Commit an update to a pte, leaving any hardware-controlled bits in
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1365   * the PTE unmodified.
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1366   */
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05 @1367  static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1368  					   unsigned long addr,
04a8645304500b include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05  1369  					   pte_t *ptep, pte_t old_pte, pte_t pte)
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1370  {
0cbe3e26abe0cf include/asm-generic/pgtable.h Aneesh Kumar K.V    2019-03-05  1371  	__ptep_modify_prot_commit(vma, addr, ptep, pte);
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1372  }
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1373  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
fe1a6875fcaaac include/asm-generic/pgtable.h Sebastian Siewior   2008-07-15  1374  #endif /* CONFIG_MMU */
1ea0704e0da65b include/asm-generic/pgtable.h Jeremy Fitzhardinge 2008-06-16  1375  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
