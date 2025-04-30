Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632D1EDA12
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046006; cv=none; b=RM34g7q9Anuu7OZpjO1Vadzzi7QbnlUV4pEJONShuF7VRvvTr37fKOOLMMGSHLKWQVQorzNBwHiXWa4maPm+qz4BPzV9upfSC+T9gvANHZ1pEB1fHCdZYPwS3jINXZYA4FYVDDo0mqiTssXt6a/uB/VnfLAvus58BFTMEkzUk78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046006; c=relaxed/simple;
	bh=aQ1kHFTUkCAsnq+o1MzgOij5Dfu9lqBraoyfjbV9MFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiWtzzlSVPO6eFfft2PWEpyTEnWjyDsrLhH1ZY52HY+PwWEC52wrch8bx+f2cs7qczzqW1UoBeMiWhEiK8CeuZsuu5Df+1QV7iaJXtmFusucKocbhov/BJZzhUdZBQhRiK9zQg9MQEFL/ZUNAPeZRDUv+0SBo8Hx4M4CUuxQglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgZ8e/AH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgZ8e/AH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746046005; x=1777582005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQ1kHFTUkCAsnq+o1MzgOij5Dfu9lqBraoyfjbV9MFs=;
  b=EgZ8e/AHbN1BmCTQdBfOYxiO8nXuf3YktHvV1blQ9xh/0p6E26fYE+gQ
   UD+qoCuSels2ClLw0jRgC2hqAJxxztgYXWAPu03GeGfLKI6tCWsqpk5Rw
   cv3qNzDQV9R8zhNx8nbIoAoKGAW/nI3Qxgz1f7gJb3S+hIxKMe3Qqxb3d
   9s9GJsT6G3b6lMMCgJsuZmvPLlQG8e9GlH+ypZjUvnXGJkcKXUgCWwsAO
   B1rM9svUGhU6sJ6/wuc4wZ8OP5YMNsWS3wRghLtF4fJ8AYX0N9nAP07SC
   UsXAhI2M5FBcgzxP8bVomwIlPUF7K19HkE07MTPp51xx4WhIynfwlkGAt
   g==;
X-CSE-ConnectionGUID: ZRiuUzZOQLuO+6FkTc5vZA==
X-CSE-MsgGUID: l2sWXrl6RlaSJx7YF09Fyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58713537"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="58713537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 13:46:44 -0700
X-CSE-ConnectionGUID: Edh5xGTmTE66Be3+Dn19tA==
X-CSE-MsgGUID: U6a4JzrFSXWKHHMqUfcXSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="138247911"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2025 13:46:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAEKF-0003lJ-2v;
	Wed, 30 Apr 2025 20:46:39 +0000
Date: Thu, 1 May 2025 04:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000
 (xlnx,zynq-gem): ethernet-phy@0: Unevaluated properties are not allowed
 ('marvell,reg-init' was unexpected)
Message-ID: <202505010445.sF2xANeF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6ea1680d0ac0e45157a819c41b46565f4616186
commit: 876188600a261e867a6308cd30d01c2ab5c7bf48 ARM: zynq: Remove deprecated device_type property
date:   3 months ago
config: arm-randconfig-051-20250428 (https://download.01.org/0day-ci/archive/20250501/202505010445.sF2xANeF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010445.sF2xANeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010445.sF2xANeF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: fpga-full (fpga-region): $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: replicator (arm,coresight-static-replicator): 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/i2c@e0004000/isl9305@68: failed to match any schema with compatible: ['isil,isl9305']
>> arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000 (xlnx,zynq-gem): ethernet-phy@0: Unevaluated properties are not allowed ('marvell,reg-init' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
