Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14720FA8E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618711; cv=none; b=iS7/bjemNcp7DPmOsU8msIYJvdzvCGvUTyeeNvy/zEKYRhNk+1bQndb8GL0aJlGTc/WwwkPsDf5AzdLhgiyx2SvYJUEBGz9Rod1VuvU1XzFynOwUbNju09yJtNA+2up/fveXiTRGbhpCTX0cKiBBYEVrEm19+DnavZysJ9e9NyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618711; c=relaxed/simple;
	bh=iLtmW/QXoPhA9E6GXUmkV7fRKcwHIBJyK5IwnF8CQAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHnW0JzMo2qp5O2d38YuZw6G5lARhL/spQIzeFegCh6n8+aLCno/hZ7XBwgX/hvnt36ZrOqJZTXM2UDeGNHnE4ibEpdVogxaXfaAX+vJoRhrKxuPqeaZh4nuytgFr4WdvU/SMc94+rS2TCAKi8cvU6LL+ooRRLGUePuxUOHTjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDQbl2Ch; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDQbl2Ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738618709; x=1770154709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLtmW/QXoPhA9E6GXUmkV7fRKcwHIBJyK5IwnF8CQAY=;
  b=YDQbl2Ch67SGcBuotgpGz+EDf9vTj4d6jBWNEltHPY0pmD5SZy/S6RUw
   gSaYxiqfGD+ti3Caxmpnc9SvUFYP0RB0gQCpJoeZZCpAMn14ewlnpo1sC
   SHtkqIiMcj2EnHIss9r8+K7+NtwqFdtqctix9V84jfrIwrZGyXhGOlPvY
   rbdn7ln/LcNxqq42EVpR8ybUPcRsiNYwAXxnNwGUhjeyNvVOxRUMACvzh
   wDgeK9DB6E9HsyECFSMRerEMY1Ks4cNZmJ/S5BXqsvCQMqHXpBNZO15g6
   5/Nr9hCLsd+k0ZAsJTZmtQDbWbCBofE0gXFoMLNAvQDqF9nBGjOoQQCjp
   A==;
X-CSE-ConnectionGUID: 1ecYVECqTdW4CkTpCYNdbA==
X-CSE-MsgGUID: RKBsRo/LSc6MGzmfyEeb9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39006788"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39006788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 13:38:28 -0800
X-CSE-ConnectionGUID: P4EoKDcYR9mSP5wDxkAF8g==
X-CSE-MsgGUID: a7+yhwkjQ6GT1n3AxAhSlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="141277580"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2025 13:38:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf49A-000rYF-2n;
	Mon, 03 Feb 2025 21:38:24 +0000
Date: Tue, 4 Feb 2025 05:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Joerg Roedel <jroedel@suse.de>
Subject: include/linux/kern_levels.h:5:25: warning: '%s' directive argument
 is null
Message-ID: <202502040544.apNgCoCw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f286757b644c226b6b31779da95a4fa7ab245ef5
commit: 59833696442c674acbbd297772ba89e7ad8c753d iommu/vt-d: dmar: replace WARN_TAINT with pr_warn + add_taint
date:   4 years, 11 months ago
config: x86_64-randconfig-161-20230920 (https://download.01.org/0day-ci/archive/20250204/202502040544.apNgCoCw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040544.apNgCoCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040544.apNgCoCw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:250,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from include/linux/pci.h:27,
                    from drivers/iommu/dmar.c:19:
   drivers/iommu/dmar.c: In function 'dmar_parse_one_andd':
>> include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:306:16: note: in expansion of macro 'KERN_WARNING'
     306 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/iommu/dmar.c:444:17: note: in expansion of macro 'pr_warn'
     444 |                 pr_warn(FW_BUG
         |                 ^~~~~~~
   drivers/iommu/dmar.c: In function 'warn_invalid_dmar':
>> include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:356:24: note: in definition of macro 'printk_once'
     356 |                 printk(fmt, ##__VA_ARGS__);                     \
         |                        ^~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:387:21: note: in expansion of macro 'KERN_WARNING'
     387 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~~~~~
   drivers/iommu/dmar.c:832:9: note: in expansion of macro 'pr_warn_once'
     832 |         pr_warn_once(FW_BUG
         |         ^~~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
