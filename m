Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513151531F2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 05:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738906212; cv=none; b=o9F6q8V96AGP45Eupv5WopySjLv7HN6xptHkGfVTPUjVBFNzmuoCUP80FEwCAFNbvFPNwiS+FsAphcG0sTpKZ2zN6GIZ8dP7pBcPnMidxwWZNxBGJaHZvjazeMsgyxonPi8BB8kNHi3Y0yGgpwnGwrxlr1yAcpFJxXpDbRlCfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738906212; c=relaxed/simple;
	bh=JO4ZiNukq7aWvDEsuifoweiQNeb5h0YQzfMBNCLMCf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPc7GNcgfpZIaIRpsF315z/fggXYFZ4/JmjpjwMvgPz9BZ1XtZjcvYSoiN7yBKekoy9ATjE+E2Y6fxPE11p8ivpXYu+5QWdN9Op8lgbhXrfUAjGKqlv9JBih9OYa7KB53I0IXu/Mxa4D5DmLh7fvZyL1sBLOa2U4QpucsHL1KtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdzkjNIw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdzkjNIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738906209; x=1770442209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JO4ZiNukq7aWvDEsuifoweiQNeb5h0YQzfMBNCLMCf8=;
  b=WdzkjNIwXsDKZv7TjGeTzSrFMZXQL65VN/7jr0dNGZjfd3FfmiBneoLG
   odY7W+Bco5w9H+bSunryWXZNoA1LBo1qQkbcMgcoUV4nwNTFJ6xQWCsNV
   Ib4TmkQVdFBthpWFCndcCx7UV/JnyxmMtXa1Rl7E/h88cWe92ldtIMlZu
   JFyH807uVyiKi4ZSWPPYT2+DRb2qJ9sx/uJ/xKnAr82OPYdDOg+CqK4vM
   2pfMJFwnFe9NIAopKeDNUfEJh9tovYPOiNcjK/UERB20n4vBK/4/jYVZd
   UrdYj2qQqg3Lb2PWAxKPI1zjfkxGkerQxvb05MY0PFr03G+Ig822HWzJy
   Q==;
X-CSE-ConnectionGUID: XCC76xfxQi+LaGb1GpvgFQ==
X-CSE-MsgGUID: /jSWt/bnS6yrQdum3o+IYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50973820"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50973820"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 21:30:08 -0800
X-CSE-ConnectionGUID: IabXt/xEQEicLLcd9pmJvQ==
X-CSE-MsgGUID: jtVFW9uCTWma/KpbDWMqcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="112045186"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Feb 2025 21:30:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgGwG-000xnF-2s;
	Fri, 07 Feb 2025 05:30:04 +0000
Date: Fri, 7 Feb 2025 13:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/adc/aspeed_adc.c:232:65: warning: '%s' directive
 argument is null
Message-ID: <202502071351.SvEnPZHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Billy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b
commit: 9223bd0471bb078377a98cfc188dae47448f0456 iio: adc: aspeed: Use model_data to set clk scaler.
date:   3 years, 4 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250207/202502071351.SvEnPZHG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071351.SvEnPZHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071351.SvEnPZHG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/aspeed_adc.c: In function 'aspeed_adc_probe':
>> drivers/iio/adc/aspeed_adc.c:232:65: warning: '%s' directive argument is null [-Wformat-truncation=]
     232 |         snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
         |                                                                 ^~


