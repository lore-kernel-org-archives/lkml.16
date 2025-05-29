Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB9021C9EB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748532331; cv=none; b=Gt8cEaWADudINXaPXTKbCzMCV1Ctbw4amSdgZhki9WtBsBvpN5wZdVtyzdRTZGMdhbKS2eD4iMrcBfG+plmTEfnXuBAPPnH8PwW2u1X8fvO9IbRPsUt/OenFAARzAanLhDMWLLeRTT40DjWLLM4XJ2OgjnjkaymxiLQO3vnbrvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748532331; c=relaxed/simple;
	bh=KULnnT/1YtzcS4WLIrpP3uW67wwC/8kBMou2p8sPrRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j0UWh+A02Bk1qpmIwR+AVNP5xNYT4I3n5o5/EAr/XZe/hrDpM+4xPqU8keFIwxOPix9KwWewf7tQMGvcUYwYfmJ7HAHtc+CAhEVrFWXUEAG/n5KB8aI66w4A+Wg4oYaPbHgDHxyogdgdoLg32Q3dImPHBHFX+98Yu6zV/6j30yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYC+Q/sb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYC+Q/sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748532330; x=1780068330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KULnnT/1YtzcS4WLIrpP3uW67wwC/8kBMou2p8sPrRw=;
  b=JYC+Q/sboEVGpoCZ55cc3dS1tSh8X81I7+XWhqxtGrX9fqqKjWK8OjNH
   dbnFhHsb0zDf0Ivz+WKrtkB1ZKSd5LZ+vvPnbyiYpDdl7+ypMdT9U/fXg
   nwNKPykd1cL5thvkRQR/L2VzCvGsE9INNBR/u8+A+CBroL6kuwJLiLHAI
   vYWVkfwt/rYK49A2/3MWfHvE0E0hGdiyZ0B58FTU2bp8S8E+WlOBmQrpe
   1fuWgyXzXjX346wTEEPS/4/j7RmM1u+IjVjcPbiR12PXQVTqYB0SwI+tH
   iXWHq/TzvpDiGlBv5xfHqPiHApP3VhzILW0jSieYWls+TNmAYhRdQRzB1
   w==;
X-CSE-ConnectionGUID: q5tS1fX3TQKLlbWamNf24g==
X-CSE-MsgGUID: bwm3eitzRiKGutv7DuKejw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54264013"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="54264013"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 08:25:27 -0700
X-CSE-ConnectionGUID: H6MvIOMsRWGX85alUtRX1w==
X-CSE-MsgGUID: SYQMI00jQMWmHrVodl3elA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="166768281"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 May 2025 08:25:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKf8F-000Wou-06;
	Thu, 29 May 2025 15:25:23 +0000
Date: Thu, 29 May 2025 23:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: ccp@e0100000
 (amd,ccp-seattle-v1a): 'iommus' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202505292349.2V7lrii5-lkp@intel.com>
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
commit: aa238d34d3a98253f019e8c2e1cef0309b487fef dt-bindings: crypto: Convert amd,ccp-seattle-v1a to DT schema
date:   10 days ago
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250529/202505292349.2V7lrii5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505292349.2V7lrii5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505292349.2V7lrii5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: sata@e0300000 (snps,dwc-ahci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: ccp@e0100000 (amd,ccp-seattle-v1a): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/amd,ccp-seattle-v1a.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ethernet@e0700000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ethernet@e0900000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
--
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /: failed to match any schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: sata@e0300000 (snps,dwc-ahci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: sata@e0d00000 (snps,dwc-ahci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: ccp@e0100000 (amd,ccp-seattle-v1a): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/amd,ccp-seattle-v1a.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ethernet@e0700000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ethernet@e0900000: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
