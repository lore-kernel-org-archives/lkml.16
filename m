Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD626AE4
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748756129; cv=none; b=du1Xh0Hl46NqTQUO5qOQWIxhlXstA2rzP7HwMwqKFC3AJO4zJ7+NvK/n91+FbfJmQ9o8NXPep3sSEpRqZVp/d/js64JlixBurzKIBtaD2SovsrD38szwvoLdAhocHsryXo3ws4rch+WIzJeIMd3e7FuK5SSpK/hudSIm4RTEpAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748756129; c=relaxed/simple;
	bh=FFUPbQkhbDf3Pei6LzsEqJ9ilaES8CirMabm4FvkECI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNX8091LQtq9I0ka/m1HZASEhLhklBl/TohTfdS/iWatmidM6oqE2mndeUw94OyfgDJ5eOsdIPtd/XH2laXokMvWOOYhMWOvF/+cXon7SOuCG5vbG5xl6fbjBB63GQ4AJInr8fmFolqlfbCMHKv/qNbcLhgEUXDs0Fi9UkH6E3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJIVSjaC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJIVSjaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748756126; x=1780292126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFUPbQkhbDf3Pei6LzsEqJ9ilaES8CirMabm4FvkECI=;
  b=nJIVSjaCbcSL/Ko6S6DuFlOSzu1QJDJH9dCr7d/Jp07igLysXcHjQZg6
   t8kjH/4Ok/gyh5SZ4Y+C7gVY8Iakqkr+xiGD8BLEzyBSJ9I1m5lUMNEOH
   917fKV8qSCX0KTswKd/zy41Ol8l2bCMPjhWnr1MdC37MsvCwVKDq6QV34
   PrGzNogBkaGehQFvZYuImc70H+3K1NOpw0bMbe8Rsf0JXlgegV8hm5c6L
   gQfR9eBc7RXOf3418UQnJYZdX4nGm5FG1XiZEVRoZBsD6fowPalDLvE0z
   h76Y0XPmEEqMpwLCo3a9gc34w7OLBXy86fbifobQBSCWO5zA4ulL1VDQa
   w==;
X-CSE-ConnectionGUID: LwyNcaVyQjC12Rg+Y3859A==
X-CSE-MsgGUID: kt0GynaaRGaHyCADCr5l1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54599962"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="54599962"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 22:35:25 -0700
X-CSE-ConnectionGUID: /OgQQFawTnaDAmqpT5DHwQ==
X-CSE-MsgGUID: bEsIARWKR/W5YpysdNBvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144221702"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2025 22:35:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLbLt-000Yow-0v;
	Sun, 01 Jun 2025 05:35:21 +0000
Date: Sun, 1 Jun 2025 13:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory Price <gourry@gourry.net>, Harry Yoo <harry.yoo@oracle.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Honggyu Kim <honggyu.kim@sk.com>
Subject: mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
Message-ID: <202506011545.Fduxqxqj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d4e49a77d9930c69751b9192448fda6ff9100f1
commit: e341f9c3c8412e57fe0042a33a2640245ecdf619 mm/mempolicy: Weighted Interleave Auto-tuning
date:   11 days ago
config: loongarch-randconfig-r054-20250601 (https://download.01.org/0day-ci/archive/20250601/202506011545.Fduxqxqj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506011545.Fduxqxqj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field

vim +3719 mm/mempolicy.c

  3700	
  3701	static void wi_state_free(void)
  3702	{
  3703		struct weighted_interleave_state *old_wi_state;
  3704	
  3705		mutex_lock(&wi_state_lock);
  3706	
  3707		old_wi_state = rcu_dereference_protected(wi_state,
  3708				lockdep_is_held(&wi_state_lock));
  3709		if (!old_wi_state) {
  3710			mutex_unlock(&wi_state_lock);
  3711			goto out;
  3712		}
  3713	
  3714		rcu_assign_pointer(wi_state, NULL);
  3715		mutex_unlock(&wi_state_lock);
  3716		synchronize_rcu();
  3717		kfree(old_wi_state);
  3718	out:
> 3719		kfree(&wi_group->wi_kobj);
  3720	}
  3721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
