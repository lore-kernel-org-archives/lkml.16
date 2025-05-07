Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC3212B3D;
	Wed,  7 May 2025 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601660; cv=none; b=pKth/9R+0k138zHdbhNQ2gSaSOUftfyk+GFgCufMPiclZz3101uPnQOwYb9Ftb9WbmkXQT3FoIlQuqLeIGwDWcGae2y2hJaLesZiVRswPA8cwlJ4ioKNnpnvSIW0cLCpkfhwHZyUBYi3RWhrN0NEa90Ja5Ch/ZnrErJHH9VQKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601660; c=relaxed/simple;
	bh=MLmA2L5chrHPgpCD3BRZ1TXnu2+lCd8+i3p3+R3Fc6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcamhAsYYxda0vhJiI33i+msQmkfWTYBahBt2C/K3bO+ci0uOBx0E+wdWsY6Dl8qZPjiPSYs1Sw3ErCAwzT8TPpSC/pP7OUnHfPiXzDAxTLKBroW8vVSI1pKW1FAa055d6mGepm5nmRH2t6BdNXyvEmHhr0VLgqcy1ry/W6WVoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uh/0T31z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uh/0T31z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601654; x=1778137654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MLmA2L5chrHPgpCD3BRZ1TXnu2+lCd8+i3p3+R3Fc6M=;
  b=Uh/0T31zqcF4tB6VkqwOUd7/rVgiwdmrpLjdbAynreuP+3Rk0BG8BquA
   2J1Bx0EGXLPjENy/SDksn9o9r4bDbrBc132bx/eKQ6AaEk9MoMYj9EFgA
   vGpDMZ5Fi+Kmc2KvRQEFx0XfK1Vzta2pD94ghR4Q/X9peGXGQ5WhPqsw/
   s9DLUrVwsmyzpvVxlsDrNflmYlj9NOwG4CeftCc1qJBmsTPOPmGXSpsuA
   Q8msU+tbJlRUYmduoDbBg3M/llS3oMEdU58W3Qxe08f54DFNYWYI9pa/b
   47U9mRknZAdC4OSptTlwlJU+k7vcY6ITzSIfmWKfoasOz4pCxH57Rsapw
   A==;
X-CSE-ConnectionGUID: jc1q8XsDTmO6dlXooz+WOw==
X-CSE-MsgGUID: fRZP8O9CTcO+Epo6hdylNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52127896"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52127896"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:07:34 -0700
X-CSE-ConnectionGUID: qQ+yodlfTgSzrmo4bM+ONg==
X-CSE-MsgGUID: 2X6Lp8LYSQW8ClLCjAtpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135865532"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:07:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYsK-0007GD-25;
	Wed, 07 May 2025 07:07:28 +0000
Date: Wed, 7 May 2025 15:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 3/3] clk: add TI CDCE6214 clock driver
Message-ID: <202505071411.GB5uyv3w-lkp@intel.com>
References: <20250430-clk-cdce6214-v4-3-9f15e7126ac6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-clk-cdce6214-v4-3-9f15e7126ac6@pengutronix.de>

Hi Sascha,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/clk-make-determine_rate-optional-for-non-reparenting-clocks/20250430-170445
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250430-clk-cdce6214-v4-3-9f15e7126ac6%40pengutronix.de
patch subject: [PATCH v4 3/3] clk: add TI CDCE6214 clock driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071411.GB5uyv3w-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071411.GB5uyv3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071411.GB5uyv3w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk-cdce6214.c:319:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     319 |                            FIELD_PREP(R2_REFSEL_SW, 2));
         |                            ^
>> drivers/clk/clk-cdce6214.c:333:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     333 |         div = FIELD_GET(R25_IP_RDIV, val);
         |               ^
   drivers/clk/clk-cdce6214.c:362:53: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |                 regmap_update_bits(priv->regmap, 25, R25_IP_RDIV, FIELD_PREP(R25_IP_RDIV, 0));
         |                                                                   ^
   drivers/clk/clk-cdce6214.c:370:52: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     370 |         regmap_update_bits(priv->regmap, 25, R25_IP_RDIV, FIELD_PREP(R25_IP_RDIV, div));
         |                                                           ^
   drivers/clk/clk-cdce6214.c:383:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     383 |         idx = FIELD_GET(R2_REFSEL_SW, val);
         |               ^
   drivers/clk/clk-cdce6214.c:406:55: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |         regmap_update_bits(priv->regmap, 25, R25_REF_CH_MUX, FIELD_PREP(R25_REF_CH_MUX, index));
         |                                                              ^
   drivers/clk/clk-cdce6214.c:480:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     480 |                 div = FIELD_GET(R56_CH1_DIV, val);
         |                       ^
   drivers/clk/clk-cdce6214.c:535:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     535 |                                    FIELD_PREP(R56_CH1_DIV, div));
         |                                    ^
   drivers/clk/clk-cdce6214.c:563:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     563 |                 idx = FIELD_GET(R56_CH1_MUX, val);
         |                       ^
   drivers/clk/clk-cdce6214.c:589:53: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     589 |                 regmap_update_bits(priv->regmap, 56, R56_CH1_MUX, FIELD_PREP(R56_CH1_MUX, index));
         |                                                                   ^
   drivers/clk/clk-cdce6214.c:643:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     643 |         ndiv = FIELD_GET(R30_PLL_NDIV, val);
         |                ^
   drivers/clk/clk-cdce6214.c:755:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     755 |                            FIELD_PREP(R34_PLL_DEN_23_16, den >> 16));
         |                            ^
   drivers/clk/clk-cdce6214.c:842:13: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     842 |                 div = psx[FIELD_GET(R47_PLL_PSA, val)];
         |                           ^
   drivers/clk/clk-cdce6214.c:883:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     883 |                                    FIELD_PREP(R47_PLL_PSA, div));
         |                                    ^
   drivers/clk/clk-cdce6214.c:998:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     998 |                            FIELD_PREP(R24_IP_XO_CLOAD, i));
         |                            ^
   15 errors generated.


vim +/FIELD_PREP +319 drivers/clk/clk-cdce6214.c

   315	
   316	static int cdce6214_configure(struct cdce6214 *priv)
   317	{
   318		regmap_update_bits(priv->regmap, 2, R2_REFSEL_SW,
 > 319				   FIELD_PREP(R2_REFSEL_SW, 2));
   320	
   321		return 0;
   322	}
   323	
   324	static unsigned long cdce6214_clk_out0_recalc_rate(struct clk_hw *hw,
   325							   unsigned long parent_rate)
   326	{
   327		struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
   328		struct cdce6214 *priv = clock->priv;
   329		unsigned int val, div;
   330	
   331		regmap_read(priv->regmap, 25, &val);
   332	
 > 333		div = FIELD_GET(R25_IP_RDIV, val);
   334	
   335		if (!div)
   336			return parent_rate * 2;
   337	
   338		return DIV_ROUND_UP_ULL((u64)parent_rate, div);
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
