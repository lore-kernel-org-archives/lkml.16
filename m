Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296419C569;
	Thu, 19 Jun 2025 01:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295519; cv=none; b=VuWr5g1pozbZRopb+dmcolcU9LSHat+tLuPsGNsOZLG7a0yCySdNdR3sJWQl6k2vz6IPlLLjxzJFG1Qbimak8MuLA2misNzat464Krr9oaEUhbVtLOU0hJArX39xtAraTxs4HfNzrxrufq+84xz+M7ntgGVhxLz9o07++vKmG+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295519; c=relaxed/simple;
	bh=BzOXZwRZxgzV7xVqQZORpiZycgtFFrShOgeYvpoHBVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5mljrzdytSO6u2XJnCLx1eDC0GD8pULtFvMA0viSho6l5Hh5eGjT8rl5/69wvorFWtATuyT6E/V2uAq90XKzKEigZI5B1J95+4clg3DOOgzxKghtyjwwCw+dMpleXxMlv6wbFO87pFBQIcxipgSHT4nZTi/i9dhrHtrN638ROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0iDjLo7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0iDjLo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750295518; x=1781831518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BzOXZwRZxgzV7xVqQZORpiZycgtFFrShOgeYvpoHBVQ=;
  b=b0iDjLo7Us8PpAGIGAfZ4EprOBTNDADRFa0phhKq/mM6BK4BG1DnJH1y
   3bttO6OulEE4cQp/LXcKKJv28GH96LT+Ss6UdhN7oI8CHcl27kcufCru/
   Xra9bT4U4QiOLJEEZk4NrFPAlUfBcz9YHA0YkIVfcanAr5jRILQeeI8fR
   vR4iPqsp4HG2mNIpviOz98EeLB/uNgcw53/KJqOOBS++y+KBOGDWmTBuW
   Xz7Xrg0xE2e2k6SH7m4OA/wwIOSjrBmuXiYECaNvyBaEa036dEa2su0LN
   3RMZKwKE5W7YQbXvuDI0j+Li2XjmpkGTZZtuB88ee/BTZkNUrwDFn6LaU
   w==;
X-CSE-ConnectionGUID: 8KDkD+3OTpOXm7Znud9QRQ==
X-CSE-MsgGUID: Slp9tYlYTfK28QNW+dk5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63145556"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="63145556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 18:11:58 -0700
X-CSE-ConnectionGUID: Voe26QhkR/eFtwzo+bZimg==
X-CSE-MsgGUID: 5+TIkr5lQIa8N8iUZhgafw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="181293695"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 18:11:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS3om-000KIw-1s;
	Thu, 19 Jun 2025 01:11:52 +0000
Date: Thu, 19 Jun 2025 09:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 2/4] clk: add TI CDCE6214 clock driver
Message-ID: <202506190816.R10xrC8n-lkp@intel.com>
References: <20250618-clk-cdce6214-v5-2-9938b8ed0b94@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-clk-cdce6214-v5-2-9938b8ed0b94@pengutronix.de>

