Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039151624C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778535; cv=none; b=ELyGiIrjquYRMrSJ+dnhG8fWK8lYW5tKOPvegS1E0WkfoIY/9tE0QePMt/rZedfLnMbSZxY/vczC5jjHXPQZaBds2TlrJIjtYDJhSpXT5UdlseYMJxvvbU07VtmMDjEbF2rNhISATeaqko4N1FUYdEuYsRMyrxwlHAVEih8jQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778535; c=relaxed/simple;
	bh=kCbDRkzwXLPqCKn7fieAQveP+M1zJWgz95gFgBMpcNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OAhkURIaWD1FU59oZbaZzQq2+rrOl7hUxTZsUCUVW7kB1WNNPzri35vZhAexiNr19LZgZxN2+f+mRipq22Uskd6xeIIt+QtL+0p6cYmG45W8mXL1Wqgf681cdqtCEWn743jmVAueqWz6mZAnnoruZZc7mg9z0QWK3t4Ww9F7T5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GH/6UK5v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GH/6UK5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743778534; x=1775314534;
  h=date:from:to:cc:subject:message-id;
  bh=kCbDRkzwXLPqCKn7fieAQveP+M1zJWgz95gFgBMpcNw=;
  b=GH/6UK5vRWTzIWvIAD5fobZn+8bcuT6jh/zTmde26M3KeV0u/SKhb/Q+
   qPDIdim8Gp0RciqinLIVPRyBZSKcrvNpgj38MIvSculVSt1FHQAwztqAB
   pM7pLYB6NSOxY4+9P17F/v45gSejyFTYkuCzBLeHHpL4Q7xzx4AQJaKdU
   kRwom047JiLHJE0i3uYTOGSx28LUhTISHV54p7sOp+whbBimHD1D2ZwMe
   GDoYAlFci/d2DTVRd/jy4z1eIJeokNyN3n/vhYT/qwyXIEE+0vSNnKAPq
   7teI2Q7QFgHVyUloFcFCfcrbYQ+2UWs1Hbwm6rxaHNd/RJ2X1m7wNq7mK
   Q==;
X-CSE-ConnectionGUID: IPe0MEgzSQWPP6YuwcLKeA==
X-CSE-MsgGUID: 8tIgfDI/RI+UzxL8kdQIAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49078677"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49078677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:55:33 -0700
X-CSE-ConnectionGUID: ufMFWt+4SFmpy/+fiiAqag==
X-CSE-MsgGUID: LGHqpTEPQcaeSLBaW02lvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127087265"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Apr 2025 07:55:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0iS9-0001JV-1g;
	Fri, 04 Apr 2025 14:55:29 +0000
Date: Fri, 04 Apr 2025 22:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/mm] BUILD SUCCESS
 fc1cd60042b3df1d162278461c7a87f0362502b8
Message-ID: <202504042207.tUief2ZJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: fc1cd60042b3df1d162278461c7a87f0362502b8  x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>

elapsed time: 1444m

configs tested: 52
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250404    gcc-12
i386    buildonly-randconfig-002-20250404    gcc-12
i386    buildonly-randconfig-003-20250404    gcc-12
i386    buildonly-randconfig-004-20250404    gcc-12
i386    buildonly-randconfig-005-20250404    gcc-12
i386    buildonly-randconfig-006-20250404    gcc-12
i386                            defconfig    clang-20
i386              randconfig-001-20250404    gcc-12
i386              randconfig-002-20250404    gcc-12
i386              randconfig-003-20250404    gcc-12
i386              randconfig-004-20250404    gcc-12
i386              randconfig-005-20250404    gcc-12
i386              randconfig-006-20250404    gcc-12
i386              randconfig-007-20250404    gcc-12
i386              randconfig-011-20250404    clang-20
i386              randconfig-012-20250404    clang-20
i386              randconfig-013-20250404    clang-20
i386              randconfig-014-20250404    clang-20
i386              randconfig-015-20250404    clang-20
i386              randconfig-016-20250404    clang-20
i386              randconfig-017-20250404    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250404    clang-20
x86_64  buildonly-randconfig-002-20250404    clang-20
x86_64  buildonly-randconfig-003-20250404    clang-20
x86_64  buildonly-randconfig-004-20250404    gcc-12
x86_64  buildonly-randconfig-005-20250404    gcc-12
x86_64  buildonly-randconfig-006-20250404    gcc-12
x86_64                          defconfig    gcc-11
x86_64                              kexec    clang-20
x86_64            randconfig-001-20250404    clang-20
x86_64            randconfig-002-20250404    clang-20
x86_64            randconfig-003-20250404    clang-20
x86_64            randconfig-004-20250404    clang-20
x86_64            randconfig-005-20250404    clang-20
x86_64            randconfig-006-20250404    clang-20
x86_64            randconfig-007-20250404    clang-20
x86_64            randconfig-008-20250404    clang-20
x86_64            randconfig-071-20250404    gcc-12
x86_64            randconfig-072-20250404    gcc-12
x86_64            randconfig-073-20250404    gcc-12
x86_64            randconfig-074-20250404    gcc-12
x86_64            randconfig-075-20250404    gcc-12
x86_64            randconfig-076-20250404    gcc-12
x86_64            randconfig-077-20250404    gcc-12
x86_64            randconfig-078-20250404    gcc-12
x86_64                           rhel-9.4    clang-20
x86_64                           rhel-9.4    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
