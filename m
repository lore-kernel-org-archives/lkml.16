Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4E91386DA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680880; cv=none; b=Kf2FK+qof84t10NJr+okF/iHoQbyaMpa799Sle4F+R62NYdyvOIpXOexPCgOcPreEGylwNZQOJIrZgDl+D3phdQBuYowo+umTbATd/YWhPAQaWzbqeKfeQhuVRriyQIPw4f1lhK7w4kjqjGDZmDzekQbklQocH7T2fDesWKS0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680880; c=relaxed/simple;
	bh=762WzbtVDpriY6nKexgTUuobqBNCJcyYWb1XhpiJiRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HV2/BSKKUBEmFx/clJHHlDi4vZmuEELC5O3655ndvenoKDNE5sXFpldnah120pxNuzVUdWY1ZgFMyWRbS5NniBf0X3K1iMFtuEFmRHZxXtOV7wtgTp2kVEDB4leDu4Mu9gJoYgMFYjOEptdExuDCrvgZda0F7kjJkHmBwpU6aCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ0XHQit; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ0XHQit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746680879; x=1778216879;
  h=date:from:to:cc:subject:message-id;
  bh=762WzbtVDpriY6nKexgTUuobqBNCJcyYWb1XhpiJiRo=;
  b=MQ0XHQitQ420uPWCUXgtk1d5xhi/4P+vX9gQSUhEXsDZi+H2rvczT8EA
   KnP/W1Wds/IWM/IBSl6IhIwCvsEdzT4NnMOthSV55f744GPu4pK/K0fkM
   4eFZHnvVnEtdev2Si2dI/+91GrL3mvuFRQ5BC3Tp2mmvdFUUNfhqCGljI
   igUoZnN0CwrOOVpCOoSHQRCh7G/tCaG1ql38TppvxXMP+tNSrGwLeAzOM
   KUVnua7VDj3mwCP347aMAHNawHDcl8EbVyO92YWdbWb1B1ioVA2rxmVHn
   VJ6i25i/QqGYjr71Unwe/ulx26ZuKcuFYGoo/4fMG2mdY+1IqoeBlLDxW
   w==;
X-CSE-ConnectionGUID: O2PZK+RkQLCLyR36YCKY+A==
X-CSE-MsgGUID: J10ApREsSVCYkxyixNfiJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59797087"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59797087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:07:58 -0700
X-CSE-ConnectionGUID: VUZCatPEQLGfL6fQt5k4fw==
X-CSE-MsgGUID: HHe/F5l4S0i41I9uL7ntIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141136581"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 22:07:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtUA-000AFQ-2j;
	Thu, 08 May 2025 05:07:54 +0000
Date: Thu, 08 May 2025 13:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/core] BUILD SUCCESS
 cdb7d2d68cde6145a06a56c9d5d5d917297501c6
Message-ID: <202505081312.AflvJqSd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
branch HEAD: cdb7d2d68cde6145a06a56c9d5d5d917297501c6  locking/lockdep: Add number of dynamic keys to /proc/lockdep_stats

elapsed time: 2117m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-14.2.0
alpha              allyesconfig    clang-19
alpha                 defconfig    gcc-14.2.0
arc                allmodconfig    clang-19
arc                 allnoconfig    gcc-14.2.0
arc                allyesconfig    clang-19
arc                   defconfig    gcc-14.2.0
arm                allmodconfig    clang-19
arm                 allnoconfig    clang-21
arm                 allnoconfig    gcc-14.2.0
arm                allyesconfig    clang-19
arm                   defconfig    gcc-14.2.0
arm64              allmodconfig    clang-19
arm64               allnoconfig    gcc-14.2.0
arm64                 defconfig    gcc-14.2.0
csky                allnoconfig    gcc-14.2.0
csky                  defconfig    gcc-14.2.0
hexagon            allmodconfig    clang-19
hexagon             allnoconfig    clang-21
hexagon             allnoconfig    gcc-14.2.0
hexagon            allyesconfig    clang-19
hexagon               defconfig    gcc-14.2.0
i386               allmodconfig    clang-20
i386                allnoconfig    clang-20
i386               allyesconfig    clang-20
i386                  defconfig    clang-20
loongarch          allmodconfig    gcc-14.2.0
loongarch           allnoconfig    gcc-14.2.0
loongarch             defconfig    gcc-14.2.0
m68k               allmodconfig    gcc-14.2.0
m68k                allnoconfig    gcc-14.2.0
m68k               allyesconfig    gcc-14.2.0
m68k                  defconfig    gcc-14.2.0
microblaze         allmodconfig    gcc-14.2.0
microblaze          allnoconfig    gcc-14.2.0
microblaze         allyesconfig    gcc-14.2.0
microblaze            defconfig    gcc-14.2.0
mips                allnoconfig    gcc-14.2.0
nios2               allnoconfig    gcc-14.2.0
nios2                 defconfig    gcc-14.2.0
openrisc            allnoconfig    clang-21
openrisc            allnoconfig    gcc-14.2.0
openrisc           allyesconfig    gcc-14.2.0
parisc             allmodconfig    gcc-14.2.0
parisc              allnoconfig    clang-21
parisc              allnoconfig    gcc-14.2.0
parisc             allyesconfig    gcc-14.2.0
parisc64              defconfig    gcc-14.2.0
powerpc            allmodconfig    gcc-14.2.0
powerpc             allnoconfig    clang-21
powerpc             allnoconfig    gcc-14.2.0
powerpc            allyesconfig    gcc-14.2.0
riscv              allmodconfig    gcc-14.2.0
riscv               allnoconfig    clang-21
riscv               allnoconfig    gcc-14.2.0
riscv              allyesconfig    gcc-14.2.0
s390               allmodconfig    gcc-14.2.0
s390                allnoconfig    clang-21
s390               allyesconfig    gcc-14.2.0
sh                 allmodconfig    gcc-14.2.0
sh                  allnoconfig    gcc-14.2.0
sh                 allyesconfig    gcc-14.2.0
sparc              allmodconfig    gcc-14.2.0
sparc               allnoconfig    gcc-14.2.0
um                 allmodconfig    clang-19
um                  allnoconfig    clang-21
um                 allyesconfig    clang-19
x86_64              allnoconfig    clang-20
x86_64             allyesconfig    clang-20
x86_64                defconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    clang-18
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    clang-18
x86_64             rhel-9.4-ltp    clang-18
x86_64            rhel-9.4-rust    clang-18
xtensa              allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
