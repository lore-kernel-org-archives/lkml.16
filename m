Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F47291C35
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524182; cv=none; b=A872wn1Q1V2uaC4cq0N+UMxv+2PDR3RRhf2UjSmyR5wVYQZdC6ffJEZUi/k85DB3bk+6AUZirZ56BO0cI1P+QJOwO2Rpy3pFH5etnZs0JSV0z2ce0bpOJ07dO9+51gb1euxRXAk9ySZ3l2LTy35z4BpRqWE1ljhG1iOr33OBYao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524182; c=relaxed/simple;
	bh=90nTFynEDHsaWXX962iTaj2KmuXCT2e7KKha/ny7pSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCauu5XRWUVxGl8DKuvFO6jU8VnG0o2OV2LmutaaOEpSim0C9BuD0/TLx4y0GXnhnmuRHYCxRfXqgxUkUtTmgod3GQYu3WJdcj9oETOsiNsysT+EzO5OfbaEO9Ew9uCw7EgRFRv6cQ6VkSenfGa3z6CJruzfs7G4JzqP8GdTnNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8strBBn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8strBBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751524181; x=1783060181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90nTFynEDHsaWXX962iTaj2KmuXCT2e7KKha/ny7pSc=;
  b=e8strBBnNS11hCJi0BWruWl2G7nQiP2yPmnycDVspc2dOEMj1sRElUD6
   4HjkRYReXw31NnPGuRYTXU8XDvEwJAf31o0xD4gH1w5IAmmjNhyA+3AiX
   +S0rWFc/e663Ni5ACR9cJt9+TEFzL7IMJll7XHljKxbjtmrB23RVMvEAM
   Zx5weJf10ielPFTWavT5wVA8pFWL4iEbOOBuLN5Yr5E1iiuEHzIztlX5P
   72O6MBdIecoBngz8jRyJx0C/2Ik9VDHd/+Qzawu7q83Frjqkumkzns70N
   Ihp+dGJyzFXw7IbvtnKhbsJK43apLa/WHtWfMO5SYFhCT85CcUM1tj1mK
   A==;
X-CSE-ConnectionGUID: EGXCcFY9QlmnVjoJX47Ifg==
X-CSE-MsgGUID: zNEA5xgwSoKq/LhkakUOlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53978747"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="53978747"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 23:29:40 -0700
X-CSE-ConnectionGUID: MiGruOc4RDisykkXGGh/Eg==
X-CSE-MsgGUID: O7OGD8FYSSi9naEIzL+pIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="153693361"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2025 23:29:39 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXDRw-0000Qb-2S;
	Thu, 03 Jul 2025 06:29:36 +0000
Date: Thu, 3 Jul 2025 08:28:37 +0200
From: kernel test robot <lkp@intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: ld.lld: error: undefined symbol: v4l2_flash_release
Message-ID: <202507030815.770r4UoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4911fb0b060899e4eebca0151eb56deb86921ec
commit: b338a2ae9b316df1d81b5289badcc8cbbbfe1b2b leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver
date:   6 weeks ago
config: x86_64-buildonly-randconfig-2002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507030815.770r4UoZ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030815.770r4UoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030815.770r4UoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_flash_release
   >>> referenced by leds-tps6131x.c:792 (drivers/leds/flash/leds-tps6131x.c:792)
   >>>               vmlinux.o:(tps6131x_remove)
--
>> ld.lld: error: undefined symbol: v4l2_flash_init
   >>> referenced by leds-tps6131x.c:728 (drivers/leds/flash/leds-tps6131x.c:728)
   >>>               vmlinux.o:(tps6131x_v4l2_setup)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
