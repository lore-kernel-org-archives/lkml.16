Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C6253F06
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745675651; cv=none; b=d5/fB2K+j56Fji8/tWZg2wy6om2twJYa9hsvz02/FVSNvmkEn4p+SWImMezl5Fr0tWjMqvK0nJUspU4BznxD8zjXNcfFztX1oQl2zK/WgiRDS6bEH1yah3y9q+JJvrZV3o7Ajn9pHrsy6H2e7ROPMeiuWgVaqYCcBa+w6fAasQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745675651; c=relaxed/simple;
	bh=Bq4NL4fbSYSVSelTOMMmjwb7zt/O6DpSlBDxmYSqjr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBF6CD3OTnaM0uFGiiHjdO9Lt8cyiDKxvvkO+vvmtokZ73idQr9I+MHa2q4YEwL2KovSv5dxtzP+dwpX/r34OvZa7xptT7Gu3TqZ6l4SL36yM8MIAFvpsCaWMDN113azaEDF36462JzT7iZ9zeoBw9LssMXJTMjQZ7bycMSInQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIbOXzVg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIbOXzVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745675649; x=1777211649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bq4NL4fbSYSVSelTOMMmjwb7zt/O6DpSlBDxmYSqjr0=;
  b=iIbOXzVgqfbVBOPtFXo2J6LvOUGocTKuwJr7t12w2DVqCpANbL9p0Q1l
   61o6q87NczYA3rXOszVCDIg/0lh6Oe56xjU3OntfwQ9SArU1bIo3cKtyA
   bGcZfQ3gI2gPLYbyU9nuBi15s1khc4xcMhhTAaEnTxpwcLdyWHi9Bu1/z
   0HiEWONLYB1t+4E2G9qHCvVjCLSac3886+rVrNZItKLW6Mz8XMExGK9Y5
   DhA9ttQkUE1ap5cmlw0Q3y9YLVbb/LZs1OjCG0ZmJN7t3QfQq1c6bS3sT
   uK1Xc0ftu1ovA07iwDNXDiV2xifCUnOq3pyTyctsGe9BfLSdB3137q4wU
   g==;
X-CSE-ConnectionGUID: PnxOpl0TRAG6lAULhQX1gA==
X-CSE-MsgGUID: X2OQVYkwT1mXWz6AfgKPlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46436161"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="46436161"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 06:54:08 -0700
X-CSE-ConnectionGUID: VAaCOq1uTaKnqiUl/6wEbw==
X-CSE-MsgGUID: 3/JNZBneSyug/BVNoe09MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="134063680"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2025 06:54:07 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8fym-0005qJ-2m;
	Sat, 26 Apr 2025 13:54:04 +0000
Date: Sat, 26 Apr 2025 21:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Herdler <herdler@nurfuerspam.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/staging/media/av7110/av7110.c:162: warning: cannot
 understand function prototype: '} else if (av7110_init_analog_module(av7110)
 == 0) '
Message-ID: <202504262127.FkkWHzfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 3c08dc38e3cf018a74c64e75cebcc803d973196c media: av7110: coding style fixes: comparsations
date:   11 months ago
config: x86_64-buildonly-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262127.FkkWHzfs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262127.FkkWHzfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262127.FkkWHzfs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/av7110/av7110.c:162: warning: cannot understand function prototype: '} else if (av7110_init_analog_module(av7110) == 0) '


