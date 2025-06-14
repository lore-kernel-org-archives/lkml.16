Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D2566A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861577; cv=none; b=sHxCW+Q+9nCmgerwy4CRZMzDQUg0MG6y35d3XoDpxaI9G60xYwYZ03hF7PoctXNQx4h3pMZ26JEHF8W4D/778+fFGL1+hohqMo7bEGQ9tTOS3z4XA6tV+Cdvpir/MAp0iQZnB9lLXi9asku0LHPHyq20b0ki7QNXMgV43QGT5VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861577; c=relaxed/simple;
	bh=Ol+DV7UzCHCV8gUSVT+9EkYL+s4LiRzd1eA9g589cGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NON9N6BQjJ/SvK8p2L/ywAzJMztiVQrnu/xDqUAxmu+gxz4IOxwOYUJFE8ZRp9PxKMBPaqitET2+c2GByrBA5sjkPFNNfYoXkspMdfj8hmMYu37+jP8c0jBOPm4md8tlMogDovJJIVCX21uMP76kdktVs7j/37dd/7kRjyeGt+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFC5Ubaq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFC5Ubaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749861576; x=1781397576;
  h=date:from:to:cc:subject:message-id;
  bh=Ol+DV7UzCHCV8gUSVT+9EkYL+s4LiRzd1eA9g589cGI=;
  b=cFC5UbaqVl9tyDUN9mtuwzop461CRhNgnQVxZfH6N7no6uwMF2uAykvw
   AnYsiD0iiOWTcn1KARK90Nf7e+k4bMuuxRrK5Aa6ceaXzq6PKdXZqMn8Q
   j2myN0mYJcrpOc97boILzJf00jnCLLqCCmURXUAby0r5PjrYZAsJx+3JQ
   chWwJJF5ll6cfK/su9C4tC81F2TuKS7ZAwoIY+rTZWISD1K/3YZsavTlx
   uFd5Vzbth50rh/mnCSF1m70py/6SSpGha7cRZPVtXVryP6QTRg0Z9hH2O
   dfrMli89JLezfdojNU05vSmAtArM4Taq7RpDA5pCNScQAw6nsXOJ4Ywf7
   w==;
X-CSE-ConnectionGUID: MCu6bLwuSYiizPkE7SMSWQ==
X-CSE-MsgGUID: SqLiYNicQOWPqfqP2ilBeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55886826"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="55886826"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 17:39:35 -0700
X-CSE-ConnectionGUID: X6Z60iWbQZKZjsTZLmpwaQ==
X-CSE-MsgGUID: JobFPKxrR8y1IK+ZfP9J9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="171156990"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 17:39:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQEvl-000D7Y-0B;
	Sat, 14 Jun 2025 00:39:33 +0000
Date: Sat, 14 Jun 2025 08:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 b0823d5fbacb1c551d793cbfe7af24e0d1fa45ed
Message-ID: <202506140848.J9EvGAaL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: b0823d5fbacb1c551d793cbfe7af24e0d1fa45ed  perf/x86/intel: Fix crash in icl_update_topdown_event()

elapsed time: 1014m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250613    gcc-12
i386    buildonly-randconfig-002-20250613    gcc-11
i386    buildonly-randconfig-003-20250613    gcc-12
i386    buildonly-randconfig-004-20250613    clang-20
i386    buildonly-randconfig-005-20250613    clang-20
i386    buildonly-randconfig-006-20250613    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250613    clang-20
x86_64  buildonly-randconfig-002-20250613    gcc-12
x86_64  buildonly-randconfig-003-20250613    gcc-12
x86_64  buildonly-randconfig-004-20250613    gcc-12
x86_64  buildonly-randconfig-005-20250613    clang-20
x86_64  buildonly-randconfig-006-20250613    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
