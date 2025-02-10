Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2D23956A;
	Mon, 10 Feb 2025 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214908; cv=none; b=XtdoHdUK+AfZrgRKJW4AZ5o3IEmL7ZKLVdIiZZ2/NNCnZ8C3j1OojCA2A4twyceJIQlZSItcjG5jJwueRm/cayA7kQmhB8yNN0UReDmVfootVrRo8C4gd8tBmda3jzYQ2rd2RHFwVEWhiIoMNT3M4U48y4zpHWsX7q4bRLKCZws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214908; c=relaxed/simple;
	bh=/aMMsS9mJ8sJR4IqQLucrnmGeKfxLXDoIGkeGo8HO5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/Q2kJWh+qdpDf67Pzr8UUdoY/s88mcmRqip7jYpjgJJ9UJqiPTVnh43BKWEM4kaQgftRMzepIJrrse+YEcAd27FrJV2ZfcwK/qo2/y5S/LsSbeFhQ9khbWQv2/iQ8FvdGudEKvVDwPZWbNXnExNxP87tuJHj8QpiZyCRIRoi6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHgDoDyI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHgDoDyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739214906; x=1770750906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/aMMsS9mJ8sJR4IqQLucrnmGeKfxLXDoIGkeGo8HO5E=;
  b=dHgDoDyIlbKZ2zFPuQWCZwxkNVsBbV6LNBlFfilvuInO+vzrM5AAlGYG
   MmJkHUJ5LVCid8oOu9XtkT/yXgYYJh6aIJjljxtBgtjJdOv7pxxB77xQ0
   ABCFB3+6zbTHtZ2WdVDvY8r+QUZdFeTk2E+ikF3yDvL14S0CMtOEaJU8H
   2H4QfiJryW2oikoPjURRpo/1vk9e1JAUuHl94kpizkmrxrdBEGRr9WpwB
   Ao6SETfE9T6hn+7zx25gk/JcLtrEO/NK3+hRdQMuV2WViIbWWNv+zSEGx
   UlrzB21LmqdEnkMSRLzGhf43W+JxPdpuCri1e8fqmSC4t+COpl1eNV+6w
   Q==;
X-CSE-ConnectionGUID: gY9LaD+GTFuMbyg/dNE9AQ==
X-CSE-MsgGUID: s2XdwkKwQ2G1bZIoBnnxsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39051380"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39051380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 11:15:06 -0800
X-CSE-ConnectionGUID: QXIBf4T4QqOgt3GBCEBhiA==
X-CSE-MsgGUID: fFXPYPHnR1uOubYv+b2Ejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="117359660"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2025 11:15:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thZFE-0013F9-25;
	Mon, 10 Feb 2025 19:15:00 +0000
Date: Tue, 11 Feb 2025 03:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Celine Joy A. Capua" <celinejoy.capua@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	"Celine Joy A. Capua" <celinejoy.capua@analog.com>
Subject: Re: [PATCH 1/2] regulator: ltc7871: Add driver for LTC7871
Message-ID: <202502110205.DShIOHH0-lkp@intel.com>
References: <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-staging-ltc7871-v1-1-c593ad86aab2@analog.com>

Hi Celine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fff64b15e3d1e9bd9246db1f5e0b84e7e561b79f]

