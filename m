Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B82A1D8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682025; cv=none; b=u/XHsiBVrtIzIgRAcjJvkISYsgSuQpqqm9l0RvG1rMFWoIvfuShFGELrBnnHnNHeh3QmEqYTnum6r/Q/H8Tzh0fUt4fdN2lmXZy4xmyqzpqqEb81pYY5Njg/KwosFDHuURTlrhrbYEhTsMMkHBJmqDhNLwAEXKEdERAPKhqaqew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682025; c=relaxed/simple;
	bh=Rt+vBAydXJytQRfiURj6pDPLkWKAeuRl7hUE6fryLfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PviOq8QGGMbKoZBC2AdrF/5edkfXng6rTHjbLKTUGUdk6MMFBn0HYr/INDDRb4vQoQl9lQN2wfzNN/VODQlrrzl/ILzGAIdG8yVhwMyC8mcJYtmqw8axstKGyStEjKGsxBByBi6ObLaaWgn3GfHki1E9df8vG5IStLottDkcyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+ae7hZ8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+ae7hZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746682024; x=1778218024;
  h=date:from:to:cc:subject:message-id;
  bh=Rt+vBAydXJytQRfiURj6pDPLkWKAeuRl7hUE6fryLfg=;
  b=f+ae7hZ8eiJ3FH2G69IGnf40ojGbhy1NR6NCV/I3pCWsw+5ykkOZGcpX
   FeEUmFXYAvzCFgv74RHUAbplOGfXiK4zMlOS6ihdzSU2JRWAXJaG2DHTo
   kjs5JDspsw6d2hACTEdQ+TXe8d74kvZ2Eo/jSuBG08TnhNqfFR+QLhl+3
   wCQZOTJTHiX00PxFaW3I6NDYm2XPXQRv3LEnyUppshLbbyvxfycJmNk/J
   YezoaSV+y1VfLP15CT7DLV5diruhsDSDOb6wQmfJkeCVS1L7Q18PUEsLE
   rC4uaiVCqM3jHlXHSE8wHLdYs3fYn3TOp7HRc2m8z5nvYzEQnerxiWtLt
   A==;
X-CSE-ConnectionGUID: OiWPE296TxyjHrRjldcbFQ==
X-CSE-MsgGUID: 7MXCYL15SEe5cICorkI1Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48554065"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48554065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:27:03 -0700
X-CSE-ConnectionGUID: pvY6Qox5S1C3pfABI8KeJg==
X-CSE-MsgGUID: iTlWd+kdQLKJYKaV12foiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137104995"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 22:27:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtme-000AMO-0w;
	Thu, 08 May 2025 05:27:00 +0000
Date: Thu, 08 May 2025 13:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/fpu] BUILD SUCCESS
 32d5fa804dc9bd7cf6651a1378ba616d332e7444
Message-ID: <202505081312.N4XOlOYs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
branch HEAD: 32d5fa804dc9bd7cf6651a1378ba616d332e7444  x86/fpu: Drop @perm from guest pseudo FPU container

elapsed time: 2532m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    clang-19
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    clang-19
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    clang-19
arc         randconfig-001-20250506    gcc-8.5.0
arc         randconfig-002-20250506    gcc-12.4.0
arm                    allmodconfig    clang-19
arm                     allnoconfig    clang-21
arm                     allnoconfig    gcc-14.2.0
arm                    allyesconfig    clang-19
arm         randconfig-001-20250506    clang-21
arm         randconfig-002-20250506    clang-21
arm         randconfig-003-20250506    clang-17
arm         randconfig-004-20250506    clang-21
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20250506    clang-21
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20250506    gcc-14.2.0
csky        randconfig-002-20250506    gcc-14.2.0
hexagon                allmodconfig    clang-17
hexagon                allmodconfig    clang-19
hexagon                 allnoconfig    clang-21
hexagon                 allnoconfig    gcc-14.2.0
hexagon                allyesconfig    clang-19
hexagon                allyesconfig    clang-21
hexagon     randconfig-001-20250506    clang-21
hexagon     randconfig-002-20250506    clang-21
i386                   allmodconfig    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    clang-20
i386                    allnoconfig    gcc-12
i386                   allyesconfig    clang-20
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-20
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20250506    gcc-14.2.0
loongarch   randconfig-002-20250506    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2       randconfig-001-20250506    gcc-8.5.0
nios2       randconfig-002-20250506    gcc-6.5.0
openrisc                allnoconfig    clang-21
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    clang-21
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc      randconfig-001-20250506    gcc-11.5.0
parisc      randconfig-002-20250506    gcc-5.5.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    clang-21
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    gcc-14.2.0
powerpc     randconfig-001-20250506    clang-21
powerpc     randconfig-002-20250506    gcc-8.5.0
powerpc     randconfig-003-20250506    gcc-8.5.0
powerpc64   randconfig-001-20250506    clang-20
powerpc64   randconfig-002-20250506    gcc-8.5.0
powerpc64   randconfig-003-20250506    clang-18
riscv                  allmodconfig    gcc-14.2.0
riscv                   allnoconfig    clang-21
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    gcc-14.2.0
s390                   allmodconfig    clang-18
s390                   allmodconfig    gcc-14.2.0
s390                    allnoconfig    clang-21
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20250506    gcc-9.3.0
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20250506    gcc-12.4.0
sparc                  allmodconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-14.2.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-21
um                     allyesconfig    clang-19
um                     allyesconfig    gcc-12
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    clang-20
x86_64                    defconfig    gcc-11
x86_64                 rhel-9.4-bpf    clang-18
x86_64               rhel-9.4-kunit    clang-18
x86_64                 rhel-9.4-ltp    clang-18
x86_64                rhel-9.4-rust    clang-18
xtensa                  allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
