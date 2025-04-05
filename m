Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F32C9D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 01:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743816690; cv=none; b=eGxQe4dS3TkjuiV+eapmr2hx49BbtMykUDAOQTz+KGp7e0fU6pg5imzUdCDhYnD534RqFzvqE1cT3rZOVI7h9IncwaUVcHYtyqrBdCxXu+UFRFxSKvdP0qdvvOqsb5L1rS2DV8eJzHOodo6eHkZElyMg+B1D3xmBgGv1daUVrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743816690; c=relaxed/simple;
	bh=6YuxP86QElVc/IotRs1nJatt8CYhXJyPpzx+X+1oofE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7geumNC2pshTP0WfmPHsq7vzALNUBnv9FOj9y9kKs6MK8AOLdnaq/CbznWi0foztw5KWo+/2mVEn5pcGMXjOd3taJbltn3uomCZiTPkUHQaFqCydWCJA42TMD9PAnlFlclPh4gqK7s9N9Vvbvc1rBMZggszT6intR6evzLO8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLbtFUt/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLbtFUt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743816688; x=1775352688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YuxP86QElVc/IotRs1nJatt8CYhXJyPpzx+X+1oofE=;
  b=KLbtFUt/ylKX0P3fOunWypS0uNSm7OtQ7RQBCb7NONy5CiPmWW0qOp+y
   sYsB7yWFzezPgH4T12bgB5tNWNrmSRUSP1n6RXl8uplFP4hQtnOqY0FbD
   a3FhsA/9EAJI0Io9SdSSoGGTrCqfZjRcNUSSDhkQJddfnx+GD2cd3vpPt
   mguj3Bk9E3tyy5sJtHfv4v8gSJPxg3x6+6Qnp/WDXohNK2T1cd6en7WnD
   mIbITN+uGhgd1ty2iLIywucGO/+Fic1zau+huCpjHvW1eH0c+eb2gsZnj
   oN8AZY63+30Y4t8ip4BVP3Bmzi1bQfGKd3yoQgYd1dCjwELoW03rfRtre
   g==;
X-CSE-ConnectionGUID: YCtNSghmQp2SXQQrFzHuOg==
X-CSE-MsgGUID: ZKC1jjGpR2uO8R0KhHYvHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55459365"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="55459365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 18:31:27 -0700
X-CSE-ConnectionGUID: eeyKfLsaTMyTxxKItBTvsw==
X-CSE-MsgGUID: k1+FQjZWTAqiNWEYL0GVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="127767144"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Apr 2025 18:31:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0sNW-0001iR-3A;
	Sat, 05 Apr 2025 01:31:22 +0000
