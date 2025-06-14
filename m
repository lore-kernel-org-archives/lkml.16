Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379182E11D2
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749886636; cv=none; b=I79qyn/hQPUElXmz31GDRCt+MPJaeGQE+pAmUWTWe4QXZXnqF6aW+PqCiKlN7DZa9NxMDV9o7Ib8du60UAdWbq4d+BLEVd+Qh06IlEF0I+u3k0kWxlbIsUJrC8WLohhxEa3BBbQ2NmdTQWcMUTTlJZdTjXa3t7Ate0g8Ir/0Ulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749886636; c=relaxed/simple;
	bh=aIZtGpUWA/3xg8s0SL2dv9xFvbfeNL8+ElVJh6GzKhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQ38vK4uiagai4mGnaAjRYV1QHCoPhkxZgzd94+ufLHyxGjLcMM33PZBiIhTmN9eotiqtTdpJP+StvucO9sXGVdWCotuv6EIjO8UktUxfR9nAUf2R1mn0gjbgDVIpRR3Qf1lBH7GoIeEiC7nZX6CSh84VMf2yTmTmbG5U3LPLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwzGJbXm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwzGJbXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749886634; x=1781422634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aIZtGpUWA/3xg8s0SL2dv9xFvbfeNL8+ElVJh6GzKhA=;
  b=jwzGJbXmlKQdHpUlqeSaI7/3MmbrgqvbOjHHLdk8KzHyx8vcCAp3ACma
   xKbQ4AlvnwpJEmV4ZhH+/x0RylhwaKKkrq/qpnTtNdPAPMyE4fwqqJGFh
   xKXj5Jeey416XxEKSo8kcBimUPqC4p9y5ui2GRHgVtEWucYnaEhmZwm5q
   /VruirHdX40cZbHm8MIvw93YlU383buKdX83oqsg6R/0faJ8NmzUScw5d
   C/YPx4DjhpqCwTvsPxJ4oD1acU9fAbeEoA0Axn0SRiI8xPkKl/qP2ayck
   B349ctuqIDz86qt49+dtxI3QuZvL3E+mmcXLUzrPSMaDzjXGgoJJ5DPFl
   A==;
X-CSE-ConnectionGUID: Xe3I4CR0QwGzMMmUIERhfg==
X-CSE-MsgGUID: N1F3CUHKQe+MvbYHhSJaww==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63511502"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63511502"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 00:37:14 -0700
X-CSE-ConnectionGUID: e1UUs9DlTYu6k4lB3GDVzQ==
X-CSE-MsgGUID: mToR3KE9QM+pbPQ8lup+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148552884"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jun 2025 00:37:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQLRu-000DN2-0J;
	Sat, 14 Jun 2025 07:37:10 +0000
Date: Sat, 14 Jun 2025 15:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: include/linux/platform_device.h:91:23: sparse: sparse: incorrect
 type in return expression (different address spaces)
Message-ID: <202506141507.mLBNmMsd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4774cfe3543abb8ee98089f535e28ebfd45b975a
commit: 61de83fd8256e185588670d3cf0bccc3e913819c mux: mmio: Do not use syscon helper to build regmap
date:   6 weeks ago
config: s390-randconfig-r112-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141507.mLBNmMsd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250614/202506141507.mLBNmMsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141507.mLBNmMsd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mux/mmio.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *

vim +91 include/linux/platform_device.h

a0c74f6c9ea9ceb Mark Brown 2023-07-18  85  
a0c74f6c9ea9ceb Mark Brown 2023-07-18  86  
a0c74f6c9ea9ceb Mark Brown 2023-07-18  87  static inline void __iomem *
a0c74f6c9ea9ceb Mark Brown 2023-07-18  88  devm_platform_ioremap_resource(struct platform_device *pdev,
a0c74f6c9ea9ceb Mark Brown 2023-07-18  89  			       unsigned int index)
a0c74f6c9ea9ceb Mark Brown 2023-07-18  90  {
a0c74f6c9ea9ceb Mark Brown 2023-07-18 @91  	return ERR_PTR(-EINVAL);
a0c74f6c9ea9ceb Mark Brown 2023-07-18  92  }
a0c74f6c9ea9ceb Mark Brown 2023-07-18  93  

:::::: The code at line 91 was first introduced by commit
:::::: a0c74f6c9ea9cebd7a8f38142bf87e7c12c2905d platform: Provide stubs for !HAS_IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
