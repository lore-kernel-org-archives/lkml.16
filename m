Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EE20F07D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607137; cv=none; b=HBL91nR/fDYgfywBi3i8t14sryl8p4IjuH/NRkXAhUCGADz1HDIoXmYfnc4tVhT9RGYeKJUM9aSmi7SwzYW9AEvRlhl3RdkmYU3nl0d3jOD3LJkcUMb939K+Ang7rRsBL4LskKBs0st+Il8ZEQq23qqUGmKKvl1GWno5zckaFiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607137; c=relaxed/simple;
	bh=E9FzwPi84qnnhsvEa2TJ+XfNXzjkhO3Svjir2bf4cXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHTUY9fWPUnuVezbvIyze+FsmV8R/lI+VqMrht0ICO3GD79kragMxLiqv8JGjCybYj/+sVs5tdZjD0y+iIsbMptlFt+sYJLjgjTGUA9pvuoVsSWpmZNeJo04oXajh17iECJq4An4Dn/u9gi/2tOtRvZoQ0s+Rtc6smwjqLVyFlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVO6ZGNY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVO6ZGNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746607136; x=1778143136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9FzwPi84qnnhsvEa2TJ+XfNXzjkhO3Svjir2bf4cXc=;
  b=DVO6ZGNYfOFYaGLotgG3a1gqePHX3WhPPaflOwiIuHgnQ0ZSyHoz/4wV
   MnKmqbcsJ7N8onqzwKaBZGp6eM6uBMQEtq7/yfbRLBReTfhtOAvjmjMPu
   PU3PzRaeIGY5yJ+teaC1g/rS3EtJaTeqzhraxJGat0xlp+kY0aYnVZcxv
   gpbHGvI092M0AF2QjbtJVZwV8SOE35LSKjY8zJQJZh4qxlgD941eSTaZo
   MT2CsAAEqaERE1sAENpWYuvWKf15b9FylAA3zP0SmNPJFw/m05J79BRMp
   ZA/LVOyfD4snDrwDd+8dm7r3zDCslWDotinAqNmenpvDcGg/HxcYIRiS+
   w==;
X-CSE-ConnectionGUID: 2AgaCkeCSGKL1GVERoKFgA==
X-CSE-MsgGUID: d300HiBSTo+Ikh1NRiUn2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48195738"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48195738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:38:56 -0700
X-CSE-ConnectionGUID: oY4b7ML7TMKWm8i9HCFuYQ==
X-CSE-MsgGUID: WwyP+6QkTLmYvYRlp6b7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136410616"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 01:38:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCaIl-0007QV-1H;
	Wed, 07 May 2025 08:38:51 +0000
Date: Wed, 7 May 2025 16:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: drivers/misc/mei/vsc-tp.c:327:28: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202505071634.kZ0I7Va6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: f88c0c72ffb014e5eba676ee337c4eb3b1d6a119 mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type
date:   3 weeks ago
config: x86_64-randconfig-121-20250428 (https://download.01.org/0day-ci/archive/20250507/202505071634.kZ0I7Va6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071634.kZ0I7Va6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071634.kZ0I7Va6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/mei/vsc-tp.c:327:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 [usertype] *dst @@     got unsigned int [usertype] * @@
   drivers/misc/mei/vsc-tp.c:327:28: sparse:     expected restricted __be32 [usertype] *dst
   drivers/misc/mei/vsc-tp.c:327:28: sparse:     got unsigned int [usertype] *
>> drivers/misc/mei/vsc-tp.c:343:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *src @@     got unsigned int [usertype] * @@
   drivers/misc/mei/vsc-tp.c:343:42: sparse:     expected restricted __be32 const [usertype] *src
   drivers/misc/mei/vsc-tp.c:343:42: sparse:     got unsigned int [usertype] *

vim +327 drivers/misc/mei/vsc-tp.c

   307	
   308	/**
   309	 * vsc_tp_rom_xfer - transfer data to rom code
   310	 * @tp: vsc_tp device handle
   311	 * @obuf: the data buffer to be sent to the device
   312	 * @ibuf: the buffer to receive data from the device
   313	 * @len: the length of tx buffer and rx buffer
   314	 * Return: 0 in case of success, negative value in case of error
   315	 */
   316	int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
   317	{
   318		size_t words = len / sizeof(__be32);
   319		int ret;
   320	
   321		if (len % sizeof(__be32) || len > VSC_TP_MAX_MSG_SIZE)
   322			return -EINVAL;
   323	
   324		guard(mutex)(&tp->mutex);
   325	
   326		/* rom xfer is big endian */
 > 327		cpu_to_be32_array((u32 *)tp->tx_buf, obuf, words);
   328	
   329		ret = read_poll_timeout(gpiod_get_value_cansleep, ret,
   330					!ret, VSC_TP_ROM_XFER_POLL_DELAY_US,
   331					VSC_TP_ROM_XFER_POLL_TIMEOUT_US, false,
   332					tp->wakeuphost);
   333		if (ret) {
   334			dev_err(&tp->spi->dev, "wait rom failed ret: %d\n", ret);
   335			return ret;
   336		}
   337	
   338		ret = vsc_tp_dev_xfer(tp, tp->tx_buf, ibuf ? tp->rx_buf : NULL, len);
   339		if (ret)
   340			return ret;
   341	
   342		if (ibuf)
 > 343			be32_to_cpu_array(ibuf, (u32 *)tp->rx_buf, words);
   344	
   345		return ret;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
