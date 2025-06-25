Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6563595D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826695; cv=none; b=Mw5c40TgaVlQsEcRqYtTCVlt1MW/+2GYqP8VC6XItY5Q1cwBt7u4BWSqPkh23gyUzFSgb1D+wahsSJjFxCCssOKKYF7gbdDTmRSIbqJatwIBaP5pCpaxLvzVNdxs2rQwfAPs4mYIsqpR5Om3OFQ4RenyLTTn7kfDSBJIW5genHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826695; c=relaxed/simple;
	bh=nO7UinYVbAWCFJnMI/td/Q733lZQClwNI224NEA9K0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iLP5fke5rZ2Eq8C+QMs7VSfVvXnx9vGii6bPgYhs3CmBAc0paazkVlts54EuQDXu978y0BCVC2jmnGkgVQeoYfN38QF2GNNcNH7/23MUqbcxroCfBTJJpo+yLOpxZ3Y0AB6P+ufUhcVAtOZnczhogyfvKpHvkgt1mBL9d6m9NLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2BnuXzd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2BnuXzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750826694; x=1782362694;
  h=date:from:to:cc:subject:message-id;
  bh=nO7UinYVbAWCFJnMI/td/Q733lZQClwNI224NEA9K0s=;
  b=H2BnuXzdha4XpVaGObcQEffQDIPlpAhiq2wZs+gHVG5fg4E5dkNrLpNn
   wQa2EWVILDAf7RfeQ0ESGOm8OHt7ca8fusj0zzx0LjrSPMxcQjYFR+ckA
   89G4c7hJWGlT3cOGdSKOj9s3u/zRcUbWo8xKk8H3cSJnEVRVral3jtqzM
   WyxoCw0kpcgB2Ymf+v3oQufPzlkag+oIhTIbivVbb+f7OYGBEB0adQ52p
   9Qh7mIUuM2m7ScczYp66RUX/Q6YW/nuEuBygLkQzzDoJeIBgGsYiWywNS
   M+CKesNdD4saymcBDtAm+hKazs2vTFrbhE7oKc3J4Rp847blpbqDkZoVg
   g==;
X-CSE-ConnectionGUID: p9OxmKs/T6eXVsEzGaU4OA==
X-CSE-MsgGUID: vLUV/2u5QXSwabn+0pMRqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56868618"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="56868618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:44:53 -0700
X-CSE-ConnectionGUID: aJzmOnb8QmuWN7DzCVbNtQ==
X-CSE-MsgGUID: TZR+rLxlStKts+Mv1uS77w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="156140406"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2025 21:44:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUI0A-000SlU-21;
	Wed, 25 Jun 2025 04:44:50 +0000
Date: Wed, 25 Jun 2025 12:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/bugs] BUILD SUCCESS
 ab9f2388e0b99cd164ddbd74a6133d3070e2788d
Message-ID: <202506251204.87yBWZNX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: ab9f2388e0b99cd164ddbd74a6133d3070e2788d  x86/bugs: Allow ITS stuffing in eIBRS+retpoline mode also

elapsed time: 938m

configs tested: 65
configs skipped: 58

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-002-20250625    gcc-11.5.0
arm                               allnoconfig    gcc-15.1.0
arm                   randconfig-001-20250625    gcc-11.5.0
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-003-20250625    gcc-11.5.0
arm                   randconfig-004-20250625    gcc-11.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-002-20250625    gcc-11.5.0
arm64                 randconfig-003-20250625    gcc-11.5.0
arm64                 randconfig-004-20250625    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250625    clang-20
i386        buildonly-randconfig-001-20250625    gcc-12
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250625    clang-20
i386        buildonly-randconfig-005-20250625    gcc-12
i386        buildonly-randconfig-006-20250625    clang-20
i386        buildonly-randconfig-006-20250625    gcc-12
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
parisc                            allnoconfig    clang-21
powerpc                           allnoconfig    clang-21
riscv                             allnoconfig    clang-21
s390                              allnoconfig    clang-21
sh                                allnoconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-002-20250625    clang-20
x86_64      buildonly-randconfig-002-20250625    gcc-12
x86_64      buildonly-randconfig-003-20250625    clang-20
x86_64      buildonly-randconfig-003-20250625    gcc-12
x86_64      buildonly-randconfig-004-20250625    clang-20
x86_64      buildonly-randconfig-004-20250625    gcc-12
x86_64      buildonly-randconfig-005-20250625    clang-20
x86_64      buildonly-randconfig-005-20250625    gcc-12
x86_64      buildonly-randconfig-006-20250625    clang-20
x86_64      buildonly-randconfig-006-20250625    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
