Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FE17E4;
	Sat,  7 Jun 2025 05:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749275237; cv=none; b=F+EzvUHL8ydVA1IG3fSeqkYEcaBVDVJ0wKkmKXlCO3F/ssbFO+7+iB5ywa95gcj+ST214ItvIowMcju2sqMHzxqf/SxtB3HAOKIxnNe8IFm2R0YfVBNqIgYZX/6sYbEjseJRXyISs9vqThPdoXOBjXzZE5x8qgkdxKSk+X6V+SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749275237; c=relaxed/simple;
	bh=5C3lLj8+AbKhyCtUA5RyohQ8t2Ydl8exCq8AJb7blUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAdojLj58hXuadApm0aF7GO+e/gtTk57vbZPYfaCNT4K+Sa4hOVuRr4udw/RvNsRs91nmWpoD8alWCw0vmCgDAr2d+h8tpHLvM5gDf8Hnr74aowyMJ2tDV5lknkTbDjfSN95PSUXyPv4gZ+XlnKErDKaagS8eRtnd8WqTEKZSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpKLe0YW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpKLe0YW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749275236; x=1780811236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5C3lLj8+AbKhyCtUA5RyohQ8t2Ydl8exCq8AJb7blUs=;
  b=jpKLe0YWsk7j+wCMvboiQoTwyeR0yO908TV8XOTE+PlJpnW83tVQUWQ/
   ptzhbsBGFzzU+ro/MuUaGpIgMMpyCe/VJG3yQleB3qA7YzY0Oxn1qswDi
   yws44TD8+DpNIMgGXAJJDYbUc01lyRj+sj9MrMllNpzma/6oSQHn2mcYC
   FhWzwdbzcxuuxUvI0SZYwoKN9IWygdt5yNhm453UedApkpPYm4z79/M0H
   sgU+aWojU6MsvML3v97EFpgLppCdn/FY6ilgQNuYVptze1B02GwqHGQee
   fAwIkLp9xfBFOL755Ff+Drzjor4e3T/l0p/abZdYen/N/YkzI2bFNX0ic
   A==;
X-CSE-ConnectionGUID: Nz+tbCj/Sju8p7MM4rpTlw==
X-CSE-MsgGUID: rI7rWEfbQhCG12mRbZnCwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51420673"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51420673"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 22:47:15 -0700
X-CSE-ConnectionGUID: gRFQIGf+THm/L1f2j86avw==
X-CSE-MsgGUID: 1n4MLOnHQoSB0ABW7+8A9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="146528813"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2025 22:47:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNmOb-0005UP-1w;
	Sat, 07 Jun 2025 05:47:09 +0000
Date: Sat, 7 Jun 2025 13:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 2/4] mfd: rk8xx-core: allow to customize RK806 reset
 mode
Message-ID: <202506071321.Ze0gsxC0-lkp@intel.com>
References: <20250605-rk8xx-rst-fun-v2-2-143d190596dd@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-rk8xx-rst-fun-v2-2-143d190596dd@cherry.de>

Hi Quentin,

kernel test robot noticed the following build errors:

[auto build test ERROR on ec7714e4947909190ffb3041a03311a975350fe0]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/dt-bindings-mfd-rk806-allow-to-customize-PMIC-reset-mode/20250605-234243
base:   ec7714e4947909190ffb3041a03311a975350fe0
patch link:    https://lore.kernel.org/r/20250605-rk8xx-rst-fun-v2-2-143d190596dd%40cherry.de
patch subject: [PATCH v2 2/4] mfd: rk8xx-core: allow to customize RK806 reset mode
config: arc-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071321.Ze0gsxC0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071321.Ze0gsxC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071321.Ze0gsxC0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/rk8xx-core.c: In function 'rk8xx_probe':
>> drivers/mfd/rk8xx-core.c:740:42: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     740 |                                          FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
         |                                          ^~~~~~~~~~


