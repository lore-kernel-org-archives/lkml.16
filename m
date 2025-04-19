Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA3647
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745068774; cv=none; b=T0m/owrcd7vKTYVpr6+ispTFpOhEewdKeb5nQSRDdSFre3PwGLFQia2LUPzDNdZQJS2IvA7sg2lOH/WZID1BRi+XmkN/i2reR6KOPgNETanjcSXbFgmIsigAUzr3yhq12xWW8kC9StVKVQ0he+wiEfF0hHa6/Aa2efUKiq6JDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745068774; c=relaxed/simple;
	bh=K5tO5djKNZk+IcN7/xs4row43mHue7S758+e1bazLDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M37K5w8VJtcUtKuBfI1UP16pOtkFT2C7686r82pjhcy9pMLTz+SiK+qbigjb4GKBJrLQjFvsn/Ba2j9fdy7w+8AbgQ3akRDjJRKQQZEYndiuAo6MxbNQQHIHrUMdxjIqUPn1q/YC1gG9/kSQmyOcSe8W5Ci7lK3557LIBdUEGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQENs9q+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQENs9q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745068773; x=1776604773;
  h=date:from:to:cc:subject:message-id;
  bh=K5tO5djKNZk+IcN7/xs4row43mHue7S758+e1bazLDY=;
  b=CQENs9q+Mqf84GCMyhQ4PhU/HzdkScSdytS3mCIgqZsL0QEFap6XDIaQ
   edzFLMkDTkGD5iIwovyrSAKLNIjBUsyZaMECBGeJnPrUPNjVCFOksJbDT
   zHFzt0LtEMrLFWsIdkmQiaO8FyUqAWKiONkXmIRmX5Nflfr0O53wEFVUK
   CKtC3SfMDmLbMaQli8RevtYbR9RAEHFrxjGGKE0Trp3BORTn/rbyLZ3AY
   YAVBJ0AgnTuXqpgZ0VNzS6PvgxOAdJkUGqgvOjm27Np7QXqMtjvPGwHxV
   4MRhuJXWl2O1kOqoAnTtvr8cL+M9u7o78l1llZzSJ0co2ZqsWjQy9K6oJ
   A==;
X-CSE-ConnectionGUID: 7uLTs7tLT8au5uPJL5vfXQ==
X-CSE-MsgGUID: dglJpILtTwa8Ff8129ejzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46593023"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46593023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 06:19:32 -0700
X-CSE-ConnectionGUID: Xx54CH+kTHC4YbTWBe781g==
X-CSE-MsgGUID: nUZcmkIjQuaQlj4482Bwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131340836"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Apr 2025 06:19:31 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u686S-0003sp-2A;
	Sat, 19 Apr 2025 13:19:28 +0000
Date: Sat, 19 Apr 2025 21:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 d54d610243a4508183978871e5faff5502786cd4
Message-ID: <202504192140.PHYtBhMM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: d54d610243a4508183978871e5faff5502786cd4  x86/boot/sev: Avoid shared GHCB page for early memory acceptance

elapsed time: 1446m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250418    clang-20
i386    buildonly-randconfig-002-20250418    gcc-12
i386    buildonly-randconfig-003-20250418    clang-20
i386    buildonly-randconfig-004-20250418    gcc-12
i386    buildonly-randconfig-005-20250418    gcc-11
i386    buildonly-randconfig-006-20250418    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250418    clang-20
x86_64  buildonly-randconfig-002-20250418    clang-20
x86_64  buildonly-randconfig-003-20250418    clang-20
x86_64  buildonly-randconfig-004-20250418    clang-20
x86_64  buildonly-randconfig-005-20250418    clang-20
x86_64  buildonly-randconfig-006-20250418    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
