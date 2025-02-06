Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B281D90B9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876818; cv=none; b=bDvkOsdtQWX9sUssbLph3GfmpIBJ1/XzfBLOdvQa37JDC/OTg8l145NMJlersFZsKc12IuONokwWaueoQz/hSY1YolOzDLvaDNiamkeVWqpp1x1iG2cjSWL7k3MitGITH/HrzfO/HeXnv9/sdadF45hCqC1TobEl820L5p4RmyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876818; c=relaxed/simple;
	bh=wxKQErDPnwIwYujpwjbSeLyFGTdyqO0qixHHJ4ID7ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=guNcfY2hVHG0gV6XAKVN2+x4ZFSyK8RPqQmRpDH9qR94lUWEHt9hxUOAuTjmw8BmY7qjOBbyXF2wNXIGRFthbNop4i1GzW/R7S4mFcxEk+EB/rf9EItQaSOrHzQJ59vDqGQd6Fruf67HNO6Nh8PLm0YfoqSVGu0Yu8q2KZZHTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6dDRcJq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6dDRcJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738876816; x=1770412816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxKQErDPnwIwYujpwjbSeLyFGTdyqO0qixHHJ4ID7ds=;
  b=W6dDRcJqngsjK0qVb6pk7JxYeH4IYGc5tUd9SdY/kI8KJlKUOErFrddA
   5etLJR/SkcehOFjlKpkuReOYZU9y62eRZVXpgcnyl3Yi7Yy16n3tDQVQ/
   V42asR2I2ZfJLigj+62a2KteAgNje72WPU8j/dKZG939NNn5m2EMTwtvx
   kby8yh7HyxDvljicDldrtWbnYJySYcLPlHqUh3PPm8tD6YrtDIUbpOUI9
   AS/nJ8oZ+vDlPArbUsUodyT55INd8iBEcIh2mVh9Mql1eczH8ncAA3w26
   KksruXwXDSkOGGY+ktWu6U1k7t8o1oyEWXZCuySPaXIi9J69kVVrlprpS
   w==;
X-CSE-ConnectionGUID: wI9/yrY8Sk2IgmB7dx7TGA==
X-CSE-MsgGUID: lvK6zRAjSuW4fSxCA/3xWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39773876"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39773876"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:20:16 -0800
X-CSE-ConnectionGUID: lBJuRfi9ROy7sXvney4zFA==
X-CSE-MsgGUID: DADKRx8ASw6WNOrV793z0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111953479"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Feb 2025 13:20:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg9IC-000xL9-0c;
	Thu, 06 Feb 2025 21:20:12 +0000
Date: Fri, 7 Feb 2025 05:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/net/dsa/realtek/rtl8366rb.c:953:(.text.unlikely.rtl8366rb_setup_led+0xe8):
 undefined reference to `led_init_default_state_get'
Message-ID: <202502070525.xMUImayb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: 32d617005475a71ebcc4ec8b2791e8d1481e9a10 net: dsa: realtek: add LED drivers for rtl8366rb
date:   9 months ago
config: riscv-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070525.xMUImayb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070525.xMUImayb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070525.xMUImayb-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/net/dsa/realtek/rtl8366rb.o: in function `rtl8366rb_setup_led':
>> drivers/net/dsa/realtek/rtl8366rb.c:953:(.text.unlikely.rtl8366rb_setup_led+0xe8): undefined reference to `led_init_default_state_get'
>> riscv32-linux-ld: drivers/net/dsa/realtek/rtl8366rb.c:980:(.text.unlikely.rtl8366rb_setup_led+0x240): undefined reference to `devm_led_classdev_register_ext'


vim +953 drivers/net/dsa/realtek/rtl8366rb.c

   927	
   928	static int rtl8366rb_setup_led(struct realtek_priv *priv, struct dsa_port *dp,
   929				       struct fwnode_handle *led_fwnode)
   930	{
   931		struct rtl8366rb *rb = priv->chip_data;
   932		struct led_init_data init_data = { };
   933		enum led_default_state state;
   934		struct rtl8366rb_led *led;
   935		u32 led_group;
   936		int ret;
   937	
   938		ret = fwnode_property_read_u32(led_fwnode, "reg", &led_group);
   939		if (ret)
   940			return ret;
   941	
   942		if (led_group >= RTL8366RB_NUM_LEDGROUPS) {
   943			dev_warn(priv->dev, "Invalid LED reg %d defined for port %d",
   944				 led_group, dp->index);
   945			return -EINVAL;
   946		}
   947	
   948		led = &rb->leds[dp->index][led_group];
   949		led->port_num = dp->index;
   950		led->led_group = led_group;
   951		led->priv = priv;
   952	
 > 953		state = led_init_default_state_get(led_fwnode);
   954		switch (state) {
   955		case LEDS_DEFSTATE_ON:
   956			led->cdev.brightness = 1;
   957			rb8366rb_set_port_led(led, 1);
   958			break;
   959		case LEDS_DEFSTATE_KEEP:
   960			led->cdev.brightness =
   961				rb8366rb_get_port_led(led);
   962			break;
   963		case LEDS_DEFSTATE_OFF:
   964		default:
   965			led->cdev.brightness = 0;
   966			rb8366rb_set_port_led(led, 0);
   967		}
   968	
   969		led->cdev.max_brightness = 1;
   970		led->cdev.brightness_set_blocking =
   971			rtl8366rb_cled_brightness_set_blocking;
   972		init_data.fwnode = led_fwnode;
   973		init_data.devname_mandatory = true;
   974	
   975		init_data.devicename = kasprintf(GFP_KERNEL, "Realtek-%d:0%d:%d",
   976						 dp->ds->index, dp->index, led_group);
   977		if (!init_data.devicename)
   978			return -ENOMEM;
   979	
 > 980		ret = devm_led_classdev_register_ext(priv->dev, &led->cdev, &init_data);
   981		if (ret) {
   982			dev_warn(priv->dev, "Failed to init LED %d for port %d",
   983				 led_group, dp->index);
   984			return ret;
   985		}
   986	
   987		return 0;
   988	}
   989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
