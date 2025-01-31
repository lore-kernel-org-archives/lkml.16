Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E081E15575D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367261; cv=none; b=NttV52aCdoEFNEmed9b56HG3mFQx+5Yo5bOV67b4Jcr5Ksc62WufXxavHjlp/7hVsatd8Iy88/hSZjRRoQDsOoSiHKJIpPAYNtg99NGx3bgq977mbitfNgHrXsb+YiWbjIzziMWECVbcrexV5uksnL/L7Ow076XWvLy0mbqIzGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367261; c=relaxed/simple;
	bh=Ho0vv4BiG1C1aYAWTl4onBfhoSdgY1cGMOyHVUUMoBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJtsWshL8Tr3fOzVs7bx3J7aGdkE/Du++VlBsxpTZiyro+3yjyUccQztBfDs2ItDSYZ3pJDdThl+Jna1pLyVw1GCriqTC5ckDqce++bkozRfakS/J29S2Our9iqJHYTGuzKmQ6iLVrBYrJ3lkQbNuTGGvFOSLnbHmOhCiHVhL80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfUKnQfk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfUKnQfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738367260; x=1769903260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ho0vv4BiG1C1aYAWTl4onBfhoSdgY1cGMOyHVUUMoBA=;
  b=YfUKnQfktFZLf5fviuHEi+O64o5/9qfakYXHa0mICKWk/Cb75OEbOPs9
   /g2H72KwGjqxfNm26h804emYU4652X8PriAf6V1rX2NWxuckjuYpc4FGG
   wkOTi3SE4AqS2HRSD2nK+3z4WURFnh6bTEl5Wh45GReBFClLxXcKrqsrz
   p/rzddqkvRdxO4mrc1kuO9EhdEYK4o/p9jZtmZbgekT8QzQ+yNitxMbKP
   2E47D3CKwN7yCvfcRQfzWCtvIqNzA8km60QRuVV2LUuWCy3HM/MtYOY62
   9uj/GJ5N4QyrmGeAi3/xriDXipjM/0qrys/h4MkTozqlTQ91x7/a/Lph/
   Q==;
X-CSE-ConnectionGUID: nCeWRLiNQFq7X+mu/Nm2bw==
X-CSE-MsgGUID: XRRzd0osQlKiN1/EHX4Wzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49544543"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49544543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:47:39 -0800
X-CSE-ConnectionGUID: 0huj2Ou7SCqLVP7Fspy+hA==
X-CSE-MsgGUID: vYz8jqEZS5C32vMpZKpniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109590215"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jan 2025 15:47:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te0jX-000nQd-21;
	Fri, 31 Jan 2025 23:47:35 +0000
Date: Sat, 1 Feb 2025 07:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Shay Drory <shayd@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:48:34: warning:
 '%s' directive argument is null
Message-ID: <202502010749.671SSYTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shay,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd8c09ad0d87783b9b6a27900d66293be45b7bad
commit: 71e084e26414b0f27d8befa1c30b74d39d9cb2a1 net/mlx5: Allocating a pool of MSI-X vectors for SFs
date:   3 years, 8 months ago
config: mips-randconfig-r015-20230807 (https://download.01.org/0day-ci/archive/20250201/202502010749.671SSYTr-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010749.671SSYTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010749.671SSYTr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:4:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1320:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1320 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1306:27: note: 'mem_section' declared here
    1306 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:17,
                    from include/linux/interrupt.h:6:
   In function 'irq_pool_alloc',
       inlined from 'irq_pools_init' at drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:332:19,
       inlined from 'mlx5_irq_table_create' at drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:437:8:
>> drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:48:34: warning: '%s' directive argument is null [-Wformat-overflow=]
      48 |         dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,             \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:9: note: in expansion of macro 'dynamic_dev_dbg'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:30: note: in expansion of macro 'dev_fmt'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:48:9: note: in expansion of macro 'dev_dbg'
      48 |         dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,             \
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:307:9: note: in expansion of macro 'mlx5_core_dbg'
     307 |         mlx5_core_dbg(dev, "pool->name = %s, pool->size = %d, pool->start = %d",
         |         ^~~~~~~~~~~~~


vim +48 drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h

e126ba97dba9ed Eli Cohen    2013-07-07  46  
5a7883989b1c57 Eli Cohen    2015-10-08  47  #define mlx5_core_dbg(__dev, format, ...)				\
27b942fbbd3107 Parav Pandit 2019-04-29 @48  	dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,		\
9e5b2fc1d39b31 Kamal Heib   2016-12-06  49  		 __func__, __LINE__, current->pid,			\
1a91de28831a1b Joe Perches  2014-05-07  50  		 ##__VA_ARGS__)
e126ba97dba9ed Eli Cohen    2013-07-07  51  

:::::: The code at line 48 was first introduced by commit
:::::: 27b942fbbd3107d4e969ece133925cd646239ef4 net/mlx5: Get rid of storing copy of device name

:::::: TO: Parav Pandit <parav@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
