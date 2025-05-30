Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C9219A6B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595051; cv=none; b=ppK5eepM/Pmylk7DR/A/FD3uANA7p+iRGck5gmO3pPelz5a79oJih/L0YVtyr3gng8ntbIClJfT1XXKb+aEIyrDfAGP25z9yHcZiFZ3o2zSJuiO0TdCoKsAt2EalS9XGzhZcMpvrkmpNOMB99nCBbM3A0UHNUjSQzvZUt56SMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595051; c=relaxed/simple;
	bh=VYBwXeuVPw8aB9t9e43QtCFwc/yGv5YEZT/pxnp07Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9TuhX9Wh5ha8aSUKunMOcY5c6HKVrVWFA14ku8mDG5KiSuVj+meRBthwlPZgwNMa2wfrImwjpKwaXmaeorwrIT/+vkgyEmE/xVJyX32wF5j+htNMPFF445C/fZgVHjRayfkFQ/6b4ZtK14+O7vmnyPFu7tyTyy9qJ/wQEKx/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1xJJHJY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1xJJHJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748595050; x=1780131050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYBwXeuVPw8aB9t9e43QtCFwc/yGv5YEZT/pxnp07Jw=;
  b=Q1xJJHJYvtTSwZyzzB+xP+LtWVHmfyxsgnX4PStPaRAWMWcIkiPoQLuF
   DUeLoKFyw9Rx/5LcNdi2w9yxL+lK9EH40ke3C76theDW6bQjt8EuNONaJ
   jLzhAfljA32p0yjeEhN2rTYfs4OCuJo2Ilox4V/mRdYbf7ZQv4/53jxyf
   RxGKomAxHRvbrVXkQpcuLxnRJxU8DWCy+3PkYgPn+OTjEWV3117klVasg
   x1HKZV8oJ7zg9qbbQ1wtzTp5fhr/JdsRHb/vO3RYQYUhLbdTVhBw2l4+2
   1FQE0kJxUh6XwVvem6V56FJ96O2suVHpDSnHi/Gw2QINahkbpK3Cv7rkh
   Q==;
X-CSE-ConnectionGUID: 2/d3bNdIQEGyMP82KaWaSA==
X-CSE-MsgGUID: QkttEe+PSa2+sNFshL4wXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54475670"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="54475670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:50:49 -0700
X-CSE-ConnectionGUID: 7zpkjX6tQhimcGbwYW22Dw==
X-CSE-MsgGUID: r4BO/+T9S42/VjQeGT8p3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="149089613"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2025 01:50:48 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKvRt-0000rS-2k;
	Fri, 30 May 2025 08:50:45 +0000
Date: Fri, 30 May 2025 16:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: include/linux/build_bug.h:78:41: error: static assertion failed:
 "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
Message-ID: <202505301636.6Ud1Yddh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66bc387efbee59978e076ce9bf123ac353b389c
commit: 13877bc79d81354c53e91f3c86ac0f7bafe3ba7b xfs: port ondisk structure checks from xfs/122 to the kernel
date:   7 months ago
config: arm-randconfig-2002-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301636.6Ud1Yddh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301636.6Ud1Yddh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301636.6Ud1Yddh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitfield.h:10:0,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:390,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:2: note: in expansion of macro 'static_assert'
     static_assert(sizeof(structname) == (size), \
     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:133:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_entry,  3);
     ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_dir2_data_unused) is wrong, expected 6"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:2: note: in expansion of macro 'static_assert'
     static_assert(sizeof(structname) == (size), \
     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:136:2: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_unused, 6);
     ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
