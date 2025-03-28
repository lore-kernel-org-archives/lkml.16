Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE51A0730
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743198245; cv=none; b=im9FPquKLkFAjFSGzcj2FZ8VuTKHs/tUGmnrQMLdSVswMjBPLGi97g8DH6J//E6nkCrsTge3QrbGUmUwJuAvRQiklaMJcD3GNzxq7YZQcZHdCZtDmPs52NEHg02JqlgubYYuZeAPN0DyOJmaLS3nttZ6p7I+Ep9v++7XcuXp4ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743198245; c=relaxed/simple;
	bh=K8QwnPCRvYtUI1e1zv9soCexvnfiUZcQD5Hcno7fJ1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4vAXVdG8HxVihT10IN8Mgwuf9QfOwlYaUq5k2me4zPYrEXMMrE/HnYWaLMnUYYIXlqGsNpM+GVew7MhEKF9Gq+n0E9CuuwsFu8dqO3Mm8fxY1Pj1KIeA9OZcuwtM24rYQkHDXW69tzhjdZUsQ8EfYcoMO+8Mad9VvkrpibFA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQXH5tUZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQXH5tUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743198243; x=1774734243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8QwnPCRvYtUI1e1zv9soCexvnfiUZcQD5Hcno7fJ1M=;
  b=lQXH5tUZDzAbUaFBItfQnY/H8xyU2Ev/ukJJdoAphXIdmQ4BCa9LpfcV
   FmCShoMJXxMzu8Ow6D4lMDG4T782RBDZ1jtEHnRKabgOOIcrnKXD794gB
   wNAMj+KPEgkzbt8EjVm6Or2Y6FHvEJczVuhMN0J35Xhkf3rnpIEflpQ/d
   SmANQO+9BsLxPnkI8gghqUZwi828Z3x5MFFbAhuyL2/JmV7iCJLhWMhYr
   wg2LKCWIneAZkIeBhl55gN8zvzIPoCovpt5MWl5BWOhAtNCN6c4aWURwN
   t7Cdtv82fB7EGEAxtp3q94y4TFZ9BccTALzqBifV5du3n4RPKpofcwmYv
   Q==;
X-CSE-ConnectionGUID: dyiAW4ykQPS5BDwcKbm7ug==
X-CSE-MsgGUID: I/Fw7nITSNqa7lUU29+x/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44699338"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="44699338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 14:44:02 -0700
X-CSE-ConnectionGUID: MHDby7SdTw2Ge60ti0gIjA==
X-CSE-MsgGUID: 1aYqkLGwQKGQmNMKXO9X7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="130251516"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2025 14:44:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyHUd-0007iw-00;
	Fri, 28 Mar 2025 21:43:59 +0000
Date: Sat, 29 Mar 2025 05:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Message-ID: <202503290554.zASQT70Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acb4f33713b9f6cadb6143f211714c343465411c
commit: fae80a99dc0320be854aa789cbe7ed0e1e574c61 mmc: renesas_sdhi: Add support for RZ/G3E SoC
date:   2 weeks ago
config: arm-randconfig-r111-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290554.zASQT70Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250329/202503290554.zASQT70Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290554.zASQT70Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_is_enabled':
>> drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to `rdev_get_drvdata'
   arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_get_voltage':
   drivers/mmc/host/renesas_sdhi_core.c:961: undefined reference to `rdev_get_drvdata'
   arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_disable':
   drivers/mmc/host/renesas_sdhi_core.c:927: undefined reference to `rdev_get_drvdata'
   arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_enable':
   drivers/mmc/host/renesas_sdhi_core.c:939: undefined reference to `rdev_get_drvdata'
   arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_regulator_set_voltage':
   drivers/mmc/host/renesas_sdhi_core.c:973: undefined reference to `rdev_get_drvdata'
   arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in function `renesas_sdhi_probe':
>> drivers/mmc/host/renesas_sdhi_core.c:1177: undefined reference to `devm_regulator_register'


vim +951 drivers/mmc/host/renesas_sdhi_core.c

   948	
   949	static int renesas_sdhi_regulator_is_enabled(struct regulator_dev *rdev)
   950	{
 > 951		struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
   952		u32 sd_status;
   953	
   954		sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
   955	
   956		return (sd_status & SD_STATUS_PWEN) ? 1 : 0;
   957	}
   958	
   959	static int renesas_sdhi_regulator_get_voltage(struct regulator_dev *rdev)
   960	{
 > 961		struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
   962		u32 sd_status;
   963	
   964		sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
   965	
   966		return (sd_status & SD_STATUS_IOVS) ? 1800000 : 3300000;
   967	}
   968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