url:    https://github.com/intel-lab-lkp/linux/commits/Celine-Joy-A-Capua/regulator-ltc7871-Add-driver-for-LTC7871/20250210-103432
base:   fff64b15e3d1e9bd9246db1f5e0b84e7e561b79f
patch link:    https://lore.kernel.org/r/20250210-staging-ltc7871-v1-1-c593ad86aab2%40analog.com
patch subject: [PATCH 1/2] regulator: ltc7871: Add driver for LTC7871
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250211/202502110205.DShIOHH0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110205.DShIOHH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110205.DShIOHH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/ltc7871-regulator.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/ltc7871-regulator.c:318:6: warning: variable 'val2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     318 |         if (!ret) {
         |             ^~~~
   drivers/regulator/ltc7871-regulator.c:328:63: note: uninitialized use occurs here
     328 |         return ltc7871_reg_write(chip->spi, LTC7871_REG_SSFM, val1 | val2);
         |                                                                      ^~~~
   drivers/regulator/ltc7871-regulator.c:318:2: note: remove the 'if' if its condition is always true
     318 |         if (!ret) {
         |         ^~~~~~~~~
   drivers/regulator/ltc7871-regulator.c:225:16: note: initialize the variable 'val2' to silence this warning
     225 |         int val1, val2;
         |                       ^
         |                        = 0
   4 warnings generated.


vim +318 drivers/regulator/ltc7871-regulator.c

   221	
   222	static int ltc7871_parse_fw(struct ltc7871 *chip)
   223	{
   224		int reg, ret;
   225		int val1, val2;
   226	
   227		/* Setting default values based on datasheet and DC2886A Schematic */
   228		chip->idac_setcur_uA = 0;
   229		chip->freq_spread_percentage = "+-12%";
   230		chip->switching_freq_divider = 512;
   231		chip->enable_chip_ctrl_wp = 0;
   232		chip->ra_ext = 10000;
   233		chip->rb_ext = 107000;
   234		chip->rc_ext = 12700;
   235		chip->rd_ext = 499000;
   236	
   237		ret = device_property_read_u32(&chip->spi->dev, "adi,ra-external-ohms",
   238					 &chip->ra_ext);
   239		if (!ret) {
   240			if (!chip->ra_ext)
   241				return -EINVAL;
   242		}
   243	
   244		ret = device_property_read_u32(&chip->spi->dev, "adi,rb-external-ohms",
   245					 &chip->rb_ext);
   246		if (!ret) {
   247			if (!chip->rb_ext)
   248				return -EINVAL;
   249		}
   250	
   251		ret = device_property_read_u32(&chip->spi->dev, "adi,rc-external-ohms",
   252					 &chip->rc_ext);
   253		if (!ret) {
   254			if (!chip->rc_ext)
   255				return -EINVAL;
   256		}
   257	
   258		ret = device_property_read_u32(&chip->spi->dev, "adi,rd-external-ohms",
   259					 &chip->rd_ext);
   260		if (!ret) {
   261			if (!chip->rd_ext)
   262				return -EINVAL;
   263		}
   264	
   265		ret = ltc7871_reg_read(chip->spi, LTC7871_REG_CONFIG2, &reg);
   266		if (ret < 0)
   267			return ret;
   268	
   269		chip->regulator_mode = FIELD_GET(LTC7871_MASK_CONFIG2_BUCK_BOOST, reg);
   270	
   271		if (chip->regulator_mode) {
   272			chip->r1 = chip->ra_ext;
   273			chip->r2 = chip->rb_ext;
   274		} else {
   275			chip->r1 = chip->rc_ext;
   276			chip->r2 = chip->rd_ext;
   277		}
   278		chip->min_vol = _ltc7871_dac_to_uV(chip, LTC7871_IDAC_MAX);
   279		chip->max_vol = _ltc7871_dac_to_uV(chip, LTC7871_IDAC_MIN);
   280	
   281		ret = ltc7871_reg_read(chip->spi, LTC7871_REG_CHIP_CTRL, &reg);
   282		if (ret < 0)
   283			return ret;
   284	
   285		chip->enable_chip_ctrl_wp = device_property_read_bool(&chip->spi->dev,
   286							"adi,enable-chip-ctrl-wp");
   287		val1 = FIELD_PREP(LTC7871_MASK_CHIP_CTRL_WP, chip->enable_chip_ctrl_wp) | reg;
   288		ret = ltc7871_reg_write(chip->spi, LTC7871_REG_CHIP_CTRL, val1);
   289		if (ret)
   290			return ret;
   291	
   292		ret = device_property_read_u32(&chip->spi->dev, "adi,idac-setcur-microamp",
   293					 &chip->idac_setcur_uA);
   294		if (!ret) {
   295			if (chip->idac_setcur_uA < LTC7871_IDAC_MIN ||
   296			    chip->idac_setcur_uA > LTC7871_IDAC_MAX) {
   297				return -EINVAL;
   298			}
   299	
   300			ret = ltc7871_reg_write(chip->spi, LTC7871_REG_SETCUR,
   301						chip->idac_setcur_uA);
   302			if (ret)
   303				return ret;
   304		}
   305		ret = device_property_match_property_string(&chip->spi->dev,
   306				"adi,freq-spread-percentage",
   307				ltc7871_freq_spread_percentage,
   308				ARRAY_SIZE(ltc7871_freq_spread_percentage));
   309	
   310		if (ret >= 0)
   311			val1 = FIELD_PREP(LTC7871_MASK_SSFM_FREQ_SPREAD, ret);
   312		else
   313			val1 = 0;
   314	
   315		ret = device_property_read_u32(&chip->spi->dev,
   316					       "adi,switching-freq-divider",
   317					       &chip->switching_freq_divider);
 > 318		if (!ret) {
   319			ret = ltc7871_get_prop_index(ltc7871_switching_freq_divider,
   320						     ARRAY_SIZE(ltc7871_switching_freq_divider),
   321						     chip->switching_freq_divider);
   322			if (ret < 0)
   323				return ret;
   324	
   325			val2 = FIELD_PREP(LTC7871_MASK_SSFM_MOD_SIG_FREQ, ret);
   326		}
   327	
   328		return ltc7871_reg_write(chip->spi, LTC7871_REG_SSFM, val1 | val2);
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
