Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C81DB924
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544768; cv=none; b=aautRGXbjEYm1igkbc1pn3durnJFOlz7nEfxL0bX7qv8mOrfLzjcJeDMzKBOdcmgY6a+3vb36VmR/ZSkCwLduxb/SdZSkKSpxy1svlnblB3+yqYJ7ekyPzVA05kJSyWr8d1f5PUMG6XoGu2H0IBPNa24QqUqLptxygt1WbEpa6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544768; c=relaxed/simple;
	bh=dZYrr0cRyRDrUY6LAeHdvyP20X4fX1IDguP6C90FIRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrdaDAvPanAgw3Oinq6aiGZKL8R1rIXQJ6Pqt9cCvd0dF3t480WxuiO5YFkCKO6rdn1STpOZ9BTgFyabFv6zXBfxA89kawrDltjMdpEZ9VzyYHBxkmbaHueuwLZvnQITVWH/YD/0Lw3Z06Rj7FHUHCqi2W2CzIwcTEP3bKo8Uuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BowaqgYz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BowaqgYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748544766; x=1780080766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZYrr0cRyRDrUY6LAeHdvyP20X4fX1IDguP6C90FIRQ=;
  b=BowaqgYz3IVurW9lfhtF6DO4+COr/9sBJExJUcoTUHjojwxoRNInmf1I
   oTJ+pisIh93Osg5fdIJzx/GlY9pramnbeSg4LkoVl5eBYrsrfhNHrVgV1
   68R+4y1hx87cLX0AtuBBEkb7Fj77rV1pJGNQLKuZA923TiGcqR1ajtj/M
   y7bRdORctJa0H9rTqzd2OqNjgTGSuk/UH1NUnwgfuqTjzVBpdWf/X5S/8
   MqO7idohHEw1+GO0CdOPIBYKBfn8exT1WYVMNdn24KrARekYvzpV0S/o1
   KOx7TSfrBYHqNTIdvtD1LacA7d+ilugz7oVEZiab3u9AT78MURdbqn+sS
   w==;
X-CSE-ConnectionGUID: omQLgghURA6xSD9KIKFZvA==
X-CSE-MsgGUID: b2/h3szkTVqhOC97GfxnLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49741683"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="49741683"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:52:45 -0700
X-CSE-ConnectionGUID: uYDzHYaOTbCpPIDW8YoFuw==
X-CSE-MsgGUID: 2axFMDtEQRG6Z62ckVmwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="147521906"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2025 11:52:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKiMs-000X0P-0c;
	Thu, 29 May 2025 18:52:42 +0000
Date: Fri, 30 May 2025 02:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000
 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^port@[1-4]$'
Message-ID: <202505300244.m0YveXFR-lkp@intel.com>
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
commit: 48dbb76cef65fabaa3ac97461eda90495e954ecd dt-bindings: media: convert imx.txt to yaml format
date:   3 weeks ago
config: arm-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300244.m0YveXFR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300244.m0YveXFR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300244.m0YveXFR-lkp@intel.com/

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
