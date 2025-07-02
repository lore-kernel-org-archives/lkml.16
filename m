Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5D22AD21
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751429359; cv=none; b=qLs8VCBcl6Mh0RVzm3oWKhGnzqHrMwYJZdg7P/M6yRXLKucPZpgGOCil6ysS/i8X8h0rssUrIpmVieDH1pZ4qBmm6yCqfLcBfDjeEwp1d05ujydXWu6qVpKkzs3epvoL1+a+N/ZSoFhtwA9uAMTlJASEVJDZo8LCNtZ19988/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751429359; c=relaxed/simple;
	bh=1ypfOHMZmqtA55byn/5MVZF/ROe/aCb6duN7VPdVz7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppArM6cZYKLGrmq6vKDzmuz9Y5KnOOVtFoAnMq6SCW1XLY4Li56+gK6dW25Yt0I1LMOZpz4Lxp866FmItnCH7uq4K5BwYrIyV/bUAjW/L7j51pt/rK1gYEZ+xel45iKOtLnX8OMpSAEb9A533B1fMW5MD9tkX2YtX37ktuzKp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu/5JIwv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu/5JIwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751429357; x=1782965357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ypfOHMZmqtA55byn/5MVZF/ROe/aCb6duN7VPdVz7g=;
  b=Mu/5JIwvc0JCPqxYlvMeDUytkEhXrAETSinbpJakMdgv6AkWBrbIEPfu
   JesjMyS9oOUsy1PA2vw/UR7a1oYnk6ywZG1RqyjGw3Auc2ipK+5MTllwj
   EQPmqECCBDJNNWRIS2xcBlwY/glh9rdrJCJYX9vJ8mYFmVTmc8BQQYXSN
   PFRv2+9pHkQhsRBStWrEAjLcCJtd17PRPtJK/TRL0GOHj7YxFJL6NrKT0
   FtCQM4ZnJOc8P3R38pLPxwMyDGrsWkuqKnGRbqR7zEXzEl67O4cPvi6ba
   QAqJnvP3PsXeqjw8r+68sb4tWmIvX2pjgro1b27QxEMktxV6sEyZBKshO
   g==;
X-CSE-ConnectionGUID: EI7i89WXSoGs2kVmKzik2A==
X-CSE-MsgGUID: /xKQByLcSx2ApSepdSnMuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53802837"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53802837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 21:09:16 -0700
X-CSE-ConnectionGUID: Lqjx1DpPQhybsHP4CWCyYw==
X-CSE-MsgGUID: UmcfNSnqTxCmWxetgfpuvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="154683026"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2025 21:09:12 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWomU-000095-1M;
	Wed, 02 Jul 2025 04:09:10 +0000
Date: Wed, 2 Jul 2025 12:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Levi Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device
 mode on target CPU
