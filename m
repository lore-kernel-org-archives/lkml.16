Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503F1D5178;
	Mon, 21 Apr 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223694; cv=none; b=cF8BZVq7aUHskwfcYh2P9Xz6bBIdvUQLZ6VOp7/YLoGMTY4hVJRoYi5qcMJxgOCyDIibIjiz1qdEQYmLriNNdOMqVcJQRVr98VkCC9Mb77BrfxnaAyUuzJL3Nhu8xSTlXGcpu4BiQpdUkVup5vN+/jQf2J/i0Lc6J2gD94OLEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223694; c=relaxed/simple;
	bh=C7Yr9B85WuyxzW/DyvbRmztxW7xiL896fdLQzr9xw6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw7VMsKmFw9hljs7cqdxRZGSGPCaYe5+GM7Q9S7TJZDrp+K9A9FEdlk5wbXCWhUhNhi0lfWsC+ZMnTE2jmiLN+QtmXdS7zoukix9spMF6ZZ+OTTQHtlyiPxJW8qEOBOWXWHmssRE5TfMYL3jkWXErHJDUHC6aac2XZu5ie0r6zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHfwiB9w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHfwiB9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745223692; x=1776759692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C7Yr9B85WuyxzW/DyvbRmztxW7xiL896fdLQzr9xw6o=;
  b=jHfwiB9wL40LX16Qab3oTybHGUBnbu3AjyoIgFgYSFtIS2ORVWCXZh6B
   O+WN4hCNqANfr6kTrifPj2ndYfhPru08prZbRGqoXNW9yEpJ/DiVorU0B
   6wk/NWNB1/UzGfJBlNHQ6h/uBnbF7YfyaUD9BLFB5CqHejMlGdMRMBux4
   eRadN1AULaRGudVckK7O8wFqeF5u1+OyBrSA4TC2Nhk0mbF4PMHsHiNoR
   IhsVnabdXeA9vOF1yP1Uvw51Ah9pTDo+G4x45Wc/wwhYytaiO44Fm0Xek
   TReeiIsy/R2xVfutA1Xf/VZItaUZYf+UBrbxxDPgL99tjLDdeX+CJou/L
   A==;
X-CSE-ConnectionGUID: w/qyha6xRt2AzLKQTnoYUw==
X-CSE-MsgGUID: 2m3MhDhqT7+IMInIfsa03g==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46635718"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46635718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:21:31 -0700
X-CSE-ConnectionGUID: 9zpDJSyeTBKPkrXoSj84vw==
X-CSE-MsgGUID: s+znY0pVR464Y46mObjRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="168862263"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Apr 2025 01:21:27 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6mP6-0000H1-2v;
	Mon, 21 Apr 2025 08:21:24 +0000
Date: Mon, 21 Apr 2025 16:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: carlos.song@nxp.com, miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] i3c: master: svc: switch to bulk clk API for
 flexible clock support
