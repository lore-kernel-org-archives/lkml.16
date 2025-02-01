Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95F1CCEF6
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738433986; cv=none; b=oErMB0+szSAWq7oowctKgIg2AdUvo2LGXUMVYf8c7ZfJZ27+X/cJLI6TlQSrAKw7xo271cG+NJD41KpB/XXohZJuqrAyRzsL1PxF9swQvhtcZW9Oo8QCqvX97aaCmtJWyT4j72mWJx7z3k/iS/yhea35C7lKRj8Ow8FOeZpAFZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738433986; c=relaxed/simple;
	bh=5iYGG1wWPcZ0bzt14T4NPbFk++tOHVWA0UAKJ14kSPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgDzeQxY1QLaPKmhLcTeqIrid52QrLD83HGHy8iSYdNxo23FUQ0MFozrou4tmoH7tSvxNtiaY9bsU57rkI+SFEn2aAC1+6wGz03Hv2/TKJ47x2ymi5jWG/YDVun82G+NSo7MPGnH6+mypHuJ+C8y/ehryOg891M5lIQnljRw/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYQjFH6q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYQjFH6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738433984; x=1769969984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5iYGG1wWPcZ0bzt14T4NPbFk++tOHVWA0UAKJ14kSPA=;
  b=JYQjFH6qbw37zHp+sOOyqHJLWH+1YxkKX8R0jJAhaqIwbGrayYXHguJZ
   2qsv4/ZHJ1aWmC3XfqXVLRdUTMTmjF5NDibWBVzs0MV7wSHY9xocuhDLM
   KoFj5c2AZgs3jdaoJnQi6v8+vhyMTVQwyJXiag/H0ZbNEyvdZgaga4jIZ
   G1jTS43urYhb4fEG2MXJGZmPteEcQOqRC7TBh13udY1JRopvYbCV4Tnmp
   RnadPYqPyIfgbgTRVY51I9cYKnxpzvuT+oDROERLZrfBE7pgJjGmmy0oy
   t3IOHz4cKhwqwgYqFfp0n1YbS3CodEuSrVhWMruLntzgz+v6rs7ytMXLW
   g==;
X-CSE-ConnectionGUID: ENCr4JCKR0m/7mNSNtMODQ==
X-CSE-MsgGUID: wtEeJfzlQAiqCBOREafQaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42632154"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42632154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 10:19:44 -0800
X-CSE-ConnectionGUID: 1oP0XHJ0Rjmzpy4yzW1Mgg==
X-CSE-MsgGUID: 7Nc9lYCMTCKHXKbzfe3uQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147110974"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Feb 2025 10:19:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teI5k-000oRl-1w;
	Sat, 01 Feb 2025 18:19:40 +0000
Date: Sun, 2 Feb 2025 02:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against
 symbol 'ppc_md'; recompile with -fPIC
Message-ID: <202502020214.5NNn449d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   60c828cf80c07394762a1edfaff63bea55cc8e45
commit: c738866e47ef2e4d543698f0ab370ffe2b7e0d59 bcachefs: check_extents_to_backpointers() now only checks buckets with mismatches
date:   5 weeks ago
config: powerpc-randconfig-r123-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020214.5NNn449d-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250202/202502020214.5NNn449d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020214.5NNn449d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'ppc_md'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/setup-common.o)
   >>> referenced by idle.c:38 (arch/powerpc/kernel/idle.c:38)
   >>>               arch/powerpc/kernel/idle.o:(powersave_off) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
