Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D372E62C6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 04:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743826062; cv=none; b=MNXYkvUptylFq4/IDOqfOZMf+1XfSvQ2LtoMpI+mx3TeXgdU0EbmM6cxTalbz5JhqSmojdBBgtAMRMWP8rxy22HZZDtNF0HIDTZWbsoRO8zzlatj/sDNTxuSZCR1SS+51+s7jxWLOriBVjQWOU3XLekIAiYPReGlKRhQrrs/vtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743826062; c=relaxed/simple;
	bh=KFvz4x3MnaZJYvhZ37Cj68gIWEUQSt35fecbaRx2muY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UnoukyRf+r+hHVmw1hKROVQWNC3Z04WnT/HORsBTjDVrKk7ScYS8J3r3UtqddHvd9pVrLslcGFV6rJJ9HQ9IImnvF3LP2j7Gs0ZYcWSJvJerHQHKXmky3qwGJgoQPW2rzbWD+pe3rPDdfW2U1lEMT4B6NBGgY2s4mxwGsUoP3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2xmgDA6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2xmgDA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743826060; x=1775362060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFvz4x3MnaZJYvhZ37Cj68gIWEUQSt35fecbaRx2muY=;
  b=Y2xmgDA60fjGprHE10Sq6Nec7qFjtmsGgbWfktm6EVBqF9MV5DGH8uRm
   0vim9idu/ci6XqCEsWf0omnhgBmRWq02Cn9/jc8JmmWLlFJ9dO9ohKg0+
   r2S44ZBsr9LM3/uaho0Cc6CQ7O6as0P9G5G4qTCB92XplW22QUHI//wgL
   kVpoxRbsCMmHfsG0iDX01CdQYq4VDBPhSrv6aTYxTbdxLZJbDIHsFfG7B
   vsvM8uyf8gd4Py2NY9Uzy4J0u6AkHtdBcomy75ASb6LGjfm5KtAqE4cAu
   OQ8CYEUB2+1P9WBL1Si1Cs3drCogjGw/h3xP48xtdVPqaYRdraHF0KsC1
   Q==;
X-CSE-ConnectionGUID: C/4N6G4aQGmCnw/kmB7pLw==
X-CSE-MsgGUID: q11YOmXoRK+Z7P/BXDXsZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="70651852"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="70651852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 21:07:40 -0700
X-CSE-ConnectionGUID: eXjWKXX0RiuMLYw8+9MPpw==
X-CSE-MsgGUID: 5ccHpRBOR9eKdmrgAeTFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131620027"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 21:07:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uoi-0001nz-27;
	Sat, 05 Apr 2025 04:07:36 +0000
Date: Sat, 5 Apr 2025 12:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_331' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct erofs_super_block) != 128
Message-ID: <202504051202.DS7QIknJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f867ba24d3665d9ac9d9ef1f51844eb4479b291
commit: 61ba89b57905579b6877f921423596f722983c35 erofs: add 48-bit block addressing on-disk support
date:   3 weeks ago
config: arm-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051202.DS7QIknJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051202.DS7QIknJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051202.DS7QIknJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'erofs_check_ondisk_layout_definitions',
       inlined from 'erofs_module_init' at fs/erofs/super.c:849:2:
>> include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_331' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct erofs_super_block) != 128
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:523:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:542:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   fs/erofs/erofs_fs.h:445:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(sizeof(struct erofs_super_block) != 128);
     ^~~~~~~~~~~~


vim +/__compiletime_assert_331 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
