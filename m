Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48B1E25E8;
	Wed,  9 Apr 2025 21:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232942; cv=none; b=gMOdKjSsopJsKrP/lfXjuERzVBztWJrTDlgO/KLT8W8DDI8JOtS/bNdkR8IVrgv5VCZeo5Dydbd4t6B+vfgIYFuHTWNtQkGKBXRmNBVLrPSLU8o71laDs7hmsilqSpbRJDIl3Q0VEAnufnVpfNzerpz2mxAgvjTLF0/n+M5Vit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232942; c=relaxed/simple;
	bh=9FwTOr+ksva7BcWKrWAypW1bPBx+E92LgMFk7X5OZQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoHyy5pR6zuiAhKMODBx0v2pvgc/hX037m2d+cc8cbz3nBDsurdW3o4OJ0LSdZJhY3k38PzfUJrdwmHRE5lC8p3p5QOnw13wmtmd2lV88mSiQkBoiVzcJAzYS47a6gXW6MIsxZwSyEzRc1LBEQKDnjTfdNUNiH8810ee4Ed5ySo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baw1qUL+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baw1qUL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744232941; x=1775768941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FwTOr+ksva7BcWKrWAypW1bPBx+E92LgMFk7X5OZQw=;
  b=baw1qUL+iKw3QVkMa3yHvG9nBCX17LWKrW7MjjL4SDtfiEdvPcbXHZ6N
   pkhY+KHVbbWx0yuumbXZZS9dUdtTbJ/sVyYp99y6c0dnMiOhO28Tc9Gns
   C0R9iWlwZUPa47WaIaNTomWcZDQtOCyPoUO+ttpZKYyq1Ntu7pAdV6XlW
   dlb5+UN1ZMq4xaRBpY7qf+a15iosxOCP+yJ2Upm1X4rzr+/WrjkshuMau
   l2fmhjaUh5C9ydDd8GpR09krh8onoeeOMLugYjB+Fqs+DVz2UiNcKB8Tx
   U0Py6Q9KWFhT7ixJWjW/xeAyQnz6gvn0b10XPj/GjEumWb5hl5bZ6y+rw
   g==;
X-CSE-ConnectionGUID: GwgRp4y/RQeB/a8o2r/MEA==
X-CSE-MsgGUID: JmPlGaUcRsWSRQMnVqP+6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45820533"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45820533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 14:09:00 -0700
X-CSE-ConnectionGUID: dRISYAzsS+uR+D60TYeNVA==
X-CSE-MsgGUID: PYadYmTTQIqQqMRejQ+j1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133816955"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2025 14:08:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2cfG-0009KJ-14;
	Wed, 09 Apr 2025 21:08:54 +0000
Date: Thu, 10 Apr 2025 05:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stuart Henderson <stuarth@opensource.cirrus.com>,
	Qi Zhou <qi.zhou@cirrus.com>,
	Piotr Stankiewicz <piotrs@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] ASoC: cs48l32: Add driver for Cirrus Logic CS48L32
 audio DSP
Message-ID: <202504100405.7znimLX7-lkp@intel.com>
References: <20250408162310.670041-3-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408162310.670041-3-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus robh/for-next linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-dt-bindings-Add-Cirrus-Logic-CS48L32-audio-DSP/20250409-002905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250408162310.670041-3-rf%40opensource.cirrus.com
patch subject: [PATCH 2/2] ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP
config: powerpc64-randconfig-003-20250410 (https://download.01.org/0day-ci/archive/20250410/202504100405.7znimLX7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100405.7znimLX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100405.7znimLX7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs48l32.c:3435:3: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    3435 |                 i + 1, ana_mode_l, ana_mode_r);
         |                 ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   sound/soc/codecs/cs48l32.c:3408:7: note: initialize the variable 'i' to silence this warning
    3408 |         int i;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +3435 sound/soc/codecs/cs48l32.c

  3402	
  3403	static int cs48l32_init_inputs(struct snd_soc_component *component)
  3404	{
  3405		struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
  3406		struct regmap *regmap = cs48l32_codec->core.regmap;
  3407		unsigned int ana_mode_l, ana_mode_r, dig_mode;
  3408		int i;
  3409	
  3410		/*
  3411		 * Initialize input modes from the A settings. For muxed inputs the
  3412		 * B settings will be applied if the mux is changed
  3413		 */
  3414		switch (cs48l32_codec->in_type[0][0]) {
  3415		default:
  3416		case CS48L32_IN_TYPE_DIFF:
  3417			ana_mode_l = 0;
  3418			break;
  3419		case CS48L32_IN_TYPE_SE:
  3420			ana_mode_l = 1 << CS48L32_INx_SRC_SHIFT;
  3421			break;
  3422		}
  3423	
  3424		switch (cs48l32_codec->in_type[1][0]) {
  3425		default:
  3426		case CS48L32_IN_TYPE_DIFF:
  3427			ana_mode_r = 0;
  3428			break;
  3429		case CS48L32_IN_TYPE_SE:
  3430			ana_mode_r = 1 << CS48L32_INx_SRC_SHIFT;
  3431			break;
  3432		}
  3433	
  3434		dev_dbg(cs48l32_codec->core.dev, "IN%d_1 Analogue mode=#%x,#%x\n",
> 3435			i + 1, ana_mode_l, ana_mode_r);
  3436	
  3437		regmap_update_bits(regmap,
  3438				   CS48L32_IN1L_CONTROL1,
  3439				   CS48L32_INx_SRC_MASK,
  3440				   ana_mode_l);
  3441	
  3442		regmap_update_bits(regmap,
  3443				   CS48L32_IN1R_CONTROL1,
  3444				   CS48L32_INx_SRC_MASK,
  3445				   ana_mode_r);
  3446	
  3447		for (i = 0; i < ARRAY_SIZE(cs48l32_codec->pdm_sup); i++) {
  3448			dig_mode = cs48l32_codec->pdm_sup[i] << CS48L32_IN1_PDM_SUP_SHIFT;
  3449	
  3450			dev_dbg(cs48l32_codec->core.dev, "IN%d PDM_SUP=#%x\n", i + 1, dig_mode);
  3451	
  3452			regmap_update_bits(regmap,
  3453					   CS48L32_INPUT1_CONTROL1 + (i * 0x40),
  3454					   CS48L32_IN1_PDM_SUP_MASK, dig_mode);
  3455		}
  3456	
  3457		return 0;
  3458	}
  3459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
