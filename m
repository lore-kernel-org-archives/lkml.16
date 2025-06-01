Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DE0C13D;
	Sun,  1 Jun 2025 03:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748748139; cv=none; b=qjWPx1IC7myLPVfA81vNuDDREu5YB2E2iy/GYS8XDnizBDFCf9YW0w+QQrTZiKNY7zFijmIizm4gxlF5v6xRvNv5P8JJyIrdevHzTcpgQ4bko5kxlYIDXCIQ7vWlUQyRRewu2bdmpAoMkIk1vmj6YkeO185mZyk66tV5eAige5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748748139; c=relaxed/simple;
	bh=KfwXt46ouribwDJftzP3infZzJnhzn+1maJuukJ238s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pf01a5Vq9ePqwayoIeuDB+WwleIqXHf7+ykLmA/NY0+xSZciiAPHOBIksB+z+Grm40/qnqO9flV3VZJpNRJPgWSaIXrsoG/bASMkvYV9gKxeW+zZoIEjQ2NbXaEI7Debzo8RrBDSSGYxuH5BizNYu/owtI2X38ef2cDvZoYVBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBDVm75f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBDVm75f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748748137; x=1780284137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KfwXt46ouribwDJftzP3infZzJnhzn+1maJuukJ238s=;
  b=aBDVm75fWJXkQ7+gsOthbCzfA7k5RZHMNPtDn4/hFWBq2US7flXM+VOD
   bjD1LJajMkXrGzAHwivAz0R3dbGVG3A61+DvnUFFIe8O/kVd0+/U9PPbr
   cK8AOBrHJnQ7e55+A24UpsuX4kFoRqlTX99o2RJ1N90Sq/RBiHS6v9llt
   G3gbjcLd6NQcXtzbqGUwWdLcv40yHYo8f1U/mqhEFdG+CHjzJiqdojXT+
   QVoxmo/WOVDzdpJcZ4RdOPLEYN5wCvVCc9lHXi7WDByF+pfh3MxJq+rcw
   7FslKOcSpwC3eiahRKDQKX8i+AfWufQtx5cMRES8XUOoMsG/h72gee88D
   Q==;
X-CSE-ConnectionGUID: X0eYd+9aR96lHaEoXGbgwQ==
X-CSE-MsgGUID: YcUD9mV2RVOos/Zofi12qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61056170"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="61056170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 20:22:16 -0700
X-CSE-ConnectionGUID: d7B4zYg5QCyazhpeoVfGkw==
X-CSE-MsgGUID: MkfM99tQSsumMvxoXuSsUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="149390657"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2025 20:22:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLZH1-000Ymm-2p;
	Sun, 01 Jun 2025 03:22:11 +0000
Date: Sun, 1 Jun 2025 11:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, abd.masalkhi@gmail.com
Subject: Re: [PATCH 2/3] misc: add sysfs control driver for ST M24LR series
 RFID/NFC chips
Message-ID: <202506011126.RpYXQiPu-lkp@intel.com>
References: <20250531081159.2007319-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531081159.2007319-3-abd.masalkhi@gmail.com>

