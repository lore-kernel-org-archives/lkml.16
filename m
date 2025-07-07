Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA26219EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855469; cv=none; b=qKczaEapWaMHyocqbeGtA/iXOIpjdqsfTYFxBF82I153blw30aTpc6NEcw8VHtfqIqrgHTb88BPMfEvQ2anLkCgY90oBZU7nlc8x6Bd8M5cXMKpRspRmaDIT+wS7MNilNn0JGl8UnF7ApsXYFWyDdHM3vFs2DM0mDf4WZgCrffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855469; c=relaxed/simple;
	bh=INsrMXxJaR4TYSiTwWFZ+ZgC7VSJVkTzbnSQstrPyNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMFqUcKjpHFv7hddciq4xtAgSHWpluHT2Ecw7RiQj5pZYauwhdap8QPjPGAeImsdHYM93ruwLCvXYN1ngRrXkrOJ1UPPLjvEricEWJYtOMNI7ngDMnZE1/SflHGxn44b54/2IpT+eh58eS6gsSowSrUnnKEBrbtL1zF3UYgeMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkPV5Cdb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkPV5Cdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751855467; x=1783391467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=INsrMXxJaR4TYSiTwWFZ+ZgC7VSJVkTzbnSQstrPyNQ=;
  b=ZkPV5CdbEsXP5Qjzz20rQPo42OF70jGb2DxLXpjzTh1ULRVZIMnMFPG7
   7VIvkZpZdDWiXoqb/2eSLSOfmgqAJeiR8W31549jWhMcY8+7D1c4Av9vZ
   e4g6fG6DWQbPRPK6Dy3qsQq0LECGc3e4Q+hShuZvipoytFDY7+Sikpt3v
   OdpYLmUHtRZoLfPFCfg224rT/5WkcsnZ8g9fe6xx+Gk12NpVyVZ4p8MBG
   Keti2p1t1IkrHZIHovv4OtwDo7qZKBxhNtfvYD6OoAqEFenmdUo2Nn0S7
   i1YeNGZgBw3QfP4X/p2vusJaE0wGkW9LKY6t6jeDs9jXrpiQyegp6Anr1
   g==;
X-CSE-ConnectionGUID: zaOhaQ3sRjip49ZgPupyxg==
X-CSE-MsgGUID: wP3IqZbITxuBwcKhCBTq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64756921"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="64756921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 19:31:07 -0700
X-CSE-ConnectionGUID: yXTzLmzGSXSLUYwwIJ5NKg==
X-CSE-MsgGUID: QgCODDMjR/Kod+Pdm7caXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="159361642"
Received: from linux-pnp-server-17.sh.intel.com ([10.239.166.49])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2025 19:31:05 -0700
From: Pan Deng <pan.deng@intel.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	tianyou.li@intel.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	pan.deng@intel.com
Subject: [PATCH 2/4] sched/rt: Restructure root_domain to reduce cacheline contention
Date: Mon,  7 Jul 2025 10:35:26 +0800
Message-ID: <55013ca7954e4e7309f56bec7f62b62561162e19.1751852370.git.pan.deng@intel.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1751852370.git.pan.deng@intel.com>
References: <cover.1751852370.git.pan.deng@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running a multi-instance FFmpeg workload on HCC system, significant
contention is observed in root_domain cacheline 1 and 3.

The SUT is a 2-socket machine with 240 physical cores and 480 logical
CPUs. 60 FFmpeg instances are launched, each pinned to 4 physical cores
(8 logical CPUs) for transcoding tasks. Sub-threads use RT priority 99
with FIFO scheduling. FPS is used as score.

perf c2c tool reveals (sorted by contention severity):
root_domain cache line 3:
- `cpupri->pri_to_cpu[0].count` (offset 0x38) is heavily loaded/stored,
   since counts[0] is more frequently updated than others along with a
   rt task enqueues an empty runq or dequeues from a non-overloaded runq.
- `rto_mask` (0x30) is heavily loaded
- `rto_loop_next` (0x24) and `rto_loop_start` (0x28) are frequently stored
- `rto_push_work` (0x0) and `rto_lock` (0x18) are lightly accessed
- cycles per load: ~10K to 59K

root_domain cache line 1:
- `rto_count` (0x4) is frequently loaded/stored
- `overloaded` (0x28) is heavily loaded
- cycles per load: ~2.8K to 44K:

This change adjusts the layout of `root_domain` to isolate these contended
fields across separate cache lines:
1. `rto_count` remains in the 1st cache line; `overloaded` and
   `overutilized` are moved to the last cache line
2. `rto_push_work` is placed in the 2nd cache line
3. `rto_loop_start`, `rto_loop_next`, and `rto_lock` remain in the 3rd
   cache line; `rto_mask` is moved near `pd` in the penultimate cache line
4. `cpupri` starts at the 4th cache line to prevent `pri_to_cpu[0].count`
   contending with fields in cache line 3.

With this change:
- FPS improves by ~5%
- Kernel cycles% drops from ~20% to ~17.7%
- root_domain cache line 3 no longer appears in perf-c2c report
- cycles per load of root_domain cache line 1 is reduced to from
  ~2.8K-44K to ~2.1K-2.7K

