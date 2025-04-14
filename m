Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B691CAA6D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660731; cv=none; b=ax1vW4Tclrt9CWIEGAkUBGTbqwqCb5kpR5BxWIPTmofISdzbmlqjV4uiEVknowBBw6LM31DMb4gDo2dhBL+FeYBzX6sg+vR6e9xqFmToBMdTKAKrod0fhiBeYUHXfgYUDp5V4EDx+SnLmRc1/t5Jzfmlu0NyBqCVAS+6Otm+uek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660731; c=relaxed/simple;
	bh=FYgPdynSCureL0fU9D9Mi9LejkOb9t0Yp9qg3b6/Ubw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ljNSbtc4NXTAIg3QO5mysNHqp9MHJQQVy0mN3jnYlGsZxMzia6OoN5KkW2Zvayy8xu8XvgkuJn4r8WP8Ixobq1tvxQkYNjvaxELZWxiRyenGatMsOiVcARk4thzkm/N+VHDYsisLgc3HzhyX0GaKp9AIe4V4Nqqt7L1oND7YLvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLJCxeKX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLJCxeKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744660729; x=1776196729;
  h=date:from:to:cc:subject:message-id;
  bh=FYgPdynSCureL0fU9D9Mi9LejkOb9t0Yp9qg3b6/Ubw=;
  b=PLJCxeKXNqPKgbj9Ryeeo7liaIL54/5DWjhxTo9vkO89YzHnnV/GbFmb
   PM9zPB+KLzWoyywtko935Oe9vVIHj41uftfC0Qx0eumjADvA5dT+RZhCp
   MrbHh6aas1pODFYSIoasKAFcQ9jxLNY19rIW7UDGX3jRhN9H7h+AmoVxO
   H1Rn7X2qO9NHnUxrnuMyp78U/8DCy0QgSr85f3qgdolxa/A4buzP/2jmv
   kx9VAsK021q40/65tgdh0wNMICo3SY968oM9AgmDG/WqDWm2KTHqgnGiz
   plvvvso2MsXOnxb2d7dfq7rzE6my1/uNafdd0hvJelm6HExhdzr8BLvAH
   Q==;
X-CSE-ConnectionGUID: M/AoLbaWQIuK3Ld7fS98/A==
X-CSE-MsgGUID: +dk9YnvYSxaghvNf7AaEwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789762"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56789762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 12:58:49 -0700
X-CSE-ConnectionGUID: rof42BvvQRKBeXAS5yruIw==
X-CSE-MsgGUID: 9uTbePMdRmq1KQDNCEfw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129675901"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2025 12:58:48 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Px7-000Ede-1t;
	Mon, 14 Apr 2025 19:58:45 +0000
Date: Tue, 15 Apr 2025 03:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/core] BUILD SUCCESS
 5c3627b6f0595f1ec27e6f5df903bd072e9b9136
Message-ID: <202504150312.UgJD9reJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
branch HEAD: 5c3627b6f0595f1ec27e6f5df903bd072e9b9136  perf/x86/intel/bts: Replace offsetof() with struct_size()

elapsed time: 1472m

configs tested: 25
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250414    gcc-12
i386       buildonly-randconfig-002-20250414    clang-20
i386       buildonly-randconfig-003-20250414    clang-20
i386       buildonly-randconfig-004-20250414    gcc-12
i386       buildonly-randconfig-005-20250414    gcc-12
i386       buildonly-randconfig-006-20250414    gcc-12
i386                               defconfig    clang-20
powerpc                    akebono_defconfig    clang-21
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-21
powerpc                mpc834x_itx_defconfig    clang-16
powerpc              randconfig-001-20250414    gcc-8.5.0
powerpc              randconfig-002-20250414    clang-21
powerpc              randconfig-003-20250414    gcc-6.5.0
powerpc64            randconfig-001-20250414    clang-17
powerpc64            randconfig-002-20250414    clang-21
powerpc64            randconfig-003-20250414    gcc-6.5.0
x86_64                           allnoconfig    clang-20
x86_64                          allyesconfig    clang-20
x86_64     buildonly-randconfig-006-20250414    gcc-12
x86_64                             defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
