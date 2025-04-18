Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F6C1CD15
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744950242; cv=none; b=stHG2DRX4xmXErgoWREcmm4MVRJQSfdOXxmiEMixbdsrmKhep/qRb7Hjha6OLGi5s7anVv/zT9YFlRlaPxv57IsJmqc4x2oqKOC3qb0LzGZKhTJ1CiPdQLLasUPOl1SHxiDcE1drc8fC/GxiSnV6anj94AKtFpSP4AGAnd9ca8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744950242; c=relaxed/simple;
	bh=V3popx7/6rBf/GHHCr3OfKcazwpLFU4qB38TjY3jMwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPCJ3SJTUfS/u2gPSL7C6xUWd/D4XpCBeKBmyWaJxOxTnSy8/sZ3Pazw+JhvoOoK3uBLCRQolA/P4Any9pKSBdqt+YFITSHG7DP/q5K1SMVhXM4l+VZg4MyQIQk+GTuRbUsHBoRXjqM//DwBV+My094AQpD6aLyc86U41ij00jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrblLx2Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrblLx2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744950241; x=1776486241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3popx7/6rBf/GHHCr3OfKcazwpLFU4qB38TjY3jMwo=;
  b=GrblLx2ZaSBPN4F/uMtwxLku0OoEVTuGtHcSnMgPjcXrN2nzjHywI9hr
   zIlQ+f0p24tZdJk2lBG4QGkRgtRATVrngrlxjcQDe7TeiAg1amCe+6Izk
   bPfmEHJdbt/doTTYgmOIlozsIDAdZH+X//Uz6/PYSUCQnagkSQSQKBCx8
   LJ2RhG/o9nPPYAQEhDc2WgpoDMMK3vy5JHM/9vsuUStKgMPH6vs1NYTmb
   D6wIQ2sO3Kxpu5IUcjUM3jecGVhrsRelqtjWNsNvqyUXMTPd4r9SJ4t0u
   Bm2V+LZjAw6g7kqo4k+nJly1vyyCunGIMPZzjD42RkFD7d+CfOSmoYKEa
   Q==;
X-CSE-ConnectionGUID: y3x+dYfzSq2dSLs/eqfS5A==
X-CSE-MsgGUID: gUlUOeZmQsKGcxdffZaS1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46580561"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="46580561"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 21:24:01 -0700
X-CSE-ConnectionGUID: Db1Kc4KjRqOzeeYvVzMGxA==
X-CSE-MsgGUID: PnpB9c8WQQy/lCZyEPPgGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="130878819"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2025 21:23:58 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5dGe-0002V5-2L;
	Fri, 18 Apr 2025 04:23:56 +0000
Date: Fri, 18 Apr 2025 12:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Holmberg <Hans.Holmberg@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divmoddi4'
Message-ID: <202504181233.F7D9Atra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
commit: 845abeb1f06a8a44e21314460eeb14cddfca52cc xfs: add tunable threshold parameter for triggering zone GC
date:   4 days ago
config: i386-buildonly-randconfig-004-20250418 (https://download.01.org/0day-ci/archive/20250418/202504181233.F7D9Atra-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181233.F7D9Atra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_need_gc':
>> fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divmoddi4'
>> ld: fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divdi3'


vim +186 fs/xfs/xfs_zone_gc.c

   162	
   163	/*
   164	 * We aim to keep enough zones free in stock to fully use the open zone limit
   165	 * for data placement purposes. Additionally, the m_zonegc_low_space tunable
   166	 * can be set to make sure a fraction of the unused blocks are available for
   167	 * writing.
   168	 */
   169	bool
   170	xfs_zoned_need_gc(
   171		struct xfs_mount	*mp)
   172	{
   173		s64			available, free;
   174	
   175		if (!xfs_group_marked(mp, XG_TYPE_RTG, XFS_RTG_RECLAIMABLE))
   176			return false;
   177	
   178		available = xfs_estimate_freecounter(mp, XC_FREE_RTAVAILABLE);
   179	
   180		if (available <
   181		    mp->m_groups[XG_TYPE_RTG].blocks *
   182		    (mp->m_max_open_zones - XFS_OPEN_GC_ZONES))
   183			return true;
   184	
   185		free = xfs_estimate_freecounter(mp, XC_FREE_RTEXTENTS);
 > 186		if (available < mult_frac(free, mp->m_zonegc_low_space, 100))
   187			return true;
   188	
   189		return false;
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
