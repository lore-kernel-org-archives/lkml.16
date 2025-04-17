Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3E1C84AD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883275; cv=none; b=FiM2ushfyMl6PuNmL1ixarDDayWXba7GeGemR4/ncZCgXGLn/bLV/6DYlxfa0WF9iOFvk7rC+5DKoeBTI2V8af/gtLf5OH3ZjZzzQtrWfOwXPsKciFQX+lxBXpFguAEQPaEEq5OnLU6JbDyrDmvDYtqIXGx+CpuKkmSyNoRspD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883275; c=relaxed/simple;
	bh=P6R+6BS/GRBj7z5cpUZVaroNLLhh61DKcqpQsxl9418=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cgy7xtswunV9cakVAHwl6IVZ1Qhm+xXNhx9xSi5AyQLu4fYLjKLkUY43zKrWJk1j0A/TGxCjUJdxMi43XZ57WBqEJ8Sp5GxE8NQlVjABMGifUb2gTY92zEUYa9UCKubiSrdppuHFx3qmB+81sQy8s2NjHDS7kPXkw5vHNb2UmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpN6i6/c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpN6i6/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744883273; x=1776419273;
  h=date:from:to:cc:subject:message-id;
  bh=P6R+6BS/GRBj7z5cpUZVaroNLLhh61DKcqpQsxl9418=;
  b=RpN6i6/cudW+UTL3v9JMfHAjZNTaHH51gZtCU1a9K4QECBFoskMGBbMq
   ZyriEdqVF184+wjmZKyk4bdaLijdy9fZG7GCBJ+A6XBhwDa9Ftn8tXvV0
   bhoK2u++8rMeXcMnkNoVZ1EbswkGOKGO36DOs0VfASaD1plPcelxdh6hl
   zr7fSWMRpWW0gV9zPLL+cGtDiLhuFmQ2EKPgT8N9uw8lPEGL/eUaH3K1P
   oS4xUmDZ5HdCo+HO1BuGeT+AqnYTezcWZTr2lI1gbtW3sUJTSDNDU9dao
   E9PPrYCOrWXfaErinheVR4MkA/F1aVxfkCT9HZo/ek7Hb7tisGfMSQePx
   g==;
X-CSE-ConnectionGUID: drrYK/blQ0CBsx0j/HYuGA==
X-CSE-MsgGUID: 4FHcyj9cQZCbSqmHtqRpXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46176873"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46176873"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:47:52 -0700
X-CSE-ConnectionGUID: oERuyzgiSfeBlP4D4EQQDQ==
X-CSE-MsgGUID: eudAEdQSRhmS4e1K100tiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131663957"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2025 02:47:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5LqX-000MGi-0Q;
	Thu, 17 Apr 2025 09:47:49 +0000
Date: Thu, 17 Apr 2025 17:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 1e07b9fad022e0e02215150ca1e20912e78e8ec1
Message-ID: <202504171740.vNehfjeK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 1e07b9fad022e0e02215150ca1e20912e78e8ec1  x86/e820: Discard high memory that can't be addressed by 32-bit systems

elapsed time: 1464m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250416    clang-20
i386    buildonly-randconfig-002-20250416    gcc-12
i386    buildonly-randconfig-003-20250416    gcc-12
i386    buildonly-randconfig-004-20250416    gcc-11
i386    buildonly-randconfig-005-20250416    clang-20
i386    buildonly-randconfig-006-20250416    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250416    gcc-12
x86_64  buildonly-randconfig-002-20250416    gcc-12
x86_64  buildonly-randconfig-003-20250416    gcc-12
x86_64  buildonly-randconfig-004-20250416    clang-20
x86_64  buildonly-randconfig-005-20250416    clang-20
x86_64  buildonly-randconfig-006-20250416    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
