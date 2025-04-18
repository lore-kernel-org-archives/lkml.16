Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2D41547F5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985555; cv=none; b=D2rwcoNHV5a5PBWhvaxRwYwo9qD1kEcIaBe6v1Wk9/uiK7GN02RIoYrc4ddJ0UwCV1Rv4gCw58+asJsPQrKgmDJ7+3+2jHrtxL17Rpnhy62Od9JrhTPSmFj8A8uj6t3HggAmgrABH3tsKs9yyZNtC1ZAG4dXH/3gmf9GTp+5PnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985555; c=relaxed/simple;
	bh=lysuQwd/oA1BxXJ97bQDpT5Y2SC1klYrQG7+OQOoD70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FMUHeX3MdTMj0LKu0agFEUaIN3cJWSNlYfd377mYDA7TNZ3d0x0v34GIs5HUu470uS7Mpg15qR/xdfBubwHLaeb8D5EAs3kDQOYlEoG+9qkR1HV35jNq3IEIOpyFG1tvvZ9SnMY6XfbfKyyRiKBaaYi5LiHm2/kvQ/OqGYmHW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFvFP825; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFvFP825"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744985554; x=1776521554;
  h=date:from:to:cc:subject:message-id;
  bh=lysuQwd/oA1BxXJ97bQDpT5Y2SC1klYrQG7+OQOoD70=;
  b=RFvFP825v5eOL5HXuapOKNqo32nKsBXn98rQt897IbY76dcrUx53gBMg
   NoNd2KP3mxmfTYce5JVsWaBkVvhpSTOQ+MfMNgWIjGfv2LMERlms9lDBO
   H+aMgnXRwwK23FGozg2YHoHo0IDcQTQ5ETon6gxa4NgsqwWQBS47a8+I0
   NeS6IIRJ4yyEiyy66SHmvu0oWQmW1Gu7r3b746Dt1qbiDeOqbZ0WHAmQb
   HTD3X1QunbInJRVaPmscMTllouDmdfpdKVgSMZPvejw+u76WFua/Xx45/
   YXwiV7zc9zsicSRiSpzupLpMFcGtZqcHik1N8/ZjwPq8QrYYH2kBK5l34
   w==;
X-CSE-ConnectionGUID: rnQZad90Qe2UE71aOwJLKQ==
X-CSE-MsgGUID: 1IfnF0+8QB6ADOyrJM2FoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46777546"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46777546"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 07:12:33 -0700
X-CSE-ConnectionGUID: 2cwPIFQRR6G85F7lZsd6/A==
X-CSE-MsgGUID: /r9fiezVRFi0Umb8nmzSBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="132108673"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Apr 2025 07:12:33 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5mSE-0002w3-1Q;
	Fri, 18 Apr 2025 14:12:30 +0000
Date: Fri, 18 Apr 2025 22:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 7950de14ff5fd8da355d872b887ee8b7b5a1f327
Message-ID: <202504182210.xSiwJnV8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 7950de14ff5fd8da355d872b887ee8b7b5a1f327  perf/x86/intel: Add Panther Lake support

elapsed time: 1453m

configs tested: 19
configs skipped: 140

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250417    clang-20
i386    buildonly-randconfig-002-20250417    gcc-12
i386    buildonly-randconfig-003-20250417    gcc-12
i386    buildonly-randconfig-004-20250417    gcc-12
i386    buildonly-randconfig-005-20250417    clang-20
i386    buildonly-randconfig-006-20250417    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250417    clang-20
x86_64  buildonly-randconfig-002-20250417    clang-20
x86_64  buildonly-randconfig-003-20250417    gcc-12
x86_64  buildonly-randconfig-004-20250417    clang-20
x86_64  buildonly-randconfig-005-20250417    clang-20
x86_64  buildonly-randconfig-006-20250417    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
