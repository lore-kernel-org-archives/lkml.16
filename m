Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE36FB9
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726510; cv=none; b=nzEyVBHdHztW6Q5Wd9rf89VnchaHJo32lRmU1naFuUzQtA0kp1p7TBklk4DiguZOIAjwOy7wqBs8Zr6Goz/GZJirnu15BEt8JDHJfC8bhmlit8s/bJjcFDagSDA2bqK9mvoE9xmpp/QFwAf5SAwicucB8+mFkzchvvJPaqeSHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726510; c=relaxed/simple;
	bh=59Oz3jBHy8ef2bql3qow+hVnktb/0FxpKrnBl9AWk1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=heI/maDC+i8sIcdmDnYFgHXal2H+mBEia2D984MuzZ7jHm/dMNdYVLmkS1GDSt84xG5HUEtSEbVItk6D+AfYwsUNwUCsCf/cJph6CizEVuMK7Vuk8PrbTCgunfSdmZTOszmFe2xyvLWIGTku1uGYwz8t8OPz9lzrk7NTU+IAoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVYw6Xq8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVYw6Xq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726509; x=1780262509;
  h=date:from:to:cc:subject:message-id;
  bh=59Oz3jBHy8ef2bql3qow+hVnktb/0FxpKrnBl9AWk1w=;
  b=WVYw6Xq8oug2KK3pVs38XEhmlwuxeKn6x1glqYjvr8QUZysvUrdsrqXS
   AZ6illOzxgr+FKcdjUczK0rXWMriHIx1Ue6U0m8CZmveX98NWHLe5OR8L
   g+mfg7xOBJM/2mSsV4VPlFtTevtBq93K9fdMzpNUcns5/LIHkw/qqqSXF
   cDsv+8ORNxx4kWpOff6mKib/Za2zq9218U6nNdBWqEMd78TSbID1VBnAJ
   OBMLOZ+O7VAXnmleR1+NsYhetiRPi8Bx1K5FCBC8EtLhjfedDpTLJmDp0
   Uo2p3WccICORWUAruiVC8h9se5hhhVwqNmwWqcGyT6aA3ZGPv4qJLARfI
   A==;
X-CSE-ConnectionGUID: s4xoE8x9SXGZd1bRB89Oxw==
X-CSE-MsgGUID: VY8jG/eUS5u1eT/vaLFcNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50888643"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50888643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:21:48 -0700
X-CSE-ConnectionGUID: VRKe6K6MRLWuFXv7N/OVyw==
X-CSE-MsgGUID: WsbY3RIhS/OeV/+6enY64g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="167373871"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 May 2025 14:21:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLTeD-000Yee-1w;
	Sat, 31 May 2025 21:21:45 +0000
Date: Sun, 01 Jun 2025 05:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 8858e8099446963ee6a0fb9f00f361dda52f04d5
Message-ID: <202506010543.AtpS8hEw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 8858e8099446963ee6a0fb9f00f361dda52f04d5  Merge branch into tip/master: 'x86/sgx'

elapsed time: 727m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250531    gcc-12
i386    buildonly-randconfig-002-20250531    gcc-12
i386    buildonly-randconfig-003-20250531    gcc-12
i386    buildonly-randconfig-004-20250531    clang-20
i386    buildonly-randconfig-005-20250531    clang-20
i386    buildonly-randconfig-006-20250531    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250531    clang-20
x86_64  buildonly-randconfig-002-20250531    gcc-12
x86_64  buildonly-randconfig-003-20250531    gcc-12
x86_64  buildonly-randconfig-004-20250531    gcc-12
x86_64  buildonly-randconfig-005-20250531    clang-20
x86_64  buildonly-randconfig-006-20250531    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
