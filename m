Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD3720E70F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785688; cv=none; b=NwW3lCFZpPQ+7Z3vIMirkm/62CfEFa1FIQx3Q15dmyLqVzp0qSyZbPi/TSyabbIXCYSnb5dL+Hoqnk0/Gb5QwYLSZR/xi6tFRuG9jJZkVjw2iTEpxR0nW+Uh45ZsZ+0HUV4qP82vmip6jD+mrk/MclgUC7Ne8lhjHGLfFSB6z5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785688; c=relaxed/simple;
	bh=MmnQ6pUU3Bt/lMIRMd8pYGcQL+3FQYAmHFERfEN3iZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STeVcJK3s75SgGLErmwW2YIsrXwU6Gdg8ODZT+XMruLBOSTsxTBDmJrNoenWuEOtl+gFGSPHoE7VAeD9VckmJytLgLn3tKkGyGGeIehWwYboDtCHVm2ORr5M1327xrA889IBMdwmYmwLW4Fo4/vUAT/IaOVgCqvBQmYbCSV7FFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmJrxUUZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmJrxUUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743785686; x=1775321686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmnQ6pUU3Bt/lMIRMd8pYGcQL+3FQYAmHFERfEN3iZc=;
  b=MmJrxUUZWaG8edjyc9xX+XOvaVsADtiVawYdEnU3beHVYWGxkI5T8gWJ
   w5IE85TmSJREopcNBMZmZDdmVHEM6GdGWXNlBWbiECpEZpVOwGIqARL+W
   ASKTSNEGvu0T9fRH3rUsLfFZcDyMvP+IG+pkB6K23l8Ey8X3ELjykCXhP
   0+M4YMOPPOe0c2ruxiYXMUd2yLnG291EUI5k876NqIptcF4QiwiT6wDEo
   /Txsa4CTm5xcWLqMvPf5VDj2i7EnhGF1unXf2HKmAiByu0jF8p1xic5j6
   xivGrYfGtFGEIIjfKIt46r5u9tn13Cu8Jknc7KPlQHGKEn6l9tSXjnu7Y
   Q==;
X-CSE-ConnectionGUID: iK4i7kaDRTeEd+K1asqMDA==
X-CSE-MsgGUID: v6ULbghPTDqT1VDvRXl9nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="47944499"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="47944499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:54:45 -0700
X-CSE-ConnectionGUID: cUU7LJlgTIKWrdVGBCMYxg==
X-CSE-MsgGUID: Aan6dfxGSNuVFi91uyRqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127874894"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 09:54:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kJU-0001Ox-24;
	Fri, 04 Apr 2025 16:54:40 +0000
Date: Sat, 5 Apr 2025 00:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/cleanups 2/10]
 drivers/input/keyboard/gpio_keys.c:593:17: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
