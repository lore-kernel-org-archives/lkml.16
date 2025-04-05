Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB627456
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743879113; cv=none; b=f6PfgtIry4wEqJdBvttyKwKen/PoF6qHZQ9x4qOuXsqF9jxYp0+Ih3jtt97wRHACZ/3RqFZUKzeyw+6BrAKyjc21IoORHghcDvidzaDalTgxtaZpty8zq7HIXw+nR1OM5FEA1ty4GS9IyHwKkVyEHDNy0K/MH4prtW3J4GJ7/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743879113; c=relaxed/simple;
	bh=GzCn/IQxVV1ruVycbFzWoEhtxKL0jbbqdF9jP/zoNOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nnvmB/JhXpbe7UQ4ohmSixOrveIIUXSL/uDikiCSaMvYGnyTsUwPlslpEIXO2FD8PhyYC1KUmf43FweVZ9nlvAgfrZgYq84Dbjpmvm+krtqG8N2iAXkm7RXPGw296zhs1dJF+o0c8x/dxh4mEU2dgcrH+FdLVQYzE4mpsRdki44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hqd6Et59; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hqd6Et59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743879111; x=1775415111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzCn/IQxVV1ruVycbFzWoEhtxKL0jbbqdF9jP/zoNOc=;
  b=Hqd6Et59JYleAbtoeBr3Z+6OkKxEofPXW2Bgj986s6i0bHGdoHCiyY0s
   C94RdCPGHwURP8TyAfiTnNxDkHjqGfGB4qyS2z9K1Fr2wdTigtMQfVB5m
   7A9LwXxNKhHZ3nRFjoVYv/tMZtarUz0BWQB/xz11ChI6im6JnELufgTc1
   ZM1iJ8mIvBG1WRw5VU0/F12KjxW0aoDGaejZx5kdtbNX04Vyd3NUVMdwm
   XyWz4Su69qNlIqAiYwEmlsLHRHU1eD9CtUBN3xmpO9sfwT1bKrC1fuPN0
   qZ2x86Zjit//dZwis1Wrw6vC2nyh7t5Q8gVVMUqgwrLdH6C+4Acwdipa/
   Q==;
X-CSE-ConnectionGUID: 5iHulHCoTXqtSstTxvVLcA==
X-CSE-MsgGUID: 9yNVbglcTGaGmPd6eagaKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45393373"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45393373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 11:51:50 -0700
X-CSE-ConnectionGUID: cqngviomTWWl3c1ect9ykg==
X-CSE-MsgGUID: CGX/e2I4SyOnGN8Ik5U1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="127565734"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2025 11:51:49 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u18cM-0002Df-26;
	Sat, 05 Apr 2025 18:51:46 +0000
Date: Sun, 6 Apr 2025 02:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: arch/mips/boot/dts/ralink/rt2880_eval.dtb: cfi@1f000000: Unevaluated
 properties are not allowed ('partition@0', 'partition@30000',
 'partition@40000', 'partition@50000' were unexpected)
Message-ID: <202504060202.7foGNhmg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56f944529ec2292cbe63377a76df3759d702dd39
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap: Ensure all properties are defined
date:   5 weeks ago
config: mips-randconfig-052-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060202.7foGNhmg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060202.7foGNhmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060202.7foGNhmg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: /palmbus@300000/memc@300: failed to match any schema with compatible: ['ralink,rt2880-memc']
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: uartlite@c00: 'anyOf' conditional failed, one must be fixed:
   	'clock-frequency' is a required property
   	'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/rt2880_eval.dtb: cfi@1f000000: $nodename:0: 'cfi@1f000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/mips/boot/dts/ralink/rt2880_eval.dtb: cfi@1f000000: Unevaluated properties are not allowed ('partition@0', 'partition@30000', 'partition@40000', 'partition@50000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /usb@101c0000: failed to match any schema with compatible: ['ralink,rt3050-usb', 'snps,dwc2']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cfi@1f000000: $nodename:0: 'cfi@1f000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: cfi@1f000000: Unevaluated properties are not allowed ('partition@0', 'partition@30000', 'partition@40000', 'partition@50000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
