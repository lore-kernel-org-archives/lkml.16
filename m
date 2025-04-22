Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D925054764
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745281645; cv=none; b=GbBnzlDMaTGO8mig9jw+UCXNLwd69jEQ+uM2icnqSywamaqcdg5NAu53Iy26j4t4mKNQQSgMvBZ7TREywJOz6z+vJgkj5qcbnfV7IYpMDWtged6bG1KthYSULkYZ/LH5rw/pAAxvj4YhSlSut+ea5AsDMxxB1wspx+lkEkLSwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745281645; c=relaxed/simple;
	bh=df1+JkILuRaZuOLIWwWbDdF/n5Dp5B+YyXfzRiTELuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUIgKnfAHpMQYXViwf19ZHViSK8FMEkShpAyy9w3rEKdAq7r03SafvXdEPgxkieJxPmFiaHkV64xlu0g6+gcI+4+cb36SDQwM6d1HjrpAxds2TJxUy4QKaxZQy78n1SSuFAkewJxelCdbTzN3u1YVzHI0eYdy2tB39NibVzbdfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYw6HZ7V; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYw6HZ7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745281644; x=1776817644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=df1+JkILuRaZuOLIWwWbDdF/n5Dp5B+YyXfzRiTELuw=;
  b=BYw6HZ7VcrkCkwimOjcP7pvrAqhH4b7gtuF0k26iSet+uJ2kSY2djz53
   3EuqOjnSrf7Tv/keH38XnMf1w+DN8PfSnpNdSEhOhT23EOJsDUi5Y5eg9
   IrSgpCSb6eWjBFugs1Y21iK0XsFRVl7Q4NjCUkdGQJSNsWfojwcDqqM4Y
   lnvn+zXZkXlCo0agMMXwTX9/QchmPaGdAUmQ+QNgBfQ5clOxiS684jXh/
   49jOEMi+XSD9UHB/TvtMqjBOEP9sas+gVEltkASdNr6qt8Y/yI6GhnEnK
   LPsWG/n0J4GFsNlGANoWX4E5bRFJky3nqEmh04doRRkyvIcnX7+xMzAow
   Q==;
X-CSE-ConnectionGUID: PhZ4vW62RoCGLUYqiSh42Q==
X-CSE-MsgGUID: PR+zdCcaR7O5YOS3ZpPzcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50655770"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="50655770"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 17:27:23 -0700
X-CSE-ConnectionGUID: 9QhbScxwQKivXFE1p5wKDA==
X-CSE-MsgGUID: gL/J6Lo0SOuNC3xt1ty94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132740242"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Apr 2025 17:27:22 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u71Tr-0000Tr-21;
	Tue, 22 Apr 2025 00:27:19 +0000
Date: Tue, 22 Apr 2025 08:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>
Subject: drivers/iio/adc/ad7173.c:1091:10: error: implicit declaration of
 function 'ad4111_openwire_event'; did you mean 'acpi_enable_event'?
Message-ID: <202504220824.HVrTVov1-lkp@intel.com>
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
commit: 7530ed2aaa3f49325cad3ca80aa245897ed10e32 iio: adc: ad7173: add openwire detection support for single conversions
date:   2 months ago
config: sh-randconfig-r051-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220824.HVrTVov1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220824.HVrTVov1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220824.HVrTVov1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/ad7173.c: In function 'ad7173_setup':
   drivers/iio/adc/ad7173.c:1034:8: error: implicit declaration of function 'ad7173_calibrate_all'; did you mean 'ad_sd_calibrate_all'? [-Werror=implicit-function-declaration]
     ret = ad7173_calibrate_all(st, indio_dev);
           ^~~~~~~~~~~~~~~~~~~~
           ad_sd_calibrate_all
   drivers/iio/adc/ad7173.c: In function 'ad7173_read_raw':
