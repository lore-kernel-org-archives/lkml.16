Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F4E86334
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743875987; cv=none; b=aktYM1rTPAly8JFXeXkrgv8rOTiJAekzKOiAdvsv9sSZtq3YDQpdQCQbtB/OhgqzR3ZNa77ZiFxh59iVmVpOu84B/XMVhlHNA36oI5BHPiN7x7r0YST2viCp4JEtYq6zNsFxMEfkm6FbgxHs480BxDw6FWTRfAIBkov4pA1FHls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743875987; c=relaxed/simple;
	bh=zmvVcAuSbuQCHw96+qt4qS/h4Ndmd/8gyO0QmULsxOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F0fs5BXxlP872lJEdMPBxtmH4z2CkMnU8GGtYR9tRkNAY7JE+YM+eRloW//qr0Jv6NkIDx+LIx0iTp7EFi1BrNdt0L5rTykUDfFiCV5jx2dq9yUKjOghaL1xMtu+CvoLNgLrqscugPrAXQ1F+TVfBIri66IjlcuKugobqsTsQNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a07ZUA1i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a07ZUA1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743875986; x=1775411986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmvVcAuSbuQCHw96+qt4qS/h4Ndmd/8gyO0QmULsxOw=;
  b=a07ZUA1iDaqZigNHSazhxEmPTwmmJyz7ST0UIwMyzq84XwqJaAqPTA40
   lA7iii2gLAsg/Lds1qtDESQAQLmVuPZujk/FA77Rljhvj6Jp0a4xGInl/
   JgiQ/y4PtT+CUmDVAnTW7r7eKYc6vvG1bk6piGpSsnBDtGl7GqjVAVBXV
   64ySVu8M7uExAlNldMe++vA2eJ/roOCmn3PHhnlY/5VhKiLDadG5bnJRR
   wZKt7zUObn8nPitHUg9A5LgZSjVuvhjmtFZySXnFSEDsBpTGFZto4hNts
   f8+v0F8d3vOhGnLnhm5RqV0yg5QzZtIBInJOF4MKcQOkHODVgF3vu6vyJ
   Q==;
X-CSE-ConnectionGUID: KAUOqXPuRzGuQZpGjBXu1g==
X-CSE-MsgGUID: OuNgqDMUSHCZlxBDHXsU0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="55963160"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="55963160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 10:59:45 -0700
X-CSE-ConnectionGUID: Z+zFsV/lS8aBNRzW29wHVA==
X-CSE-MsgGUID: FKKeJmiwT+eCq3z/h+O2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132706898"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2025 10:59:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u17ny-0002CJ-0M;
	Sat, 05 Apr 2025 17:59:42 +0000
Date: Sun, 6 Apr 2025 01:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/dts/ralink/omega2p.dtb: wmac@10300000: clocks: [[1,
 17]] is too short
Message-ID: <202504060145.tqwYfaIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: 232085d118ff4695c0e9992ebc7ba4da7a24875e mips: dts: ralink: mt7628a: update system controller node and its consumers
date:   5 weeks ago
config: mips-randconfig-052-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060145.tqwYfaIP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060145.tqwYfaIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060145.tqwYfaIP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00: $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart2@e00: $nodename:0: 'uart2@e00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uart2@e00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/omega2p.dtb: wmac@10300000: clocks: [[1, 17]] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
--
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00: $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart2@e00: $nodename:0: 'uart2@e00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uart2@e00: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/mips/boot/dts/ralink/vocore2.dtb: wmac@10300000: clocks: [[1, 17]] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
