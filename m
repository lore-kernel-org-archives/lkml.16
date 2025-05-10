Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D1282FA
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746920679; cv=none; b=McGZ/u2du2yNMU2dtk0yzh4AYaAflnxn/xJYU3Rhir59vbgLewH29hdjhj19y/ZDSewkFu60M0SHibTqWIFAxrkxykuLxTsJqOuVvmsoXD4du4UaZTovPiE6TMaCe25sxAjkAp15DqHPzCrhuM3hTNCIFWifdKBGtriTtXCkQhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746920679; c=relaxed/simple;
	bh=OcrjuwKmH8gRN7V43BS4Upp3Th3waCQG80IGh2FoVz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h94DhOlz2n1NyoDwhhYXH6BNxdLDCG6VJULSQUvFoQ7wUlpqxbhLS8mA/gvl7XybbEs9ws+T+fgsMX9GrmG5UVqQzWj0oipPcFFAyP8JweJRwNpUFV7EYksXvD/5QfNLJ67/zvzuW6V4Bsf7FI/lrE1zS2g/kdNe0lecIacBY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkJM9bR8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkJM9bR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746920677; x=1778456677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcrjuwKmH8gRN7V43BS4Upp3Th3waCQG80IGh2FoVz4=;
  b=JkJM9bR88wAKO2g8PODF9Abcm6nEA1e1huG3PdFQKXj2Gd0cNA+F/XBO
   F10Okd+tUmw/2nr1tYJAJmoHUXWABKFnALD/CNLps9R9AzRnrJrQlcNvC
   NbeFsGjQOse3jZ5mutuddiiGF3JQxeU7Lt4J2zhnZptbp/4l4siMaOAP6
   N0N8q/uMnhUktNsel2UaXg+/yiQP/mPjrmFU47ZkaZR5wvr5tVcWk4emj
   C3Iu9b6zSFTMMOlA7+zOdSHI/HdClza2yjBsipMiGrwqPM+hXzEKUXr5y
   km8Aksj+L+zAwu7Ou8crvnKctB0Anz/TYB7RGaKbDyVOHdoymPgkQeT34
   Q==;
X-CSE-ConnectionGUID: AZABKGSNTVCJ5k2RswBhag==
X-CSE-MsgGUID: QmcM5a0DTCeec1AYHwX/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="51394163"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="51394163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 16:44:36 -0700
X-CSE-ConnectionGUID: gwdmZW5LQRygAzLkKRwe8Q==
X-CSE-MsgGUID: JkSDOhp1QDu43oWTYiL+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136858507"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 May 2025 16:44:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDtrs-000DTj-2F;
	Sat, 10 May 2025 23:44:32 +0000
Date: Sun, 11 May 2025 07:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: warning: '_sel'
 directive output may be truncated writing 4 bytes into a region of size
 between 3 and 13
