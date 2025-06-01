Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644222DCC0E;
	Sun,  1 Jun 2025 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748744415; cv=none; b=XAdUqYTUZPexZRm7QbFK3HrWUMaHMSg3Bunh2cJA24btugnyRL7PDd3g8mjB6RN53/9ga4LvcwYRrypZ79wsfpaEWN16AHy3K/RYncoIGZlZEn1EMRXksmrkL2HJLbUUeXWFqJJEq+eCt++vJzkBGHzlx99iB16trmz7VQzjOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748744415; c=relaxed/simple;
	bh=8Ku2TiXaOhgiVos539+LogUi214rNs9xIfGmebSvmt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA8goKL/5VBcaIeT53VAu6KvLsL2DI53V7fhu4Oy08Krz5IQqsH094+gkCZ6Nuk+8DTNzWI+riu5l3i4ucnPU2rOfGyxtPtVvGrjkvthk7dpByRxrsJdhdf8fcd6WWBwVBgGtQHs7tXxV9yA+roPS7F3tVYM4p8WLcjdj5AjUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB7Ma5xs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB7Ma5xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748744412; x=1780280412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Ku2TiXaOhgiVos539+LogUi214rNs9xIfGmebSvmt8=;
  b=iB7Ma5xsl6Oc7Pu7pUA0zAMWkWGXcyclwcpYJ0g4ICetLeK+a4dWs3+5
   YdB0fqZQOcccyNds3DatvgMsiRWVMbzwyxIBhKyn3jfW55YfFCJkMRjWa
   57vXCkstWGfZjTBpBgNa/+l21jHogEFx7bNGUqCZPf0Y5R5F+WnQCuNyv
   E4/wJ+KVlnJnFRcpkWWCq94neAAJFNRL7NINJNHI2ts0iQJ5jw1pVrzFS
   1W802WDywIl+ppcyKOeHOH4ASZpSgOmFrcZK03OTCHl4RaADOLbIAOL+e
   vJ2Y4ew68Bjg5R3j+0KdK4eKqFJ4WGb6MZObB42RUCkxurhqIgs2sd2X0
   w==;
X-CSE-ConnectionGUID: IEOCuOGkQV+QApBiyKPtYg==
X-CSE-MsgGUID: PgxsvANuT26+LASWO8O4eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62145171"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="62145171"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 19:20:11 -0700
X-CSE-ConnectionGUID: 36B06KtcR2a7lP/+qDTlKg==
X-CSE-MsgGUID: DSyr2C1kQQOh+3SunQ38+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144862100"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2025 19:20:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLYIx-000Ykq-0I;
	Sun, 01 Jun 2025 02:20:07 +0000
Date: Sun, 1 Jun 2025 10:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	abd.masalkhi@gmail.com
Subject: Re: [PATCH 2/3] misc: add sysfs control driver for ST M24LR series
 RFID/NFC chips
Message-ID: <202506011056.lwz5lTUN-lkp@intel.com>
References: <20250531081159.2007319-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531081159.2007319-3-abd.masalkhi@gmail.com>

Hi Abd-Alrhman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-linus]
[also build test WARNING on robh/for-next soc/for-next linus/master v6.15]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abd-Alrhman-Masalkhi/dt-bindings-misc-Add-binding-for-ST-M24LR-control-interface/20250531-161342
base:   char-misc/char-misc-linus
patch link:    https://lore.kernel.org/r/20250531081159.2007319-3-abd.masalkhi%40gmail.com
patch subject: [PATCH 2/3] misc: add sysfs control driver for ST M24LR series RFID/NFC chips
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250601/202506011056.lwz5lTUN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011056.lwz5lTUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011056.lwz5lTUN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from include/linux/i2c.h:13,
                    from drivers/misc/m24lr_ctl.c:22:
   drivers/misc/m24lr_ctl.c: In function 'm24lr_ctl_write':
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/misc/m24lr_ctl.c:378:21: note: in expansion of macro 'IS_ERR_VALUE'
     378 |                 if (IS_ERR_VALUE(err)) {
         |                     ^~~~~~~~~~~~
   drivers/misc/m24lr_ctl.c: In function 'm24lr_ctl_show':
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/misc/m24lr_ctl.c:499:13: note: in expansion of macro 'IS_ERR_VALUE'
     499 |         if (IS_ERR_VALUE(ret))
         |             ^~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14:
   drivers/misc/m24lr_ctl.c: In function 'm24lr_ctl_probe':
   drivers/misc/m24lr_ctl.c:589:34: warning: too many arguments for format [-Wformat-extra-args]
     589 |                                  "Failed to create sysfs entry '%s'\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/misc/m24lr_ctl.c:588:25: note: in expansion of macro 'dev_warn'
     588 |                         dev_warn(dev,
         |                         ^~~~~~~~
   drivers/misc/m24lr_ctl.c:613:42: warning: too many arguments for format [-Wformat-extra-args]
     613 |                                          "Failed to create sysfs entry '%s'\n",
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/misc/m24lr_ctl.c:612:33: note: in expansion of macro 'dev_warn'
     612 |                                 dev_warn(dev,
         |                                 ^~~~~~~~
>> include/linux/err.h:28:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                                                 ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/misc/m24lr_ctl.c:642:13: note: in expansion of macro 'IS_ERR_VALUE'
     642 |         if (IS_ERR_VALUE(err))
         |             ^~~~~~~~~~~~
   drivers/misc/m24lr_ctl.c:645:15: error: too many arguments to function 'i2c_mux_add_adapter'; expected 3, have 4
     645 |         err = i2c_mux_add_adapter(muxc, 0, 0, 0);
         |               ^~~~~~~~~~~~~~~~~~~             ~
   In file included from drivers/misc/m24lr_ctl.c:25:
   include/linux/i2c-mux.h:58:5: note: declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/misc/m24lr_ctl.c: At top level:
   drivers/misc/m24lr_ctl.c:669:21: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Wincompatible-pointer-types]
     669 |         .probe    = m24lr_ctl_probe,
         |                     ^~~~~~~~~~~~~~~
   drivers/misc/m24lr_ctl.c:669:21: note: (near initialization for 'm24lr_ctl_driver.probe')
   drivers/misc/m24lr_ctl.c:540:12: note: 'm24lr_ctl_probe' declared here
     540 | static int m24lr_ctl_probe(struct i2c_client *client,
         |            ^~~~~~~~~~~~~~~
   drivers/misc/m24lr_ctl.c:670:21: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
     670 |         .remove   = remove,
         |                     ^~~~~~
   drivers/misc/m24lr_ctl.c:670:21: note: (near initialization for 'm24lr_ctl_driver.remove')
   drivers/misc/m24lr_ctl.c:655:12: note: 'remove' declared here
     655 | static int remove(struct i2c_client *client)
         |            ^~~~~~


vim +28 include/linux/err.h

ebba5f9fcb8823 Randy Dunlap   2006-09-27  21  
4d744ce9d5d7cf James Seo      2023-05-09  22  /**
4d744ce9d5d7cf James Seo      2023-05-09  23   * IS_ERR_VALUE - Detect an error pointer.
4d744ce9d5d7cf James Seo      2023-05-09  24   * @x: The pointer to check.
4d744ce9d5d7cf James Seo      2023-05-09  25   *
4d744ce9d5d7cf James Seo      2023-05-09  26   * Like IS_ERR(), but does not generate a compiler warning if result is unused.
4d744ce9d5d7cf James Seo      2023-05-09  27   */
aa00edc1287a69 Linus Torvalds 2016-05-27 @28  #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
07ab67c8d0d7c1 Linus Torvalds 2005-05-19  29  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
