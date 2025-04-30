Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555522E40E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012640; cv=none; b=QShxLfuPSdvYG0RPnBGMlddwQgOLi1EYk89y9LiBtLsiwl+3bg8IQZ1n4RAqylW9zD7yMtPPwrm5gFWkdRzKA90MiDW0S0DK+3Hj4RqVa8GqM65eld6cyIeR6c7OJiLi96WchsTZH0AAxxmEJ/rxUNvV+0xbUv1LplvU4Jkcwqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012640; c=relaxed/simple;
	bh=etVMEYjRUeoslaeqvIXFOZ47xDCRXCVHMfMSuv87Oqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHLEq5Okd6kw1J+Nwg3d+ftn4MjJpsPeoTeDNOR7cuVasArGk/SIgj/7NGakxMmJZbcQsSqHjvzf+BQNPFgFbfZZi6veJUDrDIgobEE8sytPS/a24nJgquJ2JvLoVNIF//6T6Mg6XM/uOj5IM9h+Vv7ADreuhkhpoq8iesgreqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJiPlhBV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJiPlhBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746012638; x=1777548638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etVMEYjRUeoslaeqvIXFOZ47xDCRXCVHMfMSuv87Oqo=;
  b=FJiPlhBVqyP51jQzZl9rJNousBaPU2X6qxNVub6xFSxUNVQTZ1BEQnd4
   2k0WrfUDu3MZizPdyslSt4BmNFkOnJ2Cg/cbGvfynUeH/6t0KUhr/xRL0
   IyXDy6919+rGo+FbKlcsCzJHpvpA0b5qNY+JsgvHs/4d3BySrDOIj7EvU
   kVK9ovw2L2AkFra+amiMfBrM3krQopEKrBliCFNrybRB9NL5wPd+rtByd
   TjQRxenaE5XSNiTrWQz1CZ7wVxJcQBq7VZeTBOBHcSUSof2q/03gDhgY3
   nTiHikbVqJsrzdAtAknHg9/29exgKw16ZqzNmLGWaKLFECa0nOCcoojQy
   g==;
X-CSE-ConnectionGUID: xNl87Ds/So66WQYqUaLQ1w==
X-CSE-MsgGUID: ja8Gtkv/RWKI75kio6hhCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47386063"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47386063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:30:36 -0700
X-CSE-ConnectionGUID: 6brIhxDCQqi05vjvhn5iOw==
X-CSE-MsgGUID: ydE0aDhySim9oiKjyEBvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134609066"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2025 04:30:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA5e2-0003Pj-2m;
	Wed, 30 Apr 2025 11:30:30 +0000
Date: Wed, 30 Apr 2025 19:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Friday Yang <friday.yang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb:
 clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells'
 is a required property
Message-ID: <202504301933.6REBjomp-lkp@intel.com>
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
commit: 9a5cd59640ac6231ac32f560818eb8eb7ff4438f dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
date:   9 weeks ago
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250430/202504301933.6REBjomp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301933.6REBjomp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301933.6REBjomp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[102, 685], [102, 686], [102, 690], [102, 691], [102, 692], [102, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[130, 685], [130, 686], [130, 690], [130, 691], [130, 692], [130, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[131, 685], [131, 686], [131, 690], [131, 691], [131, 692], [131, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[128, 685], [128, 686], [128, 690], [128, 691], [128, 692], [128, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[129, 685], [129, 686], [129, 690], [129, 691], [129, 692], [129, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8188-jpgdec): iommus: [[125, 685], [125, 686], [125, 690], [125, 691], [125, 692], [125, 693]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
