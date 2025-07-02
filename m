Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0691A3150
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 03:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751425507; cv=none; b=GAMZg5nmnRgd35RBImYajtiBbQ2G3mgEQ1TkaJXD/sM+eFo1Vd1gJpl4EcWcMJ5nArjMyKa85Hi6/IrlGNLwOxImSu17G3fXNo90ccKIACjkRUBQ2X1RHFfjFOK2WihrfTuO0wpQi1zmhlNdGeFK/HhWTzhBl+nJNhP6zdGoyP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751425507; c=relaxed/simple;
	bh=lAOYCU43eb4l1drQe+wvtTLqUIjm8W1d/yIUVzUBd74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgkpqBIaWBoh+B/PTAUUnuSaluwXBugU88t7H7T3uK2RqRICzEvFLxhqvTSj4rAGkxKybuajOmzz60GkHgIrYVYrE0RUIlSWWBp6SqdK9/fTvz8fN5Z6dLuED1ajLjFnt5aZIg/5b+Ttpwdz5udZAzQI++Nx1WRzTYsYULTT3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU86H/zH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU86H/zH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751425505; x=1782961505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lAOYCU43eb4l1drQe+wvtTLqUIjm8W1d/yIUVzUBd74=;
  b=UU86H/zHJxjF0DNVGXyzFVS3VNGut5WnI/suqu9IGmU2DyPcXPXVlcde
   uO7hiVd/M7bz2eNjhoFPyrNiIyhMQWF1JKES9o3MwHsAgxaGIyctgPZ8D
   7qTjZS+0ggBQZyVYKWDRav01ETaq10gjQ7vHAzhTTJOr2t8/kMQgheFYV
   mEtWAsuEXfcqDJTLrV91dlJSYIH4kkNyMSasrFsdGDb/jNmsf0bFAHo02
   sy1lSTXIWmZZ+RU/O0q3/arDyKMaHJ9FxKszElDmPEBzKCbgpv5WoYDoL
   ezRPERR+PPquEMDbGhcS3/VA9NgTmCaegcvs2QA7RgSmALfow6pkqrMp0
   g==;
X-CSE-ConnectionGUID: dsaqFPgnQDyaiGfN76z4Og==
X-CSE-MsgGUID: 9r/TXUbhSgKkRA76NDBm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79149004"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="79149004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 20:05:05 -0700
X-CSE-ConnectionGUID: 9BmYwSksS9m21cmnzTp60A==
X-CSE-MsgGUID: KSIgD+h4QtGFx+suSFp4bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="158206911"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2025 20:05:01 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWnmM-00004x-2j;
	Wed, 02 Jul 2025 03:04:58 +0000
Date: Wed, 2 Jul 2025 11:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Levi Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device
 mode on target CPU
