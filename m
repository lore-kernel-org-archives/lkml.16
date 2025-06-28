Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA11A704B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138596; cv=none; b=BDWHD8PeGxS3EJwiPoOLsaZrKohuhi64Re9PdrhvgcKWHOWXAA2ys4PLSW3MU+LMmwaLukn3Q8E5k0lIFM2DLuGW0pHWHub/K42gDXehHG5xiYSh15+pLvRicPbcjRnvXwkPHvRBfmCTY7touPEJJaufdand0E7ojoOo7saYAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138596; c=relaxed/simple;
	bh=ltcX8rdpZoFIf5dU5W8qqLMn+qvjzIJbsz8ES40p5fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4kmtFH73P+InNwzr8FLHTzj0L0KCI9LBEU5kg/u45N+WNmLjJU6afDiRkbqBGE+gmRgnFAWb0lp6tL8IXi/LRd0sB99HWrkUQk4g2vEq88BF9HLkBy/nItwyM5tjs3dTJmBWWBdCpVtCRbyEMXsfgeHgSWBHrKa5pir0OH6T0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpAUvloB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpAUvloB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751138593; x=1782674593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ltcX8rdpZoFIf5dU5W8qqLMn+qvjzIJbsz8ES40p5fA=;
  b=GpAUvloBa9pgN9P4LfNde0FucKWdL2zQoESAi6qr01LxxuUgJ30UWZDN
   WFJGR3+Gija6xiJ7iy9MbQv9z07/NjJqR1gBYkg0BWCB7WjCV9bQl7M1d
   nnqPQ/7sASh4bl4zp7vs4vAHfGueB7h31CwqzNPuTjg4uqGWPPXUYj9PF
   qQGh5f7C5MwnBH4987He7j+mRVqRCX+qyEoJZTTEtkBWU2ftraG6BzFeI
   mbLnovGN5e3UvM9xaOhzfZo8tF/XbWsalolYBeodMhJ7tiSgIFfTJPRIo
   5GCc965CtZwD8N+0L6n2/oRZYIb9W202SC8rY0ZRkpRAI4NLVa4f++qj3
   g==;
X-CSE-ConnectionGUID: D52tUlNQSeCouS6Zq89BNQ==
X-CSE-MsgGUID: aNQS6vNcSw+H4dQ+jCAShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53357841"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53357841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:23:12 -0700
X-CSE-ConnectionGUID: 4kpU99xgTzOfmuqVEn9rNA==
X-CSE-MsgGUID: utM2t3JtS2KrPbneJFf/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152706213"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jun 2025 12:23:11 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVb8n-0000oJ-0T;
	Sat, 28 Jun 2025 19:23:09 +0000
Date: Sat, 28 Jun 2025 21:22:14 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: drivers/leds/leds-pca955x.c:696:53: warning: '%u' directive output
 may be truncated writing between 1 and 10 bytes into a region of size 8
