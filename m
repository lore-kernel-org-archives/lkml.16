Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460EB1DE3D2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748531134; cv=none; b=Z/8ot51v7//juMY4WJfJRDgCreFqWKCSUvaIfcWGCzj5xmN7EZSvfVeU1PrJchhF8lodN7D68ngNx5DuxZ01qBeV5HeL5IQnUb2hnID+ABmpYxzW1Mpo5SdRqQgFV1nd+ACBxBukohbRqbmzuZTXhZH76z0Tu6l34fDW2dYr6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748531134; c=relaxed/simple;
	bh=S2kKEOrydWMz6ngpURpxYC/wsqCkoDvEdaHjRnS2fyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ka2umPB1LsymyRtseREMK8P62oIIf79kfCX0vuPCwh2ERHBVVPvn9wL7swILICzwuLZxmCsC8rYoGAteohgpyXxqCwYQbI3o3/Wa2M/7p2ix3Q/rMGTsTD0MX2utMpLvlugxOUYLVNpKn+LZMSYJjrUz1zZHsYYKfVusLy3ujzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9Y9NRfo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9Y9NRfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748531132; x=1780067132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2kKEOrydWMz6ngpURpxYC/wsqCkoDvEdaHjRnS2fyM=;
  b=I9Y9NRfoDNiHL9a1bD7Bx86LW3LK8focbQblzWgsTmV3+t/Ss7H8fPOY
   RcF0KXPQKxzaIZ/Cd6D6sW7ayYwBVRkYT3+cSC4Owx5y3E8xrHR5fabm3
   GeznPsh7wahUo1wk6XPhf5ljTjLibq8O/UP0WIrCq2uGXUx86OO160u/q
   Hi6NkQoYHuFsN28yHS+pV+1+Tx+H18KBpz1LQzk5DDPQDRpw11TR6H/uC
   hZmI4n7TJ1XjubOYjxIHEG30O2mxUL3JNw9I8vSwu7xARgz5AeCMQG2oo
   nSnSZDo4ZOelhL7AFU22i5XWMEOSeD+AEc+TNwVQZeEBVNa78odkzFzot
   w==;
X-CSE-ConnectionGUID: z1a0HYiVR4++KlPme2gG3A==
X-CSE-MsgGUID: Y5qMu77wTECw+UQOVFCJNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54403262"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="54403262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 08:04:26 -0700
X-CSE-ConnectionGUID: s8QOdOCcQhyLYEWtbjceFg==
X-CSE-MsgGUID: jX3ULlzbSfK6ISMXV4T3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="144570745"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 May 2025 08:04:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKent-000Wnc-0w;
	Thu, 29 May 2025 15:04:21 +0000
Date: Thu, 29 May 2025 23:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>
Subject: drivers/gpu/drm/xe/xe_device_sysfs.c:118:66-71: WARNING: conversion
 to bool not needed here
Message-ID: <202505292205.MoljmkjQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b83efa6701656e02c86e7df2cb1765ea602d07
commit: 0e414bf7ad012e55c8a0aa4e91f68cb1cf5801ff drm/xe: Expose PCIe link downgrade attributes
date:   3 weeks ago
config: loongarch-randconfig-r053-20250529 (https://download.01.org/0day-ci/archive/20250529/202505292205.MoljmkjQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505292205.MoljmkjQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_device_sysfs.c:118:66-71: WARNING: conversion to bool not needed here

vim +118 drivers/gpu/drm/xe/xe_device_sysfs.c

    67	
    68	/**
    69	 * DOC: PCIe Gen5 Limitations
    70	 *
    71	 * Default link speed of discrete GPUs is determined by configuration parameters
    72	 * stored in their flash memory, which are subject to override through user
    73	 * initiated firmware updates. It has been observed that devices configured with
    74	 * PCIe Gen5 as their default link speed can come across link quality issues due
    75	 * to host or motherboard limitations and may have to auto-downgrade their link
    76	 * to PCIe Gen4 speed when faced with unstable link at Gen5, which makes
    77	 * firmware updates rather risky on such setups. It is required to ensure that
    78	 * the device is capable of auto-downgrading its link to PCIe Gen4 speed before
    79	 * pushing the firmware image with PCIe Gen5 as default configuration. This can
    80	 * be done by reading ``auto_link_downgrade_capable`` sysfs entry, which will
    81	 * denote if the device is capable of auto-downgrading its link to PCIe Gen4
    82	 * speed with boolean output value of ``0`` or ``1``, meaning `incapable` or
    83	 * `capable` respectively.
    84	 *
    85	 * .. code-block:: shell
    86	 *
    87	 *    $ cat /sys/bus/pci/devices/<bdf>/auto_link_downgrade_capable
    88	 *
    89	 * Pushing the firmware image with PCIe Gen5 as default configuration on a auto
    90	 * link downgrade incapable device and facing link instability due to host or
    91	 * motherboard limitations can result in driver failing to bind to the device,
    92	 * making further firmware updates impossible with RMA being the only last
    93	 * resort.
    94	 *
    95	 * Link downgrade status of auto link downgrade capable devices is available
    96	 * through ``auto_link_downgrade_status`` sysfs entry with boolean output value
    97	 * of ``0`` or ``1``, where ``0`` means no auto-downgrading was required during
    98	 * link training (which is the optimal scenario) and ``1`` means the device has
    99	 * auto-downgraded its link to PCIe Gen4 speed due to unstable Gen5 link.
   100	 *
   101	 * .. code-block:: shell
   102	 *
   103	 *    $ cat /sys/bus/pci/devices/<bdf>/auto_link_downgrade_status
   104	 */
   105	
   106	static ssize_t
   107	auto_link_downgrade_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
   108	{
   109		struct pci_dev *pdev = to_pci_dev(dev);
   110		struct xe_device *xe = pdev_to_xe_device(pdev);
   111		u32 cap, val;
   112	
   113		xe_pm_runtime_get(xe);
   114		val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE_CAP);
   115		xe_pm_runtime_put(xe);
   116	
   117		cap = REG_FIELD_GET(LINK_DOWNGRADE, val);
 > 118		return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE ? true : false);
   119	}
   120	static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_capable);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
