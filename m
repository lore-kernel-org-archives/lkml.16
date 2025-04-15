Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956227A11F;
	Tue, 15 Apr 2025 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706133; cv=none; b=oyDV17DrFLFm94b2OAZp2sBu8RQLq3sEEoGe5Jb1HqL+QBh0jL5W4BZuA9rriZLVhNgzYXco057ikj5SB4WaqoGkwyVfNFWnMu1tc8WUZz28wK8AETyaMXUV5Sh7vS9wx69dx1tb5mU3mSY8k+9rNEWHL56kW924AgaWbyORIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706133; c=relaxed/simple;
	bh=jGqXa6qAd07xPumuQnTOwwVerUwK7vIp8vwS6j9n5Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmQ46/FhstgGCethVkD9YNp86YVMLzYMRWGTZzQ2GOBLUx//nwJoVjBjbXEh4X6g2Yl/6vcWsGbcGjTAFdYCNGGNA8/Wqn4i8A0hWI5wt1mRILEinb0gkqyGPtA4bgKx8LYGsW5aIZIyXJe+EpLuaN4AuzsFZd9lxsJRCI4Sdo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0DOwnR0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0DOwnR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744706132; x=1776242132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGqXa6qAd07xPumuQnTOwwVerUwK7vIp8vwS6j9n5Yw=;
  b=b0DOwnR0lwOpWG5+QAxArIKEOSZNSnQ2gWEBB3h3zKuVLd5IljyZDJC4
   5JG/S0ChWZg5k0HP4NhO0lFrY5K8jPkzTB+5cRYP+1CFLcCDHScsxnqOU
   iUy5LWz5FkGwUVVz2+B69+ZuMByu4beQMDH3I+sxWQ85to3ScYGBb+Uyy
   3nQPO/Cg/erOjp6VPHA8re5i/3w3L2I0sGxxj6DJ1DExAgOC0ZK2L36qo
   tH0uE7e8s7HEuVyBoR6rW/Zn+DCIasXvHP1yKiUpXxRM6pg6Zrnt9TnnN
   4fl49F9bbLpKkLL5rIUKFPWEbl8Mk7KbatW+6xCrQ4Wsq97pZ2KdpomMq
   A==;
X-CSE-ConnectionGUID: mH9uV0ZjTIaJbJkW9XksLw==
X-CSE-MsgGUID: 7CqifoWFTuyJ4hURP3MRgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45337960"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45337960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:34:19 -0700
X-CSE-ConnectionGUID: 0oNhRal1SjGXEsB3HijK6Q==
X-CSE-MsgGUID: XcQw+3HNSKCqozLjnKIVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161039023"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2025 01:34:16 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4bkD-000FPu-2n;
	Tue, 15 Apr 2025 08:34:13 +0000
Date: Tue, 15 Apr 2025 16:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH v4] hwmon: (max77705) add initial support
Message-ID: <202504151600.nzy7dDhd-lkp@intel.com>
References: <20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a4cda136f021ad44b8b52286aafd613030a6db5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/hwmon-max77705-add-initial-support/20250414-123556
base:   a4cda136f021ad44b8b52286aafd613030a6db5f
patch link:    https://lore.kernel.org/r/20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0%40gmail.com
patch subject: [PATCH v4] hwmon: (max77705) add initial support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504151600.nzy7dDhd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504151600.nzy7dDhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151600.nzy7dDhd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max77705-hwmon.c:59:41: warning: unused variable 'max77705_hwmon_readable_table' [-Wunused-const-variable]
      59 | static const struct regmap_access_table max77705_hwmon_readable_table = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/max77705_hwmon_readable_table +59 drivers/hwmon/max77705-hwmon.c

    58	
  > 59	static const struct regmap_access_table max77705_hwmon_readable_table = {
    60		.yes_ranges = max77705_hwmon_readable_ranges,
    61		.n_yes_ranges = ARRAY_SIZE(max77705_hwmon_readable_ranges),
    62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
