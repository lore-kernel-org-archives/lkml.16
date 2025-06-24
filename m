Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087D1F4161;
	Tue, 24 Jun 2025 03:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737454; cv=none; b=L/jIlsr40l5LEp5Ud/6vkM0Rwyun5/EKSi2JFbBZQH4HU7WNR3ppW7gS7lnCSSZRtls0rBi/qBWIJSIjlZ6oqFblVVdSeDeWX+eTls+QF+Qo7kmlaVlGxCMNqB9AH4+i6QaVY84vuOq42E9vaIFT8YC5wFSBWGoZKMGudGAFuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737454; c=relaxed/simple;
	bh=KMEHcEq0X+pga2fcQQgj1lL/UKHHxkGD3F5FhJ7ooD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maj6hof726TlpBDUfEQ0DhF78U2uh8H6udJsPSoX+ra+JlvAL3EOJm/fWueVyAovbBoILBhRvAKGrXbnHHHjAAIMA2n0IYGvhh+nnii2wxWh/sf9Zh1Vlk36CZrdWaOJMrXrtCojib+SQHWmy0j84flQtRyyuPRyewmaLc3paYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6RmFDjZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6RmFDjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750737452; x=1782273452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KMEHcEq0X+pga2fcQQgj1lL/UKHHxkGD3F5FhJ7ooD8=;
  b=d6RmFDjZKsU6F3wiF+g7YYpVC9m67JHq4fiE4Uf39aPATJjni+ozNzUn
   wO0eSF/yQ19Rsm5ulUa4PsA7lc/oa2HrTdDNUmPR76Pc1UkKufBDJppHZ
   D1VYo5Whk2FMZH736pxFwpHduB+JfUsEgHNvzMm39IW57Ewf87fuOK/UV
   U91YXuRjP+doD75DeKbQe+FRzWOWuqjk0a/U4JZ6SPCl7Si5D3PoPMX9Q
   7ooUpJvI7l/eAg3ZG+eSG/AL03aFU62u5794mwwbYy1mJMXfBtH+pHFnc
   1rbAUh9N+fMK8HT8zB3GByM8eA5UZ53p9PzY73fMoHtxHOgGl0SPO1BBm
   A==;
X-CSE-ConnectionGUID: kQ/scjTbRxixVUxglGTWUw==
X-CSE-MsgGUID: 3FgEbKxWTXmm8xdnAZ6jLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52900001"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52900001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:57:25 -0700
X-CSE-ConnectionGUID: VRKdCaRxSG6B/sLih1UGgA==
X-CSE-MsgGUID: UwxYRyrQQxy2q7hZRfl5dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="157282862"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 20:57:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTume-000RhR-2W;
	Tue, 24 Jun 2025 03:57:20 +0000
Date: Tue, 24 Jun 2025 11:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/6] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
Message-ID: <202506241156.TWxCzjh3-lkp@intel.com>
References: <20250623120016.108732-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120016.108732-3-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250623-200316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250623120016.108732-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/6] regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
config: i386-buildonly-randconfig-004-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241156.TWxCzjh3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241156.TWxCzjh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241156.TWxCzjh3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6316-regulator.c:205:14: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     205 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6316-regulator.c:218:6: note: uninitialized use occurs here
     218 |         if (ret) {
         |             ^~~
   drivers/regulator/mt6316-regulator.c:205:10: note: remove the 'if' if its condition is always true
     205 |                 } else if (cur_mode == REGULATOR_MODE_IDLE) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6316-regulator.c:189:19: note: initialize the variable 'ret' to silence this warning
     189 |         int cur_mode, ret;
         |                          ^
         |                           = 0
>> drivers/regulator/mt6316-regulator.c:193:25: warning: variable 'regmap' is uninitialized when used here [-Wuninitialized]
     193 |                 ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
         |                                       ^~~~~~
   drivers/regulator/mt6316-regulator.c:188:23: note: initialize the variable 'regmap' to silence this warning
     188 |         struct regmap *regmap;
         |                              ^
         |                               = NULL
   2 warnings generated.


vim +205 drivers/regulator/mt6316-regulator.c

   183	
   184	static int mt6316_regulator_set_mode(struct regulator_dev *rdev,
   185					     unsigned int mode)
   186	{
   187		struct mt6316_regulator_info *info = rdev_get_drvdata(rdev);
   188		struct regmap *regmap;
   189		int cur_mode, ret;
   190	
   191		switch (mode) {
   192		case REGULATOR_MODE_FAST:
 > 193			ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
   194			break;
   195		case REGULATOR_MODE_NORMAL:
   196			cur_mode = mt6316_regulator_get_mode(rdev);
   197			if (cur_mode < 0) {
   198				ret = cur_mode;
   199				break;
   200			}
   201	
   202			if (cur_mode == REGULATOR_MODE_FAST) {
   203				ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
   204				break;
 > 205			} else if (cur_mode == REGULATOR_MODE_IDLE) {
   206				ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
   207				if (ret == 0)
   208					usleep_range(100, 200);
   209			}
   210			break;
   211		case REGULATOR_MODE_IDLE:
   212			ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
   213			break;
   214		default:
   215			ret = -EINVAL;
   216		}
   217	
   218		if (ret) {
   219			dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
   220			return ret;
   221		}
   222	
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
