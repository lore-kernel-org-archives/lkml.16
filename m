Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1E2F852;
	Tue, 27 May 2025 01:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308336; cv=none; b=k4rHWjpKh09SkNzjIR8JDwRCnFGe32S199F3kibay0WSBhUj6gtNNo/O9HQKdHs+mh30RhHRBvK7m22FCp12xLa+BDB8ZvMFHDB3wteCzpEYDwJlLr7vP7oh6GACbHZ9bJbzJivsGNPuhAd8S06QGGD2o1e6CLXIf5J0/QVRkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308336; c=relaxed/simple;
	bh=NaabEAXMenskDJ3R96u3GW/+2mPpv4nvngHgm8i51Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdWLb6ozmhg9PuD69DZg9Njdp/oDvicA6e07ol2BlvrGenVKkkykcRKuSypILc1FO75dj07UXpoI19pyasdPNvT3yQKGJ6hSZXVjFNHFhEscNqwTdw18FtX7N0rv21caOeLCpusNLou4PVnxW6+yKl+51+XUYCfFJsWVGF3Iz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqX+eQ4S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqX+eQ4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748308335; x=1779844335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NaabEAXMenskDJ3R96u3GW/+2mPpv4nvngHgm8i51Lc=;
  b=NqX+eQ4Sn2Qk07pOzA1lxC+OlxBxdWFxDM7Krz0xyWi5SIA+648IRq5u
   0b3ZX4x5RuI/AgxcU0IMh20HBulr0Fh6vHSeXAMj63jUoKkHxeaOkec/e
   dJtxxeD23O9zH69TtK3Q1a0X7TUbHQks5G7znvwSgiPkzDmKErFOl7rOa
   ATwSn4i9B/l3BzxFuSsK2+YhaM9WI8qhTCqfD9QEHXiz1ILZwY/isBGtN
   h5D3iouKalJ0j98XHOKNgChHiM4OAGQyE71e8WRb1KIncTTbCpimgf3Ez
   uFsdVSwMG6sP+jSD/xY0Gr8YPI34moPEEGlT7koBlHIkUQqcSPLuxN23s
   A==;
X-CSE-ConnectionGUID: f76kAKRRTfGmTCmieAmVXw==
X-CSE-MsgGUID: ZOO3WVprTXm2baSuUoN6CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50441038"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="50441038"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:12:08 -0700
X-CSE-ConnectionGUID: +Fgy8SvXTX6Hb8gi2pMf3A==
X-CSE-MsgGUID: F+DAm4N9SnyoR6cqrBXwUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143026312"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2025 18:12:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJirK-000Sme-1i;
	Tue, 27 May 2025 01:12:02 +0000
Date: Tue, 27 May 2025 09:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 2/4] mfd: rk8xx-core: allow to customize RK806 reset
 method
Message-ID: <202505270807.tc7zzrMf-lkp@intel.com>
References: <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>

Hi Quentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/dt-bindings-mfd-rk806-allow-to-customize-PMIC-reset-method/20250527-011711
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250526-rk8xx-rst-fun-v1-2-ea894d9474e0%40cherry.de
patch subject: [PATCH 2/4] mfd: rk8xx-core: allow to customize RK806 reset method
config: arm-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270807.tc7zzrMf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270807.tc7zzrMf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270807.tc7zzrMf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/rk8xx-core.c:723:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     723 |                 u32 rst_fun;
         |                 ^
   1 warning generated.


