Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA05383
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751684599; cv=none; b=FoVANFoQTbu8MHQiPh+tylSIBEtaS+tCFKAIYkXhreYQO02EHAFhMdDzy9cj8mXjLS625k99+7vVzZjDFsAbzfr0jvDLCucnFIaS+n0NGs/hBAiSY0tLheCsX5kKIqrK2URT/7N8aWCP/WWdjmoea7AjJBp8pR8A7iIFtSWXVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751684599; c=relaxed/simple;
	bh=KU2HkhyZ7OIUpZr/uwk3LrvlICUxGwjXLAKYY1viuVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSCjCWbPCtp3Z+5N1S+p5GvHfNljq4Ph6G5L8cT0sIUhpu5V0iiJR9VzKB5ujfMFkAdBj2jz9NSjMX1b6N+AfOnXAJspt/eJhXS8I//5scxSp0ADxDeAHx7LaHbahuhtEMo1sF1up1+Req5QzzD9umWgRiayrIedmaNw9dFiAFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXzDIVKE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXzDIVKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751684597; x=1783220597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KU2HkhyZ7OIUpZr/uwk3LrvlICUxGwjXLAKYY1viuVc=;
  b=PXzDIVKEtFDmvJREwEFb3Yq80YlTneXSQ/A7M7H4pUQWE/bWnhal14Jy
   ROx0NwkX+gAoOFjecJMW5LJCrbyU4B+JXerFfLKOg6Xia3qlt0O6ZCvTK
   mtHaTOfIhtSgrnC9gw0TEzH7gU97cS4Y5LxfNx4R2kPTjt7zWxw2nOhqu
   jjZVFR9Z1+Y5IZPs6yeAc3cTUg4yAM7TOe3vWpNAQcY33lLccpsXJEgLD
   lUjM1FIYQPMQbRkTiHq4uNCHGg04zYOaeS573AtNcL2xEukSv+CwxYO5F
   3gXu4VQbfOd1KiHG4tTL4piygIsw/oaDgfjB2GcTv4cTWYTfgj2kDKc9t
   A==;
X-CSE-ConnectionGUID: veLP8W9WRbmQX//OnotIDQ==
X-CSE-MsgGUID: swyG2Os1T/eYJ3MMAvvAJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53720388"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="53720388"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 20:03:13 -0700
X-CSE-ConnectionGUID: wEDPN7bJTFibulDKDz+rog==
X-CSE-MsgGUID: 48b7g6n8Qqi7SxCOKlhq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="159101587"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2025 20:03:10 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXtBE-0004EX-0L;
	Sat, 05 Jul 2025 03:03:08 +0000
Date: Sat, 5 Jul 2025 11:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>, vkoul@kernel.org, kishon@kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	aradhya.bhatia@linux.dev, s-jain1@ti.com, r-donadkar@ti.com,
	tomi.valkeinen@ideasonboard.com, j-choudhary@ti.com,
	a0512644@ti.com, devarsht@ti.com
Subject: Re: [PATCH v4 1/2] phy: cadence: cdns-dphy: Fix PLL lock and
 O_CMN_READY polling
Message-ID: <202507051038.XCl5miJ7-lkp@intel.com>
References: <20250704125915.1224738-2-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704125915.1224738-2-devarsht@ti.com>

Hi Devarsh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Devarsh-Thakkar/phy-cadence-cdns-dphy-Fix-PLL-lock-and-O_CMN_READY-polling/20250704-210349
base:   linus/master
patch link:    https://lore.kernel.org/r/20250704125915.1224738-2-devarsht%40ti.com
patch subject: [PATCH v4 1/2] phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
config: x86_64-buildonly-randconfig-003-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051038.XCl5miJ7-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051038.XCl5miJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051038.XCl5miJ7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/cadence/cdns-dphy.c:408:45: error: no member named 'hs_clk_rate' in 'struct cdns_dphy_cfg'
     408 |         ret = cdns_dphy_tx_get_band_ctrl(dphy->cfg.hs_clk_rate);
         |                                          ~~~~~~~~~ ^
   1 error generated.


vim +408 drivers/phy/cadence/cdns-dphy.c

   370	
   371	static int cdns_dphy_power_on(struct phy *phy)
   372	{
   373		struct cdns_dphy *dphy = phy_get_drvdata(phy);
   374		int ret;
   375		u32 reg;
   376	
   377		if (!dphy->is_configured || dphy->is_powered)
   378			return -EINVAL;
   379	
   380		clk_prepare_enable(dphy->psm_clk);
   381		clk_prepare_enable(dphy->pll_ref_clk);
   382	
   383		/*
   384		 * Configure the internal PSM clk divider so that the DPHY has a
   385		 * 1MHz clk (or something close).
   386		 */
   387		ret = cdns_dphy_setup_psm(dphy);
   388		if (ret) {
   389			dev_err(&dphy->phy->dev, "Failed to setup PSM with error %d\n", ret);
   390			goto err_power_on;
   391		}
   392	
   393		/*
   394		 * Configure attach clk lanes to data lanes: the DPHY has 2 clk lanes
   395		 * and 8 data lanes, each clk lane can be attache different set of
   396		 * data lanes. The 2 groups are named 'left' and 'right', so here we
   397		 * just say that we want the 'left' clk lane to drive the 'left' data
   398		 * lanes.
   399		 */
   400		cdns_dphy_set_clk_lane_cfg(dphy, DPHY_CLK_CFG_LEFT_DRIVES_LEFT);
   401	
   402		/*
   403		 * Configure the DPHY PLL that will be used to generate the TX byte
   404		 * clk.
   405		 */
   406		cdns_dphy_set_pll_cfg(dphy, &dphy->cfg);
   407	
 > 408		ret = cdns_dphy_tx_get_band_ctrl(dphy->cfg.hs_clk_rate);
   409		if (ret < 0) {
   410			dev_err(&dphy->phy->dev, "Failed to get band control value with error %d\n", ret);
   411			goto err_power_on;
   412		}
   413	
   414		reg = FIELD_PREP(DPHY_BAND_CFG_LEFT_BAND, ret) |
   415		      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, ret);
   416		writel(reg, dphy->regs + DPHY_BAND_CFG);
   417	
   418		/* Start TX state machine. */
   419		writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
   420		       dphy->regs + DPHY_CMN_SSM);
   421	
   422		ret = cdns_dphy_wait_for_pll_lock(dphy);
   423		if (ret) {
   424			dev_err(&dphy->phy->dev, "Failed to lock PLL with error %d\n", ret);
   425			goto err_power_on;
   426		}
   427	
   428		ret = cdns_dphy_wait_for_cmn_ready(dphy);
   429		if (ret) {
   430			dev_err(&dphy->phy->dev, "O_CMN_READY signal failed to assert with error %d\n",
   431				ret);
   432			goto err_power_on;
   433		}
   434	
   435		dphy->is_powered = true;
   436	
   437		return 0;
   438	
   439	err_power_on:
   440		clk_disable_unprepare(dphy->pll_ref_clk);
   441		clk_disable_unprepare(dphy->psm_clk);
   442	
   443		return ret;
   444	}
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
