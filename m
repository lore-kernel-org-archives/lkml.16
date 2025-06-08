Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633BD2686B1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427160; cv=none; b=fkRCVDhsUIhmJR58xT++EOuaINQktNEp68WV8i99rsmzUlLBzNdulY+CB1GdjHYzIdT2W9a4ZQDQ4E0jwiuozNpe4eNPJC9+7p+B0WXo5BiZ1+V7VusNtMBzuSBPESurFkrkachtVM8d4bXkeHGvfn7Rzf1VedZ0toRDcblP2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427160; c=relaxed/simple;
	bh=pophgDGQcTCoOGYTvZJPnSg+Dj9iwuitVrCurYQEid8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlptrk6fAPuUkqeeKLkQRUkqfEETLoVdE4zO5EBVx1uD2KaT7GTw46Sn4/10XH2Ht6BnqMGbmZgG/AIUxXYImYT9oGbyO1N2w8y2iQAnhfaCHB3IbFx5FGSccR70DUJiHkH+BcKK2HPBz7Cg+yTeEyPTv/W+JKda+nVn4KMG+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMacrvot; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMacrvot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749427159; x=1780963159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pophgDGQcTCoOGYTvZJPnSg+Dj9iwuitVrCurYQEid8=;
  b=UMacrvotCJNdxdQ+8NASllfRbTDEUQ3jDuUbjIK4F99U8YBz0p+BIrBc
   GEN4KuqLNcA/w+GD+ANySE8jNcpFra0io/TQSHv1VpJJqUSMNvxDY5q+u
   WrHtat/BJ7MFfavzI9szGmZ9XkAhMH4C9G5KiLaTZO2ZiEO3q4iUWGK7V
   EMT7M2nLtq32XG8g2vOgHP6eOAUFLp3oWd5JAAewkD6oyujVpciSB0L/x
   IaqTQbE/C9oUFDSuQ9ZAa9iDyMKpry+t0Fx4GkgxSk6wZTsbJ/l8IHb0E
   hPYbAm7LWR37AU/ZJo/ZOLdcrYzVYO0IzozE+b5yOziqHZ8f6IgFqGU3r
   g==;
X-CSE-ConnectionGUID: 9DL3gd4ZTQmEzXEGZW+fVg==
X-CSE-MsgGUID: A5RqeSh6QEiWKTJMAMOKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62114523"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="62114523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 16:59:17 -0700
X-CSE-ConnectionGUID: p4rjQpA4TimTuzCdtaOfqA==
X-CSE-MsgGUID: 93sC67mCSYK3TZeNpQPr5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="146279352"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jun 2025 16:59:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOPuz-0006e5-35;
	Sun, 08 Jun 2025 23:59:13 +0000
Date: Mon, 9 Jun 2025 07:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/mips/txx9/generic/setup.c:837:32: error: assignment to 'ssize_t
 (*)(struct file *, struct kobject *, const struct bin_attribute *, char *,
 loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const
 struct bin_attribute *, char *, long lon...
Message-ID: <202506090720.YHNaPWqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
commit: 97d06802d10a2827ef46fd31789a26117ce7f3d9 sysfs: constify bin_attribute argument of bin_attribute::read/write()
date:   8 weeks ago
config: mips-rbtx49xx_defconfig (https://download.01.org/0day-ci/archive/20250609/202506090720.YHNaPWqT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090720.YHNaPWqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090720.YHNaPWqT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/txx9/generic/setup.c: In function 'txx9_sramc_init':
>> arch/mips/txx9/generic/setup.c:837:32: error: assignment to 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  unsigned int)'} [-Wincompatible-pointer-types]
     837 |         dev->bindata_attr.read = txx9_sram_read;
         |                                ^
   arch/mips/txx9/generic/setup.c:776:16: note: 'txx9_sram_read' declared here
     776 | static ssize_t txx9_sram_read(struct file *filp, struct kobject *kobj,
         |                ^~~~~~~~~~~~~~
   arch/mips/txx9/generic/setup.c:838:33: error: assignment to 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  unsigned int)'} [-Wincompatible-pointer-types]
     838 |         dev->bindata_attr.write = txx9_sram_write;
         |                                 ^
   arch/mips/txx9/generic/setup.c:791:16: note: 'txx9_sram_write' declared here
     791 | static ssize_t txx9_sram_write(struct file *filp, struct kobject *kobj,
         |                ^~~~~~~~~~~~~~~


vim +837 arch/mips/txx9/generic/setup.c

1610c8a8f2d3eb Levente Kurusa 2013-12-19  813  
c3b28ae260d99a Atsushi Nemoto 2009-05-25  814  void __init txx9_sramc_init(struct resource *r)
c3b28ae260d99a Atsushi Nemoto 2009-05-25  815  {
269a3eb1bf10a0 Kay Sievers    2011-12-21  816  	struct txx9_sramc_dev *dev;
c3b28ae260d99a Atsushi Nemoto 2009-05-25  817  	size_t size;
c3b28ae260d99a Atsushi Nemoto 2009-05-25  818  	int err;
c3b28ae260d99a Atsushi Nemoto 2009-05-25  819  
269a3eb1bf10a0 Kay Sievers    2011-12-21  820  	err = subsys_system_register(&txx9_sramc_subsys, NULL);
269a3eb1bf10a0 Kay Sievers    2011-12-21  821  	if (err)
c3b28ae260d99a Atsushi Nemoto 2009-05-25  822  		return;
c3b28ae260d99a Atsushi Nemoto 2009-05-25  823  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
c3b28ae260d99a Atsushi Nemoto 2009-05-25  824  	if (!dev)
c3b28ae260d99a Atsushi Nemoto 2009-05-25  825  		return;
c3b28ae260d99a Atsushi Nemoto 2009-05-25  826  	size = resource_size(r);
c3b28ae260d99a Atsushi Nemoto 2009-05-25  827  	dev->base = ioremap(r->start, size);
1610c8a8f2d3eb Levente Kurusa 2013-12-19  828  	if (!dev->base) {
1610c8a8f2d3eb Levente Kurusa 2013-12-19  829  		kfree(dev);
1610c8a8f2d3eb Levente Kurusa 2013-12-19  830  		return;
1610c8a8f2d3eb Levente Kurusa 2013-12-19  831  	}
1610c8a8f2d3eb Levente Kurusa 2013-12-19  832  	dev->dev.release = &txx9_device_release;
269a3eb1bf10a0 Kay Sievers    2011-12-21  833  	dev->dev.bus = &txx9_sramc_subsys;
f937331b3f92cb Wolfram Sang   2010-03-15  834  	sysfs_bin_attr_init(&dev->bindata_attr);
c3b28ae260d99a Atsushi Nemoto 2009-05-25  835  	dev->bindata_attr.attr.name = "bindata";
c3b28ae260d99a Atsushi Nemoto 2009-05-25  836  	dev->bindata_attr.attr.mode = S_IRUSR | S_IWUSR;
c3b28ae260d99a Atsushi Nemoto 2009-05-25 @837  	dev->bindata_attr.read = txx9_sram_read;

:::::: The code at line 837 was first introduced by commit
:::::: c3b28ae260d99a5364a31210a36a3246bd9647f7 MIPS: TXx9: Add SRAMC support

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