Hi Abd-Alrhman,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-linus]
[also build test ERROR on robh/for-next soc/for-next linus/master v6.15]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abd-Alrhman-Masalkhi/dt-bindings-misc-Add-binding-for-ST-M24LR-control-interface/20250531-161342
base:   char-misc/char-misc-linus
patch link:    https://lore.kernel.org/r/20250531081159.2007319-3-abd.masalkhi%40gmail.com
patch subject: [PATCH 2/3] misc: add sysfs control driver for ST M24LR series RFID/NFC chips
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250601/202506011126.RpYXQiPu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506011126.RpYXQiPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011126.RpYXQiPu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/misc/m24lr_ctl.c:378:7: warning: cast to 'void *' from smaller integer type 'int' [-Wint-to-void-pointer-cast]
     378 |                 if (IS_ERR_VALUE(err)) {
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/err.h:28:49: note: expanded from macro 'IS_ERR_VALUE'
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/misc/m24lr_ctl.c:499:6: warning: cast to 'void *' from smaller integer type 'int' [-Wint-to-void-pointer-cast]
     499 |         if (IS_ERR_VALUE(ret))
         |             ^~~~~~~~~~~~~~~~~
   include/linux/err.h:28:49: note: expanded from macro 'IS_ERR_VALUE'
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> drivers/misc/m24lr_ctl.c:590:23: warning: data argument not used by format string [-Wformat-extra-args]
     589 |                                  "Failed to create sysfs entry '%s'\n",
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     590 |                                  attr->attr.name, err);
         |                                                   ^
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^
   drivers/misc/m24lr_ctl.c:614:13: warning: data argument not used by format string [-Wformat-extra-args]
     613 |                                          "Failed to create sysfs entry '%s'\n",
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     614 |                                          name, err);
         |                                                ^
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^
   drivers/misc/m24lr_ctl.c:642:6: warning: cast to 'void *' from smaller integer type 'int' [-Wint-to-void-pointer-cast]
     642 |         if (IS_ERR_VALUE(err))
         |             ^~~~~~~~~~~~~~~~~
   include/linux/err.h:28:49: note: expanded from macro 'IS_ERR_VALUE'
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
>> drivers/misc/m24lr_ctl.c:645:40: error: too many arguments to function call, expected 3, have 4
     645 |         err = i2c_mux_add_adapter(muxc, 0, 0, 0);
         |               ~~~~~~~~~~~~~~~~~~~             ^
   include/linux/i2c-mux.h:58:5: note: 'i2c_mux_add_adapter' declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |                         u32 force_nr, u32 chan_id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/m24lr_ctl.c:669:14: error: incompatible function pointer types initializing 'int (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *, const struct i2c_device_id *)' [-Wincompatible-function-pointer-types]
     669 |         .probe    = m24lr_ctl_probe,
         |                     ^~~~~~~~~~~~~~~
>> drivers/misc/m24lr_ctl.c:670:14: error: incompatible function pointer types initializing 'void (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *)' [-Wincompatible-function-pointer-types]
     670 |         .remove   = remove,
         |                     ^~~~~~
   5 warnings and 3 errors generated.


