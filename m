Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4141F9F51
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 23:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749164623; cv=none; b=QH0ESYFtrmBDOmPQVaQYqNABKDdBM8d5WIerK/ICxcPpBY85yfmCDl0N6inZge6AFGS08cuG4wtmlyoNdVQnp2VdzO76R5kcP2KKU8YiP5NeXpgvzplE+CWHPiRqykVQiwInb+VRVQXIyVhX/6HWpzxZDlCsGwCULjKoAEpUOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749164623; c=relaxed/simple;
	bh=kzkTROdiTQEKkoNuXR9/RDOUfcSsHCsEuM1Uk9kkmLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GitMkMfbxDus3uHrbqFoSZrp0sMxzDHBYiYM0PtlF0NIZ0/f1br9DvFj4Equd8+FbDJOazolsSnMgNQ5cmo88PrmqiBS6GDrsDNnkNDtpmzqSxlYxRvdP0Wz0jBALFgxNxcGC3PCNYxypPcSqoYwjXv3WAkq0cVQMfpSp7rhZ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oC/PHs5t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oC/PHs5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749164620; x=1780700620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kzkTROdiTQEKkoNuXR9/RDOUfcSsHCsEuM1Uk9kkmLk=;
  b=oC/PHs5tSMIpae5rXFjvlbuPwEx1E1PgBJbjyU+C8AG/IrYQkkiV9bnC
   GKgGDWj9csHdFYIYhDNeSjwfVPdGnZnXgcPprKpRPZyLqCSLls1wzeUEe
   EWn6DQXFvhKvOX3IoYY/BxXBr79nM7Pnt+C7IrZYa5Akff7hYZGOdhc+S
   rBpXI/dWTUVOr4HWsKKVLzlGORoDVx4OqHJaho8D9GXdWZGHmU5GMyhwW
   4d16l57eeHeomMyCMaAizdcvSVFJ5DP1CCoxtIaNQYLRQsY8OB+D973SA
   xmLOxjtDQ4qVN+gr7jfnQDN/mLJPv+Lv7YM7/zgUkWjz7lvhBwzroONoT
   w==;
X-CSE-ConnectionGUID: Puu8LyKsSZKhT/YHC2DbSg==
X-CSE-MsgGUID: 48oTxN4eQu+2e+EJ61m9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="53933740"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="53933740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 16:03:39 -0700
X-CSE-ConnectionGUID: Kd+DFLxESySJDuHjdZ00Xg==
X-CSE-MsgGUID: NodV+vblSQ6uh/7e7O1QYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="149493369"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 16:03:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNJcV-0004X3-1f;
	Thu, 05 Jun 2025 23:03:35 +0000
Date: Fri, 6 Jun 2025 07:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: include/asm-generic/io.h:542:14: error: call to '_inb' declared with
 attribute error: inb()) requires CONFIG_HAS_IOPORT
Message-ID: <202506060742.XR3HcxWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e271ed52b344ac02d4581286961d0c40acc54c03
commit: b8c9c3b822fe8e033b9802516f6466099d915488 um: stop using PCI port I/O
date:   4 days ago
config: um-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060742.XR3HcxWA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060742.XR3HcxWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060742.XR3HcxWA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/sonypi.c: In function 'sonypi_call1':
   drivers/char/sonypi.c:638:12: warning: variable 'v1' set but not used [-Wunused-but-set-variable]
     638 |         u8 v1, v2;
         |            ^~
   In file included from arch/um/include/asm/io.h:24,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/um/include/asm/hardirq.h:5,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from drivers/char/sonypi.c:27:
   In function 'inb_p',
       inlined from 'sonypi_irq' at drivers/char/sonypi.c:830:7:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_irq' at drivers/char/sonypi.c:831:7:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_call1.isra' at drivers/char/sonypi.c:640:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   drivers/char/sonypi.c: In function 'sonypi_call1.isra':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/char/sonypi.c:641:9: note: in expansion of macro 'outb'
     641 |         outb(dev, sonypi_device.ioport2);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_call1.isra' at drivers/char/sonypi.c:642:7:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_call1.isra' at drivers/char/sonypi.c:643:7:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_call2' at drivers/char/sonypi.c:651:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   drivers/char/sonypi.c: In function 'sonypi_call2':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/char/sonypi.c:652:9: note: in expansion of macro 'outb'
     652 |         outb(dev, sonypi_device.ioport2);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_call2' at drivers/char/sonypi.c:653:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   drivers/char/sonypi.c: In function 'sonypi_call2':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/char/sonypi.c:654:9: note: in expansion of macro 'outb'
     654 |         outb(fn, sonypi_device.ioport1);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_call2' at drivers/char/sonypi.c:655:7:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_ec_read' at drivers/char/sonypi.c:533:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'outb_p',
       inlined from 'sonypi_ec_read' at drivers/char/sonypi.c:534:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:694:9: note: in expansion of macro 'outb'
     694 |         outb(value, addr);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_ec_read' at drivers/char/sonypi.c:535:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'outb_p',
       inlined from 'sonypi_ec_read' at drivers/char/sonypi.c:536:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:694:9: note: in expansion of macro 'outb'
     694 |         outb(value, addr);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_ec_read' at drivers/char/sonypi.c:537:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_ec_read' at drivers/char/sonypi.c:538:11:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:517:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'outb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:518:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:694:9: note: in expansion of macro 'outb'
     694 |         outb(value, addr);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:519:2:
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'outb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:520:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:694:9: note: in expansion of macro 'outb'
     694 |         outb(value, addr);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:521:2:
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'outb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:522:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:694:9: note: in expansion of macro 'outb'
     694 |         outb(value, addr);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_ec_write' at drivers/char/sonypi.c:523:2:
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'inb_p',
       inlined from 'sonypi_call3' at drivers/char/sonypi.c:663:2,
       inlined from 'sonypi_set' at drivers/char/sonypi.c:693:2:
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'sonypi_call3',
       inlined from 'sonypi_set' at drivers/char/sonypi.c:693:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/char/sonypi.c:664:9: note: in expansion of macro 'outb'
     664 |         outb(dev, sonypi_device.ioport2);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_call3' at drivers/char/sonypi.c:665:2,
       inlined from 'sonypi_set' at drivers/char/sonypi.c:693:2:
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
         |              ^
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   include/asm-generic/io.h:670:16: note: in expansion of macro 'inb'
     670 |         return inb(addr);
         |                ^~~
   In function 'sonypi_call3',
       inlined from 'sonypi_set' at drivers/char/sonypi.c:693:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/char/sonypi.c:666:9: note: in expansion of macro 'outb'
     666 |         outb(fn, sonypi_device.ioport1);
         |         ^~~~
   In function 'inb_p',
       inlined from 'sonypi_call3' at drivers/char/sonypi.c:667:2,
       inlined from 'sonypi_set' at drivers/char/sonypi.c:693:2:
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
..


