Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A46197A8A;
	Sun, 20 Apr 2025 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745150984; cv=none; b=nu97XWKrpGy/bE2IfUmJwBfLuvL4Fx4dkyQP47g42NTt8IH2iJm7iI+4idl3Jy8TV31k60ZNKeTOz1kkTkURYPqR6DIPN3zA4QARFkpQQRmYAsc4EzsywAWU45iuXxmPki+b/mmExGOBDG9Vzt88qjLk5M59sdVIn+DHTuwxJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745150984; c=relaxed/simple;
	bh=ExbiWHI4vkkRALmW5sHMtg9viFPkOSxPvgMn2v+/Y8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPPWfNhqJ2VxVSj5T2KswGzNYyaNQS//xIVaCXlopAuuuflQb9aVLp9+cPgnJSvBRftT4OJd6hGRZH1zniisoFIeV54+pAIAPYwc4gOr3YFDgxykveHBBOOfUVvuEb3EwJWdGK61eG40/pcEEzqyiWs5bI5nGMgiZRDTZozTk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MssIjZ10; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MssIjZ10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745150982; x=1776686982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ExbiWHI4vkkRALmW5sHMtg9viFPkOSxPvgMn2v+/Y8g=;
  b=MssIjZ10W1q+53aXLWZukmLLW1Drrj0fOY6xhtV8i+cp+yl+BZBk1VoB
   gazLqadP485u1I6i3PbcjuAWz+wr2Sw+ef4pgnEfNeiNkpn8f3bJlz399
   X/4esGaPKcqxfJVX1VYsp5lcz7tHZzspjRygwmxDSRwt2nNqHJgR/yBRu
   71ZUt3HIn5cEKHKzQ6DU5atVXPwO1Yjy3V/7vTrVFocIqlL5l4mQ900Hf
   0CjrQpiYdwlQ34DXWhq8ZnRVT/qw1t4mh/A/0fDYxaHhbjG8cld/Cftno
   p9JSZHjiYnPQZQrw+4pQ2tGr/JlpCzLGcKf5Rupv9RdZwiPeZ4T+JKrgy
   w==;
X-CSE-ConnectionGUID: 0ENZTigqSmCYWF16tTtk/Q==
X-CSE-MsgGUID: 13WLxV6KTGCHhxugGM+ylA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72095970"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72095970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 05:09:41 -0700
X-CSE-ConnectionGUID: mmgX1h/TSKS15cHIjMnyHg==
X-CSE-MsgGUID: zYnIBlZlSmeo4jSFweqM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="135582953"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2025 05:09:39 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6TUP-0004cN-10;
	Sun, 20 Apr 2025 12:09:37 +0000
Date: Sun, 20 Apr 2025 20:09:13 +0800
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
Subject: Re: [PATCH v5] hwmon: (max77705) add initial support
Message-ID: <202504201920.cQQHIL2Y-lkp@intel.com>
References: <20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a4cda136f021ad44b8b52286aafd613030a6db5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/hwmon-max77705-add-initial-support/20250420-030631
base:   a4cda136f021ad44b8b52286aafd613030a6db5f
patch link:    https://lore.kernel.org/r/20250419-initial-support-for-max77705-sensors-v5-1-4504a9b48ba1%40gmail.com
patch subject: [PATCH v5] hwmon: (max77705) add initial support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250420/202504201920.cQQHIL2Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201920.cQQHIL2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201920.cQQHIL2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max77705-hwmon.c:51:34: warning: 'max77705_hwmon_readable_ranges' defined but not used [-Wunused-const-variable=]
      51 | static const struct regmap_range max77705_hwmon_readable_ranges[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/max77705_hwmon_readable_ranges +51 drivers/hwmon/max77705-hwmon.c

    50	
  > 51	static const struct regmap_range max77705_hwmon_readable_ranges[] = {
    52		regmap_reg_range(AVGISYS_REG,	AVGISYS_REG + 1),
    53		regmap_reg_range(IIN_REG,	IIN_REG + 1),
    54		regmap_reg_range(ISYS_REG,	ISYS_REG + 1),
    55		regmap_reg_range(VBYP_REG,	VBYP_REG + 1),
    56		regmap_reg_range(VSYS_REG,	VSYS_REG + 1),
    57	};
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
