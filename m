Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97734221FD6;
	Thu, 22 May 2025 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899382; cv=none; b=GWs6NwhJ6N7l/FSzcg4aSITrf1Mp3o2jMFQ98l28eX61ZYKFQsIgFlpyppWIdg8Nh2Ray6dz/mNDqYCDnV9QYHQIX0WiUfbktX2jXr8+3jipg9iISgBmYqIQrSl1wiR7LnHt/XEzQot27elLeqZDO+3eIOBsHx59Ra+cXeXfkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899382; c=relaxed/simple;
	bh=x5lf94K85T1c12UO+DHZgoiMv99MGjTfUZfEFKZhDSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAHsU6M3swMoRdycGvERcln5LNjr/Q4E5tIVHl1VOGg7JfpkUtVxMZ30QtoF8mrg+QMGkcI3K6bLtV1PyIzPeSsho3JcKIyyCDsphNrOqy2ztSNt6CET+8Xzn/JzaXYHfEFKT6G7le0eFeBh4F1ruk+yV0946kbo5qGkKsYeuoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETH1usQb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETH1usQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747899380; x=1779435380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5lf94K85T1c12UO+DHZgoiMv99MGjTfUZfEFKZhDSI=;
  b=ETH1usQbOHmrvU6XW9yFdUVHeYsX9ZymaNNKcnw3cs4SkrYOxzb1rqKr
   CTl9aqo6gcgREDsyhqD5KHAyNciR+qaUQWkAsuHAkY0xJHHJBoiduKNtw
   hHx+RzcVxNvUNthCeILEFezyzw2pJHiiNb1+KCr3SqgmAFmWPzGIEq88e
   hIykWa47QMvYPE57KXt5xx8HfDnuwTEMXfuyKOz+0EF9wkSYLfnooJjVW
   BWl4I/3vh6DuzV3rqIgTv/w8tsyUpx5p5/k5FGGV2d7NVAtI8wMCw6Drl
   quwrnCibw/jjAEphBdRleFOCOhamMRy1LT8ljdzsf5o8bsqx0mAXP2/e+
   Q==;
X-CSE-ConnectionGUID: DMUbtiL2TdumnyeRqk8yjA==
X-CSE-MsgGUID: kVnVCXjxRIKWnEvelHj2gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60546172"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60546172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 00:36:19 -0700
X-CSE-ConnectionGUID: EePMjDCiQnCjK5q4l9XQrw==
X-CSE-MsgGUID: rA69khqeRGKnuwOE+HAByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145613508"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 May 2025 00:36:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI0TN-000P32-26;
	Thu, 22 May 2025 07:36:13 +0000
Date: Thu, 22 May 2025 15:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org,
	robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: add support for ES8375
Message-ID: <202505221528.nvWwf9kj-lkp@intel.com>
References: <20250521104247.6595-3-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521104247.6595-3-zhangyi@everest-semi.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20250521]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ASoC-dt-bindings-Add-Everest-ES8375-audio-CODEC/20250521-184427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250521104247.6595-3-zhangyi%40everest-semi.com
patch subject: [PATCH 2/2] ASoC: codecs: add support for ES8375
config: x86_64-buildonly-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221528.nvWwf9kj-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221528.nvWwf9kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221528.nvWwf9kj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/es8375.c:706:7: error: use of undeclared identifier 'i'
     706 |         for (i = 0; i < ARRAY_SIZE(es8375_core_supplies); i++)
         |              ^
   sound/soc/codecs/es8375.c:706:14: error: use of undeclared identifier 'i'
     706 |         for (i = 0; i < ARRAY_SIZE(es8375_core_supplies); i++)
         |                     ^
   sound/soc/codecs/es8375.c:706:52: error: use of undeclared identifier 'i'
     706 |         for (i = 0; i < ARRAY_SIZE(es8375_core_supplies); i++)
         |                                                           ^
   sound/soc/codecs/es8375.c:707:23: error: use of undeclared identifier 'i'
     707 |                 es8375->core_supply[i].supply = es8375_core_supplies[i];
         |                                     ^
   sound/soc/codecs/es8375.c:707:56: error: use of undeclared identifier 'i'
     707 |                 es8375->core_supply[i].supply = es8375_core_supplies[i];
         |                                                                      ^
   5 errors generated.


vim +/i +706 sound/soc/codecs/es8375.c

   691	
   692	static int es8375_read_device_properities(struct device *dev, struct es8375_priv *es8375)
   693	{
   694		int ret;
   695	
   696		ret = device_property_read_u8(dev, "everest,mclk-src", &es8375->mclk_src);
   697		if (ret != 0)
   698			es8375->mclk_src = ES8375_MCLK_SOURCE;
   699		dev_dbg(dev, "mclk-src %x", es8375->mclk_src);
   700	
   701		ret = device_property_read_u8(dev, "everest,dmic-pol", &es8375->dmic_pol);
   702		if (ret != 0)
   703			es8375->dmic_pol = DMIC_POL;
   704		dev_dbg(dev, "dmic-pol %x", es8375->dmic_pol);
   705	
 > 706		for (i = 0; i < ARRAY_SIZE(es8375_core_supplies); i++)
   707			es8375->core_supply[i].supply = es8375_core_supplies[i];
   708		ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(es8375_core_supplies), es8375->core_supply);
   709		if (ret) {
   710			dev_err(dev, "Failed to request core supplies %d\n", ret);
   711			return ret;
   712		}
   713	
   714		es8375->mclk = devm_clk_get(dev, "mclk");
   715		if (IS_ERR(es8375->mclk))
   716			return dev_err_probe(dev, PTR_ERR(es8375->mclk), "unable to get mclk\n");
   717	
   718		if (!es8375->mclk)
   719			dev_warn(dev, "assuming static mclk\n");
   720	
   721		ret = clk_prepare_enable(es8375->mclk);
   722		if (ret) {
   723			dev_err(dev, "unable to enable mclk\n");
   724			return ret;
   725		}
   726		ret = regulator_bulk_enable(ARRAY_SIZE(es8375_core_supplies), es8375->core_supply);
   727		if (ret) {
   728			dev_err(dev, "Failed to enable core supplies: %d\n", ret);
   729			clk_disable_unprepare(es8375->mclk);
   730			return ret;
   731		}
   732	
   733		return 0;
   734	}
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
