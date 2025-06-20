Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F792EA73D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444441; cv=none; b=Xa2PA3HA3Z1Qo8bU9fcglgplIjMCKu+nFpo8f/weCTenP3lvqn+jRoRBnz1tSFS9G/0heNCHY0Wq4j5VoHQvMLsivrxtU7MeYGE8FndZHvgq8lEpo2cH/0F3dzZqCORU5myNp41XbVZJkyYUbMSaiKzxWblkthLWKwd9GCpC3VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444441; c=relaxed/simple;
	bh=9iYNcVBaPb4Hwav7FShaIAw0RUnIu6JSzpcwtAcLNMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQU9kwUSM4g8mLe6GFfEqbiSPfWZopk7+yodlViLGog+lksQ6sgrK1oz4i/HAhgZZdCEP5l6ydCOYz5qyllAXOXPLNIP+KAGALSpAAp4jER1PI0CqjcSUHOsuIndWNISd5DjdlcCgzluWvQXYyDmmvZBp9WxThYpu7/VIika2/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bON0PG+W; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bON0PG+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750444440; x=1781980440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iYNcVBaPb4Hwav7FShaIAw0RUnIu6JSzpcwtAcLNMM=;
  b=bON0PG+WCm0K1xEj5MItQQMJKO0HpI7c/IU24RIB17Gv5Rbagsuc7gHL
   hm9FEqMFnBxZAzCS+BL2o1y/0fRny0qUF4iOT/EnCghQau/8aoLKhQMEW
   ZxG0T7JW1Q+bfbYBrP5aDT2Mu1DLKAuRi+pkHv8vA164Nld5M+v3Ku1S0
   JQ2bKWH44y5vegR7Nz1PHKFAUOrjviCKWKvESDm2JJDRZxbQHK3DrlWaz
   3qtrSFkVVS3ZBpngh8n1BnVBTVQPfyVi0pG9Juso+0oWj43hBi3YvO3x+
   1zdhJHGpzCkk9ThXv+a9lf71etYt5ibzJjRG4ked6FWRuAy1/gfdM1LQo
   g==;
X-CSE-ConnectionGUID: 7hA6w9kWQTGO9g3F+4WEzQ==
X-CSE-MsgGUID: MDxbWQlvQUGmH3s7kYjvSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52418275"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52418275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 11:33:59 -0700
X-CSE-ConnectionGUID: KE/vH0clTAqEFqMxLdv6Nw==
X-CSE-MsgGUID: xzV2Q7uAQQeGURIg7qUp5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="150779283"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jun 2025 11:33:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSgYj-000M42-1D;
	Fri, 20 Jun 2025 18:33:53 +0000
Date: Sat, 21 Jun 2025 02:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v5 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core
 driver
Message-ID: <202506210204.LVZc2VG2-lkp@intel.com>
References: <82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8ffcb7560b4a15faf821df95e3ab532b2b020f8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250620-100856
base:   8ffcb7560b4a15faf821df95e3ab532b2b020f8c
patch link:    https://lore.kernel.org/r/82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v5 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250621/202506210204.LVZc2VG2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210204.LVZc2VG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210204.LVZc2VG2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mfd/ls2k-bmc-core.c:152:1: warning: data definition has no type or storage class
     152 | module_pci_driver(ls2k_bmc_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/mfd/ls2k-bmc-core.c:152:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
>> drivers/mfd/ls2k-bmc-core.c:152:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/mfd/ls2k-bmc-core.c:146:26: warning: 'ls2k_bmc_driver' defined but not used [-Wunused-variable]
     146 | static struct pci_driver ls2k_bmc_driver = {
         |                          ^~~~~~~~~~~~~~~


vim +152 drivers/mfd/ls2k-bmc-core.c

   145	
 > 146	static struct pci_driver ls2k_bmc_driver = {
   147		.name = "ls2k-bmc",
   148		.id_table = ls2k_bmc_devices,
   149		.probe = ls2k_bmc_probe,
   150		.remove = ls2k_bmc_remove,
   151	};
 > 152	module_pci_driver(ls2k_bmc_driver);
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
