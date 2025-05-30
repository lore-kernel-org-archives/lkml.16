Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D4188A0E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641805; cv=none; b=WeCmMqNWpaVbX+JJUW8Gws5/H02pMQhljqLKfqBHugsX3cx0Yu2QjzrAYuBmu1FsYpX+TVHV3gm2burnNiu3Azr1BftEyonT23N9jCYvMlELocj0TvM3Za8QsSCfM1M9dpBwuKjxjh5q5CFY1U2LA2ddWQ6iZgLguhxDiSNi+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641805; c=relaxed/simple;
	bh=1l+wgDXUW4kGSHm7z3JKNHKk9hkUda8SOTcMq8tKruA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jj/vDL7v4BfcrTdhibE/IYHozewitZFOVSk8+qqY/veUk20S635NrdfOlRdCA8Jk00ZVdIuz9m2lvqr+35al4rgYVlmm3zanjRMcxupfmD/Y8RNDz1fz3SuCLxvJAsBYEr4AODJMorzoFyaJTd0vw1TVnqNhDz00tkeWH4bEJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yuuymu7X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yuuymu7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748641804; x=1780177804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1l+wgDXUW4kGSHm7z3JKNHKk9hkUda8SOTcMq8tKruA=;
  b=Yuuymu7XI6or/OqIrhHu+rVmYP7GENBY1ddMUuHhqMFmUf0AnZtfmSlu
   Xz0QlmFteA73cCi78b1o/wFawtgllytYr5G0C3JgD3SSsD/4/12YVO/qJ
   45Jk86yNKrRLlxFFFrkvxVy1ACDVdUyntLsstlgLaL0OGrhlwhzx2L7Ur
   Uw5GdobYTXCMm7iJBuaz2KXQw1enUY8vpqVe+H+8ADsStyIj8L+618G2R
   42ch4Ma+hkCktVXV5dvGI2Xca3gcQM2gFqO1HPCQeJ3eauL7Iwq+EVTsR
   GRI7fIhKpYBpBImyWhX69q8S5XQhZo6helyDoXycNTrvY3CqJB1Lhs3In
   Q==;
X-CSE-ConnectionGUID: mUOuJQ6IRM21DHRSrLYUUQ==
X-CSE-MsgGUID: fOiCKIc7TPSbdhe/NXfgxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68170038"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="68170038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:50:04 -0700
X-CSE-ConnectionGUID: ZywPnT4kR4G8QO2RceCDRw==
X-CSE-MsgGUID: 9ArnnU9HQLmDAt9rGsp2XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="143961267"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2025 14:50:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7bz-000Xzg-0e;
	Fri, 30 May 2025 21:49:59 +0000
Date: Sat, 31 May 2025 05:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: cpu@0
 (loongson,gs264): Unevaluated properties are not allowed ('#clock-cells' was
 unexpected)
Message-ID: <202505310513.e4QHMmOm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: f879ee2ce0d46327e90f61c5dc85fb13a740de10 dt-bindings: Reference opp-v1 schema in CPU schemas
date:   5 weeks ago
config: mips-randconfig-051-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310513.e4QHMmOm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310513.e4QHMmOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310513.e4QHMmOm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: /: failed to match any schema with compatible: ['loongson,loongson64-2core-2k1000']
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: / (loongson,loongson64-2core-2k1000): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: cpu@0 (loongson,gs264): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: pci@1a000000 (loongson,ls2k-pci): gmac@3,1:interrupts:0: [14, 4] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
