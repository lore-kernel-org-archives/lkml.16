Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883212264D9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011595; cv=none; b=HXNZTJTsdN/UtVD3F67/9mQhTWVnVN4upZGWT9w5ai7IdUbQu9nHuDl/7EGdOxm1LfGbYdCU94imBcLn30DkllCWyBByBGTzPi/zm+EDySvI9B+Of19GUdfFWyKbhBuydqDEpN/VWS4nY9u1NOM3XKGRPpMFrBXWkrKNu6J/KxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011595; c=relaxed/simple;
	bh=Fd/B71Ay1n6YVW8By1kBNB5aLOrWe2WdwbwtZmI38kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZY922S7Ldlarc4D8fXTQEexIg4D5IHIS10FAfR9zgFD3sC6876tb44/ivS7W8TORhsRMy639ZbnUXsIW5sQEKEn0n9+0hzZMXZezF23g4izV0IdWhBORH1quPWLahWG+Qeeauuxppx5oR1aJ75cMwptKlziEwhSnVCmyQxahxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmjoS7Ei; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmjoS7Ei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751011593; x=1782547593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fd/B71Ay1n6YVW8By1kBNB5aLOrWe2WdwbwtZmI38kA=;
  b=kmjoS7EixVJxgErWRMcpvfU89Lpizw1by5OTLoHc3TM3u9hMDRQaOL1q
   y2tX6i/CbQyndZcVlYWik1kt/fkAw4qsTCuxXuBdpkjd7FWDVHJIoke7V
   VRLOnQRBCHhyY+NcTtySmbuEeVpvelp8BveV+4twTDcpyMc9CXLuxAxuQ
   zskoro4lEmYmTK0+o2bGTlWnjJe+cbTpB9RriPB2lU8kW6nSRh+VhY2fF
   OEzSkNhvGsCjzWThk9NnY6XfZan6OfA+fWNnDs03nuvbkmgUH4zDwaaOQ
   C4nVrZSSrO0saTRqp3yQNzPq6GJt4ML9ys/ZsFfzIzozsE/8Q6isf1hDX
   Q==;
X-CSE-ConnectionGUID: clO4mxJ7RUa0UMG1+vVcCQ==
X-CSE-MsgGUID: MAekqobRSrSQLrqXSEoutA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53467786"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53467786"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:06:33 -0700
X-CSE-ConnectionGUID: F3t9TbshTvixij/xrIJ3mQ==
X-CSE-MsgGUID: uF8MnP8ZQCi2tufOsfTPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="176421304"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 01:06:31 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV46P-0000dX-1F;
	Fri, 27 Jun 2025 08:06:29 +0000
Date: Fri, 27 Jun 2025 10:05:30 +0200
From: kernel test robot <lkp@intel.com>
To: Huang Ying <ying.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: kernel/resource.c:1838:43: warning: implicit conversion from
 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value
 from 68719476735 to 4294967295
Message-ID: <202506271014.vuMnyMSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f2a71a99ebd5dfaa7948a2e9c59eae94b741bd8
commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b resource, kunit: add test case for region_intersects()
date:   9 months ago
config: arm-randconfig-2006-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271014.vuMnyMSa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271014.vuMnyMSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271014.vuMnyMSa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/resource.c:21:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2198:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/resource.c:1838:43: warning: implicit conversion from 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68719476735 to 4294967295 [-Wconstant-conversion]
    1838 |                 end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   kernel/resource.c:1827:52: note: expanded from macro 'MAX_PHYS_ADDR'
    1827 | #define MAX_PHYS_ADDR           ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                                             ^
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                ~~    ^
   kernel/resource.c:1855:45: warning: implicit conversion from 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68719476735 to 4294967295 [-Wconstant-conversion]
    1855 |                 addr <= min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   kernel/resource.c:1827:52: note: expanded from macro 'MAX_PHYS_ADDR'
    1827 | #define MAX_PHYS_ADDR           ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                                             ^
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                ~~    ^
   3 warnings generated.


vim +1838 kernel/resource.c

  1831	
  1832	static resource_size_t gfr_start(struct resource *base, resource_size_t size,
  1833					 resource_size_t align, unsigned long flags)
  1834	{
  1835		if (flags & GFR_DESCENDING) {
  1836			resource_size_t end;
  1837	
> 1838			end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
  1839			return end - size + 1;
  1840		}
  1841	
  1842		return ALIGN(max(base->start, align), align);
  1843	}
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
