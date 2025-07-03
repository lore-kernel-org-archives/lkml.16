Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3B2EE5F7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558567; cv=none; b=cL3zcqhoqTBA22wgV18AG46wYsubRpAeZ3h21hBJ77+avNKqaoLp238ezvYROSyuui2LqrF7ZlygOxSX8EgyQcjUnqwRfnlgKL4j1iBh6lNe8785pfsVg0pNMyHPBNyEla1aoxOxxznZ5TS7v+My1XC5g1xzdkI9PyyRveWS0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558567; c=relaxed/simple;
	bh=TY4yLMNjkRugTa/okMdIoOP1bnWENDOCYTwC6NjmULg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noNmV7n8i44H5ZzSXqXpS5Mvb9NN3p2nqY18iVuBT4l5iXRlR1fRL8WFofPjKWm8J6PrflD1oQJwW/tjsk7YijnSoiTjlo34dxF0AE7yL6S32rpYKulrlFKeihjQ3VtYNebhM9E3CxbGQZCOU6+e426BpAFIn6aKuqmmHtZgX7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgY8o46Y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgY8o46Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751558566; x=1783094566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TY4yLMNjkRugTa/okMdIoOP1bnWENDOCYTwC6NjmULg=;
  b=IgY8o46YaDEYb6N97DM2oIUTg+EFt28cpLf3AvMnJMoYjrWdHpLHQ4fC
   kfVoWxIWC2nNULEIzTjAJyrRn3TV1e7R1F+7pjVhJ4GrfcDK589DF3+NO
   Oja50CRqy9pbw6e6fZ/5rlJiCjuGMGn+goCne/10fea/XvYh9D7heGDw7
   Y8uQNhF5AT3GqLyzMuUI4b7Zk+s5Ov067iVuRVEI29CHWZ1ZzS2nWhqnd
   VsEhSXH0KGsZMFUDXOVi5PGhmhUyDD6w+3B4gYyapoSCGBnl4+Ds/5Isu
   P/ho+vl4bhrcZeHv+v/ZuNR3nuuKZ2m0Z0l7rOzkjnYnvb0aZevzmXbPH
   g==;
X-CSE-ConnectionGUID: dpzLQHUgQkOeilmVDPYUGw==
X-CSE-MsgGUID: kmNxUw4eS3SrhwNAd6elNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53117923"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53117923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 09:02:45 -0700
X-CSE-ConnectionGUID: itwYFqXiTEqwrPVag3Qfzw==
X-CSE-MsgGUID: Bg1RtVG/RPuhzHyjrcaYag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="158679754"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2025 09:02:42 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXMOW-0002ky-0f;
	Thu, 03 Jul 2025 16:02:40 +0000
Date: Fri, 4 Jul 2025 00:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, sh@gentwo.org,
	Darren Hart <dvhart@infradead.org>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>
Subject: Re: [PATCH] Skew tick for systems with a large number of processors
Message-ID: <202507032322.5jzirIYw-lkp@intel.com>
References: <20250702-tick_skew-v1-1-ff8d73035b02@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-tick_skew-v1-1-ff8d73035b02@gentwo.org>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on 66701750d5565c574af42bef0b789ce0203e3071]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Lameter-via-B4-Relay/Skew-tick-for-systems-with-a-large-number-of-processors/20250703-034357
base:   66701750d5565c574af42bef0b789ce0203e3071
patch link:    https://lore.kernel.org/r/20250702-tick_skew-v1-1-ff8d73035b02%40gentwo.org
patch subject: [PATCH] Skew tick for systems with a large number of processors
config: arc-randconfig-002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507032322.5jzirIYw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032322.5jzirIYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032322.5jzirIYw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/tick-sched.c: In function 'tick_setup_sched_timer':
>> kernel/time/tick-sched.c:1577:44: error: 'CONFIG_TICK_SKEW_LIMIT' undeclared (first use in this function); did you mean 'CONFIG_TICK_ONESHOT'?
    1577 |                 if (num_possible_cpus() >= CONFIG_TICK_SKEW_LIMIT) {
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
         |                                            CONFIG_TICK_ONESHOT
   kernel/time/tick-sched.c:1577:44: note: each undeclared identifier is reported only once for each function it appears in


vim +1577 kernel/time/tick-sched.c

  1566	
  1567	/**
  1568	 * tick_setup_sched_timer - setup the tick emulation timer
  1569	 * @hrtimer: whether to use the hrtimer or not
  1570	 */
  1571	void tick_setup_sched_timer(bool hrtimer)
  1572	{
  1573		struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
  1574	
  1575		/* Figure out if we should skew the tick */
  1576		if (sched_skew_tick < 0) {
> 1577			if (num_possible_cpus() >= CONFIG_TICK_SKEW_LIMIT) {
  1578				sched_skew_tick = 1;
  1579				pr_info("Tick skewed mode enabled. Possible cpus %u > %u\n",
  1580					num_possible_cpus(), CONFIG_TICK_SKEW_LIMIT);
  1581			} else
  1582				sched_skew_tick = 0;
  1583		}
  1584	
  1585		/* Emulate tick processing via per-CPU hrtimers: */
  1586		hrtimer_setup(&ts->sched_timer, tick_nohz_handler, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
  1587	
  1588		if (IS_ENABLED(CONFIG_HIGH_RES_TIMERS) && hrtimer)
  1589			tick_sched_flag_set(ts, TS_FLAG_HIGHRES);
  1590	
  1591		/* Get the next period (per-CPU) */
  1592		hrtimer_set_expires(&ts->sched_timer, tick_init_jiffy_update());
  1593	
  1594		/* Offset the tick to avert 'jiffies_lock' contention. */
  1595		if (sched_skew_tick) {
  1596			u64 offset = TICK_NSEC >> 1;
  1597			do_div(offset, num_possible_cpus());
  1598			offset *= smp_processor_id();
  1599			hrtimer_add_expires_ns(&ts->sched_timer, offset);
  1600		} else
  1601			pr_info("Tick operating in synchronized mode.\n");
  1602	
  1603	
  1604		hrtimer_forward_now(&ts->sched_timer, TICK_NSEC);
  1605		if (IS_ENABLED(CONFIG_HIGH_RES_TIMERS) && hrtimer)
  1606			hrtimer_start_expires(&ts->sched_timer, HRTIMER_MODE_ABS_PINNED_HARD);
  1607		else
  1608			tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
  1609		tick_nohz_activate(ts);
  1610	}
  1611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
