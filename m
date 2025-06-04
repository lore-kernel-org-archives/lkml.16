Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F79A290095
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044950; cv=none; b=ChCP5s1m1z6hmIKBWA60SU5tqq8x25/NXDgQm2+QILkZNUSn6vzd0XpfnZ3DTkHUqywrzNVm+V0yHTUeVG4Ez9M15OlGlWd9mcFaFTeaczWdPH06Yt6OIXTyPec1r1iX+/J6RhPJ7E9fBVaY097DiRAII42VG9CFntwgwiXLTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044950; c=relaxed/simple;
	bh=UBY8fN/ujpbbYuQ9ly/tFtHZuts70fGbr6bV/xBUPIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drc3jEqr5xX3mYdKm+8BafSe2hM8HkY13IHlyWwT73Ml53a+StLUuh4PzIvQY3htGGd6wSUfwVdu8NkxBN36j8bQLlmFg3fxF1P79nDnRoj5A0Jv9S9WaQV8qmsMqYk2Gy3VasnVDde6Gx8ql5MFyi+P4rRkjq0BdrYMuUSVXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvV5xkP7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvV5xkP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749044949; x=1780580949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBY8fN/ujpbbYuQ9ly/tFtHZuts70fGbr6bV/xBUPIs=;
  b=fvV5xkP7rZgY2mSuRF3XoDDUaSnLYEi2RrZ7xnWTsrlTbK/6Qxwm30HK
   TOvvVNP/i5eUMZFOUwdr62n3mKyI/he+WepnFTBvDXFS5IKundEH90N+M
   FZ9bgLpxuNf692vplEpccqz4WjxerG5kJzP1gx8ezKAZpayhnZjshp+rB
   0UR0IRfDZIxjIzEfST7mjOgqmcc+qQq3pdMzeh8n+DENqBczYguW7OgU2
   PIMOxNZHAsMpYz34d3bNJX3JrVMthz3bWUAh+9BHVNG+PXuqHrfAuaLkf
   cLpVvK92QQ9cUQByR7O/gN4iH41UXGbBpq3CnDpc/LY+J2Kun4nDWotpW
   Q==;
X-CSE-ConnectionGUID: Cxg4mB0BQD2yhrBmGVDLvQ==
X-CSE-MsgGUID: U/XlA2y3TzSA8c/1cf6XNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62517821"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="62517821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 06:48:56 -0700
X-CSE-ConnectionGUID: rw2xErw1TWSzxUt+ll06Gw==
X-CSE-MsgGUID: UDPRL3/dRVecVJb/bdzEMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="146167544"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2025 06:48:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMoU8-0003Aj-0E;
	Wed, 04 Jun 2025 13:48:52 +0000
Date: Wed, 4 Jun 2025 21:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Liu <liubaolin12138@163.com>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	liubaolin12138@163.com, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v1] mfd: Remove unused of_node variables
Message-ID: <202506042124.mV2W3XrQ-lkp@intel.com>
References: <20250604081043.802659-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604081043.802659-1-liubaolin12138@163.com>

