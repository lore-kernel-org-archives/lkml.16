Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AB326B95A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114227; cv=none; b=uQhZ6SCzo1MYyBa/a0PirBKL0q9lUJwg+rhkGTl/l980z0xqY15NM6vfF5cXAxOHwd87OWqiarSddXJujvzSga2FR9egelQ55UWlcFFBzdnMf7PCmiNaYMuex6DfBSmWJxlgLCIe1DXWNket3fbdqm0rkUV/SRXhSKoAFrEyYPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114227; c=relaxed/simple;
	bh=krbcNElve3LzrK+Yl40631lbQWKkm890pYqgBHWDaqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laxo/7NNbKhKFLqIoh8mbbgjBxQnWF7C2lm4uss7EKF1Jem9BSjdlyefonuqJho5sMZipOxZfOr0smSCTpLmziZ0p9KNGeINuFgUTFkIpY+6pwLZvEv5cDbADtDc5N0Ao289212zLgsBsJr0T22ya3091sJKqe0RF0HDsy1R5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yr/RvF04; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yr/RvF04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744114224; x=1775650224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krbcNElve3LzrK+Yl40631lbQWKkm890pYqgBHWDaqY=;
  b=Yr/RvF04rXYSDOCYjTgTtjDkqu+04rut+TBvsMhq0qf37jXwGFYrLkgf
   qKN7OgIVzACUAqKp9p1f9UIdINfwBdq5hrAUjNza8G7c6Va+dr6iav9GK
   q5pceCR6ocC6SHeeKaLRE20aaHT0XxObTjg+blpLBrY8mXfTzq5SN6NE7
   etDslFAcil50Y5bdKiK+7yp1O0VRRy+6a0nqBfF9Jl1JwERmT7fgMwKd2
   WHTei5pvZ09FYNk65OhxQsp5vqvc90PqMxb9hUi5uV3U1o1nqKDBaIkqI
   6j9N6p4RooORgr4sP9Ibjs/TM/blFwz/5+P723NZaYyG974nN1dxlr3Ci
   A==;
X-CSE-ConnectionGUID: JAtnK70eTvCgB1RbmNV3tA==
X-CSE-MsgGUID: 18ng6T0hRZyXGsQuzl75Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45429346"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45429346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:10:23 -0700
X-CSE-ConnectionGUID: KiZSUac6TXmSXmXIdS/ZzQ==
X-CSE-MsgGUID: k7y/hZA6R3iGRaiVv5Vk2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128235584"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Apr 2025 05:10:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u27mV-00063O-2r;
	Tue, 08 Apr 2025 12:10:19 +0000
Date: Tue, 8 Apr 2025 20:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/syscalls.c:979:8: error: unexpected token, expected
 comma
Message-ID: <202504082254.7GLSWAbI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
date:   11 months ago
config: mips-randconfig-r064-20250408 (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504082254.7GLSWAbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504082254.7GLSWAbI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_policy.c:55:
>> kernel/sched/syscalls.c:979:8: error: unexpected token, expected comma
     979 |         ret = get_user(size, &uattr->size);
         |               ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   In file included from kernel/sched/build_policy.c:55:
   kernel/sched/syscalls.c:979:8: error: instruction requires a CPU feature not currently enabled
     979 |         ret = get_user(size, &uattr->size);
         |               ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         lwe $2, 0($16)
         |         ^
   In file included from kernel/sched/build_policy.c:55:
   kernel/sched/syscalls.c:1009:2: error: unexpected token, expected comma
    1009 |         put_user(sizeof(*attr), &uattr->size);
         |         ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   In file included from kernel/sched/build_policy.c:55:
   kernel/sched/syscalls.c:1009:2: error: instruction requires a CPU feature not currently enabled
    1009 |         put_user(sizeof(*attr), &uattr->size);
         |         ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         swe $3, 0($16)
         |         ^
   1 warning and 4 errors generated.


vim +979 kernel/sched/syscalls.c

   967	
   968	/*
   969	 * Mimics kernel/events/core.c perf_copy_attr().
   970	 */
   971	static int sched_copy_attr(struct sched_attr __user *uattr, struct sched_attr *attr)
   972	{
   973		u32 size;
   974		int ret;
   975	
   976		/* Zero the full structure, so that a short copy will be nice: */
   977		memset(attr, 0, sizeof(*attr));
   978	
 > 979		ret = get_user(size, &uattr->size);
   980		if (ret)
   981			return ret;
   982	
   983		/* ABI compatibility quirk: */
   984		if (!size)
   985			size = SCHED_ATTR_SIZE_VER0;
   986		if (size < SCHED_ATTR_SIZE_VER0 || size > PAGE_SIZE)
   987			goto err_size;
   988	
   989		ret = copy_struct_from_user(attr, sizeof(*attr), uattr, size);
   990		if (ret) {
   991			if (ret == -E2BIG)
   992				goto err_size;
   993			return ret;
   994		}
   995	
   996		if ((attr->sched_flags & SCHED_FLAG_UTIL_CLAMP) &&
   997		    size < SCHED_ATTR_SIZE_VER1)
   998			return -EINVAL;
   999	
  1000		/*
  1001		 * XXX: Do we want to be lenient like existing syscalls; or do we want
  1002		 * to be strict and return an error on out-of-bounds values?
  1003		 */
  1004		attr->sched_nice = clamp(attr->sched_nice, MIN_NICE, MAX_NICE);
  1005	
  1006		return 0;
  1007	
  1008	err_size:
  1009		put_user(sizeof(*attr), &uattr->size);
  1010		return -E2BIG;
  1011	}
  1012	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
