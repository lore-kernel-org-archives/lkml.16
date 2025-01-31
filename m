Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8B383A2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 04:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738297696; cv=none; b=HKQWwconNeXltYEYihK1/CsWNQlqtYIIWmRtnSAuKdF8ZZi2wt/2BnkgRMIzJGdyMKilCLXP4/4PFcVVf8ythb1Y1QDZZrf0HABmC/X1qLbomjXwLZ8x0nFPMHf4O+pAqyk1r6J4jLM7Ms4o2gHLHzy92QbN6GlMU/pPXonrVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738297696; c=relaxed/simple;
	bh=3PE3ysmpTyhxYXkJkewsvdh0oeXjjW3vhnHF4jm4Xvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJTZKuei8IKwox3wbirngJ2DniMSLaHKb6Wjr5VfrN3/aU13rmVbjCKssCsNDKlTb1WzTUrt2i8DRJOAP9bW0D23iexwDbaAO4slcLj2d3H8Pa72MKUCMkK18zTTHRFXcqJNf8XyUdKXYSB+p5tJUv5UFhOJxVR6VO0a/NJx0LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRxbcxI9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRxbcxI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738297694; x=1769833694;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3PE3ysmpTyhxYXkJkewsvdh0oeXjjW3vhnHF4jm4Xvw=;
  b=kRxbcxI9icAhVIK4ZFxriUVUx2Qbh5FVd7LiIVWUi6j9raQhe7dHlRjY
   USUyJK1+x4xgls6DeuPnPe0jKQvl0sHd5sYKVpHRp7AmwLQdNn/GiptT9
   sgC5VgyCCNDOnydGJLdXXFZLxB1GNRBe5xTnDJKegWiPnat/uhtYSLlXE
   Q4kX+WwuvdHjh9wpYQ0TN9uS/+DyE1Adl/CZisLNLdZxP/5Hw9csLCcQt
   vhMfnh6LGEv7gXfXn4sZhWlGV+BR5XWFaoPdfwmxs+4TO4nOVdkLO/ElK
   cJMAykEp8U9q4V8w4zJvAM08hesbhg+gBUN5sbqBZ/eX8NryFVBbtXWHt
   w==;
X-CSE-ConnectionGUID: br1yJoEmSXWs4P6VvjGNMw==
X-CSE-MsgGUID: 7uTy3fVeQYuoxd9onbxJ/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61335110"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="61335110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 20:28:14 -0800
X-CSE-ConnectionGUID: P8GeF+pDTLG8HGE+vzIa1w==
X-CSE-MsgGUID: 9TGCM0u6RseBFtriXzfqyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110405385"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Jan 2025 20:28:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdidW-000lyd-2J;
	Fri, 31 Jan 2025 04:28:10 +0000
Date: Fri, 31 Jan 2025 12:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: drivers/gpu/drm/ttm/ttm_bo.c:1097: warning: Function parameter or
 struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
Message-ID: <202501311207.5xG7o8Yu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: 2b624a2c18656ea32e0849e7bc0018ba3c97ca64 drm/ttm: Handle cgroup based eviction in TTM
date:   3 weeks ago
config: csky-randconfig-r001-20230826 (https://download.01.org/0day-ci/archive/20250131/202501311207.5xG7o8Yu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311207.5xG7o8Yu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311207.5xG7o8Yu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo.c:1097: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
>> drivers/gpu/drm/ttm/ttm_bo.c:1097: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'


vim +1097 drivers/gpu/drm/ttm/ttm_bo.c

a3185f91d0579b Christian König   2022-05-09  1086  
10efe34dae798c Thomas Hellström  2024-07-05  1087  /**
10efe34dae798c Thomas Hellström  2024-07-05  1088   * struct ttm_bo_swapout_walk - Parameters for the swapout walk
10efe34dae798c Thomas Hellström  2024-07-05  1089   */
10efe34dae798c Thomas Hellström  2024-07-05  1090  struct ttm_bo_swapout_walk {
10efe34dae798c Thomas Hellström  2024-07-05  1091  	/** @walk: The walk base parameters. */
10efe34dae798c Thomas Hellström  2024-07-05  1092  	struct ttm_lru_walk walk;
10efe34dae798c Thomas Hellström  2024-07-05  1093  	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
10efe34dae798c Thomas Hellström  2024-07-05  1094  	gfp_t gfp_flags;
2b624a2c18656e Maarten Lankhorst 2024-12-04  1095  
2b624a2c18656e Maarten Lankhorst 2024-12-04  1096  	bool hit_low, evict_low;
10efe34dae798c Thomas Hellström  2024-07-05 @1097  };
10efe34dae798c Thomas Hellström  2024-07-05  1098  

:::::: The code at line 1097 was first introduced by commit
:::::: 10efe34dae798c652053d4363871914c478f1475 drm/ttm: Use the LRU walker helper for swapping

:::::: TO: Thomas Hellström <thomas.hellstrom@linux.intel.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