vim +723 drivers/mfd/rk8xx-core.c

   694	
   695	int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap)
   696	{
   697		struct rk808 *rk808;
   698		const struct rk808_reg_data *pre_init_reg;
   699		const struct mfd_cell *cells;
   700		int dual_support = 0;
   701		int nr_pre_init_regs;
   702		int nr_cells;
   703		int ret;
   704		int i;
   705	
   706		rk808 = devm_kzalloc(dev, sizeof(*rk808), GFP_KERNEL);
   707		if (!rk808)
   708			return -ENOMEM;
   709		rk808->dev = dev;
   710		rk808->variant = variant;
   711		rk808->regmap = regmap;
   712		dev_set_drvdata(dev, rk808);
   713	
   714		switch (rk808->variant) {
   715		case RK805_ID:
   716			rk808->regmap_irq_chip = &rk805_irq_chip;
   717			pre_init_reg = rk805_pre_init_reg;
   718			nr_pre_init_regs = ARRAY_SIZE(rk805_pre_init_reg);
   719			cells = rk805s;
   720			nr_cells = ARRAY_SIZE(rk805s);
   721			break;
   722		case RK806_ID:
 > 723			u32 rst_fun;
   724	
   725			rk808->regmap_irq_chip = &rk806_irq_chip;
   726			pre_init_reg = rk806_pre_init_reg;
   727			nr_pre_init_regs = ARRAY_SIZE(rk806_pre_init_reg);
   728			cells = rk806s;
   729			nr_cells = ARRAY_SIZE(rk806s);
   730			dual_support = IRQF_SHARED;
   731	
   732			ret = device_property_read_u32(dev, "rockchip,rst-fun", &rst_fun);
   733			if (ret) {
   734				dev_dbg(dev,
   735					"rockchip,rst-fun property missing, not setting RST_FUN\n");
   736				break;
   737			}
   738	
   739			ret = regmap_update_bits(rk808->regmap, RK806_SYS_CFG3,
   740						 RK806_RST_FUN_MSK,
   741						 FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
   742			if (ret)
   743				return dev_err_probe(dev, ret, "RST_FUN write err\n");
   744			break;
   745		case RK808_ID:
   746			rk808->regmap_irq_chip = &rk808_irq_chip;
   747			pre_init_reg = rk808_pre_init_reg;
   748			nr_pre_init_regs = ARRAY_SIZE(rk808_pre_init_reg);
   749			cells = rk808s;
   750			nr_cells = ARRAY_SIZE(rk808s);
   751			break;
   752		case RK816_ID:
   753			rk808->regmap_irq_chip = &rk816_irq_chip;
   754			pre_init_reg = rk816_pre_init_reg;
   755			nr_pre_init_regs = ARRAY_SIZE(rk816_pre_init_reg);
   756			cells = rk816s;
   757			nr_cells = ARRAY_SIZE(rk816s);
   758			break;
   759		case RK818_ID:
   760			rk808->regmap_irq_chip = &rk818_irq_chip;
   761			pre_init_reg = rk818_pre_init_reg;
   762			nr_pre_init_regs = ARRAY_SIZE(rk818_pre_init_reg);
   763			cells = rk818s;
   764			nr_cells = ARRAY_SIZE(rk818s);
   765			break;
   766		case RK809_ID:
   767		case RK817_ID:
   768			rk808->regmap_irq_chip = &rk817_irq_chip;
   769			pre_init_reg = rk817_pre_init_reg;
   770			nr_pre_init_regs = ARRAY_SIZE(rk817_pre_init_reg);
   771			cells = rk817s;
   772			nr_cells = ARRAY_SIZE(rk817s);
   773			break;
   774		default:
   775			dev_err(dev, "Unsupported RK8XX ID %lu\n", rk808->variant);
   776			return -EINVAL;
   777		}
   778	
   779		if (!irq)
   780			return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
   781	
   782		ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
   783					       IRQF_ONESHOT | dual_support, -1,
   784					       rk808->regmap_irq_chip, &rk808->irq_data);
   785		if (ret)
   786			return dev_err_probe(dev, ret, "Failed to add irq_chip\n");
   787	
   788		for (i = 0; i < nr_pre_init_regs; i++) {
   789			ret = regmap_update_bits(rk808->regmap,
   790						pre_init_reg[i].addr,
   791						pre_init_reg[i].mask,
   792						pre_init_reg[i].value);
   793			if (ret)
   794				return dev_err_probe(dev, ret, "0x%x write err\n",
   795						     pre_init_reg[i].addr);
   796		}
   797	
   798		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, nr_cells, NULL, 0,
   799				      regmap_irq_get_domain(rk808->irq_data));
   800		if (ret)
   801			return dev_err_probe(dev, ret, "failed to add MFD devices\n");
   802	
   803		if (device_property_read_bool(dev, "system-power-controller") ||
   804		    device_property_read_bool(dev, "rockchip,system-power-controller")) {
   805			ret = devm_register_sys_off_handler(dev,
   806					    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
   807					    &rk808_power_off, rk808);
   808			if (ret)
   809				return dev_err_probe(dev, ret,
   810						     "failed to register poweroff handler\n");
   811	
   812			switch (rk808->variant) {
   813			case RK809_ID:
   814			case RK817_ID:
   815				ret = devm_register_sys_off_handler(dev,
   816								    SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
   817								    &rk808_restart, rk808);
   818				if (ret)
   819					dev_warn(dev, "failed to register rst handler, %d\n", ret);
   820				break;
   821			default:
   822				dev_dbg(dev, "pmic controlled board reset not supported\n");
   823				break;
   824			}
   825		}
   826	
   827		return 0;
   828	}
   829	EXPORT_SYMBOL_GPL(rk8xx_probe);
   830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
