Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085701B4F0F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662557; cv=none; b=q0EVpz4wlX06uY+cYwkM9ZT7ErnC5knrWuN8ZT40uERJHMHuAyVnU80zrh3JWOwQE9BSiuOY1LT79tKcKaBruGW/dlk7k4YdpNukv3hWl6pIN5A/RA7AUfho0rc6lwWVe2oQuHYRM6aHMtXH4aLFsl6JmJ0iP3kXII//gwWdfts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662557; c=relaxed/simple;
	bh=Bgg33G1mN4LgBsqM1Yzp9RAosd2oACBOwE1ILaEVsgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UI2zSrN/RHTTN+QtUnj+igukxbcSCAUxMOSpoJvkafKd03flKuu2VKWytmiEHTsht53O36gzq231fuuVgmoPbgCk2obHlb+I/n9/pKy61soxuatAIToh1rFW9rTdWUJoQs4LKRb0IA5pH4UdHEesm9NECtSDsJmLR/xMRBv9rbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAWTdLnF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAWTdLnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745662555; x=1777198555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bgg33G1mN4LgBsqM1Yzp9RAosd2oACBOwE1ILaEVsgo=;
  b=iAWTdLnFG3MhYUMr/HM85FmpfDTS1+Ais7TfNuyiJoeAU1cER/NRgn6T
   aAc8T+leuzy0DfWu2GvFQ85tpzBykH5291orWqGlgKKFE/Pkx1Klt9MTy
   a35fVLT22UBhvhV8Nt+OuKFUW9ae9oLa6E9tCdmoQ8jOEG3UPixulPbRE
   UtCOX1lHRTvqS/sNMHgWGUD60JNlK26+74voi3LT77qMTxbnN+C2y4kb0
   vTBtYtXobqs6A4+RWr4us/XtxpDW9cnwku8wslMVZ0m4PU7Us0ZPRxTl6
   YJJrD93C/7yoRmudeyqObM9jKDpKHPS8lcAwvJQJHNLue9EtiBVb90+n/
   w==;
X-CSE-ConnectionGUID: a1LsRRnfRzK/oDkj4QW3Qw==
X-CSE-MsgGUID: oot/4q1ARNGnrWWcaRRy4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47440632"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47440632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 03:15:54 -0700
X-CSE-ConnectionGUID: iGNUiYHKTDarzNwTKIgAdw==
X-CSE-MsgGUID: heu8r2mfQLC2d9QR24KzzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="132988490"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Apr 2025 03:15:53 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8cZa-0005np-1S;
	Sat, 26 Apr 2025 10:15:50 +0000
Date: Sat, 26 Apr 2025 18:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: drivers/phy/starfive/phy-jh7110-dphy-tx.c:178: warning: Cannot
 understand          * @maps:
Message-ID: <202504261831.YcGFqEO5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: d3ab7955330843699cdcc413edd7993923e6c016 phy: starfive: Add mipi dphy tx support
date:   11 months ago
config: riscv-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261831.YcGFqEO5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261831.YcGFqEO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261831.YcGFqEO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:178: warning: Cannot understand          * @maps:
    on line 178 - I thought it was a doc line


vim +178 drivers/phy/starfive/phy-jh7110-dphy-tx.c

   175	
   176	struct stf_dphy_info {
   177		/**
 > 178		 * @maps:
   179		 *
   180		 * Physical lanes and logic lanes mapping table.
   181		 *
   182		 * The default order is:
   183		 * [data lane 0, data lane 1, data lane 2, date lane 3, clk lane]
   184		 */
   185		u8 maps[STF_MAP_LANES_NUM];
   186	};
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
