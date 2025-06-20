Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110821B9DB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457791; cv=none; b=hveiVjy0KcnimM3wGam7X+pLwyLN95jY3tufgk+M/p0uyuZKoj2XKpTKpyt5AURzWHK7F9qD1qitj+YOekXwLTCBNt3iNDX9SitjdFRPiTI7kO8DlRU0s+ZLmOYH6ycisTQwdVpeGCVQ+lp8ir2C28QoF5i9T7jnC6OYBqjBTLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457791; c=relaxed/simple;
	bh=DiznFfKK4GJWBk8WW4xN3lBklSm/HLutSphgJ/8W54s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1U8OjMk8A5W8aFjoPXUOQp+RXTqi5COD9HZw/1JEPaixWIfBYVq+m52ivbJ1yK265DZ7ol+ZA4svzLVdgP+ShayMoNQbDxE74VvKcP65QI1MbKu/khS90qnhhW1LYIkmnv8tC8gjixaKubFwgWUQokgI9H4y0rGBRZaeD6kxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLvlj6ar; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLvlj6ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750457790; x=1781993790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DiznFfKK4GJWBk8WW4xN3lBklSm/HLutSphgJ/8W54s=;
  b=XLvlj6arA7TiooTMAu0bOa0ul018IewgLemRKCKdIDCM/WXE5zM5Z+12
   7CvGhQGJL/E7aX5N3ony5Dd2X2eByhJzwX1pAklpLoa0dTNYudFF9wpq+
   xAONIsPdG2Z+EmSxM3mm5hRdS5AXFzaWT0AAJFDiQ3wb7KpLUgp5/6rbi
   405urIamVqp5/N0QviaFIxrk9t02j59kswGEXemze/O4qClovIzvjgPez
   uxkcdgvWx74QrtAQUawpamVeK77W6hL6YB1uRYyeG5+nCG3XgWmdVyyQ4
   Yq2nKmd5OBJj1t2Q9MqHZdvIEIRn6FubQ7vX/aH5YMZCDznLBqWimDNec
   A==;
X-CSE-ConnectionGUID: wVto3eQhQh6sUNnca17QOA==
X-CSE-MsgGUID: jLzF8WAcR128c/vwnXldLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52694019"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52694019"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 15:16:29 -0700
X-CSE-ConnectionGUID: 0IFH3uNeSOGycdSCpEQoXA==
X-CSE-MsgGUID: NTGemIsmQRiQH1cMf6dTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="188255524"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2025 15:16:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSk23-000MBy-0z;
	Fri, 20 Jun 2025 22:16:23 +0000
Date: Sat, 21 Jun 2025 06:15:43 +0800
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
Message-ID: <202506210652.ipUFDU5B-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ffcb7560b4a15faf821df95e3ab532b2b020f8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250620-100856
base:   8ffcb7560b4a15faf821df95e3ab532b2b020f8c
patch link:    https://lore.kernel.org/r/82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v5 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
config: x86_64-randconfig-123-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210652.ipUFDU5B-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210652.ipUFDU5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210652.ipUFDU5B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/ls2k-bmc-core.c:75:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *mode @@     got void [noderef] __iomem * @@
   drivers/mfd/ls2k-bmc-core.c:75:14: sparse:     expected char *mode
   drivers/mfd/ls2k-bmc-core.c:75:14: sparse:     got void [noderef] __iomem *

vim +75 drivers/mfd/ls2k-bmc-core.c

    64	
    65	/*
    66	 * Currently the Loongson-2K BMC hardware does not have an I2C interface to adapt to the
    67	 * resolution. We set the resolution by presetting "video=1280x1024-16@2M" to the BMC memory.
    68	 */
    69	static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
    70	{
    71		char *mode;
    72		int depth, ret;
    73	
    74		/* The last 16M of PCI BAR0 is used to store the resolution string. */
  > 75		mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
    76		if (!mode)
    77			return -ENOMEM;
    78	
    79		/* The resolution field starts with the flag "video=". */
    80		if (!strncmp(mode, "video=", 6))
    81			mode = mode + 6;
    82	
    83		ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
    84		if (ret)
    85			return ret;
    86	
    87		ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
    88		if (ret)
    89			return ret;
    90	
    91		ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
    92		if (ret)
    93			return ret;
    94	
    95		pd->stride = pd->width * depth / 8;
    96		pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
    97	
    98		return 0;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
