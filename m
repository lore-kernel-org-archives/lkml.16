Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F6262D29
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749017420; cv=none; b=j/T/tYEkb8vG1vqSfC3rn7HEs6B2Z0k1+8qQEUoPrm9HwUfJMB6a6FJ3g6zuh6CUPi1+mC42F8XR8ygstqNyglsT9NuHI3x/Yfy2SwiXnBqlV1ZZRKZ387iCN7xFX7b8bf+xgZcbNeqveFWM+TjSRN6aUMchLyYk1fkPCu23kJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749017420; c=relaxed/simple;
	bh=Mkq5WjqNAH4fbbGhZ7xDUwFGa/5GF00cq096FZHGhH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u3fI1d5av94z8bGFVXJOYjunl3p0RzYaLTcH2ZkFdJCduMkv53wwfqWhLG8I0+OG3V+IQDOsIyhB0gkpc204h60h+pp3Sx6GbK1HprU+5ZPoX2e3RPrAO8TIOEyV8Ehm5/+BPGYxQXsULnd/cK+xqQJ3O2mJ69OPau26ClgS8sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8DwReQ9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8DwReQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749017419; x=1780553419;
  h=date:from:to:cc:subject:message-id;
  bh=Mkq5WjqNAH4fbbGhZ7xDUwFGa/5GF00cq096FZHGhH8=;
  b=W8DwReQ9x81ta4HL1AxQzJ0zo6chzeusQnU7EyBQ4IiT2wzBxJtz38aZ
   serUqWadp0HVwR9+0PRowFp4VV79+vMQtt2UhQz/ZW3weYJMXLSgVln0j
   LXdtqZrWZdOpQJnf+pqPsf6xQLwi31g4Jy5tGOKaReeO+MFRIo4LS8xR0
   1BX4kzM6Svp1ZhPIFwdKWO2Jt8NQ6UIN1ZeATjROncGLjqgLYlU/bKh9K
   YErYdQp/YIW/16f4+fXmjAxtZniOAgMNa9y/ftaOKVHDDSaztXm/QDiGt
   fhnLsPPkmsrfb4qXx2WHH5csu+f9dqcGWDXCF3Xt3gPbKtv4HWOgmmH8F
   Q==;
X-CSE-ConnectionGUID: 2PuOHpnnSw6kaUlenwbYrg==
X-CSE-MsgGUID: 42O9b6qDR6KHLCKjpq8IWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62436965"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="62436965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 23:10:18 -0700
X-CSE-ConnectionGUID: xTgSdXXrTqmzYPmTcG+GGA==
X-CSE-MsgGUID: s14kOZFfRZmRXe1Htbeecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="182261889"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 23:10:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMhKJ-0002uv-1I;
	Wed, 04 Jun 2025 06:10:15 +0000
Date: Wed, 04 Jun 2025 14:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 8b68e978718f14fdcb080c2a7791c52a0d09bc6d
Message-ID: <202506041439.hgNEmgiK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 8b68e978718f14fdcb080c2a7791c52a0d09bc6d  x86/iopl: Cure TIF_IO_BITMAP inconsistencies

elapsed time: 935m

configs tested: 8
configs skipped: 28

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386     allmodconfig    gcc-12
i386      allnoconfig    gcc-12
i386     allyesconfig    gcc-12
i386        defconfig    clang-20
x86_64    allnoconfig    clang-20
x86_64   allyesconfig    clang-20
x86_64      defconfig    gcc-11
x86_64  rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