vim +232 drivers/iio/adc/aspeed_adc.c

   208	
   209	static int aspeed_adc_probe(struct platform_device *pdev)
   210	{
   211		struct iio_dev *indio_dev;
   212		struct aspeed_adc_data *data;
   213		int ret;
   214		u32 adc_engine_control_reg_val;
   215		unsigned long scaler_flags = 0;
   216		char clk_name[32], clk_parent_name[32];
   217	
   218		indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
   219		if (!indio_dev)
   220			return -ENOMEM;
   221	
   222		data = iio_priv(indio_dev);
   223		data->dev = &pdev->dev;
   224		data->model_data = of_device_get_match_data(&pdev->dev);
   225	
   226		data->base = devm_platform_ioremap_resource(pdev, 0);
   227		if (IS_ERR(data->base))
   228			return PTR_ERR(data->base);
   229	
   230		/* Register ADC clock prescaler with source specified by device tree. */
   231		spin_lock_init(&data->clk_lock);
 > 232		snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
   233			 of_clk_get_parent_name(pdev->dev.of_node, 0));
   234	
   235		if (data->model_data->need_prescaler) {
   236			snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-prescaler",
   237				 data->model_data->model_name);
   238			data->clk_prescaler = clk_hw_register_divider(
   239				&pdev->dev, clk_name, clk_parent_name, 0,
   240				data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
   241				&data->clk_lock);
   242			if (IS_ERR(data->clk_prescaler))
   243				return PTR_ERR(data->clk_prescaler);
   244			snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name),
   245				 clk_name);
   246			scaler_flags = CLK_SET_RATE_PARENT;
   247		}
   248		/*
   249		 * Register ADC clock scaler downstream from the prescaler. Allow rate
   250		 * setting to adjust the prescaler as well.
   251		 */
   252		snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-scaler",
   253			 data->model_data->model_name);
   254		data->clk_scaler = clk_hw_register_divider(
   255			&pdev->dev, clk_name, clk_parent_name, scaler_flags,
   256			data->base + ASPEED_REG_CLOCK_CONTROL, 0,
   257			data->model_data->scaler_bit_width, 0, &data->clk_lock);
   258		if (IS_ERR(data->clk_scaler)) {
   259			ret = PTR_ERR(data->clk_scaler);
   260			goto scaler_error;
   261		}
   262	
   263		data->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
   264		if (IS_ERR(data->rst)) {
   265			dev_err(&pdev->dev,
   266				"invalid or missing reset controller device tree entry");
   267			ret = PTR_ERR(data->rst);
   268			goto reset_error;
   269		}
   270		reset_control_deassert(data->rst);
   271	
   272		ret = aspeed_adc_vref_config(indio_dev);
   273		if (ret)
   274			goto vref_config_error;
   275	
   276		if (data->model_data->wait_init_sequence) {
   277			/* Enable engine in normal mode. */
   278			writel(FIELD_PREP(ASPEED_ADC_OP_MODE,
   279					  ASPEED_ADC_OP_MODE_NORMAL) |
   280				       ASPEED_ADC_ENGINE_ENABLE,
   281			       data->base + ASPEED_REG_ENGINE_CONTROL);
   282	
   283			/* Wait for initial sequence complete. */
   284			ret = readl_poll_timeout(data->base + ASPEED_REG_ENGINE_CONTROL,
   285						 adc_engine_control_reg_val,
   286						 adc_engine_control_reg_val &
   287						 ASPEED_ADC_CTRL_INIT_RDY,
   288						 ASPEED_ADC_INIT_POLLING_TIME,
   289						 ASPEED_ADC_INIT_TIMEOUT);
   290			if (ret)
   291				goto poll_timeout_error;
   292		}
   293	
   294		/* Start all channels in normal mode. */
   295		ret = clk_prepare_enable(data->clk_scaler->clk);
   296		if (ret)
   297			goto clk_enable_error;
   298	
   299		adc_engine_control_reg_val =
   300			ASPEED_ADC_CTRL_CHANNEL |
   301			FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_NORMAL) |
   302			ASPEED_ADC_ENGINE_ENABLE;
   303		writel(adc_engine_control_reg_val,
   304		       data->base + ASPEED_REG_ENGINE_CONTROL);
   305	
   306		indio_dev->name = data->model_data->model_name;
   307		indio_dev->info = &aspeed_adc_iio_info;
   308		indio_dev->modes = INDIO_DIRECT_MODE;
   309		indio_dev->channels = aspeed_adc_iio_channels;
   310		indio_dev->num_channels = data->model_data->num_channels;
   311	
   312		ret = iio_device_register(indio_dev);
   313		if (ret)
   314			goto iio_register_error;
   315	
   316		return 0;
   317	
   318	iio_register_error:
   319		writel(FIELD_PREP(ASPEED_ADC_OP_MODE, ASPEED_ADC_OP_MODE_PWR_DOWN),
   320		       data->base + ASPEED_REG_ENGINE_CONTROL);
   321		clk_disable_unprepare(data->clk_scaler->clk);
   322	clk_enable_error:
   323	poll_timeout_error:
   324	vref_config_error:
   325		reset_control_assert(data->rst);
   326	reset_error:
   327		clk_hw_unregister_divider(data->clk_scaler);
   328	scaler_error:
   329		if (data->model_data->need_prescaler)
   330			clk_hw_unregister_divider(data->clk_prescaler);
   331		return ret;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
