Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9DFBE4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792115; cv=none; b=CuogJqunUbbACiE56JK9bY1KdyvouNupU2M+Bprs2iVNblXjCFvsqXkIhQfFVsHKlIdHIwqQJmF52GpvRXsQaEVkZGUErc3nrP3kr5uUPLTisK/z5w4Q62voYOecLUORJjzYvX5L/IzWIRg7bbcBHI4t/JH6sUxTrHrU/tfkxj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792115; c=relaxed/simple;
	bh=0cnWJkqp3lcD4uQZbn+qM1sA4on9vdHDd1gixBy/law=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HPoWPzaa2SlEV3rGLuOVUMkneg3Jk+2J6eK4/RHXZA7ZttSz8YObzhtv3vOaugGKApIeizzGci1ansv5z6470ksMOn7cVZBbFH+6GT78NFG90umibK7RG/eRVODvefkxgxcu6cdseGVzRsQOV16o2FpTm0hNfzhc1+FIebuNA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+dQ7Xs4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+dQ7Xs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743792114; x=1775328114;
  h=date:from:to:cc:subject:message-id;
  bh=0cnWJkqp3lcD4uQZbn+qM1sA4on9vdHDd1gixBy/law=;
  b=R+dQ7Xs4oGUjY7szxtnYDH8Rdm+A5GuFkOzxRvs65HMXSpDNrNATfMmG
   f0jOJAovf4kXS92Lcqyx1idSDA23rjt6YXUUg1Ufc3SAE0pAqqUhzU7oU
   rlS9RflIIn45M16hM9kKgk5oHH3O1K15/5RhmDG02dzjoVRpcZ5ee4q4Z
   kZ2FTNIq6OSk+b4YEzpJyERmH2r+tyLybq7NtByOhGuMwGrjxpK6aCDnu
   2aBaLw7zqkMbqMYcHxzos/8brZamPzKf7UZpVmqAIgl7S19zau4MDczJR
   /7pCttOlDD1t2328YKZhu19/Sy7dqk7YIg+rYNNPfhV2XbSX3rePAgOhp
   w==;
X-CSE-ConnectionGUID: IS9Xta8pR3KPVdZA+ANLKw==
X-CSE-MsgGUID: rfFmATZXRk+ph12ivZruRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45127886"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45127886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 11:41:53 -0700
X-CSE-ConnectionGUID: oyAV0r78T0+vRL3UEG+q9g==
X-CSE-MsgGUID: Ry23Xp8lQGGen+VCtASMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="128289251"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Apr 2025 11:41:52 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0lzB-0001SV-2w;
	Fri, 04 Apr 2025 18:41:49 +0000
Date: Sat, 05 Apr 2025 02:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 60093e6f3711907dff9120f861c2f7031201aca1
Message-ID: <202504050252.7NMbqCXU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 60093e6f3711907dff9120f861c2f7031201aca1  EXP PCI/AER: Rate-limit output from aer_print_error()

elapsed time: 1451m

configs tested: 32
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250404    gcc-14.2.0
arc                  randconfig-002-20250404    gcc-14.2.0
arm                  randconfig-001-20250404    clang-21
arm                  randconfig-002-20250404    gcc-7.5.0
arm                  randconfig-003-20250404    clang-21
arm                  randconfig-004-20250404    clang-21
arm64                randconfig-001-20250404    gcc-5.5.0
arm64                randconfig-002-20250404    gcc-7.5.0
arm64                randconfig-003-20250404    gcc-9.5.0
arm64                randconfig-004-20250404    clang-15
csky                 randconfig-001-20250404    gcc-13.3.0
csky                 randconfig-002-20250404    gcc-11.5.0
hexagon              randconfig-001-20250404    clang-15
hexagon              randconfig-002-20250404    clang-21
i386       buildonly-randconfig-001-20250404    gcc-12
i386       buildonly-randconfig-002-20250404    gcc-12
i386       buildonly-randconfig-003-20250404    gcc-12
i386       buildonly-randconfig-004-20250404    gcc-12
i386       buildonly-randconfig-005-20250404    gcc-12
i386       buildonly-randconfig-006-20250404    gcc-12
loongarch            randconfig-001-20250404    gcc-14.2.0
loongarch            randconfig-002-20250404    gcc-14.2.0
nios2                randconfig-001-20250404    gcc-5.5.0
nios2                randconfig-002-20250404    gcc-11.5.0
parisc               randconfig-001-20250404    gcc-8.5.0
parisc               randconfig-002-20250404    gcc-14.2.0
powerpc              randconfig-001-20250404    gcc-5.5.0
powerpc              randconfig-002-20250404    gcc-9.3.0
powerpc              randconfig-003-20250404    clang-21
powerpc64            randconfig-001-20250404    gcc-10.5.0
powerpc64            randconfig-002-20250404    clang-21
powerpc64            randconfig-003-20250404    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
