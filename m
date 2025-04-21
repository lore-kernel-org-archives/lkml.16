Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E641F0999
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745276118; cv=none; b=QG8204f7/maVrFXGrC4UMFG2n6U6lR3kxuiLQQGtq4j1yVKmxg+9V6YB4c4raNkG3giypT4uJgDFTe/lIXY5C1h9RYNCQ7W0KKoz0fzVDVFptJOZHuToq2ddkLDx+oa48xeiKNiC5mX6w7zAQEvy3lX9qKTcvxXbh0T7XbjRn1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745276118; c=relaxed/simple;
	bh=s5oZK0gfoIAVjON8cLIhJa2prik/K/P5WJB1RT8FINM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2ycyt6VWyL1ztToyzD5tHLDvv6AyTgFPbdZrvc6YAjxRCDZOm9IlQC8WOS4cITyWOhsAf/i3NyvGWbwDCcp9hOXJ/J1D5E58TZm5ENky665FHVNnimJd8huSebYy9CoZculbzn6DM78Tm7GsVVVrMSppbh3U5VitDv4DfjKbd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioejktiL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioejktiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745276116; x=1776812116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5oZK0gfoIAVjON8cLIhJa2prik/K/P5WJB1RT8FINM=;
  b=ioejktiLdMA/ZNuS8f8/ISQfXIvWBVoL7zsKZdFjACAyFNU7t37QVg+H
   FOBqlPfoQqMSCQjCniYNlwd5ZrOmdo/H3NComtfOZ9Q/rlku31cT2rNI9
   +qYXb+R/8u6gwfGp17WxwD+jXZi5aDRb9U+j2tG/6AC4fWT6t1gr74aIb
   rkKVM7TOOc75kkONn9d2R++lBy/H6z9tGKCnOg0mniJSEobGWEbmIHBUt
   6ezUgNDxudEIGAOdhhwvxBkNEHatW7kO61hyXuPOdAYsk6HVfZo+vkLL8
   OhcWuXb+NUrqI2ZKBhH0vIKENixbv/lsWn9BhwulddWLlc4/JV3Wh2WBX
   Q==;
X-CSE-ConnectionGUID: jBkri/iHTvynVDgk/w3kRw==
X-CSE-MsgGUID: r03YxKotT2C1CxX80Y0G0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50619487"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="50619487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 15:55:16 -0700
X-CSE-ConnectionGUID: daTb5FEJQHSq3O2/3Pi99w==
X-CSE-MsgGUID: cfVtVDAySNeEC1d8dcCOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132797438"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2025 15:55:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u702h-0000S3-1B;
	Mon, 21 Apr 2025 22:55:11 +0000
Date: Tue, 22 Apr 2025 06:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/adc/ad7173.c:915:8: error: implicit declaration of
 function 'ad7173_calibrate_all'; did you mean 'ad_sd_calibrate_all'?
Message-ID: <202504220605.Y55UtCP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d7a0577c9db35c4cc52db90bc415ea248446472
commit: 031bdc8aee01b7b298159eee541844d8bff4467d iio: adc: ad7173: add calibration support
date:   4 months ago
config: sh-randconfig-r051-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220605.Y55UtCP1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220605.Y55UtCP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220605.Y55UtCP1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/ad7173.c: In function 'ad7173_setup':
>> drivers/iio/adc/ad7173.c:915:8: error: implicit declaration of function 'ad7173_calibrate_all'; did you mean 'ad_sd_calibrate_all'? [-Werror=implicit-function-declaration]
     ret = ad7173_calibrate_all(st, indio_dev);
           ^~~~~~~~~~~~~~~~~~~~
           ad_sd_calibrate_all
   drivers/iio/adc/ad7173.c: At top level:
>> drivers/iio/adc/ad7173.c:1141:14: error: 'ad7173_calibsys_ext_info' undeclared here (not in a function); did you mean 'ad7173_sigma_delta_info'?
     .ext_info = ad7173_calibsys_ext_info,
                 ^~~~~~~~~~~~~~~~~~~~~~~~
                 ad7173_sigma_delta_info
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
   Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
   Selected by [m]:
   - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m]


vim +915 drivers/iio/adc/ad7173.c

   879	
   880	static int ad7173_setup(struct iio_dev *indio_dev)
   881	{
   882		struct ad7173_state *st = iio_priv(indio_dev);
   883		struct device *dev = &st->sd.spi->dev;
   884		u8 buf[AD7173_RESET_LENGTH];
   885		unsigned int id;
   886		int ret;
   887	
   888		/* reset the serial interface */
   889		memset(buf, 0xff, AD7173_RESET_LENGTH);
   890		ret = spi_write_then_read(st->sd.spi, buf, sizeof(buf), NULL, 0);
   891		if (ret < 0)
   892			return ret;
   893	
   894		/* datasheet recommends a delay of at least 500us after reset */
   895		fsleep(500);
   896	
   897		ret = ad_sd_read_reg(&st->sd, AD7173_REG_ID, 2, &id);
   898		if (ret)
   899			return ret;
   900	
   901		id &= AD7173_ID_MASK;
   902		if (id != st->info->id)
   903			dev_warn(dev, "Unexpected device id: 0x%04X, expected: 0x%04X\n",
   904				 id, st->info->id);
   905	
   906		st->adc_mode |= AD7173_ADC_MODE_SING_CYC;
   907		st->interface_mode = 0x0;
   908	
   909		st->config_usage_counter = 0;
   910		st->config_cnts = devm_kcalloc(dev, st->info->num_configs,
   911					       sizeof(*st->config_cnts), GFP_KERNEL);
   912		if (!st->config_cnts)
   913			return -ENOMEM;
   914	
 > 915		ret = ad7173_calibrate_all(st, indio_dev);
   916		if (ret)
   917			return ret;
   918	
   919		/* All channels are enabled by default after a reset */
   920		return ad7173_disable_all(&st->sd);
   921	}
   922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