Message-ID: <202507021259.wYmjhqn4-lkp@intel.com>
References: <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1@arm.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 66701750d5565c574af42bef0b789ce0203e3071]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yan/coresight-Change-device-mode-to-atomic-type/20250701-230354
base:   66701750d5565c574af42bef0b789ce0203e3071
patch link:    https://lore.kernel.org/r/20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1%40arm.com
patch subject: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device mode on target CPU
config: arm-u8500_defconfig (https://download.01.org/0day-ci/archive/20250702/202507021259.wYmjhqn4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021259.wYmjhqn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021259.wYmjhqn4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-etm3x-core.c: In function 'etm_enable':
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:545:29: warning: unused variable 'drvdata' [-Wunused-variable]
     545 |         struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
         |                             ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c: At top level:
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: warning: 'struct etmv4_drvdata' declared inside parameter list will not be visible outside of this definition or declaration
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c: In function 'etm_disable_hw':
   drivers/hwtracing/coresight/coresight-etm3x-core.c:564:45: error: invalid use of undefined type 'struct etmv4_drvdata'
     564 |         struct etm_config *config = &drvdata->config;
         |                                             ^~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:565:49: error: invalid use of undefined type 'struct etmv4_drvdata'
     565 |         struct coresight_device *csdev = drvdata->csdev;
         |                                                 ^~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:567:26: error: invalid use of undefined type 'struct etmv4_drvdata'
     567 |         CS_UNLOCK(drvdata->csa.base);
         |                          ^~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:568:22: error: passing argument 1 of 'etm_set_prog' from incompatible pointer type [-Wincompatible-pointer-types]
     568 |         etm_set_prog(drvdata);
         |                      ^~~~~~~
         |                      |
         |                      struct etmv4_drvdata *
   drivers/hwtracing/coresight/coresight-etm3x-core.c:154:46: note: expected 'struct etm_drvdata *' but argument is of type 'struct etmv4_drvdata *'
     154 | static void etm_set_prog(struct etm_drvdata *drvdata)
         |                          ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:571:45: error: passing argument 1 of 'etm_readl' from incompatible pointer type [-Wincompatible-pointer-types]
     571 |         config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
         |                                             ^~~~~~~
         |                                             |
         |                                             struct etmv4_drvdata *
   In file included from drivers/hwtracing/coresight/coresight-etm3x-core.c:33:
   drivers/hwtracing/coresight/coresight-etm.h:267:58: note: expected 'struct etm_drvdata *' but argument is of type 'struct etmv4_drvdata *'
     267 | static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
         |                                      ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:573:32: error: invalid use of undefined type 'struct etmv4_drvdata'
     573 |         for (i = 0; i < drvdata->nr_cntr; i++)
         |                                ^~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:574:49: error: passing argument 1 of 'etm_readl' from incompatible pointer type [-Wincompatible-pointer-types]
     574 |                 config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
         |                                                 ^~~~~~~
         |                                                 |
         |                                                 struct etmv4_drvdata *
   drivers/hwtracing/coresight/coresight-etm.h:267:58: note: expected 'struct etm_drvdata *' but argument is of type 'struct etmv4_drvdata *'
     267 | static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
         |                                      ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:576:24: error: passing argument 1 of 'etm_set_pwrdwn' from incompatible pointer type [-Wincompatible-pointer-types]
     576 |         etm_set_pwrdwn(drvdata);
         |                        ^~~~~~~
         |                        |
         |                        struct etmv4_drvdata *
   drivers/hwtracing/coresight/coresight-etm3x-core.c:61:48: note: expected 'struct etm_drvdata *' but argument is of type 'struct etmv4_drvdata *'
      61 | static void etm_set_pwrdwn(struct etm_drvdata *drvdata)
         |                            ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:579:24: error: invalid use of undefined type 'struct etmv4_drvdata'
     579 |         CS_LOCK(drvdata->csa.base);
         |                        ^~
   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/coresight/coresight-etm3x-core.c:12:
   drivers/hwtracing/coresight/coresight-etm3x-core.c:581:25: error: invalid use of undefined type 'struct etmv4_drvdata'
     581 |         dev_dbg(&drvdata->csdev->dev,
         |                         ^~
   include/linux/dev_printk.h:139:44: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:581:9: note: in expansion of macro 'dev_dbg'
     581 |         dev_dbg(&drvdata->csdev->dev,
         |         ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:582:59: error: invalid use of undefined type 'struct etmv4_drvdata'
     582 |                 "cpu: %d disable smp call done\n", drvdata->cpu);
         |                                                           ^~
   include/linux/dev_printk.h:139:56: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                        ^~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:581:9: note: in expansion of macro 'dev_dbg'
     581 |         dev_dbg(&drvdata->csdev->dev,
         |         ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c: In function 'etm_disable_hw_smp_call':
   drivers/hwtracing/coresight/coresight-etm3x-core.c:589:24: error: passing argument 1 of 'etm_disable_hw' from incompatible pointer type [-Wincompatible-pointer-types]
     589 |         etm_disable_hw(drvdata);
         |                        ^~~~~~~
         |                        |
         |                        struct etmv_drvdata *
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:50: note: expected 'struct etmv4_drvdata *' but argument is of type 'struct etmv_drvdata *'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:591:35: error: invalid use of undefined type 'struct etmv_drvdata'
     591 |         coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
         |                                   ^~
   drivers/hwtracing/coresight/coresight-etm3x-core.c: In function 'etm_dying_cpu':
   drivers/hwtracing/coresight/coresight-etm3x-core.c:729:42: error: passing argument 1 of 'etm_disable_hw' from incompatible pointer type [-Wincompatible-pointer-types]
     729 |                 etm_disable_hw(etmdrvdata[cpu]);
         |                                ~~~~~~~~~~^~~~~
         |                                          |
         |                                          struct etm_drvdata *
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:50: note: expected 'struct etmv4_drvdata *' but argument is of type 'struct etm_drvdata *'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +/drvdata +545 drivers/hwtracing/coresight/coresight-etm3x-core.c

a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  540  
9fa3682869d4e1 drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark      2023-04-25  541  static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
7b365f056d8e02 drivers/hwtracing/coresight/coresight-etm3x-core.c Jie Gan          2025-03-03  542  		      enum cs_mode mode, struct coresight_path *path)
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  543  {
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  544  	int ret;
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17 @545  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  546  
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  547  	switch (mode) {
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  548  	case CS_MODE_SYSFS:
7b365f056d8e02 drivers/hwtracing/coresight/coresight-etm3x-core.c Jie Gan          2025-03-03  549  		ret = etm_enable_sysfs(csdev, path);
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  550  		break;
882d5e112491c8 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  551  	case CS_MODE_PERF:
7b365f056d8e02 drivers/hwtracing/coresight/coresight-etm3x-core.c Jie Gan          2025-03-03  552  		ret = etm_enable_perf(csdev, event, path);
882d5e112491c8 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  553  		break;
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  554  	default:
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  555  		ret = -EINVAL;
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  556  	}
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  557  
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  558  	return ret;
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  559  }
22fd532eaa0c24 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  560  
a136c0aff8e112 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan          2025-07-01 @561  static void etm_disable_hw(struct etmv4_drvdata *drvdata)
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  562  {
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  563  	int i;
1925a470ce69cd drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  564  	struct etm_config *config = &drvdata->config;
8ce0029658ba16 drivers/hwtracing/coresight/coresight-etm3x-core.c Suzuki K Poulose 2021-02-01  565  	struct coresight_device *csdev = drvdata->csdev;
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  566  
a1b0e77ce517ec drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark      2025-03-25  567  	CS_UNLOCK(drvdata->csa.base);
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  568  	etm_set_prog(drvdata);
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  569  
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  570  	/* Read back sequencer and counters for post trace analysis */
1925a470ce69cd drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  571  	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  572  
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  573  	for (i = 0; i < drvdata->nr_cntr; i++)
1925a470ce69cd drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2016-02-17  574  		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  575  
6dd4402f24a39a drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier  2018-11-30  576  	etm_set_pwrdwn(drvdata);
8ce0029658ba16 drivers/hwtracing/coresight/coresight-etm3x-core.c Suzuki K Poulose 2021-02-01  577  	coresight_disclaim_device_unlocked(csdev);
68a147752d04da drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose 2018-09-20  578  
a1b0e77ce517ec drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark      2025-03-25  579  	CS_LOCK(drvdata->csa.base);
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  580  
aaff7623284159 drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose 2019-06-19  581  	dev_dbg(&drvdata->csdev->dev,
aaff7623284159 drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose 2019-06-19  582  		"cpu: %d disable smp call done\n", drvdata->cpu);
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  583  }
a939fc5a71ad53 drivers/coresight/coresight-etm3x.c                Pratik Patel     2014-11-03  584  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
