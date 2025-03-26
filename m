Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FEA19D88B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743027454; cv=none; b=n+9Y+PvQEwCd8gZhtLWHX9FyUM2owG8GaK+Q8wko2MzF9oVrXuQiBAVRzE++pqiYL+8YbJn1/F4Fo/vro7iSpO3O/HWMtrAeG9KclkLh3Q6qnHNsfW83xlQWgHjEYGlzZ/tsiC0hxk9tXEGnjo1WUDOB/UdbZxoaclAcjbvwf4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743027454; c=relaxed/simple;
	bh=0/mbINWzm5w7ZZuAByidfAmTAHs4CoyB7y716YB2WXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rGlS9g5BkkubsO8k063Lt6oBPMR6J3fA1aN5LetIFjtRgyp5jaku1vzPaFpognBvoRhGcqtXRkx3Udqyh07J6fJIClo8s+BLcoXjjRlIsKYTyShttNwfGaxsqokQfEZ7sxV+A/hLk1qwR6M0TK9RIQR/Ak94S26d16EP4vlg2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M90avTcq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M90avTcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743027453; x=1774563453;
  h=date:from:to:cc:subject:message-id;
  bh=0/mbINWzm5w7ZZuAByidfAmTAHs4CoyB7y716YB2WXQ=;
  b=M90avTcqvf3wm7dGvXd7JBL5TDjix0UINpz3K+qnL3Y3qy/8mw1WqOTF
   CWdG11+LsFL8ST8s5/SGis+55WmjKwbIwwK81Om0M5Z0MO2F10DLs3KKa
   JAlr4zmtcF7uVC9/850uZ8HMoTCxeuyfqtTj9jwB2R8JLgG+FGVZUoUoA
   1iuoCIrmewhpBNNWnk/xte2kY2pjIoefi2dGT5t0LqTh6JfiwBDVfFBEd
   GyBwQZIqUml7JZWZShXIkj0w/zUlWEsezmopJTjCdjmL45r04bnZgZWyo
   rSdLIaGKrPX+sDU7HFwYV0oA2vi7eeFKwGsBycstzSJjFABSvQHy/nwCR
   A==;
X-CSE-ConnectionGUID: zJNZDaDlTL+upxd+jGSTzA==
X-CSE-MsgGUID: /Fqb/QwUT56eiOiNaTBoPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55337665"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55337665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:17:32 -0700
X-CSE-ConnectionGUID: 0PzLTFNzTf253qQZJ7DPqg==
X-CSE-MsgGUID: CCcKltZfR1yqLCFQg4RNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="124936849"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Mar 2025 15:17:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txZ3u-00067v-1h;
	Wed, 26 Mar 2025 22:17:27 +0000
Date: Thu, 27 Mar 2025 06:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/asm] BUILD SUCCESS
 0717b1392dc7e3f350e5a5d25ea794aa92210684
Message-ID: <202503270608.6NWxibY6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
branch HEAD: 0717b1392dc7e3f350e5a5d25ea794aa92210684  x86/bitops: Use TZCNT mnemonic in <asm/bitops.h>

elapsed time: 1448m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250326    gcc-12
i386    buildonly-randconfig-002-20250326    clang-20
i386    buildonly-randconfig-003-20250326    clang-20
i386    buildonly-randconfig-004-20250326    clang-20
i386    buildonly-randconfig-005-20250326    gcc-12
i386    buildonly-randconfig-006-20250326    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250326    clang-20
x86_64  buildonly-randconfig-002-20250326    gcc-11
x86_64  buildonly-randconfig-003-20250326    clang-20
x86_64  buildonly-randconfig-004-20250326    clang-20
x86_64  buildonly-randconfig-005-20250326    clang-20
x86_64  buildonly-randconfig-006-20250326    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