vim +162 drivers/staging/media/av7110/av7110.c

   112	
   113	static void init_av7110_av(struct av7110 *av7110)
   114	{
   115		int ret;
   116		struct saa7146_dev *dev = av7110->dev;
   117	
   118		/* set internal volume control to maximum */
   119		av7110->adac_type = DVB_ADAC_TI;
   120		ret = av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mixer.volume_right);
   121		if (ret < 0)
   122			printk("dvb-ttpci:cannot set internal volume to maximum:%d\n",ret);
   123	
   124		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetMonitorType,
   125				    1, (u16)av7110->display_ar);
   126		if (ret < 0)
   127			printk("dvb-ttpci: unable to set aspect ratio\n");
   128		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetPanScanType,
   129				    1, av7110->display_panscan);
   130		if (ret < 0)
   131			printk("dvb-ttpci: unable to set pan scan\n");
   132	
   133		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 2, wss_cfg_4_3);
   134		if (ret < 0)
   135			printk("dvb-ttpci: unable to configure 4:3 wss\n");
   136		ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 3, wss_cfg_16_9);
   137		if (ret < 0)
   138			printk("dvb-ttpci: unable to configure 16:9 wss\n");
   139	
   140		ret = av7710_set_video_mode(av7110, vidmode);
   141		if (ret < 0)
   142			printk("dvb-ttpci:cannot set video mode:%d\n",ret);
   143	
   144		/* handle different card types */
   145		/* remaining inits according to card and frontend type */
   146		av7110->analog_tuner_flags = 0;
   147		av7110->current_input = 0;
   148		if (dev->pci->subsystem_vendor == 0x13c2 && dev->pci->subsystem_device == 0x000a)
   149			av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 0); // SPDIF on
   150		if (i2c_writereg(av7110, 0x20, 0x00, 0x00) == 1) {
   151			printk ("dvb-ttpci: Crystal audio DAC @ card %d detected\n",
   152				av7110->dvb_adapter.num);
   153			av7110->adac_type = DVB_ADAC_CRYSTAL;
   154			i2c_writereg(av7110, 0x20, 0x01, 0xd2);
   155			i2c_writereg(av7110, 0x20, 0x02, 0x49);
   156			i2c_writereg(av7110, 0x20, 0x03, 0x00);
   157			i2c_writereg(av7110, 0x20, 0x04, 0x00);
   158	
   159			/**
   160			 * some special handling for the Siemens DVB-C cards...
   161			 */
 > 162		} else if (av7110_init_analog_module(av7110) == 0) {
   163			/* done. */
   164		} else if (dev->pci->subsystem_vendor == 0x110a) {
   165			printk("dvb-ttpci: DVB-C w/o analog module @ card %d detected\n",
   166				av7110->dvb_adapter.num);
   167			av7110->adac_type = DVB_ADAC_NONE;
   168		} else {
   169			av7110->adac_type = adac;
   170			printk("dvb-ttpci: adac type set to %d @ card %d\n",
   171				av7110->adac_type, av7110->dvb_adapter.num);
   172		}
   173	
   174		if (av7110->adac_type == DVB_ADAC_NONE || av7110->adac_type == DVB_ADAC_MSP34x0) {
   175			// switch DVB SCART on
   176			ret = av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);
   177			if (ret < 0)
   178				printk("dvb-ttpci:cannot switch on SCART(Main):%d\n",ret);
   179			ret = av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, ADSwitch, 1, 1);
   180			if (ret < 0)
   181				printk("dvb-ttpci:cannot switch on SCART(AD):%d\n",ret);
   182			if (rgb_on &&
   183			    ((av7110->dev->pci->subsystem_vendor == 0x110a) ||
   184			     (av7110->dev->pci->subsystem_vendor == 0x13c2)) &&
   185			     (av7110->dev->pci->subsystem_device == 0x0000)) {
   186				saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI); // RGB on, SCART pin 16
   187				//saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO); // SCARTpin 8
   188			}
   189		}
   190	
   191		if (dev->pci->subsystem_vendor == 0x13c2 && dev->pci->subsystem_device == 0x000e)
   192			av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, SpdifSwitch, 1, 0); // SPDIF on
   193	
   194		ret = av7110_set_volume(av7110, av7110->mixer.volume_left, av7110->mixer.volume_right);
   195		if (ret < 0)
   196			printk("dvb-ttpci:cannot set volume :%d\n",ret);
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
