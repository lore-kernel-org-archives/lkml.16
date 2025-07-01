Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7D34CF5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 23:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751412678; cv=none; b=bsJT6CfSIEwEj8lE7KFuIoBw0hZm78kQLv21X/oQCO1uOhp0vecSOOWlHEvVnZtJRTuulBkXWwXZNbVpRcxWpToMJkqswa50ZbvmwwrXY/l+qhE85KKEYRUCETGJPDVOU74oQZjvlE2iyqBjzhL7lnZ3ygVfsRZVTa3f6Fuxej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751412678; c=relaxed/simple;
	bh=Pk3TZzlNaCUNjsg807H6UlmzN2qpypc53kmEKL98ihU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q3HXqIS5xNuK/BX/JfSmRTQjTvxdWh9vcd5+lPGPV2Lk9UrzLAZzx9xBcGKflAJXZInvw/GkbmunY7mReJW52Kz3N6sL4omR8eulc4xSm6rV9m1s572ewPH1x0bj1WWNSKMYLiX8iDe+5aCuPuiBB0FZODT+kN5LQ2K139JFUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knhGFXfH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knhGFXfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751412677; x=1782948677;
  h=date:from:to:cc:subject:message-id;
  bh=Pk3TZzlNaCUNjsg807H6UlmzN2qpypc53kmEKL98ihU=;
  b=knhGFXfHandrjF1BWTMNiKDW/uwdr4Gvumh1nJStscpQlZHwPHpJWJYi
   i23Omv3EQFw2idgRozp2rDjUTcW8B0tveclJHGICNDq7yGVWZqdYID/9T
   EcIqkBbPrcyMxQa1D3EsKRjtNspNv3x1ky3P49sKzTm1ak4zjsfTigZtp
   wgp3Dkpih1V7t5sSKMqrmOJi875TDfmIVsSKxM1lAkPBRNO0t5B8a9DDt
   PeDdtjnY9ClNY7YL7SvQSUP7eesGutBtN956lj1DTykbVHpIHU5zDFvVw
   r8nLcqmgAci7a4heP48x2/dUrYgY/dTMrp9O6RHMSnjs5udRJKTd2vXW5
   w==;
X-CSE-ConnectionGUID: HB++50jYTQW/WhGUwdNKVA==
X-CSE-MsgGUID: GPmmMJtWSGiI7heg1fWluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53653765"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53653765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 16:31:16 -0700
X-CSE-ConnectionGUID: dRiaXvH2Q8ST4eIdhWPeWg==
X-CSE-MsgGUID: AyxVlUXsTFGdtrPaFBr3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="158466435"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2025 16:31:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWkRV-000aly-0J;
	Tue, 01 Jul 2025 23:31:13 +0000
Date: Wed, 02 Jul 2025 07:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 52e1a03e6cf61ae165f59f41c44394a653a0a788
Message-ID: <202507020751.pKMLPWdk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 52e1a03e6cf61ae165f59f41c44394a653a0a788  x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation

elapsed time: 1450m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386    buildonly-randconfig-001-20250701    gcc-12
i386    buildonly-randconfig-002-20250701    gcc-12
i386    buildonly-randconfig-003-20250701    gcc-12
i386    buildonly-randconfig-004-20250701    gcc-12
i386    buildonly-randconfig-005-20250701    gcc-12
i386    buildonly-randconfig-006-20250701    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250701    gcc-12
x86_64  buildonly-randconfig-002-20250701    gcc-12
x86_64  buildonly-randconfig-003-20250701    gcc-12
x86_64  buildonly-randconfig-004-20250701    gcc-12
x86_64  buildonly-randconfig-005-20250701    clang-20
x86_64  buildonly-randconfig-006-20250701    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
