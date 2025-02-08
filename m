Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD12500D5
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029460; cv=none; b=Ma7zTIav3dRaW/uyQ34vpAT3a5R80zZNQ5RuYC/uF/+NniiqIE6WQpyDMh6I47zl9VMGgJ27VOtbjX26ta9igMipjf8cr43AgvF8zBCEGVimnWV41udi1F9ZNkjgYEwlDZHsmH5mUVHNlETB+PPruajY5c2l3BTXHSmDbeDFi50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029460; c=relaxed/simple;
	bh=uKX289DZXBrodiuuLe+VDGdc9JLFwcTJ7F1QuxisZow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=si2Omq399JVuoYVVdv2GZuffLRZbQSmibN1DVhZEpzmQIS36UH/qiSU8+tC960dKxXICrxlrxj9PHYstx7qVqsOEITTXne39lK6jnnFmZDh8PubFiiUhz8rHozXolcok5eVaSFu2OmOLTjGyp2iOXJBa8AJ9MCHZYtuunZ5WRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnsSMMYg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnsSMMYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029459; x=1770565459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKX289DZXBrodiuuLe+VDGdc9JLFwcTJ7F1QuxisZow=;
  b=QnsSMMYg6Vm8eROv2EFxcQ3/fBH1qv5Aa5SlNs0IogcK3e24LEHET0BA
   47WVlwPKAw+C9MYNsk0rgFBQw3gG89t8pWh1YNTPmWJZI8OuUbbB2pNXO
   8GFNrtOdaRY+Uo/8nEJ7dsSSfK4luZpAxYNKVYxRfaSlJQXD1xYOiqPiU
   CoGb0wieWzl3gXH0wn0xD4VxFrFFqVuqkGLg6np90vBGzovLY0TcbkAON
   QZk+kzi+H6yDOpnMdAialPRiTVfPWY/w+cGRtO9BcrWd9UcGW8LBRK2cY
   pV+0rLFl3Z6FlDOi2JEwZY61Hp9PncCGYvKNr6DuNMkekqG5bHtYybE+4
   Q==;
X-CSE-ConnectionGUID: tWLgdfRwQZ684VFJEE12GQ==
X-CSE-MsgGUID: o24AEI9PSfCXVasfVCyuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39565703"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39565703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:17 -0800
X-CSE-ConnectionGUID: ZLmaWz0AS7qyFG0bUSrIVQ==
X-CSE-MsgGUID: +oI12mA+Smi37mtrHQKO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111619576"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010EI-2b;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Baihan Li <libaihan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Yongbang Shi <shiyongbang@huawei.com>,
	Tian Tao <tiantao6@hisilicon.com>
Subject: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:163: undefined reference
 to `drm_dp_aux_init'
Message-ID: <202502082327.2Fbfy14C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6629c004b193d23612641c3607e785819e97ab
commit: 057e77972556aed4a0f1eed7eeb85024d0a22ba1 drm/hisilicon/hibmc: add dp aux in hibmc drivers
date:   5 weeks ago
config: x86_64-randconfig-r063-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082327.2Fbfy14C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082327.2Fbfy14C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082327.2Fbfy14C-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hibmc_dp_aux_init':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:163: undefined reference to `drm_dp_aux_init'


vim +163 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c

   153	
   154	void hibmc_dp_aux_init(struct hibmc_dp_dev *dp)
   155	{
   156		hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
   157		hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
   158		hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM,
   159					 HIBMC_DP_MIN_PULSE_NUM);
   160	
   161		dp->aux.transfer = hibmc_dp_aux_xfer;
   162		dp->aux.is_remote = 0;
 > 163		drm_dp_aux_init(&dp->aux);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
