Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119D521ABDE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303640; cv=none; b=fldtJJXt2E3F9RnqBkkiPvTr9HoHb/8erfyW6xFxJ9+vMgX7TDb6r2GZ2ldW4AM7w6evW6OexcFoyHKV2Lq37S4Mr5wTpcY5ydmf7FJ7Z5YJnzrtNvl1wqOrmpMlN9QE+Qjuo2PyjboNHY6dCyaNmS4JaaFBhj22ROE7G4ZlRiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303640; c=relaxed/simple;
	bh=lG+AJzYTyqIBVr0kpwKvwOUbYRVdnS34HpP7QoWRYnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sayGJrjU21EwbfS1+/Axt2JIIokADOqFOC4RDUOv3kV/fpjM21COTHSqB4U6Xr3scPjZi2nqGZu3WMJi/ZC4FJp4A9abkrPScswtpCnlCGGw4apWsgIyrtxs7z9sVX7/f+MyrENEgsSc25N6+XqHG1YU5hgmZEyLmZ6dH93+LyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkCIXY8S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkCIXY8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745303638; x=1776839638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lG+AJzYTyqIBVr0kpwKvwOUbYRVdnS34HpP7QoWRYnI=;
  b=EkCIXY8SZveCKt0Syes6oBSieeubyytj8g5Z/Zn681GdyCIXcoJr6mUa
   zAX+3MM8pv2qEuEf6mI3Qo8Pj03vHnKxwYNgyjDy9657Fj1Rzh0+Oerc0
   lAo4H6tq5V4RFjCAA9dft18+rxNOmu+labwjJ+lu1DoRcJP/N6rTeMRxs
   xDf9INdzBfj+3J/6AQqooLv6iW91k6SJtIDZPuxZEIvyj++FxaVENXxLh
   0yCuj337mRRq6Se5HdxGE7wQdkw2TzWio83M0wmuDX0BkLHab9OZs1VTi
   sNNCOB8HltxshTCCV5oX8hri/689q03RRQ1KI3FEmiSgAX21K+in6/+xe
   w==;
X-CSE-ConnectionGUID: 96FNHBM0THCXRlCkriZEAg==
X-CSE-MsgGUID: z9ivT1wIT9GEmkTX7OA5/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50676434"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="50676434"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 23:33:57 -0700
X-CSE-ConnectionGUID: Gchev3+TRoy28GD8klGtLA==
X-CSE-MsgGUID: Ij4cWYHfTl6qim1Aj1kNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="155091747"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Apr 2025 23:33:54 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u77Ca-0000fj-0n;
	Tue, 22 Apr 2025 06:33:52 +0000
Date: Tue, 22 Apr 2025 14:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Marwin Hormiz <marwinhormiz@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dan.carpenter@linaro.org,
	matchstick@neverthere.org, arnd@arndb.de, niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marwin Hormiz <marwinhormiz@gmail.com>
Subject: Re: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in
 gpib_bitbang.c
Message-ID: <202504221447.i7O7WGlW-lkp@intel.com>
References: <20250421184144.220972-1-marwinhormiz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421184144.220972-1-marwinhormiz@gmail.com>

Hi Marwin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Marwin-Hormiz/staging-gpib-gpio-Fix-memory-allocation-style-in-gpib_bitbang-c/20250422-024547
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250421184144.220972-1-marwinhormiz%40gmail.com
patch subject: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in gpib_bitbang.c
config: nios2-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504221447.i7O7WGlW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504221447.i7O7WGlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504221447.i7O7WGlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/staging/gpib/include/gpib_types.h:13,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/gpio/gpib_bitbang.c:56:
   drivers/staging/gpib/gpio/gpib_bitbang.c: In function 'bb_read':
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:380:9: note: in expansion of macro 'dbg_printk'
     380 |         dbg_printk(3, ".........." LINFMT "\n", LINVAL);
         |         ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:380:9: note: in expansion of macro 'dbg_printk'
     380 |         dbg_printk(3, ".........." LINFMT "\n", LINVAL);
         |         ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:380:9: note: in expansion of macro 'dbg_printk'
     380 |         dbg_printk(3, ".........." LINFMT "\n", LINVAL);
         |         ^~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c: In function 'bb_DAV_interrupt':
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:453:17: note: in expansion of macro 'dbg_printk'
     453 |                 dbg_printk(1, "out of order DAV interrupt %d/%d after %zu/%zu at %d cmd %d "
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:453:17: note: in expansion of macro 'dbg_printk'
     453 |                 dbg_printk(1, "out of order DAV interrupt %d/%d after %zu/%zu at %d cmd %d "
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:453:17: note: in expansion of macro 'dbg_printk'
     453 |                 dbg_printk(1, "out of order DAV interrupt %d/%d after %zu/%zu at %d cmd %d "
         |                 ^~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c: In function 'bb_write':
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:550:25: note: in expansion of macro 'dbg_printk'
     550 |                         dbg_printk(1, "timeout after %zu/%zu at %d " LINFMT " eoi: %d\n",
         |                         ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:550:25: note: in expansion of macro 'dbg_printk'
     550 |                         dbg_printk(1, "timeout after %zu/%zu at %d " LINFMT " eoi: %d\n",
         |                         ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:550:25: note: in expansion of macro 'dbg_printk'
     550 |                         dbg_printk(1, "timeout after %zu/%zu at %d " LINFMT " eoi: %d\n",
         |                         ^~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c: In function 'bb_NRFD_interrupt':
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:610:17: note: in expansion of macro 'dbg_printk'
     610 |                 dbg_printk(1, "out of order interrupt after %zu/%zu at %d cmd %d " LINFMT ".\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:610:17: note: in expansion of macro 'dbg_printk'
     610 |                 dbg_printk(1, "out of order interrupt after %zu/%zu at %d cmd %d " LINFMT ".\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:610:17: note: in expansion of macro 'dbg_printk'
     610 |                 dbg_printk(1, "out of order interrupt after %zu/%zu at %d cmd %d " LINFMT ".\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:617:17: note: in expansion of macro 'dbg_printk'
     617 |                 dbg_printk(1, "DAV low after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:617:17: note: in expansion of macro 'dbg_printk'
     617 |                 dbg_printk(1, "DAV low after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:617:17: note: in expansion of macro 'dbg_printk'
     617 |                 dbg_printk(1, "DAV low after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                 ^~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c: In function 'bb_NDAC_interrupt':
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:687:17: note: in expansion of macro 'dbg_printk'
     687 |                 dbg_printk(1, "DAV high after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:687:17: note: in expansion of macro 'dbg_printk'
     687 |                 dbg_printk(1, "DAV high after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                 ^~~~~~~~~~
>> <command-line>: warning: format '%d' expects a matching 'int' argument [-Wformat=]
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:21: note: in expansion of macro 'KBUILD_MODNAME'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:29:17: note: in expansion of macro 'pr_fmt'
      29 | #define dev_fmt pr_fmt
         |                 ^~~~~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:25: note: in expansion of macro 'dev_dbg'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                         ^~~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:687:17: note: in expansion of macro 'dbg_printk'
     687 |                 dbg_printk(1, "DAV high after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                 ^~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
