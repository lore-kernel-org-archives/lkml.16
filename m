Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074C220F32
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751097161; cv=none; b=dwFxUytzlQljoP5xO18ZBA7vl/As1ZMEn4qJAIL7R6CDz+o5VWwQGL/F/apb+4jAp0KDvr2CIHzn0CY198R9fXnBloZ0sEFnhvQ8DNVcYHIGzPxY+TWgH8l1RpXGy6MEkPh59STf+q53Qr/3pXxGtJ/Z8Phb8W2A5bNs9WJwvWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751097161; c=relaxed/simple;
	bh=zw8+XZcRIWHl4Pb7ANDvCfIV/XjuEkN0+TvXI1VOw6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8k/LX6nDm5Ils7j2d2ow+GB1ws6eAWKRBtKVlO/TuKxZ+yQ66c1gx8bcggHghXYzopu4tnJ6KSf7Wybdin1M51SCtPIag0QO0cP3YXl+ivEA+c7C8I0injLzIrkoBb9w9xk2SxsZis8Qexh9WGx9la7TpE8PLmKHrR16VASQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mz1vALNH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mz1vALNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751097158; x=1782633158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zw8+XZcRIWHl4Pb7ANDvCfIV/XjuEkN0+TvXI1VOw6E=;
  b=mz1vALNHWnfTvWMnUWYOQG1RGcxSM4sA4mbyY16p1myoaqVAPrAjYN1F
   XU7yzYKdfQ9EepqjxJxsHPCr5H5C7GaoOGgwBY3gy1CKaID5dezRCsGJf
   89IprmTiWuou++j3/5bScEL0A/pNAdYW2AszLmfzIaW+30Vem3gHv3UKu
   SoZS/qdxuXUwQfWDed05U0R3JAyk+vOgYLKpmXrLkwRJd0j5Ky2nmWKDx
   GEXIPBCilC18FLNZH+I/bUeSULHhEkXOD19bfRF4n9chSd6Vj6weA+hgW
   yStbdNjWjUxYsbm7UuU3MXzLZdwSTFnJSRoBBus44I+jRIcPZNaEgg7EP
   g==;
X-CSE-ConnectionGUID: TK7O+chqRWqSvvWlVrZfqg==
X-CSE-MsgGUID: zcPoH7gZQzCNRsGOj5hkHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57081099"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="57081099"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 00:52:38 -0700
X-CSE-ConnectionGUID: wIItiP6PSA6co7huGb8zmQ==
X-CSE-MsgGUID: SPfVjudESzKsKbdwnJfnrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="153088228"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jun 2025 00:52:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVQMT-000Wuk-1w;
	Sat, 28 Jun 2025 07:52:33 +0000
Date: Sat, 28 Jun 2025 15:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: zhongjinji@honor.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	yuzhao@google.com, linux-kernel@vger.kernel.org,
	yipengxiang@honor.com, liulu.liu@honor.com, feng.han@honor.com
Subject: Re: [PATCH] mm: vmscan: Page scanning depends on swappiness and
 refault
