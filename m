Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36E01B393D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743285029; cv=none; b=PjWp8STBvNWUt6Er4lGcf+//snPjjpu0ZJYc5LDiICL82UnaoYzA1tZ+73/6wt4kl4p+6oB9c5Ei1p/Z7wCDGAxiSmbAnFiio3rtDRpke8dAtMMPlLZdibRXxPvCFfbSIcQLgcEMQlt2piWOsCC4It9Hg+ndq1KA4OCX9VHp/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743285029; c=relaxed/simple;
	bh=Bn65r9Eeocxlq0677inZdcI9j1hxm1RSNNsHDFat/rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CYOL7UoHsNewoiqQ8r5/pl6D3csXgT8rixpW1YNaCiceE7guDz7oS/BwxL4TMJBRwJHXcJdkZJw9ozzcxhzNeWGYZ/1S5MX6kQwvLSXRo9YtIHGriHKZK+vrIdF5AVbiP6A7SsbN1pbhgbortPx+OHVykx03C8Ef/pY/dvNkRZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMiq99W8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMiq99W8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743285028; x=1774821028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bn65r9Eeocxlq0677inZdcI9j1hxm1RSNNsHDFat/rc=;
  b=jMiq99W8Yae0/y0z2GSbIetGIbi5MQxry0rN4sq/f98cWQAXL8hZCoQA
   oPcBemhiKQ9F2ojfZh3nK8+tnMM8y4wDwx4ShJ390z8CeXuMUDbw/rGAa
   N59CxqhkDHtGstRclRkhTkQZJKdXuwDQTeT0gtSY1PZppWJGjZhCeEe91
   Z2tgFRntjbyMDCdx3fuUbSFFgjsTQBv5BJcDRQNXxPlSeymBeG3X+UE9V
   4+YG5VTjsDZLfWZaxN1zyacNymp3tf04F526srWAod5shtHtS7vWoKhou
   AHfGJ96ZJWUr8/UO4g/WsPSKHCrzfgXVByea/ZQsdqwhZ9iTin4ocXV3Y
   Q==;
X-CSE-ConnectionGUID: s9S7Z1PZQmia+9vub9QLsw==
X-CSE-MsgGUID: hEjCtx/4SpO82lIQc2rBHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44512467"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44512467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 14:50:27 -0700
X-CSE-ConnectionGUID: 9MsdH1MbSlWd3Wa5k8KJJg==
X-CSE-MsgGUID: WgD6vfkpT8CwmJDgRMo5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="125508563"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2025 14:50:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tye4N-0008Ng-2B;
	Sat, 29 Mar 2025 21:50:23 +0000
Date: Sun, 30 Mar 2025 05:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: drivers/mmc/host/renesas_sdhi_core.c:973:undefined reference to
 `rdev_get_drvdata'
Message-ID: <202503300554.KEiONTXz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   883ab4e47c2b514696922243e1d84b7ac36f9d3c
commit: fae80a99dc0320be854aa789cbe7ed0e1e574c61 mmc: renesas_sdhi: Add support for RZ/G3E SoC
date:   2 weeks ago
config: parisc-randconfig-002-20250330 (https://download.01.org/0day-ci/archive/20250330/202503300554.KEiONTXz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503300554.KEiONTXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503300554.KEiONTXz-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_set_voltage':
>> drivers/mmc/host/renesas_sdhi_core.c:973:(.text+0x1c40): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_enable':
   drivers/mmc/host/renesas_sdhi_core.c:939:(.text+0x1cdc): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_disable':
   drivers/mmc/host/renesas_sdhi_core.c:927:(.text+0x1d38): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_get_voltage':
   drivers/mmc/host/renesas_sdhi_core.c:961:(.text+0x1d90): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_is_enabled':
   drivers/mmc/host/renesas_sdhi_core.c:951:(.text+0x1de0): undefined reference to `rdev_get_drvdata'
   hppa-linux-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_probe':
>> drivers/mmc/host/renesas_sdhi_core.c:1177:(.text+0x24a0): undefined reference to `devm_regulator_register'


vim +973 drivers/mmc/host/renesas_sdhi_core.c

   968	
   969	static int renesas_sdhi_regulator_set_voltage(struct regulator_dev *rdev,
   970						      int min_uV, int max_uV,
   971						      unsigned int *selector)
   972	{
 > 973		struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
   974		u32 sd_status;
   975	
   976		sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
   977		if (min_uV >= 1700000 && max_uV <= 1950000) {
   978			sd_status |= SD_STATUS_IOVS;
   979			*selector = 1;
   980		} else {
   981			sd_status &= ~SD_STATUS_IOVS;
   982			*selector = 0;
   983		}
   984		sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
   985	
   986		return 0;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