>> drivers/iio/adc/ad7173.c:1091:10: error: implicit declaration of function 'ad4111_openwire_event'; did you mean 'acpi_enable_event'? [-Werror=implicit-function-declaration]
       ret = ad4111_openwire_event(indio_dev, chan);
             ^~~~~~~~~~~~~~~~~~~~~
             acpi_enable_event
   drivers/iio/adc/ad7173.c: At top level:
   drivers/iio/adc/ad7173.c:1311:14: error: 'ad7173_calibsys_ext_info' undeclared here (not in a function); did you mean 'ad7173_device_info'?
     .ext_info = ad7173_calibsys_ext_info,
                 ^~~~~~~~~~~~~~~~~~~~~~~~
                 ad7173_device_info
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
   Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
   Selected by [m]:
   - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m]


vim +1091 drivers/iio/adc/ad7173.c

  1073	
  1074	static int ad7173_read_raw(struct iio_dev *indio_dev,
  1075				   struct iio_chan_spec const *chan,
  1076				   int *val, int *val2, long info)
  1077	{
  1078		struct ad7173_state *st = iio_priv(indio_dev);
  1079		struct ad7173_channel *ch = &st->channels[chan->address];
  1080		unsigned int reg;
  1081		u64 temp;
  1082		int ret;
  1083	
  1084		switch (info) {
  1085		case IIO_CHAN_INFO_RAW:
  1086			ret = ad_sigma_delta_single_conversion(indio_dev, chan, val);
  1087			if (ret < 0)
  1088				return ret;
  1089	
  1090			if (ch->openwire_det_en) {
> 1091				ret = ad4111_openwire_event(indio_dev, chan);
  1092				if (ret < 0)
  1093					return ret;
  1094			}
  1095	
  1096			return IIO_VAL_INT;
  1097		case IIO_CHAN_INFO_SCALE:
  1098	
  1099			switch (chan->type) {
  1100			case IIO_TEMP:
  1101				temp = AD7173_VOLTAGE_INT_REF_uV * MILLI;
  1102				temp /= AD7173_TEMP_SENSIIVITY_uV_per_C;
  1103				*val = temp;
  1104				*val2 = chan->scan_type.realbits;
  1105				return IIO_VAL_FRACTIONAL_LOG2;
  1106			case IIO_VOLTAGE:
  1107				*val = ad7173_get_ref_voltage_milli(st, ch->cfg.ref_sel);
  1108				*val2 = chan->scan_type.realbits - !!(ch->cfg.bipolar);
  1109	
  1110				if (chan->channel < st->info->num_voltage_in_div)
  1111					*val *= AD4111_DIVIDER_RATIO;
  1112				return IIO_VAL_FRACTIONAL_LOG2;
  1113			case IIO_CURRENT:
  1114				*val = ad7173_get_ref_voltage_milli(st, ch->cfg.ref_sel);
  1115				*val /= AD4111_SHUNT_RESISTOR_OHM;
  1116				*val2 = chan->scan_type.realbits - ch->cfg.bipolar;
  1117				return IIO_VAL_FRACTIONAL_LOG2;
  1118			default:
  1119				return -EINVAL;
  1120			}
  1121		case IIO_CHAN_INFO_OFFSET:
  1122	
  1123			switch (chan->type) {
  1124			case IIO_TEMP:
  1125				/* 0 Kelvin -> raw sample */
  1126				temp   = -ABSOLUTE_ZERO_MILLICELSIUS;
  1127				temp  *= AD7173_TEMP_SENSIIVITY_uV_per_C;
  1128				temp <<= chan->scan_type.realbits;
  1129				temp   = DIV_U64_ROUND_CLOSEST(temp,
  1130							       AD7173_VOLTAGE_INT_REF_uV *
  1131							       MILLI);
  1132				*val   = -temp;
  1133				return IIO_VAL_INT;
  1134			case IIO_VOLTAGE:
  1135			case IIO_CURRENT:
  1136				*val = -BIT(chan->scan_type.realbits - 1);
  1137				return IIO_VAL_INT;
  1138			default:
  1139				return -EINVAL;
  1140			}
  1141		case IIO_CHAN_INFO_SAMP_FREQ:
  1142			reg = st->channels[chan->address].cfg.odr;
  1143	
  1144			*val = st->info->sinc5_data_rates[reg] / MILLI;
  1145			*val2 = (st->info->sinc5_data_rates[reg] % MILLI) * (MICRO / MILLI);
  1146	
  1147			return IIO_VAL_INT_PLUS_MICRO;
  1148		default:
  1149			return -EINVAL;
  1150		}
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