Message-ID: <202504050021.ouKQ30CE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
commit: 58b3f2cce01bb48b6f6e0c1cdca5e5a2fc0c56ad [2/10] hrtimers: Delete hrtimer_init()
config: csky-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050021.ouKQ30CE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050021.ouKQ30CE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050021.ouKQ30CE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/keyboard/gpio_keys.c: In function 'gpio_keys_setup_key':
>> drivers/input/keyboard/gpio_keys.c:593:17: error: implicit declaration of function 'hrtimer_init'; did you mean 'hrtimers_init'? [-Werror=implicit-function-declaration]
     593 |                 hrtimer_init(&bdata->debounce_timer,
         |                 ^~~~~~~~~~~~
         |                 hrtimers_init
   cc1: some warnings being treated as errors


vim +593 drivers/input/keyboard/gpio_keys.c

d8ee4a1c90529e Laxman Dewangan    2012-03-19  493  
5298cc4cc753bb Bill Pemberton     2012-11-23  494  static int gpio_keys_setup_key(struct platform_device *pdev,
d9080921aa32c7 Dmitry Torokhov    2012-03-18  495  				struct input_dev *input,
83e4947a569f4d Hans de Goede      2017-01-21  496  				struct gpio_keys_drvdata *ddata,
700a38b27eefc5 Dmitry Torokhov    2016-10-19  497  				const struct gpio_keys_button *button,
83e4947a569f4d Hans de Goede      2017-01-21  498  				int idx,
700a38b27eefc5 Dmitry Torokhov    2016-10-19  499  				struct fwnode_handle *child)
bc8f1eaf68a8aa Ben Dooks          2009-11-10  500  {
92a47674f57b4a Alexander Stein    2011-04-11  501  	const char *desc = button->desc ? button->desc : "gpio_keys";
9e3af04f878731 Mika Westerberg    2010-02-04  502  	struct device *dev = &pdev->dev;
83e4947a569f4d Hans de Goede      2017-01-21  503  	struct gpio_button_data *bdata = &ddata->data[idx];
d8ee4a1c90529e Laxman Dewangan    2012-03-19  504  	irq_handler_t isr;
9e3af04f878731 Mika Westerberg    2010-02-04  505  	unsigned long irqflags;
3717194f249227 Tony Lindgren      2023-11-29  506  	const char *wakedesc;
27245519f0de50 Alexander Shiyan   2014-04-28  507  	int irq;
27245519f0de50 Alexander Shiyan   2014-04-28  508  	int error;
bc8f1eaf68a8aa Ben Dooks          2009-11-10  509  
d9080921aa32c7 Dmitry Torokhov    2012-03-18  510  	bdata->input = input;
d9080921aa32c7 Dmitry Torokhov    2012-03-18  511  	bdata->button = button;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  512  	spin_lock_init(&bdata->lock);
d8ee4a1c90529e Laxman Dewangan    2012-03-19  513  
700a38b27eefc5 Dmitry Torokhov    2016-10-19  514  	if (child) {
2a60f598777d8b Dmitry Torokhov    2019-09-13  515  		bdata->gpiod = devm_fwnode_gpiod_get(dev, child,
2a60f598777d8b Dmitry Torokhov    2019-09-13  516  						     NULL, GPIOD_IN, desc);
700a38b27eefc5 Dmitry Torokhov    2016-10-19  517  		if (IS_ERR(bdata->gpiod)) {
700a38b27eefc5 Dmitry Torokhov    2016-10-19  518  			error = PTR_ERR(bdata->gpiod);
904ef2c47d8f3d Geert Uytterhoeven 2023-07-17  519  			if (error != -ENOENT)
904ef2c47d8f3d Geert Uytterhoeven 2023-07-17  520  				return dev_err_probe(dev, error,
904ef2c47d8f3d Geert Uytterhoeven 2023-07-17  521  						     "failed to get gpio\n");
904ef2c47d8f3d Geert Uytterhoeven 2023-07-17  522  
700a38b27eefc5 Dmitry Torokhov    2016-10-19  523  			/*
700a38b27eefc5 Dmitry Torokhov    2016-10-19  524  			 * GPIO is optional, we may be dealing with
700a38b27eefc5 Dmitry Torokhov    2016-10-19  525  			 * purely interrupt-driven setup.
700a38b27eefc5 Dmitry Torokhov    2016-10-19  526  			 */
700a38b27eefc5 Dmitry Torokhov    2016-10-19  527  			bdata->gpiod = NULL;
700a38b27eefc5 Dmitry Torokhov    2016-10-19  528  		}
700a38b27eefc5 Dmitry Torokhov    2016-10-19  529  	} else if (gpio_is_valid(button->gpio)) {
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  530  		/*
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  531  		 * Legacy GPIO number, so request the GPIO here and
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  532  		 * convert it to descriptor.
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  533  		 */
a04abf25fb1ac4 Andy Shevchenko    2024-11-04  534  		error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN, desc);
bc8f1eaf68a8aa Ben Dooks          2009-11-10  535  		if (error < 0) {
d8ee4a1c90529e Laxman Dewangan    2012-03-19  536  			dev_err(dev, "Failed to request GPIO %d, error %d\n",
bc8f1eaf68a8aa Ben Dooks          2009-11-10  537  				button->gpio, error);
d8ee4a1c90529e Laxman Dewangan    2012-03-19  538  			return error;
bc8f1eaf68a8aa Ben Dooks          2009-11-10  539  		}
bc8f1eaf68a8aa Ben Dooks          2009-11-10  540  
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  541  		bdata->gpiod = gpio_to_desc(button->gpio);
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  542  		if (!bdata->gpiod)
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  543  			return -EINVAL;
a04abf25fb1ac4 Andy Shevchenko    2024-11-04  544  
a04abf25fb1ac4 Andy Shevchenko    2024-11-04  545  		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
a04abf25fb1ac4 Andy Shevchenko    2024-11-04  546  			gpiod_toggle_active_low(bdata->gpiod);
700a38b27eefc5 Dmitry Torokhov    2016-10-19  547  	}
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  548  
700a38b27eefc5 Dmitry Torokhov    2016-10-19  549  	if (bdata->gpiod) {
83fc580dcc2f0f Jeffy Chen         2018-03-08  550  		bool active_low = gpiod_is_active_low(bdata->gpiod);
83fc580dcc2f0f Jeffy Chen         2018-03-08  551  
28ed684fa3c0a7 Grazvydas Ignotas  2010-06-28  552  		if (button->debounce_interval) {
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  553  			error = gpiod_set_debounce(bdata->gpiod,
28ed684fa3c0a7 Grazvydas Ignotas  2010-06-28  554  					button->debounce_interval * 1000);
28ed684fa3c0a7 Grazvydas Ignotas  2010-06-28  555  			/* use timer if gpiolib doesn't provide debounce */
28ed684fa3c0a7 Grazvydas Ignotas  2010-06-28  556  			if (error < 0)
8ed92556761e1f Dmitry Torokhov    2014-11-14  557  				bdata->software_debounce =
d8ee4a1c90529e Laxman Dewangan    2012-03-19  558  						button->debounce_interval;
c9efb0ba281e88 Paul Cercueil      2021-03-21  559  
c9efb0ba281e88 Paul Cercueil      2021-03-21  560  			/*
c9efb0ba281e88 Paul Cercueil      2021-03-21  561  			 * If reading the GPIO won't sleep, we can use a
c9efb0ba281e88 Paul Cercueil      2021-03-21  562  			 * hrtimer instead of a standard timer for the software
c9efb0ba281e88 Paul Cercueil      2021-03-21  563  			 * debounce, to reduce the latency as much as possible.
c9efb0ba281e88 Paul Cercueil      2021-03-21  564  			 */
c9efb0ba281e88 Paul Cercueil      2021-03-21  565  			bdata->debounce_use_hrtimer =
c9efb0ba281e88 Paul Cercueil      2021-03-21  566  					!gpiod_cansleep(bdata->gpiod);
28ed684fa3c0a7 Grazvydas Ignotas  2010-06-28  567  		}
28ed684fa3c0a7 Grazvydas Ignotas  2010-06-28  568  
3717194f249227 Tony Lindgren      2023-11-29  569  		/*
3717194f249227 Tony Lindgren      2023-11-29  570  		 * If an interrupt was specified, use it instead of the gpio
3717194f249227 Tony Lindgren      2023-11-29  571  		 * interrupt and use the gpio for reading the state. A separate
3717194f249227 Tony Lindgren      2023-11-29  572  		 * interrupt may be used as the main button interrupt for
3717194f249227 Tony Lindgren      2023-11-29  573  		 * runtime PM to detect events also in deeper idle states. If a
3717194f249227 Tony Lindgren      2023-11-29  574  		 * dedicated wakeirq is used for system suspend only, see below
3717194f249227 Tony Lindgren      2023-11-29  575  		 * for bdata->wakeirq setup.
3717194f249227 Tony Lindgren      2023-11-29  576  		 */
97d86e07b71643 Dmitry Torokhov    2014-11-14  577  		if (button->irq) {
97d86e07b71643 Dmitry Torokhov    2014-11-14  578  			bdata->irq = button->irq;
97d86e07b71643 Dmitry Torokhov    2014-11-14  579  		} else {
5feeca3c1e39c0 Geert Uytterhoeven 2016-10-19  580  			irq = gpiod_to_irq(bdata->gpiod);
bc8f1eaf68a8aa Ben Dooks          2009-11-10  581  			if (irq < 0) {
bc8f1eaf68a8aa Ben Dooks          2009-11-10  582  				error = irq;
0b670b54119902 Hermes Zhang       2023-12-29  583  				dev_err_probe(dev, error,
0b670b54119902 Hermes Zhang       2023-12-29  584  					      "Unable to get irq number for GPIO %d\n",
0b670b54119902 Hermes Zhang       2023-12-29  585  					      button->gpio);
27245519f0de50 Alexander Shiyan   2014-04-28  586  				return error;
bc8f1eaf68a8aa Ben Dooks          2009-11-10  587  			}
d8ee4a1c90529e Laxman Dewangan    2012-03-19  588  			bdata->irq = irq;
97d86e07b71643 Dmitry Torokhov    2014-11-14  589  		}
d8ee4a1c90529e Laxman Dewangan    2012-03-19  590  
8ed92556761e1f Dmitry Torokhov    2014-11-14  591  		INIT_DELAYED_WORK(&bdata->work, gpio_keys_gpio_work_func);
bc8f1eaf68a8aa Ben Dooks          2009-11-10  592  
c9efb0ba281e88 Paul Cercueil      2021-03-21 @593  		hrtimer_init(&bdata->debounce_timer,
c9efb0ba281e88 Paul Cercueil      2021-03-21  594  			     CLOCK_REALTIME, HRTIMER_MODE_REL);
c9efb0ba281e88 Paul Cercueil      2021-03-21  595  		bdata->debounce_timer.function = gpio_keys_debounce_timer;
c9efb0ba281e88 Paul Cercueil      2021-03-21  596  
d8ee4a1c90529e Laxman Dewangan    2012-03-19  597  		isr = gpio_keys_gpio_isr;
9e3af04f878731 Mika Westerberg    2010-02-04  598  		irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  599  
83fc580dcc2f0f Jeffy Chen         2018-03-08  600  		switch (button->wakeup_event_action) {
83fc580dcc2f0f Jeffy Chen         2018-03-08  601  		case EV_ACT_ASSERTED:
83fc580dcc2f0f Jeffy Chen         2018-03-08  602  			bdata->wakeup_trigger_type = active_low ?
83fc580dcc2f0f Jeffy Chen         2018-03-08  603  				IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
83fc580dcc2f0f Jeffy Chen         2018-03-08  604  			break;
83fc580dcc2f0f Jeffy Chen         2018-03-08  605  		case EV_ACT_DEASSERTED:
83fc580dcc2f0f Jeffy Chen         2018-03-08  606  			bdata->wakeup_trigger_type = active_low ?
83fc580dcc2f0f Jeffy Chen         2018-03-08  607  				IRQ_TYPE_EDGE_RISING : IRQ_TYPE_EDGE_FALLING;
83fc580dcc2f0f Jeffy Chen         2018-03-08  608  			break;
83fc580dcc2f0f Jeffy Chen         2018-03-08  609  		case EV_ACT_ANY:
83fc580dcc2f0f Jeffy Chen         2018-03-08  610  		default:
83fc580dcc2f0f Jeffy Chen         2018-03-08  611  			/*
83fc580dcc2f0f Jeffy Chen         2018-03-08  612  			 * For other cases, we are OK letting suspend/resume
83fc580dcc2f0f Jeffy Chen         2018-03-08  613  			 * not reconfigure the trigger type.
83fc580dcc2f0f Jeffy Chen         2018-03-08  614  			 */
83fc580dcc2f0f Jeffy Chen         2018-03-08  615  			break;
83fc580dcc2f0f Jeffy Chen         2018-03-08  616  		}
d8ee4a1c90529e Laxman Dewangan    2012-03-19  617  	} else {
d8ee4a1c90529e Laxman Dewangan    2012-03-19  618  		if (!button->irq) {
700a38b27eefc5 Dmitry Torokhov    2016-10-19  619  			dev_err(dev, "Found button without gpio or irq\n");
d8ee4a1c90529e Laxman Dewangan    2012-03-19  620  			return -EINVAL;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  621  		}
700a38b27eefc5 Dmitry Torokhov    2016-10-19  622  
d8ee4a1c90529e Laxman Dewangan    2012-03-19  623  		bdata->irq = button->irq;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  624  
d8ee4a1c90529e Laxman Dewangan    2012-03-19  625  		if (button->type && button->type != EV_KEY) {
d8ee4a1c90529e Laxman Dewangan    2012-03-19  626  			dev_err(dev, "Only EV_KEY allowed for IRQ buttons.\n");
d8ee4a1c90529e Laxman Dewangan    2012-03-19  627  			return -EINVAL;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  628  		}
d8ee4a1c90529e Laxman Dewangan    2012-03-19  629  
8ed92556761e1f Dmitry Torokhov    2014-11-14  630  		bdata->release_delay = button->debounce_interval;
019002f20cb5b9 Paul Cercueil      2021-03-21  631  		hrtimer_init(&bdata->release_timer,
019002f20cb5b9 Paul Cercueil      2021-03-21  632  			     CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
019002f20cb5b9 Paul Cercueil      2021-03-21  633  		bdata->release_timer.function = gpio_keys_irq_timer;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  634  
d8ee4a1c90529e Laxman Dewangan    2012-03-19  635  		isr = gpio_keys_irq_isr;
d8ee4a1c90529e Laxman Dewangan    2012-03-19  636  		irqflags = 0;
83fc580dcc2f0f Jeffy Chen         2018-03-08  637  
83fc580dcc2f0f Jeffy Chen         2018-03-08  638  		/*
83fc580dcc2f0f Jeffy Chen         2018-03-08  639  		 * For IRQ buttons, there is no interrupt for release.
83fc580dcc2f0f Jeffy Chen         2018-03-08  640  		 * So we don't need to reconfigure the trigger type for wakeup.
83fc580dcc2f0f Jeffy Chen         2018-03-08  641  		 */
d8ee4a1c90529e Laxman Dewangan    2012-03-19  642  	}
d8ee4a1c90529e Laxman Dewangan    2012-03-19  643  
83e4947a569f4d Hans de Goede      2017-01-21  644  	bdata->code = &ddata->keymap[idx];
83e4947a569f4d Hans de Goede      2017-01-21  645  	*bdata->code = button->code;
83e4947a569f4d Hans de Goede      2017-01-21  646  	input_set_capability(input, button->type ?: EV_KEY, *bdata->code);
d8ee4a1c90529e Laxman Dewangan    2012-03-19  647  
27245519f0de50 Alexander Shiyan   2014-04-28  648  	/*
8ed92556761e1f Dmitry Torokhov    2014-11-14  649  	 * Install custom action to cancel release timer and
27245519f0de50 Alexander Shiyan   2014-04-28  650  	 * workqueue item.
27245519f0de50 Alexander Shiyan   2014-04-28  651  	 */
b4e66e7d1948e0 Guenter Roeck      2017-01-21  652  	error = devm_add_action(dev, gpio_keys_quiesce_key, bdata);
27245519f0de50 Alexander Shiyan   2014-04-28  653  	if (error) {
b4e66e7d1948e0 Guenter Roeck      2017-01-21  654  		dev_err(dev, "failed to register quiesce action, error: %d\n",
27245519f0de50 Alexander Shiyan   2014-04-28  655  			error);
27245519f0de50 Alexander Shiyan   2014-04-28  656  		return error;
27245519f0de50 Alexander Shiyan   2014-04-28  657  	}
27245519f0de50 Alexander Shiyan   2014-04-28  658  
9e3af04f878731 Mika Westerberg    2010-02-04  659  	/*
9e3af04f878731 Mika Westerberg    2010-02-04  660  	 * If platform has specified that the button can be disabled,
9e3af04f878731 Mika Westerberg    2010-02-04  661  	 * we don't want it to share the interrupt line.
9e3af04f878731 Mika Westerberg    2010-02-04  662  	 */
9e3af04f878731 Mika Westerberg    2010-02-04  663  	if (!button->can_disable)
9e3af04f878731 Mika Westerberg    2010-02-04  664  		irqflags |= IRQF_SHARED;
9e3af04f878731 Mika Westerberg    2010-02-04  665  
b4e66e7d1948e0 Guenter Roeck      2017-01-21  666  	error = devm_request_any_context_irq(dev, bdata->irq, isr, irqflags,
b4e66e7d1948e0 Guenter Roeck      2017-01-21  667  					     desc, bdata);
94a8cab8caaa56 Philippe Langlais  2011-01-20  668  	if (error < 0) {
bc8f1eaf68a8aa Ben Dooks          2009-11-10  669  		dev_err(dev, "Unable to claim irq %d; error %d\n",
d8ee4a1c90529e Laxman Dewangan    2012-03-19  670  			bdata->irq, error);
27245519f0de50 Alexander Shiyan   2014-04-28  671  		return error;
bc8f1eaf68a8aa Ben Dooks          2009-11-10  672  	}
bc8f1eaf68a8aa Ben Dooks          2009-11-10  673  
3717194f249227 Tony Lindgren      2023-11-29  674  	if (!button->wakeirq)
3717194f249227 Tony Lindgren      2023-11-29  675  		return 0;
3717194f249227 Tony Lindgren      2023-11-29  676  
3717194f249227 Tony Lindgren      2023-11-29  677  	/* Use :wakeup suffix like drivers/base/power/wakeirq.c does */
3717194f249227 Tony Lindgren      2023-11-29  678  	wakedesc = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", desc);
3717194f249227 Tony Lindgren      2023-11-29  679  	if (!wakedesc)
3717194f249227 Tony Lindgren      2023-11-29  680  		return -ENOMEM;
3717194f249227 Tony Lindgren      2023-11-29  681  
3717194f249227 Tony Lindgren      2023-11-29  682  	bdata->wakeirq = button->wakeirq;
3717194f249227 Tony Lindgren      2023-11-29  683  	irqflags |= IRQF_NO_SUSPEND;
3717194f249227 Tony Lindgren      2023-11-29  684  
3717194f249227 Tony Lindgren      2023-11-29  685  	/*
3717194f249227 Tony Lindgren      2023-11-29  686  	 * Wakeirq shares the handler with the main interrupt, it's only
3717194f249227 Tony Lindgren      2023-11-29  687  	 * active during system suspend. See gpio_keys_button_enable_wakeup()
3717194f249227 Tony Lindgren      2023-11-29  688  	 * and gpio_keys_button_disable_wakeup().
3717194f249227 Tony Lindgren      2023-11-29  689  	 */
3717194f249227 Tony Lindgren      2023-11-29  690  	error = devm_request_any_context_irq(dev, bdata->wakeirq, isr,
3717194f249227 Tony Lindgren      2023-11-29  691  					     irqflags, wakedesc, bdata);
3717194f249227 Tony Lindgren      2023-11-29  692  	if (error < 0) {
3717194f249227 Tony Lindgren      2023-11-29  693  		dev_err(dev, "Unable to claim wakeirq %d; error %d\n",
3717194f249227 Tony Lindgren      2023-11-29  694  			bdata->irq, error);
3717194f249227 Tony Lindgren      2023-11-29  695  		return error;
3717194f249227 Tony Lindgren      2023-11-29  696  	}
3717194f249227 Tony Lindgren      2023-11-29  697  
3717194f249227 Tony Lindgren      2023-11-29  698  	/*
3717194f249227 Tony Lindgren      2023-11-29  699  	 * Disable wakeirq until suspend. IRQF_NO_AUTOEN won't work if
3717194f249227 Tony Lindgren      2023-11-29  700  	 * IRQF_SHARED was set based on !button->can_disable.
3717194f249227 Tony Lindgren      2023-11-29  701  	 */
3717194f249227 Tony Lindgren      2023-11-29  702  	disable_irq(bdata->wakeirq);
3717194f249227 Tony Lindgren      2023-11-29  703  
bc8f1eaf68a8aa Ben Dooks          2009-11-10  704  	return 0;
bc8f1eaf68a8aa Ben Dooks          2009-11-10  705  }
bc8f1eaf68a8aa Ben Dooks          2009-11-10  706  

:::::: The code at line 593 was first introduced by commit
:::::: c9efb0ba281e88e2faec6ad919be509b6ab8ead6 Input: gpio-keys - use hrtimer for software debounce, if possible

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
