Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1192376EC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567927; cv=none; b=lLO0f3rqTAtz3w5bWPomWuWQjLFvnbFNIb7FDORs8dJvbNXdhfbbW0mSfv/sZwTvdVvkil6ghkdML+ojdqCaNJ/ZtoLMY+W2wwYqlPXyvKr3HkguglxJhaqdlQcHiM7INH5C0AfhU8PltViQ+LwZWIfopAj/8wxCBEJP5YB6oqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567927; c=relaxed/simple;
	bh=njxByE+IBJtYYpjF0D0YGgtFyj7awC2eF8EPiUEWGqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hye+LT1a0T23ke4e5hCe4TpeRw6peOWay246kUvuoub+Iuo9llVEQIB89C7M4cwfd/F8kb3HPeB0jvah/yKpKfxcHfkZ5p2X/NJ5hBiYycfCq3XBpXGqZmVBHIKLO/ZlA1HT9nHdufA2JhOyKY4E8Qmj1Rep1COAfhGUs119ntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecjaHnOM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecjaHnOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749567926; x=1781103926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=njxByE+IBJtYYpjF0D0YGgtFyj7awC2eF8EPiUEWGqs=;
  b=ecjaHnOM2q+qrweE5Ywqg0jUtUR8HOz9d76Pd5S5rWNaM79osw+2dfoY
   1te66LklqB5WpZ+jkBe5rU9LQg8JfJFsYD3cPN2Ag8lzPSmhz4RoKVvvK
   KJ6g7ng37FDsC7aPP6CaC00HTawLA6Xb49NmDftIlBPp6ODvi7DzT3x9h
   ik2oMT00wA+r4W984SHBioh8bdGD6nIHSCb7EbNrR077x3QKgnELJyWgN
   PAenJqWxqQNg/xJMRiU3k/R6UTX9cIDjCVXbKLJ0M6oOfDWtcmhSkLHuu
   h/PfTuCsP7JBB5Z09t+eB84noNSXLVdEm9zDczhcumKHvQcpPWkxu7Py5
   A==;
X-CSE-ConnectionGUID: nYsLjz5PSbCw/3iWdWHd5g==
X-CSE-MsgGUID: 9p3Zl6doRjC5MmAtzYR/ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="77087503"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="77087503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 08:05:25 -0700
X-CSE-ConnectionGUID: 2bO0S9tcRZuac0ai5ES5vQ==
X-CSE-MsgGUID: fTNG/fZOQvKYGuTh1S8mHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147799197"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 08:05:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uP0XR-0008NC-2J;
	Tue, 10 Jun 2025 15:05:21 +0000
Date: Tue, 10 Jun 2025 23:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Leo Yan <leo.yan@arm.com>
Subject: drivers/hwtracing/coresight/coresight-syscfg.c:398
 cscfg_remove_owned_csdev_configs() warn: inconsistent indenting
Message-ID: <202506102238.XQfScl5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 53b9e2659719b04f5ba7593f2af0f2335f75e94a coresight: holding cscfg_csdev_lock while removing cscfg from csdev
date:   3 weeks ago
config: arm-randconfig-r073-20250610 (https://download.01.org/0day-ci/archive/20250610/202506102238.XQfScl5x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506102238.XQfScl5x-lkp@intel.com/

smatch warnings:
drivers/hwtracing/coresight/coresight-syscfg.c:398 cscfg_remove_owned_csdev_configs() warn: inconsistent indenting

vim +398 drivers/hwtracing/coresight/coresight-syscfg.c

   390	
   391	static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
   392	{
   393		struct cscfg_config_csdev *config_csdev, *tmp;
   394	
   395		if (list_empty(&csdev->config_csdev_list))
   396			return;
   397	
 > 398	  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
   399	
   400		list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
   401			if (config_csdev->config_desc->load_owner == load_owner)
   402				list_del(&config_csdev->node);
   403		}
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
