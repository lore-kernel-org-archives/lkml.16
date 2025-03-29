Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B21A339A1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258582; cv=none; b=FcCyjS+GDoWyhEJOrTA6ZZ2r3WeLowutpnqyXe7lAhRC4tzd5u9SUxGr4sTjrSmhfXI+Ii0ohZWKlC6j94DgzRQGfPFuQ3UWVGnNPQvUHg/cSSY22uP4DY8up3Rk7mghwXTC8dmE4zp30c60ldX5HNEx/RL5FvFvtA1hJGWK8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258582; c=relaxed/simple;
	bh=kBVPa9YvlHRHbNWN0xm5NQyAYS2RqbL2kPBEt4Kb5VI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=buOnCiBzvyHIqSd64c4BQjCagcScG6pPi/RS6vwK8Tw1x0n5VaQgtlYEf2H5WlGxbIh6VWBgDhT6B61pXEjfLWUI4aN7uAl+HJAvMzuMFSHiNaUdkQWUbfZFOr1doK58HPtMQ75r4miBwUAjdzvwo/rmS6N6SPMJKQPT1e1gpA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnqghtCS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnqghtCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743258581; x=1774794581;
  h=date:from:to:cc:subject:message-id;
  bh=kBVPa9YvlHRHbNWN0xm5NQyAYS2RqbL2kPBEt4Kb5VI=;
  b=JnqghtCSbHquC7GwZQWMmruFeD1Zsd7Nz9qTImxa9/Ut2jPPEk6VlIq3
   I8kVsXgajuCWedX7n8I+WcpsvQQ3iWv1n2FriY6jR3mygQR3nLFQC/IpH
   jv4kVDJtPX/2RcDGw7SnulQlKlU5qGhG+3tPqnj1OEM3ffHGpDwGV+kdo
   WYzNsjBx2wFMWvl2Yz1nq6d2Z7DSiNKmoYnqNV/Rvs+GaB7E5owznJsON
   jOY6S0unktUNl51cIp801qq14M6ozxPVGoGnMv0tgDHaWcdDnMwT5Y9F4
   kBbD11VgknW+d5Mh78WD5PXzc7+GK8TNkkObXJIKo+/5S9rsyLczgDmfP
   w==;
X-CSE-ConnectionGUID: 6IA/Z5TqSUO4eHp8vlnvXA==
X-CSE-MsgGUID: cNR20EydT66Ok/Bcggvt5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44614726"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44614726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 07:29:40 -0700
X-CSE-ConnectionGUID: 7X4BbtO3RzSY1SeVo6/60g==
X-CSE-MsgGUID: /jZpyimKSW2UfS9V1wmDpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="162944551"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Mar 2025 07:29:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyXBo-0008AC-2m;
	Sat, 29 Mar 2025 14:29:36 +0000
Date: Sat, 29 Mar 2025 22:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:WIP.x86/alternatives] BUILD REGRESSION
 5c21e894a3e5752ac672af6e542775b3914c6668
Message-ID: <202503292237.9NjpMfQj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/alternatives
branch HEAD: 5c21e894a3e5752ac672af6e542775b3914c6668  x86/alternatives: Rename 'apply_relocation()' to 'text_poke_apply_relocation()'

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202503290002.FY3SEEJB-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503290433.IufZBqKJ-lkp@intel.com

    arch/x86/kernel/alternative.c:2614: warning: Excess function parameter 'text_poke_array.nr_entries' description in 'smp_text_poke_batch_process'
    arch/x86/kernel/alternative.c:2614: warning: Excess function parameter 'text_poke_array.vec' description in 'smp_text_poke_batch_process'
    vmlinux.o: warning: objtool: smp_text_poke_int3_trap_handler+0x15: call to try_get_text_poke_array() leaves .noinstr.text section

Error/Warning ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- i386-allnoconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- i386-allyesconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- i386-buildonly-randconfig-001-20250328
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- i386-defconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- i386-randconfig-141-20250329
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- x86_64-allmodconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- x86_64-allnoconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- x86_64-allyesconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- x86_64-buildonly-randconfig-004-20250328
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|   `-- vmlinux.o:warning:objtool:smp_text_poke_int3_trap_handler:call-to-try_get_text_poke_array()-leaves-.noinstr.text-section
|-- x86_64-buildonly-randconfig-005-20250328
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- x86_64-buildonly-randconfig-006-20250328
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
|-- x86_64-defconfig
|   |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
|   `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process
`-- x86_64-randconfig-161-20250329
    |-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.nr_entries-description-in-smp_text_poke_batch_process
    `-- arch-x86-kernel-alternative.c:warning:Excess-function-parameter-text_poke_array.vec-description-in-smp_text_poke_batch_process

elapsed time: 1443m

configs tested: 19
configs skipped: 127

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250328    gcc-12
i386    buildonly-randconfig-002-20250328    gcc-12
i386    buildonly-randconfig-003-20250328    clang-20
i386    buildonly-randconfig-004-20250328    gcc-12
i386    buildonly-randconfig-005-20250328    clang-20
i386    buildonly-randconfig-006-20250328    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250328    clang-20
x86_64  buildonly-randconfig-002-20250328    clang-20
x86_64  buildonly-randconfig-003-20250328    clang-20
x86_64  buildonly-randconfig-004-20250328    clang-20
x86_64  buildonly-randconfig-005-20250328    clang-20
x86_64  buildonly-randconfig-006-20250328    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
