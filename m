Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F4481C4
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 05:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747458548; cv=none; b=jo1NthG65bGInu5rjsqVR098laiZYk0nMndQyCPUk/emgN8588bIqBnxBmoZWjZvPERwusmEd94y8sUBhaMLiTVom4OII7YMXBIl0DF9xPMUEIYlMENTOXfKcrHyxV0dhRu+0DnUx9VAje/W9K62f56s6E36RPBM+hv7X8PfoMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747458548; c=relaxed/simple;
	bh=6GlvlxnS7nCcjtTL4GXt6H5tMnKJjmBkzySfjQxEIRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vAZMWLIlqdVr08x+zN2ie0QlA4y/2zYwAnwH5cZWtYFOYRq2j7V5WlmPc5KZquLT9Q682EL1t0mhyP9wSlxVWOQWi4rYA5eFq2vurR5Mn+IsO+wA/ymvMcsc20jqpUgRgYDe7aN86WdPJF4TRGfg4iq8QI9UfTtMJZ0AuC55sao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCK8BAx9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCK8BAx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747458546; x=1778994546;
  h=date:from:to:cc:subject:message-id;
  bh=6GlvlxnS7nCcjtTL4GXt6H5tMnKJjmBkzySfjQxEIRc=;
  b=GCK8BAx9pmxMzeFWs3SgkEBhkr2b4WoENaj2esnFAA27QwsFJLQ81qmV
   EAY4LexghrtzdtXVRhzvsKtmGoZq5wZ3p7dLP3dVbS45mhExjODBPZui3
   Sczi6EbljXp6jiypHTQHE5XEsKUOnzO748ZlWGuhGG1YzjT7DHNdlWGxF
   nWyigMz5F0QVbPzv1Tb5RaN4DJq1xzMz041r5kqEtEkSRosJ7QFq8Kx/R
   p9lLP0rR4DIe1KkSnoXPMtW2sFSRJnwZ58d+Jv8q76NHmmzu0Jd4D6ZGp
   mXhXnbyy5FRYX3NjeW3kyNHNV4BhhwwLopOkNlirRZaw/5aUiKRSa1XsD
   w==;
X-CSE-ConnectionGUID: e+9HZieiQb6u7c7/MYzI1w==
X-CSE-MsgGUID: Uk8kCHd1Rje6woqgntZjaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="74832178"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="74832178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 22:09:05 -0700
X-CSE-ConnectionGUID: T/QAHvvOTviyfPSWn2GJ8w==
X-CSE-MsgGUID: c1HXNY7uSy2nVBcaGpKb2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="139404895"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2025 22:09:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG9nC-000JwR-0f;
	Sat, 17 May 2025 05:09:02 +0000
Date: Sat, 17 May 2025 13:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 ebe176981c14b5f6472718f9894db35816749120
Message-ID: <202505171353.EwO51g6W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: ebe176981c14b5f6472718f9894db35816749120  perf/x86/amd/core: Fix Family 17h+ instruction cache events

elapsed time: 908m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250516    clang-20
i386    buildonly-randconfig-002-20250516    gcc-12
i386    buildonly-randconfig-003-20250516    clang-20
i386    buildonly-randconfig-004-20250516    clang-20
i386    buildonly-randconfig-005-20250516    clang-20
i386    buildonly-randconfig-006-20250516    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250516    clang-20
x86_64  buildonly-randconfig-002-20250516    gcc-12
x86_64  buildonly-randconfig-003-20250516    clang-20
x86_64  buildonly-randconfig-004-20250516    clang-20
x86_64  buildonly-randconfig-005-20250516    gcc-12
x86_64  buildonly-randconfig-006-20250516    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
