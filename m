Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73AB25742A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713529; cv=none; b=YCSbIRxWM8Kv0ekg9JTAzjO61eraeP/OXw71sKNfTx8nndiqN4J/b9Jn8t4ldbGjilzBEHgzLzn/8Oc0zQQSn6cfErI4hBq3Vww2Mzoan1S8X+lIstKrGM/VwxwAkYuun6i9QL0FSPj7O76Gtr5nVqEPVPoBf6HTtXEgkMXqRpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713529; c=relaxed/simple;
	bh=i8bUh+ZCe0rZP2zIF+tVxLgLBV4ZORcqen4purBbm+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SkQYaUEFRNZ9mRFZMxrFA7KFAtxc9+jQLe2y0TiujjNC2beCYBJMhfTQcKSUNXh/XaRylTaD/+yNo7uhPXlBHRFd9LkEH8XUjLft4WeGwhCi0dC2eY2tee/7b5tYJKkU9xQNTsJuh8jYjmTrKkprSGp/Jdzomwgoq3TOScWo78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEkBdiGr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEkBdiGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746713527; x=1778249527;
  h=date:from:to:cc:subject:message-id;
  bh=i8bUh+ZCe0rZP2zIF+tVxLgLBV4ZORcqen4purBbm+I=;
  b=PEkBdiGrSDGq1cnZdwx4nRLFecEejebUsR8mscM7rSPyPNPBBtAtR+Gi
   ZrD6vXmSbqo41JHcMEpQrnDSFN1rRz8ib0ShI5PlIjturawakIrWkbYzC
   btLP5WAZL9yBJW2/pcOcZKYpmR6kuKcUC7KI2uSRHzb2r9sJ31QUKKkUn
   4hQhAfCiY+8oq9+roZ0YMOwJWtbGISxTLbDok8jIi6V5gcMNP7H+Ve1iK
   s4xitbJD6XvM4Sfa3NALZmyrc5FMD9xJj2Pg1O1oQem9PhVpslS/lDvzB
   oWPlgqVo3Q1xLlxZLblPr1zHSXCBwVBCnIIwsNJ8YOWZ7mjMEgI9qBx/i
   g==;
X-CSE-ConnectionGUID: LTDrHYVJTVWlpQ6hr4BZcQ==
X-CSE-MsgGUID: lucgJFh9TROf3EUfWoMfhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48611412"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48611412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:12:06 -0700
X-CSE-ConnectionGUID: rMcEpkLVRGej0s/xJNzmMg==
X-CSE-MsgGUID: STCe+/6eRtSBBo7czmgK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141073482"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 May 2025 07:12:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD1yl-000B1z-05;
	Thu, 08 May 2025 14:12:03 +0000
Date: Thu, 08 May 2025 22:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/drivers] BUILD SUCCESS
 15568ffd59d4e7d8c39286a7159880afe327216d
Message-ID: <202505082211.plsJaZeN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: 15568ffd59d4e7d8c39286a7159880afe327216d  irqchip/irq-vt8500: Switch to irq_domain_create_*()

elapsed time: 1440m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-14.2.0
alpha         allyesconfig    clang-19
alpha         allyesconfig    gcc-14.2.0
arc           allmodconfig    clang-19
arc           allmodconfig    gcc-14.2.0
arc            allnoconfig    gcc-14.2.0
arc           allyesconfig    clang-19
arc           allyesconfig    gcc-14.2.0
arm           allmodconfig    clang-19
arm           allmodconfig    gcc-14.2.0
arm            allnoconfig    clang-21
arm           allyesconfig    clang-19
arm           allyesconfig    gcc-14.2.0
arm64         allmodconfig    clang-19
arm64          allnoconfig    gcc-14.2.0
csky           allnoconfig    gcc-14.2.0
hexagon       allmodconfig    clang-17
hexagon       allmodconfig    clang-19
hexagon        allnoconfig    clang-21
hexagon       allyesconfig    clang-19
hexagon       allyesconfig    clang-21
i386          allmodconfig    gcc-12
i386           allnoconfig    gcc-12
i386          allyesconfig    gcc-12
i386             defconfig    clang-20
loongarch     allmodconfig    gcc-14.2.0
loongarch      allnoconfig    gcc-14.2.0
m68k          allmodconfig    gcc-14.2.0
m68k           allnoconfig    gcc-14.2.0
m68k          allyesconfig    gcc-14.2.0
microblaze    allmodconfig    gcc-14.2.0
microblaze     allnoconfig    gcc-14.2.0
microblaze    allyesconfig    gcc-14.2.0
mips           allnoconfig    gcc-14.2.0
nios2          allnoconfig    gcc-14.2.0
openrisc       allnoconfig    gcc-14.2.0
openrisc      allyesconfig    gcc-14.2.0
parisc        allmodconfig    gcc-14.2.0
parisc         allnoconfig    gcc-14.2.0
parisc        allyesconfig    gcc-14.2.0
powerpc       allmodconfig    gcc-14.2.0
powerpc        allnoconfig    gcc-14.2.0
powerpc       allyesconfig    clang-21
powerpc       allyesconfig    gcc-14.2.0
riscv         allmodconfig    clang-21
riscv         allmodconfig    gcc-14.2.0
riscv          allnoconfig    gcc-14.2.0
riscv         allyesconfig    clang-16
riscv         allyesconfig    gcc-14.2.0
s390          allmodconfig    clang-18
s390          allmodconfig    gcc-14.2.0
s390           allnoconfig    clang-21
s390          allyesconfig    gcc-14.2.0
sh            allmodconfig    gcc-14.2.0
sh             allnoconfig    gcc-14.2.0
sh            allyesconfig    gcc-14.2.0
sparc         allmodconfig    gcc-14.2.0
sparc          allnoconfig    gcc-14.2.0
um            allmodconfig    clang-19
um             allnoconfig    clang-21
um            allyesconfig    clang-19
um            allyesconfig    gcc-12
x86_64         allnoconfig    clang-20
x86_64        allyesconfig    clang-20
x86_64           defconfig    gcc-11
x86_64               kexec    clang-20
x86_64            rhel-9.4    clang-20
x86_64        rhel-9.4-bpf    gcc-12
x86_64      rhel-9.4-kunit    gcc-12
x86_64        rhel-9.4-ltp    gcc-12
x86_64       rhel-9.4-rust    clang-18
xtensa         allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