Date: Sat, 5 Apr 2025 09:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: include/kunit/test.h:528:3: warning: '%s' directive argument is null
Message-ID: <202504050922.ZzbkiojG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ivan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f867ba24d3665d9ac9d9ef1f51844eb4479b291
commit: 3e39acf56ededdebd1033349a16b704839b94b28 ALSA: core: Add sound core KUnit test
date:   1 year, 2 months ago
config: csky-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050922.ZzbkiojG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050922.ZzbkiojG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050922.ZzbkiojG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from sound/core/sound_kunit.c:7:
   sound/core/sound_kunit.c: In function 'test_card_set_id':
   include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                            ^
   include/linux/printk.h:427:3: note: in definition of macro 'printk_index_wrap'
     427 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |   ^~~~~~~
   include/kunit/test.h:527:3: note: in expansion of macro 'printk'
     527 |   printk(lvl fmt, ##__VA_ARGS__);    \
         |   ^~~~~~
   include/kunit/test.h:533:2: note: in expansion of macro 'kunit_log'
     533 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:546:2: note: in expansion of macro 'kunit_printk'
     546 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   sound/core/sound_kunit.c:259:2: note: in expansion of macro 'kunit_info'
     259 |  kunit_info(test, "%s", card->id);
         |  ^~~~~~~~~~
   In file included from sound/core/sound_kunit.c:7:
>> include/kunit/test.h:528:3: warning: '%s' directive argument is null [-Wformat-overflow=]
     528 |   kunit_log_append((test_or_suite)->log, fmt,  \
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     529 |      ##__VA_ARGS__);   \
         |      ~~~~~~~~~~~~~~
   include/kunit/test.h:533:2: note: in expansion of macro 'kunit_log'
     533 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:546:2: note: in expansion of macro 'kunit_printk'
     546 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   sound/core/sound_kunit.c:259:2: note: in expansion of macro 'kunit_info'
     259 |  kunit_info(test, "%s", card->id);
         |  ^~~~~~~~~~


vim +528 include/kunit/test.h

e2219db280e3fe Alan Maguire 2020-03-26  484  
6d2426b2f258da David Gow    2021-06-24  485  /**
6d2426b2f258da David Gow    2021-06-24  486   * kunit_mark_skipped() - Marks @test_or_suite as skipped
6d2426b2f258da David Gow    2021-06-24  487   *
6d2426b2f258da David Gow    2021-06-24  488   * @test_or_suite: The test context object.
6d2426b2f258da David Gow    2021-06-24  489   * @fmt:  A printk() style format string.
6d2426b2f258da David Gow    2021-06-24  490   *
6d2426b2f258da David Gow    2021-06-24  491   * Marks the test as skipped. @fmt is given output as the test status
6d2426b2f258da David Gow    2021-06-24  492   * comment, typically the reason the test was skipped.
6d2426b2f258da David Gow    2021-06-24  493   *
6d2426b2f258da David Gow    2021-06-24  494   * Test execution continues after kunit_mark_skipped() is called.
6d2426b2f258da David Gow    2021-06-24  495   */
6d2426b2f258da David Gow    2021-06-24  496  #define kunit_mark_skipped(test_or_suite, fmt, ...)			\
6d2426b2f258da David Gow    2021-06-24  497  	do {								\
6d2426b2f258da David Gow    2021-06-24  498  		WRITE_ONCE((test_or_suite)->status, KUNIT_SKIPPED);	\
6d2426b2f258da David Gow    2021-06-24  499  		scnprintf((test_or_suite)->status_comment,		\
6d2426b2f258da David Gow    2021-06-24  500  			  KUNIT_STATUS_COMMENT_SIZE,			\
6d2426b2f258da David Gow    2021-06-24  501  			  fmt, ##__VA_ARGS__);				\
6d2426b2f258da David Gow    2021-06-24  502  	} while (0)
6d2426b2f258da David Gow    2021-06-24  503  
6d2426b2f258da David Gow    2021-06-24  504  /**
6d2426b2f258da David Gow    2021-06-24  505   * kunit_skip() - Marks @test_or_suite as skipped
6d2426b2f258da David Gow    2021-06-24  506   *
6d2426b2f258da David Gow    2021-06-24  507   * @test_or_suite: The test context object.
6d2426b2f258da David Gow    2021-06-24  508   * @fmt:  A printk() style format string.
6d2426b2f258da David Gow    2021-06-24  509   *
6d2426b2f258da David Gow    2021-06-24  510   * Skips the test. @fmt is given output as the test status
6d2426b2f258da David Gow    2021-06-24  511   * comment, typically the reason the test was skipped.
6d2426b2f258da David Gow    2021-06-24  512   *
6d2426b2f258da David Gow    2021-06-24  513   * Test execution is halted after kunit_skip() is called.
6d2426b2f258da David Gow    2021-06-24  514   */
6d2426b2f258da David Gow    2021-06-24  515  #define kunit_skip(test_or_suite, fmt, ...)				\
6d2426b2f258da David Gow    2021-06-24  516  	do {								\
6d2426b2f258da David Gow    2021-06-24  517  		kunit_mark_skipped((test_or_suite), fmt, ##__VA_ARGS__);\
6d2426b2f258da David Gow    2021-06-24  518  		kunit_try_catch_throw(&((test_or_suite)->try_catch));	\
6d2426b2f258da David Gow    2021-06-24  519  	} while (0)
e2219db280e3fe Alan Maguire 2020-03-26  520  
e2219db280e3fe Alan Maguire 2020-03-26  521  /*
e2219db280e3fe Alan Maguire 2020-03-26  522   * printk and log to per-test or per-suite log buffer.  Logging only done
e2219db280e3fe Alan Maguire 2020-03-26  523   * if CONFIG_KUNIT_DEBUGFS is 'y'; if it is 'n', no log is allocated/used.
e2219db280e3fe Alan Maguire 2020-03-26  524   */
e2219db280e3fe Alan Maguire 2020-03-26  525  #define kunit_log(lvl, test_or_suite, fmt, ...)				\
e2219db280e3fe Alan Maguire 2020-03-26  526  	do {								\
e2219db280e3fe Alan Maguire 2020-03-26  527  		printk(lvl fmt, ##__VA_ARGS__);				\
2c6a96dad5797e Rae Moar     2023-03-08 @528  		kunit_log_append((test_or_suite)->log,	fmt,		\
e2219db280e3fe Alan Maguire 2020-03-26  529  				 ##__VA_ARGS__);			\
e2219db280e3fe Alan Maguire 2020-03-26  530  	} while (0)
e2219db280e3fe Alan Maguire 2020-03-26  531  

:::::: The code at line 528 was first introduced by commit
:::::: 2c6a96dad5797e57b4cf04101d6c8d5c7a571603 kunit: fix bug of extra newline characters in debugfs logs

:::::: TO: Rae Moar <rmoar@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
