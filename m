Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B2821C16F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738740248; cv=none; b=FWhyZvEQHfJLM6LyNXm1FvUKxwpmU7fOjVWyC95Vm5ZLjar4iHGTEQtmI80fHMdcIoStQGadn9kGHQO07mw5BPE4fGuG/zLcoAD2z1OVpKLvRghF9h+sZJEyd9aL3wYy9zClz9R5LdRRLUl7HyrQsEF9TYayzqgAf53HiZF+xTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738740248; c=relaxed/simple;
	bh=JJNxobeaCxkBSDe6IQdD5rKIj62SyuCx2ls9RvwTWL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OsYn/dKE/LUQfWJcvC7ZtbLrRgOeEVk7xmP9PWtZiLnhW1R51rjtZppxZlYSd7LObq80yxWkRNjYeWzaSHV1Z8C5X1BB57SwTcuYCT73Bj7rygs+sA45aPnCUgI1PQm7v1wV0oRyGlYGCq6QVzQ6eMW4jZyF1yy7aOWzxWTq88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBPck5cj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBPck5cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738740245; x=1770276245;
  h=date:from:to:cc:subject:message-id;
  bh=JJNxobeaCxkBSDe6IQdD5rKIj62SyuCx2ls9RvwTWL0=;
  b=VBPck5cj76HpSixR9jl7g2cjRLxXcshbekSGuMeusNVD3XfaIMm5xRww
   ntoCZH1Ew9dBc9PtwNMORHSR/qGtcvLnZyZD1H0x10wpr9+E9WnxP7rOS
   RG9VvKcS13z0zV/1JxUClmvuB0MhOAgTOmH/8WLAIlg7InsFTJeCfG3mH
   b7ZIpVTNJkjnjZfv+ITYDG36t22HyHYkSrhwIk4ccElKIGaJYOoCuN8rn
   P0ytDcliDQ/4rmhDN1pqzj1AfzbqnUNAM6LsqxYhcp8hnpNr18hrbmXH2
   gQiAPjYJ7IqTeIy1XA3OU1ZwkPdXJOn8iIZGxIiPxzxO4mA4Ux/uuNr7+
   A==;
X-CSE-ConnectionGUID: A9u6RppnQti173giNy7tCw==
X-CSE-MsgGUID: JiaqgVPcQ7ODdUGM/dEz9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61761632"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="61761632"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:24:04 -0800
X-CSE-ConnectionGUID: zR7cvDzYSUCHNAIx+ipiYQ==
X-CSE-MsgGUID: VLeFfqamR+WAduSFgM/X2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="110707777"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2025 23:24:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfZlQ-000tb1-04;
	Wed, 05 Feb 2025 07:24:00 +0000
Date: Wed, 05 Feb 2025 15:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/misc] BUILD SUCCESS
 e3cd85963a20d2b92e77046a8d9f0777815f1f71
Message-ID: <202502051559.RFuAWyz8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/misc
branch HEAD: e3cd85963a20d2b92e77046a8d9f0777815f1f71  x86/mtrr: Use str_enabled_disabled() helper in print_mtrr_state()

elapsed time: 795m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250205    gcc-12
i386    buildonly-randconfig-002-20250205    gcc-12
i386    buildonly-randconfig-003-20250205    gcc-12
i386    buildonly-randconfig-004-20250205    gcc-11
i386    buildonly-randconfig-005-20250205    clang-19
i386    buildonly-randconfig-006-20250205    clang-19
i386                            defconfig    clang-19
x86_64                        allnoconfig    clang-19
x86_64                       allyesconfig    clang-19
x86_64  buildonly-randconfig-001-20250205    clang-19
x86_64  buildonly-randconfig-002-20250205    clang-19
x86_64  buildonly-randconfig-003-20250205    clang-19
x86_64  buildonly-randconfig-004-20250205    gcc-12
x86_64  buildonly-randconfig-005-20250205    clang-19
x86_64  buildonly-randconfig-006-20250205    clang-19
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
