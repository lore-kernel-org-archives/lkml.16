Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C6224AF7
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137574; cv=none; b=rG7ncd6Ou9X3y3BW5aCGe3oDIvVZQMI2+dl5PQH8WRUtf37VjxKwgJUbXRbudoj3jzkG9leotqkre1vVzqXrA8sQxKDrtWCeHmzc2SKT7sZka8no2bJ9Q3EDi2MDBumu/tvIaYVqRgtaKghOrlaAdjkei9fAJaUx7etDwP3yuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137574; c=relaxed/simple;
	bh=QSDZTpYofoFm3eToe41FUClfynpAbhv05Xbq5q2vFKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4heeIjZpLpvMVEpVyrd/TkYwPeAB6F3rD+zE9JhKbGbcrbmJTIwrIL8y2WQctJDet4uCfyKKKEP/xUxARKleWoUBJiIlB0kjep40+pxHqU7N928S3k4wplJg6e9YIR/nWNEkZJeYG3r740xUO4+teD6QIWXHFxyGiNgPQtTdMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnWOn4qn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnWOn4qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751137572; x=1782673572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QSDZTpYofoFm3eToe41FUClfynpAbhv05Xbq5q2vFKE=;
  b=fnWOn4qnWw3TUidWXLkmn3veFyA3ptvuS23e0dALidRAu68usGzvKZk+
   xeqXL0HCa3ZFUgQDGvxlekpFJ5vz887RYjZyGu9JfoH1o9w/N9M6dFVKI
   d8XDOBUHjI1zkmxVYOlAvg20tNclcKhtro98IrLrXES3QYG0hO7yv0XkJ
   7Oy88tDAFHuxGGlNIdOgTBmkrpp+gRei9u9GcX3vBgKrAoOUHtZznB8sb
   dB1VAAQoyojS3T2SCRfuIUgBgLmdx5AJmb6CXF92drfsSkPrN1fvAJt0c
   /6KK1sPBqDdIjKEcgEedSIukU2IghNATDOABIHtwVB7mmPI1O3ibunNbi
   Q==;
X-CSE-ConnectionGUID: 9O1WlMSRRgSsvuzgBmnw+A==
X-CSE-MsgGUID: nL+MbAWqQx23f1MS1+rwZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57097777"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="57097777"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:06:11 -0700
X-CSE-ConnectionGUID: qDhqIotbRryu51syaFyYAA==
X-CSE-MsgGUID: cU++gUL2RMevJfN1+aAPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153379132"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2025 12:06:10 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVasK-0000oB-0b;
	Sat, 28 Jun 2025 19:06:08 +0000
Date: Sat, 28 Jun 2025 21:05:42 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kernelxing@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.c:10703:9: warning: variable
 'j' set but not used
Message-ID: <202506282102.x1tXt0qz-lkp@intel.com>
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
commit: 9b6a30febddf4857cb4c367f5294bb6118340e30 net: allow rps/rfs related configs to be switched
date:   1 year, 1 month ago
config: powerpc64-randconfig-2005-20250626 (https://download.01.org/0day-ci/archive/20250628/202506282102.x1tXt0qz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282102.x1tXt0qz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282102.x1tXt0qz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_request_irq':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10703:9: warning: variable 'j' set but not used [-Wunused-but-set-variable]
   10703 |  int i, j, rc = 0;
         |         ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10410:41: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
   10410 |  snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |                                         ^~                     ~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10410:2: note: 'snprintf' output between 8 and 23 bytes into a destination of size 18
   10410 |  snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10411 |    0);
         |    ~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10395:48: warning: '%s' directive output may be truncated writing between 2 and 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
   10395 |   snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                ^~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10395:3: note: 'snprintf' output between 6 and 33 bytes into a destination of size 18
   10395 |   snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10396 |     attr, i);
         |     ~~~~~~~~


vim +/j +10703 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d8409 Michael Chan 2015-10-22  10700  
c0c050c58d8409 Michael Chan 2015-10-22  10701  static int bnxt_request_irq(struct bnxt *bp)
c0c050c58d8409 Michael Chan 2015-10-22  10702  {
b81a90d3028af9 Michael Chan 2016-01-02 @10703  	int i, j, rc = 0;
c0c050c58d8409 Michael Chan 2015-10-22  10704  	unsigned long flags = 0;
c0c050c58d8409 Michael Chan 2015-10-22  10705  #ifdef CONFIG_RFS_ACCEL
e5811b8c09df9b Michael Chan 2018-03-31  10706  	struct cpu_rmap *rmap;
c0c050c58d8409 Michael Chan 2015-10-22  10707  #endif
c0c050c58d8409 Michael Chan 2015-10-22  10708  
e5811b8c09df9b Michael Chan 2018-03-31  10709  	rc = bnxt_setup_int_mode(bp);
e5811b8c09df9b Michael Chan 2018-03-31  10710  	if (rc) {
e5811b8c09df9b Michael Chan 2018-03-31  10711  		netdev_err(bp->dev, "bnxt_setup_int_mode err: %x\n",
e5811b8c09df9b Michael Chan 2018-03-31  10712  			   rc);
e5811b8c09df9b Michael Chan 2018-03-31  10713  		return rc;
e5811b8c09df9b Michael Chan 2018-03-31  10714  	}
e5811b8c09df9b Michael Chan 2018-03-31  10715  #ifdef CONFIG_RFS_ACCEL
e5811b8c09df9b Michael Chan 2018-03-31  10716  	rmap = bp->dev->rx_cpu_rmap;
e5811b8c09df9b Michael Chan 2018-03-31  10717  #endif
c0c050c58d8409 Michael Chan 2015-10-22  10718  	if (!(bp->flags & BNXT_FLAG_USING_MSIX))
c0c050c58d8409 Michael Chan 2015-10-22  10719  		flags = IRQF_SHARED;
c0c050c58d8409 Michael Chan 2015-10-22  10720  
b81a90d3028af9 Michael Chan 2016-01-02  10721  	for (i = 0, j = 0; i < bp->cp_nr_rings; i++) {
e5811b8c09df9b Michael Chan 2018-03-31  10722  		int map_idx = bnxt_cp_num_to_irq_num(bp, i);
e5811b8c09df9b Michael Chan 2018-03-31  10723  		struct bnxt_irq *irq = &bp->irq_tbl[map_idx];
e5811b8c09df9b Michael Chan 2018-03-31  10724  

:::::: The code at line 10703 was first introduced by commit
:::::: b81a90d3028af92da61a61e2efd231a585180044 bnxt_en: Re-structure ring indexing and mapping.

:::::: TO: Michael Chan <mchan@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
