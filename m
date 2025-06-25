Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468325C70B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853559; cv=none; b=CxcW/KrIcFEMt5jER7L2SQW1QRxXjTmWZXWp6E21yhO4H9PyJ0A16VD8/c3pZ7Lx8A2ES0lWHPad2v+sYLkTR9OqJbeQjsmLI5/qHPD53KE/QPdAMYf1kyYWMl+L+t+zFJEb1bjEncCl4ZFmCcyiwIR3Z6kSlj/7qyfq/c5rEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853559; c=relaxed/simple;
	bh=OG6iglHwuZPN4lsAD7h77WWlJ4aVL5F1h5FAD7twguQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=et/RwEGIFsIw0roOwyFzyt2wDzNDdKhcixuZesi7gIZ2b/HM0z7MGqC/N1/IZ0rtF6lKiREt9bKxkboyt+JwEYSo8WiNswwgq5VZTFraKNhvCSTcj5/zcOToxd8kDb8AfQFAUDbWkH0nEuSpbRK82BbbdbTV8wGmVFFC68HMOYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M94lx1yl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M94lx1yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750853558; x=1782389558;
  h=date:from:to:cc:subject:message-id;
  bh=OG6iglHwuZPN4lsAD7h77WWlJ4aVL5F1h5FAD7twguQ=;
  b=M94lx1ylPGVrZBYRkm4TLLRmVazqU5XUIyJD8bbCVqxWHlhIQmUe76Dl
   00/8+cLSl8664um256ikKnEyFLchQ/GGjPwS4onNCvzHz00iw32ASKunR
   yAsbK0zeY5IYZ2KZZesqd3e9KN6x9W4VkJ0QFhwdhoKwyHSn88Oj7ilcY
   Vzw2WE9YlzLPIAeeNh3bxtiTkq26MOuXZLjcowfFtGZxAvC9zfPeTaUaP
   D35a/KoNAOVUvAE5fBfhKlqRs0MmFDmvSPpYTvHjsG063uy3YR9V4luES
   82oWv7AaHdpiqInmNItHvt/Lq8tFXuRU7DD9IkdKIQochf4Y6hcbtFrg5
   Q==;
X-CSE-ConnectionGUID: u8ZEnNcCSDKj5B/GjabbUw==
X-CSE-MsgGUID: SSF/Uj+NTAya5M5B3L9tHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53186245"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="53186245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:12:35 -0700
X-CSE-ConnectionGUID: QyiKVaRZSymN2h711R87yQ==
X-CSE-MsgGUID: CRTUEbC4SSuXfb4v4Td1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156774243"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2025 05:12:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUOzP-000T5K-2q;
	Wed, 25 Jun 2025 12:12:31 +0000
Date: Wed, 25 Jun 2025 20:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 fa7d0f83c5c4223a01598876352473cb3d3bd4d7
Message-ID: <202506252044.cyLATCnO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: fa7d0f83c5c4223a01598876352473cb3d3bd4d7  x86/traps: Initialize DR7 by writing its architectural reset value

elapsed time: 938m

configs tested: 37
configs skipped: 58

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-15.1.0
arc                              allnoconfig    gcc-15.1.0
arm                              allnoconfig    gcc-15.1.0
arm64                            allnoconfig    gcc-15.1.0
csky                             allnoconfig    gcc-15.1.0
hexagon                          allnoconfig    gcc-15.1.0
i386                            allmodconfig    clang-20
i386                             allnoconfig    clang-20
i386                            allyesconfig    clang-20
i386       buildonly-randconfig-001-20250625    clang-20
i386       buildonly-randconfig-002-20250625    gcc-12
i386       buildonly-randconfig-003-20250625    gcc-12
i386       buildonly-randconfig-004-20250625    gcc-12
i386       buildonly-randconfig-005-20250625    clang-20
i386       buildonly-randconfig-006-20250625    clang-20
i386                               defconfig    clang-20
loongarch                        allnoconfig    gcc-15.1.0
x86_64                           allnoconfig    clang-20
x86_64                          allyesconfig    clang-20
x86_64     buildonly-randconfig-001-20250625    gcc-12
x86_64     buildonly-randconfig-002-20250625    clang-20
x86_64     buildonly-randconfig-002-20250625    gcc-12
x86_64     buildonly-randconfig-003-20250625    clang-20
x86_64     buildonly-randconfig-003-20250625    gcc-12
x86_64     buildonly-randconfig-004-20250625    clang-20
x86_64     buildonly-randconfig-004-20250625    gcc-12
x86_64     buildonly-randconfig-005-20250625    clang-20
x86_64     buildonly-randconfig-005-20250625    gcc-12
x86_64     buildonly-randconfig-006-20250625    clang-20
x86_64     buildonly-randconfig-006-20250625    gcc-12
x86_64                             defconfig    clang-20
x86_64                                 kexec    clang-20
x86_64                              rhel-9.4    clang-20
x86_64                          rhel-9.4-bpf    gcc-12
x86_64                        rhel-9.4-kunit    gcc-12
x86_64                          rhel-9.4-ltp    gcc-12
x86_64                         rhel-9.4-rust    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
