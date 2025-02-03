Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D61F92A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738621297; cv=none; b=o+ZEXvGpND36dLhIiMKjqi8V4LVPNz18VPslWx4Ai8nprFFHkn0Vyt7eO4AJ+Um58hFXypCc4PefGE4dybPUpEE4clbuvol9I7jdA/05uAvfrTqK7nH6Ru8obp8p4zP+tJ4ZnKfWQxDf2f80BjS0xIERpHB4EBqMGtT7keWy8/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738621297; c=relaxed/simple;
	bh=/EJ+ed0+VuuI/fWH4wFoSSIJVc4+KrxHNenDGGxHcHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3/9l9febuPsYMNvenIuccYNSv7udRressMLBnxgUr6fxP2nGu21wfdZWWlvU7XX49+h5mc77skYnaKci0JzVivF8sQ5/hBlMmFPT78XhVIAaU0UFRBSTtAAtHIQg5SpWt1w4vQabDSEcArLTRrX0YwKRHTWC+m4367AwRzrIIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baifwnYd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baifwnYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738621295; x=1770157295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EJ+ed0+VuuI/fWH4wFoSSIJVc4+KrxHNenDGGxHcHA=;
  b=baifwnYdagZjJ2pN6OA8upEqDT2/hq5+zXuV384zaeLUCbPgvitu5p9c
   ktZmr0I3Ou2tumpurz95/CoX64Bs6sWGZPTFpdYyh7fG1WOjsWXBTku77
   qDR6rSLfidfa3jKqvu+7NqMv9M6LrAU+MPjqNlyAH+vCwbZ64ayCYwOQH
   6Y2c5RBtiRo4whDGhwgP1CHamTzXsLqEc+qmwXmIXRELE96raOo9yr/Vl
   znqJHsIQkEuUCDYy+k6oQW8qz6vZm+5fZx1zQ72YW79Y/RtmKZgGQvvmu
   1o9wXIrz2EmWsRS8luWPLdlqemc2zLlmZrmxPGzl/VKAO5v0ypAy4CCcf
   Q==;
X-CSE-ConnectionGUID: IXrLDSz0T/y6hqhhdOpmOA==
X-CSE-MsgGUID: wtoN4WztQ4yekhJU3RVH0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42784103"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="42784103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 14:21:34 -0800
X-CSE-ConnectionGUID: ozGa1ZXOR2ipfQ1nOAayJQ==
X-CSE-MsgGUID: dJxsB9kdQQyvx4OEMla4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133666338"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 14:21:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf4or-000rbC-08;
	Mon, 03 Feb 2025 22:21:29 +0000
