Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2392376E0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745750619; cv=none; b=nu2Hvq99wiLuP8afE+UQq8ItvH2OzW3Ixo+Wnzed51E4Xw96u3KXy7S9W3mFtaMgsdN4rQJkcn1HQqyY7NqOK8EtlbR2hWxCoRJc6SifSLflWOsBShALNmY5s5RVqoHQdoyH4o8g2VTWzYJorad28i4MAe9BLk/NuZjITjdtFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745750619; c=relaxed/simple;
	bh=5R3YcrRM8+b5edzNfnHiwtuClP1tBnje+vx1dKrwfO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5nxfoI8cg8ikkbv8EH8mEMMiPfpgrxsTYGefzJDIURoTsSTH3mP8OWc3lXjY9GmdXj0w51Zomy9nO8L/gmL7P/xzItfM9HxHO0s46pS+snr6Gap4Go3kCWc2Q3r0h/LaWhmE9W/F2cUEbbxpu84V2VauaBcrBOx2YfNk5h+unA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODk1q4Jl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODk1q4Jl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745750616; x=1777286616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5R3YcrRM8+b5edzNfnHiwtuClP1tBnje+vx1dKrwfO0=;
  b=ODk1q4JlsGkS7z98q8ae8pkPiOXZn85Cvn2NFwS0WpSr53byS3Yo1gBb
   RMc0xyWlt3pzEl+8sz/Czt4zTmr+emYWtErzpuZKnq+aWLCTxW349c43u
   mnwmrbGifhe8HzIUXq4qVS16Ld4PSqAxC5QxPGfOTGiTPaWMjZNco+NMU
   bcriqf+D5BJXb231kU+7nqmW1RSaQrTriwLtFPcPKXdlWFuXoUwyLa5wy
   Ff/cjD/WovUM8cU9CXtW1wTORpgxuyj3vt3sfgmXjYozgU2hHt6EjKXAZ
   87K/YhQ22Jymck8YITObBNNsYsFan7CaTJEkCWryQTFNrE7jQTJ5N0vRQ
   w==;
X-CSE-ConnectionGUID: KFz/GNZxQ96yWOoz1hZAyA==
X-CSE-MsgGUID: +oQMHST5QoOVR/lD37EE0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="64887658"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="64887658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 03:43:35 -0700
X-CSE-ConnectionGUID: dQ5n7KwjQ4WekgdaJH8a5A==
X-CSE-MsgGUID: ytUu+YufRASEiwkQ1l0I+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133767169"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Apr 2025 03:43:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8zTv-0006FJ-2v;
	Sun, 27 Apr 2025 10:43:31 +0000
Date: Sun, 27 Apr 2025 18:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH 3/3] staging: gpib: Avoid unused variable warning
Message-ID: <202504271805.WmPdV7YW-lkp@intel.com>
References: <20250427091018.13705-4-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250427091018.13705-4-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Fix-PCMCIA-config-identifier/20250427-171209
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250427091018.13705-4-dpenkler%40gmail.com
patch subject: [PATCH 3/3] staging: gpib: Avoid unused variable warning
config: x86_64-buildonly-randconfig-002-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271805.WmPdV7YW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271805.WmPdV7YW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271805.WmPdV7YW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_gpib_config':
>> drivers/staging/gpib/ines/ines_gpib.c:1118:9: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
    1118 |         dev = link->priv;
         |         ^~~
         |         cdev
   drivers/staging/gpib/ines/ines_gpib.c:1118:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1118 drivers/staging/gpib/ines/ines_gpib.c

bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1107  
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1108  /*
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1109   * gpib_config() is scheduled to run after a CARD_INSERTION event
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1110   * is received, to configure the PCMCIA socket, and to make the
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1111   * device available to the system.
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1112   */
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1113  static int ines_gpib_config(struct pcmcia_device *link)
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1114  {
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1115  	int retval;
77b41a9342f610 Dave Penkler  2025-01-14  1116  	void __iomem *virt;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1117  
bb1bd92fa0f2c9 Dave Penkler  2024-09-18 @1118  	dev = link->priv;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1119  
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1120  	retval = pcmcia_loop_config(link, &ines_gpib_config_iteration, NULL);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1121  	if (retval) {
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1122  		dev_warn(&link->dev, "no configuration found\n");
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1123  		ines_gpib_release(link);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1124  		return -ENODEV;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1125  	}
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1126  
0de51244e7b7e3 Dave Penkler  2025-02-20  1127  	dev_dbg(&link->dev, "ines_cs: manufacturer: 0x%x card: 0x%x\n",
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1128  		link->manf_id, link->card_id);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1129  
2de3fa2c3f4e25 Paul Retourné 2025-04-11  1130  	/*
2de3fa2c3f4e25 Paul Retourné 2025-04-11  1131  	 * for the ines card we have to setup the configuration registers in
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1132  	 * attribute memory here
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1133  	 */
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1134  	link->resource[2]->flags |= WIN_MEMORY_TYPE_AM | WIN_DATA_WIDTH_8 | WIN_ENABLE;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1135  	link->resource[2]->end = 0x1000;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1136  	retval = pcmcia_request_window(link, link->resource[2], 250);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1137  	if (retval) {
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1138  		dev_warn(&link->dev, "pcmcia_request_window failed\n");
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1139  		ines_gpib_release(link);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1140  		return -ENODEV;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1141  	}
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1142  	retval = pcmcia_map_mem_page(link, link->resource[2], 0);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1143  	if (retval) {
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1144  		dev_warn(&link->dev, "pcmcia_map_mem_page failed\n");
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1145  		ines_gpib_release(link);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1146  		return -ENODEV;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1147  	}
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1148  	virt = ioremap(link->resource[2]->start, resource_size(link->resource[2]));
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1149  	writeb((link->resource[2]->start >> 2) & 0xff, virt + 0xf0); // IOWindow base
77b41a9342f610 Dave Penkler  2025-01-14  1150  	iounmap(virt);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1151  
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1152  	/*
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1153  	 * This actually configures the PCMCIA socket -- setting up
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1154  	 * the I/O windows and the interrupt mapping.
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1155  	 */
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1156  	retval = pcmcia_enable_device(link);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1157  	if (retval) {
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1158  		ines_gpib_release(link);
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1159  		return -ENODEV;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1160  	}
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1161  	return 0;
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1162  } /* gpib_config */
bb1bd92fa0f2c9 Dave Penkler  2024-09-18  1163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
