Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCE1154420
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738356976; cv=none; b=MVz2GOvsmIw9giGzi0gGmg91Squ/52mdJIWN2S4EqihNJ6DUcnxhEBot9AKqk6MRJqgMx+gLCalLDxfV0we0bwEZZBteoTxqF7C+JIe8MhV8xcoLEzaYa/rwuDXAPbQQ77Z4OtSpKYtHg4EJXdwIeIr+DFJedOslE+tkh30IMk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738356976; c=relaxed/simple;
	bh=VKImqGq0sz/Uh/HG+GHNNiwZw9eVMPrj/qd7U+tm8AY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bTs6dVdBVpZmyskuVlOxPo7P9Do6cgFFp7Vfdhd3BhI3cKGTEs22Aef9gqaqcUb6zCR94lhSK+orT6texPxWOPdq0M2Hx6CoNn44nbEpjIFXYUwmqTQS22PDvldCY5YEaNGX8iTFywgXv8S8RG+KBLV3ddfd8xu3F1XWM40MMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+k4uSgg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+k4uSgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738356974; x=1769892974;
  h=date:from:to:cc:subject:message-id;
  bh=VKImqGq0sz/Uh/HG+GHNNiwZw9eVMPrj/qd7U+tm8AY=;
  b=f+k4uSggzS0KXuTyqZ2Fci3ikuaD8/PTfIG61CVp2kBlh7ifLmOHOXqN
   aZrqOQ8SaivazcYJM+01U2qM2ZCLhiHf4LowR3BrKzRx566AVl6DeWyLR
   Feu1nazjepjKQj6f4cLkriQO0EDXmV6bq5eisOHNfupwzxxXtf9dsqgZP
   hzBX2e0YYTdtL0N0KmhL7/uy0aW7RJs6H1vCpjiqCcRlWaKpDjhrM+O0Q
   RbL2vOx8Vkygy3NLnCKOXfzd9U40w9ud+vyZoNRMxBmsfPsxPX26yiVS3
   TUJpRlmPrOaY3/nhBZzL9h69Xcve7MM/h1UK9X5WmuKs/JxJlq6u4FAad
   A==;
X-CSE-ConnectionGUID: pdeFel9PRyePYkUORZJNyQ==
X-CSE-MsgGUID: 1+TAhmpjS/GcYDoRrARl4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49925813"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49925813"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 12:56:13 -0800
X-CSE-ConnectionGUID: Gz8MpqWPTAGIqIpdNhYeMw==
X-CSE-MsgGUID: BmS66tu4THO4/94yLUKQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109569893"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jan 2025 12:56:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdy3e-000n9l-0c;
	Fri, 31 Jan 2025 20:56:10 +0000
Date: Sat, 01 Feb 2025 04:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124] BUILD REGRESSION
 fda28acb03f8c116dd8d8805f6d410688752fac5
Message-ID: <202502010448.kq3geTor-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
branch HEAD: fda28acb03f8c116dd8d8805f6d410688752fac5  treewide_some: fix multiple -Wfamnae warnings that must be audited separately

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- alpha-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-randconfig-003-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-randconfig-004-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-realview_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-shmobile_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-vexpress_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm64-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm64-randconfig-003-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-004-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- csky-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- hexagon-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-buildonly-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-buildonly-randconfig-003-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-005-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-buildonly-randconfig-006-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-randconfig-141-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- loongarch-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- microblaze-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-ip22_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-jazz_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- nios2-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- nios2-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- openrisc-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- openrisc-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- parisc-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc-fsp2_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc64-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc64-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc64-randconfig-003-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- s390-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-rts7751r2d1_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-sh03_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-sh7785lcr_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-allmodconfig
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-allyesconfig
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-i386_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-x86_64_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-002-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-003-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-005-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-006-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-randconfig-161-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- xtensa-generic_kc705_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- xtensa-nommu_kc705_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- xtensa-randconfig-001-20250131
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- xtensa-smp_lx200_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
`-- xtensa-virt_defconfig
    `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast

elapsed time: 897m

configs tested: 127
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm                        shmobile_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-002-20250131    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-003-20250131    clang-21
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-003-20250131    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-002-20250131    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
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
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
