Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C790213E86
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787982; cv=none; b=TcPZc153Emd6pS6lwsi2HHG5hdS2Qgxj6U5v19YrExbuAwTyUVdFay6+IHQlm0Q0tuuUQu8rsFDRwEvH93xU8a8XBRgN+DJ7THBUZgjFVIrCi9bFMxKZFmN6gLSL3qcY+1tTjOOXhEPMmn2x5vY6L63y4iKQ6YEm5VH2WXK1g78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787982; c=relaxed/simple;
	bh=udWU1/vCgdUYs+DL4UR4NK7AcF+SYhzF65Vdvil1Rz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CR/v5cbSMSQMYbxHaOU5aJwtO1w9G6cswpE7NdtZPgbjcmCdojFwcGbAhL9HVwfESPHGBXE6WNzr89UGLRRydBjWRdiAMQ13e+wgL/QRdPPqQ/2hzDyGQtjvmNUWiw59arGzPyDjqmXOs87XQ/w9C0De1B8U+UOtoQ3//Dk9I+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNHZS4KQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNHZS4KQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738787980; x=1770323980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=udWU1/vCgdUYs+DL4UR4NK7AcF+SYhzF65Vdvil1Rz4=;
  b=UNHZS4KQJRr98mb3OwscbO0nOB9bgnEg8fBQCYtRrJ2y627FfYf2KKC5
   dcuBkPpYn6/BkznL6kQrdgO56x2vdPzQgNhaHS2xgijBBPxdr38ddhe4X
   iVsqQLHXjFD3u5w7uEIRhXz9eBO3mOM1pWT0QjwlywC3Z2EqLYCqcT9er
   Tw3SXAxVA+SbhM9GdTRE0ZJygk8dK8qa3rNHJBKU117V6cOiyfTDd99se
   mfShdS2K8ek1Nt3OAZtaVh8mjCsoymvARABYD2DwP+1Ws2sQgQVZ3DHnb
   CSX4pWcHHqVVyktGa7kQDWB5BKn9q8ZcF+rS8hC/tTORVmLX941VCnSGy
   w==;
X-CSE-ConnectionGUID: BfuYgiFkR5aqMEddBhZL9A==
X-CSE-MsgGUID: uW+hv7ZbR6e5Tcu8XfQDVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38604636"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="38604636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 12:39:40 -0800
X-CSE-ConnectionGUID: yegdw10jQgq2QcVBqjBUZg==
X-CSE-MsgGUID: FIIkEcrDS1e6rFxcdLJ6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110987645"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 12:39:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfmBL-000w3V-1H;
	Wed, 05 Feb 2025 20:39:35 +0000
Date: Thu, 6 Feb 2025 04:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: sound/soc/codecs/rt5514-spi.c:496:34: warning: 'rt5514_of_match'
 defined but not used
Message-ID: <202502060435.99RUqBCx-lkp@intel.com>
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
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk framework to be selectable
date:   4 years, 9 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250206/202502060435.99RUqBCx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060435.99RUqBCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060435.99RUqBCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:95,
                    from include/linux/scatterlist.h:8,
                    from include/linux/spi/spi.h:14,
                    from sound/soc/codecs/rt5514-spi.c:11:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:96:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      96 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
     322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:202:9: note: in expansion of macro 'pte_clear'
     202 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:96:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      96 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:641:9: note: in expansion of macro 'set_pte_at'
     641 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   sound/soc/codecs/rt5514-spi.c: At top level:
>> sound/soc/codecs/rt5514-spi.c:496:34: warning: 'rt5514_of_match' defined but not used [-Wunused-const-variable=]
     496 | static const struct of_device_id rt5514_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/rt5514_of_match +496 sound/soc/codecs/rt5514-spi.c

58f1c07d23cddb oder_chiou@realtek.com 2017-11-08  495  
6eebf35b0e4a02 Oder Chiou             2016-06-06 @496  static const struct of_device_id rt5514_of_match[] = {
6eebf35b0e4a02 Oder Chiou             2016-06-06  497  	{ .compatible = "realtek,rt5514", },
6eebf35b0e4a02 Oder Chiou             2016-06-06  498  	{},
6eebf35b0e4a02 Oder Chiou             2016-06-06  499  };
6eebf35b0e4a02 Oder Chiou             2016-06-06  500  MODULE_DEVICE_TABLE(of, rt5514_of_match);
6eebf35b0e4a02 Oder Chiou             2016-06-06  501  

:::::: The code at line 496 was first introduced by commit
:::::: 6eebf35b0e4a02248f7dba5d1719c6896afe41ba ASoC: rt5514: add rt5514 SPI driver

:::::: TO: Oder Chiou <oder_chiou@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
