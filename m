Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6EE367
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167283; cv=none; b=PcI0/u/1Na15w5VEwr7c5eCMPPmba3Ze8QHr1wT20fqyNlmqPOFACVYw4BPm/kVjrf/iJcY9rpKhUJv8h3+YB6SYLI9fE3kfsm6p4CrYhoWmEzh6jaw3DM0jkgDkl8uquNMZnwUXItD0RB5U5F6MkBUukZ4nPB1zpUQCZT1kSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167283; c=relaxed/simple;
	bh=hN+hGvHDZ4ZzpptkfxDxf5ziiJE93m8B8IE6t8bemaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MlrIkYJFJyPh/33a1C2M8Gaaq9hJ9X0U0frnPTl/Aw4Ajwci/KvOiCFRhVArXnN2xWeHLA0E+z8yZeOPNRL1nmToRLGtNYk9taThYS7egzOqqYytpAUGJPONfkJN+arivrBYcgj6FYXc0/2BTWRygXUgfcyRVwOStmM9U6R5NGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/bqg4S4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/bqg4S4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745167280; x=1776703280;
  h=date:from:to:cc:subject:message-id;
  bh=hN+hGvHDZ4ZzpptkfxDxf5ziiJE93m8B8IE6t8bemaw=;
  b=M/bqg4S4h1HlyhHOcSIZQFeucRAGQ3Al/q+6kRemP7X5GzVx+j3Zd3Hb
   arjcgvDjvxCSR9L15fc3iKKu7CnkzxQ4ucHZrw3NC3xkgv4liA0m3c+Xm
   utIsK2tzWc+vy2F/z4CUyQX+nV0BsAn90fdzqwYJPHxWXtpsrHA9J4Ujo
   MeS2YO/9JnWN58iFM22DjPXXIHyn3G+uwk0J4wdGgj9a2IMypQGtuyCRU
   PXlY3dX7/5Ekk6luhr/wT5JyNa0feVHEpgAjzaqyBk+T0SYHzVkS13wdT
   cIkKr1yBtoemTCbONIp8RuzfjjShTDOgXuJy9V+lc6Sinl/+yA3CKP/we
   w==;
X-CSE-ConnectionGUID: 0iV8r8G4Tl6OWEFyCBtnvA==
X-CSE-MsgGUID: W//kx+qQSM+K/olh592NnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46844967"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46844967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 09:41:19 -0700
X-CSE-ConnectionGUID: fWYVdk8gR06jxi9Hdw+t8A==
X-CSE-MsgGUID: U1XG49++SnekVkQtfOv5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131274879"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2025 09:41:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6XjH-0004lv-0y;
	Sun, 20 Apr 2025 16:41:15 +0000
Date: Mon, 21 Apr 2025 00:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 83b2d345e1786fdab96fc2b52942eebde125e7cd
Message-ID: <202504210016.vTVwPpPq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 83b2d345e1786fdab96fc2b52942eebde125e7cd  x86/e820: Discard high memory that can't be addressed by 32-bit systems

elapsed time: 1445m

configs tested: 19
configs skipped: 133

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250420    clang-20
i386    buildonly-randconfig-002-20250420    clang-20
i386    buildonly-randconfig-003-20250420    clang-20
i386    buildonly-randconfig-004-20250420    clang-20
i386    buildonly-randconfig-005-20250420    clang-20
i386    buildonly-randconfig-006-20250420    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250420    clang-20
x86_64  buildonly-randconfig-002-20250420    gcc-12
x86_64  buildonly-randconfig-003-20250420    gcc-12
x86_64  buildonly-randconfig-004-20250420    gcc-12
x86_64  buildonly-randconfig-005-20250420    clang-20
x86_64  buildonly-randconfig-006-20250420    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
