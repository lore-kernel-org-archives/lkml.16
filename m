Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D624BBE1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745749958; cv=none; b=pbsKOER09jZzdLjkM9je+iVF556fWC3UDHFe4dkud4b81K4QaVG7WQ71WbT7oJpSLeW6sOSIsm8sSkiWChjBWDt8c2vMR28eQEeD4WLYxNQ9webGLBjQdGHOrxwBldhr4Jt1B509PmfggtziRrQVKbwg+cCaf9ggnwaYIMG9dWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745749958; c=relaxed/simple;
	bh=k2/z9kcXsQJ7meYivpJpuNUhu4YGGk81DForHjmwz1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSHdxuhPwoO/jT6ui2NbqFC1Rb6YbO1ghIUmbZAn0puHSEyFmrKKEZf6I2Wco9zLcRREd/XgC1qGITYG1Vs+mqTO9PXnAZlVqvy6kpc8CG1tQNOA1bDakIZTs9UuDRNPjOy+HIS+xasSlEfGN9WL/DynZhthC2kkbnJR9n6sCvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f65xq2St; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f65xq2St"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745749956; x=1777285956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k2/z9kcXsQJ7meYivpJpuNUhu4YGGk81DForHjmwz1s=;
  b=f65xq2StXkWg320FsRPBMDP+WO6sdFWW1qcb/7QW6S6oX4/RJ4BLaDrk
   5j4VxOFBCb1HfWoTzH8mdzssGzE6dEAveJlA7S+7cXerw+D4mDC8Uw0Cn
   +QbQ2xeYudRDzXwSgXdcYOr9plxQR1cRffRflQXLudhzLV+9XabMtEvW+
   T4FOcQfjVW0V81qpqR8P4Q0Y3RyjZCCep9U6XSXUJBUaN9zcGXCbFz2GV
   y39TMTLzW6BxfiUw10EOsp20hmAjGMPrTwQGCTtftSVi1lQLc6focEpOR
   W/Izt0e4TxacuVS+ei2FPGQs6wXxOjyvACZG4k6BiwEnGQbnD4m+0UyPA
   A==;
X-CSE-ConnectionGUID: teFP1H7aTfyBqOWwyWuAGQ==
X-CSE-MsgGUID: i8Kxl65PTs+SZi/WEKMshA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46470879"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="46470879"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 03:32:35 -0700
X-CSE-ConnectionGUID: 8xvmdnDcQvyUFgEL9HjW4Q==
X-CSE-MsgGUID: 2hPdWLk0SISSO8nf4DPFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138088705"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Apr 2025 03:32:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8zJH-0006F3-0X;
	Sun, 27 Apr 2025 10:32:31 +0000
Date: Sun, 27 Apr 2025 18:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH 3/3] staging: gpib: Avoid unused variable warning
Message-ID: <202504271837.SgHoiLBt-lkp@intel.com>
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
config: arm-randconfig-001-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271837.SgHoiLBt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271837.SgHoiLBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271837.SgHoiLBt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/gpib/ines/ines_gpib.c:1118:2: error: use of undeclared identifier 'dev'
    1118 |         dev = link->priv;
         |         ^
   1 error generated.


vim +/dev +1118 drivers/staging/gpib/ines/ines_gpib.c

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
