Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F639482F2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 01:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748827033; cv=none; b=b4NuSeq4q3skx1nA9K+Kdg54Es+acWMfmsgrGrExqLkOke6x+jpNX//q+O6hbqK+nNaby4XgtgSzrn6pKDq3xpA1s/ZZFiwVGrpLHY+4FCiYwh5XluK8TK+zjVU2tFTKEIgN3w5AR30WiiDhTP764oyEB7oUs5Kbe/6LwEWfDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748827033; c=relaxed/simple;
	bh=cULVw9qDmUn8eegISjfgOdt8WxXBueMBog2bvfMK6No=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k4/3n0j6D18k0hIC+2v1i3G73IbLsTXyk2w5ORF++yOs6D520hgbyebhCIGbtcKAyZY20OCqP8uSASznATyXygrM/BSDedwVD+ccOB9kVI2hEc6R2TGK1XEwbPnjn2FAWLPhJ3dSzdkCl5mga3Rkxn/HWDdLHe79jOcLq1SGob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K77zFRH8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K77zFRH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748827030; x=1780363030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cULVw9qDmUn8eegISjfgOdt8WxXBueMBog2bvfMK6No=;
  b=K77zFRH8Lu9i6YE/8UgqTp/+YGPidHW0NwL4qMBpTvkUKZ4EkK7wc0ep
   FxDMgFkrv/JiONFdQ5q5TXnGD63cuEJnebBTEmEZSvZpg5TR8hpxVBV4n
   /I2yRKInIQ8O8p/wLHC8GT7fGP7FvpD2AIb4dYpGumPJSuZOqMvMacy0u
   WuskiwY9gs4isjMcK0gZzh5/eagHMXXkVCG7GyNBE8NvWo0OoEySW5Fsw
   T8qJBlsXOue4KjkdPNmxgNz2DoUPGXU+rlSXa11tUw7+5zo7Y74vf1PwX
   25iYzQwEazya115aAbSwaoHInLLhw7vtZHEM89TBuHsNEdZzzZigc+mgG
   A==;
X-CSE-ConnectionGUID: x9TC/iYRSaWIk4c2VjzaOA==
X-CSE-MsgGUID: +ZyQBtj+S225PwvjV4upvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="53470622"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="53470622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 18:17:09 -0700
X-CSE-ConnectionGUID: 8aj/dSscRPGXSio01iF6CQ==
X-CSE-MsgGUID: EvvbpbJjQ+SBtCyFwaGhHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="144379161"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2025 18:17:08 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLtnV-0001EI-2w;
	Mon, 02 Jun 2025 01:17:05 +0000
Date: Mon, 2 Jun 2025 09:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: include/kunit/test.h:528:17: warning: '%s' directive argument is null
Message-ID: <202506020940.5grMdmaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cd2e103d57e5615f9bb027d772f93b9efd567224
commit: 3e39acf56ededdebd1033349a16b704839b94b28 ALSA: core: Add sound core KUnit test
date:   1 year, 4 months ago
config: i386-buildonly-randconfig-2003-20250503 (https://download.01.org/0day-ci/archive/20250602/202506020940.5grMdmaN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506020940.5grMdmaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506020940.5grMdmaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from sound/core/sound_kunit.c:7:
   sound/core/sound_kunit.c: In function 'test_card_set_id':
>> include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                            ^
   include/linux/printk.h:427:17: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                 ^~~~~~~
   include/kunit/test.h:527:17: note: in expansion of macro 'printk'
     527 |                 printk(lvl fmt, ##__VA_ARGS__);                         \
         |                 ^~~~~~
   include/kunit/test.h:533:9: note: in expansion of macro 'kunit_log'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |         ^~~~~~~~~
   include/kunit/test.h:546:9: note: in expansion of macro 'kunit_printk'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   sound/core/sound_kunit.c:259:9: note: in expansion of macro 'kunit_info'
     259 |         kunit_info(test, "%s", card->id);
         |         ^~~~~~~~~~
   In file included from sound/core/sound_kunit.c:7:
>> include/kunit/test.h:528:17: warning: '%s' directive argument is null [-Wformat-overflow=]
     528 |                 kunit_log_append((test_or_suite)->log,  fmt,            \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     529 |                                  ##__VA_ARGS__);                        \
         |                                  ~~~~~~~~~~~~~~
   include/kunit/test.h:533:9: note: in expansion of macro 'kunit_log'
     533 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |         ^~~~~~~~~
   include/kunit/test.h:546:9: note: in expansion of macro 'kunit_printk'
     546 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   sound/core/sound_kunit.c:259:9: note: in expansion of macro 'kunit_info'
     259 |         kunit_info(test, "%s", card->id);
         |         ^~~~~~~~~~


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
