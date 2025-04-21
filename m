Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542E33C9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745211675; cv=none; b=cJyYhCUTP6K9MJOFmjzgn3sgaPzAEl5EQjsDOuoloNSYuR0uvPPmq/sL8WpplZEtjnDDlaAcgqAS46vIrr8Vnn6OMi/6Aaep6bXbwZFoZ7i8doNpWNj8DKbZp0MJeHTNKuiMk0bABOAuwE/tcybNPGBde9RZiBIHxfc7JcF+h6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745211675; c=relaxed/simple;
	bh=q95NbMd5uytYlKBtIfqynBkFr0Czh8T+KwU3EjLLSHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6l+tJVRLibRbVIy2cdFfT8iJqd0mZ4HFhsliyf7JW644qNP+HFvY79NBTqVhgPEJpnFSdXSItu3UywCSogcfNmElN6yPii3v0fPFxF/hEWjnfB5F/bi5ZPlZrzW916YeoHqcn5BlT6tbz8BVpmNS7RoOhMvppCTqq9lenva1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aotr3Rdm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aotr3Rdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745211672; x=1776747672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q95NbMd5uytYlKBtIfqynBkFr0Czh8T+KwU3EjLLSHw=;
  b=Aotr3RdmwH2Imit6AZf4Cr01GNvctv7HWFUxA3gDYVprk3PANsOBcxLA
   j8WxGjXsC2qQgTckOBFWkoBWpYi+4YV3//sIgitoBk82nllMcAuhgd5UK
   BQWD/AESWGFX4HycliWkEE3U151ylUNldMb8pQmkoTHe4SQhxC50V1s9s
   U5t84s+Ti5zUhvX+dUQwQ4UZB587Yl/WcK4wGXLHVCf3apXWC95V0lIUo
   gjky2yNCVXG4oDO7ulh3xswLkCFpVcqhaPAcyrGEfInvVT1dm8UsGUTxm
   ELKDNhCRXK5jz4a/+hBa6VIcdhKqiO6S+JN29OkZGiJNe+vlIcSiux3+5
   A==;
X-CSE-ConnectionGUID: aJ6GrhtFTE+qoe6XlZ3f1g==
X-CSE-MsgGUID: DX36jDCMTU6mWgmgYfcpyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46749452"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46749452"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 22:01:12 -0700
X-CSE-ConnectionGUID: p4OPUaoGToaI9V0fu9DogA==
X-CSE-MsgGUID: ZQE/E9xtTdSl8Ca5XPqO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="132589845"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Apr 2025 22:01:11 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6jHI-000091-1I;
	Mon, 21 Apr 2025 05:01:08 +0000
Date: Mon, 21 Apr 2025 13:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: [tip:irq/drivers 14/14] drivers/irqchip/irq-sg2042-msi.c:101:40:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202504211251.B3aesulq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   e96b93a97c90181627cef6e70a0dbc8dbdae4adc
commit: e96b93a97c90181627cef6e70a0dbc8dbdae4adc [14/14] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
config: arm64-randconfig-r123-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211251.B3aesulq-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250421/202504211251.B3aesulq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211251.B3aesulq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/irqchip/irq-sg2042-msi.c:101:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/irqchip/irq-sg2042-msi.c:101:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/irqchip/irq-sg2042-msi.c:101:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/irqchip/irq-sg2042-msi.c:101:40: sparse:     got unsigned int [usertype] *

vim +101 drivers/irqchip/irq-sg2042-msi.c

    96	
    97	static void sg2044_msi_irq_ack(struct irq_data *d)
    98	{
    99		struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
   100	
 > 101		writel(0, (u32 *)data->reg_clr + d->hwirq);
   102		irq_chip_ack_parent(d);
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
