Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1D78F4A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320995; cv=none; b=Kq818jI+jqYszDxFPskPqWHe4zQjcby2UgLqCwcL+Ig+f5AxCe5VxYmH6toN6LB0xSMAldwIx2byhZ4nvBouscVCpcFp24jLwzobLwIci8vP8BOkwDuyEG5JKKQJdCKD4CodjPlt0+ChvJ27CZMfqDnLzKpeN6sBbU+Fbq+JqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320995; c=relaxed/simple;
	bh=xceCiZ4X/NzybNgVtycT/bxaXCHgP/CAYkWlUb+F2DM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s/hgie30pFUZoBCJbIyjkmHwmMx/4FPv2BLNi4aL4lnyNfZDE07SJUSVDkU9ofS/+iigFbphf1rt5NoGQe5UjVgSbbbTho/PRefOGeDsopbyllav+ofKsURReSCh2OY9Rgrs0D7+p0XPB2jKvu8tvwF4cZnXpqtvrFUhZSnSohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXy9HmND; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXy9HmND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751320993; x=1782856993;
  h=date:from:to:cc:subject:message-id;
  bh=xceCiZ4X/NzybNgVtycT/bxaXCHgP/CAYkWlUb+F2DM=;
  b=nXy9HmND0i4QWUysjqkDo/+3yptJlLMjL/mTeUk+BNRIPPH7rnn9Q1/B
   5o7B5+XLNXqjJW4TMTK95FKk6EJ6FDQg9qG+LU8MGsnyMOIYXBK9hfkBG
   pxDWvQSDgLJmoWAmMdK5R1o3SYhwEZ99QZx+1c1ncvrm0tQ59QYFrGODP
   VZQ5F3LoCz/2S2i3GlEu9KE6DrVKtLmoDWdm0ety0bhWMFbwwB/WTdyk8
   EyoWnkFI8zhe97DFTQUC9WMWHpHBbYRO1tgfq74O3PlYa4o3HRlcSg7vK
   7USNq4wlf7zZUQuHjEXNbDu7wN1ZQqPwHIAPrmvBYHtd8xpu4u1Qp2+S+
   A==;
X-CSE-ConnectionGUID: c63SEiP/RrOIkKbttqvuZA==
X-CSE-MsgGUID: MQzbk808QKS+a7GicBzAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53706037"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53706037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:03:13 -0700
X-CSE-ConnectionGUID: jAgVlQkiQM6W+2FkVqA7gQ==
X-CSE-MsgGUID: X9EHn7zBRBy2n9gR/iH35Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="154107882"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jun 2025 15:03:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWMak-000ZPe-03;
	Mon, 30 Jun 2025 22:03:10 +0000
Date: Tue, 01 Jul 2025 06:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS WITH WARNING
 4a35d2b5254af89595fd90dae9ee0c8f990a148d
Message-ID: <202507010638.tdY9gY6N-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 4a35d2b5254af89595fd90dae9ee0c8f990a148d  x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202507010218.3O5Ge0Xt-lkp@intel.com

    arch/x86/coco/sev/core.c:2170:30: warning: variable 'dummy' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allyesconfig
    `-- arch-x86-coco-sev-core.c:warning:variable-dummy-set-but-not-used

elapsed time: 730m

configs tested: 20
configs skipped: 126

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250630    clang-20
i386    buildonly-randconfig-002-20250630    gcc-12
i386    buildonly-randconfig-003-20250630    clang-20
i386    buildonly-randconfig-004-20250630    gcc-12
i386    buildonly-randconfig-005-20250630    gcc-12
i386    buildonly-randconfig-006-20250630    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250630    gcc-12
x86_64  buildonly-randconfig-002-20250630    clang-20
x86_64  buildonly-randconfig-003-20250630    clang-20
x86_64  buildonly-randconfig-004-20250630    clang-20
x86_64  buildonly-randconfig-005-20250630    gcc-12
x86_64  buildonly-randconfig-006-20250630    gcc-12
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
