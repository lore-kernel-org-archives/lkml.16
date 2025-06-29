Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2CC29B0
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 00:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751156186; cv=none; b=LDFlvfWraRUnZaOyq5/AlCR2mcmI6KsDUQ8BwL8d6pgGR8r63heqI0mJUfSHOrYVOk5dE3tyLiWAKHnwsNSeUT8oq5hNo+okzCrCUo+1/GCninJEwoC+t+CP/4/UtWu3VoM9Fh9LCOhZ69++YRVSxIC6wyXJDLFczAvVz1uKlIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751156186; c=relaxed/simple;
	bh=yP6faxjKLgFwvUrE9/QK6m2C1S/Z+EuCD582g6ydedM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CDOjijtQQNj6S3gIDSmcd2w5LF0YALwYVYIelhNUrf1fpidDGRGMLc6hHyFuxRo1oouw77Menhjo7legoKfSgmSbOmUBnr0PIPjT0aZIyW7DTZH9TFISzGFgZcTSBP9o5aUNvecqGlhXifCYsogquP1Ie3XGuvaXWUQPrQIkLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzVZsfkI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzVZsfkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751156185; x=1782692185;
  h=date:from:to:cc:subject:message-id;
  bh=yP6faxjKLgFwvUrE9/QK6m2C1S/Z+EuCD582g6ydedM=;
  b=FzVZsfkI8CMnAr22u2E+3iP97U68LBhGTKWS2RRm5ZjU1El7Kwv+QJ7K
   4icm26Gq1GaV4Esed0BLGFB8aMtO87WMD6zInyCN/MUFLWDEyZASxRH8H
   pKeLcbiTe/PdbDADX863tOPvd19Qe9uyBDH6hVqPZBcDlz5zIyYDQBLU0
   L4ZDDduCmpCzD2zlNIfGzmRsC7DYVeP+TYPUGIABh2VIDjW6sw18ntoDl
   gDQjmm5PpCoaHxooB7LrAsYf6oS94b6/w2sPOQFmIpllrLRjH1/oNeKpM
   qIpB0gj6YgETXsSSfgHigUyDV95puFFHsn5q4eYU2FTi7yLTiPkYRZaDJ
   A==;
X-CSE-ConnectionGUID: nEAgCsAsRvWs/mQRSkEC5A==
X-CSE-MsgGUID: XBs+wLiWT5WyGlXdAYGLZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53548124"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53548124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 17:16:24 -0700
X-CSE-ConnectionGUID: i7OLgd48SNi06DM3EbxD0A==
X-CSE-MsgGUID: VCCO1uPpTNyza0E4WaufZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="152851494"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2025 17:16:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVfiX-000XWG-16;
	Sun, 29 Jun 2025 00:16:21 +0000
Date: Sun, 29 Jun 2025 08:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:ras/urgent] BUILD SUCCESS
 30ad231a5029bfa16e46ce868497b1a5cdd3c24d
Message-ID: <202506290855.fZycPMfG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git ras/urgent
branch HEAD: 30ad231a5029bfa16e46ce868497b1a5cdd3c24d  x86/mce: Make sure CMCI banks are cleared during shutdown on Intel

elapsed time: 723m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250628    clang-20
i386    buildonly-randconfig-002-20250628    clang-20
i386    buildonly-randconfig-003-20250628    gcc-12
i386    buildonly-randconfig-004-20250628    clang-20
i386    buildonly-randconfig-005-20250628    clang-20
i386    buildonly-randconfig-006-20250628    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250628    gcc-12
x86_64  buildonly-randconfig-002-20250628    clang-20
x86_64  buildonly-randconfig-003-20250628    gcc-12
x86_64  buildonly-randconfig-004-20250628    clang-20
x86_64  buildonly-randconfig-005-20250628    clang-20
x86_64  buildonly-randconfig-006-20250628    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