Message-ID: <202507021124.opIH3gFn-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 66701750d5565c574af42bef0b789ce0203e3071]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yan/coresight-Change-device-mode-to-atomic-type/20250701-230354
base:   66701750d5565c574af42bef0b789ce0203e3071
patch link:    https://lore.kernel.org/r/20250701-arm_cs_pm_fix_v3-v2-3-23ebb864fcc1%40arm.com
patch subject: [PATCH v2 03/28] coresight: etm3x: Always set tracer's device mode on target CPU
config: arm-randconfig-004-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021124.opIH3gFn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021124.opIH3gFn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021124.opIH3gFn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-etm3x-core.c:545:22: warning: unused variable 'drvdata' [-Wunused-variable]
     545 |         struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
         |                             ^~~~~~~
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: warning: declaration of 'struct etmv4_drvdata' will not be visible outside of this function [-Wvisibility]
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:564:38: error: incomplete definition of type 'struct etmv4_drvdata'
     564 |         struct etm_config *config = &drvdata->config;
         |                                      ~~~~~~~^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:565:42: error: incomplete definition of type 'struct etmv4_drvdata'
     565 |         struct coresight_device *csdev = drvdata->csdev;
         |                                          ~~~~~~~^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:567:19: error: incomplete definition of type 'struct etmv4_drvdata'
     567 |         CS_UNLOCK(drvdata->csa.base);
         |                   ~~~~~~~^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:568:15: error: incompatible pointer types passing 'struct etmv4_drvdata *' to parameter of type 'struct etm_drvdata *' [-Werror,-Wincompatible-pointer-types]
     568 |         etm_set_prog(drvdata);
         |                      ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:154:46: note: passing argument to parameter 'drvdata' here
     154 | static void etm_set_prog(struct etm_drvdata *drvdata)
         |                                              ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:571:38: error: incompatible pointer types passing 'struct etmv4_drvdata *' to parameter of type 'struct etm_drvdata *' [-Werror,-Wincompatible-pointer-types]
     571 |         config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
         |                                             ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm.h:267:58: note: passing argument to parameter 'drvdata' here
     267 | static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
         |                                                          ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:573:25: error: incomplete definition of type 'struct etmv4_drvdata'
     573 |         for (i = 0; i < drvdata->nr_cntr; i++)
         |                         ~~~~~~~^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:574:35: error: incompatible pointer types passing 'struct etmv4_drvdata *' to parameter of type 'struct etm_drvdata *' [-Werror,-Wincompatible-pointer-types]
     574 |                 config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
         |                                                 ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm.h:267:58: note: passing argument to parameter 'drvdata' here
     267 | static inline unsigned int etm_readl(struct etm_drvdata *drvdata, u32 off)
         |                                                          ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:576:17: error: incompatible pointer types passing 'struct etmv4_drvdata *' to parameter of type 'struct etm_drvdata *' [-Werror,-Wincompatible-pointer-types]
     576 |         etm_set_pwrdwn(drvdata);
         |                        ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:61:48: note: passing argument to parameter 'drvdata' here
      61 | static void etm_set_pwrdwn(struct etm_drvdata *drvdata)
         |                                                ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:579:17: error: incomplete definition of type 'struct etmv4_drvdata'
     579 |         CS_LOCK(drvdata->csa.base);
         |                 ~~~~~~~^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:581:18: error: incomplete definition of type 'struct etmv4_drvdata'
     581 |         dev_dbg(&drvdata->csdev->dev,
         |                  ~~~~~~~^
   include/linux/dev_printk.h:171:28: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                   ^~~
   include/linux/dev_printk.h:139:23: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:582:45: error: incomplete definition of type 'struct etmv4_drvdata'
     582 |                 "cpu: %d disable smp call done\n", drvdata->cpu);
         |                                                    ~~~~~~~^
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                        ^~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:35: note: forward declaration of 'struct etmv4_drvdata'
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                   ^
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:589:17: error: incompatible pointer types passing 'struct etmv_drvdata *' to parameter of type 'struct etmv4_drvdata *' [-Werror,-Wincompatible-pointer-types]
     589 |         etm_disable_hw(drvdata);
         |                        ^~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:50: note: passing argument to parameter 'drvdata' here
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                                  ^
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:591:28: error: incomplete definition of type 'struct etmv_drvdata'
     591 |         coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
         |                            ~~~~~~~^
   drivers/hwtracing/coresight/coresight-etm3x-core.c:587:9: note: forward declaration of 'struct etmv_drvdata'
     587 |         struct etmv_drvdata *drvdata = info;
         |                ^
>> drivers/hwtracing/coresight/coresight-etm3x-core.c:729:18: error: incompatible pointer types passing 'struct etm_drvdata *' to parameter of type 'struct etmv4_drvdata *' [-Werror,-Wincompatible-pointer-types]
     729 |                 etm_disable_hw(etmdrvdata[cpu]);
         |                                ^~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm3x-core.c:561:50: note: passing argument to parameter 'drvdata' here
     561 | static void etm_disable_hw(struct etmv4_drvdata *drvdata)
         |                                                  ^
   2 warnings and 14 errors generated.


vim +564 drivers/hwtracing/coresight/coresight-etm3x-core.c

