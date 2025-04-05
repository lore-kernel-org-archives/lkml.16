Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3CBDDCD;
	Sat,  5 Apr 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743866017; cv=none; b=qS5NadQp7NK7mC3PmkBlcX9aQNMsVLo2zPyfAcQnO7H/Gmg5SS6VKTqvk/R/QkSyAyUei8AoMalcfbMHMQlt8FRKQgt2tiA8agtFKpxES/fhnpFPwlyt3M45WLqXzC5x+JfLBlWDxYIvyd//LyrqYFwoKqEyfiR3pD9771Oprwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743866017; c=relaxed/simple;
	bh=exAiWMVcVghnujtvzA2RVuKbjqWm3hf7kt/Likz2WQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbYZittmkqYV72/igV3YNTkz+JXgrSCCBlWvcuLwnpxOwRXiIgb/Fr1FSOlhj02Cb6d1KFsphRnjkfjQR6ibCME/BEHFiI7aDto5SRrY4RARh8qBMi0xJrTK66uDXk2y/I3c8u76NKHJ8UTz3zVuk0dm6IYWHI+Hrslvu+iUK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdZShphc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdZShphc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743866015; x=1775402015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=exAiWMVcVghnujtvzA2RVuKbjqWm3hf7kt/Likz2WQQ=;
  b=gdZShphcTgnxsCsPBfG28QLK81F9aBdURZzJB9/0G/svronP66qQCHs6
   LZSupYZDSWM07O3epBsgwWbIEZfWwPfz81452q+VPoLTCUN+puL0lKE7z
   COfupvblyL5vEi8RBUhFDJDEvwxlw+XuzJ3cuKrxJi6B8WqvDZmd8sCEd
   qGRguqWjZQa+q1Uxb7aSmJ/F6W90wZdGCHa51x6kLnN1WSw1XBMyddPhu
   YHe+UyBJa5tl/TbodIXN2gUR7dFHYAjuJI5I5DxUIIRoYbIZI25FX3F69
   CJNFP/Tt5UORuc6C4IKop8UDeVgw7kbFnZVP7wr5HT4DdbvlPk0V9A4Z8
   g==;
X-CSE-ConnectionGUID: MDnlRLpuR2S0LoHO5EtL5A==
X-CSE-MsgGUID: uJY8+XQATUGv6AnFTNOBYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45014094"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45014094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 08:13:35 -0700
X-CSE-ConnectionGUID: 95EZI4G0TZOmXHh6xGe3nQ==
X-CSE-MsgGUID: IRo0FDanT9qEpCbFSvqdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132688010"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2025 08:13:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u15D6-00026t-2E;
	Sat, 05 Apr 2025 15:13:28 +0000
Date: Sat, 5 Apr 2025 23:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: cy_huang@richtek.com, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
Message-ID: <202504052244.bgS5yxev-lkp@intel.com>
References: <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11]

url:    https://github.com/intel-lab-lkp/linux/commits/cy_huang-richtek-com/ASoC-dt-bindings-Add-bindings-for-Richtek-rt9123/20250404-223054
base:   a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
patch link:    https://lore.kernel.org/r/cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang%40richtek.com
patch subject: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
config: powerpc64-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052244.bgS5yxev-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052244.bgS5yxev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052244.bgS5yxev-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/rt9123.c:476:17: error: use of undeclared identifier 'rt9123_dev_pm_ops'; did you mean 'rt9123_dai_ops'?
     476 |                 .pm = pm_ptr(&rt9123_dev_pm_ops),
         |                               ^~~~~~~~~~~~~~~~~
         |                               rt9123_dai_ops
   include/linux/pm.h:471:53: note: expanded from macro 'pm_ptr'
     471 | #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
         |                                                     ^
   include/linux/kernel.h:48:38: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   sound/soc/codecs/rt9123.c:293:37: note: 'rt9123_dai_ops' declared here
     293 | static const struct snd_soc_dai_ops rt9123_dai_ops = {
         |                                     ^
>> sound/soc/codecs/rt9123.c:476:9: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'const struct snd_soc_dai_ops *' [-Werror,-Wincompatible-pointer-types]
     476 |                 .pm = pm_ptr(&rt9123_dev_pm_ops),
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:471:22: note: expanded from macro 'pm_ptr'
     471 | #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:48:27: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +476 sound/soc/codecs/rt9123.c

   470	
   471	static struct i2c_driver rt9123_i2c_driver = {
   472		.driver = {
   473			.name = "rt9123",
   474			.of_match_table = of_match_ptr(rt9123_device_id),
   475			.acpi_match_table = ACPI_PTR(rt9123_acpi_match),
 > 476			.pm = pm_ptr(&rt9123_dev_pm_ops),
   477		},
   478		.probe	= rt9123_i2c_probe,
   479	};
   480	module_i2c_driver(rt9123_i2c_driver);
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