vim +/_inb +542 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann   2009-05-13  534  
9216efafc52ff9 Thierry Reding  2014-10-01  535  /*
9216efafc52ff9 Thierry Reding  2014-10-01  536   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding  2014-10-01  537   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding  2014-10-01  538   * take effect.
9216efafc52ff9 Thierry Reding  2014-10-01  539   */
9216efafc52ff9 Thierry Reding  2014-10-01  540  
f009c89df79abe John Garry      2020-03-28  541  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry      2020-03-28 @542  #define _inb _inb
6f043e75744596 Niklas Schnelle 2024-10-24  543  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  544  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  545  {
87fe2d543f8173 Sinan Kaya      2018-04-05  546  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  547  
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05  549  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  550  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  551  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  552  }
6f043e75744596 Niklas Schnelle 2024-10-24  553  #else
6f043e75744596 Niklas Schnelle 2024-10-24  554  u8 _inb(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  555  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  558  
f009c89df79abe John Garry      2020-03-28  559  #if !defined(inw) && !defined(_inw)
f009c89df79abe John Garry      2020-03-28  560  #define _inw _inw
6f043e75744596 Niklas Schnelle 2024-10-24  561  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  562  static inline u16 _inw(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  563  {
87fe2d543f8173 Sinan Kaya      2018-04-05  564  	u16 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  565  
87fe2d543f8173 Sinan Kaya      2018-04-05  566  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  567  	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  568  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  569  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  570  }
6f043e75744596 Niklas Schnelle 2024-10-24  571  #else
6f043e75744596 Niklas Schnelle 2024-10-24  572  u16 _inw(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  573  	__compiletime_error("inw() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  574  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  575  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  576  
f009c89df79abe John Garry      2020-03-28  577  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28 @578  #define _inl _inl
6f043e75744596 Niklas Schnelle 2024-10-24  579  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  580  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  581  {
87fe2d543f8173 Sinan Kaya      2018-04-05  582  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  583  
87fe2d543f8173 Sinan Kaya      2018-04-05  584  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  585  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  586  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  587  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  588  }
6f043e75744596 Niklas Schnelle 2024-10-24  589  #else
6f043e75744596 Niklas Schnelle 2024-10-24  590  u32 _inl(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  591  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  594  
f009c89df79abe John Garry      2020-03-28  595  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @596  #define _outb _outb
6f043e75744596 Niklas Schnelle 2024-10-24  597  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  598  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  599  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  602  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  603  }
6f043e75744596 Niklas Schnelle 2024-10-24  604  #else
6f043e75744596 Niklas Schnelle 2024-10-24  605  void _outb(u8 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  606  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  609  
f009c89df79abe John Garry      2020-03-28  610  #if !defined(outw) && !defined(_outw)
f009c89df79abe John Garry      2020-03-28  611  #define _outw _outw
6f043e75744596 Niklas Schnelle 2024-10-24  612  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  613  static inline void _outw(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  614  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  615  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  616  	__raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  617  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  618  }
6f043e75744596 Niklas Schnelle 2024-10-24  619  #else
6f043e75744596 Niklas Schnelle 2024-10-24  620  void _outw(u16 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  621  	__compiletime_error("outw() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  622  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  623  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  624  
f009c89df79abe John Garry      2020-03-28  625  #if !defined(outl) && !defined(_outl)
f009c89df79abe John Garry      2020-03-28 @626  #define _outl _outl
6f043e75744596 Niklas Schnelle 2024-10-24  627  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  628  static inline void _outl(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  629  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  630  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  631  	__raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  632  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  633  }
6f043e75744596 Niklas Schnelle 2024-10-24  634  #else
6f043e75744596 Niklas Schnelle 2024-10-24  635  void _outl(u32 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  636  	__compiletime_error("outl() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  637  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  638  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  639  

:::::: The code at line 542 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
