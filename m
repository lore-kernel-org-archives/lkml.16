Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0381DDA09
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749419111; cv=none; b=fRFHDMCPhMQjWwY9gXdTZ1vrk3TN0XWJ6WrC/RlbjMn7iQEIwGZ7K/IFvufZdWKaZofPVz/gLKHNlMYQCROPiSrsaLJhj7YXx7DWlUtK4FP9fKxVunhO1DRQNyPvhCWLzsBxSzOV68b1LyIUajdvR1vYRAsko+HQbNYo3MpA1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749419111; c=relaxed/simple;
	bh=GeLqfCISxlJ35ItAVg3veXROlWc+r3oA703qOErV10o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRWJxWAHpblv90F885bBiOCpqY1HIb+QEfA1mvyWLwcIMnt2/VXcVqx23isGBT38+0RsFLp37ZJhvUh5zqrA40UX1+9mDE3sQZobvjH8wEbOUOQuCLlSfrnuMqkvZEV5y+KwKPL1QozWwv+HYjZKgZappi4QSvLzgF6O3Kwq8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVivXgSl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVivXgSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749419110; x=1780955110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GeLqfCISxlJ35ItAVg3veXROlWc+r3oA703qOErV10o=;
  b=YVivXgSlqRCiXBLtssiNsX/Op4jnLrmNA/fgdWp62eivsRw/jRnFatd9
   HYD35IeTuRKGTpaX60TRP4LnDedNGvA4a4Ur9STl+mV43AWHW6Eil8I/v
   47ll4nuK8mkYZ9czphCNTNoShXp1SQFxmimkBQody+3lfwhrEap7IHbWJ
   dxv9yq03oiWtIdA3KQVeMvYWK7lbZsdud73V5hlO+UruWYkKj6dUdEzwj
   Coa5Jvm0buyqPlyKNGQh9qyazIENz42jbFOfXDT2AzuksPSo/kN8yePg8
   Uxd+QZIMRGiXVR1dm21ZsDIFmSUkPtmSIl+s5XO2ibSHgGBDrpyAaQCPq
   A==;
X-CSE-ConnectionGUID: /d/a4L6kQR+6uzU1fZnU2g==
X-CSE-MsgGUID: MaeLjmSoT2+QEYgsfYWMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51355934"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51355934"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 14:45:08 -0700
X-CSE-ConnectionGUID: SciDia4PTMyFaiAXJKGB+g==
X-CSE-MsgGUID: wIB1hRdLQCe/LQAewrz24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="150161632"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2025 14:45:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uONp8-0006ZP-0a;
	Sun, 08 Jun 2025 21:45:02 +0000
Date: Mon, 9 Jun 2025 05:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
	Usama Arif <usamaarif642@gmail.com>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
Message-ID: <202506090525.yM9XIl8O-lkp@intel.com>
References: <20250608192713.95875-1-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608192713.95875-1-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-shmem-swap-fix-softlockup-with-mTHP-swapin/20250609-032924
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250608192713.95875-1-ryncsn%40gmail.com
patch subject: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
config: arm-randconfig-003-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090525.yM9XIl8O-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090525.yM9XIl8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090525.yM9XIl8O-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                          ^
   include/linux/huge_mm.h:108:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     108 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:7:
   include/linux/list.h:37:2: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
      37 |         WRITE_ONCE(list->next, list);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   mm/shmem.c:1904:20: note: previous attribute is here
    1904 |                                 count_vm_event(THP_FILE_FALLBACK);
         |                                                ^
   include/linux/vm_event_item.h:196:30: note: expanded from macro 'THP_FILE_FALLBACK'
     196 | #define THP_FILE_FALLBACK ({ BUILD_BUG(); 0; })
         |                              ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:7:
   include/linux/list.h:37:2: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
      37 |         WRITE_ONCE(list->next, list);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   mm/shmem.c:1905:20: note: previous attribute is here
    1905 |                                 count_vm_event(THP_FILE_FALLBACK_CHARGE);
         |                                                ^
   include/linux/vm_event_item.h:197:37: note: expanded from macro 'THP_FILE_FALLBACK_CHARGE'
     197 | #define THP_FILE_FALLBACK_CHARGE ({ BUILD_BUG(); 0; })
         |                                     ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