According to the nature of the change, to my understanding, it doesn`t
introduce any negative impact in other scenario.

Note: This change increases the size of `root_domain` from 29 to 31 cache
lines, it's considered acceptable since `root_domain` is a single global
object.

Appendix:
1. Current layout of contended data structures:
struct root_domain {
    atomic_t                   refcount;             /*     0     4 */
    atomic_t                   rto_count;            /*     4     4 */
    struct callback_head rcu __attribute__((__aligned__(8)));/*8 16 */
    cpumask_var_t              span;                 /*    24     8 */
    cpumask_var_t              online;               /*    32     8 */
    bool                       overloaded;           /*    40     1 */
    bool                       overutilized;         /*    41     1 */
    /* XXX 6 bytes hole, try to pack */
    cpumask_var_t              dlo_mask;             /*    48     8 */
    atomic_t                   dlo_count;            /*    56     4 */
    /* XXX 4 bytes hole, try to pack */
    /* --- cacheline 1 boundary (64 bytes) --- */
    struct dl_bw               dl_bw;                /*    64    24 */
    struct cpudl               cpudl;                /*    88    24 */
    u64                        visit_gen;            /*   112     8 */
    struct irq_work            rto_push_work;        /*   120    32 */
    /* --- cacheline 2 boundary (128 bytes) was 24 bytes ago --- */
    raw_spinlock_t             rto_lock;             /*   152     4 */
    int                        rto_loop;             /*   156     4 */
    int                        rto_cpu;              /*   160     4 */
    atomic_t                   rto_loop_next;        /*   164     4 */
    atomic_t                   rto_loop_start;       /*   168     4 */
    /* XXX 4 bytes hole, try to pack */
    cpumask_var_t              rto_mask;             /*   176     8 */
    struct cpupri              cpupri;               /*   184  1624 */
    /* --- cacheline 28 boundary (1792 bytes) was 16 bytes ago --- */
    struct perf_domain *       pd;                   /*  1808     8 */
    /* size: 1816, cachelines: 29, members: 21 */
    /* sum members: 1802, holes: 3, sum holes: 14 */
    /* forced alignments: 1 */
    /* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));

struct cpupri {
        struct cpupri_vec          pri_to_cpu[101];      /*     0  1616 */
        /* --- cacheline 25 boundary (1600 bytes) was 16 bytes ago --- */
        int *                      cpu_to_pri;           /*  1616     8 */

        /* size: 1624, cachelines: 26, members: 2 */
        /* last cacheline: 24 bytes */
};

struct cpupri_vec {
        atomic_t                   count;                /*     0     4 */

        /* XXX 4 bytes hole, try to pack */

        cpumask_var_t              mask;                 /*     8     8 */

        /* size: 16, cachelines: 1, members: 2 */
        /* sum members: 12, holes: 1, sum holes: 4 */
        /* last cacheline: 16 bytes */
};

2. Perf c2c report of root_domain cache line 3:
-------  -------  ------  ------  ------  ------  ------------------------
 Rmt      Lcl     Store   Data    Load    Total    Symbol
Hitm%    Hitm%   L1 Hit%  offset  cycles  records
-------  -------  ------  ------  ------  ------  ------------------------
 353       44       62    0xff14d42c400e3880
-------  -------  ------  ------  ------  ------  ------------------------
 0.00%    2.27%    0.00%  0x0     21683   6     __flush_smp_call_function_
 0.00%    2.27%    0.00%  0x0     22294   5     __flush_smp_call_function_
 0.28%    0.00%    0.00%  0x0     0       2     irq_work_queue_on
 0.28%    0.00%    0.00%  0x0     27824   4     irq_work_single
 0.00%    0.00%    1.61%  0x0     28151   6     irq_work_queue_on
 0.57%    0.00%    0.00%  0x18    21822   8     native_queued_spin_lock_sl
 0.28%    2.27%    0.00%  0x18    16101   10    native_queued_spin_lock_sl
 0.57%    0.00%    0.00%  0x18    33199   5     native_queued_spin_lock_sl
 0.00%    0.00%    1.61%  0x18    10908   32    _raw_spin_lock
 0.00%    0.00%    1.61%  0x18    59770   2     _raw_spin_lock
 0.00%    0.00%    1.61%  0x18    0       1     _raw_spin_unlock
 1.42%    0.00%    0.00%  0x20    12918   20    pull_rt_task
 0.85%    0.00%   25.81%  0x24    31123   199   pull_rt_task
 0.85%    0.00%    3.23%  0x24    38218   24    pull_rt_task
 0.57%    4.55%   19.35%  0x28    30558   207   pull_rt_task
 0.28%    0.00%    0.00%  0x28    55504   10    pull_rt_task
18.70%   18.18%    0.00%  0x30    26438   291   dequeue_pushable_task
17.28%   22.73%    0.00%  0x30    29347   281   enqueue_pushable_task
 1.70%    2.27%    0.00%  0x30    12819   31    enqueue_pushable_task
 0.28%    0.00%    0.00%  0x30    17726   18    dequeue_pushable_task
34.56%   29.55%    0.00%  0x38    25509   527   cpupri_find_fitness
13.88%   11.36%   24.19%  0x38    30654   342   cpupri_set
 3.12%    2.27%    0.00%  0x38    18093   39    cpupri_set
 1.70%    0.00%    0.00%  0x38    37661   52    cpupri_find_fitness
 1.42%    2.27%   19.35%  0x38    31110   211   cpupri_set
 1.42%    0.00%    1.61%  0x38    45035   31    cpupri_set

3. Perf c2c report of root_domain cache line 1:
-------  -------  ------  ------  ------  ------  ------------------------
 Rmt      Lcl     Store   Data    Load    Total    Symbol
Hitm%    Hitm%   L1 Hit%  offset  cycles  records
-------  -------  ------  ------  ------  ------  ------------------------
 231       43       48    0xff14d42c400e3800
-------  -------  ------  ------  ------  ------  ------------------------
22.51%   18.60%    0.00%  0x4     5041    247   pull_rt_task
 5.63%    2.33%   45.83%  0x4     6995    315   dequeue_pushable_task
 3.90%    4.65%   54.17%  0x4     6587    370   enqueue_pushable_task
 0.43%    0.00%    0.00%  0x4     17111   4     enqueue_pushable_task
 0.43%    0.00%    0.00%  0x4     44062   4     dequeue_pushable_task
32.03%   27.91%    0.00%  0x28    6393    285   enqueue_task_rt
16.45%   27.91%    0.00%  0x28    5534    139   sched_balance_newidle
14.72%   18.60%    0.00%  0x28    5287    110   dequeue_task_rt
 3.46%    0.00%    0.00%  0x28    2820    25    enqueue_task_fair
 0.43%    0.00%    0.00%  0x28    220     3     enqueue_task_stop

Signed-off-by: Pan Deng <pan.deng@intel.com>
Reviewed-by: Tianyou Li <tianyou.li@intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/sched.h | 52 +++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..dd3c79470bfc 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -968,24 +968,29 @@ struct root_domain {
 	cpumask_var_t		span;
 	cpumask_var_t		online;
 
+	atomic_t		dlo_count;
+	struct dl_bw		dl_bw;
+	struct cpudl		cpudl;
+
+#ifdef HAVE_RT_PUSH_IPI
 	/*
-	 * Indicate pullable load on at least one CPU, e.g:
-	 * - More than one runnable task
-	 * - Running task is misfit
+	 * For IPI pull requests, loop across the rto_mask.
 	 */
-	bool			overloaded;
-
-	/* Indicate one or more CPUs over-utilized (tipping point) */
-	bool			overutilized;
+	struct irq_work		rto_push_work;
+	raw_spinlock_t		rto_lock;
+	/* These are only updated and read within rto_lock */
+	int			rto_loop;
+	int			rto_cpu;
+	/* These atomics are updated outside of a lock */
+	atomic_t		rto_loop_next;
+	atomic_t		rto_loop_start;
+#endif
 
 	/*
 	 * The bit corresponding to a CPU gets set here if such CPU has more
 	 * than one runnable -deadline task (as it is below for RT tasks).
 	 */
 	cpumask_var_t		dlo_mask;
-	atomic_t		dlo_count;
-	struct dl_bw		dl_bw;
-	struct cpudl		cpudl;
 
 	/*
 	 * Indicate whether a root_domain's dl_bw has been checked or
@@ -995,32 +1000,29 @@ struct root_domain {
 	 * that u64 is 'big enough'. So that shouldn't be a concern.
 	 */
 	u64 visit_cookie;
+	struct cpupri		cpupri	____cacheline_aligned;
 
-#ifdef HAVE_RT_PUSH_IPI
 	/*
-	 * For IPI pull requests, loop across the rto_mask.
+	 * NULL-terminated list of performance domains intersecting with the
+	 * CPUs of the rd. Protected by RCU.
 	 */
-	struct irq_work		rto_push_work;
-	raw_spinlock_t		rto_lock;
-	/* These are only updated and read within rto_lock */
-	int			rto_loop;
-	int			rto_cpu;
-	/* These atomics are updated outside of a lock */
-	atomic_t		rto_loop_next;
-	atomic_t		rto_loop_start;
-#endif
+	struct perf_domain __rcu *pd	____cacheline_aligned;
+
 	/*
 	 * The "RT overload" flag: it gets set if a CPU has more than
 	 * one runnable RT task.
 	 */
 	cpumask_var_t		rto_mask;
-	struct cpupri		cpupri;
 
 	/*
-	 * NULL-terminated list of performance domains intersecting with the
-	 * CPUs of the rd. Protected by RCU.
+	 * Indicate pullable load on at least one CPU, e.g:
+	 * - More than one runnable task
+	 * - Running task is misfit
 	 */
-	struct perf_domain __rcu *pd;
+	bool			overloaded	____cacheline_aligned;
+
+	/* Indicate one or more CPUs over-utilized (tipping point) */
+	bool			overutilized;
 };
 
 extern void init_defrootdomain(void);
-- 
2.43.5