Message-ID: <202504211643.FJsMtmVl-lkp@intel.com>
References: <20250421061544.2471379-3-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421061544.2471379-3-carlos.song@nxp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc3 next-20250417]
[cannot apply to shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/carlos-song-nxp-com/dt-bindings-i3c-silvaco-i3c-master-add-i-MX94-and-i-MX95-I3C/20250421-140716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250421061544.2471379-3-carlos.song%40nxp.com
patch subject: [PATCH 2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
config: arm-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211643.FJsMtmVl-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211643.FJsMtmVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211643.FJsMtmVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master/svc-i3c-master.c:1898:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1898 |                 return dev_err_probe(dev, ret, "can't get I3C clocks\n");
         |                                           ^~~
   drivers/i3c/master/svc-i3c-master.c:1882:9: note: initialize the variable 'ret' to silence this warning
    1882 |         int ret, i;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1898 drivers/i3c/master/svc-i3c-master.c

  1877	
  1878	static int svc_i3c_master_probe(struct platform_device *pdev)
  1879	{
  1880		struct device *dev = &pdev->dev;
  1881		struct svc_i3c_master *master;
  1882		int ret, i;
  1883	
  1884		master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
  1885		if (!master)
  1886			return -ENOMEM;
  1887	
  1888		master->drvdata = of_device_get_match_data(dev);
  1889		if (!master->drvdata)
  1890			return -EINVAL;
  1891	
  1892		master->regs = devm_platform_ioremap_resource(pdev, 0);
  1893		if (IS_ERR(master->regs))
  1894			return PTR_ERR(master->regs);
  1895	
  1896		master->num_clks = devm_clk_bulk_get_all(dev, &master->clks);
  1897		if (master->num_clks < 0)
> 1898			return dev_err_probe(dev, ret, "can't get I3C clocks\n");
  1899	
  1900		for (i = 0; i < master->num_clks; i++) {
  1901			if (!strcmp(master->clks[i].id, "fast_clk"))
  1902				break;
  1903		}
  1904	
  1905		if (i == master->num_clks)
  1906			return dev_err_probe(dev, -EINVAL,
  1907					     "can't get I3C peripheral clock\n");
  1908	
  1909		master->fclk = devm_clk_get(dev, "fast_clk");
  1910		if (IS_ERR(master->fclk))
  1911			return PTR_ERR(master->fclk);
  1912	
  1913		master->irq = platform_get_irq(pdev, 0);
  1914		if (master->irq < 0)
  1915			return master->irq;
  1916	
  1917		master->dev = dev;
  1918		ret = clk_bulk_prepare_enable(master->num_clks, master->clks);
  1919		if (ret)
  1920			return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
  1921	
  1922		INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
  1923		INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
  1924		mutex_init(&master->lock);
  1925	
  1926		ret = devm_request_irq(dev, master->irq, svc_i3c_master_irq_handler,
  1927				       IRQF_NO_SUSPEND, "svc-i3c-irq", master);
  1928		if (ret)
  1929			goto err_disable_clks;
  1930	
  1931		master->free_slots = GENMASK(SVC_I3C_MAX_DEVS - 1, 0);
  1932	
  1933		spin_lock_init(&master->xferqueue.lock);
  1934		INIT_LIST_HEAD(&master->xferqueue.list);
  1935	
  1936		spin_lock_init(&master->ibi.lock);
  1937		master->ibi.num_slots = SVC_I3C_MAX_DEVS;
  1938		master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
  1939						 sizeof(*master->ibi.slots),
  1940						 GFP_KERNEL);
  1941		if (!master->ibi.slots) {
  1942			ret = -ENOMEM;
  1943			goto err_disable_clks;
  1944		}
  1945	
  1946		platform_set_drvdata(pdev, master);
  1947	
  1948		pm_runtime_set_autosuspend_delay(&pdev->dev, SVC_I3C_PM_TIMEOUT_MS);
  1949		pm_runtime_use_autosuspend(&pdev->dev);
  1950		pm_runtime_get_noresume(&pdev->dev);
  1951		pm_runtime_set_active(&pdev->dev);
  1952		pm_runtime_enable(&pdev->dev);
  1953	
  1954		svc_i3c_master_reset(master);
  1955	
  1956		/* Register the master */
  1957		ret = i3c_master_register(&master->base, &pdev->dev,
  1958					  &svc_i3c_master_ops, false);
  1959		if (ret)
  1960			goto rpm_disable;
  1961	
  1962		pm_runtime_mark_last_busy(&pdev->dev);
  1963		pm_runtime_put_autosuspend(&pdev->dev);
  1964	
  1965		return 0;
  1966	
  1967	rpm_disable:
  1968		pm_runtime_dont_use_autosuspend(&pdev->dev);
  1969		pm_runtime_put_noidle(&pdev->dev);
  1970		pm_runtime_disable(&pdev->dev);
  1971		pm_runtime_set_suspended(&pdev->dev);
  1972	
  1973	err_disable_clks:
  1974		clk_bulk_disable_unprepare(master->num_clks, master->clks);
  1975	
  1976		return ret;
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
