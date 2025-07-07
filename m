Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7128A1EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875043; cv=none; b=FI6dyARcAVqoeKrtkioMvqaghSS/O3Rk+anylr2oBoYl1CXokes1mXeAJP1RfrSm/KssvuqtH9BexjhOZb40QYv2M2dqUCIwJeMuO6tz5/jVykst6q9h5pXRtByAgeM6vEjAmjRJY5f/gYy8ABHM5+1QwmlXUiWxotV6bwGPGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875043; c=relaxed/simple;
	bh=EBP+uX7EjPPG6O8rMrl9+Pdc7gOWG/A+1K6Rd8gbZSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XhVlwrmZhFqhPf03slMWeyYg2PBxbse0Dqeh+vj+jzuYalspNTc32Uu4ear9cQhSQXUE78njZUEOCBk3plazK3n2PY34TcG4+9XhIcSFWASy0yciIRlwwRMfbuLzhL44EUb4wqnBL6wYjM7pIHP1GmBGksKY1PdqyAZrbmZ4ix0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRs+fFrV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRs+fFrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751875042; x=1783411042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBP+uX7EjPPG6O8rMrl9+Pdc7gOWG/A+1K6Rd8gbZSk=;
  b=hRs+fFrVTpx739i+a3R8IxDCEltIv3/HLQza8CzHV2ws7+vEIDg18VeO
   GSBJcIQaXlTTFYVUdRqKDONNbcbF1iqhU9ZfpZgqaNTp6GMhbHKxBBbMi
   n5P7fDAq7pbOVvCEHeR985A2a7cy2dFrO0LTMJ+Z79w6B2fLnMimm6enC
   ju8xPYGVnM0XnHWCq639LvlzmxCbQOLBevYtZrFVdl7e/aYvP7LGNBfBv
   nRUrVIe0Z3RiajL7Ceo8IXPN86U2M4J+DPDSTj7bL26Lft78R55O4rmMn
   US/wDfLD/TmETA/2tIXJTBo3j6tq0v3uOXvHFldYMgRoiykFDCOzjxbs6
   w==;
X-CSE-ConnectionGUID: b0VA8qEFRGSrXy1J4RbKjQ==
X-CSE-MsgGUID: Mq/pYtpCRc6HkMHWDysAaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="57889879"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="57889879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 00:57:21 -0700
X-CSE-ConnectionGUID: asIM1z3ESgqRJr+UIuQgJA==
X-CSE-MsgGUID: M58vytgJQviHWadG0PHniQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="186170792"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2025 00:57:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYgiz-0000Fj-13;
	Mon, 07 Jul 2025 07:57:17 +0000
Date: Mon, 7 Jul 2025 15:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/slub.o: warning: objtool: ___slab_alloc.isra.111.part.112+0x4c0:
 can't find jump dest instruction at
 .text.___slab_alloc.isra.111.part.112+0x68c
Message-ID: <202507071557.SDU74U31-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
commit: 4496e1c1354bd4837bcc1414f6e1a4d042857903 crash_dump, nvme: select CONFIGFS_FS as built-in
date:   6 weeks ago
config: powerpc-randconfig-r131-20250707 (https://download.01.org/0day-ci/archive/20250707/202507071557.SDU74U31-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250707/202507071557.SDU74U31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507071557.SDU74U31-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.o: warning: objtool: ___slab_alloc.isra.111.part.112+0x4c0: can't find jump dest instruction at .text.___slab_alloc.isra.111.part.112+0x68c

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HUGETLBFS
   Depends on [n]: (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
   Selected by [y]:
   - PPC_8xx [=y] && PPC32 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