>> mm/shmem.c:2003:7: error: call to undeclared function 'non_swapcache_batch'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2003 |                 if (non_swapcache_batch(entry, nr_pages) != nr_pages)
         |                     ^
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:7:
   include/linux/list.h:37:2: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
      37 |         WRITE_ONCE(list->next, list);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   mm/shmem.c:2531:20: note: previous attribute is here
    2531 |                                 count_vm_event(THP_FILE_ALLOC);
         |                                                ^
   include/linux/vm_event_item.h:195:27: note: expanded from macro 'THP_FILE_ALLOC'
     195 | #define THP_FILE_ALLOC ({ BUILD_BUG(); 0; })
         |                           ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:7:
   include/linux/list.h:37:2: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
      37 |         WRITE_ONCE(list->next, list);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   mm/shmem.c:2790:15: note: previous attribute is here
    2790 |         hpage_size = HPAGE_PMD_SIZE;
         |                      ^
   include/linux/huge_mm.h:115:34: note: expanded from macro 'HPAGE_PMD_SIZE'
     115 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^
   include/linux/huge_mm.h:108:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     108 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from mm/shmem.c:24:
   In file included from include/linux/fs.h:7:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:7:
   include/linux/list.h:37:2: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
      37 |         WRITE_ONCE(list->next, list);
         |         ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'


vim +/non_swapcache_batch +2003 mm/shmem.c

  1954	
  1955	static struct folio *shmem_swap_alloc_folio(struct inode *inode,
  1956			struct vm_area_struct *vma, pgoff_t index,
  1957			swp_entry_t entry, int order, gfp_t gfp)
  1958	{
  1959		struct shmem_inode_info *info = SHMEM_I(inode);
  1960		struct folio *new;
  1961		void *shadow;
  1962		int nr_pages;
  1963	
  1964		/*
  1965		 * We have arrived here because our zones are constrained, so don't
  1966		 * limit chance of success with further cpuset and node constraints.
  1967		 */
  1968		gfp &= ~GFP_CONSTRAINT_MASK;
  1969		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && order > 0) {
  1970			gfp_t huge_gfp = vma_thp_gfp_mask(vma);
  1971	
  1972			gfp = limit_gfp_mask(huge_gfp, gfp);
  1973		}
  1974	
  1975		new = shmem_alloc_folio(gfp, order, info, index);
  1976		if (!new)
  1977			return ERR_PTR(-ENOMEM);
  1978	
  1979		nr_pages = folio_nr_pages(new);
  1980		if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
  1981						   gfp, entry)) {
  1982			folio_put(new);
  1983			return ERR_PTR(-ENOMEM);
  1984		}
  1985	
  1986		/*
  1987		 * Prevent parallel swapin from proceeding with the swap cache flag.
  1988		 *
  1989		 * Of course there is another possible concurrent scenario as well,
  1990		 * that is to say, the swap cache flag of a large folio has already
  1991		 * been set by swapcache_prepare(), while another thread may have
  1992		 * already split the large swap entry stored in the shmem mapping.
  1993		 * In this case, shmem_add_to_page_cache() will help identify the
  1994		 * concurrent swapin and return -EEXIST.
  1995		 */
  1996		if (swapcache_prepare(entry, nr_pages)) {
  1997			folio_put(new);
  1998	
  1999			/*
  2000			 * A smaller folio is in the swap cache, mTHP swapin will always fail
  2001			 * until it's gone. Return -EINVAL to fallback to order 0.
  2002			 */
> 2003			if (non_swapcache_batch(entry, nr_pages) != nr_pages)
  2004				return ERR_PTR(-EINVAL);
  2005	
  2006			return ERR_PTR(-EEXIST);
  2007		}
  2008	
  2009		__folio_set_locked(new);
  2010		__folio_set_swapbacked(new);
  2011		new->swap = entry;
  2012	
  2013		memcg1_swapin(entry, nr_pages);
  2014		shadow = get_shadow_from_swap_cache(entry);
  2015		if (shadow)
  2016			workingset_refault(new, shadow);
  2017		folio_add_lru(new);
  2018		swap_read_folio(new, NULL);
  2019		return new;
  2020	}
  2021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
