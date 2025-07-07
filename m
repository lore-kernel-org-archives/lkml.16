Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E827AC28
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871197; cv=none; b=G9BC2ZFvEn+WxtkHfbjzXIsmVIp8gW34ZetjTzKIVQ/xqFzN+3w486RZv3ywzUrpHjJtca8a5/IsovGA24opHzKk/P+zvmG9tE0DK2R/TwGEBziqBAZRhV3vkWKUn9xODYUSbNmf7OUVoOAhIcIhnC4d2/p2gi3Fd2/tGfLWAo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871197; c=relaxed/simple;
	bh=crwe9ZYMOHhqKIBLgTTyEdO92pYiAakwMimzlNLbSzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sbjsru+J58mgArC+qz229uRF+GAk1wN1vsKHwrnY5XZWmXd7704wi/ZdeK9XZhxSv1aSALBWFzh4X3spOoZkBwQ7DoWG9Xkoc2NkMoUDDQxsRz0cJLd203lxW5WXP59PtLUEhEA1UipOKOwfjBMhMFZykspx01nF9F43wEH/DIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBGLjtZi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBGLjtZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751871196; x=1783407196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=crwe9ZYMOHhqKIBLgTTyEdO92pYiAakwMimzlNLbSzA=;
  b=UBGLjtZiCSz88kAjo150CVMLnpErLfWQwyRgxY7WpJQ47tzQBB+3tY0G
   l3uYGUCLE8Svvg1D3xsxy/HG/PkXL/c78vBzPAvCh521t2PQLyoinDUTK
   pw6X8LENIkIS8V3O30mW6srGZvmFlX/KauXzvgG31izOz51AbO0UVp+ue
   mpU8ZU0EwzCxsi5dWON2QIp34T2bwjhGbPm3fJNbKkciioYYFkGVTGcrT
   KfHiBacni3c30M2F5T9c68iHuuPmkM0NRrZETPOlM1pmoEQCdlDiLi3Y8
   eXqq+oZf/9vGh0BhLKg2Mcj8JIuet6yRiqvGiIxUgSsRzh1VTnaCvePlG
   g==;
X-CSE-ConnectionGUID: veateFZrSFG57cQDkKcShw==
X-CSE-MsgGUID: UqXDbar2TzGZg6mc3cFjJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54008131"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="54008131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 23:53:15 -0700
X-CSE-ConnectionGUID: o40pmrtyToCdsgZYn8IiDw==
X-CSE-MsgGUID: c7/O7MTlTLOg8hq9zkLiUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155234991"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2025 23:53:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYfix-0000CT-1J;
	Mon, 07 Jul 2025 06:53:11 +0000
Date: Mon, 7 Jul 2025 14:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pan Deng <pan.deng@intel.com>, peterz@infradead.org, mingo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	tianyou.li@intel.com, tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com, pan.deng@intel.com
Subject: Re: [PATCH 3/4] sched/rt: Split root_domain->rto_count to
 per-NUMA-node counters
Message-ID: <202507071453.DYRB711b-lkp@intel.com>
References: <2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng@intel.com>

Hi Pan,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.16-rc5]
[also build test ERROR on linus/master]
[cannot apply to tip/sched/core peterz-queue/sched/core tip/master tip/auto-latest next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pan-Deng/sched-rt-Optimize-cpupri_vec-layout-to-mitigate-cache-line-contention/20250707-131831
base:   v6.16-rc5
patch link:    https://lore.kernel.org/r/2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng%40intel.com
patch subject: [PATCH 3/4] sched/rt: Split root_domain->rto_count to per-NUMA-node counters
config: arm-randconfig-002-20250707 (https://download.01.org/0day-ci/archive/20250707/202507071453.DYRB711b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507071453.DYRB711b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507071453.DYRB711b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:496:21: error: unknown type name 'atomic_tp'; did you mean 'atomic_t'?
     496 | int rto_counts_init(atomic_tp **rto_counts)
         |                     ^~~~~~~~~
         |                     atomic_t
   kernel/sched/rt.c:501:25: error: unknown type name 'atomic_tp'; did you mean 'atomic_t'?
     501 | void rto_counts_cleanup(atomic_tp *rto_counts)
         |                         ^~~~~~~~~
         |                         atomic_t


vim +496 kernel/sched/rt.c

   495	
 > 496	int rto_counts_init(atomic_tp **rto_counts)
   497	{
   498		return 0;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
