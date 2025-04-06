Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9972628D;
	Sun,  6 Apr 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743948321; cv=none; b=jClRMfe+5ULDE5po+Mjb3lTdnBMBkMN0m7c3nzesd00p7nRPeiE674V7o9+2FRBlYSaj6uGsz8dSzwtDdXwXvJcx4Xr8iFZp1fBA8JLl4shP2qVAo3lHW8TTurOY0iMgTNyP2Euek5Lwy6fP11qKx6Oc2yaMTaC57YL+xZlwpYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743948321; c=relaxed/simple;
	bh=ZCCRAb4KMYzgp3EMJ/Pxq9e9DFVpjj2851qwNuswykA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl1KvO0sHevvCseky3NoRWVZqIvTI8xDa1JfjEZsRdjrwfi8v5CPhga2uAKCrEO2ioRfIJb102xvW0fx4kUUd4Dl0/2GkyMkpkto48cVKoZ3pAJdp91WNFPaMEJoBGdbRKO3PWlF4XZ1gGZqU9K4LSF0awb2evYIY4XLwC7dkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=So95ZiPN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="So95ZiPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743948320; x=1775484320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZCCRAb4KMYzgp3EMJ/Pxq9e9DFVpjj2851qwNuswykA=;
  b=So95ZiPNKJYHw0pLz7xoLtLAv/mQhnhp50BMo2M3rs8rOG2SIa7xxqXY
   sULZCMf5N+HcMiuJUmBEdrT+IO8IawmqB5AlolwiMVMH+GD2pzG6mGgX7
   Ua1UHGjH5l0nMdVxNc8b1YS89+cYRJgf+IUq3Mz6+HTJjxVl3DCPFNwqK
   qgKzhRdGpbRVu4uDsfgwQsSqeFgqiSIlZ2a3yYEJ1kclh7zhvy7f8u5xi
   UJ21VsIx21DPQhDQ4rAGTnhbNz9odt3u1KCpjd4YZYAHvFuFsG41NVZbW
   /TcjoFrMxrsUvNKAdlW2svZvhdNR1JRpaw5I4fRCltSQ0GSRf5dkRX+Yp
   Q==;
X-CSE-ConnectionGUID: 3Ogauv+lRD6jApQ+pnQtMA==
X-CSE-MsgGUID: 9HBfFx5wQeCzQ9lQ24Lwww==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49123972"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49123972"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 07:05:19 -0700
X-CSE-ConnectionGUID: rOn/9yUsRqWGX9gxQ0OM3g==
X-CSE-MsgGUID: ExaKapijTb+IoTkicbV8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127684948"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Apr 2025 07:05:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Qcc-0002d1-0R;
	Sun, 06 Apr 2025 14:05:14 +0000
Date: Sun, 6 Apr 2025 22:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: Re: [PATCH v3] hwmon: (max77705) add initial support
Message-ID: <202504062145.xBDNEwqG-lkp@intel.com>
References: <20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a4cda136f021ad44b8b52286aafd613030a6db5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/hwmon-max77705-add-initial-support/20250405-233235
base:   a4cda136f021ad44b8b52286aafd613030a6db5f
patch link:    https://lore.kernel.org/r/20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005%40gmail.com
patch subject: [PATCH v3] hwmon: (max77705) add initial support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250406/202504062145.xBDNEwqG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504062145.xBDNEwqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504062145.xBDNEwqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max77705-hwmon.c:66:35: warning: 'max77705_hwmon_regmap_config' defined but not used [-Wunused-const-variable=]
      66 | static const struct regmap_config max77705_hwmon_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/max77705_hwmon_regmap_config +66 drivers/hwmon/max77705-hwmon.c

    65	
  > 66	static const struct regmap_config max77705_hwmon_regmap_config = {
    67		.name = "max77705_hwmon",
    68		.reg_bits = 8,
    69		.val_bits = 16,
    70		.rd_table = &max77705_hwmon_readable_table,
    71		.max_register = MAX77705_FG_END,
    72		.val_format_endian = REGMAP_ENDIAN_LITTLE
    73	};
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
