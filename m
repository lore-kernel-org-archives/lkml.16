Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B2B6FB9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746089046; cv=none; b=L6QtSnc9KxvvHf/fUiRjpGhkN/iEkfA6oJ9kYrKr3lYxY9fZxwAMufcXlpsjEFxUNlHFjfyVkfcwhTdDoiy9pxJvGrwQDw17hy3jo0NvJV3LrVzgREb8B1SWAWKNU2/+62787U6N7bZ/5Nplsi7YrjevUr8nrSdZmzVtmDVV+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746089046; c=relaxed/simple;
	bh=HgTtfiDeuL6k7LMFHyYmTH2TP3r+gys9yzE/2vgGPa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gU0XWXY9sIAW6AeY6+8qyHfg+uwfAo/s7X8uQ+BWAkiyq2Uy1sjPUaeVQI5v1U3pW3aE9fp/sBXCNDuVep4GK7DkAWZ3GTPQbH9dRRMQzoKiOmbF+0qy6naeBph9UYvA43tg/8/2YwmBEYEjRmK0FUvTLO/iqQODYbYzjiI2y7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHtdCxXq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHtdCxXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746089042; x=1777625042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HgTtfiDeuL6k7LMFHyYmTH2TP3r+gys9yzE/2vgGPa4=;
  b=IHtdCxXqbDsR/yI8Z5JW6qzFB/TjBgh1DF26nm2u/NqNYxyEAz9ubJNP
   ilgquUaV5SFYO3iLFCOWEGqyke/EIboj/V4nCDJt0xEJJ/4KO1VpF8sQE
   oRdUD3A7iyaMhqMV34VR6kv3ZowzhIm4FKLSPuagIRbVNiz3/AFJjcnW7
   aAGmBaLj9JTALRWhfHVCDBSPk1cCH+RuDQDtJmzeYUEXHaQPqJ56R1z3f
   77j8+qxtjoQLZZs3XG3UWL5WPX3UECAl/KKakSkZ1zalMhZKv4EvoIXjY
   GXakoB6Z+3qX3oQQx1MFI3t1t3qpAgkrpAnBOTjN3rVFEAw6fnwBo75qn
   w==;
X-CSE-ConnectionGUID: MwfJO3q/QNmvyg/wakXF4w==
X-CSE-MsgGUID: HNquuMnmS5qDOx2TgcrwMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58421257"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="58421257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 01:44:01 -0700
X-CSE-ConnectionGUID: j4UxDwk2TZGtiVI7M+4p/A==
X-CSE-MsgGUID: nTo45WULRUizIFL4JwGGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="139518676"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 May 2025 01:43:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAPWO-00043x-1W;
	Thu, 01 May 2025 08:43:56 +0000
Date: Thu, 1 May 2025 16:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@500000
 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode',
 'iommus' were unexpected)
Message-ID: <202505011646.uykt4V3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f79eaa2ceac86a0e0f304b0bab556cca5bf4f30
commit: 93868d5f39530a0521e7ee63305b7b856cac2182 dt-bindings: usb: generic-xhci: Allow dma-coherent
date:   8 weeks ago
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250501/202505011646.uykt4V3l-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011646.uykt4V3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011646.uykt4V3l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: lte_reset: $nodename:0: 'lte_reset' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: wlan_disable: $nodename:0: 'wlan_disable' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: lte_disable: $nodename:0: 'lte_disable' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: cp1 (simple-bus): $nodename:0: 'cp1' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-db.dtb: cp0-usb3-0-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/spi@700680/flash@0: failed to match any schema with compatible: ['st,w25q32']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: pca9555@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca953x@21 (nxp,pca9555): 'pinctrl-0' is a dependency of 'pinctrl-names'
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges', 'sim-select-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog', 'pcie0-0-w-disable-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68 (st,m41t83): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges', 'm2-full-card-power-off-hog-0', 'm2-full-card-power-off-hog-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges', 'pwm-tacho-irq-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: cp2 (simple-bus): $nodename:0: 'cp2' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges', 'm2-wwan-reset-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140 (marvell,armada-8k-gpio): Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000 (inside-secure,safexcel-eip197b): 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
