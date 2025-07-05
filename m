Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D020E155C82
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724967; cv=none; b=P1FKxODPZPC1tXjq8qiYKmOwrjjp/fPQws7ApM8M5kh5MumTyzZQpFU+m+sS32c/OHU2oOZ0FTer57JRp+V1X6pyzsI1PZ9VAQ/EqVCT2YfCxYA/4i/eV06MoEWuW8/xBjxDot/nJ9lhfPRA0yWmx2BnYP9JaeCejgtKpAmHNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724967; c=relaxed/simple;
	bh=A4cUfru2n7vPoeaTc8J+nKwy41BFBAX5DrVrWB/g3OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGBMUZulMmFuYN2JGMtk/L2TlRy7h+xsNL8mVGPc8iQykH2lT0DSiSmJbn2jV4T0uNGjxkrq7KR0DZeo1f6vhD+KRa+yhjEg3N2UwDUfakQgm58PwOdIniULEHgZrzV+OSTTZN9m7guvoxY5iTmIWUDnGhpfG0CWpVPDAe3h1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S83RRbS3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S83RRbS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751724965; x=1783260965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A4cUfru2n7vPoeaTc8J+nKwy41BFBAX5DrVrWB/g3OM=;
  b=S83RRbS39leQkR0Li8Hq9M9+bAA9PBRbiflBrAqoqfjhZHHYGOHwDX0D
   yGIV7sp2sDx3FFSOwk2uHXumM/wAw5OPNi3WbhUJhhDe3P+zVeLYMGis8
   F20Tlead+H8BMc7CO5mqMXI8kSJAAH2ozDQLUGkwoaQa9uGPlSEFiAh1Q
   Hq2F2sbFfPprN85VVOp14EQZBNMyDqMmBFih/KwE/6rj6d9pe+pflOYfO
   smZwojS++ewP1e0zaKDz3Jr3baK3aYrG8SExfe0kIVpFlojtiVJ3bt4VK
   l61YR6CDNd8BHNGvjxtDC7XEbQMtm7opILK2QOYDFyTvVYtZqMH7jRK3I
   w==;
X-CSE-ConnectionGUID: qMpYuY5dTUmA+J3tHT+Itw==
X-CSE-MsgGUID: McAcqdgATgyoroOpMyOzMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53891987"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="53891987"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 07:16:04 -0700
X-CSE-ConnectionGUID: Df/EWjQ2RsuXS0UAzlUrZg==
X-CSE-MsgGUID: K7s1JiCORDSWhEDy3bbqSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="155309790"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2025 07:16:02 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY3gN-0004XJ-0l;
	Sat, 05 Jul 2025 14:15:59 +0000
Date: Sat, 5 Jul 2025 22:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 3/6] sched/fair: Remove spurious shorter slice
 preemption
Message-ID: <202507052215.5HznxNGI-lkp@intel.com>
References: <20250704143612.998419-4-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704143612.998419-4-vincent.guittot@linaro.org>

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/sched-fair-Use-protect_slice-instead-of-direct-comparison/20250704-223850
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250704143612.998419-4-vincent.guittot%40linaro.org
patch subject: [PATCH v2 3/6] sched/fair: Remove spurious shorter slice preemption
config: s390-randconfig-r072-20250705 (https://download.01.org/0day-ci/archive/20250705/202507052215.5HznxNGI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507052215.5HznxNGI-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:8721 check_preempt_wakeup_fair() warn: inconsistent indenting

vim +8721 kernel/sched/fair.c

  8643	
  8644	/*
  8645	 * Preempt the current task with a newly woken task if needed:
  8646	 */
  8647	static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int wake_flags)
  8648	{
  8649		struct task_struct *donor = rq->donor;
  8650		struct sched_entity *se = &donor->se, *pse = &p->se;
  8651		struct cfs_rq *cfs_rq = task_cfs_rq(donor);
  8652		int cse_is_idle, pse_is_idle;
  8653		bool do_preempt_short = false;
  8654	
  8655		if (unlikely(se == pse))
  8656			return;
  8657	
  8658		/*
  8659		 * This is possible from callers such as attach_tasks(), in which we
  8660		 * unconditionally wakeup_preempt() after an enqueue (which may have
  8661		 * lead to a throttle).  This both saves work and prevents false
  8662		 * next-buddy nomination below.
  8663		 */
  8664		if (unlikely(throttled_hierarchy(cfs_rq_of(pse))))
  8665			return;
  8666	
  8667		if (sched_feat(NEXT_BUDDY) && !(wake_flags & WF_FORK) && !pse->sched_delayed) {
  8668			set_next_buddy(pse);
  8669		}
  8670	
  8671		/*
  8672		 * We can come here with TIF_NEED_RESCHED already set from new task
  8673		 * wake up path.
  8674		 *
  8675		 * Note: this also catches the edge-case of curr being in a throttled
  8676		 * group (e.g. via set_curr_task), since update_curr() (in the
  8677		 * enqueue of curr) will have resulted in resched being set.  This
  8678		 * prevents us from potentially nominating it as a false LAST_BUDDY
  8679		 * below.
  8680		 */
  8681		if (test_tsk_need_resched(rq->curr))
  8682			return;
  8683	
  8684		if (!sched_feat(WAKEUP_PREEMPTION))
  8685			return;
  8686	
  8687		find_matching_se(&se, &pse);
  8688		WARN_ON_ONCE(!pse);
  8689	
  8690		cse_is_idle = se_is_idle(se);
  8691		pse_is_idle = se_is_idle(pse);
  8692	
  8693		/*
  8694		 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
  8695		 * in the inverse case).
  8696		 */
  8697		if (cse_is_idle && !pse_is_idle) {
  8698			/*
  8699			 * When non-idle entity preempt an idle entity,
  8700			 * don't give idle entity slice protection.
  8701			 */
  8702			do_preempt_short = true;
  8703			goto preempt;
  8704		}
  8705	
  8706		if (cse_is_idle != pse_is_idle)
  8707			return;
  8708	
  8709		/*
  8710		 * BATCH and IDLE tasks do not preempt others.
  8711		 */
  8712		if (unlikely(!normal_policy(p->policy)))
  8713			return;
  8714	
  8715		cfs_rq = cfs_rq_of(se);
  8716		update_curr(cfs_rq);
  8717		/*
  8718		 * If @p has a shorter slice than current and @p is eligible, override
  8719		 * current's slice protection in order to allow preemption.
  8720		 */
> 8721		 do_preempt_short = sched_feat(PREEMPT_SHORT) && (pse->slice < se->slice);
  8722	
  8723		/*
  8724		 * If @p has become the most eligible task, force preemption.
  8725		 */
  8726		if (__pick_eevdf(cfs_rq, !do_preempt_short) == pse)
  8727			goto preempt;
  8728	
  8729		return;
  8730	
  8731	preempt:
  8732		if (do_preempt_short)
  8733			cancel_protect_slice(se);
  8734	
  8735		resched_curr_lazy(rq);
  8736	}
  8737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