Message-ID: <202506282159.TXfvorYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: bd3d14932923a717ebe475122ca7e17200f87a0c leds: pca955x: Avoid potential overflow when filling default_label
date:   6 weeks ago
config: microblaze-randconfig-2003-20250626 (https://download.01.org/0day-ci/archive/20250628/202506282159.TXfvorYl-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282159.TXfvorYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282159.TXfvorYl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-pca955x.c: In function 'pca955x_probe':
>> drivers/leds/leds-pca955x.c:696:53: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
        snprintf(default_label, sizeof(default_label), "%u", i);
                                                        ^~
   drivers/leds/leds-pca955x.c:696:52: note: directive argument in the range [0, 2147483647]
        snprintf(default_label, sizeof(default_label), "%u", i);
                                                       ^~~~
   drivers/leds/leds-pca955x.c:696:5: note: 'snprintf' output between 2 and 11 bytes into a destination of size 8
        snprintf(default_label, sizeof(default_label), "%u", i);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +696 drivers/leds/leds-pca955x.c

   575	
   576	static int pca955x_probe(struct i2c_client *client)
   577	{
   578		struct pca955x *pca955x;
   579		struct pca955x_led *pca955x_led;
   580		const struct pca955x_chipdef *chip;
   581		struct led_classdev *led;
   582		struct led_init_data init_data;
   583		struct i2c_adapter *adapter;
   584		u8 i, nls, psc0;
   585		u8 ls1[4];
   586		u8 ls2[4];
   587		struct pca955x_platform_data *pdata;
   588		bool keep_psc0 = false;
   589		bool set_default_label = false;
   590		char default_label[8];
   591		int bit, err, reg;
   592	
   593		chip = i2c_get_match_data(client);
   594		if (!chip)
   595			return dev_err_probe(&client->dev, -ENODEV, "unknown chip\n");
   596	
   597		adapter = client->adapter;
   598		pdata = dev_get_platdata(&client->dev);
   599		if (!pdata) {
   600			pdata =	pca955x_get_pdata(client, chip);
   601			if (IS_ERR(pdata))
   602				return PTR_ERR(pdata);
   603		}
   604	
   605		/* Make sure the slave address / chip type combo given is possible */
   606		if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
   607		    chip->slv_addr) {
   608			dev_err(&client->dev, "invalid slave address %02x\n",
   609				client->addr);
   610			return -ENODEV;
   611		}
   612	
   613		dev_info(&client->dev, "Using %s %u-bit LED driver at slave address 0x%02x\n",
   614			 client->name, chip->bits, client->addr);
   615	
   616		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
   617			return -EIO;
   618	
   619		if (pdata->num_leds != chip->bits) {
   620			dev_err(&client->dev,
   621				"board info claims %d LEDs on a %u-bit chip\n",
   622				pdata->num_leds, chip->bits);
   623			return -ENODEV;
   624		}
   625	
   626		pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
   627		if (!pca955x)
   628			return -ENOMEM;
   629	
   630		pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
   631					     sizeof(*pca955x_led), GFP_KERNEL);
   632		if (!pca955x->leds)
   633			return -ENOMEM;
   634	
   635		i2c_set_clientdata(client, pca955x);
   636	
   637		mutex_init(&pca955x->lock);
   638		pca955x->client = client;
   639		pca955x->chipdef = chip;
   640		pca955x->blink_period = PCA955X_BLINK_DEFAULT_MS;
   641	
   642		init_data.devname_mandatory = false;
   643		init_data.devicename = "pca955x";
   644	
   645		nls = pca955x_num_led_regs(chip->bits);
   646		/* Use auto-increment feature to read all the LED selectors at once. */
   647		err = i2c_smbus_read_i2c_block_data(client,
   648						    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
   649						    ls1);
   650		if (err < 0)
   651			return err;
   652	
   653		for (i = 0; i < nls; i++)
   654			ls2[i] = ls1[i];
   655	
   656		for (i = 0; i < chip->bits; i++) {
   657			pca955x_led = &pca955x->leds[i];
   658			pca955x_led->led_num = i;
   659			pca955x_led->pca955x = pca955x;
   660			pca955x_led->type = pdata->leds[i].type;
   661	
   662			switch (pca955x_led->type) {
   663			case PCA955X_TYPE_NONE:
   664			case PCA955X_TYPE_GPIO:
   665				break;
   666			case PCA955X_TYPE_LED:
   667				bit = i % 4;
   668				reg = i / 4;
   669				led = &pca955x_led->led_cdev;
   670				led->brightness_set_blocking = pca955x_led_set;
   671				led->brightness_get = pca955x_led_get;
   672				led->blink_set = pca955x_led_blink;
   673	
   674				if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
   675					ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
   676				else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
   677					ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
   678				else if (pca955x_ledstate(ls2[reg], bit) == PCA955X_LS_BLINK0) {
   679					keep_psc0 = true;
   680					set_bit(i, &pca955x->active_blink);
   681				}
   682	
   683				init_data.fwnode = pdata->leds[i].fwnode;
   684	
   685				if (is_of_node(init_data.fwnode)) {
   686					if (to_of_node(init_data.fwnode)->name[0] ==
   687					    '\0')
   688						set_default_label = true;
   689					else
   690						set_default_label = false;
   691				} else {
   692					set_default_label = true;
   693				}
   694	
   695				if (set_default_label) {
 > 696					snprintf(default_label, sizeof(default_label), "%u", i);
   697					init_data.default_label = default_label;
   698				} else {
   699					init_data.default_label = NULL;
   700				}
   701	
   702				err = devm_led_classdev_register_ext(&client->dev, led,
   703								     &init_data);
   704				if (err)
   705					return err;
   706	
   707				set_bit(i, &pca955x->active_pins);
   708			}
   709		}
   710	
   711		for (i = 0; i < nls; i++) {
   712			if (ls1[i] != ls2[i]) {
   713				err = pca955x_write_ls(pca955x, i, ls2[i]);
   714				if (err)
   715					return err;
   716			}
   717		}
   718	
   719		if (keep_psc0) {
   720			err = pca955x_read_psc(pca955x, 0, &psc0);
   721		} else {
   722			psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
   723			err = pca955x_write_psc(pca955x, 0, psc0);
   724		}
   725	
   726		if (err)
   727			return err;
   728	
   729		pca955x->blink_period = pca955x_psc_to_period(pca955x, psc0);
   730	
   731		/* Set PWM1 to fast frequency so we do not see flashing */
   732		err = pca955x_write_psc(pca955x, 1, 0);
   733		if (err)
   734			return err;
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
