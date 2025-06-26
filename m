Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034AA20DD49
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750915224; cv=none; b=Q1RKJbuNYz/98cyBJU6L5tVGsTaK0k9szYMcBLwE5P8XzgwYhSmzYGcHIRH3xzkjYrOFeKi40aiWKCyE3GKfMibUjib8oSUvL6jz0PdGmwDoXeboHIOh1ffncoEAkRirhvgPzUzs0zfVMBLwmwI5DsMaSNj2ico21z2KGMDEtyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750915224; c=relaxed/simple;
	bh=xNUTea3Mht0lRiD8ut2jokocfbZbFj8RuSELVmXk+iw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PIFzpPHYwoIlelf8kAk+P/VB4a/P33WH7xvCh/haaPg2KeNjvg0IlMqoTKzfbo7s7a+iuplvcOewYuVg/acxvaUWrzKA6HHKNTCAHrvtfqLyJUraI/W0cP/7M23tsCYv8Ez70NJkNPn5MlEaoG0MCKNc5fPR8/dx0/66LuDphl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZiNqSuO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZiNqSuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750915223; x=1782451223;
  h=date:from:to:cc:subject:message-id;
  bh=xNUTea3Mht0lRiD8ut2jokocfbZbFj8RuSELVmXk+iw=;
  b=VZiNqSuOZ8JtgDc26WGWN338p6R1/DnJIzv/TylpZX/h0g3Htos4WIOV
   X7TihODluxWOq8jCaDanCPTW5LmcJ1L/5y5YvmsKcoyaujrLcSWDgvX7S
   7JAkuUyiiBEXSCTQWwNTRDwqFborDRorlPQRFGupqtC7rcjGrmg9M7hbh
   IY0qMaHy7WxgBwtX8shLszCa6YMNc0VQG3x63Oiimuehw0k3dFSwhm846
   kak0p6O+zgcumQ6iC4CrkhoTo+QZzhv0fGSiEFrHsuFXYb8RTPWlvUt4i
   qK5MLkAEcoRq/zEC5dp/CW3lsWaKfg9tPUJGUEUutod2Ne5Mllrzq0Km4
   g==;
X-CSE-ConnectionGUID: vrcNya3ERv2d4xNEmK67mw==
X-CSE-MsgGUID: ECvX5DJZScCv51hWQd3R0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56878290"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="56878290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 22:20:23 -0700
X-CSE-ConnectionGUID: TZMb/zHYRf62ro2jZ5xkKA==
X-CSE-MsgGUID: UcVpPmVoQdmM9J+MOSBHJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="189597581"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2025 22:20:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUf23-000Tl7-16;
	Thu, 26 Jun 2025 05:20:19 +0000
Date: Thu, 26 Jun 2025 13:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 2cd8a89048a2d10de4774f65673e5eb948547a7c
Message-ID: <202506261344.0mGLTs5V-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 2cd8a89048a2d10de4774f65673e5eb948547a7c  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1164m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-001-20250626    clang-20
arc                   randconfig-002-20250625    gcc-12.4.0
arc                   randconfig-002-20250626    clang-20
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250625    clang-21
arm                   randconfig-001-20250626    clang-20
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-003-20250625    gcc-13.3.0
arm                   randconfig-003-20250626    clang-20
arm                   randconfig-004-20250625    gcc-15.1.0
arm                   randconfig-004-20250626    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-001-20250626    clang-20
arm64                 randconfig-002-20250625    clang-20
arm64                 randconfig-002-20250626    clang-20
arm64                 randconfig-003-20250625    gcc-12.3.0
arm64                 randconfig-003-20250626    clang-20
arm64                 randconfig-004-20250625    clang-20
arm64                 randconfig-004-20250626    clang-20
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250625    clang-20
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250625    clang-20
i386        buildonly-randconfig-006-20250625    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-002-20250625    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-003-20250625    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-004-20250625    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-005-20250625    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-006-20250625    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
