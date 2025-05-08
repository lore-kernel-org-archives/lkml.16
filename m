Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833A78F37
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677922; cv=none; b=mQ4n7rXl64ZpaBxD6obSawP6kMXYCPJ3oDDP71BtwRHYkh5GWP1KigdrghrEzaKRL2Z2Eb1WXCkJyE2ZvJMglqpDWEVCn/bkjGqKNFlL+4l/oUUS1lZ6uLkg184GISpD7QCnR9fxFWRWzIMGzt9qe0Q/WmJcQtWry36VpIRzI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677922; c=relaxed/simple;
	bh=9lWJLN2w7Nt+NoDdYjkFSzmpt4jtiHztA/5KmT8x/og=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eFn/5ff733dTXl0bopGrtfku6MLSST/FpnaySSHnGz2fKgfgWF21uVfH8baZbD7Dqz7Td2DMqR33NO3KkI7DkUZ20/Xsvyj/A0nBV4HIYt5RWLX6TZNKYuEmJxdwhiZQVHcS6cAL9ssVUMzSQrrjef3WjSAen6icZvuskiEatKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKWyefy2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKWyefy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746677920; x=1778213920;
  h=date:from:to:cc:subject:message-id;
  bh=9lWJLN2w7Nt+NoDdYjkFSzmpt4jtiHztA/5KmT8x/og=;
  b=iKWyefy2QU6v661TiOx4u0AU0VrE2gElkMpzaD5PjOWPQ7tBE1PrFDvl
   t0c5xaDKF+4r/Ho1UnH3kN4w/lDplVWajkBnL88pcfCXFoTCkwBjK4t69
   yyXxFYspA/vfUN8+vtosV093HrKnJF7NKyF73B1OEI6paSZLf/9jQgEK7
   K/e+NBNyDd18VAJ23EfE9ODQW92eGhNsz/P4inUs1/EF0LSylH+1laFop
   Hyg7QoNgg6SXzWoECZwB+LkOZBjSed2ncHlTvRDCPw3aZUtEmqHxt9oMB
   DDA9LBPuHZoJRo+6BAYZAd9eUl3Y6LQ7cz17wS1aU/Mc7AsfUnwU2MWbL
   g==;
X-CSE-ConnectionGUID: C0Kj/al/RiOKkDOlnFMLIg==
X-CSE-MsgGUID: ilH5SdtSSRa8MKQKjMukGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48605015"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48605015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:18:39 -0700
X-CSE-ConnectionGUID: XajZkRodRIumOjhDJ8sRGg==
X-CSE-MsgGUID: ppGwqY5pSwqHxRY7QZKEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135864984"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2025 21:18:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCsiS-000A0E-2D;
	Thu, 08 May 2025 04:18:36 +0000
Date: Thu, 08 May 2025 12:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250506] BUILD SUCCESS
 d3ce0f90b33a9f1fac9c84b4ca84839f08593b04
Message-ID: <202505081220.TzNpjzfb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250506
branch HEAD: d3ce0f90b33a9f1fac9c84b4ca84839f08593b04  NFSD: Avoid multiple -Wflex-array-member-not-at-end warnings

elapsed time: 1849m

configs tested: 40
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
alpha       allyesconfig    gcc-14.2.0
arc          allnoconfig    gcc-14.2.0
arm          allnoconfig    clang-21
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon     allmodconfig    clang-17
hexagon      allnoconfig    clang-21
hexagon     allyesconfig    clang-21
i386        allmodconfig    gcc-12
i386         allnoconfig    gcc-12
i386        allyesconfig    gcc-12
i386           defconfig    clang-20
loongarch   allmodconfig    gcc-14.2.0
loongarch    allnoconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    gcc-14.2.0
parisc       allnoconfig    gcc-14.2.0
powerpc      allnoconfig    gcc-14.2.0
riscv        allnoconfig    gcc-14.2.0
s390        allmodconfig    clang-18
s390         allnoconfig    clang-21
s390        allyesconfig    gcc-14.2.0
sh          allmodconfig    gcc-14.2.0
sh           allnoconfig    gcc-14.2.0
sh          allyesconfig    gcc-14.2.0
sparc       allmodconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
um          allmodconfig    clang-19
um           allnoconfig    clang-21
um          allyesconfig    gcc-12
x86_64       allnoconfig    clang-20
x86_64      allyesconfig    clang-20
x86_64         defconfig    gcc-11
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
