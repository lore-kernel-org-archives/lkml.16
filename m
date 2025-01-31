Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F602F22
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738281998; cv=none; b=uXXiOTFO2AWsgxEkw3oI41EHtAsZ76MSwJ13BX25FGh/5OTXbdbq9ta9Ets2FC+XTJtKEdxTVtgGQ+2uyqpDoTJAgzLqVTzzvKbLIWujGeCnjiomzynQSeCtkH07NfnnWsN9BiUTFB0NNCr6Hkh4njf38EevT7og0Cjcq6qv9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738281998; c=relaxed/simple;
	bh=sCVAFlQmW5dOKVDuZPqegFwIeIK3UsLLFMfeU0AC5do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XcEaVnWbgKoitAkJhGXivin1170BjQKSf3MTaGo5H3AG8lw7aArTnrZRxMwJASdtYAA/8s/BzNwKKsdBFxcyeyouz6L4OVcR4Ss+cuLMHXR9zKPyLGM2PMzQS/MMr2ILGo8ntDcq173rmqKlQhHTkDvzyjJs5dn9elI/Q6JUVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyhSwsWH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyhSwsWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738281997; x=1769817997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCVAFlQmW5dOKVDuZPqegFwIeIK3UsLLFMfeU0AC5do=;
  b=LyhSwsWHsJbkI/UcE2TSSLuTOBblY8vN/iKR5gIc7A5145r1nf+S/53d
   D5bDjrqBgFCLP7ovSbzA2OChfpGkBXWM8sDYVR6KbJIMRfaZH4FQ6Buhj
   5KwmIPb9Fano1sK+NlGtacU3MeTiWbhvNb8rOUmMgd7Tx0YiQl8vhWovv
   Te9q3jIH/qiNPIRhkhjdSOpyNHCFiFvka6un1TZ2mIFoo7Z9S7vyEdfc+
   A6VoFNHPPW+0Ky1SnejyXdIQ5hXX7KF6XExTjNmOovIi2/JemSl2bDwUg
   0Zfuyv5gM2UIPAzAF81S0+yBqYwYxAofWYgBZc8UA+jxWWqLd1u/xMmN8
   w==;
X-CSE-ConnectionGUID: v83wPpRtTFiXg4cDgtlhEQ==
X-CSE-MsgGUID: CPgyze9gT9KaXX81Aa7WAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38956159"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38956159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 16:06:36 -0800
X-CSE-ConnectionGUID: W1CNy6YWRCG1n4yKIWlKoQ==
X-CSE-MsgGUID: L+UYFf9pTVm48LfY7d9c4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109933043"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jan 2025 16:06:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdeYJ-000lQl-38;
	Fri, 31 Jan 2025 00:06:31 +0000
Date: Fri, 31 Jan 2025 08:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
Message-ID: <202501310832.kiAeOt2z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   5 days ago
config: hexagon-randconfig-r133-20250131 (https://download.01.org/0day-ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
           strtomem_pad(key->u.kbd.release_str, release, '\0');
           ^
   include/linux/string.h:417:2: note: expanded from macro 'strtomem_pad'
           BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:127:1: note: expanded from here
   __compiletime_assert_309
   ^
   1 error generated.


vim +/error +1454 drivers/auxdisplay/panel.c

7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1426  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1427  /* tries to bind a key to the signal name <name>. The key will send the
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1428   * strings <press>, <repeat>, <release> for these respective events.
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1429   * Returns the pointer to the new key if ok, NULL if the key could not be bound.
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1430   */
36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2013-02-15  1431  static struct logical_input *panel_bind_key(const char *name, const char *press,
36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2013-02-15  1432  					    const char *repeat,
36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2013-02-15  1433  					    const char *release)
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2008-11-22  1434  {
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1435  	struct logical_input *key;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1436  
fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broeck 2014-05-21  1437  	key = kzalloc(sizeof(*key), GFP_KERNEL);
eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          2012-07-12  1438  	if (!key)
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1439  		return NULL;
eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          2012-07-12  1440  
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2008-11-22  1441  	if (!input_name2mask(name, &key->mask, &key->value, &scan_mask_i,
cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2010-07-12  1442  			     &scan_mask_o)) {
cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2010-07-12  1443  		kfree(key);
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1444  		return NULL;
cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2010-07-12  1445  	}
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2008-11-22  1446  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1447  	key->type = INPUT_TYPE_KBD;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1448  	key->state = INPUT_ST_LOW;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1449  	key->rise_time = 1;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1450  	key->fall_time = 1;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1451  
a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2023-09-11  1452  	strtomem_pad(key->u.kbd.press_str, press, '\0');
a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2023-09-11  1453  	strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2023-09-11 @1454  	strtomem_pad(key->u.kbd.release_str, release, '\0');
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1455  	list_add(&key->list, &logical_inputs);
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1456  	return key;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1457  }
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1458  

:::::: The code at line 1454 was first introduced by commit
:::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: Replace deprecated strncpy() with strtomem_pad()

:::::: TO: Justin Stitt <justinstitt@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
