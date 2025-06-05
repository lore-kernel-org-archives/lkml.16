Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3778F20
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087874; cv=none; b=qSjvk7TPhaWlrYlYQCav8XbOCiTh9t79yXtxvSv//acwA3f+QUrn3emY10YgIDPobWuijdwi59R82OzEhsI6zFwfFvVPYWkGtsfhpHoVnrgkoaeBePgqDFLSIeP1CDF93HfKWxYMEav3G/C7CCMzqzjilhlHoANjg3g9QK+1ZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087874; c=relaxed/simple;
	bh=98JOeQbdHFLnotA+noW+iaW7ngQU/8uiWvpLuOb+XPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlalbHrNNWcOdPV+C0CHf9cJ2qpN36IjHUh81PPrbI8kMLQO9A7+Eo5LEznC+NqHTe8dnINl/0hJuyQNWMaQic0Dk339RUsPSujJ0Nei1A5a/qcczs9evkCPzC0OYCztWGFxovAFAhUr0/dOv0TLu7NAhwn6tCCFo2bKqtNs0FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOj6AOTL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOj6AOTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749087873; x=1780623873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98JOeQbdHFLnotA+noW+iaW7ngQU/8uiWvpLuOb+XPU=;
  b=MOj6AOTLbEtlzzohiKDYX6HNVyLwUqDNFOmcdhd+CR5Zjb/ghEeQZMg6
   evNxz6rFTs8OjED94OXXKhRyiA6u93hTbVb67w9batZvDSJPfM28rNBVO
   A1PJNSBkefSEaA0/RYI49pIYHLtNGeib9HSzUF3s07AFZp3dOE/Q6tF+I
   D7KbfQ92tot0rbxm4S35u/1/D7F2MtqgO1EcDGP9tYg5WCRpQL747VJdX
   BD/uR72KduNZ/HF+AdF4gOLmtj4aCx/z9FepZrxJBCY4Ts5UJLwU18g4G
   qGt1F6VkzJbx5BnJYYjNs8TZnzMm4UOiyYyiBhn04p6AjfdOEtpDs9EBI
   g==;
X-CSE-ConnectionGUID: /skg3JqsTXqurzqLR3PcYg==
X-CSE-MsgGUID: TEzpWWRUSGa+m6MVOVWbtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50428993"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="50428993"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:44:32 -0700
X-CSE-ConnectionGUID: dEUDQmIrQ66OfnWE4rAZqQ==
X-CSE-MsgGUID: weT2W26dST+ROmHqbZ/jjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145317455"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 18:44:30 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMzee-0001qI-02;
	Thu, 05 Jun 2025 01:44:28 +0000
Date: Thu, 5 Jun 2025 09:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000
 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^port@[1-4]$'
Message-ID: <202506050912.DQmua49D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1af80d00e1e026c317c6ec19b1072f81ba7af64c
commit: 48dbb76cef65fabaa3ac97461eda90495e954ecd dt-bindings: media: convert imx.txt to yaml format
date:   4 weeks ago
config: arm-randconfig-2052-20250514 (https://download.01.org/0day-ci/archive/20250605/202506050912.DQmua49D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050912.DQmua49D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050912.DQmua49D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: pcf8523@68 (nxp,pcf8523): $nodename:0: 'pcf8523@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8523.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/bus@2100000/i2c@21a0000/tc358743@f: failed to match any schema with compatible: ['toshiba,tc358743']
>> arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port@[1-4]$'
   	from schema $id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
