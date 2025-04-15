Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F97D2309B6;
	Tue, 15 Apr 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704627; cv=none; b=oiGsVX8JRMouV75Kg7M0pq8bZn99VYiaxmYnYViZopI+Xby3kkdH1KAtRBcRZOvgdDE7PeIIr06lIdPEX1SYtQmONq6KoYQrouoY6GocJAECFhrPTAVCLRzpzwy1vm4nf5hUjr8G32prm3ixavnY9RTMe4y3jZ04dy2pxxO6YI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704627; c=relaxed/simple;
	bh=zDIPSWHHd2CBUilACS5l+ZTN79OAHuDpka07FpjaGKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3MXdFuS13onPoAK4MxnaibCRdXp3xbQ7h+DcK+PjYPLeGmfVqGHiIIWRnSRMDE6+0lE/oeT5+G8k6a2jS8YLgDs441QxzLIgn6kSs3RL88p1LSpakABspFmUi76OnlSo0tfABKZYwfqNA4eHaadoFn4SLW6rE2FFkU3mkDVlTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF39gLfm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF39gLfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744704626; x=1776240626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDIPSWHHd2CBUilACS5l+ZTN79OAHuDpka07FpjaGKQ=;
  b=CF39gLfmysltDfXmlooynp2e/LWoTk9DAhhcSJkUBFGrauEfqpXEjOrA
   B61NBvcYobqTp9tMshbVd5R+l2Fo6lmkoj6Wuuxl7e1MAqBx1RiLLOYQB
   ijyYmW+BvHCYHJ/mqghyhov4fvAnhIWXXPjefy+gYGjFSIIgqEJoU/BAZ
   24r2NE/ud/wuse9hVr5sfFeWBBhExFN7G5+4B9cWoEcOFsCf0JY+kp8Ni
   7dYUIugufotvM6uw0KgCLH7vxsaOEH6o6Mc0TIKnk9j3uEjdcNihCj/DN
   aeZMhw4t/TGeFfE88ZssZCcacDVlUJqNJ++ZbSEZOzgoAgi86WSFp0TKO
   A==;
X-CSE-ConnectionGUID: 5wCmYrxMSv6T6IlBZD8oPQ==
X-CSE-MsgGUID: wEFXOojnRJKHZ4yC0TaYRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49853088"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="49853088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:09:17 -0700
X-CSE-ConnectionGUID: fii+49GORGWCqr0JQOhU5w==
X-CSE-MsgGUID: PlttizJ2RoW9iLE+2lcA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="167219741"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2025 01:09:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4bM0-000FOg-05;
	Tue, 15 Apr 2025 08:09:12 +0000
Date: Tue, 15 Apr 2025 16:08:45 +0800
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
Subject: Re: [PATCH v4] hwmon: (max77705) add initial support
Message-ID: <202504151506.IwAzrT7r-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504151506.IwAzrT7r-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504151506.IwAzrT7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151506.IwAzrT7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max77705-hwmon.c:59:41: warning: 'max77705_hwmon_readable_table' defined but not used [-Wunused-const-variable=]
      59 | static const struct regmap_access_table max77705_hwmon_readable_table = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
