Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247391DF987
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369123; cv=none; b=XeTB37FSuMRE9VzpcEV1LtORZd/KV5xsPg+ywfAysyA0svslDXEFvMTpyyNHYvkT7x6Awdm4dmzglAESkdopPg2tsRN2SZMtYDtf/h8WEQSBL9x8DOoM58yBYHeI/o4q1fkOXtiBk8sTd2TkOv9Mep3D+/TjQSLjMTMdRppGN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369123; c=relaxed/simple;
	bh=RSCIxcRAuf5oPKuUwo2kuvg83hzIcA8u8PSKusIY5ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WSvyLrA9IkYRYzAVvxCL8BDwr+wlYxNLidgviRrMym8hwSNJ/ddCIYUutKqkEa1sK2t53HJqBJu02YcogpSu8dZGv5HTWrjVS0P72ImYxDggYdhxeM0RALYvAwd784a9xiiGHso/aSml0hvAtIX5vFWxWpOECXrR0kMpNn+cWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROrNAV1p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROrNAV1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751369122; x=1782905122;
  h=date:from:to:cc:subject:message-id;
  bh=RSCIxcRAuf5oPKuUwo2kuvg83hzIcA8u8PSKusIY5ig=;
  b=ROrNAV1pTWTmgaGTvWsXhSXx5hn+4/Wl143iuZWazhwfMMUacUDQB8N3
   0JmMS0IDMYOJd/cho9beLE/5a4FN5FbiJE0rWw2XDxnAcfscCWhqkrNUG
   5Iao1MNnMMXzkV6A7ymz1ulWuD95r8ITpVtPo/5MBRcn45PVdDuFs2ldc
   a5MfRh/JQ0UQW4LKQYqorSh8JNCqy4cNOnhlj65PcxBVRVpe+byuIYaa8
   fa0XHLhVOQ53UaZscjHpdV6NZ48ZNUJ0+D84Cssq9zLAs6zCKcC4VqsVR
   wl6/hPTTvdVvvb4R+J0+VbcKWGFwSpRZpwAez8B0epxvc31Kw89/A+XJq
   Q==;
X-CSE-ConnectionGUID: PqEAVomoSROrHHvxjkhgzg==
X-CSE-MsgGUID: PvPb5UhSQ9mOFHrRDbK3+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="79069820"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="79069820"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:25:20 -0700
X-CSE-ConnectionGUID: mhNx99mfQkeDAIAYT1Gijw==
X-CSE-MsgGUID: 5RAY5IsLS+e5cFTGjMipOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153520413"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2025 04:25:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWZ6z-000a4f-19;
	Tue, 01 Jul 2025 11:25:17 +0000
Date: Tue, 01 Jul 2025 19:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 cac4d9f5342e6771a76ab8715afe63f74d6b92cf
Message-ID: <202507011945.4f6iJ4t9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: cac4d9f5342e6771a76ab8715afe63f74d6b92cf  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1459m

configs tested: 15
configs skipped: 129

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                          allnoconfig    gcc-12
i386    buildonly-randconfig-001-20250630    clang-20
i386    buildonly-randconfig-002-20250630    gcc-12
i386    buildonly-randconfig-003-20250630    clang-20
i386    buildonly-randconfig-004-20250630    gcc-12
i386    buildonly-randconfig-005-20250630    gcc-12
i386    buildonly-randconfig-006-20250630    clang-20
x86_64                        allnoconfig    clang-20
x86_64  buildonly-randconfig-001-20250630    gcc-12
x86_64  buildonly-randconfig-002-20250630    clang-20
x86_64  buildonly-randconfig-003-20250630    clang-20
x86_64  buildonly-randconfig-004-20250630    clang-20
x86_64  buildonly-randconfig-005-20250630    gcc-12
x86_64  buildonly-randconfig-006-20250630    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
