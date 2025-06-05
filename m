Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F103209
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086872; cv=none; b=oo/5wBtCkmFiDAfTrC4Zvv9648gdpz/UORon+ev21ZgT7AVHx2DRGnwX4XYeNApnDAOjgRgvV0jnDlFK/bhQW4nBmdmtJzB7+ttbuCWoj58QV7R7ujZc4b03yiiCnlHoiP9D9OhgBmeLerqatbCygBUXlgjZ9W0InkkZyTJCK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086872; c=relaxed/simple;
	bh=ijd99Osw0Nw2cZ90UK5pS/kzZb/MHnWbvjnoFn8lXNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhkTcnIByZYNxXbXyOPCuXH6QyFxn50tSBaC3gVvOwGieMy534YBWQrpy9TmJ3zFWqDoop863u4m7cyRBeaN87O4VBB3Ff5bDBnGoCfwqULo5OfLYvJiSntoIjDL3LZvIycW1b377EcxvlUj/hAS0aU42awU1tOuE0+LRespbWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I+mag0WL; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I+mag0WL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=VF6d1hNFoWZZrBNVh1/uHW4JjbdNaRgqQ1rrbdlVpXE=;
	b=I+mag0WLALJquH4hA/sasQEe8mqlOfkGtqW3oju40AGCx2qCBqH5mrpok3Au+0
	gJhhVIcTdA8y/G/8OtYJtZXsg1rlEKBfEvIh9xI5mpLEZlYnfzY2qe0RjHDKE7F4
	MisFQLZdTS0O6Q2QrXbthgAF6suGTw/rOx7yCubsSUM2E=
Received: from [192.168.125.68] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnRixs8kBoPUizBw--.26145S2;
	Thu, 05 Jun 2025 09:27:10 +0800 (CST)
Message-ID: <4ea563c6-0d77-4a5c-95ff-8821552ad5d7@163.com>
Date: Thu, 5 Jun 2025 09:27:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mfd: Remove unused of_node variables
To: kernel test robot <lkp@intel.com>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20250604081043.802659-1-liubaolin12138@163.com>
 <202506042124.mV2W3XrQ-lkp@intel.com>
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <202506042124.mV2W3XrQ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnRixs8kBoPUizBw--.26145S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFyDWr1rKF4fCFyxWr45Jrb_yoWfKw17pr
	y3JanIyFWUJr1kKa48Jrn5Aan5trWkGay8ur15G340g3s0y3yvv3WFgrZxZ3W7ury2yF95
	AF4xWryIqrn0kaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRfOz-UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/1tbiIARjymhA7hjMBwAAsY

> My apologies - I submitted this patch to address compilation warnings, 
> “drivers/mfd/88pm860x-core.c: In function ‘device_irq_init’:
> drivers/mfd/88pm860x-core.c:576:29: warning: unused variable ‘node’ [-Wunused-variable]
>  |         struct device_node *node = i2c->dev.of_node;
>  |                             ^~~~
> 	
> drivers/mfd/twl4030-irq.c: In function ‘twl4030_init_irq’:
>  679 |         struct                  device_node *node = dev->of_node;
>  |                                              ^~~~
> 	
> drivers/mfd/max8925-core.c: In function ‘max8925_irq_init’:
> drivers/mfd/max8925-core.c:659:29: warning: unused variable ‘node’ [-Wunused-variable]
>  659 |         struct device_node *node = chip->dev->of_node;
>   | ”
> but it appears they were false positives as the node is actually used via 'of_fwnode_handle(node)'. 
> Please discard this patch and cancel the review. Sorry for the inconvenience.