Date: Tue, 4 Feb 2025 06:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: drivers/pci/controller/dwc/pci-dra7xx.c:651:55: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 2
Message-ID: <202502040600.Vfb0UIdO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f286757b644c226b6b31779da95a4fa7ab245ef5
commit: 266744faec8c197dcc86ba2f24951a69dc4d3671 phy: ti: Don't depend on OMAP_OCP2SCP
date:   6 years ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502040600.Vfb0UIdO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040600.Vfb0UIdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040600.Vfb0UIdO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_probe':
>> drivers/pci/controller/dwc/pci-dra7xx.c:651:55: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
     651 |                 snprintf(name, sizeof(name), "pcie-phy%d", i);
         |                                                       ^~
   drivers/pci/controller/dwc/pci-dra7xx.c:651:46: note: directive argument in the range [0, 2147483647]
     651 |                 snprintf(name, sizeof(name), "pcie-phy%d", i);
         |                                              ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:651:17: note: 'snprintf' output between 10 and 19 bytes into a destination of size 10
     651 |                 snprintf(name, sizeof(name), "pcie-phy%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +651 drivers/pci/controller/dwc/pci-dra7xx.c

f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  585  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  586  static int __init dra7xx_pcie_probe(struct platform_device *pdev)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  587  {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  588  	u32 reg;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  589  	int ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  590  	int irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  591  	int i;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  592  	int phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  593  	struct phy **phy;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  594  	struct device_link **link;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  595  	void __iomem *base;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  596  	struct resource *res;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  597  	struct dw_pcie *pci;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  598  	struct dra7xx_pcie *dra7xx;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  599  	struct device *dev = &pdev->dev;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  600  	struct device_node *np = dev->of_node;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  601  	char name[10];
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  602  	struct gpio_desc *reset;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  603  	const struct of_device_id *match;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  604  	const struct dra7xx_pcie_of_data *data;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  605  	enum dw_pcie_device_mode mode;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  606  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  607  	match = of_match_device(of_match_ptr(of_dra7xx_pcie_match), dev);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  608  	if (!match)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  609  		return -EINVAL;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  610  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  611  	data = (struct dra7xx_pcie_of_data *)match->data;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  612  	mode = (enum dw_pcie_device_mode)data->mode;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  613  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  614  	dra7xx = devm_kzalloc(dev, sizeof(*dra7xx), GFP_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  615  	if (!dra7xx)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  616  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  617  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  618  	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  619  	if (!pci)
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  620  		return -ENOMEM;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  621  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  622  	pci->dev = dev;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  623  	pci->ops = &dw_pcie_ops;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  624  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  625  	irq = platform_get_irq(pdev, 0);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  626  	if (irq < 0) {
a0d21ba120d2c7 drivers/pci/dwc/pci-dra7xx.c            Gustavo A. R. Silva    2017-08-09  627  		dev_err(dev, "missing IRQ resource: %d\n", irq);
a0d21ba120d2c7 drivers/pci/dwc/pci-dra7xx.c            Gustavo A. R. Silva    2017-08-09  628  		return irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  629  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  630  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  631  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ti_conf");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  632  	base = devm_ioremap_nocache(dev, res->start, resource_size(res));
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  633  	if (!base)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  634  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  635  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  636  	phy_count = of_property_count_strings(np, "phy-names");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  637  	if (phy_count < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  638  		dev_err(dev, "unable to find the strings\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  639  		return phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  640  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  641  
a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook              2018-06-12  642  	phy = devm_kcalloc(dev, phy_count, sizeof(*phy), GFP_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  643  	if (!phy)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  644  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  645  
a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook              2018-06-12  646  	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  647  	if (!link)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  648  		return -ENOMEM;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  649  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  650  	for (i = 0; i < phy_count; i++) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22 @651  		snprintf(name, sizeof(name), "pcie-phy%d", i);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  652  		phy[i] = devm_phy_get(dev, name);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  653  		if (IS_ERR(phy[i]))
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  654  			return PTR_ERR(phy[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  655  
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  656  		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  657  		if (!link[i]) {
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  658  			ret = -EINVAL;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  659  			goto err_link;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  660  		}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  661  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  662  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  663  	dra7xx->base = base;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  664  	dra7xx->phy = phy;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  665  	dra7xx->pci = pci;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  666  	dra7xx->phy_count = phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  667  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  668  	ret = dra7xx_pcie_enable_phy(dra7xx);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  669  	if (ret) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  670  		dev_err(dev, "failed to enable phy\n");
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  671  		return ret;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  672  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  673  
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  674  	platform_set_drvdata(pdev, dra7xx);
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  675  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  676  	pm_runtime_enable(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  677  	ret = pm_runtime_get_sync(dev);
d3f4caa355c1c9 drivers/pci/host/pci-dra7xx.c           Fabio Estevam          2015-08-20  678  	if (ret < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  679  		dev_err(dev, "pm_runtime_get_sync failed\n");
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  680  		goto err_get_sync;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  681  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  682  
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  683  	reset = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  684  	if (IS_ERR(reset)) {
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  685  		ret = PTR_ERR(reset);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  686  		dev_err(&pdev->dev, "gpio request failed, ret %d\n", ret);
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  687  		goto err_gpio;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  688  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  689  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  690  	reg = dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE_CMD);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  691  	reg &= ~LTSSM_EN;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  692  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE_CMD, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  693  
ab5fe4f4d31ee2 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  694  	dra7xx->link_gen = of_pci_get_max_link_speed(np);
ab5fe4f4d31ee2 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  695  	if (dra7xx->link_gen < 0 || dra7xx->link_gen > 2)
ab5fe4f4d31ee2 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  696  		dra7xx->link_gen = 2;
ab5fe4f4d31ee2 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  697  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  698  	switch (mode) {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  699  	case DW_PCIE_RC_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  700  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_HOST)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  701  			ret = -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  702  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  703  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  704  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  705  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  706  				   DEVICE_TYPE_RC);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  707  
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  708  		ret = dra7xx_pcie_unaligned_memaccess(dev);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  709  		if (ret)
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  710  			dev_err(dev, "WA for Errata i870 not applied\n");
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  711  
23926c8dbd6fdc drivers/pci/host/pci-dra7xx.c           Jingoo Han             2014-11-06  712  		ret = dra7xx_add_pcie_port(dra7xx, pdev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  713  		if (ret < 0)
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  714  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  715  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  716  	case DW_PCIE_EP_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  717  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_EP)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  718  			ret = -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  719  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  720  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  721  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  722  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  723  				   DEVICE_TYPE_EP);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  724  
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  725  		ret = dra7xx_pcie_unaligned_memaccess(dev);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  726  		if (ret)
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  727  			goto err_gpio;
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  728  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  729  		ret = dra7xx_add_pcie_ep(dra7xx, pdev);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  730  		if (ret < 0)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  731  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  732  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  733  	default:
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  734  		dev_err(dev, "INVALID device type %d\n", mode);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  735  	}
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  736  	dra7xx->mode = mode;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  737  
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  738  	ret = devm_request_irq(dev, irq, dra7xx_pcie_irq_handler,
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  739  			       IRQF_SHARED, "dra7xx-pcie-main", dra7xx);
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  740  	if (ret) {
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  741  		dev_err(dev, "failed to request irq\n");
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  742  		goto err_gpio;
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  743  	}
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  744  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  745  	return 0;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  746  
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  747  err_gpio:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  748  	pm_runtime_put(dev);
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  749  
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  750  err_get_sync:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  751  	pm_runtime_disable(dev);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  752  	dra7xx_pcie_disable_phy(dra7xx);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  753  
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  754  err_link:
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  755  	while (--i >= 0)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  756  		device_link_del(link[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  757  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  758  	return ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  759  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  760  

:::::: The code at line 651 was first introduced by commit
:::::: 47ff3de911a728cdf9ecc6ad777131902cff62b4 PCI: dra7xx: Add TI DRA7xx PCIe driver

:::::: TO: Kishon Vijay Abraham I <kishon@ti.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