Hi Sascha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e04c78d86a9699d136910cfc0bdcf01087e3267e]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/dt-bindings-clock-add-TI-CDCE6214-binding/20250618-172505
base:   e04c78d86a9699d136910cfc0bdcf01087e3267e
patch link:    https://lore.kernel.org/r/20250618-clk-cdce6214-v5-2-9938b8ed0b94%40pengutronix.de
patch subject: [PATCH v5 2/4] clk: add TI CDCE6214 clock driver
config: alpha-randconfig-r054-20250619 (https://download.01.org/0day-ci/archive/20250619/202506190816.R10xrC8n-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190816.R10xrC8n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-cdce6214.c:682:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
--
>> drivers/clk/clk-cdce6214.c:631:2-3: Unneeded semicolon
   drivers/clk/clk-cdce6214.c:547:2-3: Unneeded semicolon
   drivers/clk/clk-cdce6214.c:654:2-3: Unneeded semicolon
   drivers/clk/clk-cdce6214.c:603:2-3: Unneeded semicolon
   drivers/clk/clk-cdce6214.c:908:2-3: Unneeded semicolon
   drivers/clk/clk-cdce6214.c:946:2-3: Unneeded semicolon

vim +682 drivers/clk/clk-cdce6214.c

   607	
   608	static u8 cdce6214_clk_out_get_parent(struct clk_hw *hw)
   609	{
   610		struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
   611		struct cdce6214 *priv = clock->priv;
   612		unsigned int val, idx;
   613	
   614		switch (clock->index) {
   615		case CDCE6214_CLK_OUT1:
   616			regmap_read(priv->regmap, R56, &val);
   617			idx = FIELD_GET(R56_CH1_MUX, val);
   618			break;
   619		case CDCE6214_CLK_OUT2:
   620			regmap_read(priv->regmap, R62, &val);
   621			idx = FIELD_GET(R62_CH2_MUX, val);
   622			break;
   623		case CDCE6214_CLK_OUT3:
   624			regmap_read(priv->regmap, R67, &val);
   625			idx = FIELD_GET(R67_CH3_MUX, val);
   626			break;
   627		case CDCE6214_CLK_OUT4:
   628			regmap_read(priv->regmap, R72, &val);
   629			idx = FIELD_GET(R72_CH4_MUX, val);
   630			break;
 > 631		};
   632	
   633		return idx;
   634	}
   635	
   636	static int cdce6214_clk_out_set_parent(struct clk_hw *hw, u8 index)
   637	{
   638		struct cdce6214_clock *clock = hw_to_cdce6214_clk(hw);
   639		struct cdce6214 *priv = clock->priv;
   640	
   641		switch (clock->index) {
   642		case CDCE6214_CLK_OUT1:
   643			regmap_update_bits(priv->regmap, R56, R56_CH1_MUX, FIELD_PREP(R56_CH1_MUX, index));
   644			break;
   645		case CDCE6214_CLK_OUT2:
   646			regmap_update_bits(priv->regmap, R62, R62_CH2_MUX, FIELD_PREP(R62_CH2_MUX, index));
   647			break;
   648		case CDCE6214_CLK_OUT3:
   649			regmap_update_bits(priv->regmap, R67, R67_CH3_MUX, FIELD_PREP(R67_CH3_MUX, index));
   650			break;
   651		case CDCE6214_CLK_OUT4:
   652			regmap_update_bits(priv->regmap, R72, R72_CH4_MUX, FIELD_PREP(R72_CH4_MUX, index));
   653			break;
   654		};
   655	
   656		return 0;
   657	}
   658	
   659	static const struct clk_ops cdce6214_clk_out_ops = {
   660		.prepare = cdce6214_clk_out_prepare,
   661		.unprepare = cdce6214_clk_out_unprepare,
   662		.is_prepared = cdce6214_clk_out_is_prepared,
   663		.recalc_rate = cdce6214_clk_out_recalc_rate,
   664		.determine_rate = cdce6214_clk_out_determine_rate,
   665		.set_rate = cdce6214_clk_out_set_rate,
   666		.get_parent = cdce6214_clk_out_get_parent,
   667		.set_parent = cdce6214_clk_out_set_parent,
   668	};
   669	
   670	static int pll_calc_values(unsigned long parent_rate, unsigned long out,
   671				   unsigned long *ndiv, unsigned long *num, unsigned long *den)
   672	{
   673		u64 a;
   674	
   675		if (out < CDCE6214_VCO_MIN || out > CDCE6214_VCO_MAX)
   676			return -EINVAL;
   677	
   678		*den = 10000000;
   679		*ndiv = out / parent_rate;
   680		a = out % parent_rate;
   681		a *= *den;
 > 682		do_div(a, parent_rate);
   683		*num = a;
   684	
   685		return 0;
   686	}
   687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
