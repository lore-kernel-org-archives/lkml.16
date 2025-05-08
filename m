Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB49B2AE90
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674724; cv=none; b=THfWGTEPx+HaOMiSVkhBFBu7eOi05zQjGHRIOJLkg+PdFVse6YDNyeyBhwhJE3iUorzxLEkUNT3NGyVzBEMG5hoZO/dGrXVOKFhF9IC1r9vFNVUT6+KFQbAL2jgNzdr4LB90ClSnqWvIE3oCoQFF0pLOPTIK7gxvQz9hIatsCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674724; c=relaxed/simple;
	bh=TPrWKrDR17mZcDUlM4N62FY9WIzSSTh/ZkrzGPsBY4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FRwcYpo0Z4bzGiiPkrzzydMhNoWu2TxNVKkDjeJTuRgoHPVAW/Kt7b4SQkbGWrfCoDLVkbDqlu2xBpTZcQB4HNW0XsrzZH28tSlpwbXsQvBwLsJaRqqYADMKPo8k/c7tBzKJWbBx73ZiemmFXBxA9ksM2+SOLNIgzZ0YxmZn2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmIVqWpj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmIVqWpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746674723; x=1778210723;
  h=date:from:to:cc:subject:message-id;
  bh=TPrWKrDR17mZcDUlM4N62FY9WIzSSTh/ZkrzGPsBY4I=;
  b=kmIVqWpj6gPx156eVwHc8Fo7itMKOi/qSQ7u0imhgqE8hGUqwKshxTPw
   rX6u4fHpnILI/AGjoxIIEaMexlNi95PImpLAjdQqq1GcWxBHEqR+5/b5m
   FoRygjc/mO/dyi4Qb3g4C9JYDXKs5C5dYyGptGkwYbOIhio09w4ArH9pc
   OuRjFdrYNskuTHNsaEyFBNLWgWB63BEAdDKtiVNlOMforwFFxQgeoA2rO
   AxaEQmECNBhaPjfhf5wL8rcopujNvnX4vWKeWunyw6Sf5TSTb5yIlNEVc
   bydgLHmfq1KWc/SGFLoLP0pN7RX/jIy0ql01EYe2SEPHY+01JAjpDTOFo
   A==;
X-CSE-ConnectionGUID: +MDGUWp8Sw6sHvR+69bR8A==
X-CSE-MsgGUID: FDPdDTwARlmvrWGt3av+Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58637149"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="58637149"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 20:25:23 -0700
X-CSE-ConnectionGUID: GMfE0J+MSNihjfAO9X53OQ==
X-CSE-MsgGUID: pnMUbPAJRreyIV9ojT9R3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136115452"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 20:25:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCrst-0009i4-1e;
	Thu, 08 May 2025 03:25:19 +0000
Date: Thu, 08 May 2025 11:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 5214a9f6c0f56644acb9d2cbb58facf1856d322b
Message-ID: <202505081131.jkXnv2gX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 5214a9f6c0f56644acb9d2cbb58facf1856d322b  x86/microcode: Consolidate the loader enablement checking

elapsed time: 2411m

configs tested: 7
configs skipped: 167

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386    allmodconfig    gcc-12
i386     allnoconfig    gcc-12
i386    allyesconfig    gcc-12
i386       defconfig    clang-20
x86_64   allnoconfig    clang-20
x86_64  allyesconfig    clang-20
x86_64     defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
