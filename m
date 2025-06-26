Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CA97081E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952310; cv=none; b=XSTYOyg9vYosvCBYeJGvmc7b2TxZlbZ+2v6NKoxcj8qjBPbl7lL7N3k3LNM+rc8r2HorkASuTaRs4tJq0lWV0g14JJ2PwV/T2efQROuWLcpX4bwpiIAVsnZ/JjZHIv+894egrq9z8z+eyjUJMwKoTfnaaO45v542Bdok9HnQsTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952310; c=relaxed/simple;
	bh=jcRyQyoHFXZTXy637shBXrGAv2EhK0gTzTWgtuJpAWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=adye6qzU1OMTisWDpc8mcBt8jf+3aivm77XW5EjzI7CJER5IghMYluy7BrFrqwvySiA8GzwgedQ+D3irMr9HQhLmU8140Mroc0mchygdH72Y3x828McZh7UX07BwPa0MrRxjwOz6e9XzkMLc7Y50uEHM60rM6y9nV0g4C+L82sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQeGMyN9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQeGMyN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750952309; x=1782488309;
  h=date:from:to:cc:subject:message-id;
  bh=jcRyQyoHFXZTXy637shBXrGAv2EhK0gTzTWgtuJpAWo=;
  b=IQeGMyN9IICI0b9EF55U+Vzw9KYDynIdVVwK2uZkwUfmtDMO/4Oxnmz/
   nyj8MMHcaCXQLkeIGYKhZZtVD2TxzCIJwd6nicleO1cMMsJ/FDZve+47P
   pZYYYI3UJm+EJXj+q7Axz5COTUz67allEi+O3dSCjYdPhvJ+BCyBUNCCk
   3IZPJFPDo5QGbZqDz72YQOMyFVOQJDF1/JveYi+yMG6VGIhwacvkjQ4Vp
   u9Ysv3TRFhODp/oWTZpR5x3E+X8fJ/+OyuJJ4Nt6MLKKQGr4TItQvMnlH
   wtRwvsQqNeGl/bjpOYqOQoQcIxEphqNB/yvcgzYqYcy08Dxk1CtM4rorz
   Q==;
X-CSE-ConnectionGUID: bI1b4/T8S9a1w8m3WL21Jg==
X-CSE-MsgGUID: hAc/wfPwTLy73G5t6+kCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52482149"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="52482149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:38:28 -0700
X-CSE-ConnectionGUID: nylp8k6BSZa5dwhTKrYBPg==
X-CSE-MsgGUID: AsWv3F5/RPW4G+5t1UVIgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="183578711"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jun 2025 08:38:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUogD-000UDP-0R;
	Thu, 26 Jun 2025 15:38:25 +0000
Date: Thu, 26 Jun 2025 23:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/fpu] BUILD SUCCESS
 1cec9ac2d071cfd2da562241aab0ef701355762a
Message-ID: <202506262327.Y2CCsChK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
branch HEAD: 1cec9ac2d071cfd2da562241aab0ef701355762a  x86/fpu: Delay instruction pointer fixup until after warning

elapsed time: 926m

configs tested: 52
configs skipped: 58

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250626    clang-20
arc                   randconfig-002-20250626    clang-20
arm                               allnoconfig    gcc-15.1.0
arm                   randconfig-001-20250626    clang-20
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-003-20250626    clang-20
arm                   randconfig-004-20250626    clang-20
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250626    clang-20
arm64                 randconfig-002-20250626    clang-20
arm64                 randconfig-003-20250626    clang-20
arm64                 randconfig-004-20250626    clang-20
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-006-20250626    clang-20
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
um                                allnoconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
