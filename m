Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84B25F99F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852476; cv=none; b=P407K9T0k5TsOyM7ED0BTZTLxvba6EjR1z7+QQZwPsg1qWI4ty3Bjw5zSjcisj1/NofSB9B1gXOibWhLTsj4ZYG4gi11L+eednjj2W28jhpKl4V2E51Dk7sHXP9utkU0/vnKKAKpJeKuhNbVvpQPtaEN877jILnCjEbE1k+l0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852476; c=relaxed/simple;
	bh=zTmMxTkMl2QWPEE+T3JH6FhbPB97OUqdUb+uJ7rNKiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X9vGnJ70WUW1rRKI2RRZOa8avcE1fkYG45JJDQranH6SY/mnOhCa9gCqPnRTrrKmAkrWst+whxC5ji+p9/vjO5a1Q0sgYZwKNLfmLLhxOllwo6DDevSM7N1JUxF7y94cZQvSlNx0uR8+0MWslVAsa0UrgpSIw1xol/8QYRA0CEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG2BfK9x; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG2BfK9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750852475; x=1782388475;
  h=date:from:to:cc:subject:message-id;
  bh=zTmMxTkMl2QWPEE+T3JH6FhbPB97OUqdUb+uJ7rNKiI=;
  b=DG2BfK9x/P/CV8ppuxx2PNjlnJcZtkGax8zlaPpH9vxHTm5O5aYpx0lK
   FAsJjyHf2SMR40RTOYdnVBv3sCfcCAuHpOkAXfpbMDMesuzZ030Mlj/3j
   J0fT/C0A/n8n5EXKApHXlPf3lC3D5h0Few54z7nYRtXiXnvnoFJxcI432
   3I7QXBiRLe/2MeZvaPD/XxMdYaz7wIygsPkTCHohs11HWOVLLTTPttC4p
   ZR7i27dSbYz+G+GdZk1E/OiVm3AqueNc9mug/d2IIpFKCKCqlmoOiC3T+
   0SsZa3580uO4b0iQvV034j3HPpWqPzbKPLgRiziT26X0P7E3DkLXLSpj6
   w==;
X-CSE-ConnectionGUID: tfGqa2cFTm+KsVZx+uujig==
X-CSE-MsgGUID: XiKMNqCCTzGScBm7VfAk3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64475519"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64475519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 04:54:34 -0700
X-CSE-ConnectionGUID: 2A/3DtH6R4Cvi/clvDz4VQ==
X-CSE-MsgGUID: A1FilVl3T9amzCfHDSHJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="183233308"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jun 2025 04:54:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUOhy-000T4b-22;
	Wed, 25 Jun 2025 11:54:30 +0000
Date: Wed, 25 Jun 2025 19:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/fpu] BUILD SUCCESS
 8b05b3c988162ca117b3854ae7d497927b415299
Message-ID: <202506251948.6sgFxfU1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
branch HEAD: 8b05b3c988162ca117b3854ae7d497927b415299  x86/fpu/xstate: Add CET supervisor xfeature support as a guest-only feature

elapsed time: 848m

configs tested: 30
configs skipped: 58

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    clang-20
i386                          allnoconfig    clang-20
i386                         allyesconfig    clang-20
i386    buildonly-randconfig-001-20250625    clang-20
i386    buildonly-randconfig-002-20250625    gcc-12
i386    buildonly-randconfig-003-20250625    gcc-12
i386    buildonly-randconfig-004-20250625    gcc-12
i386    buildonly-randconfig-005-20250625    clang-20
i386    buildonly-randconfig-006-20250625    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250625    gcc-12
x86_64  buildonly-randconfig-002-20250625    clang-20
x86_64  buildonly-randconfig-002-20250625    gcc-12
x86_64  buildonly-randconfig-003-20250625    clang-20
x86_64  buildonly-randconfig-003-20250625    gcc-12
x86_64  buildonly-randconfig-004-20250625    clang-20
x86_64  buildonly-randconfig-004-20250625    gcc-12
x86_64  buildonly-randconfig-005-20250625    clang-20
x86_64  buildonly-randconfig-005-20250625    gcc-12
x86_64  buildonly-randconfig-006-20250625    clang-20
x86_64  buildonly-randconfig-006-20250625    gcc-12
x86_64                          defconfig    clang-20
x86_64                              kexec    clang-20
x86_64                           rhel-9.4    clang-20
x86_64                       rhel-9.4-bpf    gcc-12
x86_64                     rhel-9.4-kunit    gcc-12
x86_64                       rhel-9.4-ltp    gcc-12
x86_64                      rhel-9.4-rust    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
