Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAC35957
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750035241; cv=none; b=VKlO33SqI7ufr5qzlYnLTYm1mVYOkkIllqkB+1Hq/GVwuWGhWD9w0s8JfgNx8w2qKIm83ueHppM+PghWVqfX5Z4JEPEn4KI16lmc8VQoW+OmHP6H9TP5LXRJouEbWyredhASQu91SbFNlLEIXiLS17H29OkPh0xjwiCGjNH774k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750035241; c=relaxed/simple;
	bh=PvJZcc9f0qVYHBF6plE+brYDB6HOviMos5hReD6az60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U9ajjKBzMBVmKL+28CQLwjSLV1JdWwGiNINCQfxZ/B1dw7bg7EbxBnYrPrIbvM7/AeLXw80zfcxLDZjqyvX/gu0+CsJJB140QmFy/Oa+DFY4clR9GypBXe/QEPBQM+7ad+/zHLcS2p7mgijgTSioV5kku1Q+zLaA7qLEuQIF1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2in1O/A; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2in1O/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750035240; x=1781571240;
  h=date:from:to:cc:subject:message-id;
  bh=PvJZcc9f0qVYHBF6plE+brYDB6HOviMos5hReD6az60=;
  b=X2in1O/AbuBfZM8lx7UdDXKmgbi1P3mMJKFBpX30+//giMXDWjEnj4iz
   mioXKlC5GXABhQjht3XEm8Ovz4QHy0PEMXJtdOHiROOTrh3pY2gldowuU
   f0oDaYJQPDl1TQZYzaTo1X7C9BVk90o3LVOtb5R/u2ndV6uMvQTQOVqLB
   Bg3tjGyeR89QZH8hLwsZfn9zQW+SyktI6rt/XoSu64EyMfv5fEZ+UdJ1O
   CQt05eZxolz7fxIrdxr9JGU27K7hgCn2mWaNStkg/1uY9yrHRBsBVVAoe
   aP6BSBj2wi9p6NOYb/TTez1eXRccHN+1aUma2DagwThLdRxUSmgM37MR7
   Q==;
X-CSE-ConnectionGUID: 24SP77PVRxWqScOHAh0DIQ==
X-CSE-MsgGUID: ResB6ggyRYSJB3dRBeKWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52152521"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="52152521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 17:53:59 -0700
X-CSE-ConnectionGUID: BFG0fyr4QzG+r7AeIpmPdw==
X-CSE-MsgGUID: fiJY78aHRjC7jybQP0lJaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="153094341"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jun 2025 17:53:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQy6l-000Ecu-38;
	Mon, 16 Jun 2025 00:53:55 +0000
Date: Mon, 16 Jun 2025 08:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/kconfig] BUILD SUCCESS
 1dbc32c1928d5a775df8e2953a2debae3054e11e
Message-ID: <202506160837.bf591cww-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/kconfig
branch HEAD: 1dbc32c1928d5a775df8e2953a2debae3054e11e  x86/tools: insn_sanity.c: Emit standard build success messages

elapsed time: 724m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250615    gcc-12
i386    buildonly-randconfig-002-20250615    gcc-12
i386    buildonly-randconfig-003-20250615    gcc-12
i386    buildonly-randconfig-004-20250615    clang-20
i386    buildonly-randconfig-005-20250615    gcc-12
i386    buildonly-randconfig-006-20250615    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250615    clang-20
x86_64  buildonly-randconfig-002-20250615    clang-20
x86_64  buildonly-randconfig-003-20250615    gcc-12
x86_64  buildonly-randconfig-004-20250615    clang-20
x86_64  buildonly-randconfig-005-20250615    clang-20
x86_64  buildonly-randconfig-006-20250615    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
