Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1471A2622
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751425506; cv=none; b=Ip1GCThov0fZ6djz7hkycoWkSPBR80yf2Hs/wmeuT57S1tcFGuT0rZjJuhk7BLKYJyaMXwz84emDbEOfQxlcZeGLvrAqMV5fqheh7K/aBlpB3xR0Q35AmUWetX8kKcs2ywHdqhtKJ5VI2Z6tNQ2C6aPZZgfSSUhJT/FM4FRKZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751425506; c=relaxed/simple;
	bh=1EtsgeEZScMfO3tNvErUUQvKAsFCtOGkIEDOJyOarb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1ETmorFJFMseuuaRKOlJTpg6SFwyWmIyzkHDyK0FrQoE4t8Ig+K0i7VIalBtfcyncljuKEfiK/8BSks1JYHXJAtXEVgbvOIAWnOsgqUiFGN7AoOcXaDzZDDWDKmJ0S2UDU/dwFTfZPLcykFQ7B9UkmPrUjBvmC5mEdGHJuvPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdr62wXl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdr62wXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751425505; x=1782961505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1EtsgeEZScMfO3tNvErUUQvKAsFCtOGkIEDOJyOarb8=;
  b=Sdr62wXlWMLpWJkcye/QPHq70Z7t1Qfw2O/SVnO9p8XUviH9kOo5lFTS
   aLYlvRQRCvdLHrJmYXoRJI/WG9zsqXuY25pWRa+2shgJQr/BcNj+5nZv5
   tdoSRO55NYoXVjaryDqtFEiONPqQu+8PtnGMhovigV4DNWVKrFHTt8L7z
   qooD2O+2rB7HBEAgvekXuS/9ygiKLUhnB/3mwv6ZcYtE9ntrtUdpiG6bm
   fwYyg6BGDBrfhTYD9L0mH7ni/GRjsmcVFzJpwusD0c+CBTAKvevP7G4HU
   P/tqK7jdQlpVgBXHcUiMMZzkcGrfuU+ZTTnLZ9ght/KrGUM71UHlhMFdf
   g==;
X-CSE-ConnectionGUID: IVDVbEbuRtGilwFijUauQA==
X-CSE-MsgGUID: 2SnvYEwBSwuzWmwp2eUgfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64756347"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="64756347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 20:05:04 -0700
X-CSE-ConnectionGUID: bL3q07nyTH6qKQMc2aQU7w==
X-CSE-MsgGUID: PWVxxvR+SpSow4SONP8LJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153570828"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jul 2025 20:05:01 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWnmM-00004z-2n;
	Wed, 02 Jul 2025 03:04:58 +0000
Date: Wed, 2 Jul 2025 11:04:28 +0800
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
Subject: Re: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function
 support
Message-ID: <202507021011.sDAHGinj-lkp@intel.com>
References: <78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3d77b3cc7cc8115d89fa14eaf601e56372953484]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250626-203353
base:   3d77b3cc7cc8115d89fa14eaf601e56372953484
patch link:    https://lore.kernel.org/r/78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507021011.sDAHGinj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021011.sDAHGinj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021011.sDAHGinj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/ls2k-bmc-core.c: In function 'ls2k_bmc_pdata_initial':
>> drivers/mfd/ls2k-bmc-core.c:349:15: error: implicit declaration of function 'acpi_register_gsi' [-Wimplicit-function-declaration]
     349 |         irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
         |               ^~~~~~~~~~~~~~~~~
>> drivers/mfd/ls2k-bmc-core.c:376:9: error: implicit declaration of function 'acpi_unregister_gsi'; did you mean 'arch_unregister_cpu'? [-Wimplicit-function-declaration]
     376 |         acpi_unregister_gsi(gsi);
         |         ^~~~~~~~~~~~~~~~~~~
         |         arch_unregister_cpu


vim +/acpi_register_gsi +349 drivers/mfd/ls2k-bmc-core.c

   326	
   327	static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, struct ls2k_bmc_pdata *priv)
   328	{
   329		int gsi = 16 + (LS2K_BMC_RESET_GPIO & 7);
   330		void __iomem *gpio_base;
   331		int irq, ret;
   332	
   333		ls2k_bmc_save_pci_data(pdev, priv);
   334	
   335		INIT_WORK(&priv->bmc_reset_work, ls2k_bmc_events_fn);
   336	
   337		ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
   338				       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", priv);
   339		if (ret) {
   340			dev_err(priv->dev, "LS2KBMC PCI-E request_irq(%d) failed\n", pdev->irq);
   341			return ret;
   342		}
   343	
   344		/*
   345		 * Since gpio_chip->to_irq is not implemented in the Loongson-3 GPIO driver,
   346		 * acpi_register_gsi() is used to obtain the GPIO irq. The GPIO interrupt is a
   347		 * watchdog interrupt that is triggered when the BMC resets.
   348		 */
 > 349		irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
   350		if (irq < 0)
   351			return irq;
   352	
   353		gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
   354		if (!gpio_base) {
   355			ret = PTR_ERR(gpio_base);
   356			goto acpi_failed;
   357		}
   358	
   359		writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(LS2K_BMC_RESET_GPIO),
   360		       gpio_base + LOONGSON_GPIO_OEN);
   361		writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(LS2K_BMC_RESET_GPIO),
   362		       gpio_base + LOONGSON_GPIO_FUNC);
   363		writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(LS2K_BMC_RESET_GPIO),
   364		       gpio_base + LOONGSON_GPIO_INTPOL);
   365		writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(LS2K_BMC_RESET_GPIO),
   366		       gpio_base + LOONGSON_GPIO_INTEN);
   367	
   368		ret = devm_request_irq(priv->dev, irq, ls2k_bmc_interrupt,
   369				       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", priv);
   370		if (ret)
   371			dev_err(priv->dev, "LS2KBMC GPIO request_irq(%d) failed\n", irq);
   372	
   373		iounmap(gpio_base);
   374	
   375	acpi_failed:
 > 376		acpi_unregister_gsi(gsi);
   377		return ret;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
