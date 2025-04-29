Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6212750FD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967027; cv=none; b=Gl8MlIBSq3FwWi7r94i411ueXtqUVtAmRQxwjgdyetV9E7jeF0Eqg4tTXjyODhh9Ha9O3YPpZptVOS6Azpzc5JzTNf2xU3069ITu+NBKqV3/I0sI5DLqRrQRONsrN3JrHMnpjmCdaAYzK3Y23x9axGJcDJ5SIDwLbQPHiVIWk8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967027; c=relaxed/simple;
	bh=qcATI4kyA6jhncucsOvHAR8+CWkUQbOfdkfLUWaOrcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fRiv1kN/mCU/dwmLntn/KqezmRBFU28RDWKd+LmN7APzX5Awv8y4q8T0EERRv4+9IKgr1aN+s79FFRXrVpqk+IWHCAkIpJBxuBRv8zmXBlvEOOiKRfJbprsk86io9jmMkYxu8rqTF/kuEApbHvFQ10W+u/N5qDct61mh8vuia4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUcvWGQk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUcvWGQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745967026; x=1777503026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcATI4kyA6jhncucsOvHAR8+CWkUQbOfdkfLUWaOrcI=;
  b=SUcvWGQksVw8g8B83Vb6hTYK57rxrIAsKAiVLqfPWP+KXmEwj7V45+3Q
   h9nmDVsKKFPS/qpIKRr/GthGqxBQklJ0VzyfWDfQjwgCx2aK3W08Ucm9x
   9N1VFTx9shd2L8QH0sJNp0oFgTFV1sYaJVxk/MhnGgNQQpsy6uEBDxC3V
   W2+OQn/X6I1i7iC9rEnIchdg5ngnP57P6F9t41Jlum+LHpc1pgM7RqRki
   B3MlVrdywuHKOOZle+0w7KMvBhv7OzQoAxdZ9AXOC7vvHZUuCLzyzMoYK
   MwgSPjzwSGh2wTFUKOEfvDGGjvBuAAms1XePk4VNC7SDcMljgFgbMLsVY
   Q==;
X-CSE-ConnectionGUID: aaM08vL1SPSUuvFzKKD7GA==
X-CSE-MsgGUID: z9+5XYovSQaASX3KYvt2xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58267197"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58267197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:50:25 -0700
X-CSE-ConnectionGUID: 3sxme/OSTHKde+zSe7BqoQ==
X-CSE-MsgGUID: K8PuLYrmQg+/5BqBVOeUkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133842176"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2025 15:50:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tmO-000305-1o;
	Tue, 29 Apr 2025 22:50:20 +0000
Date: Wed, 30 Apr 2025 06:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/memory/emif.c:70: warning: Function parameter or struct
 member 'lpmode' not described in 'emif_data'
Message-ID: <202504300653.UsxspPy7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sergei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
commit: ca7d8b980b67f133317525c4273e144116ee1ae5 memory: add Renesas RPC-IF driver
date:   4 years, 10 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250430/202504300653.UsxspPy7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300653.UsxspPy7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300653.UsxspPy7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/emif.c:70: warning: Function parameter or struct member 'lpmode' not described in 'emif_data'
   drivers/memory/emif.c:70: warning: Function parameter or struct member 'irq_state' not described in 'emif_data'
   drivers/memory/emif.c:70: warning: Function parameter or struct member 'addressing' not described in 'emif_data'


vim +70 drivers/memory/emif.c

