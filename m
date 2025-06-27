Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E28249F9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985361; cv=none; b=soHsFKILhYk1YYv7shnchyfaiD84g4s4jdlUaMj0lr6+l9mV5cdYjkevTz5u3o2jUKWKTP2zaBRBhZnSW+r7Qs1E9izexzuHjgrBxerWmajpycLiS/sUYhUYDwgc5SPPOsL6CQSlRp9l1Ku/fNWKeBSA+xgKEbidGUJH/GAaoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985361; c=relaxed/simple;
	bh=eCvG7N4AfIMP+LMuCsnD+64bFMR1Ry04H0AUxmoGFuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G57N0Y2HMDqXHUbPpN81mnzpsAipJtc5Vx+yHoby1lvXPuKheuqihJXDd9P6yexZFYHP93hUg+Sbb+HMlYT1TS1wgvoW3swHE9YaaK80VorBdPj86x2Gc8fAz3/4ZhEOCNcKFOn1PIA1hLxjYYYY4LpPMLMJPJPgWTZomUQZJd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkxyVlF0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkxyVlF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750985360; x=1782521360;
  h=date:from:to:cc:subject:message-id;
  bh=eCvG7N4AfIMP+LMuCsnD+64bFMR1Ry04H0AUxmoGFuY=;
  b=JkxyVlF0GnaVWb/1ibkrOAUY0uk8cpdwJYBmFCcVJR7FNPdiRfxQMyYw
   7yfF3F90kaacciMKyJSBZSmPpBr9JaRUdbnFn+sG/gK16CEXAWN7xdyNH
   Z/VjQLnG9aBt+5hP6wBizyZv0+J4+CTMoJsH37vtjmZLFxEzUZcqk67kO
   JeCK9+VURIRPFmFtfXTNge9BHvssC6qA82Iw+2uSOqSSoyHGCZgh4JVhA
   uwDfjh8dr7myIwatZtcRg9WyQ1is+GMbe9vNItluToyDjZy6ugRr+EdKE
   ydsNRfngWaKRdfR0KwHUhh2AtLh+bt5N8HafP5l74ID7ncfdqAlpzUg9m
   A==;
X-CSE-ConnectionGUID: a12bFxciQQy0q7evLDc++A==
X-CSE-MsgGUID: d3CKobOcRV26K7l2gUs1Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70726914"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="70726914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 17:49:17 -0700
X-CSE-ConnectionGUID: /eY8pHPKTimJMaSG/b6HBQ==
X-CSE-MsgGUID: aPQHZAeLQw2CZk6ZuApr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="152761758"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 17:49:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUxHF-000Vfd-2h;
	Fri, 27 Jun 2025 00:49:13 +0000
Date: Fri, 27 Jun 2025 08:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/bugs] BUILD SUCCESS
 98b5dab4d22181c931f2bf63c060416badbb49ab
Message-ID: <202506270833.TGEGEOaq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: 98b5dab4d22181c931f2bf63c060416badbb49ab  x86/bugs: Clean up SRSO microcode handling

elapsed time: 729m

configs tested: 74
configs skipped: 58

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250627    gcc-10.5.0
arc                   randconfig-002-20250627    gcc-10.5.0
arm                               allnoconfig    gcc-15.1.0
arm                   randconfig-001-20250627    gcc-10.5.0
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250627    gcc-10.5.0
arm                   randconfig-004-20250627    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250627    gcc-10.5.0
arm64                 randconfig-002-20250627    gcc-10.5.0
arm64                 randconfig-003-20250627    gcc-10.5.0
arm64                 randconfig-004-20250627    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-001-20250627    gcc-12
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-002-20250627    gcc-12
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-003-20250627    gcc-12
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-004-20250627    gcc-12
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-005-20250627    gcc-12
i386        buildonly-randconfig-006-20250626    clang-20
i386        buildonly-randconfig-006-20250627    gcc-12
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
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
parisc                            allnoconfig    clang-21
powerpc                           allnoconfig    clang-21
riscv                             allnoconfig    clang-21
s390                              allnoconfig    clang-21
sh                                allnoconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                                allnoconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-005-20250627    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64      buildonly-randconfig-006-20250627    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
