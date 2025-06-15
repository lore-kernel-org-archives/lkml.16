Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339035223
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 00:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749947816; cv=none; b=nYqWBN5cDxY2A/Aim0jUaNKijkgCTbyGt0T08ApXGsZvUbosuCRfVz6MgXODj+5jAJpuAiSnew65oVIHBQC9BbcOqwWwpGdzgvsThQHmzWPpmepp1oGOdAuxvMlRyABTBYOLdCeyvd2h/ThdX+7eNIm4cFCbquaFBmy6s4WLd00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749947816; c=relaxed/simple;
	bh=6GbgSW7Usw4qVjZhX78O4T3BeGtz++8wivUThNXPM7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DM2EbVejClC1vKQh3maII2yVEiWxHX3fi2K62R+6frGX48QSyMZi7iVIucHDuDawG02RY2PuVl/+cMcAJV3f3Tfrdr6sLFgr+mlmbp966YwhoybJrJM5E6uyVQJL2KuRj+Ewituis8xfrbPfWCtIAhhZKTjSz0E7NP55qLN1LBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRtlA8ts; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRtlA8ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749947814; x=1781483814;
  h=date:from:to:cc:subject:message-id;
  bh=6GbgSW7Usw4qVjZhX78O4T3BeGtz++8wivUThNXPM7Q=;
  b=HRtlA8tsFenAmRrn4sRmKT7isNixdJFUenB6vUh8upkBEpIu1UDam8et
   y58PBiRTo5g2/6Z7mQ949fTP/WjkrEk2f2+GTyOToVrbJyZAtGFCw3ajr
   aNhH8mb69D/MaABkrWS03gVpas96jw3AMlK6MiKb5rpjOQK2SkzjD8dM6
   TrMnFpv4GuMEI6OWHYwnO9fIjd/9+YuAZ1yEjosCedJh8RTDUJXWv37iL
   eFb3s+igJtE9tBkp+bjaFr5nRcIL6/xXNUUeKJp/k3Xyde0gEROTREzHq
   0B2QHYYMbqcMuQVMMKECNgmA/8X6dl8mSEKRBiFtt/+cmchxUZtpUbeX4
   g==;
X-CSE-ConnectionGUID: EKbGQ80+TEuSdwCW+80mVA==
X-CSE-MsgGUID: SOnLrg4TTzacGHhXp2OgUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55929045"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="55929045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 17:36:53 -0700
X-CSE-ConnectionGUID: P8WDGkJWS4qUSwi50s+VDA==
X-CSE-MsgGUID: lrWSWLmhQ5ShyMtQ+DZn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="149023331"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2025 17:36:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQbMg-000DzO-0T;
	Sun, 15 Jun 2025 00:36:50 +0000
Date: Sun, 15 Jun 2025 08:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/kconfig] BUILD SUCCESS
 7ce421edd9fc5a762aeb625cc682cb793ec859d7
Message-ID: <202506150817.I4bUQcfL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/kconfig
branch HEAD: 7ce421edd9fc5a762aeb625cc682cb793ec859d7  x86/kconfig/defconfig: Enable CONFIG_DRM_FBDEV_EMULATION=y

elapsed time: 1015m

configs tested: 20
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250614    clang-20
i386    buildonly-randconfig-002-20250614    clang-20
i386    buildonly-randconfig-003-20250614    clang-20
i386    buildonly-randconfig-004-20250614    gcc-12
i386    buildonly-randconfig-005-20250614    clang-20
i386    buildonly-randconfig-006-20250614    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250614    clang-20
x86_64  buildonly-randconfig-002-20250614    clang-20
x86_64  buildonly-randconfig-003-20250614    gcc-12
x86_64  buildonly-randconfig-004-20250614    clang-20
x86_64  buildonly-randconfig-005-20250614    clang-20
x86_64  buildonly-randconfig-006-20250614    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
