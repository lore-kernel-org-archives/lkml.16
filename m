Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98483293C41
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015261; cv=none; b=tAxSgGj+iwHcJPH8nU5Yjhq4LyVQHR21sITbS+4RVPmlAtqrbyC1NBZDsTlX2GeQ3ZLXV9y/gaK5DVKM5VNE9xUFvzCWmsamQ+GX7WCwG/DgDDGEHS4Lw/PGakNTlzxtDkF5TWmg2QMhBqV2+o2EUI+ZCd8y+RPjZXymHs2c4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015261; c=relaxed/simple;
	bh=IZBBYw3vsOEnBByulARI9OMAft/HX8YpcrnjRmgF1eE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t50Ncmzxokp1mcV5fVwthH+Az6RittoE1/kfwBZgUNryG3+Ajuzq1ferns1njOUdBKXLVxbCTlM3k8spChp9unimX4CR1Uun2+DGXfr1p2Dxzik6W3KNJshBjLJUugllO+65o0y8qi23wMtcAfdqsMfz3cI1otJ3vWpPZ24d2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvLZoAXi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvLZoAXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751015260; x=1782551260;
  h=date:from:to:cc:subject:message-id;
  bh=IZBBYw3vsOEnBByulARI9OMAft/HX8YpcrnjRmgF1eE=;
  b=FvLZoAXivODKp1nWR6f2gDo5KrIG1EculKNF8lQ73ilfIzeHCzvS4hS8
   pnMaNuqc109GTI8OzAx0BbcRuW6by2j2o0P5nCXiH+ks1vwANrkp6EaK4
   53JaBd7HhBmHW+k6CWLCHCjjC95LyHX0SRl3VW7PLCpPSo59YdxMjjYfo
   43ffCaMIYJr5pATYheM6GtXEE0/p2YQQMHOGWYQtspiBxjMSjuYuLxm56
   NJjRzicUEu4QZNVnnbPJ3VVd9FjdED6Jao3rVRa2H6WtWWr/0vKmAilpG
   1MB3GEw5aWAtUlQSbVJycYKU46khu41Ah5g5cxJcPOFtMIEsbXa/QcePW
   A==;
X-CSE-ConnectionGUID: STyfcLxEQ6+m+W3iMjPRZQ==
X-CSE-MsgGUID: Y61MMWvJQ3aiaT+qVJd3Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63582106"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="63582106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:07:39 -0700
X-CSE-ConnectionGUID: 9Ef9Q40YQG6nMu6DnexPQg==
X-CSE-MsgGUID: LScHhWR6T0iFNxYZsSN49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152276493"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 02:07:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV53X-000W0o-0L;
	Fri, 27 Jun 2025 09:07:35 +0000
Date: Fri, 27 Jun 2025 17:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 e51a38e71974982abb3f2f16141763a1511f7a3f
Message-ID: <202506271737.gzifUHgm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: e51a38e71974982abb3f2f16141763a1511f7a3f  Merge x86/bugs into tip/master

elapsed time: 1152m

configs tested: 20
configs skipped: 156

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250626    clang-20
i386    buildonly-randconfig-002-20250626    clang-20
i386    buildonly-randconfig-003-20250626    clang-20
i386    buildonly-randconfig-004-20250626    clang-20
i386    buildonly-randconfig-005-20250626    clang-20
i386    buildonly-randconfig-006-20250626    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250627    clang-20
x86_64  buildonly-randconfig-002-20250627    clang-20
x86_64  buildonly-randconfig-003-20250627    clang-20
x86_64  buildonly-randconfig-004-20250627    clang-20
x86_64  buildonly-randconfig-005-20250627    gcc-12
x86_64  buildonly-randconfig-006-20250627    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
