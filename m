Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335901C6BE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315036; cv=none; b=kHYSIBpEZ5FQVf423TDT164rkIn6QLzEIpCI0L9FDoSyaWj/FmdPDgHWyso5DWyEWn4MwJyR67ZK/H2tP64L7KxTJd/KsfBoa2rY+Q6UeTjJzr1PmTa4rPpQpBMS1RESJstuZbWm77M24dVwv0YeoIafBIjfzvzm+Kt7LnSMlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315036; c=relaxed/simple;
	bh=wy9fTxqtoO5R+aq2dri+RiJcXqCY1P1ZXdLchJddXj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YcMVYzI+S1EBIL8UFl/0eH93zBwAUfa65Bod9pYFN1WI2keAP3OJF/+nXx1+tneO7Z8uZUjdzzCbAZw+V3y+dRWCGCylyaMb6oW39SGy+rZOsO7OJ4zKaE/adlI32uOKQizrT8axhXQbt/4BSAIQRS9EC1EZP6I+ea+dyw5uS6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmncZmxd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmncZmxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744315034; x=1775851034;
  h=date:from:to:cc:subject:message-id;
  bh=wy9fTxqtoO5R+aq2dri+RiJcXqCY1P1ZXdLchJddXj8=;
  b=lmncZmxdaMehjF4fnheZskuyd8jl6vlQptwpcnxUK7gO9DffloFRBmIM
   xn0rFNl8XRQXn1VS3U8hGnMGhCtzkdvBZ5vpy2itLF1067t2FQAZOZ0oY
   qnyKoHIOIzsPPdYP/RFGgogiGr1tDfIfvgNRdeLseQ7D5bf+3uaLg8Xxl
   lAc7SNbIHBadKhkBM6N7LhH68T4kEUw4IKGwiqvxiDHdwk0zRUJoBX3tO
   v+S3Bfx//HNQYLb/09gbv9L4pUTtaL5nCkPJjBDJjOYWr8wxW45WPhQbI
   r8//Q/a5jSR4BKeeLe0ik2rUoXPFJLH9J0bx8d4NDc6jV6zwpYOto9KIy
   w==;
X-CSE-ConnectionGUID: xMJGa7jGSh6bN4R6Nw1GVQ==
X-CSE-MsgGUID: i2tU28abSJeWJSG/0tcceA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="33467159"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="33467159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:57:13 -0700
X-CSE-ConnectionGUID: oLZi/QHAQeSC2EqcxEF7/w==
X-CSE-MsgGUID: 4JjB/TV8RUCLeXOiYzXl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="159971204"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 12:57:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2y1O-000AUb-1U;
	Thu, 10 Apr 2025 19:57:10 +0000
Date: Fri, 11 Apr 2025 03:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 1fac13956e9877483ece9d090a62239cdfe9deb7
Message-ID: <202504110352.8KHej0zw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 1fac13956e9877483ece9d090a62239cdfe9deb7  x86/ibt: Fix hibernate

elapsed time: 1462m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250410    clang-20
i386    buildonly-randconfig-002-20250410    clang-20
i386    buildonly-randconfig-003-20250410    clang-20
i386    buildonly-randconfig-004-20250410    gcc-11
i386    buildonly-randconfig-005-20250410    clang-20
i386    buildonly-randconfig-006-20250410    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250410    clang-20
x86_64  buildonly-randconfig-002-20250410    gcc-12
x86_64  buildonly-randconfig-003-20250410    clang-20
x86_64  buildonly-randconfig-004-20250410    clang-20
x86_64  buildonly-randconfig-005-20250410    clang-20
x86_64  buildonly-randconfig-006-20250410    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
