Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71321F03D9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492480; cv=none; b=POHETSSfne819x960dVH4xQr6p3eIB+4tT4XYPtQ+Nbnf5qWAmzB7kPVLDhPm+ebhi3O4L8eh717jea53iHU6qs2LdQgkBOSfk8frZFfkrtb5tJCGAmqzE7rMaioFI/LQ8Zbwqhn1mwNAYCWS2eMEYLb+ZhT8nlPp8M8/hI6+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492480; c=relaxed/simple;
	bh=/1HUQKCUI6joAN+ktnRzqWbl30gCfKfji8UWEWWh1MM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnUj+hzp+Haq9iMleYXa+xb8yzUOpYfs5N5iBfKqgyFUX5nzire6h+FRXXtcI+lFxGw/zqUcV47yyVCWNsGfXiLXBdD/POohReytITNSZPntFmTQjEvD2ZnHW0aMt7j/g0U+ZNjPCAXbyw2GrhTAWPLBgrTG5YWHV7S+/YeY888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnwGAv2j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnwGAv2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751492479; x=1783028479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1HUQKCUI6joAN+ktnRzqWbl30gCfKfji8UWEWWh1MM=;
  b=CnwGAv2jMy65OztP3FC7tDY4ymUVN1G43lAq15vXkbkJiGtTRjksYXCq
   vmiq97897PXvCPJzAgCsFI4XX4fSFYEiNIFwArg9/L7GNQRx3LVAyYymt
   cN5PVaCWl0Dei7yF9VfuBG8aupd42t89fM3kix4EU+oZVPbWVAxIebP9b
   Lnnr//tF1ziUHqmWiSAz2HdT0iANLoGk9/ugKH4pZf+4J3Wy7lGNQWEuP
   2TU+P7qgMDrTlGgQMcF3d2s6PuZAdftyL6fVj0q34P0krF1WxIfjH1/RR
   geOa3EC9JQsSjhVJMZ6EqAE/7tNZBbnJ0iC1WBo/1elSb6+2mRai47L3m
   A==;
X-CSE-ConnectionGUID: /EEGcceyRvuZSEypA9E4+Q==
X-CSE-MsgGUID: i18o0xDQS3mqwwyJdzo3ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64050364"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64050364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:41:18 -0700
X-CSE-ConnectionGUID: DZ7t7OZwTteoYaWDew8nEQ==
X-CSE-MsgGUID: eehJJ5uVSFq3NXcOc9e8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="154547643"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 14:41:16 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX5Cc-00016X-1o;
	Wed, 02 Jul 2025 21:41:14 +0000
Date: Thu, 3 Jul 2025 05:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Smith <jason.smith@emerson.com>
Subject: drivers/tty/serial/8250/8250_ni.c:277:12: warning: stack frame size
 (1072) exceeds limit (1024) in 'ni16550_probe'
Message-ID: <202507030557.vIewJJQO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4911fb0b060899e4eebca0151eb56deb86921ec
commit: 3d5390f4dbe633472b2a4824e66ca5c4eac6fb19 serial: 8250: add driver for NI UARTs
date:   3 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250703/202507030557.vIewJJQO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030557.vIewJJQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030557.vIewJJQO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_ni.c:277:12: warning: stack frame size (1072) exceeds limit (1024) in 'ni16550_probe' [-Wframe-larger-than]
     277 | static int ni16550_probe(struct platform_device *pdev)
         |            ^
   1 warning generated.