vim +645 drivers/misc/m24lr_ctl.c

   539	
   540	static int m24lr_ctl_probe(struct i2c_client *client,
   541				   const struct i2c_device_id *id)
   542	{
   543		struct regmap *regmap;
   544		struct m24lr_ctl *ctl;
   545		struct i2c_mux_core *muxc;
   546		const struct m24lr_ctl_chip *chip;
   547		struct m24lr_sys_entry *sss = NULL;
   548		unsigned int page_size;
   549		unsigned int n_sss;
   550		int i, err;
   551		u8 test;
   552		struct device *dev = &client->dev;
   553	
   554		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
   555			return -EOPNOTSUPP;
   556	
   557		chip = m24lr_ctl_get_chip(dev);
   558		if (!chip)
   559			return -ENODEV;
   560	
   561		ctl = devm_kzalloc(dev, sizeof(struct m24lr_ctl), GFP_KERNEL);
   562		if (!ctl)
   563			return -ENOMEM;
   564	
   565		err = device_property_read_u32(dev, "pagesize", &page_size);
   566		if (!err) {
   567			if (!is_power_of_2(page_size)) {
   568				dev_warn(dev,
   569					 "Invalid pagesize lenngth %d (not power of 2); using default %d byte\n",
   570					 page_size, M24LR_CTL_PAGESIZE_DEFAULT);
   571				page_size = M24LR_CTL_PAGESIZE_DEFAULT;
   572			}
   573			if (page_size > M24LR_CTL_PAGESIZE_LIMIT) {
   574				dev_info(dev,
   575					 "pagesize %d exceeds limit; rounded down to %d\n",
   576					 page_size, M24LR_CTL_PAGESIZE_LIMIT);
   577				page_size = M24LR_CTL_PAGESIZE_LIMIT;
   578			}
   579		} else { /* use the default */
   580			page_size = M24LR_CTL_PAGESIZE_DEFAULT;
   581		}
   582	
   583		for (i = 0; i < chip->n_entries; i++) {
   584			const struct device_attribute *attr = &chip->entries[i].attr;
   585	
   586			err = device_create_file(dev, attr);
   587			if (err)
   588				dev_warn(dev,
   589					 "Failed to create sysfs entry '%s'\n",
 > 590					 attr->attr.name, err);
   591		}
   592	
   593		n_sss = chip->n_sss_entries;
   594		if (n_sss) {
   595			sss = devm_kzalloc(dev, n_sss * sizeof(struct m24lr_sys_entry),
   596					   GFP_KERNEL);
   597			if (!sss)
   598				return -ENOMEM;
   599	
   600			for (i = 0; i < n_sss; i++) {
   601				char *name = kasprintf(GFP_KERNEL, "sss%02d", i);
   602	
   603				sss[i].reg_size = 1;
   604				sss[i].reg_addr = i;
   605				sss[i].attr.attr.name = name;
   606				sss[i].attr.attr.mode = 0600;
   607				sss[i].attr.show = m24lr_ctl_show;
   608				sss[i].attr.store = m24lr_ctl_store;
   609	
   610				err = device_create_file(dev, &sss[i].attr);
   611				if (err)
   612					dev_warn(dev,
   613						 "Failed to create sysfs entry '%s'\n",
   614						 name, err);
   615			}
   616		}
   617	
   618		regmap = devm_regmap_init_i2c(client, &m24lr_ctl_regmap_conf);
   619		if (IS_ERR(regmap)) {
   620			err = PTR_ERR(regmap);
   621			dev_err(dev, "Failed to init regmap (error: %d)\n", err);
   622			return err;
   623		}
   624	
   625		muxc = i2c_mux_alloc(client->adapter, &client->dev, 1, 0, I2C_MUX_GATE,
   626				     m24lr_ctl_gate_select, m24lr_ctl_gate_deselect);
   627		if (!muxc)
   628			return -ENOMEM;
   629	
   630		muxc->priv = ctl;
   631	
   632		mutex_init(&ctl->gate_lock);
   633		ctl->page_size = page_size;
   634		ctl->regmap = regmap;
   635		ctl->muxc = muxc;
   636		ctl->n_sss_entries = n_sss;
   637		ctl->sss_entries = sss;
   638	
   639		i2c_set_clientdata(client, ctl);
   640	
   641		err = m24lr_ctl_read(ctl, &test, 1, 0);
   642		if (IS_ERR_VALUE(err))
   643			return -ENODEV;
   644	
 > 645		err = i2c_mux_add_adapter(muxc, 0, 0, 0);
   646		if (err)
   647			return err;
   648	
   649		dev_info(&client->dev, "control interface initialized for %s\n",
   650			 client->name);
   651	
   652		return 0;
   653	}
   654	
   655	static int remove(struct i2c_client *client)
   656	{
   657		struct m24lr_ctl *ctl = i2c_get_clientdata(client);
   658	
   659		i2c_mux_del_adapters(ctl->muxc);
   660	
   661		return 0;
   662	}
   663	
   664	static struct i2c_driver m24lr_ctl_driver = {
   665		.driver = {
   666			.name = "m24lr_ctl",
   667			.of_match_table = m24lr_ctl_of_match,
   668		},
 > 669		.probe    = m24lr_ctl_probe,
 > 670		.remove   = remove,
   671		.id_table = m24lr_ctl_ids,
   672	};
   673	module_i2c_driver(m24lr_ctl_driver);
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
