Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463D15C0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 00:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748737144; cv=none; b=Zf7kTAvyC20k1Da598ZmUrxZAjXG9d2uHoIJYZAwcndLOwJCHVdhHdxvMVCX5Yxff5egNE+qCHNGvMRQJDADUn4hfe3S8nDw7m4nDj/bP5+ZzWz6r7VVrlL+vbJa8WpIP+VdBt8w/Dnw9ZMCV8g2E11RL0ZBfV6fbAmFyJnYXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748737144; c=relaxed/simple;
	bh=6rqgU3ufqMzgcBrgD7+OzjtiUznYwOA8sM7QfD5ZILM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u6iRuRh3vgJBC702448I/Zc4fhQwqPuN9opi/JUjF/M6CeT0Swu7d/KoqOkKJ5ChHsLdFV43fmECtAM1jjm6GgjSOQtuA9sRmBve0ErRhzuN2dsX8t6nc6vWhEr0WNV2osuLy3xwSmpjvYLzNaqK/TUjXA57sZzlUQyjp1OVxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ddx6m2Bo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ddx6m2Bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748737142; x=1780273142;
  h=date:from:to:cc:subject:message-id;
  bh=6rqgU3ufqMzgcBrgD7+OzjtiUznYwOA8sM7QfD5ZILM=;
  b=Ddx6m2Boa5zu1uPfGszYF085YAIuxlua+6LLLzGmqZfxC6nrB7o82D27
   7gaGK1jiGEm4T75x1x9xCek5lNhz1QHy8C2l91FbeS+vmvYY77BqVlL8w
   i/xnbUnw9jlg802v19TiNdXehBa6Q5KP0ePK4msyl5R01PA06JjMO9TY6
   90xW+vOzyvRDh4IT5Lb3VvPpSeTXd0ODu24//vfXmGtgzzb8C8IYmQCJS
   UitXTxLODP1Vedt8jkds+mz+7Kyz8fwQFymQfiXzUYeBaHcHvX1SVG0ym
   cW5i5rNDNRPmQHBl7sltLxkyl8u6uAjT7eQe+KAmZA1Nta7az09Sxoqrv
   Q==;
X-CSE-ConnectionGUID: nGF8dZTtTDCQC3HTAprQdA==
X-CSE-MsgGUID: L2eBj5ZCSAiCs6fLZL5Wnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="76179463"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="76179463"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 17:19:02 -0700
X-CSE-ConnectionGUID: kxXM3Y6ITHKg+Ec2jv0Udw==
X-CSE-MsgGUID: lu7oqScjSjiYsae/ozpVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="149486823"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 17:19:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLWPi-000Yi8-1y;
	Sun, 01 Jun 2025 00:18:58 +0000
Date: Sun, 01 Jun 2025 08:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 8b999395e29ef0184cfa6dbbacd1b1ab92bba560
Message-ID: <202506010857.OB5JB9ZR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 8b999395e29ef0184cfa6dbbacd1b1ab92bba560  Merge branch into tip/master: 'x86/urgent'

elapsed time: 904m

configs tested: 19
configs skipped: 127

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
