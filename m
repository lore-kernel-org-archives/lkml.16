Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2073218641;
	Tue, 27 May 2025 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748312720; cv=none; b=j1C0qJR+k7wxVdN4iTsin8iVBAUKCZrbcqM3BsIaNFUYNc9FAhz7oWhSLL2TmCfuAljlOR3cr58+lSNeQr2uKGI4as/fw/prp+ZSYnAsuZsBt4dP8sOFOsSkeYzIQmohdqOaAyUFhXITErhjSOHvjDYJIa27HmyTyuoxWwaTQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748312720; c=relaxed/simple;
	bh=uhdc5SE6c1+rkMJuVDliirxqkL0mRepvjYykzS8hZjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2drrVLXI8PbkIr1aHQIDY2oUsJ5BISouvtwUgapOLWsZlyqXfxRQmQNKqgk5dGHUYTBkh4GhbXGYZFcHUtOZb2qTugh7782jMYL41DBPy4kUr0wRxPm89OnMv5vAV8BqTYBvbNXgEcvcXSz0Wnkrt6441gUNhMTcFWouI5fAys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1SAa2F1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1SAa2F1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748312718; x=1779848718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uhdc5SE6c1+rkMJuVDliirxqkL0mRepvjYykzS8hZjw=;
  b=h1SAa2F18lvirHm5dbVFSlYXaX6bmpO7/ClpA/M4Y8yEOVqOpHgBHSfD
   FpSsLyC+L/eKkYV4ZYif8w11SeOJafdvCm0FROziqH1EdcXpvQrkzYItF
   7T5rbmkHiQmnZRBafD3H9HC9ecQaUf34+NLsxk6jIDo0+qvlHXRfZqxwj
   5F9HMFIB/tQ7Cx+r7SKXoFdQOw43GVxEIEc8uViGbQQ43f2sQY6zA5psJ
   pevIavOkrGd6pghZa1deR26sbQZHOeFKsHRT4pGHYbetF9h3TeAoS8tj5
   yPmBcsbCGwFPoTbPCcj9NmL/DJtkJ3MvullAq7dhOEzNIU+bHWDtOVlEa
   A==;
X-CSE-ConnectionGUID: yNpG6AJ+QvqS5tO1vxkniw==
X-CSE-MsgGUID: /ZXfHej1Sr26RqSr7BU5rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53941462"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="53941462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 19:25:17 -0700
X-CSE-ConnectionGUID: h1Q1B6PpQpqJ0899byqsyw==
X-CSE-MsgGUID: rr/zJefnR9C5NUaZyYgZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142515732"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 May 2025 19:25:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJk06-000Sou-0d;
	Tue, 27 May 2025 02:25:10 +0000
Date: Tue, 27 May 2025 10:24:43 +0800
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
Message-ID: <202505271032.U9jloPe6-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/dt-bindings-mfd-rk806-allow-to-customize-PMIC-reset-method/20250527-011711
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250526-rk8xx-rst-fun-v1-2-ea894d9474e0%40cherry.de
patch subject: [PATCH 2/4] mfd: rk8xx-core: allow to customize RK806 reset method
config: arm64-randconfig-003-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271032.U9jloPe6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271032.U9jloPe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271032.U9jloPe6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/rk8xx-core.c:723:3: error: expected expression
                   u32 rst_fun;
                   ^
>> drivers/mfd/rk8xx-core.c:732:60: error: use of undeclared identifier 'rst_fun'
                   ret = device_property_read_u32(dev, "rockchip,rst-fun", &rst_fun);
                                                                            ^
   drivers/mfd/rk8xx-core.c:741:37: error: use of undeclared identifier 'rst_fun'
                                            FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
                                                                          ^
   drivers/mfd/rk8xx-core.c:741:37: error: use of undeclared identifier 'rst_fun'
   drivers/mfd/rk8xx-core.c:741:37: error: use of undeclared identifier 'rst_fun'
>> drivers/mfd/rk8xx-core.c:741:7: error: passing 'void' to parameter of incompatible type 'unsigned int'
                                            FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:2: note: expanded from macro 'FIELD_PREP'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1312:42: note: passing argument to parameter 'val' here
                                        unsigned int mask, unsigned int val)
                                                                        ^
   6 errors generated.


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
 > 732			ret = device_property_read_u32(dev, "rockchip,rst-fun", &rst_fun);
   733			if (ret) {
   734				dev_dbg(dev,
   735					"rockchip,rst-fun property missing, not setting RST_FUN\n");
   736				break;
   737			}
   738	
   739			ret = regmap_update_bits(rk808->regmap, RK806_SYS_CFG3,
   740						 RK806_RST_FUN_MSK,
 > 741						 FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
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
