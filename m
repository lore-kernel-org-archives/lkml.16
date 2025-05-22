Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1919ABDE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907252; cv=none; b=MzHjDyt7kgz6sJz3RlNyLrvk3oVJK+OWxYs3RBXS8RYOaM7fBYMyGaMCz0yrSG2FuxDZoZNbjr2ZIJYz55BEE0CWWFp6moXMUVZxF3tSkWsVHkCmsnrChey6sv/xjMylTht2UIAEnnbq1rD08vzR0oaeJ+Y4Zfxasc/mlZZGwDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907252; c=relaxed/simple;
	bh=KG+s4PtaPgSpBFVQKiFr3oBf0P0d1Ti4Oj0Puwts4+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n+rzFJNlGAV42CntvdhTfrLzeZDrifZ6tUBHtvttgOzhuHdXPpakaiT39Mg0X4PuzgADPqOtgQ4KQy0+dZda7yeyVCziyxeEFrZDMsUhFG20QlHb4MTK2quUoCL+McWELz9r2RWoAK2RxhPXr2/Dg8vG/83MYBYX7exHZ2OXJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLoARL14; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLoARL14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747907250; x=1779443250;
  h=date:from:to:cc:subject:message-id;
  bh=KG+s4PtaPgSpBFVQKiFr3oBf0P0d1Ti4Oj0Puwts4+I=;
  b=FLoARL14BWzkAkwb6eKkm8kVFKYMdz8U5S9k4LyV2vpf0PVf6xd6UCF3
   ZveXYoWp+YDcXF9/bO8txc7uSSeVpf1SfSzEBGKGixyGjns0LI78hdZpQ
   4JAKnw9UM5d1cNlAcB56aEFTlQsc8bKCLZwBvAaVrP3ZG1Rkq/LgmuPve
   gVkidPjVTnMPDTISH5e6KImNNXrzFK50jEqKMrZIuJJtN3322ULmnN1gj
   dh1cAthGUMQ3Q4CrbqPp+56nlID3/vswCzqPHg4rP9/Vn8RA4A/hcr9in
   va3IVw7kauRzTbc0ozQ3H6fC2/f5etNXqc3FMbdyfJwVZMQndEXQLmDDX
   A==;
X-CSE-ConnectionGUID: i9GF/Y1jTiSOyy+hzZ2UEA==
X-CSE-MsgGUID: UhT9HgBARKWTN4w3PrYFRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50025396"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="50025396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 02:47:29 -0700
X-CSE-ConnectionGUID: Sd8YD10bTkC5mJSiYEtDnQ==
X-CSE-MsgGUID: 3D9+ih0fSH2G2p6bICUB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141044026"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 May 2025 02:47:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI2WM-000PBM-0f;
	Thu, 22 May 2025 09:47:26 +0000
Date: Thu, 22 May 2025 17:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/core] BUILD SUCCESS
 6a7c3c2606105a41dde81002c0037420bc1ddf00
Message-ID: <202505221713.V97AdmW3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
branch HEAD: 6a7c3c2606105a41dde81002c0037420bc1ddf00  x86/bugs: Fix spectre_v2 mitigation default on Intel

elapsed time: 1395m

configs tested: 20
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250521    clang-20
i386    buildonly-randconfig-002-20250521    clang-20
i386    buildonly-randconfig-003-20250521    gcc-12
i386    buildonly-randconfig-004-20250521    clang-20
i386    buildonly-randconfig-005-20250521    gcc-12
i386    buildonly-randconfig-006-20250521    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250521    clang-20
x86_64  buildonly-randconfig-002-20250521    clang-20
x86_64  buildonly-randconfig-003-20250521    gcc-12
x86_64  buildonly-randconfig-004-20250521    gcc-12
x86_64  buildonly-randconfig-005-20250521    clang-20
x86_64  buildonly-randconfig-006-20250521    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
