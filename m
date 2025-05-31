Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235C0187876
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748721765; cv=none; b=pOd5LXHzxg2OLJRnq0zx29AMKflCuRp91jtx/kSmSUVC7OPxeF/ZYp5imZP/TwNXchp2v0izXnex8piMfzdVz2romNpT1oAZ+IQSIJWo8N1/ZucOrmT/pJThMqVxp/N3u0GedCLQFoXjrdF4wjSWCDLS7vtnLweWMV4xm0GD9EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748721765; c=relaxed/simple;
	bh=5suRmS4EKq2uD/a9czyj8FamPoXc1b75xEoWxMjQGpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ydheo4kb/3Lp+ei0hSWqF+gQX4k63VYr9PL9g2Fb73CtoeyAJpI4oUPd6NvMEc3EiQoScAXGoz14SV4dIE3TaAOB5Nvaki3iBDEztrTCvKABUkqPIrAjGbjp34tr24pVng4Wdbvyh/5ZF3B9YHP4qwIVMJf0P6nSiH1L/Zw8Qt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUDJKGcr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUDJKGcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748721763; x=1780257763;
  h=date:from:to:cc:subject:message-id;
  bh=5suRmS4EKq2uD/a9czyj8FamPoXc1b75xEoWxMjQGpA=;
  b=RUDJKGcrWKdFuBoJHhOtT0FjzMycWau8f9/gvb/4ymJg3FV1QQ/ZSkMv
   O7PsXg2ZVIUx7ZVdSGz+FVPcrbQJ+rnShtQBLYaUPbko4yJYHzzrQp2AL
   jfpeXMHDnDqGNaBe2JDCFJ1owZQ0Vy2Qw5X4z+XCVoQVIneRU4F2q4ZDx
   iw6vqUOfG21wG/TI8/tA5BaUj6ItSQ4ojSYgAaDrctHZx5wyDqYgSTMKc
   remeLz0upsbynDRN6U83aD2HUuLNc03NVN/FtjDS6cf5yx4KMlzGnYD55
   5l7G3SoRbFDwPC5eJDtG/QMv7rkBrxyE2M5IuykiRwMhvWXktXzwNEvXO
   Q==;
X-CSE-ConnectionGUID: P21T/NEOQgyout9es0MwqQ==
X-CSE-MsgGUID: 2zxH643yRci252/fn8AnBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="49907113"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="49907113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 13:02:42 -0700
X-CSE-ConnectionGUID: BZ46lKexQHasz9RvNDYIvg==
X-CSE-MsgGUID: HmV5GqhTRt6N8c7aVkiuoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144151808"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 13:02:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLSPf-000Ybw-2O;
	Sat, 31 May 2025 20:02:39 +0000
Date: Sun, 01 Jun 2025 04:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 99850a1c93fe7ca40ad9efddc00acec6e85c5e48
Message-ID: <202506010421.7TSQlygI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 99850a1c93fe7ca40ad9efddc00acec6e85c5e48  x86/fpu: Remove unused trace events

elapsed time: 721m

configs tested: 20
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
