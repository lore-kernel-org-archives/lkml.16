Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8DE1853
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506527; cv=none; b=C4uGVw3zW++yYASAc8qjh1R4ekuVIqA15sBBrh05VPvGUsaYYFlmndDvWgPSkIn0E0ulwsb20mChohBkSH4qad9fBcjRkSOxT45Np68HjnqUnnbliTORVY5NnQ0iB3W1uODzKZIuBj+zM5g00jnX+MkgQ4u/kZ1HkI4OVyFzXv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506527; c=relaxed/simple;
	bh=w49iI/xUm8fsF6fKyMdVl1CO2z/Hs5exOw6vPb4Vv04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UVryMn64M8Awqkcg4wnop2RfhQ1gCnFPP9KQeWUmj9x6SaHhE1vFsf7tt70yMistD0IDOgLOWEbE1bVTxwVG27Q7hWS4S7/qbtY1eUnYoobuFhjHXCCJ6Jb4SVz8UdXeuLZCVGUCx6uYOCY+TKD30x8QxUQIQrF2EkUQ0jUluhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5QLqj2n; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5QLqj2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751506526; x=1783042526;
  h=date:from:to:cc:subject:message-id;
  bh=w49iI/xUm8fsF6fKyMdVl1CO2z/Hs5exOw6vPb4Vv04=;
  b=P5QLqj2n6nY25av7sY0nBacOWjiDGeZKRBIW9DKwuVylc3Eo9zj+Vyze
   Nsele4E7ScJcYsnHHjAUoojHDgqom/fs7hIplWA9sHInQmr68ZjqtuU7T
   68KtR3q0QI/Pp/ptBMEwOAeoiFC3YAqIldkrN0CN6fyoAZR1eZ1kb1l+d
   WESmoQmyu5L/7qHKHtPTqZpHC9AaBWxOm8N1gaqqg2gFuNL/qVSJIBUjz
   ISzRllWb/P7OfKZVpVcqAawNnGdnYOqnLem30mH7mMoix+QM8uFHi5e9i
   MI2U9wnFfAHRdB/9dYtqK5A0leWq9qRT+TGwYr3ogog5DGsosB5r/Daw+
   w==;
X-CSE-ConnectionGUID: 4pJGSbhSQ0am/NBpPuzQAQ==
X-CSE-MsgGUID: tvVOLNXeR7SHY8rr/tM5Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64516318"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64516318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 18:35:25 -0700
X-CSE-ConnectionGUID: CcHj9Gl0REiijNeWARLjuQ==
X-CSE-MsgGUID: 7etMVPXBSdG73KPeobVmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="153671273"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2025 18:35:22 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX8r8-0001MJ-2B;
	Thu, 03 Jul 2025 01:35:18 +0000
Date: Thu, 03 Jul 2025 09:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 05f176e2ea7b0e3cf2e543c9c94e46c6ddfc8c9a
Message-ID: <202507030949.MDvXEdjJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 05f176e2ea7b0e3cf2e543c9c94e46c6ddfc8c9a  EXP arm64: enable PREEMPT_LAZY

elapsed time: 1458m

configs tested: 20
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
riscv              randconfig-001-20250703    gcc-13.3.0
riscv              randconfig-002-20250703    gcc-14.3.0
s390               randconfig-001-20250703    gcc-12.4.0
s390               randconfig-002-20250703    clang-21
sh                 randconfig-001-20250703    gcc-9.3.0
sh                 randconfig-002-20250703    gcc-15.1.0
sparc              randconfig-001-20250703    gcc-8.5.0
sparc              randconfig-002-20250703    gcc-13.3.0
sparc64            randconfig-001-20250703    gcc-8.5.0
sparc64            randconfig-002-20250703    gcc-8.5.0
um                 randconfig-001-20250703    gcc-12
um                 randconfig-002-20250703    gcc-12
x86_64   buildonly-randconfig-001-20250703    gcc-11
x86_64   buildonly-randconfig-002-20250703    gcc-12
x86_64   buildonly-randconfig-003-20250703    clang-20
x86_64   buildonly-randconfig-004-20250703    clang-20
x86_64   buildonly-randconfig-005-20250703    gcc-12
x86_64   buildonly-randconfig-006-20250703    gcc-12
xtensa             randconfig-001-20250703    gcc-14.3.0
xtensa             randconfig-002-20250703    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
