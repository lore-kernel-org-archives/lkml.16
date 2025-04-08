Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E011CD1E0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744139567; cv=none; b=aOFoHvE89yBO+dArHUm5L4x5wsltP3Cp90+DYbpDnbfxwi1Izw2kHaQpjSVrA1cNCzobZKvHxCeAmwuXxvEoeO5n+fQXrT+KQX1ffHAghgVOrdkYqiLxRnzlDUhhzCQvvie5fr5WEPZfcj5ioldyMoLygqHG24itzmDxjyceRUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744139567; c=relaxed/simple;
	bh=JtR/5RwMFkDLlsIb9vx/t5ueKuxxUYnYPgk73nDMCRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qcTOVtpC5uI3RO96snWPWMerFHhEr91+wGOqQq1KfYpDEKO7kobzTblAm+p8ggASDW2zZliScMJtV/kli0Ivaz05vbn6bV15aQjq6lZX8thDVSLb5HLazMt4E3LLUc5NM5/3cO5BmYWNM8w1wB8elBgUDYeA27qQ9nJzikRb3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1+qAVs5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1+qAVs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744139566; x=1775675566;
  h=date:from:to:cc:subject:message-id;
  bh=JtR/5RwMFkDLlsIb9vx/t5ueKuxxUYnYPgk73nDMCRY=;
  b=S1+qAVs5xNR3zBxecnKZfRbhN1wopFPTF6fnBTJrTMjgRpX6WFMiuPrH
   B+ElXNfJU6/zrjZmRCiDEZIwHnp/y9pPeIqzPL8GL4gjdfmWJLq0VfnK+
   Kslp7ipMNWP0BgqHI+d2aM8Shx/qb96IlEW2lakcB7EFdi3xizo7MxPM9
   ujaFEERgSXp7++DCkwk3gmClUmUWujHz1KR21CSoi1YQ0HaP1fiW4tOap
   J2BC7/Xzz+QPVLktAIzfBR57s41hpM9ibdJe/z2qewIfExY88ONUWU+UP
   zMELa0nlJvLpd3E03UDfV70C9uNqV9C5/QdXw4OQS2wZxkvYgAOu5dWqc
   Q==;
X-CSE-ConnectionGUID: X1wkuTMYSx+oxTtvkjl8rw==
X-CSE-MsgGUID: /C/TvdUHQEWKP4KwfxCM5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56572819"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56572819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 12:12:45 -0700
X-CSE-ConnectionGUID: jvYU1VgETqWLu49480SlZA==
X-CSE-MsgGUID: 4q66v/e5T3W+KwI4C5MTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="129326941"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2025 12:12:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ENG-0007uR-1K;
	Tue, 08 Apr 2025 19:12:42 +0000
Date: Wed, 09 Apr 2025 03:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 f2f29da9f0d4367f6ff35e0d9d021257bb53e273
Message-ID: <202504090355.tFMAvUlO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: f2f29da9f0d4367f6ff35e0d9d021257bb53e273  x86/e820: Fix handling of subpage regions when calculating nosave ranges in e820__register_nosave_regions()

elapsed time: 1488m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250408    clang-20
i386    buildonly-randconfig-002-20250408    clang-20
i386    buildonly-randconfig-003-20250408    gcc-12
i386    buildonly-randconfig-004-20250408    gcc-12
i386    buildonly-randconfig-005-20250408    gcc-12
i386    buildonly-randconfig-006-20250408    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250408    clang-20
x86_64  buildonly-randconfig-002-20250408    clang-20
x86_64  buildonly-randconfig-003-20250408    clang-20
x86_64  buildonly-randconfig-004-20250408    gcc-12
x86_64  buildonly-randconfig-005-20250408    clang-20
x86_64  buildonly-randconfig-006-20250408    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
