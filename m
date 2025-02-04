Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8F20550A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663367; cv=none; b=CnQqBKoqqlXB4wTbEbcBnSAvQiQRMm0wNOMfQbLLup0Jf9fRwgE/OLkdMcNNCQb7dEf8DTd++2pCWMWFJ2Ki6ld69uadDhkGC0IoO5UDQGwnfTaUKp2uVcCkl+vjbz5jyQxT4vPcxSoP9z7w7g6MQ9USx0s5sLvItJyXKE80S9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663367; c=relaxed/simple;
	bh=ORcA/dZLw7DnBKXeGx1hmd27oaC6P86TDQuDRqbpLhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RCi804CzcDjU9u1gBGBixcZh/pLioUHBq3G/zRtHdq5doujuPgNLfPOZC9/iEqesT+THr5qxAawQpP2KpofRdfokG7+c4oIQhRx0d2IC55UUne9bHPKod/rWJ8YxfGHy9Yp+60VgKHfdzw5npazcn9yMS+umTF+6JAOAeYG3s5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnrpCVjL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnrpCVjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738663366; x=1770199366;
  h=date:from:to:cc:subject:message-id;
  bh=ORcA/dZLw7DnBKXeGx1hmd27oaC6P86TDQuDRqbpLhs=;
  b=DnrpCVjLElh+OEmWlAucR47c/IM9odx0s52QNz2ivarutOaftTFXbLlE
   jpVuflr1x04fLaPaWE/o7YhanxtBbMpQAD5RaMaYoX2c0saOY/iGyBnM7
   QpwVkf+pCCmXJVrAZyW6gKNvUAHJxz+fvdsjsvY6WkrSL5FIROIgr/fSm
   SVdxP29e/TnBnOUusFYW72lQ9pWi00TskEHuw1LzGTugod4hO82BNHuMK
   +ZSL5d/gpf0f6NlJZiuNdEmVBm30TXJBlWvQ7Ec9qpcKcrSUh+tq3JHhQ
   YmlJBrO4j9dDA2gZMB33AC02Qxc/fb272tGVGfRZw2SpLFqDEYNocu/wD
   A==;
X-CSE-ConnectionGUID: zaNCQiQsRe2BSK+FIMS0Jg==
X-CSE-MsgGUID: hpJ7tNe4RfGzXeDvoBY0Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39213923"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39213923"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:02:46 -0800
X-CSE-ConnectionGUID: IKx8QWvtTNm9Ez/ok9kZUw==
X-CSE-MsgGUID: LbibERreRhWWAbTsPEopcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="115549356"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2025 02:02:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfFlR-000sJL-2I;
	Tue, 04 Feb 2025 10:02:41 +0000
Date: Tue, 04 Feb 2025 18:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124] BUILD REGRESSION
 a9dd733f3e47c0bfd2b723af4432146a30168a0c
Message-ID: <202502041856.BEATIQCK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
branch HEAD: a9dd733f3e47c0bfd2b723af4432146a30168a0c  net: atlantic: Avoid -Wflex-array-member-not-at-end warnings

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- alpha-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- alpha-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arc-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-nhk8815_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm-randconfig-003-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm-randconfig-004-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm64-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- arm64-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm64-randconfig-003-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- arm64-randconfig-004-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- csky-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- csky-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- hexagon-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- hexagon-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-003-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-buildonly-randconfig-004-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-buildonly-randconfig-005-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-buildonly-randconfig-006-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- i386-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- i386-randconfig-141-20250204
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- loongarch-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- loongarch-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-hp300_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- m68k-multi_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- microblaze-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- mips-omega2p_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- nios2-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- nios2-randconfig-002-20250203
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
|-- parisc-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-adder875_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc-randconfig-003-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc-sequoia_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc64-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- powerpc64-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- powerpc64-randconfig-003-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
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
|-- riscv-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- riscv-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- s390-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- s390-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- s390-zfcpdump_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- sh-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-r7785rp_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sh-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-allmodconfig
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc-allyesconfig
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- sparc64-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- um-i386_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- um-x86_64_defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-allmodconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-allyesconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-001-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-002-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-003-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-004-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-(-struct-bpf_prog_array-and-struct-bpf_prog_array_hdr-)
|-- x86_64-buildonly-randconfig-005-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-buildonly-randconfig-006-20250203
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|-- x86_64-defconfig
|   `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast
`-- xtensa-randconfig-001-20250203
    `-- kernel-bpf-core.c:warning:comparison-of-distinct-pointer-types-lacks-a-cast

elapsed time: 1405m

configs tested: 125
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-004-20250203    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-002-20250203    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-006-20250203    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-16
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
powerpc64             randconfig-003-20250203    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-002-20250203    clang-21
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-002-20250203    clang-18
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