Message-ID: <202506281559.f6IHM6uJ-lkp@intel.com>
References: <20250627162606.30609-1-zhongjinji@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627162606.30609-1-zhongjinji@honor.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc3]
[cannot apply to akpm-mm/mm-everything next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhongjinji-honor-com/mm-vmscan-Page-scanning-depends-on-swappiness-and-refault/20250628-002820
base:   linus/master
patch link:    https://lore.kernel.org/r/20250627162606.30609-1-zhongjinji%40honor.com
patch subject: [PATCH] mm: vmscan: Page scanning depends on swappiness and refault
config: x86_64-buildonly-randconfig-003-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281559.f6IHM6uJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281559.f6IHM6uJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281559.f6IHM6uJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4100:20: note: in expansion of macro 'READ_ONCE'
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                    ^~~~~~~~~
   mm/vmscan.c:4100:40: error: expected identifier before '.' token
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                                        ^
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4100:20: note: in expansion of macro 'READ_ONCE'
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                    ^~~~~~~~~
   mm/vmscan.c:4100:40: error: expected identifier before '.' token
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                                        ^
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4100:20: note: in expansion of macro 'READ_ONCE'
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                    ^~~~~~~~~
   mm/vmscan.c:4100:40: error: expected identifier before '.' token
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                                        ^
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4100:20: note: in expansion of macro 'READ_ONCE'
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                    ^~~~~~~~~
   mm/vmscan.c:4100:40: error: expected identifier before '.' token
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                                        ^
   include/linux/compiler_types.h:518:27: note: in definition of macro '__unqual_scalar_typeof'
     518 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/vmscan.c:4100:20: note: in expansion of macro 'READ_ONCE'
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                    ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/vmscan.c:15:
   mm/vmscan.c:4100:40: error: expected identifier before '.' token
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                                        ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/vmscan.c:4100:20: note: in expansion of macro 'READ_ONCE'
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                    ^~~~~~~~~
>> mm/vmscan.c:4097:34: warning: variable 'mm_state' set but not used [-Wunused-but-set-variable]
    4097 |         struct lru_gen_mm_state *mm_state = get_mm_state(lruvec, type);
         |                                  ^~~~~~~~
   mm/vmscan.c: In function 'try_to_inc_max_seq':
   mm/vmscan.c:4154:17: error: implicit declaration of function 'for_each_age_able_type'; did you mean 'for_each_evictable_type'? [-Werror=implicit-function-declaration]
    4154 |                 for_each_age_able_type(type, can_age) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_evictable_type
   mm/vmscan.c:4154:54: error: expected ';' before '{' token
    4154 |                 for_each_age_able_type(type, can_age) {
         |                                                      ^~
         |                                                      ;
   mm/vmscan.c: At top level:
>> mm/vmscan.c:3876:13: warning: 'walk_mm' defined but not used [-Wunused-function]
    3876 | static void walk_mm(struct mm_struct *mm, struct lru_gen_mm_walk *walk)
         |             ^~~~~~~
>> mm/vmscan.c:3103:13: warning: 'iterate_mm_list' defined but not used [-Wunused-function]
    3103 | static bool iterate_mm_list(struct lru_gen_mm_walk *walk, struct mm_struct **iter, int type)
         |             ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mm_state +4097 mm/vmscan.c

  4093	
  4094	static bool can_mm_list_age(struct lruvec *lruvec, struct lru_gen_mm_walk *walk,
  4095			  int type, unsigned long seq)
  4096	{
> 4097		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec, type);
  4098	
  4099		/* see the comment in iterate_mm_list() */
> 4100		if (seq <= READ_ONCE(mm_state->.seq))
  4101			return false;
  4102	
  4103		/*
  4104		 * If the hardware doesn't automatically set the accessed bit, fallback
  4105		 * to lru_gen_look_around(), which only clears the accessed bit in a
  4106		 * handful of PTEs. Spreading the work out over a period of time usually
  4107		 * is less efficient, but it avoids bursty page faults.
  4108		 */
  4109		if (!should_walk_mmu()) {
  4110			return iterate_mm_list_nowalk(lruvec, type, seq);
  4111		}
  4112	
  4113		walk = set_mm_walk(NULL, true);
  4114		if (!walk) {
  4115			return iterate_mm_list_nowalk(lruvec, type, seq);
  4116		}
  4117	
  4118		return true;
  4119	}
  4120	
  4121	static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long *seq,
  4122				       bool *can_age, bool force_scan)
  4123	{
  4124		int type;
  4125		bool success;
  4126		struct lru_gen_mm_walk *walk = NULL;
  4127		struct mm_struct *mm = NULL;
  4128		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  4129	
  4130		if (!walk_mmu_enable())
  4131			return inc_max_seq(lruvec, seq, can_age);
  4132	
  4133		for_each_gen_type(type) {
  4134			if (!can_age[type])
  4135				continue;
  4136			VM_WARN_ON_ONCE(seq[type] > READ_ONCE(lrugen->max_seq[type]));
  4137	
  4138			can_age[type] = can_mm_list_age(lruvec, walk, type, seq[type]);
  4139		}
  4140	
  4141		success = can_age[LRU_GEN_ANON] || can_age[LRU_GEN_FILE];
  4142		if (!success || !walk)
  4143			goto done;
  4144	
  4145		walk->lruvec = lruvec;
  4146		walk->force_scan = force_scan;
  4147	
  4148		for_each_gen_type(type) {
  4149			walk->seq[type] = seq[type];
  4150			walk->can_age[type] = can_age[type];
  4151		}
  4152	
  4153		do {
> 4154			for_each_age_able_type(type, can_age) {
  4155				can_age[type] = iterate_mm_list(walk, &mm, type);
  4156			}
  4157			if (mm)
  4158				walk_mm(mm, walk);
  4159		} while (mm);
  4160	
  4161		success = can_age[LRU_GEN_ANON] || can_age[LRU_GEN_FILE];
  4162	done:
  4163		if (success) {
  4164			success = inc_max_seq(lruvec, seq, can_age);
  4165			WARN_ON_ONCE(!success);
  4166		}
  4167	
  4168		return success;
  4169	}
  4170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