vim +/ni16550_probe +277 drivers/tty/serial/8250/8250_ni.c

   276	
 > 277	static int ni16550_probe(struct platform_device *pdev)
   278	{
   279		const struct ni16550_device_info *info;
   280		struct device *dev = &pdev->dev;
   281		struct uart_8250_port uart = {};
   282		unsigned int txfifosz, rxfifosz;
   283		unsigned int prescaler = 0;
   284		struct ni16550_data *data;
   285		const char *portmode;
   286		bool rs232_property;
   287		int ret;
   288		int irq;
   289	
   290		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   291		if (!data)
   292			return -ENOMEM;
   293	
   294		spin_lock_init(&uart.port.lock);
   295	
   296		irq = platform_get_irq(pdev, 0);
   297		if (irq < 0)
   298			return irq;
   299	
   300		ret = ni16550_get_regs(pdev, &uart.port);
   301		if (ret < 0)
   302			return ret;
   303	
   304		/* early setup so that serial_in()/serial_out() work */
   305		serial8250_set_defaults(&uart);
   306	
   307		info = device_get_match_data(dev);
   308	
   309		uart.port.dev		= dev;
   310		uart.port.irq		= irq;
   311		uart.port.irqflags	= IRQF_SHARED;
   312		uart.port.flags		= UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
   313						| UPF_FIXED_PORT | UPF_FIXED_TYPE;
   314		uart.port.startup	= ni16550_port_startup;
   315		uart.port.shutdown	= ni16550_port_shutdown;
   316	
   317		/*
   318		 * Hardware instantiation of FIFO sizes are held in registers.
   319		 */
   320		txfifosz = ni16550_read_fifo_size(&uart, NI16550_TFS_OFFSET);
   321		rxfifosz = ni16550_read_fifo_size(&uart, NI16550_RFS_OFFSET);
   322	
   323		dev_dbg(dev, "NI 16550 has TX FIFO size %u, RX FIFO size %u\n",
   324			txfifosz, rxfifosz);
   325	
   326		uart.port.type		= PORT_16550A;
   327		uart.port.fifosize	= txfifosz;
   328		uart.tx_loadsz		= txfifosz;
   329		uart.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10;
   330		uart.capabilities	= UART_CAP_FIFO | UART_CAP_AFE | UART_CAP_EFR;
   331	
   332		/*
   333		 * Declaration of the base clock frequency can come from one of:
   334		 * - static declaration in this driver (for older ACPI IDs)
   335		 * - a "clock-frquency" ACPI
   336		 */
   337		if (info->uartclk)
   338			uart.port.uartclk = info->uartclk;
   339		if (device_property_read_u32(dev, "clock-frequency",
   340					     &uart.port.uartclk)) {
   341			data->clk = devm_clk_get_enabled(dev, NULL);
   342			if (!IS_ERR(data->clk))
   343				uart.port.uartclk = clk_get_rate(data->clk);
   344		}
   345	
   346		if (!uart.port.uartclk) {
   347			dev_err(dev, "unable to determine clock frequency!\n");
   348			ret = -ENODEV;
   349			goto err;
   350		}
   351	
   352		if (info->prescaler)
   353			prescaler = info->prescaler;
   354		device_property_read_u32(dev, "clock-prescaler", &prescaler);
   355	
   356		if (prescaler != 0) {
   357			uart.port.set_mctrl = ni16550_set_mctrl;
   358			ni16550_config_prescaler(&uart, (u8)prescaler);
   359		}
   360	
   361		/*
   362		 * The determination of whether or not this is an RS-485 or RS-232 port
   363		 * can come from the PMR (if present), otherwise we're solely an RS-485
   364		 * port.
   365		 *
   366		 * This is a device-specific property, and there are old devices in the
   367		 * field using "transceiver" as an ACPI property, so we have to check
   368		 * for that as well.
   369		 */
   370		if (!device_property_read_string(dev, "transceiver", &portmode)) {
   371			rs232_property = strncmp(portmode, "RS-232", 6) == 0;
   372	
   373			dev_dbg(dev, "port is in %s mode (via device property)\n",
   374				rs232_property ? "RS-232" : "RS-485");
   375		} else if (info->flags & NI_HAS_PMR) {
   376			rs232_property = is_pmr_rs232_mode(&uart);
   377	
   378			dev_dbg(dev, "port is in %s mode (via PMR)\n",
   379				rs232_property ? "RS-232" : "RS-485");
   380		} else {
   381			rs232_property = 0;
   382	
   383			dev_dbg(dev, "port is fixed as RS-485\n");
   384		}
   385	
   386		if (!rs232_property) {
   387			/*
   388			 * Neither the 'transceiver' property nor the PMR indicate
   389			 * that this is an RS-232 port, so it must be an RS-485 one.
   390			 */
   391			ni16550_rs485_setup(&uart.port);
   392		}
   393	
   394		ret = serial8250_register_8250_port(&uart);
   395		if (ret < 0)
   396			goto err;
   397		data->line = ret;
   398	
   399		platform_set_drvdata(pdev, data);
   400		return 0;
   401	
   402	err:
   403		return ret;
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
