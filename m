Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CB29AB11
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022347; cv=none; b=OvITsHoYM16f6At2IQopg72T9YDa1u0RyRKSHHq0aa4xOU73s3Z+Oihdoxj04PcpZF4zBgldSofUfO3NrI8rBS54z7vjQydKs04oD0TGE/s4fvMMLMl4lPJZ3Qnp3iEDiENcsac32X621ab5xSQAR64tNS3Cb4fZKwycwrao4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022347; c=relaxed/simple;
	bh=sbR/nTT4C1TqnzdHgq9gd3zOkm4cCICU0vS6irzL69M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzFAnFmyYce+mq9/FXAyxaZayfNvRviifEKIV5o347QGt91jvdz6s+vTuWtDF99Awj9W1gxaXqbjJ0tToVBpJH++Z7tVkoEPqSrbuOS3ZucFybJrrNYrufTMtpxM11w7XzK0bFmLrhw+EJP+qp0hF341Ugd9MhNVCm2aeegTP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FefDWxpA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FefDWxpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751022345; x=1782558345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sbR/nTT4C1TqnzdHgq9gd3zOkm4cCICU0vS6irzL69M=;
  b=FefDWxpA2wD0IJSJiRwFT/7HRFSpLx58C5S1meGBogsPjSM1qo4s/S7d
   0FhTKumph4PcpmHMFUfZKLF5ZW6k3aPdEW33fXaJ/GHTiP3zSb97W4DmB
   guyr3wmTH/Wf4pUh6aXT3kHBKdIHdL491ZSZXd7yT9/2/wiz8Aq54bAyS
   eJbo1CDfdJDDyI2qgFNSMxNMPIQsIC61burSs5QeiK38f0qJBgi4DD7JA
   w79Ei7hZDCij4mvjdhz6VpNWPED02YR/7+kjtg/44of9XyNnbGnghP/PZ
   swNw4DY0/b1xLoPbyZcfQiFNZY42ZP9GmPvzaMNFqNWJsJgfWCmde3zqf
   A==;
X-CSE-ConnectionGUID: E/RsiZU4Tby1meJ4JJMVEw==
X-CSE-MsgGUID: kTR7Km9kQeiOmK11Z4ZI4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64391132"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64391132"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:05:44 -0700
X-CSE-ConnectionGUID: aD5GUeJ9QfSDwOSUJSh86A==
X-CSE-MsgGUID: P7+bGAT0Q8+jOELw8fiAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152171596"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 27 Jun 2025 04:05:42 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV6to-0000eN-0v;
	Fri, 27 Jun 2025 11:05:40 +0000
Date: Fri, 27 Jun 2025 13:05:17 +0200
From: kernel test robot <lkp@intel.com>
To: Justin Lai <justinlai0215@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Joe Damato <jdamato@fastly.com>
Subject: drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning:
 '%u' directive output may be truncated writing between 1 and 10 bytes into a
 region of size between 7 and 22
Message-ID: <202506271902.vYqvPORm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a993863163cb88b1b68974c31b0d84ece4293e
commit: ef7d33e174564d6294edd00ca797e2b0aac76259 rtase: Modify the format specifier in snprintf to %u
date:   8 weeks ago
config: sparc-randconfig-2003-20250626 (https://download.01.org/0day-ci/archive/20250627/202506271902.vYqvPORm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271902.vYqvPORm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271902.vYqvPORm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/rtase/rtase_main.c: In function 'rtase_open':
>> drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
                                                       ^~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:45: note: directive argument in the range [0, 2147483647]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
                                                ^~~~~~~~~~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:4: note: 'snprintf' output between 6 and 30 bytes into a destination of size 26
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         tp->dev->name, i);
         ~~~~~~~~~~~~~~~~~


vim +1117 drivers/net/ethernet/realtek/rtase/rtase_main.c

  1086	
  1087	static int rtase_open(struct net_device *dev)
  1088	{
  1089		struct rtase_private *tp = netdev_priv(dev);
  1090		const struct pci_dev *pdev = tp->pdev;
  1091		struct rtase_int_vector *ivec;
  1092		u16 i = 0, j;
  1093		int ret;
  1094	
  1095		ivec = &tp->int_vector[0];
  1096		tp->rx_buf_sz = RTASE_RX_BUF_SIZE;
  1097	
  1098		ret = rtase_alloc_desc(tp);
  1099		if (ret)
  1100			return ret;
  1101	
  1102		ret = rtase_init_ring(dev);
  1103		if (ret)
  1104			goto err_free_all_allocated_mem;
  1105	
  1106		rtase_hw_config(dev);
  1107	
  1108		if (tp->sw_flag & RTASE_SWF_MSIX_ENABLED) {
  1109			ret = request_irq(ivec->irq, rtase_interrupt, 0,
  1110					  dev->name, ivec);
  1111			if (ret)
  1112				goto err_free_all_allocated_irq;
  1113	
  1114			/* request other interrupts to handle multiqueue */
  1115			for (i = 1; i < tp->int_nums; i++) {
  1116				ivec = &tp->int_vector[i];
> 1117				snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
  1118					 tp->dev->name, i);
  1119				ret = request_irq(ivec->irq, rtase_q_interrupt, 0,
  1120						  ivec->name, ivec);
  1121				if (ret)
  1122					goto err_free_all_allocated_irq;
  1123			}
  1124		} else {
  1125			ret = request_irq(pdev->irq, rtase_interrupt, 0, dev->name,
  1126					  ivec);
  1127			if (ret)
  1128				goto err_free_all_allocated_mem;
  1129		}
  1130	
  1131		rtase_hw_start(dev);
  1132	
  1133		for (i = 0; i < tp->int_nums; i++) {
  1134			ivec = &tp->int_vector[i];
  1135			napi_enable(&ivec->napi);
  1136		}
  1137	
  1138		netif_carrier_on(dev);
  1139		netif_wake_queue(dev);
  1140	
  1141		return 0;
  1142	
  1143	err_free_all_allocated_irq:
  1144		for (j = 0; j < i; j++)
  1145			free_irq(tp->int_vector[j].irq, &tp->int_vector[j]);
  1146	
  1147	err_free_all_allocated_mem:
  1148		rtase_free_desc(tp);
  1149	
  1150		return ret;
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
