Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1AD22E41F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847305; cv=none; b=eBN8dA928iVBq5Teaute1Rxnd9sbKk9PbLHZJrfLLX8k8RB/EmkMyTdgtELsoqrutk2yGjSjxYn5WOzc+pBMKeRZgOZShzz3C+K6/lKWJlzlmMw9u4rDYkcQjdVF74wKoQsj3GN38NVU46DNcKhW8f1quWBV5DXjmaQtgFY7oK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847305; c=relaxed/simple;
	bh=L6W9b9CcAfJ/cXaIET2L9xKZvrWoVgu3bEQ3Wj6HnQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OZNifnhJ9qUKVRIJAiA9G9YHFWrFKsyVg5O7T6/dilHN3Pa+tKpKPWN+6+6fNCRP/LjR3WwLRweSCBAkWO38dSQhkWpYcCh/0kl22JvhF1i5otnBEcFSn1Ha9K+laYmrub69nFJ/q1wTm34GOxf+fHkLONvXV1mKD4tWlCpKmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4YAiHla; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4YAiHla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738847304; x=1770383304;
  h=date:from:to:cc:subject:message-id;
  bh=L6W9b9CcAfJ/cXaIET2L9xKZvrWoVgu3bEQ3Wj6HnQY=;
  b=S4YAiHlaJYx257BlmcEOMkXQcHqpwYnx3aPofVNXOSCGyF38mPf0hfxZ
   Y9ALlIX//Qm7DTMQEeQ0TLxbid0zd5Q8DaPymOWAXhoj5rJsjdh4RVsS9
   LkYPrtg6tZblt6aMqz+ohuhxVkAeQoaXZaVI38xxwfgT6nvvwL4bAVbNZ
   zt1L5IYHa1pbG6Ohgi7mNA/pME8Gm5J65j02KNuWDxR5OLHqQfYTNxHiG
   8L6eIixXcUSTvSdviFILMrpQi94SZW+olf4UjUCMBDOnvUYe9s27nXGbs
   r8HNZ3cIlJzu+7zqn3bQYP7FliuPwZuMgZkBiO5UKk3ZRj1MXAytXVJLg
   w==;
X-CSE-ConnectionGUID: 8HLewEW6SB6gBkt/k4An3w==
X-CSE-MsgGUID: 2rH66rGBRBq4Mf/sBL3jBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50841098"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50841098"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 05:08:24 -0800
X-CSE-ConnectionGUID: JpQ7ivz4R9KPcwfhubLmqg==
X-CSE-MsgGUID: LvwhqLBlS2yMiB5yCgRmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115285694"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Feb 2025 05:08:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg1cC-000wth-1W;
	Thu, 06 Feb 2025 13:08:20 +0000
Date: Thu, 06 Feb 2025 21:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/mm] BUILD SUCCESS
 63887c9f02030afd042c125052ad60680f7c21b2
Message-ID: <202502062154.u349O0Fc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: 63887c9f02030afd042c125052ad60680f7c21b2  x86: Compare physical instead of virtual PGD addresses

elapsed time: 723m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250206    clang-19
i386    buildonly-randconfig-002-20250206    gcc-12
i386    buildonly-randconfig-003-20250206    clang-19
i386    buildonly-randconfig-004-20250206    clang-19
i386    buildonly-randconfig-005-20250206    clang-19
i386    buildonly-randconfig-006-20250206    gcc-12
i386                            defconfig    clang-19
x86_64                        allnoconfig    clang-19
x86_64                       allyesconfig    clang-19
x86_64  buildonly-randconfig-001-20250206    clang-19
x86_64  buildonly-randconfig-002-20250206    clang-19
x86_64  buildonly-randconfig-003-20250206    clang-19
x86_64  buildonly-randconfig-004-20250206    clang-19
x86_64  buildonly-randconfig-005-20250206    clang-19
x86_64  buildonly-randconfig-006-20250206    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