Message-ID: <202505110731.zGNzAnGK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   345030986df8f7712f9e4c00fe61e145c8984ef3
commit: 03ee752f00fd0daa082b43774cfd03a7f9a17385 drm/imx: prefer snprintf over sprintf
date:   1 year, 3 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250511/202505110731.zGNzAnGK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110731.zGNzAnGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110731.zGNzAnGK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function 'imx_ldb_probe':
>> drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: warning: '_sel' directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Wformat-truncation=]
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                                                         ^~~~
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: 'snprintf' output between 8 and 18 bytes into a destination of size 16
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_sel +658 drivers/gpu/drm/imx/ipuv3/imx-ldb.c

   617	
   618	static int imx_ldb_probe(struct platform_device *pdev)
   619	{
   620		struct device *dev = &pdev->dev;
   621		struct device_node *np = dev->of_node;
   622		struct device_node *child;
   623		struct imx_ldb *imx_ldb;
   624		int dual;
   625		int ret;
   626		int i;
   627	
   628		imx_ldb = devm_kzalloc(dev, sizeof(*imx_ldb), GFP_KERNEL);
   629		if (!imx_ldb)
   630			return -ENOMEM;
   631	
   632		imx_ldb->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
   633		if (IS_ERR(imx_ldb->regmap)) {
   634			dev_err(dev, "failed to get parent regmap\n");
   635			return PTR_ERR(imx_ldb->regmap);
   636		}
   637	
   638		/* disable LDB by resetting the control register to POR default */
   639		regmap_write(imx_ldb->regmap, IOMUXC_GPR2, 0);
   640	
   641		imx_ldb->dev = dev;
   642		imx_ldb->lvds_mux = device_get_match_data(dev);
   643	
   644		dual = of_property_read_bool(np, "fsl,dual-channel");
   645		if (dual)
   646			imx_ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
   647	
   648		/*
   649		 * There are three different possible clock mux configurations:
   650		 * i.MX53:  ipu1_di0_sel, ipu1_di1_sel
   651		 * i.MX6q:  ipu1_di0_sel, ipu1_di1_sel, ipu2_di0_sel, ipu2_di1_sel
   652		 * i.MX6dl: ipu1_di0_sel, ipu1_di1_sel, lcdif_sel
   653		 * Map them all to di0_sel...di3_sel.
   654		 */
   655		for (i = 0; i < 4; i++) {
   656			char clkname[16];
   657	
 > 658			snprintf(clkname, sizeof(clkname), "di%d_sel", i);
   659			imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
   660			if (IS_ERR(imx_ldb->clk_sel[i])) {
   661				ret = PTR_ERR(imx_ldb->clk_sel[i]);
   662				imx_ldb->clk_sel[i] = NULL;
   663				break;
   664			}
   665	
   666			imx_ldb->clk_parent[i] = clk_get_parent(imx_ldb->clk_sel[i]);
   667		}
   668		if (i == 0)
   669			return ret;
   670	
   671		for_each_child_of_node(np, child) {
   672			struct imx_ldb_channel *channel;
   673			int bus_format;
   674	
   675			ret = of_property_read_u32(child, "reg", &i);
   676			if (ret || i < 0 || i > 1) {
   677				ret = -EINVAL;
   678				goto free_child;
   679			}
   680	
   681			if (!of_device_is_available(child))
   682				continue;
   683	
   684			if (dual && i > 0) {
   685				dev_warn(dev, "dual-channel mode, ignoring second output\n");
   686				continue;
   687			}
   688	
   689			channel = &imx_ldb->channel[i];
   690			channel->ldb = imx_ldb;
   691			channel->chno = i;
   692	
   693			/*
   694			 * The output port is port@4 with an external 4-port mux or
   695			 * port@2 with the internal 2-port mux.
   696			 */
   697			ret = drm_of_find_panel_or_bridge(child,
   698							  imx_ldb->lvds_mux ? 4 : 2, 0,
   699							  &channel->panel, &channel->bridge);
   700			if (ret && ret != -ENODEV)
   701				goto free_child;
   702	
   703			/* panel ddc only if there is no bridge */
   704			if (!channel->bridge) {
   705				ret = imx_ldb_panel_ddc(dev, channel, child);
   706				if (ret)
   707					goto free_child;
   708			}
   709	
   710			bus_format = of_get_bus_format(dev, child);
   711			if (bus_format == -EINVAL) {
   712				/*
   713				 * If no bus format was specified in the device tree,
   714				 * we can still get it from the connected panel later.
   715				 */
   716				if (channel->panel && channel->panel->funcs &&
   717				    channel->panel->funcs->get_modes)
   718					bus_format = 0;
   719			}
   720			if (bus_format < 0) {
   721				dev_err(dev, "could not determine data mapping: %d\n",
   722					bus_format);
   723				ret = bus_format;
   724				goto free_child;
   725			}
   726			channel->bus_format = bus_format;
   727			channel->child = child;
   728		}
   729	
   730		platform_set_drvdata(pdev, imx_ldb);
   731	
   732		return component_add(&pdev->dev, &imx_ldb_ops);
   733	
   734	free_child:
   735		of_node_put(child);
   736		return ret;
   737	}
   738	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
