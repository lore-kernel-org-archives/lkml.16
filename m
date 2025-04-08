Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B486A33F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119961; cv=none; b=DSGa8h38S8QiSiCaUnNFTCIAcKVz+9rEhz/Jq6uVYiiBD7Rr0ZolGbzy7wFf3wDx+09YM74tCN13scSxKzU2zdHjFZ/h1mdOfQw7d4VldILL6QkQ+dRllx/B6q/SWudIid5J2fk5yB9c5tvTmYzcXhwk0yST6J1ciRdpWdHF898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119961; c=relaxed/simple;
	bh=IviDew1zESuoEOPqUmk/10/peCIokxUeMS9f/14HOzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iGRwSxIeJh7SBi/ErGw/L+OUElfwD2A5l74Kvx2D133JB0nICjRZTfZAvl9Art18ELIx4PBRUcUK7UFtAnAl2As9fQGt4+r1c3r0o1Om4YyK4c251QZs594reDLlDPEVMtb4vQwg5dNMcBCJxMYjYYuhDNUGNkvEePC7PpLIYmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcHBqSzM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcHBqSzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744119960; x=1775655960;
  h=date:from:to:cc:subject:message-id;
  bh=IviDew1zESuoEOPqUmk/10/peCIokxUeMS9f/14HOzY=;
  b=GcHBqSzM9wM4D21Kf6NCS1RCTkjY50Wv6PARmH5i5F6oRl/Z7K50Gj4Y
   S2hj2jUhgK0IaXEZIZeU9Rcaf2BWxAf/jpBVPV0EeRN4fDa+FWtjDgZ/l
   27H5s0pmQu9vrm7TmryewulBOUnBy7OQH7Xahoo5pNLzuK/Df0JBUaqhi
   VhJZIP7T/6koSJ+6I1qJBXZdOhNsFCh9Ay9oXhd/eyo//qFKWu9QoPhnw
   TZNWMna3LotR5TLMSuTMHH5TcM+t7IPq54BhBoHEQtnOj3cNSEvWXyFuS
   mNeAQQPgCQPRya9qOiCT+ANG/WrkHutSpWufUPhCB9eQiyYTsETOxTCkO
   w==;
X-CSE-ConnectionGUID: Rq+UbdUHRH6PZaPaq+jLqA==
X-CSE-MsgGUID: Psd+ZqSETFO8JQGI+r4KQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45712710"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45712710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:45:59 -0700
X-CSE-ConnectionGUID: r/TEh3O0RduxQiVY9dZrgA==
X-CSE-MsgGUID: MFwYVpfSQs+DdteY4Zjo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="129123920"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Apr 2025 06:45:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u29H2-0007U5-0x;
	Tue, 08 Apr 2025 13:45:56 +0000
Date: Tue, 08 Apr 2025 21:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/microcode] BUILD SUCCESS
 321550859f3bd64f547d0b4e9fbd97bd539ef47c
Message-ID: <202504082131.adPcXUBb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/microcode
branch HEAD: 321550859f3bd64f547d0b4e9fbd97bd539ef47c  x86/microcode/AMD: Clean the cache if update did not load microcode

elapsed time: 1456m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250407    gcc-12
i386    buildonly-randconfig-002-20250407    gcc-12
i386    buildonly-randconfig-003-20250407    gcc-12
i386    buildonly-randconfig-004-20250407    clang-20
i386    buildonly-randconfig-005-20250407    gcc-12
i386    buildonly-randconfig-006-20250407    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250407    gcc-11
x86_64  buildonly-randconfig-002-20250407    clang-20
x86_64  buildonly-randconfig-003-20250407    clang-20
x86_64  buildonly-randconfig-004-20250407    clang-20
x86_64  buildonly-randconfig-005-20250407    clang-20
x86_64  buildonly-randconfig-006-20250407    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
