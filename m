Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209E20D4FD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745894097; cv=none; b=gmJ85scps0/dFsBRTVZ/6IA7QVdCeQPiHZI15Y9HfxsA19ka5qrrdnVSN4JYIgUVBL+VmDDskseRM1WXAa6UefvEYxgoyx+zpUuAqVIiVkD7YX92AB3UtxMYchIApAcKa9gKHS5H234kFI4do2ieDXcTFUTAnp8m5o8UZGLTnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745894097; c=relaxed/simple;
	bh=5zoTRy+ZA3TI0f2K0ExTkspVgIg/yCiljsH4BZDfUEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhm6sN0+Rlcw3QUStSeZwpbWu99KwpmBlcew2UYoHAasGdXsotmu3EwMDY9sk/ADEZrdfFSaG29+5owajI7k7TzmO9ew1FTndjZmc8+kqA9ReLxQs3Vy/MmmsPAcO13eTsRFAaNbEgAnnmB4YWFQpP/cm0UoMYJYBdjFzfIuDfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9pFI0td; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9pFI0td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745894095; x=1777430095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zoTRy+ZA3TI0f2K0ExTkspVgIg/yCiljsH4BZDfUEA=;
  b=M9pFI0tddcfVR9yedCBzVdckrAMXcm6MoXVO8wUE2kGpz5N1S3KvsIFp
   tGXMJ6tqluoyoRnr5SobNUvro94IwDXlZvfqV4K4Amh+hyGGYSM0ua0HZ
   aoGUmxuFwWxJBvozwQavGBp98QluVTG/Uvadar6eo9nY77OV/upI2uL+m
   d/sE5TlIhAggrCM6ta8lO8p11X2Ws8VGsjqfyQU1qGSwD6wqCfygsl9zj
   C7oRbm3sJjXUUd6AVHuhQI7Qe7SaWJ2wO+hnnJrTdeu1RApEyt/uwczxU
   b1wNivJoVplNtAQtg0S6fMQ95PfQSERj3g0dtzKm8MEKZmyk2uu0qqQYO
   A==;
X-CSE-ConnectionGUID: AxNYF7hTRRmlo/t4Xr9Hlg==
X-CSE-MsgGUID: 7/NrgTRrTS+WB5ujPNgOhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50160491"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50160491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 19:34:54 -0700
X-CSE-ConnectionGUID: HBh1Tn3VQMuNR7oGOTmfag==
X-CSE-MsgGUID: mNXGw7cDSrOnDUUcmbWpnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133593452"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Apr 2025 19:34:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ao5-0000QJ-1b;
	Tue, 29 Apr 2025 02:34:49 +0000
Date: Tue, 29 Apr 2025 10:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000
 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent'
 was unexpected)
Message-ID: <202504291052.7vw8beT7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
commit: 7597794706952db4adada29b2a6593251cddcd85 dt-bindings: mmc: Change to additionalProperties to fix fail detect Unevaluated property
date:   7 weeks ago
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504291052.7vw8beT7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291052.7vw8beT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291052.7vw8beT7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f2d0000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f2d0000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f500000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f500000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f510000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pcie@1f510000: failed to match any schema with compatible: ['apm,xgene-storm-pcie', 'apm,xgene-pcie']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/gpio0@1701c000: failed to match any schema with compatible: ['apm,xgene-gpio']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/phy@1f21a000: failed to match any schema with compatible: ['apm,xgene-phy']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/phy@1f22a000: failed to match any schema with compatible: ['apm,xgene-phy']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/phy@1f23a000: failed to match any schema with compatible: ['apm,xgene-phy']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/sata@1a000000: failed to match any schema with compatible: ['apm,xgene-ahci']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/sata@1a400000: failed to match any schema with compatible: ['apm,xgene-ahci']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/sata@1a800000: failed to match any schema with compatible: ['apm,xgene-ahci']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/gpio@17001000: failed to match any schema with compatible: ['apm,xgene-gpio-sb']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/rtc@10510000: failed to match any schema with compatible: ['apm,xgene-rtc']
--
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2b0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2b0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a000000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a200000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a400000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@1f63c000: failed to match any schema with compatible: ['apm,xgene-gpio']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@17001000: failed to match any schema with compatible: ['apm,xgene-gpio-sb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mdio@1f610000: failed to match any schema with compatible: ['apm,xgene-mdio-xfi']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f610000: failed to match any schema with compatible: ['apm,xgene2-sgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f620000: failed to match any schema with compatible: ['apm,xgene2-xgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: i2c@10511000 (snps,designware-i2c): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/internal-regs@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/internal-regs@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/internal-regs@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/internal-regs@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/internal-regs@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/internal-regs@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/internal-regs@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/internal-regs@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb3-phy (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: gpio-leds (gpio-leds): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/internal-regs@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/internal-regs@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/internal-regs@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/internal-regs@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
--
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331 (mediatek,mt6331): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/pwrap@1000d000/mt6331/mt6331regulator: failed to match any schema with compatible: ['mediatek,mt6331-regulator']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: iommu@10205000 (mediatek,mt6795-m4u): 'mediatek,infracfg' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): mediatek,latch-ck: 20 is greater than the maximum of 7
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('mediatek,latch-ck' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-0' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-1' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): 'pinctrl-0' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
