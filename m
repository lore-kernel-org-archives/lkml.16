Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7C72641C8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857702; cv=none; b=KpjIgPV9Ku6Lyd48kSlzbEPsvDaLkcbzh3Oe5qOIJWOohNNzn1mUDqSAz2YGRopH5pXUT722bY2PJ+4VqKCIAbdZJ9iw7OTAaHPROdiPf4Ip9qRW7Re+Yg+Sb2r7LqZIUGrihuoRaWWAccbkOGbDjVlnWk0NXivHXk7NBS1M2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857702; c=relaxed/simple;
	bh=fpJ/HYJHfp2Am8NT7HO/4wgZVfVQfcPvsMBQUn9pK1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A2/WD2C6AUA9ivyVTcLFNpWsxj0Sjd0pb6AgE11KWwuKBakH5LP0j+mIHyDkbq4gh6WD7T/gRvljkow9yv0YGSo2uK7vRZkk/lorfN6+1SWffQAhk/gDIywUm0XQrFOR+oqpcR7E2lAK1xBsjWU8sL4saM/lHIZn9VoDQeBzDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLoBpNo9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLoBpNo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750857702; x=1782393702;
  h=date:from:to:cc:subject:message-id;
  bh=fpJ/HYJHfp2Am8NT7HO/4wgZVfVQfcPvsMBQUn9pK1U=;
  b=VLoBpNo9M9zrhvH9n3jlIdZcaMVmh2WElW3ozWEKKJC8VCEwTlJKlwX5
   KNGwWVex7LDPfTS/e0tbJHGD05vnrWcJjWKbmodBZ0hnpp0ebP27+zmrT
   fYSUmQDL54TCBjZLFYb/vgIcxTLsU3v+1bDLVVaH8CXILEG5PqB487DJE
   gqMZ+sec6HRRoY4nX5GxguMgjwFER7ZF8o51rtFOA9WbjgLXZbdJj8Tbi
   olQLO0dzhcq5t3J8ls7nr136cwL4qRS7cItZ9REMI+8F32QTIg1+TADCM
   YaOrNuvX6S5jQPT03X+BnAtiS71k9m+q0lzDc3a2TragKcq6ct/0tXZBt
   Q==;
X-CSE-ConnectionGUID: 87HIUfa5RoatPcq4J0pSlA==
X-CSE-MsgGUID: VGR2cUR3QiSs7PHJREByzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56807916"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56807916"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:21:41 -0700
X-CSE-ConnectionGUID: n66IC+s1Tqiv06VSrq2OvA==
X-CSE-MsgGUID: xp3jMyIWTkCMhdtN6Y88yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156788622"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2025 06:21:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUQ4H-000T8V-31;
	Wed, 25 Jun 2025 13:21:37 +0000
Date: Wed, 25 Jun 2025 21:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 8b9967863722ae3797086e82ec7fea62ce974b95
Message-ID: <202506252143.bkm4TCEi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 8b9967863722ae3797086e82ec7fea62ce974b95  EXP arm64: enable PREEMPT_LAZY

elapsed time: 1455m

configs tested: 7
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
m68k        allnoconfig    gcc-15.1.0
microblaze  allnoconfig    gcc-15.1.0
mips        allnoconfig    gcc-15.1.0
nios2       allnoconfig    gcc-14.2.0
sh          allnoconfig    gcc-15.1.0
sparc       allnoconfig    gcc-15.1.0
xtensa      allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
