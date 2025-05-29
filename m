Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682C9374D1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748495613; cv=none; b=aZCjt4ynWKZK3LLvUVgWpC2OXksa2AxZgdCE53MF+Fvvc6rsmds6B+bF+G6+H9cAJ2DZO59/KWIbkKZb4l3nEs+Os2hjmfz8TATAZlVcpJEYC7gAH/VyWd8pkZ+EyWskfUA2vwNmaxfg8Z8bDxesbSe2Tt7Hww+8vmRlf9c5SX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748495613; c=relaxed/simple;
	bh=sdy9raesR2rMFYfXKSZsjWAAtaiqGVpvj9672SeePU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QJ4uGf+RTU5Vk6rSZBBs0HTT6myVcyGSPC57aiRvIWCISf9g4grBoYoy9iJ8zrSefmxGj+yTymp9X/Tj+SHcoBfC2O4KluRN05sik4admxt7LtnBe0kf4V6pbkDrhrB+YlKJ2SbIDfk/SKQkO8z9evJtgNai5JYXI/kCqF5UplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4A8jbNU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4A8jbNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748495612; x=1780031612;
  h=date:from:to:cc:subject:message-id;
  bh=sdy9raesR2rMFYfXKSZsjWAAtaiqGVpvj9672SeePU0=;
  b=B4A8jbNUpCTeR7ENemFnJNjW5sfORm8OUr6jv146vg3Q/jIl6/RuFwzU
   xQ7DfFnQcgYpxvuCP5dCBG2ag+VejSPlIiChias+MiA13H6bwO8W4RXQJ
   Gg3aQECGl1ug3E8c2Jbxim1qcLNmJPLwxSG4L1Zwf8izbn0wqXHYVgePZ
   GUxyGFNhha6WG9XN++RyJ/RivFjbaTORAPT26GKXES1N3emgii7VLWFkm
   +M/D7X+7DI4DKnPydlerXZWnYD0ZmIThZBMnWn2EFxVK/AdupjCzd/19S
   wvfMgrM0obIqY/ICCV97NNKJ2p40kam3c5/lxsyEfzph0yDgDIFUJCd6h
   w==;
X-CSE-ConnectionGUID: 4E7NEciRSWS+Fu12jetIIg==
X-CSE-MsgGUID: zno7+ywaQwuq1ablhWGEiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73073699"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="73073699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 22:13:31 -0700
X-CSE-ConnectionGUID: wOVZHKNpQsGv8kX38D7Y2Q==
X-CSE-MsgGUID: 3lXQUZUXQMSCAvWadicMTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143424744"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2025 22:13:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKVa4-000WLO-15;
	Thu, 29 May 2025 05:13:28 +0000
Date: Thu, 29 May 2025 13:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 485d11d84a2452ac16466cc7ae041c93d38929bc
Message-ID: <202505291356.3ujYvNCv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 485d11d84a2452ac16466cc7ae041c93d38929bc  Merge branch into tip/master: 'x86/sgx'

elapsed time: 1234m

configs tested: 20
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250528    gcc-12
i386    buildonly-randconfig-002-20250528    clang-20
i386    buildonly-randconfig-003-20250528    clang-20
i386    buildonly-randconfig-004-20250528    clang-20
i386    buildonly-randconfig-005-20250528    gcc-12
i386    buildonly-randconfig-006-20250528    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250528    clang-20
x86_64  buildonly-randconfig-002-20250528    clang-20
x86_64  buildonly-randconfig-003-20250528    gcc-12
x86_64  buildonly-randconfig-004-20250528    gcc-12
x86_64  buildonly-randconfig-005-20250528    gcc-12
x86_64  buildonly-randconfig-006-20250528    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
