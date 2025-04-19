Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33953232
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 00:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745022212; cv=none; b=ci42yx1ovQlRNVvAtglCOchm4Eg3wIAdmtaByGnbidMTMdzHQhVshEUEJg9laWfWr9szd2UVAV8iMPEymL7zM7vnkxoS1lK12TLpFoIr/gENCuskhEngPPGhJ0GfQWCocftLa7W3RxzApaKMTef29fhJxYtxNtqepPuNcmdazSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745022212; c=relaxed/simple;
	bh=ZfvvuouS4E2kMmqXo8fFvosbAuq9IeCZu9j7vLtFTIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OjlZKW7TjQvtFS8Zm+NUxkYbtlAJp7rSO8UsacDr8NHqLR14PsL0wGgu+Hy/Qo8pJXFde9Dh21sNm0AzL4WoRVJ/u6Dpu1YApBYkgd5CVsUNsZttlsD6bMesBey3IPqVaeD9amwaDXR8KiJQSm3rsAlWLULiWP7G/rOy/n7YnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNtKOr5j; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNtKOr5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745022211; x=1776558211;
  h=date:from:to:cc:subject:message-id;
  bh=ZfvvuouS4E2kMmqXo8fFvosbAuq9IeCZu9j7vLtFTIU=;
  b=FNtKOr5j9WSQK+bm+BMFopX28/X5xDDoBr9llh2GTG4J94bHkW7+tRh8
   TCmGZIAkyTx3quVDwOPZNgImnNDbMLtsooubLbtXPrwJVVCE31wopAWZh
   fRy0UT0s3N2aul78SL55on8C2QHw7ci08Zrsyp7wvxl+YO9ZpkSyW+Ss8
   LxX/lK6kwScP9KDfmiI1SOf/Vpc70HbDjhP4EX4rk/oy4IuqJPkj9x1zg
   aXuJUJOZfs6qQdQbrkZ9yb1FKWpHC3txbhujbojis0pSUs9YCB8srwWrp
   LLrH/OwwU7s7hiJv2jt2UvppxvdBJz6S/PlI3gd7flF2uaVqcMrY5YjRM
   A==;
X-CSE-ConnectionGUID: CwjSV6k9R8yV5JtF2ZoHeQ==
X-CSE-MsgGUID: rK6fd5rOTGmWC249vWFPoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46536027"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="46536027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 17:23:30 -0700
X-CSE-ConnectionGUID: gvt3B8hfQUWKj0D5M8j52Q==
X-CSE-MsgGUID: lE7Ku45BSEi2h76jtb6Raw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="131188946"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2025 17:23:29 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5vzS-0003SG-2j;
	Sat, 19 Apr 2025 00:23:26 +0000
Date: Sat, 19 Apr 2025 08:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 8245d618b99640981d122aea615cc9a37bb81cc8
Message-ID: <202504190855.dqpx6eBz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 8245d618b99640981d122aea615cc9a37bb81cc8  rcutorture: Print only one rtort_pipe_count splat

elapsed time: 1453m

configs tested: 52
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250419    gcc-14.2.0
arc                  randconfig-002-20250419    gcc-14.2.0
arm                  randconfig-001-20250419    gcc-6.5.0
arm                  randconfig-002-20250419    gcc-7.5.0
arm                  randconfig-003-20250419    clang-18
arm                  randconfig-004-20250419    gcc-7.5.0
arm64                randconfig-001-20250419    gcc-7.5.0
arm64                randconfig-002-20250419    gcc-9.5.0
arm64                randconfig-003-20250419    gcc-5.5.0
arm64                randconfig-004-20250419    clang-21
csky                 randconfig-001-20250419    gcc-11.5.0
csky                 randconfig-002-20250419    gcc-11.5.0
hexagon              randconfig-001-20250419    clang-21
hexagon              randconfig-002-20250419    clang-21
i386       buildonly-randconfig-001-20250419    gcc-11
i386       buildonly-randconfig-002-20250419    gcc-12
i386       buildonly-randconfig-003-20250419    clang-20
i386       buildonly-randconfig-004-20250419    clang-20
i386       buildonly-randconfig-005-20250419    clang-20
i386       buildonly-randconfig-006-20250419    clang-20
loongarch            randconfig-001-20250419    gcc-14.2.0
loongarch            randconfig-002-20250419    gcc-14.2.0
nios2                randconfig-001-20250419    gcc-7.5.0
nios2                randconfig-002-20250419    gcc-11.5.0
parisc               randconfig-001-20250419    gcc-10.5.0
parisc               randconfig-002-20250419    gcc-14.2.0
powerpc              randconfig-001-20250419    gcc-5.5.0
powerpc              randconfig-002-20250419    gcc-9.3.0
powerpc              randconfig-003-20250419    gcc-5.5.0
powerpc64            randconfig-001-20250419    gcc-5.5.0
powerpc64            randconfig-002-20250419    gcc-10.5.0
powerpc64            randconfig-003-20250419    clang-21
riscv                randconfig-001-20250419    gcc-14.2.0
riscv                randconfig-002-20250419    clang-21
s390                 randconfig-001-20250419    clang-21
s390                 randconfig-002-20250419    gcc-7.5.0
sh                   randconfig-001-20250419    gcc-5.5.0
sh                   randconfig-002-20250419    gcc-11.5.0
sparc                randconfig-001-20250419    gcc-12.4.0
sparc                randconfig-002-20250419    gcc-8.5.0
sparc64              randconfig-001-20250419    gcc-8.5.0
sparc64              randconfig-002-20250419    gcc-10.5.0
um                   randconfig-001-20250419    clang-19
um                   randconfig-002-20250419    gcc-12
x86_64     buildonly-randconfig-001-20250419    gcc-12
x86_64     buildonly-randconfig-002-20250419    gcc-11
x86_64     buildonly-randconfig-003-20250419    gcc-12
x86_64     buildonly-randconfig-004-20250419    gcc-11
x86_64     buildonly-randconfig-005-20250419    gcc-12
x86_64     buildonly-randconfig-006-20250419    clang-20
xtensa               randconfig-001-20250419    gcc-10.5.0
xtensa               randconfig-002-20250419    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
