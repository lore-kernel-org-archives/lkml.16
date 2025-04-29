Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB50275871
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914669; cv=none; b=QdAcgtWjty60ZeVGeLgTpQ0Fdtm8txaMhSXbflGPY8jOLGjcZUlwCv9YtRx/AVAWRpbnC+DMAOg5q4zvlIO5WWVs+7M/01tyrcO8LVRpA6yZilH3J3l8qJB3vt17kT3texuTVr4PsSSfJqCzjoyPwVyV4mHLupm+Dx6S0uM3/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914669; c=relaxed/simple;
	bh=sZspc5FQQmYb2sZpOabYKWUEl3TA76hpUJdKneEDdJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cy6rqZd1/G6u8RenwZCyWZ+7ELsdo0dnAPtVAcKdX/YuR7g2jCRUVTK5bs3O1d3B+vjVxImzLa9SOogZHYRj2UIFOCXivDqEgsrb72Iyn+vScQ2mnMajsFyT9IS1zBtHe/9oymoH8pRFoebeYKbEoEFxvqpZOOkX7Sg+EuCahVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7Nid3XX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7Nid3XX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745914668; x=1777450668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZspc5FQQmYb2sZpOabYKWUEl3TA76hpUJdKneEDdJc=;
  b=W7Nid3XXgQtE56TbYoHg3C4vdu+VOwGymSe4x35uWnA08vVTLCTgEcj/
   8M1XnbYE4AYqvh+nnHABGy9oIZ6jzz4hi+JBADLsPZUPZd2c1wx5wc7kC
   7QwJNUXwrXZm0rUWbD7Jh5XjAguGnLghVebmXITQJPog0Lt2Ku3EkhMmZ
   kAyk2gvnYoXfjUyaYXDORkcY2TKY9amF7ewZ/vGOuOpNz/62TYeQXUT1p
   /JjTA6qjPt/WAhVnOC4elTuuaskrb4xiKFQKTVBcRHbyHaNKkICqtO+2N
   XfB49/Y++XXm7eFoZpXnS/wpkQjagms1s5qJfW8uJ3kmJHsKN1b7Nntiu
   w==;
X-CSE-ConnectionGUID: ghAdc8hqSE+jgv13W6z+uw==
X-CSE-MsgGUID: uE8J/LdJQ3uX3vpW+pA81Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47235226"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47235226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:17:47 -0700
X-CSE-ConnectionGUID: /CyE9P+jRTCarhCZXAwEDA==
X-CSE-MsgGUID: 8pMVU0WZQWSYyGnlj2/RGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="137802848"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 01:17:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9g9v-0000Zr-2F;
	Tue, 29 Apr 2025 08:17:43 +0000
Date: Tue, 29 Apr 2025 16:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: nor-flash@0
 (numonyx,js28f00a): Unevaluated properties are not allowed ('partition@0',
 'partition@1000000', 'partition@300000' were unexpected)
Message-ID: <202504291623.PZOUCu32-lkp@intel.com>
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
commit: 9ea13d9e40cfb6675a299147bb89d6ca9e7aad9a dt-bindings: mtd: physmap: Ensure all properties are defined
date:   8 weeks ago
config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504291623.PZOUCu32-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291623.PZOUCu32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291623.PZOUCu32-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: /soc/local-bus@80380000: failed to match any schema with compatible: ['hisilicon,hisi-localbus', 'simple-bus']
   arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: nor-flash@0 (numonyx,js28f00a): $nodename:0: 'nor-flash@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: nor-flash@0 (numonyx,js28f00a): Unevaluated properties are not allowed ('partition@0', 'partition@1000000', 'partition@300000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm64/boot/dts/hisilicon/hip05-d02.dtb: /soc/local-bus@80380000/cpld@100000000: failed to match any schema with compatible: ['hisilicon,hip05-cpld']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
