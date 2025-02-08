Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F551F3B81
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739034635; cv=none; b=K2R1WYfpwjZTsLij5y8RB2nEw3o2Zz35+9z5MebuGLxA2+vBhKCTJ05xN1M6kPhgwN8LvyYW5Hw2szc7KbJSIEEHrv6jjaBBLoaor53BUe2dP+FMdlvSUI5AnMSAttvad7W+FvqE3zwwsToh6cQ+N0+hFzJXAo/kTdYdfF6DHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739034635; c=relaxed/simple;
	bh=5I4gv1iz+Iwzbf1Guaw6B313j642/FARaai0A9sSN5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDyC8cA8rc+D1WNmVRR7yWbDmd2dC/gQQUifgh6zoYE8RzMVh0UqYBUEFQQtO3gl6OQp1gvpNUk5nP+dE7KG0HejqItH3JSAnhWzZWWGCsrwozo+kR30FOE8tKwQQ8DSjoYRDyyorNCdSShMY/ZZDyUZfxGWrqGogjDv1BRWpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnXKVZ9P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnXKVZ9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739034634; x=1770570634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5I4gv1iz+Iwzbf1Guaw6B313j642/FARaai0A9sSN5Q=;
  b=MnXKVZ9PKY0wjNODnMHIAol2kp9hTgS4j7OQR4rUfKoe0263/DQE8FXj
   k9rocnvhuA1k/z36ECnmJRhTnuVEpRe7lZe65D9NXHZYIF1Is4Q/fpl7P
   iBj8UdHneRpaY97CnddC1jAC8yhzRM8nKUJnhRAZ48BmKmCil/FhpSiKJ
   FrF9f79tYbLaZt2gxdpEThOm0kusMhnElBry58q/1SGUJ643T9Zy22iLT
   so19OjSevBJJwfA1A/nBTaV8njQYDMea/lIVI48UIe3PTG0S+y4Mv9060
   UJCXjvR5brAWnh4Cur7T0aump/rw+BJgGBft0Ko/m8S+waHUY/kcLVaAL
   g==;
X-CSE-ConnectionGUID: qPgS1HnxRSGmhwhMIQRhYw==
X-CSE-MsgGUID: gaYbroVQRZ6UKZGDGEeXnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39788611"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39788611"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:10:34 -0800
X-CSE-ConnectionGUID: 4A0OKAZJSfKEV9IQzWNrxw==
X-CSE-MsgGUID: 33s9b7lkSyySSRSue7pDRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112692637"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 09:10:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgoLc-0010P2-2y;
	Sat, 08 Feb 2025 17:10:28 +0000
Date: Sun, 9 Feb 2025 01:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:sched/urgent 2/2] kernel/sched/fair.c:3785:23: error: 'struct
 cfs_rq' has no member named 'nr_queued'
Message-ID: <202502090110.YeF4kwO1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
head:   55294004b122c997591d9de8446f5a4c60402805
commit: 55294004b122c997591d9de8446f5a4c60402805 [2/2] sched/fair: Adhere to place_entity() constraints
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250209/202502090110.YeF4kwO1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090110.YeF4kwO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090110.YeF4kwO1-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'reweight_entity':
>> kernel/sched/fair.c:3785:23: error: 'struct cfs_rq' has no member named 'nr_queued'
    3785 |                 cfs_rq->nr_queued--;
         |                       ^~
   kernel/sched/fair.c:3816:23: error: 'struct cfs_rq' has no member named 'nr_queued'
    3816 |                 cfs_rq->nr_queued++;
         |                       ^~


vim +3785 kernel/sched/fair.c

  3773	
  3774	static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
  3775				    unsigned long weight)
  3776	{
  3777		bool curr = cfs_rq->curr == se;
  3778	
  3779		if (se->on_rq) {
  3780			/* commit outstanding execution time */
  3781			update_curr(cfs_rq);
  3782			update_entity_lag(cfs_rq, se);
  3783			se->deadline -= se->vruntime;
  3784			se->rel_deadline = 1;
> 3785			cfs_rq->nr_queued--;
  3786			if (!curr)
  3787				__dequeue_entity(cfs_rq, se);
  3788			update_load_sub(&cfs_rq->load, se->load.weight);
  3789		}
  3790		dequeue_load_avg(cfs_rq, se);
  3791	
  3792		/*
  3793		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
  3794		 * we need to scale se->vlag when w_i changes.
  3795		 */
  3796		se->vlag = div_s64(se->vlag * se->load.weight, weight);
  3797		if (se->rel_deadline)
  3798			se->deadline = div_s64(se->deadline * se->load.weight, weight);
  3799	
  3800		update_load_set(&se->load, weight);
  3801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