22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  560  
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01 @561  static void etm_disable_hw(struct etmv4_drvdata *drvdata)
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  562  {
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  563  	int i;
1925a470ce69cdf drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17 @564  	struct etm_config *config = &drvdata->config;
8ce0029658ba16c drivers/hwtracing/coresight/coresight-etm3x-core.c Suzuki K Poulose          2021-02-01  565  	struct coresight_device *csdev = drvdata->csdev;
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  566  
a1b0e77ce517ec0 drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2025-03-25  567  	CS_UNLOCK(drvdata->csa.base);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03 @568  	etm_set_prog(drvdata);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  569  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  570  	/* Read back sequencer and counters for post trace analysis */
1925a470ce69cdf drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  571  	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  572  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  573  	for (i = 0; i < drvdata->nr_cntr; i++)
1925a470ce69cdf drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  574  		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  575  
6dd4402f24a39a9 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2018-11-30  576  	etm_set_pwrdwn(drvdata);
8ce0029658ba16c drivers/hwtracing/coresight/coresight-etm3x-core.c Suzuki K Poulose          2021-02-01  577  	coresight_disclaim_device_unlocked(csdev);
68a147752d04da7 drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose          2018-09-20  578  
a1b0e77ce517ec0 drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2025-03-25  579  	CS_LOCK(drvdata->csa.base);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  580  
aaff7623284159a drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose          2019-06-19  581  	dev_dbg(&drvdata->csdev->dev,
aaff7623284159a drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose          2019-06-19  582  		"cpu: %d disable smp call done\n", drvdata->cpu);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  583  }
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  584  
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  585  static void etm_disable_hw_smp_call(void *info)
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  586  {
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  587  	struct etmv_drvdata *drvdata = info;
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  588  
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01 @589  	etm_disable_hw(drvdata);
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  590  
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01 @591  	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  592  }
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  593  
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  594  static void etm_disable_perf(struct coresight_device *csdev)
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  595  {
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  596  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  597  
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  598  	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  599  		return;
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  600  
a1b0e77ce517ec0 drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2025-03-25  601  	CS_UNLOCK(drvdata->csa.base);
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  602  
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  603  	/* Setting the prog bit disables tracing immediately */
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  604  	etm_set_prog(drvdata);
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  605  
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  606  	/*
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  607  	 * There is no way to know when the tracer will be used again so
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  608  	 * power down the tracer.
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  609  	 */
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  610  	etm_set_pwrdwn(drvdata);
8ce0029658ba16c drivers/hwtracing/coresight/coresight-etm3x-core.c Suzuki K Poulose          2021-02-01  611  	coresight_disclaim_device_unlocked(csdev);
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  612  
a1b0e77ce517ec0 drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2025-03-25  613  	CS_LOCK(drvdata->csa.base);
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  614  
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  615  	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  616  
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  617  	/*
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  618  	 * perf will release trace ids when _free_aux()
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  619  	 * is called at the end of the session
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  620  	 */
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  621  
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  622  }
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  623  
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  624  static void etm_disable_sysfs(struct coresight_device *csdev)
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  625  {
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  626  	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  627  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  628  	/*
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  629  	 * Taking hotplug lock here protects from clocks getting disabled
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  630  	 * with tracing being left on (crash scenario) if user disable occurs
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  631  	 * after cpu online mask indicates the cpu is offline but before the
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  632  	 * DYING hotplug callback is serviced by the ETM driver.
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  633  	 */
e560c89c8ac0baa drivers/hwtracing/coresight/coresight-etm3x.c      Sebastian Andrzej Siewior 2017-05-24  634  	cpus_read_lock();
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  635  	spin_lock(&drvdata->spinlock);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  636  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  637  	/*
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  638  	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  639  	 * ensures that register writes occur when cpu is powered.
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  640  	 */
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  641  	smp_call_function_single(drvdata->cpu, etm_disable_hw_smp_call,
a136c0aff8e1120 drivers/hwtracing/coresight/coresight-etm3x-core.c Leo Yan                   2025-07-01  642  				 drvdata, 1);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  643  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  644  	spin_unlock(&drvdata->spinlock);
e560c89c8ac0baa drivers/hwtracing/coresight/coresight-etm3x.c      Sebastian Andrzej Siewior 2017-05-24  645  	cpus_read_unlock();
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  646  
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  647  	/*
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  648  	 * we only release trace IDs when resetting sysfs.
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  649  	 * This permits sysfs users to read the trace ID after the trace
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  650  	 * session has completed. This maintains operational behaviour with
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  651  	 * prior trace id allocation method
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  652  	 */
9edf291091f68f4 drivers/hwtracing/coresight/coresight-etm3x-core.c Mike Leach                2023-01-16  653  
aaff7623284159a drivers/hwtracing/coresight/coresight-etm3x.c      Suzuki K Poulose          2019-06-19  654  	dev_dbg(&csdev->dev, "ETM tracing disabled\n");
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  655  }
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  656  
68905d73df5d51b drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-08-25  657  static void etm_disable(struct coresight_device *csdev,
68905d73df5d51b drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-08-25  658  			struct perf_event *event)
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  659  {
9fa3682869d4e16 drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2023-04-25  660  	enum cs_mode mode;
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  661  
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  662  	/*
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  663  	 * For as long as the tracer isn't disabled another entity can't
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  664  	 * change its status.  As such we can read the status here without
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  665  	 * fearing it will change under us.
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  666  	 */
c95c2733e5feb1f drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2024-01-29  667  	mode = coresight_get_mode(csdev);
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  668  
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  669  	switch (mode) {
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  670  	case CS_MODE_DISABLED:
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  671  		break;
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  672  	case CS_MODE_SYSFS:
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  673  		etm_disable_sysfs(csdev);
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  674  		break;
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  675  	case CS_MODE_PERF:
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  676  		etm_disable_perf(csdev);
882d5e112491c87 drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  677  		break;
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  678  	default:
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  679  		WARN_ON_ONCE(mode);
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  680  		return;
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  681  	}
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  682  }
22fd532eaa0c24d drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-17  683  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  684  static const struct coresight_ops_source etm_source_ops = {
52210c8745e418f drivers/hwtracing/coresight/coresight-etm3x.c      Mathieu Poirier           2016-02-02  685  	.cpu_id		= etm_cpu_id,
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  686  	.enable		= etm_enable,
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  687  	.disable	= etm_disable,
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  688  };
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  689  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  690  static const struct coresight_ops etm_cs_ops = {
c367a89dec267c6 drivers/hwtracing/coresight/coresight-etm3x-core.c Jie Gan                   2025-03-03  691  	.trace_id	= coresight_etm_get_trace_id,
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  692  	.source_ops	= &etm_source_ops,
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  693  };
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  694  
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  695  static int etm_online_cpu(unsigned int cpu)
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  696  {
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  697  	if (!etmdrvdata[cpu])
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  698  		return 0;
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  699  
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  700  	if (etmdrvdata[cpu]->boot_enable && !etmdrvdata[cpu]->sticky_enable)
1f5149c7751c50a drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2024-01-29  701  		coresight_enable_sysfs(etmdrvdata[cpu]->csdev);
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  702  	return 0;
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  703  }
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  704  
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  705  static int etm_starting_cpu(unsigned int cpu)
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  706  {
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  707  	if (!etmdrvdata[cpu])
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  708  		return 0;
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  709  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  710  	spin_lock(&etmdrvdata[cpu]->spinlock);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  711  	if (!etmdrvdata[cpu]->os_unlock) {
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  712  		etm_os_unlock(etmdrvdata[cpu]);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  713  		etmdrvdata[cpu]->os_unlock = true;
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  714  	}
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  715  
c95c2733e5feb1f drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2024-01-29  716  	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  717  		etm_enable_hw(etmdrvdata[cpu]);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  718  	spin_unlock(&etmdrvdata[cpu]->spinlock);
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  719  	return 0;
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  720  }
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  721  
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  722  static int etm_dying_cpu(unsigned int cpu)
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  723  {
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  724  	if (!etmdrvdata[cpu])
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  725  		return 0;
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  726  
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  727  	spin_lock(&etmdrvdata[cpu]->spinlock);
c95c2733e5feb1f drivers/hwtracing/coresight/coresight-etm3x-core.c James Clark               2024-01-29  728  	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03 @729  		etm_disable_hw(etmdrvdata[cpu]);
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  730  	spin_unlock(&etmdrvdata[cpu]->spinlock);
2b5283d12f67839 drivers/hwtracing/coresight/coresight-etm3x.c      Richard Cochran           2016-07-13  731  	return 0;
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  732  }
a939fc5a71ad531 drivers/coresight/coresight-etm3x.c                Pratik Patel              2014-11-03  733  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