Hi Baolin,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-leds/for-leds-next lee-mfd/for-mfd-fixes tmlind-omap/for-next linus/master v6.15 next-20250604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Liu/mfd-Remove-unused-of_node-variables/20250604-161317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250604081043.802659-1-liubaolin12138%40163.com
patch subject: [PATCH v1] mfd: Remove unused of_node variables
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250604/202506042124.mV2W3XrQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042124.mV2W3XrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042124.mV2W3XrQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
>> drivers/mfd/88pm860x-core.c:626:31: error: 'node' undeclared (first use in this function)
     626 |         irq_domain_add_legacy(node, nr_irqs, chip->irq_base, 0,
         |                               ^~~~
   drivers/mfd/88pm860x-core.c:626:31: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
>> drivers/mfd/twl4030-irq.c:693:31: error: 'node' undeclared (first use in this function); did you mean 'inode'?
     693 |         irq_domain_add_legacy(node, nr_irqs, irq_base, 0,
         |                               ^~~~
         |                               inode
   drivers/mfd/twl4030-irq.c:693:31: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
>> drivers/mfd/max8925-core.c:684:31: error: 'node' undeclared (first use in this function)
     684 |         irq_domain_add_legacy(node, MAX8925_NR_IRQS, chip->irq_base, 0,
         |                               ^~~~
   drivers/mfd/max8925-core.c:684:31: note: each undeclared identifier is reported only once for each function it appears in


vim +/node +626 drivers/mfd/88pm860x-core.c

837c8293ba24d0 Haojian Zhuang 2012-10-02  566  
f791be492f76de Bill Pemberton 2012-11-19  567  static int device_irq_init(struct pm860x_chip *chip,
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  568  				     struct pm860x_platform_data *pdata)
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  569  {
2e57848fed7435 Lee Jones      2014-05-08  570  	struct i2c_client *i2c = (chip->id == CHIP_PM8607) ?
2e57848fed7435 Lee Jones      2014-05-08  571  		chip->client : chip->companion;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  572  	unsigned char status_buf[INT_STATUS_NUM];
2afa62ea76027b Haojian Zhuang 2010-02-08  573  	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
837c8293ba24d0 Haojian Zhuang 2012-10-02  574  	int data, mask, ret = -EINVAL;
837c8293ba24d0 Haojian Zhuang 2012-10-02  575  	int nr_irqs, irq_base = -1;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  576  
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  577  	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  578  		| PM8607_B0_MISC1_INT_MASK;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  579  	data = 0;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  580  	chip->irq_mode = 0;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  581  	if (pdata && pdata->irq_mode) {
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  582  		/*
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  583  		 * irq_mode defines the way of clearing interrupt. If it's 1,
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  584  		 * clear IRQ by write. Otherwise, clear it by read.
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  585  		 * This control bit is valid from 88PM8607 B0 steping.
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  586  		 */
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  587  		data |= PM8607_B0_MISC1_INT_CLEAR;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  588  		chip->irq_mode = 1;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  589  	}
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  590  	ret = pm860x_set_bits(i2c, PM8607_B0_MISC1, mask, data);
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  591  	if (ret < 0)
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  592  		goto out;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  593  
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  594  	/* mask all IRQs */
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  595  	memset(status_buf, 0, INT_STATUS_NUM);
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  596  	ret = pm860x_bulk_write(i2c, PM8607_INT_MASK_1,
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  597  				INT_STATUS_NUM, status_buf);
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  598  	if (ret < 0)
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  599  		goto out;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  600  
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  601  	if (chip->irq_mode) {
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  602  		/* clear interrupt status by write */
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  603  		memset(status_buf, 0xFF, INT_STATUS_NUM);
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  604  		ret = pm860x_bulk_write(i2c, PM8607_INT_STATUS1,
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  605  					INT_STATUS_NUM, status_buf);
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  606  	} else {
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  607  		/* clear interrupt status by read */
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  608  		ret = pm860x_bulk_read(i2c, PM8607_INT_STATUS1,
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  609  					INT_STATUS_NUM, status_buf);
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  610  	}
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  611  	if (ret < 0)
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  612  		goto out;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  613  
2afa62ea76027b Haojian Zhuang 2010-02-08  614  	mutex_init(&chip->irq_lock);
837c8293ba24d0 Haojian Zhuang 2012-10-02  615  
837c8293ba24d0 Haojian Zhuang 2012-10-02  616  	if (pdata && pdata->irq_base)
837c8293ba24d0 Haojian Zhuang 2012-10-02  617  		irq_base = pdata->irq_base;
837c8293ba24d0 Haojian Zhuang 2012-10-02  618  	nr_irqs = ARRAY_SIZE(pm860x_irqs);
837c8293ba24d0 Haojian Zhuang 2012-10-02  619  	chip->irq_base = irq_alloc_descs(irq_base, 0, nr_irqs, 0);
837c8293ba24d0 Haojian Zhuang 2012-10-02  620  	if (chip->irq_base < 0) {
837c8293ba24d0 Haojian Zhuang 2012-10-02  621  		dev_err(&i2c->dev, "Failed to allocate interrupts, ret:%d\n",
837c8293ba24d0 Haojian Zhuang 2012-10-02  622  			chip->irq_base);
837c8293ba24d0 Haojian Zhuang 2012-10-02  623  		ret = -EBUSY;
837c8293ba24d0 Haojian Zhuang 2012-10-02  624  		goto out;
837c8293ba24d0 Haojian Zhuang 2012-10-02  625  	}
837c8293ba24d0 Haojian Zhuang 2012-10-02 @626  	irq_domain_add_legacy(node, nr_irqs, chip->irq_base, 0,
837c8293ba24d0 Haojian Zhuang 2012-10-02  627  			      &pm860x_irq_domain_ops, chip);
2afa62ea76027b Haojian Zhuang 2010-02-08  628  	chip->core_irq = i2c->irq;
2afa62ea76027b Haojian Zhuang 2010-02-08  629  	if (!chip->core_irq)
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  630  		goto out;
2afa62ea76027b Haojian Zhuang 2010-02-08  631  
2e57848fed7435 Lee Jones      2014-05-08  632  	ret = request_threaded_irq(chip->core_irq, NULL, pm860x_irq,
2e57848fed7435 Lee Jones      2014-05-08  633  				   flags | IRQF_ONESHOT, "88pm860x", chip);
2afa62ea76027b Haojian Zhuang 2010-02-08  634  	if (ret) {
2afa62ea76027b Haojian Zhuang 2010-02-08  635  		dev_err(chip->dev, "Failed to request IRQ: %d\n", ret);
2afa62ea76027b Haojian Zhuang 2010-02-08  636  		chip->core_irq = 0;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  637  	}
2afa62ea76027b Haojian Zhuang 2010-02-08  638  
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  639  	return 0;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  640  out:
2afa62ea76027b Haojian Zhuang 2010-02-08  641  	chip->core_irq = 0;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  642  	return ret;
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  643  }
5c42e8c4a9c86e Haojian Zhuang 2009-12-15  644  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
