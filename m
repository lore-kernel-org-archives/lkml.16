Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D94D288A5
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738475524; cv=none; b=X7wYZ3uHmUlZ9LZ5g3PaHa9QTNo5Ykgc0edWF7XuNPI13GNsqS4h6Un8LMtwKq23p16KQVnGDqjdpCPLkk512074BIJfmC+gxwhHeuvaYvm2W9mx56KrQTuZbwIFIXWQlY3Wa+ADkEmVgnkVlRC4pPxAnO9hDNgx8Fvb3TMqMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738475524; c=relaxed/simple;
	bh=JO3KoUH0tdkxbCcvEr4lgBrUzlL/jC9QKCBqOsH+7ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfRin5pNsFf7zN7ADjEwHwd4T4z/ZSqyH8Cgmsu4y7zyzhuHrzNGD7ylPqjqcbFq8ZjrtHiuxOmej1fa8+lecG5Pu/WSKGsQEfThQE2BRk6qIxlJU5L+cUx4Vs1bBVwn2WWDHADaYSOO9Yk4ibEaQk5/ff8/Sse7tBk2/kjH9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnGbHuEr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnGbHuEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738475522; x=1770011522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JO3KoUH0tdkxbCcvEr4lgBrUzlL/jC9QKCBqOsH+7ng=;
  b=HnGbHuErqbLd5aAOB053Hzcp3u8lRnmk/smvtxJXlLIGg3oEn3h5NYO1
   tN+SXydLUx4LYmqv8JZSWyxB4r7CyvNTM7qcV5RTtl/H9rhzq4CvicdCd
   otPmj/K27C+GOVsLUUcFppZc9YzR81higRiRfQLs6JYd9EurJ8Q/NSkqJ
   MVTbH6osLTtIUr0XIP1dHl6mCcGKgCimLJ7Fn1soX4vnu4C0kWG2yiblr
   jWKUF56iGZ723+Q/h9dzmmpLaQocrRiQO1Mve+hfhCazm2jwyHTPBGwlC
   smzbO67i2CWX5xnUHzktY3sQ3PZw4iCsSf8TTwnXqx+vYLSw0qJYt8NiP
   A==;
X-CSE-ConnectionGUID: nezhduD4SlqHI6fbmUetow==
X-CSE-MsgGUID: 3Xq4yDYvT/u1VuEZw1DHHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="56536392"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="56536392"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 21:52:01 -0800
X-CSE-ConnectionGUID: VUaB7M84Qb2CXdCvCczLcQ==
X-CSE-MsgGUID: tzZCzXbsSRepr2W9ojT2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114974077"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2025 21:52:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teSth-000pJZ-2d;
	Sun, 02 Feb 2025 05:51:57 +0000
Date: Sun, 2 Feb 2025 13:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_413' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Message-ID: <202502021352.Sidg3EVM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a86bf2283d2c9769205407e2b54777c03d012939
commit: a5743f32baec4728711bbc01d6ac2b33d4c67040 minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
date:   8 days ago
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250202/202502021352.Sidg3EVM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502021352.Sidg3EVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502021352.Sidg3EVM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_413' declared with attribute error: clamp() low limit source_min greater than high limit source_max
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:109:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     109 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:116:9: note: in expansion of macro '__clamp_once'
     116 |         __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^~~~~~~~~~~~
   include/linux/minmax.h:192:28: note: in expansion of macro '__careful_clamp'
     192 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_backlight.c:47:22: note: in expansion of macro 'clamp'
      47 |         source_val = clamp(source_val, source_min, source_max);
         |                      ^~~~~


vim +/__compiletime_assert_413 +542 include/linux/compiler_types.h

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
