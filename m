Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E0C1E8329
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666683; cv=none; b=hImw3SkiziYvopGo/aTSYE/CDbNHEJkpUqqriKU+8l5N89QX50XcW/Y4gYF/z95Y2VCLdDdFnH1FSkZF1uxDro2rJva2A/9nRFe93WqSbrBFEiyu+QuGMwgtoQHscSVCO69sQrlc9+/Iy0W9NK8AL8MxSeFn7x36mLNMZ/rpakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666683; c=relaxed/simple;
	bh=S60TJOieNNhcl84vGQWZwP64ryX/9wlMlWcVTejl6SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OeOINVmDyHBhBHTz3N+hhwjQWj4RtqJRnWmaBkNFCFtALifRdqBVan2MIQbd+rXyIe1PviXSaRD9jF+c4Rf5z5Jg0FC8Loo75EqwaSuDvONh5TVSfYrXvVD7ouVkDv5BwEq5vTylSTuJ6+eFKEVM3VyHuzQ9m8MxCLZMFBt21R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8Dt9Rca; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8Dt9Rca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749666682; x=1781202682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S60TJOieNNhcl84vGQWZwP64ryX/9wlMlWcVTejl6SY=;
  b=l8Dt9Rcagam0g7/VPx2b6DumJ8f3IOpjIeFeKko35b9YHxyNEH0yTAWU
   EZofkyr58Lbdy6zvFDeSYviMaqZAPfyLqhlOxZ6pl4jyRh/Qe2tvM65Go
   E9SjuYWuPeuUxX8bufasKTURrGgARf3GNKIxadszGPT6T1SpEY5HhYTYA
   WCFN0JDmIyJfhVlet/IDsnsYTITZkNRxxRnvOC2LLoOZAztzhHNJwKP6o
   m6pf+X2i4N3OPIcSK+6+X25jsoklFPrRshx/fRPD7QSWnN6/A7ch7TePq
   jSg9T+ea1cK5BPL/3eTHxazFio4GlscNgz/1q75j+5u8F4quXN3ZHBVCR
   Q==;
X-CSE-ConnectionGUID: 6X4BraoKS22RKk/J2HMnKg==
X-CSE-MsgGUID: O88sYufVQzedKrN9yBa+mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51921300"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51921300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:31:21 -0700
X-CSE-ConnectionGUID: 5Bao4j3uSeSwB1B56LcTbg==
X-CSE-MsgGUID: tjZJ9gGjR0CsbxoO6fTZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147269192"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 11:31:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPQEG-000AmG-2G;
	Wed, 11 Jun 2025 18:31:16 +0000
Date: Thu, 12 Jun 2025 02:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: arch/mips/boot/dts/mti/sead3.dtb: cpu@0 (mti,mips14KEc): Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202506120218.E9g2Wz7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef17cb3d3c43854002956f24c24ec8e1a0e3546
commit: f879ee2ce0d46327e90f61c5dc85fb13a740de10 dt-bindings: Reference opp-v1 schema in CPU schemas
date:   7 weeks ago
config: mips-randconfig-051-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120218.E9g2Wz7A-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120218.E9g2Wz7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120218.E9g2Wz7A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/mti/sead3.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpu@0 (mti,mips14KEc): compatible: ['mti,mips14KEc', 'mti,mips14Kc'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: cpu@0 (mti,mips14KEc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
>> arch/mips/boot/dts/mti/sead3.dtb: cpu@0 (mti,mips14KEc): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: interrupt-controller (mti,cpu-interrupt-controller): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mti,cpu-interrupt-controller.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: /system-controller@1f000000: failed to match any schema with compatible: ['mti,sead3-fpga', 'syscon', 'simple-mfd']
   arch/mips/boot/dts/mti/sead3.dtb: /system-controller@1f000000/poweroff: failed to match any schema with compatible: ['restart-poweroff']
   arch/mips/boot/dts/mti/sead3.dtb: /system-controller@1f000200: failed to match any schema with compatible: ['mti,sead3-cpld', 'syscon', 'simple-mfd']
   arch/mips/boot/dts/mti/sead3.dtb: system-controller@1f000200 (mti,sead3-cpld): 'led@10.0', 'led@10.1', 'led@10.2', 'led@10.3', 'led@10.4', 'led@10.5', 'led@10.6', 'led@10.7', 'led@18.0', 'led@18.1', 'led@18.2', 'led@18.3', 'led@18.4', 'led@18.5', 'led@18.6', 'led@18.7' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/mips/boot/dts/mti/sead3.dtb: led@10.0 (register-bit-led): $nodename:0: 'led@10.0' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
