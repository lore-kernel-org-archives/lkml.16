Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3DB3209
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087120; cv=none; b=YIztB08cIseFpZb/rRMJr51w9bUFl9Oc5gmuyrJVpEYHxUN1tlOaYRTq3ngNMtrnyPQQD4InKe3IZCLSeOuBGMK33lzxGS3S4uMI4S9y/z9Wip/jHHObmiZ3I40uNxlkAosparbPqBESyvZuambRWzAwWnVDJgQbQiyBEFgg1c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087120; c=relaxed/simple;
	bh=Dg7Ex8I2Bb9eye9p3DvMfPJ/1GpGNmk3H2QJunCp9SQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d7OXixedDKY87q1ka69hLyDhNR985Xdwuflegc5d010NZGa+QeD1Ko0CixNU0yiy3tyh9KUxvH8LO2U/hyjvGdxrrvaWPegXAHZsadDY3Ym/MxxWtJhqAA6glgYGICBAkCt0rrtQ5wBj7BnFyXHfLUx/6YlbMw+k9Lq5dAJcCc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLsb/uA6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLsb/uA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749087118; x=1780623118;
  h=date:from:to:cc:subject:message-id;
  bh=Dg7Ex8I2Bb9eye9p3DvMfPJ/1GpGNmk3H2QJunCp9SQ=;
  b=cLsb/uA6NyRC+t39K+BwH2I+iK7S7uO91NL9VJnjExmyDHwuGs+uWhh1
   Gco3N3Ps8Cj+u1I6hKy4bW44DWck8AFjGADpiPV5bUJmyVUwO1+uSFq/F
   PG7Nq6akmdysiE8t8vVDy832SOcFCUyi5jG9R9kJcsY3lfFHj5nvBiPFD
   w+durY/5Eu7uJM1zHD+VeGCJqY9w5bdmrkY14JrVjMhiqkCJjCeACI9yF
   uu081CpTRJXsTwWjBQCEEIveipRT/6CAdn7CMAKObjhrmdqpbmkqhsm1z
   6C0Rus9YF2haL5bXsvnV6ahx6uE8s1RAw/qZBzaMcObzIHso1QpNsVJmp
   Q==;
X-CSE-ConnectionGUID: tlV08wDaQsKTN482qk2EXA==
X-CSE-MsgGUID: 4vPkWRuwRLuTUkWliZ9nPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51108714"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51108714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:31:57 -0700
X-CSE-ConnectionGUID: xki37QsnTC2PJHoJHFUJ0w==
X-CSE-MsgGUID: YU1WHzMjR1u1xpW0pupJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145244715"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2025 18:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMzST-0003b0-0k;
	Thu, 05 Jun 2025 01:31:53 +0000
Date: Thu, 05 Jun 2025 09:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 166cdd887dd119068a97213ba22a5bab7a910b7f
Message-ID: <202506050921.o5xkBHO3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 166cdd887dd119068a97213ba22a5bab7a910b7f  Merge branch into tip/master: 'x86/sgx'

elapsed time: 1126m

configs tested: 29
configs skipped: 133

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-15.1.0
arc                              allnoconfig    gcc-15.1.0
arm                              allnoconfig    gcc-15.1.0
arm64                            allnoconfig    gcc-15.1.0
csky                             allnoconfig    gcc-15.1.0
hexagon                          allnoconfig    gcc-15.1.0
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250604    clang-20
i386       buildonly-randconfig-002-20250604    gcc-12
i386       buildonly-randconfig-003-20250604    gcc-12
i386       buildonly-randconfig-004-20250604    gcc-12
i386       buildonly-randconfig-005-20250604    clang-20
i386       buildonly-randconfig-006-20250604    gcc-12
i386                               defconfig    clang-20
loongarch                        allnoconfig    gcc-15.1.0
x86_64                           allnoconfig    clang-20
x86_64                          allyesconfig    clang-20
x86_64     buildonly-randconfig-001-20250604    gcc-12
x86_64     buildonly-randconfig-002-20250604    gcc-12
x86_64     buildonly-randconfig-003-20250604    gcc-12
x86_64     buildonly-randconfig-004-20250604    gcc-12
x86_64     buildonly-randconfig-005-20250604    gcc-12
x86_64     buildonly-randconfig-006-20250604    clang-20
x86_64                             defconfig    gcc-11
x86_64                                 kexec    clang-20
x86_64                              rhel-9.4    clang-20
x86_64                         rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
