Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B11F2BA7
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739055017; cv=none; b=Ux0BTe874ErSgVyAjB+SyifaqafUF6hEqC/J/IhDBb4ewYo2CSGlRA0nOKQF9MhwS2bWVBuJ9SR6XgJ3SFG2PCGqkvG8Qzqxckf8l7k3kIOR5+8TxfJYdgg86eXVvP1YsJWBznMhS5LMdd4DdDRj8ov+JJVQeQS+n2hFK2x2U5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739055017; c=relaxed/simple;
	bh=xU1SakhLV7wglhc6dhdh7/EHB5Wum8HoNp1yUN24eSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abjItaVwDcxFiaU9gQnhqXEfjXolBdcRTQbNycPW5fRQLq3P77PEvHNFn6u+ofIrk0O3uHzeFqO3Go0ttYHGGSH8k4XyrdC1sTI1S5424lILspNRgy5K5atO+bHqtHbeir+/0KFjAm5OR3xKbauB3Ie7USwhjyh2y20tIBbfjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zd0STTsD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zd0STTsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739055016; x=1770591016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xU1SakhLV7wglhc6dhdh7/EHB5Wum8HoNp1yUN24eSg=;
  b=Zd0STTsD2Mzcs2KC60U8k27fQCKCQLxKDsiK2v+8x+FJ17ZTWDa3+Qxh
   KZTD8xiinh75UYxJJfJvmsLwNn1gnUEGqHMy2HjZkMa4vOvu1pykRb21s
   D//Z2gN3318LSX4L9u+BsfVrAy7VNpR+DHAn/8NF8kdWEEu+tT0goJa9k
   LdHaeuTA0LNSX8XBEJGRbsjIjJ9EI9kRfhMbt0/Kg9ZBSnAYt+MPVnuAc
   2KFKbS5Sci/sitJo/G0F6QK99Bga7b8D9ckSzWrAmKXgNZgCVNaJNJhqa
   hRIpVxI4DQ8xeFGuTWmETmgzZ4cQ0HQGWFGcuwuyrkPGM1RfkZntegPKc
   g==;
X-CSE-ConnectionGUID: KI9dhkdITpKgjgLwT3SkUQ==
X-CSE-MsgGUID: 0+pK3RlvRJi4PTOLgX3loQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50653189"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="50653189"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 14:50:16 -0800
X-CSE-ConnectionGUID: UAt+lhRiSti1m7HaARduMQ==
X-CSE-MsgGUID: sI9jgae/QmWQ835wRMwIUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="142709317"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 14:50:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgteN-0010k1-1M;
	Sat, 08 Feb 2025 22:50:11 +0000
Date: Sun, 9 Feb 2025 06:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: include/linux/build_bug.h:78:41: error: static assertion failed:
 "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
Message-ID: <202502090624.WfIB0TP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6629c004b193d23612641c3607e785819e97ab
commit: 13877bc79d81354c53e91f3c86ac0f7bafe3ba7b xfs: port ondisk structure checks from xfs/122 to the kernel
date:   3 months ago
config: arm-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090624.WfIB0TP5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090624.WfIB0TP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090624.WfIB0TP5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitfield.h:10,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:390,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_super.c:7:
   fs/xfs/libxfs/xfs_ondisk.h: In function 'xfs_check_ondisk_structs':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_attr_sf_entry) is wrong, expected 3"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:133:9: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     133 |         XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_entry,         3);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "XFS: sizeof(struct xfs_dir2_data_unused) is wrong, expected 6"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:136:9: note: in expansion of macro 'XFS_CHECK_STRUCT_SIZE'
     136 |         XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_unused,      6);
         |         ^~~~~~~~~~~~~~~~~~~~~


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
