Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B99C1CFBA
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749277159; cv=none; b=USjTlgSR4bN3UPwFyZ+c5Jw7Mksq7uqUaO8Ncg7RcgSkpVloFmpaZTlVdw2mSqBEkzZ9nylHd+2wkKWC6JFWYB0zlU/9eBLJippxZSTktnNU8mC/wC0QN1sqXdCcGgJHT84igC/G4kGHaUJQ9+V8yTaDvSI2ICYAyzsTD9rBkCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749277159; c=relaxed/simple;
	bh=dDHdiH/wBu3deINA+42K97KLVtoTkhs5wyc4qSRdva4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQBm5ZadKUerwX9uXcNe5NsNbTDkR/eXmg6MTvncVp3iXb7IqqXAuNO8ZOPvtJefqVWI9LPzTE9wTD0hTRgBoI+nj/iDG08Nnqja3u4fc/wdBeSglSVCW9evEAHFrUdiyDswTGumpjpdPM03xiP5PDpb+SIGpk30ljo2J4TpSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKbWuo5s; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKbWuo5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749277157; x=1780813157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDHdiH/wBu3deINA+42K97KLVtoTkhs5wyc4qSRdva4=;
  b=AKbWuo5s467yLZ2ULAk/7yV/rwKo2YkHTuMAVl7KSjzAon6DVDtB4Znu
   8wnwCZKUS6dFIGs6UuQH/mdlOdHgdnRUesizwFpP6loNVvKt7aYiE/FiG
   0Q960doevRfu/Ny0RJekVk/HeRrY5d6TRSdXQV7/TanHnT0+qwfYCtrD/
   iYQeQ0jcAoKEx+5TroT34qvE/X+89qMk5hjLYtVx0pywri8MGSnWhfk4v
   +tjW0StYT1sQV+qW524Z6Lh7xOZVJQJV45Jr7t+8YG4qioSmH60uGh+hD
   F2nBxioTSNmwyNOIetiDHZ0TTYZjn6hy5d6WILTu0wi3Xld44I3hDuxeu
   A==;
X-CSE-ConnectionGUID: BP7oL3nLSiWh8WEedFsENA==
X-CSE-MsgGUID: w5W+KmVBTUGtd7SyKQEAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51512305"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51512305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 23:19:17 -0700
X-CSE-ConnectionGUID: pMucErVnRGuYoo/3dE56zQ==
X-CSE-MsgGUID: DDian7cfTTCvOfGoF5IxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="150894955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jun 2025 23:19:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNmtc-0005V1-1V;
	Sat, 07 Jun 2025 06:19:12 +0000
Date: Sat, 7 Jun 2025 14:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: include/linux/compiler.h:245:77: error: expression in static
 assertion is not an integer
Message-ID: <202506071446.bj4cB7D2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   119b1e61a769aa98e68599f44721661a4d8c55f3
commit: d7a516c6eeae29144649f1c3f586fa580ec9e040 compiler.h: Fix undefined BUILD_BUG_ON_ZERO()
date:   7 months ago
config: loongarch-randconfig-r053-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071446.bj4cB7D2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071446.bj4cB7D2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071446.bj4cB7D2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:15,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from sound/pci/ad1889.c:24:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from sound/pci/ad1889.c:23:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ad1889.c:48:1: note: in expansion of macro 'module_param_array'
      48 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/ad1889.c:47:12: warning: 'index' defined but not used [-Wunused-variable]
      47 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2140,
                    from include/linux/delay.h:23,
                    from sound/pci/cmipci.c:11:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:11,
                    from sound/pci/cmipci.c:10:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/cmipci.c:48:1: note: in expansion of macro 'module_param_array'
      48 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/cmipci.c:38:12: warning: 'index' defined but not used [-Wunused-variable]
      38 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2140,
                    from include/linux/delay.h:23,
                    from sound/pci/cs4281.c:8:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:11,
                    from sound/pci/cs4281.c:7:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/cs4281.c:34:1: note: in expansion of macro 'module_param_array'
      34 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/cs4281.c:29:12: warning: 'index' defined but not used [-Wunused-variable]
      29 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2140,
                    from include/linux/delay.h:23,
                    from sound/pci/fm801.c:7:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/fm801.c:44:1: note: in expansion of macro 'module_param_array'
      44 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/fm801.c:30:12: warning: 'index' defined but not used [-Wunused-variable]
      30 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2140,
                    from include/linux/delay.h:23,
                    from sound/pci/rme32.c:58:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme32.c:80:1: note: in expansion of macro 'module_param_array'
      80 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/rme32.c:75:12: warning: 'index' defined but not used [-Wunused-variable]
      75 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2140,
                    from include/linux/delay.h:23,
                    from sound/pci/rme96.c:12:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme96.c:39:1: note: in expansion of macro 'module_param_array'
      39 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/rme96.c:35:12: warning: 'index' defined but not used [-Wunused-variable]
      35 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/lockdep.h:15,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from sound/pci/au88x0/au88x0.h:8,
                    from sound/pci/au88x0/au8810.c:3:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/au88x0/au88x0.c:33:1: note: in expansion of macro 'module_param_array'
      33 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   In file included from sound/pci/au88x0/au8810.c:17:
   sound/pci/au88x0/au88x0.c:28:12: warning: 'index' defined but not used [-Wunused-variable]
      28 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/lockdep.h:15,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from sound/pci/aw2/aw2-alsa.c:11:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from sound/pci/aw2/aw2-alsa.c:10:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/aw2/aw2-alsa.c:137:1: note: in expansion of macro 'module_param_array'
     137 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/aw2/aw2-alsa.c:133:12: warning: 'index' defined but not used [-Wunused-variable]
     133 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/lockdep.h:15,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from sound/pci/cs46xx/cs46xx.c:13:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27:
>> include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/cs46xx/cs46xx.c:32:1: note: in expansion of macro 'module_param_array'
      32 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/pci/cs46xx/cs46xx.c:25:12: warning: 'index' defined but not used [-Wunused-variable]
      25 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
..


vim +245 include/linux/compiler.h

   241	
   242	#ifdef __CHECKER__
   243	#define __BUILD_BUG_ON_ZERO_MSG(e, msg) (0)
   244	#else /* __CHECKER__ */
 > 245	#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
   246	#endif /* __CHECKER__ */
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
