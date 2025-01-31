Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D7F3C1F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738284406; cv=none; b=fGrb0rnFzBTRhSkG9FNIbfAGx7YIp/ibQMTABtLijGoPJPv6Qm0yUO12P+MD83o2xfxzqGDSLVlY/KpUAGUoL49u+rksWMJUiUBcfmw6zYowDbdAMO28bird1eTZap5miz9tZjc7D++rqv+nIpjn0onBhjd9RTCeguzDWIv+0FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738284406; c=relaxed/simple;
	bh=Htfnpcxu+JcMlheooMOTZwD3RNQGTxz1889+J+XBXPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ueTyBWsG0PNNwhTY2qmeayyJON9Npbrk1Bo4p4Wxy0SnpZTR1IRm2NVU6gY6ffTsUI5AIgDC8YW2FohYIXYsYBNVSaOZ9HwlfTz0ocGYPjqF03z4fBf8epcgGfqTaMIn11hSwCxYYRTMnn2RDwImbiYl0FzCemc/5Mk6n/6VsEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UziIETor; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UziIETor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738284404; x=1769820404;
  h=date:from:to:cc:subject:message-id;
  bh=Htfnpcxu+JcMlheooMOTZwD3RNQGTxz1889+J+XBXPs=;
  b=UziIETorh2SW0V90qvP/RIByZ1X/9wjG0frUWVZ9hxGNx2hSiaypAEEf
   qQgQbdU4Xb5xzRYUQDc7GUQv9lQ3yzRaYz5a/iC49eHRhTgLbW/QL8CQd
   ZC85iRNPDbXz/Qp+GQ8SSyE6QSrxZkNvr3EnyF7P0OlNz+q+WSR/0ExDT
   UYjkr8adw0XdPZC606cvZzavUAZMj8kclg/RNa3ZAZINWqutAyfkYG5AF
   NDsZj8MqNYnIPdZKyuXapqjqmm7T/6C1bRz6YXnCRvl/+jam/RWt8PIW0
   T2yjT+iTM1eM2oUw9iweQL5wVV7zcvLYdNd6Zpc0XiaH98hQNDXsk1Uq1
   w==;
X-CSE-ConnectionGUID: BYAOMdbFS9O417wCDtRsTw==
X-CSE-MsgGUID: IcZe+IMDSkuooO/SYdcXRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49449456"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="49449456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 16:46:43 -0800
X-CSE-ConnectionGUID: ZGCGgLFRTguvf+zZrmY0Kg==
X-CSE-MsgGUID: VK59ZzMxQa2olRy0NPkobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113515306"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2025 16:46:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdfBA-000lbj-0b;
	Fri, 31 Jan 2025 00:46:40 +0000
Date: Fri, 31 Jan 2025 08:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124] BUILD REGRESSION
 63f1602f557a3ea1a3396e876b6648cf6c3635c4
Message-ID: <202501310841.ZJ0Ad1I0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
branch HEAD: 63f1602f557a3ea1a3396e876b6648cf6c3635c4  treewide_some: fix multiple -Wfamnae warnings that must be audited separately

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202501302224.mRgkKFRI-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202501310035.jc65cSS0-lkp@intel.com

    fs/hpfs/anode.c:103:11: error: use of undeclared identifier 'anode_btree'; did you mean 'node_state'?
    fs/hpfs/anode.c:103:25: error: 'anode_btree' undeclared (first use in this function)
    fs/hpfs/anode.c:161:38: warning: unused variable 'ranode_btree' [-Wunused-variable]
    fs/hpfs/anode.c:185:12: error: use of undeclared identifier 'fnode_btree'
    fs/hpfs/anode.c:185:33: error: 'fnode_btree' undeclared (first use in this function); did you mean 'fnode_ea'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- alpha-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-randconfig-001-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-gemini_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-ixp4xx_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-randconfig-001-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-randconfig-003-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-tegra_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm64-allmodconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-001-20250130
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-002-20250130
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   `-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|-- arm64-randconfig-003-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-004-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- csky-randconfig-001-20250130
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- csky-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- hexagon-allmodconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-allyesconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-randconfig-001-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-001-20250130
|   `-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|-- i386-buildonly-randconfig-002-20250130
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-buildonly-randconfig-003-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-006-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-randconfig-141-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- loongarch-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-randconfig-001-20250130
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-amcore_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- microblaze-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- microblaze-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-bigsur_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- nios2-randconfig-001-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- nios2-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- openrisc-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- openrisc-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-randconfig-001-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-randconfig-002-20250130
|   `-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|-- powerpc-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-allyesconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc-mgcoge_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc-randconfig-001-20250130
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc-randconfig-003-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-tqm8555_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-warp_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc64-randconfig-001-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc64-randconfig-003-20250130
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-allmodconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- s390-randconfig-001-20250131
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-randconfig-002-20250131
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-allyesconfig
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-allmodconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-randconfig-002-20250131
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-allmodconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-allyesconfig
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-allmodconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-allyesconfig
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-anode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-fnode_btree
|   |-- fs-hpfs-anode.c:error:use-of-undeclared-identifier-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-002-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-003-20250130
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-004-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-005-20250130
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-randconfig-161-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- xtensa-generic_kc705_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- xtensa-randconfig-001-20250131
|   |-- fs-hpfs-anode.c:error:anode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:fnode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:error:ranode_btree-undeclared-(first-use-in-this-function)
|   |-- fs-hpfs-anode.c:warning:unused-variable-ranode_btree
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
`-- xtensa-virt_defconfig
    `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast

elapsed time: 800m

configs tested: 118
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-21
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-21
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-21
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-21
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-002-20250130    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-21
powerpc64             randconfig-003-20250130    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-002-20250131    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-002-20250131    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
