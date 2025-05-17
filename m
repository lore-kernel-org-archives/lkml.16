Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B19B67A
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747443048; cv=none; b=GOz90MUs00TO7NiLrUfrpseM0/qMIlqL50k62M/lvGjNp29Dti6a7KRArodQ2rbLdx6hNON2fbPuvYrIyES7S56PYO3T7Zh6iZbiwg3cdheTfr1gYhCkiWYuWQrGlvVxz7N4c4tdSbGwjfzgRnkpcTvdCsb3nBimWc5mA6rnlFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747443048; c=relaxed/simple;
	bh=odnr47MXtSwQd+ZGd3pnhxHTnO5aWal5RWy5Bf5qs+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JxL8IfKB9FOV+KEu6U+AVAJqLAr87SGDPwPMeKfpl17bcRb5OOlfBNdYnHIcLfgURyCgC/IGrwPwNLgRhYakLW2K7XRR3YLknZnFzbmVIYk+z4cJGUbX8YtE1tHMxgRTQUfLIpRJjh4u3oE/gAGVnszJLThwDgEe55+T26B3yuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9NBsAC/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9NBsAC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747443046; x=1778979046;
  h=date:from:to:cc:subject:message-id;
  bh=odnr47MXtSwQd+ZGd3pnhxHTnO5aWal5RWy5Bf5qs+Q=;
  b=j9NBsAC/af2BpnO5yOud7LQ60V1fv9nuVIePTC21bcXvOjNZ4bF+aMWx
   GKdVXeoRQcZDFmxQkPBrSCg7jrrhjOYYOAKRdNIhCTsFEewUnEYQzqJzW
   wBc+AS2boN/jKBwk5kkjzcv8PPOMqijd8MVN4NrlpPg+oDUZQ0hmqZiXp
   RvYCsAEOvgVkGC4Uccooc7KZRDijXDJZ+mOpBt9CLJokjZaCqAQOWuCGH
   1iPIG1OHrqV3RGs9M5N6XINh+wCFAIt7Ox6vD0XPhAYOS1GgCVe+v7kmH
   B3Ef0L9FxzRqSaZ9fffGd00++F6mbSlHAhuKJtdXbBHUNg7fjmh5yI29o
   Q==;
X-CSE-ConnectionGUID: V/rSr6vfQBC1ztnK/rza5Q==
X-CSE-MsgGUID: k+0MMa17QXW5QNJLn3No3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66977640"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="66977640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 17:50:46 -0700
X-CSE-ConnectionGUID: RlszXTlKQWiXxDL11HUQLQ==
X-CSE-MsgGUID: bYLqPjBrS1iGeJhVQU2+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="138585650"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2025 17:50:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG5lC-000JpL-2K;
	Sat, 17 May 2025 00:50:42 +0000
Date: Sat, 17 May 2025 08:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 03680913744de17fa49e62b1d8f71bab42b0b721
Message-ID: <202505170838.J8FPVkz5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 03680913744de17fa49e62b1d8f71bab42b0b721  x86/mm: Remove duplicated word in warning message

elapsed time: 836m

configs tested: 20
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250516    clang-20
i386    buildonly-randconfig-002-20250516    gcc-12
i386    buildonly-randconfig-003-20250516    clang-20
i386    buildonly-randconfig-004-20250516    clang-20
i386    buildonly-randconfig-005-20250516    clang-20
i386    buildonly-randconfig-006-20250516    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250516    clang-20
x86_64  buildonly-randconfig-002-20250516    gcc-12
x86_64  buildonly-randconfig-003-20250516    clang-20
x86_64  buildonly-randconfig-004-20250516    clang-20
x86_64  buildonly-randconfig-005-20250516    gcc-12
x86_64  buildonly-randconfig-006-20250516    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