vim +/FIELD_PREP +740 drivers/mfd/rk8xx-core.c

   694	
   695	int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap)
   696	{
   697		struct rk808 *rk808;
   698		const struct rk808_reg_data *pre_init_reg;
   699		const struct mfd_cell *cells;
   700		int dual_support = 0;
   701		int nr_pre_init_regs;
   702		u32 rst_fun = 0;
   703		int nr_cells;
   704		int ret;
   705		int i;
   706	
   707		rk808 = devm_kzalloc(dev, sizeof(*rk808), GFP_KERNEL);
   708		if (!rk808)
   709			return -ENOMEM;
   710		rk808->dev = dev;
   711		rk808->variant = variant;
   712		rk808->regmap = regmap;
   713		dev_set_drvdata(dev, rk808);
   714	
   715		switch (rk808->variant) {
   716		case RK805_ID:
   717			rk808->regmap_irq_chip = &rk805_irq_chip;
   718			pre_init_reg = rk805_pre_init_reg;
   719			nr_pre_init_regs = ARRAY_SIZE(rk805_pre_init_reg);
   720			cells = rk805s;
   721			nr_cells = ARRAY_SIZE(rk805s);
   722			break;
   723		case RK806_ID:
   724			rk808->regmap_irq_chip = &rk806_irq_chip;
   725			pre_init_reg = rk806_pre_init_reg;
   726			nr_pre_init_regs = ARRAY_SIZE(rk806_pre_init_reg);
   727			cells = rk806s;
   728			nr_cells = ARRAY_SIZE(rk806s);
   729			dual_support = IRQF_SHARED;
   730	
   731			ret = device_property_read_u32(dev, "rockchip,reset-mode", &rst_fun);
   732			if (ret) {
   733				dev_dbg(dev,
   734					"rockchip,reset-mode property missing, not setting RST_FUN\n");
   735				break;
   736			}
   737	
   738			ret = regmap_update_bits(rk808->regmap, RK806_SYS_CFG3,
   739						 RK806_RST_FUN_MSK,
 > 740						 FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
   741			if (ret)
   742				return dev_err_probe(dev, ret, "RST_FUN write err\n");
   743			break;
   744		case RK808_ID:
   745			rk808->regmap_irq_chip = &rk808_irq_chip;
   746			pre_init_reg = rk808_pre_init_reg;
   747			nr_pre_init_regs = ARRAY_SIZE(rk808_pre_init_reg);
   748			cells = rk808s;
   749			nr_cells = ARRAY_SIZE(rk808s);
   750			break;
   751		case RK816_ID:
   752			rk808->regmap_irq_chip = &rk816_irq_chip;
   753			pre_init_reg = rk816_pre_init_reg;
   754			nr_pre_init_regs = ARRAY_SIZE(rk816_pre_init_reg);
   755			cells = rk816s;
   756			nr_cells = ARRAY_SIZE(rk816s);
   757			break;
   758		case RK818_ID:
   759			rk808->regmap_irq_chip = &rk818_irq_chip;
   760			pre_init_reg = rk818_pre_init_reg;
   761			nr_pre_init_regs = ARRAY_SIZE(rk818_pre_init_reg);
   762			cells = rk818s;
   763			nr_cells = ARRAY_SIZE(rk818s);
   764			break;
   765		case RK809_ID:
   766		case RK817_ID:
   767			rk808->regmap_irq_chip = &rk817_irq_chip;
   768			pre_init_reg = rk817_pre_init_reg;
   769			nr_pre_init_regs = ARRAY_SIZE(rk817_pre_init_reg);
   770			cells = rk817s;
   771			nr_cells = ARRAY_SIZE(rk817s);
   772			break;
   773		default:
   774			dev_err(dev, "Unsupported RK8XX ID %lu\n", rk808->variant);
   775			return -EINVAL;
   776		}
   777	
   778		if (!irq)
   779			return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
   780	
   781		ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
   782					       IRQF_ONESHOT | dual_support, -1,
   783					       rk808->regmap_irq_chip, &rk808->irq_data);
   784		if (ret)
   785			return dev_err_probe(dev, ret, "Failed to add irq_chip\n");
   786	
   787		for (i = 0; i < nr_pre_init_regs; i++) {
   788			ret = regmap_update_bits(rk808->regmap,
   789						pre_init_reg[i].addr,
   790						pre_init_reg[i].mask,
   791						pre_init_reg[i].value);
   792			if (ret)
   793				return dev_err_probe(dev, ret, "0x%x write err\n",
   794						     pre_init_reg[i].addr);
   795		}
   796	
   797		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, nr_cells, NULL, 0,
   798				      regmap_irq_get_domain(rk808->irq_data));
   799		if (ret)
   800			return dev_err_probe(dev, ret, "failed to add MFD devices\n");
   801	
   802		if (device_property_read_bool(dev, "system-power-controller") ||
   803		    device_property_read_bool(dev, "rockchip,system-power-controller")) {
   804			ret = devm_register_sys_off_handler(dev,
   805					    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
   806					    &rk808_power_off, rk808);
   807			if (ret)
   808				return dev_err_probe(dev, ret,
   809						     "failed to register poweroff handler\n");
   810	
   811			switch (rk808->variant) {
   812			case RK809_ID:
   813			case RK817_ID:
   814				ret = devm_register_sys_off_handler(dev,
   815								    SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
   816								    &rk808_restart, rk808);
   817				if (ret)
   818					dev_warn(dev, "failed to register rst handler, %d\n", ret);
   819				break;
   820			default:
   821				dev_dbg(dev, "pmic controlled board reset not supported\n");
   822				break;
   823			}
   824		}
   825	
   826		return 0;
   827	}
   828	EXPORT_SYMBOL_GPL(rk8xx_probe);
   829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
