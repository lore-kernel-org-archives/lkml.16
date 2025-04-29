Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622F21CC57
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939354; cv=none; b=j3o8aFexskE3fOoV00HRk5yoYJLVB6WDEJzuwP08BNayLTh4RFOu0RtsTXoFtmjshi3hUpuwua32XswT67SJmqX7zKcO9TJE8oyX1k5AhznYo3XQ23tcujGksS3XbiT6GOmXbpHwx3e5+UYR0didabi9nrk+l+VqaSJ9P/yiMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939354; c=relaxed/simple;
	bh=ojkcmuoTOZc+OvrBxj7j7/ITRR6GPZahdKeeEgC9hTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNXUhH0RQD3JA/+FPub6YjUb+7Rp9+L46Ub8qQsyaBFEQoV95sVomEKgk2JACN2pqusIo4F/snTO1JMobxMHT7F7zn57BU7KyBQbWE4B4Gin+NTvl9iw9yCL1sMYYSX31Kl4AHi28+IAsjFkVl64ZLvzdtbVm+bJQ8BlihpjEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMVzPR55; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMVzPR55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939352; x=1777475352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojkcmuoTOZc+OvrBxj7j7/ITRR6GPZahdKeeEgC9hTI=;
  b=SMVzPR55BCm0bGEDeq3yk1D2m69X1BYH0SUZ1jNZ1jXdsG/ewtCBZFbw
   ZUTObLRg6ajS8oxt74pZWuYZjGhUVIyoqP/+eLDg0KJns96jthAow1YkS
   v+MckjXkZoHC2oRtyN9eWdp80lcL6LCmjDx2OhO3GI2VajAQlECCEQ9Bd
   B2gPvCU3XoqjS9LPqvt8KttQncmPENPB/ct4lU/U2niZrJz1IsCJoCBzc
   2yAW2qIGF1gwsZZdeC7q+L0gpjAxto3V8fWvKpPX6272SGZrBVQgpsBeh
   d3kSaTSKnnnEhsPZ9Qz0QS6hbzJusUtZEHbKA/HtCXSLij8Fg2pRUiKVE
   A==;
X-CSE-ConnectionGUID: HHj+LEckQJaCV73X7PTmpw==
X-CSE-MsgGUID: TiHVHjxYRYuaD1c3yxxnHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50228919"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="50228919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:09:09 -0700
X-CSE-ConnectionGUID: 6woIGgMWT2O+NUM5FQtStA==
X-CSE-MsgGUID: u+4nm9mrRsqJXq6D1Wyidw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138834820"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 08:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ma1-0000oH-1N;
	Tue, 29 Apr 2025 15:09:05 +0000
Date: Tue, 29 Apr 2025 23:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb:
 nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated
 properties are not allowed ('arasan,has-mdma', 'power-domains' were
 unexpected)
Message-ID: <202504292212.luCFluoD-lkp@intel.com>
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
commit: 499a4b16a4869a901a9bc601bc1e0b8f60151e93 dt-bindings: mtd: arasan,nand-controller: Ensure all properties are defined
date:   3 months ago
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504292212.luCFluoD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292212.luCFluoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292212.luCFluoD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: /axi/spi@ff050000/flash@0: failed to match any schema with compatible: ['atmel,at45db041e', 'atmel,at45', 'atmel,dataflash']
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
