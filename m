Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF425BEFD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296682; cv=none; b=QkEMrskGOWfT8PQTrnWcWplTzi92AtAprkNQeLkCELYQQY96iCwQRRbDdjBKR/ebpJ9tfqLLmq0LVjouKotn9ROdVtiNuM5Poxi8KtMU2mAwLDQL2beMQEqSr1QQXHmtp4fiAMgtSuqsezKIjLrbVxheBLARfUrKQA2W5ie0Uq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296682; c=relaxed/simple;
	bh=95GeipPPKyWx5+tfllxtGFXfLbYbkzW/7ZaVM/sj7R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q815znaGUeq5OfZLBGUnp79OYACeAE9XMW8eYUYDcXWdm4zegMKMvOHtqjj6pipZUAFPygxYjl32wj/ERcB3w+Xv7moBlkPYIZn1BXmhxpk8TU2+V/yuxsYBSEmE6DYZkJbVLu0645R/KfLur5k5QGA7/nJBiEAcHw+ZHj61iWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVJ/QVxb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVJ/QVxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751296680; x=1782832680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95GeipPPKyWx5+tfllxtGFXfLbYbkzW/7ZaVM/sj7R4=;
  b=FVJ/QVxb6lMZJaVZAZ50QW4OtzSM9Nt/V2n9YMyaplDLQ4HeREGJ8xfn
   3ojr7CQFdYYD3fJi99p+YQ00ujy208WfzAmTvVuxz6fvl4ybnFavouZ1t
   aZZjxAU4epwAmy4G07rI5gPvWc2iGIVrFn/55CJfnk/L3Ty2NIaFjU4PO
   HyQxvERSCoDKmAhd5b/z9OfA7DZI67fNp88SXImnsiJRP+5Ol2wz3WT2I
   Z4qTrA6zXujMIxA/lBtZOy6rMr5ftpMHCI0AuIj4UUCzp/VgwbN9DZBkQ
   1jFASBJClVNA99gettB1MMoiHx2R8WV2KqqEWl2DEHgS8AVi6eNLSNHXs
   w==;
X-CSE-ConnectionGUID: 97xyFfNlTNa47LDe47OuHQ==
X-CSE-MsgGUID: sQLqkx0WSCaahNCK1LYqow==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71094229"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="71094229"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:17:54 -0700
X-CSE-ConnectionGUID: 6N4gYov3R72t2UOhzFIRTg==
X-CSE-MsgGUID: JwpWgP3NRmmDUv8PRjDF0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="158033107"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jun 2025 08:17:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWGGS-000Z7w-2b;
	Mon, 30 Jun 2025 15:17:48 +0000
Date: Mon, 30 Jun 2025 23:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:sched/core 20/43] kernel/sched/core.c:8216: undefined reference
 to `scx_rq_activate'
Message-ID: <202506302317.HmsFxI84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   5bc34be478d09c4d16009e665e020ad0fcd0deea
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 [20/43] sched/smp: Make SMP unconditional
config: sparc64-randconfig-001-20250630 (https://download.01.org/0day-ci/archive/20250630/202506302317.HmsFxI84-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506302317.HmsFxI84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506302317.HmsFxI84-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/sched/core.o: in function `sched_cpu_activate':
>> kernel/sched/core.c:8216: undefined reference to `scx_rq_activate'
   sparc64-linux-ld: kernel/sched/core.o: in function `sched_cpu_deactivate':