7ec944538dde3d7 Aneesh V 2012-04-27  30  
7ec944538dde3d7 Aneesh V 2012-04-27  31  /**
7ec944538dde3d7 Aneesh V 2012-04-27  32   * struct emif_data - Per device static data for driver's use
7ec944538dde3d7 Aneesh V 2012-04-27  33   * @duplicate:			Whether the DDR devices attached to this EMIF
7ec944538dde3d7 Aneesh V 2012-04-27  34   *				instance are exactly same as that on EMIF1. In
7ec944538dde3d7 Aneesh V 2012-04-27  35   *				this case we can save some memory and processing
7ec944538dde3d7 Aneesh V 2012-04-27  36   * @temperature_level:		Maximum temperature of LPDDR2 devices attached
7ec944538dde3d7 Aneesh V 2012-04-27  37   *				to this EMIF - read from MR4 register. If there
7ec944538dde3d7 Aneesh V 2012-04-27  38   *				are two devices attached to this EMIF, this
7ec944538dde3d7 Aneesh V 2012-04-27  39   *				value is the maximum of the two temperature
7ec944538dde3d7 Aneesh V 2012-04-27  40   *				levels.
7ec944538dde3d7 Aneesh V 2012-04-27  41   * @node:			node in the device list
7ec944538dde3d7 Aneesh V 2012-04-27  42   * @base:			base address of memory-mapped IO registers.
7ec944538dde3d7 Aneesh V 2012-04-27  43   * @dev:			device pointer.
a93de288aad3b04 Aneesh V 2012-04-27  44   * @addressing			table with addressing information from the spec
a93de288aad3b04 Aneesh V 2012-04-27  45   * @regs_cache:			An array of 'struct emif_regs' that stores
a93de288aad3b04 Aneesh V 2012-04-27  46   *				calculated register values for different
a93de288aad3b04 Aneesh V 2012-04-27  47   *				frequencies, to avoid re-calculating them on
a93de288aad3b04 Aneesh V 2012-04-27  48   *				each DVFS transition.
a93de288aad3b04 Aneesh V 2012-04-27  49   * @curr_regs:			The set of register values used in the last
a93de288aad3b04 Aneesh V 2012-04-27  50   *				frequency change (i.e. corresponding to the
a93de288aad3b04 Aneesh V 2012-04-27  51   *				frequency in effect at the moment)
7ec944538dde3d7 Aneesh V 2012-04-27  52   * @plat_data:			Pointer to saved platform data.
aac10aaa8cc65a6 Aneesh V 2012-04-27  53   * @debugfs_root:		dentry to the root folder for EMIF in debugfs
e6b42eb6a66c188 Aneesh V 2012-08-17  54   * @np_ddr:			Pointer to ddr device tree node
7ec944538dde3d7 Aneesh V 2012-04-27  55   */
7ec944538dde3d7 Aneesh V 2012-04-27  56  struct emif_data {
7ec944538dde3d7 Aneesh V 2012-04-27  57  	u8				duplicate;
7ec944538dde3d7 Aneesh V 2012-04-27  58  	u8				temperature_level;
a93de288aad3b04 Aneesh V 2012-04-27  59  	u8				lpmode;
7ec944538dde3d7 Aneesh V 2012-04-27  60  	struct list_head		node;
a93de288aad3b04 Aneesh V 2012-04-27  61  	unsigned long			irq_state;
7ec944538dde3d7 Aneesh V 2012-04-27  62  	void __iomem			*base;
7ec944538dde3d7 Aneesh V 2012-04-27  63  	struct device			*dev;
a93de288aad3b04 Aneesh V 2012-04-27  64  	const struct lpddr2_addressing	*addressing;
a93de288aad3b04 Aneesh V 2012-04-27  65  	struct emif_regs		*regs_cache[EMIF_MAX_NUM_FREQUENCIES];
a93de288aad3b04 Aneesh V 2012-04-27  66  	struct emif_regs		*curr_regs;
7ec944538dde3d7 Aneesh V 2012-04-27  67  	struct emif_platform_data	*plat_data;
aac10aaa8cc65a6 Aneesh V 2012-04-27  68  	struct dentry			*debugfs_root;
e6b42eb6a66c188 Aneesh V 2012-08-17  69  	struct device_node		*np_ddr;
7ec944538dde3d7 Aneesh V 2012-04-27 @70  };
7ec944538dde3d7 Aneesh V 2012-04-27  71  

:::::: The code at line 70 was first introduced by commit
:::::: 7ec944538dde3d7f490bd4d2619051789db5c3c3 memory: emif: add basic infrastructure for EMIF driver

:::::: TO: Aneesh V <aneesh@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
