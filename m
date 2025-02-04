Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C0206F02
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660483; cv=none; b=dfA4wW6kAdT2NBba80PtSk+5bZf2h1rxo02B0WTjA2khJFpKOoqKDYPhnE/qNAtAnGoTOJ4d/WYHU/IsUUNDaW26bvszuqxkJIAg9OLoGUjUaA7sNR9Dz+xb610GvuaOrIMwyE+vMNdvbi/vnsjnRdywR/d6wEEab9nnmGwWPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660483; c=relaxed/simple;
	bh=zacp/PKcX459lp+lSimFgG0z8oJT32EgMhkQYC5hrng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=goAjyxbsPrd0OX2n8J//UGV7bvPqeTMaqszFADNQS2BujtqLmXOOgVdnIN1iHl4fMRvGh4BpiKQ3MZ90LoYamG7n9oUW9UA4xSchSOz+aGaX57UIYYL4ABDzfrwRlEbqDvoQ28j62k5GaguBJFAmH8eW+2i3rRdbk9Oi2exjK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVDxFXB9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVDxFXB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738660480; x=1770196480;
  h=date:from:to:cc:subject:message-id;
  bh=zacp/PKcX459lp+lSimFgG0z8oJT32EgMhkQYC5hrng=;
  b=eVDxFXB9UgDkDxvN4lAl+VgvOIlbKwuW7ARv2FM+/WJluaGgq8wFXlkt
   jzaQGJBa6fjadUpIAJD97gepi6vnGerfsSqumn0k4M4ZQPGsXUESvIlUp
   DyQIsqUlITFMg40uJfjRIsKgTnbytuskK/AYnYTEScBkhtXqZOsHk0AQk
   SYHJIebLIuDYQ+dsiwAbvxEXy27mK5m8GZRpKk4kQ5IzkuXMgAaQwG7bt
   sood0PyB339pc+9PKAAFCvpcqdAn3+82X0ZCTyVYdnKe8W0A02Gz38iSf
   wwuQBJA+7strOCYCTPLnonqw8f9Rc/YOdReOZ0UDeU4MTJ9ZZcURwIRTd
   Q==;
X-CSE-ConnectionGUID: 0xjR1HMsT/it1ZWVFlFyTg==
X-CSE-MsgGUID: S6vwDaWWSAGQkCvgAVAF3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="64529619"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="64529619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 01:14:40 -0800
X-CSE-ConnectionGUID: cdirOuAYS1yhwmnC9/UZkQ==
X-CSE-MsgGUID: pJmpPAX/QX2XhvAD5YpNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111390623"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 01:14:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfF0u-000sFz-11;
	Tue, 04 Feb 2025 09:14:36 +0000
Date: Tue, 04 Feb 2025 17:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/misc] BUILD SUCCESS
 b2f10aa2eb18d289e48097e0ed973e714322175b
Message-ID: <202502041756.kTRfSD9G-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/misc
branch HEAD: b2f10aa2eb18d289e48097e0ed973e714322175b  x86/entry: Add __init to ia32_emulation_override_cmdline()

elapsed time: 991m

configs tested: 76
configs skipped: 197

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             allmodconfig    clang-18
arc                              allnoconfig    gcc-14.2.0
arc                             allyesconfig    clang-18
arm                             allmodconfig    clang-18
arm                              allnoconfig    gcc-14.2.0
arm                             allyesconfig    clang-18
arm                  milbeaut_m10v_defconfig    clang-21
arm                        nhk8815_defconfig    clang-21
arm                        vf610m4_defconfig    clang-21
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250204    gcc-14.2.0
csky                 randconfig-002-20250204    gcc-14.2.0
hexagon                          allnoconfig    gcc-14.2.0
hexagon              randconfig-001-20250204    gcc-14.2.0
hexagon              randconfig-002-20250204    gcc-14.2.0
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250204    gcc-12
i386       buildonly-randconfig-002-20250204    clang-19
i386       buildonly-randconfig-002-20250204    gcc-12
i386       buildonly-randconfig-003-20250204    clang-19
i386       buildonly-randconfig-003-20250204    gcc-12
i386       buildonly-randconfig-004-20250204    gcc-12
i386       buildonly-randconfig-005-20250204    clang-19
i386       buildonly-randconfig-005-20250204    gcc-12
i386       buildonly-randconfig-006-20250204    gcc-12
i386                               defconfig    clang-19
i386                 randconfig-011-20250204    clang-19
i386                 randconfig-012-20250204    clang-19
i386                 randconfig-013-20250204    clang-19
i386                 randconfig-014-20250204    clang-19
i386                 randconfig-015-20250204    clang-19
i386                 randconfig-016-20250204    clang-19
i386                 randconfig-017-20250204    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250204    gcc-14.2.0
loongarch            randconfig-002-20250204    gcc-14.2.0
m68k                         multi_defconfig    clang-21
m68k                       mvme16x_defconfig    clang-21
nios2                randconfig-001-20250204    gcc-14.2.0
nios2                randconfig-002-20250204    gcc-14.2.0
openrisc                         allnoconfig    clang-21
parisc                           allnoconfig    clang-21
parisc               randconfig-001-20250204    gcc-14.2.0
parisc               randconfig-002-20250204    gcc-14.2.0
powerpc                          allnoconfig    clang-21
powerpc              randconfig-001-20250204    gcc-14.2.0
powerpc              randconfig-002-20250204    gcc-14.2.0
powerpc              randconfig-003-20250204    gcc-14.2.0
powerpc64            randconfig-002-20250204    gcc-14.2.0
powerpc64            randconfig-003-20250204    gcc-14.2.0
riscv                            allnoconfig    clang-21
s390                            allmodconfig    gcc-14.2.0
s390                             allnoconfig    clang-21
s390                            allyesconfig    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                         urquell_defconfig    clang-21
sparc                           allmodconfig    gcc-14.2.0
um                               allnoconfig    clang-21
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250204    clang-19
x86_64     buildonly-randconfig-002-20250204    clang-19
x86_64     buildonly-randconfig-003-20250204    clang-19
x86_64     buildonly-randconfig-004-20250204    gcc-11
x86_64     buildonly-randconfig-005-20250204    clang-19
x86_64     buildonly-randconfig-006-20250204    clang-19
x86_64                             defconfig    gcc-11
x86_64                                 kexec    clang-19
x86_64                              rhel-9.4    clang-19
xtensa                      common_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
