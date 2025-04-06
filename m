Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA014A24;
	Sun,  6 Apr 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743953790; cv=none; b=GhlOcLlG0zAzrOToFR+Q61YbX6U80Ddz22hIKQGR5N8c3ON7gNJIgP5EYcx6yxDI5u0srChEa0C9FMJQC0cbmTwfKYOXOoEgfX9aBaSZQ95ogi4r2xq9Sh41mHUVnCwTFOAWedMqJtASI5galh0ArGbIbLhKux6NECYRaOXXapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743953790; c=relaxed/simple;
	bh=dAUz5nWt212a9mjO6jtVMFKmRV6J2U9WqhzJxntF4Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgxeNcPu/5mv8sqKUI6YrYKjG2kAu/8us9XsG6iba1rUe8SRzaBDjei6LTWSZSONPePXTmTZUrxEYGOPsDuuFbr7rniLvDfYdAOfk/oipMn71kHwq2cSFKEpBxGawQ/tflje3hSHSjwkCxRr5jj08BEIm2xXG8G/0GvoO2Euxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngX8f879; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngX8f879"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743953787; x=1775489787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dAUz5nWt212a9mjO6jtVMFKmRV6J2U9WqhzJxntF4Hs=;
  b=ngX8f879oUmngaxT9HWcsjzVuKTuHOdAXvSNOH7AFxEn6cc6Yl3orvkK
   QATs9gjkM0vmIC5GHFXiiqvozd8utvfjWbJR7ptK9cW/r1Vo4GWeDVWC6
   d39qw3ZQ0PxnHVk444ZRYEOlmzQiqUGpqplNbOPh+QUirCRuxZxWCFLya
   ba4el9voPV1IpkqmJZFEdl0vKZHN5/bKur0bAReUixPvpRzmShjVOTh2W
   lQCJ4tUluT2EK5zrCV0+jM64BZwNezqcy9RyqOvbsl5XefKhraU5Zi7g2
   yBHrC+Gxm+8VLQebSKReRLfNZ2+Y0vzuCEdRAULb2wexGiGYdKzrmQApI
   w==;
X-CSE-ConnectionGUID: 3AB8f23xTTqZttI50+siww==
X-CSE-MsgGUID: W5Dn/mx1R5uF3JnMfl8Ogg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56709809"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="56709809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 08:36:26 -0700
X-CSE-ConnectionGUID: mnxmPAr3TL2JtJZVyVG/Yg==
X-CSE-MsgGUID: zszONF3UTbiipkyM/QQNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132578217"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2025 08:36:24 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1S2n-0002fT-2D;
	Sun, 06 Apr 2025 15:36:21 +0000
Date: Sun, 6 Apr 2025 23:36:10 +0800
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
Subject: Re: [PATCH v3] hwmon: (max77705) add initial support
Message-ID: <202504062351.7jqIfzxh-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250406/202504062351.7jqIfzxh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504062351.7jqIfzxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504062351.7jqIfzxh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max77705-hwmon.c:116:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     116 |                 default:
         |                 ^
   drivers/hwmon/max77705-hwmon.c:116:3: note: insert 'break;' to avoid fall-through
     116 |                 default:
         |                 ^
         |                 break; 
>> drivers/hwmon/max77705-hwmon.c:66:35: warning: unused variable 'max77705_hwmon_regmap_config' [-Wunused-const-variable]
      66 | static const struct regmap_config max77705_hwmon_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +116 drivers/hwmon/max77705-hwmon.c

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
    75	static int max77705_read_and_convert(struct regmap *regmap, u8 reg, u32 res, long *val)
    76	{
    77		int ret;
    78		u32 regval;
    79	
    80		ret = regmap_read(regmap, reg, &regval);
    81		if (ret < 0)
    82			return ret;
    83		*val = mult_frac((long)regval, res, 1000000);
    84	
    85		return 0;
    86	}
    87	
    88	static umode_t max77705_is_visible(const void *data,
    89					   enum hwmon_sensor_types type,
    90					   u32 attr, int channel)
    91	{
    92		switch (type) {
    93		case hwmon_in:
    94			if (channel >= ARRAY_SIZE(voltage_channel_desc))
    95				return 0;
    96	
    97			switch (attr) {
    98			case hwmon_in_input:
    99			case hwmon_in_label:
   100				return 0444;
   101			default:
   102				break;
   103			}
   104			break;
   105		case hwmon_curr:
   106			if (channel >= ARRAY_SIZE(current_channel_desc))
   107				return 0;
   108	
   109			switch (attr) {
   110			case hwmon_curr_input:
   111			case hwmon_in_label:
   112				return 0444;
   113			case hwmon_curr_average:
   114				if (current_channel_desc[channel].avg_reg)
   115					return 0444;
 > 116			default:
   117				break;
   118			}
   119			break;
   120		default:
   121			break;
   122		}
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
