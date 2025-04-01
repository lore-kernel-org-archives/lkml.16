Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB51E1C22
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504669; cv=none; b=JSI5vq4sD4lWXyaayNDKep6pxdJvtr49t2vKL5LzDJlSEdU1Cthpedg5RNppckrq3PnYGZKYnY66AT3GVBoghuhzdXsHY09qd2QbTcC4OzIxEEji5AFpHElNtzHsaSI+Kd625VEIC/foUGTU8yixa71KFzzrkrsymEmZXN+VZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504669; c=relaxed/simple;
	bh=QzIc/QYQHzbOuFE+Hsi17MAplRrjr/VhCsmlPvZN0ds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T1a0d1e1qGfn1I1n8z7DChrDxYpaBqvsoOh37slP31Xlt84fDEjNchKPSKiN4mMMbeSoalVYApA7qAe7V7UR+KO86JT1M+PuQG5+WRpCNK7JMpj6hy9Q9vflwbPmN3YdDco3GNENvVytm+syZAmgUbroHrob/fUGV4QknLTJvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5t7cJ0S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5t7cJ0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743504667; x=1775040667;
  h=date:from:to:cc:subject:message-id;
  bh=QzIc/QYQHzbOuFE+Hsi17MAplRrjr/VhCsmlPvZN0ds=;
  b=S5t7cJ0S0oXsERhNVaG71pJ4/9vhFO4NtFda3+BKPVS6oz1Jb2AJPkcH
   QTP2zzL/IPP0Qw+pQhMvURShZYz3Pd+VFifKUOs50UjzNToNqWh2omt9I
   bNvEbKHCvs22xtFbQf4QP3p8EQZVEXX48j0UbrCkk7q8y/mzplxn9IczH
   pPoUt1ciMygkv7Pob4Wlg1Y16mpBnbY1BIRmYJXrM1qJitnx3coLUFpIi
   pPqPx4+Pviqyg/NgpUYCyPr2cgoZFzatbJEmHZsB2OCeyXG+OGXdjpMPL
   em2WHBCr/1KSMTpcYiiqWb5mgbPtSUCdut75hKC4ZOMVkhOyzzXhmTd9t
   Q==;
X-CSE-ConnectionGUID: ugJ1DKXRR/2R0caNM41gEg==
X-CSE-MsgGUID: dNhF2D/FTQ6/59mzWq3D8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48690530"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48690530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 03:51:05 -0700
X-CSE-ConnectionGUID: wrio75a3QUykEoLQMQKpkg==
X-CSE-MsgGUID: PdY8WDheT+emf4v53PdYRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126818802"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2025 03:51:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzZCw-0009nC-1l;
	Tue, 01 Apr 2025 10:51:02 +0000
Date: Tue, 01 Apr 2025 18:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/mm] BUILD SUCCESS
 e62c7a4bd1d1e99e1ddd947cb526f833992c5bd4
Message-ID: <202504011845.LsPQ5xQ9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: e62c7a4bd1d1e99e1ddd947cb526f833992c5bd4  x86/mm: Simplify the pgd_leaf() and p4d_leaf() checks a bit

elapsed time: 1451m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250331    clang-20
i386    buildonly-randconfig-002-20250331    gcc-12
i386    buildonly-randconfig-003-20250331    clang-20
i386    buildonly-randconfig-004-20250331    clang-20
i386    buildonly-randconfig-005-20250331    clang-20
i386    buildonly-randconfig-006-20250331    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250331    clang-20
x86_64  buildonly-randconfig-002-20250331    gcc-12
x86_64  buildonly-randconfig-003-20250331    clang-20
x86_64  buildonly-randconfig-004-20250331    clang-20
x86_64  buildonly-randconfig-005-20250331    clang-20
x86_64  buildonly-randconfig-006-20250331    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