在 2025/6/4 21:48, kernel test robot 写道:
> Hi Baolin,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on lee-mfd/for-mfd-next]
> [also build test ERROR on lee-leds/for-leds-next lee-mfd/for-mfd-fixes tmlind-omap/for-next linus/master v6.15 next-20250604]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Liu/mfd-Remove-unused-of_node-variables/20250604-161317
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> patch link:    https://lore.kernel.org/r/20250604081043.802659-1-liubaolin12138%40163.com
> patch subject: [PATCH v1] mfd: Remove unused of_node variables
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250604/202506042124.mV2W3XrQ-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042124.mV2W3XrQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506042124.mV2W3XrQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
>>> drivers/mfd/88pm860x-core.c:626:31: error: 'node' undeclared (first use in this function)
>       626 |         irq_domain_add_legacy(node, nr_irqs, chip->irq_base, 0,
>           |                               ^~~~
>     drivers/mfd/88pm860x-core.c:626:31: note: each undeclared identifier is reported only once for each function it appears in
> --
>     drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
>>> drivers/mfd/twl4030-irq.c:693:31: error: 'node' undeclared (first use in this function); did you mean 'inode'?
>       693 |         irq_domain_add_legacy(node, nr_irqs, irq_base, 0,
>           |                               ^~~~
>           |                               inode
>     drivers/mfd/twl4030-irq.c:693:31: note: each undeclared identifier is reported only once for each function it appears in
> --
>     drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
>>> drivers/mfd/max8925-core.c:684:31: error: 'node' undeclared (first use in this function)
>       684 |         irq_domain_add_legacy(node, MAX8925_NR_IRQS, chip->irq_base, 0,
>           |                               ^~~~
>     drivers/mfd/max8925-core.c:684:31: note: each undeclared identifier is reported only once for each function it appears in
> 
> 
> vim +/node +626 drivers/mfd/88pm860x-core.c
> 
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  566
> f791be492f76de Bill Pemberton 2012-11-19  567  static int device_irq_init(struct pm860x_chip *chip,
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  568  				     struct pm860x_platform_data *pdata)
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  569  {
> 2e57848fed7435 Lee Jones      2014-05-08  570  	struct i2c_client *i2c = (chip->id == CHIP_PM8607) ?
> 2e57848fed7435 Lee Jones      2014-05-08  571  		chip->client : chip->companion;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  572  	unsigned char status_buf[INT_STATUS_NUM];
> 2afa62ea76027b Haojian Zhuang 2010-02-08  573  	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  574  	int data, mask, ret = -EINVAL;
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  575  	int nr_irqs, irq_base = -1;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  576
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  577  	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  578  		| PM8607_B0_MISC1_INT_MASK;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  579  	data = 0;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  580  	chip->irq_mode = 0;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  581  	if (pdata && pdata->irq_mode) {
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  582  		/*
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  583  		 * irq_mode defines the way of clearing interrupt. If it's 1,
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  584  		 * clear IRQ by write. Otherwise, clear it by read.
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  585  		 * This control bit is valid from 88PM8607 B0 steping.
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  586  		 */
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  587  		data |= PM8607_B0_MISC1_INT_CLEAR;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  588  		chip->irq_mode = 1;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  589  	}
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  590  	ret = pm860x_set_bits(i2c, PM8607_B0_MISC1, mask, data);
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  591  	if (ret < 0)
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  592  		goto out;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  593
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  594  	/* mask all IRQs */
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  595  	memset(status_buf, 0, INT_STATUS_NUM);
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  596  	ret = pm860x_bulk_write(i2c, PM8607_INT_MASK_1,
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  597  				INT_STATUS_NUM, status_buf);
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  598  	if (ret < 0)
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  599  		goto out;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  600
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  601  	if (chip->irq_mode) {
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  602  		/* clear interrupt status by write */
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  603  		memset(status_buf, 0xFF, INT_STATUS_NUM);
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  604  		ret = pm860x_bulk_write(i2c, PM8607_INT_STATUS1,
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  605  					INT_STATUS_NUM, status_buf);
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  606  	} else {
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  607  		/* clear interrupt status by read */
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  608  		ret = pm860x_bulk_read(i2c, PM8607_INT_STATUS1,
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  609  					INT_STATUS_NUM, status_buf);
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  610  	}
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  611  	if (ret < 0)
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  612  		goto out;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  613
> 2afa62ea76027b Haojian Zhuang 2010-02-08  614  	mutex_init(&chip->irq_lock);
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  615
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  616  	if (pdata && pdata->irq_base)
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  617  		irq_base = pdata->irq_base;
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  618  	nr_irqs = ARRAY_SIZE(pm860x_irqs);
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  619  	chip->irq_base = irq_alloc_descs(irq_base, 0, nr_irqs, 0);
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  620  	if (chip->irq_base < 0) {
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  621  		dev_err(&i2c->dev, "Failed to allocate interrupts, ret:%d\n",
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  622  			chip->irq_base);
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  623  		ret = -EBUSY;
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  624  		goto out;
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  625  	}
> 837c8293ba24d0 Haojian Zhuang 2012-10-02 @626  	irq_domain_add_legacy(node, nr_irqs, chip->irq_base, 0,
> 837c8293ba24d0 Haojian Zhuang 2012-10-02  627  			      &pm860x_irq_domain_ops, chip);
> 2afa62ea76027b Haojian Zhuang 2010-02-08  628  	chip->core_irq = i2c->irq;
> 2afa62ea76027b Haojian Zhuang 2010-02-08  629  	if (!chip->core_irq)
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  630  		goto out;
> 2afa62ea76027b Haojian Zhuang 2010-02-08  631
> 2e57848fed7435 Lee Jones      2014-05-08  632  	ret = request_threaded_irq(chip->core_irq, NULL, pm860x_irq,
> 2e57848fed7435 Lee Jones      2014-05-08  633  				   flags | IRQF_ONESHOT, "88pm860x", chip);
> 2afa62ea76027b Haojian Zhuang 2010-02-08  634  	if (ret) {
> 2afa62ea76027b Haojian Zhuang 2010-02-08  635  		dev_err(chip->dev, "Failed to request IRQ: %d\n", ret);
> 2afa62ea76027b Haojian Zhuang 2010-02-08  636  		chip->core_irq = 0;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  637  	}
> 2afa62ea76027b Haojian Zhuang 2010-02-08  638
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  639  	return 0;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  640  out:
> 2afa62ea76027b Haojian Zhuang 2010-02-08  641  	chip->core_irq = 0;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  642  	return ret;
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  643  }
> 5c42e8c4a9c86e Haojian Zhuang 2009-12-15  644
> 