>> kernel/sched/core.c:8272: undefined reference to `scx_rq_deactivate'


vim +8216 kernel/sched/core.c

31b164e2e4af84 kernel/sched/core.c Yang Yingliang         2024-07-03  8193  
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8194  int sched_cpu_activate(unsigned int cpu)
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8195  {
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8196  	struct rq *rq = cpu_rq(cpu);
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8197  
22f667c97aadbf kernel/sched/core.c Peter Zijlstra         2021-01-15  8198  	/*
b5c4477366fb5e kernel/sched/core.c Peter Zijlstra         2021-01-21  8199  	 * Clear the balance_push callback and prepare to schedule
b5c4477366fb5e kernel/sched/core.c Peter Zijlstra         2021-01-21  8200  	 * regular tasks.
22f667c97aadbf kernel/sched/core.c Peter Zijlstra         2021-01-15  8201  	 */
2558aacff85866 kernel/sched/core.c Peter Zijlstra         2020-09-11  8202  	balance_push_set(cpu, false);
2558aacff85866 kernel/sched/core.c Peter Zijlstra         2020-09-11  8203  
ba2591a5993eab kernel/sched/core.c Peter Zijlstra         2018-05-29  8204  	/*
c5511d03ec0909 kernel/sched/core.c Peter Zijlstra (Intel  2018-11-25  8205) 	 * When going up, increment the number of cores with SMT present.
ba2591a5993eab kernel/sched/core.c Peter Zijlstra         2018-05-29  8206  	 */
31b164e2e4af84 kernel/sched/core.c Yang Yingliang         2024-07-03  8207  	sched_smt_present_inc(cpu);
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8208  	set_cpu_active(cpu, true);
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8209  
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8210  	if (sched_smp_initialized) {
0fb3978b0aac3a kernel/sched/core.c Ying Huang             2022-02-14  8211  		sched_update_numa(cpu, true);
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8212  		sched_domains_numa_masks_set(cpu);
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8213  		cpuset_cpu_active();
e761b772523427 kernel/sched.c      Max Krasnyansky        2008-07-15  8214  	}
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8215  
60c27fb59f6cff kernel/sched/core.c Tejun Heo              2024-06-18 @8216  	scx_rq_activate(rq);
60c27fb59f6cff kernel/sched/core.c Tejun Heo              2024-06-18  8217  
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8218  	/*
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8219  	 * Put the rq online, if not already. This happens:
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8220  	 *
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8221  	 * 1) In the early boot process, because we build the real domains
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar            2017-02-01  8222  	 *    after all CPUs have been brought up.
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8223  	 *
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8224  	 * 2) At runtime, if cpuset_cpu_active() fails to rebuild the
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8225  	 *    domains.
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8226  	 */
2f027354122f58 kernel/sched/core.c Yang Yingliang         2024-07-03  8227  	sched_set_rq_online(rq, cpu);
7d97669933eb94 kernel/sched/core.c Thomas Gleixner        2016-03-10  8228  
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8229  	return 0;
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8230  }
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8231  
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8232  int sched_cpu_deactivate(unsigned int cpu)
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8233  {
120455c514f732 kernel/sched/core.c Peter Zijlstra         2020-09-25  8234  	struct rq *rq = cpu_rq(cpu);
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8235  	int ret;
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8236  
53916d5fd3c0b6 kernel/sched/core.c Juri Lelli             2024-11-15  8237  	ret = dl_bw_deactivate(cpu);
53916d5fd3c0b6 kernel/sched/core.c Juri Lelli             2024-11-15  8238  
53916d5fd3c0b6 kernel/sched/core.c Juri Lelli             2024-11-15  8239  	if (ret)
53916d5fd3c0b6 kernel/sched/core.c Juri Lelli             2024-11-15  8240  		return ret;
53916d5fd3c0b6 kernel/sched/core.c Juri Lelli             2024-11-15  8241  
e0b257c3b71bd9 kernel/sched/core.c Anna-Maria Behnsen     2020-12-15  8242  	/*
e0b257c3b71bd9 kernel/sched/core.c Anna-Maria Behnsen     2020-12-15  8243  	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
e0b257c3b71bd9 kernel/sched/core.c Anna-Maria Behnsen     2020-12-15  8244  	 * load balancing when not active
e0b257c3b71bd9 kernel/sched/core.c Anna-Maria Behnsen     2020-12-15  8245  	 */
e0b257c3b71bd9 kernel/sched/core.c Anna-Maria Behnsen     2020-12-15  8246  	nohz_balance_exit_idle(rq);
e0b257c3b71bd9 kernel/sched/core.c Anna-Maria Behnsen     2020-12-15  8247  
135fb3e19773e6 kernel/sched/core.c Thomas Gleixner        2016-03-10  8248  	set_cpu_active(cpu, false);
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8249  
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8250  	/*
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8251  	 * From this point forward, this CPU will refuse to run any task that
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8252  	 * is not: migrate_disable() or KTHREAD_IS_PER_CPU, and will actively
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8253  	 * push those tasks away until this gets cleared, see
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8254  	 * sched_cpu_dying().
741ba80f6f9a47 kernel/sched/core.c Peter Zijlstra         2021-01-16  8255  	 */
975707f227b07a kernel/sched/core.c Peter Zijlstra         2021-01-20  8256  	balance_push_set(cpu, true);
975707f227b07a kernel/sched/core.c Peter Zijlstra         2021-01-20  8257  
b2454caa8977ad kernel/sched/core.c Peter Zijlstra         2016-03-10  8258  	/*
975707f227b07a kernel/sched/core.c Peter Zijlstra         2021-01-20  8259  	 * We've cleared cpu_active_mask / set balance_push, wait for all
975707f227b07a kernel/sched/core.c Peter Zijlstra         2021-01-20  8260  	 * preempt-disabled and RCU users of this state to go away such that
975707f227b07a kernel/sched/core.c Peter Zijlstra         2021-01-20  8261  	 * all new such users will observe it.
b2454caa8977ad kernel/sched/core.c Peter Zijlstra         2016-03-10  8262  	 *
5ba2ffba13a1e2 kernel/sched/core.c Peter Zijlstra         2021-01-12  8263  	 * Specifically, we rely on ttwu to no longer target this CPU, see
5ba2ffba13a1e2 kernel/sched/core.c Peter Zijlstra         2021-01-12  8264  	 * ttwu_queue_cond() and is_cpu_allowed().
5ba2ffba13a1e2 kernel/sched/core.c Peter Zijlstra         2021-01-12  8265  	 *
402de7fc880fef kernel/sched/core.c Ingo Molnar            2024-05-27  8266  	 * Do sync before park smpboot threads to take care the RCU boost case.
b2454caa8977ad kernel/sched/core.c Peter Zijlstra         2016-03-10  8267  	 */
309ba859b95085 kernel/sched/core.c Paul E. McKenney       2018-07-11  8268  	synchronize_rcu();
40190a78f85fec kernel/sched/core.c Thomas Gleixner        2016-03-10  8269  
2f027354122f58 kernel/sched/core.c Yang Yingliang         2024-07-03  8270  	sched_set_rq_offline(rq, cpu);
120455c514f732 kernel/sched/core.c Peter Zijlstra         2020-09-25  8271  
60c27fb59f6cff kernel/sched/core.c Tejun Heo              2024-06-18 @8272  	scx_rq_deactivate(rq);
60c27fb59f6cff kernel/sched/core.c Tejun Heo              2024-06-18  8273  
c5511d03ec0909 kernel/sched/core.c Peter Zijlstra (Intel  2018-11-25  8274) 	/*
c5511d03ec0909 kernel/sched/core.c Peter Zijlstra (Intel  2018-11-25  8275) 	 * When going down, decrement the number of cores with SMT present.
c5511d03ec0909 kernel/sched/core.c Peter Zijlstra (Intel  2018-11-25  8276) 	 */
31b164e2e4af84 kernel/sched/core.c Yang Yingliang         2024-07-03  8277  	sched_smt_present_dec(cpu);
3c474b3239f12f kernel/sched/core.c Peter Zijlstra         2021-08-19  8278  

:::::: The code at line 8216 was first introduced by commit
:::::: 60c27fb59f6cffa73fc8c60e3a22323c78044576 sched_ext: Implement sched_ext_ops.cpu_online/offline()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
