Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB5207E1F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064579; cv=none; b=cCJ5dwHUdfVdvY6BITa4vhDedJUTEptI09wo9P5jWzRs91LRSBz+kwq4aYEogjPd+1T38hn/S0fnEsHIiUkXPitGLrYLnF4ACSgQ1lBL9wV+jolyhlpWVagBedNbEtD/P4BTRNJOyy1Lj6hnZkCFXvYGhZ58utvQm5V3sZ0feI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064579; c=relaxed/simple;
	bh=RBYrMhkmSQ2tYHoupKu90V3GYSp2tmR0OaiE+jIfmyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rinJdu0IoMy35Isuv2TEN9zc1oQGMP/MyZwOkBSq/lWdc3yogKCDmZ863P8OhsRtutDPjcyoKcmlDAZeW5+mUdoaemSL3cJRGwrpbEiLczL8ky8arIlmKqOEhpQmf9fZH1Xev/DopDBP5FHN7Ck21DFsM/QCgkKBBAZBwrX1Mq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNXB/fFI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNXB/fFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743064578; x=1774600578;
  h=date:from:to:cc:subject:message-id;
  bh=RBYrMhkmSQ2tYHoupKu90V3GYSp2tmR0OaiE+jIfmyU=;
  b=jNXB/fFIzAhp8sQwxNRojSRKBLzi1GP7i9gxMaad2dIza02XlBVRgfWT
   dvVo7/uagsYTPHFOYFX7VMVNihkzFARl20Ag/vgNa+MuXrWkt4kF0C9OD
   LkbVrk11bPD5zOL+/4VFkLX4K6GBlSuQZ43oohK95k1JOqanZcXPOJMue
   zQybHPeMJxIRUVbTwCzHdbW38Jwzoa66nDzUbemNSYV7BzcjhGsYJUKN8
   CVBuaXSkdGUPDZz0F8KcrgfCfiaBtKtWtCODpKbpkQ++pzfE7I4kmlAJQ
   83hHB9yZaAcm943/DlQqMSvMFnQ5LotgwZEoOvbDVArRUltOF91BQaoVT
   g==;
X-CSE-ConnectionGUID: e9g7ebM8TDy+ogS866RtTg==
X-CSE-MsgGUID: gUTYJeGWSp+aqKgGHui3uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="47120168"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="47120168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 01:36:18 -0700
X-CSE-ConnectionGUID: SKK2RiRjQQaBffVZW9y8Vw==
X-CSE-MsgGUID: tRO1CNteSzSAEXtatf4uQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125038874"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 01:36:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txiik-0006WR-2u;
	Thu, 27 Mar 2025 08:36:14 +0000
Date: Thu, 27 Mar 2025 16:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/tdx] BUILD SUCCESS
 e8f45927ee5d99fa52f14205a2c7ac3820c64457
Message-ID: <202503271621.HKe0CG4f-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
branch HEAD: e8f45927ee5d99fa52f14205a2c7ac3820c64457  x86/tdx: Emit warning if IRQs are enabled during HLT #VE handling

elapsed time: 1457m

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
