Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ABB17BEBF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206261; cv=none; b=BgON1Q6NtCJ5s+QmrduVZgAzjvm548BXKyVJToiEmB4wZaFDKSPFr2p9Q5TAGOigaJzI7vMl12RQ4cIFFX8wZpsOzpwB0vS26Ko+lqr07x0sTwNT6JXTwmlnqaGbsmi5DozOk/9R0tlcC6F4JEgXXu3a0Qujd0KGjVbTymi+izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206261; c=relaxed/simple;
	bh=1MJqnxJnIT/C5QdCNLNcR3OoMKXPPnOwSmh9yOZXkAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MFw3z9hlx8sfk04LtQuk5EIQeZbyzuuNxN5wP8umpLSjkhPJD0TuLz6eXCCq1EaYCfRdcl6MPu+u67J9yMmUtk8FWEhQxIWC4B9BpnZhZ7TQ4EG7rx+499kdiOw957TfvBb53boLQc/lnsbiYix/YkjBSFHW2PmxZnK5zfyi8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4qGMvk+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4qGMvk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206259; x=1776742259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1MJqnxJnIT/C5QdCNLNcR3OoMKXPPnOwSmh9yOZXkAY=;
  b=Z4qGMvk+MYybEPB2KwHUZ3uIIjonLsTE7i5QY/HqmdMTncmzH3GvRSTv
   /c53mq+LS1T8DXQFzlx6np14ZVfNRJqw/mIvKpRz0D4HjiDG8VqG9VVY6
   Gq2/gUVdwBKtKbPK9JKnNK8GhKF+iMpzE+mcfogQPoUiWM8HLx2pdz8JG
   BHIp67lEn/jEzS35UTdhALl9AGvAMZRBNWMCpYNTbiKl38/MtkPxDLVsV
   tXxozQ5RbvvI73xlWEKw+TCL18Pf9UobP/4T/0kxoqvgqWebuGygSm2pK
   CFFN49K3oUnzOunoHKuXhwlNZgB1nIYjFejXKLwRQc7WjcG6QUB7SZysq
   Q==;
X-CSE-ConnectionGUID: ZWYdHXSxR1ie1d8UekXgLQ==
X-CSE-MsgGUID: JptGT7ThTSGM7tFAh1y5PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="64144220"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="64144220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:30:59 -0700
X-CSE-ConnectionGUID: trwDvCizQ7SHIqO4u/C1pw==
X-CSE-MsgGUID: 39pzNhYuQQiknrhMPQq5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131355380"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2025 20:30:54 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the preferred LLC is over aggregated
Date: Mon, 21 Apr 2025 11:25:18 +0800
Message-Id: <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745199017.git.yu.c.chen@intel.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is found that when the process's preferred LLC gets saturated by too many
threads, task contention is very frequent and causes performance regression.

Save the per LLC statistics calculated by periodic load balance. The statistics
include the average utilization and the average number of runnable tasks.
The task wakeup path for cache aware scheduling manipulates these statistics
to inhibit cache aware scheduling to avoid performance regression. When either
the average utilization of the preferred LLC has reached 25%, or the average
number of runnable tasks has exceeded 1/3 of the LLC weight, the cache aware
wakeup is disabled. Only when the process has more threads than the LLC weight
will this restriction be enabled.

Running schbench via mmtests on a Xeon platform, which has 2 sockets, each socket
has 60 Cores/120 CPUs. The DRAM interleave is enabled across NUMA nodes via BIOS,
so there are 2 "LLCs" in 1 NUMA node.

compare-mmtests.pl --directory work/log --benchmark schbench --names baseline,sched_cache
                                    baselin             sched_cach
                                   baseline            sched_cache
Lat 50.0th-qrtle-1          6.00 (   0.00%)        6.00 (   0.00%)
Lat 90.0th-qrtle-1         10.00 (   0.00%)        9.00 (  10.00%)
Lat 99.0th-qrtle-1         29.00 (   0.00%)       13.00 (  55.17%)
Lat 99.9th-qrtle-1         35.00 (   0.00%)       21.00 (  40.00%)
Lat 20.0th-qrtle-1        266.00 (   0.00%)      266.00 (   0.00%)
Lat 50.0th-qrtle-2          8.00 (   0.00%)        6.00 (  25.00%)
Lat 90.0th-qrtle-2         10.00 (   0.00%)       10.00 (   0.00%)
Lat 99.0th-qrtle-2         19.00 (   0.00%)       18.00 (   5.26%)
Lat 99.9th-qrtle-2         27.00 (   0.00%)       29.00 (  -7.41%)
Lat 20.0th-qrtle-2        533.00 (   0.00%)      507.00 (   4.88%)
Lat 50.0th-qrtle-4          6.00 (   0.00%)        5.00 (  16.67%)
Lat 90.0th-qrtle-4          8.00 (   0.00%)        5.00 (  37.50%)
Lat 99.0th-qrtle-4         14.00 (   0.00%)        9.00 (  35.71%)
Lat 99.9th-qrtle-4         22.00 (   0.00%)       14.00 (  36.36%)
Lat 20.0th-qrtle-4       1070.00 (   0.00%)      995.00 (   7.01%)
Lat 50.0th-qrtle-8          5.00 (   0.00%)        5.00 (   0.00%)
Lat 90.0th-qrtle-8          7.00 (   0.00%)        5.00 (  28.57%)
Lat 99.0th-qrtle-8         12.00 (   0.00%)       11.00 (   8.33%)
Lat 99.9th-qrtle-8         19.00 (   0.00%)       16.00 (  15.79%)
Lat 20.0th-qrtle-8       2140.00 (   0.00%)     2140.00 (   0.00%)
Lat 50.0th-qrtle-16         6.00 (   0.00%)        5.00 (  16.67%)
Lat 90.0th-qrtle-16         7.00 (   0.00%)        5.00 (  28.57%)
Lat 99.0th-qrtle-16        12.00 (   0.00%)       10.00 (  16.67%)
Lat 99.9th-qrtle-16        17.00 (   0.00%)       14.00 (  17.65%)
Lat 20.0th-qrtle-16      4296.00 (   0.00%)     4200.00 (   2.23%)
Lat 50.0th-qrtle-32         6.00 (   0.00%)        5.00 (  16.67%)
Lat 90.0th-qrtle-32         8.00 (   0.00%)        6.00 (  25.00%)
Lat 99.0th-qrtle-32        12.00 (   0.00%)       10.00 (  16.67%)
Lat 99.9th-qrtle-32        17.00 (   0.00%)       14.00 (  17.65%)
Lat 20.0th-qrtle-32      8496.00 (   0.00%)     8528.00 (  -0.38%)
Lat 50.0th-qrtle-64         6.00 (   0.00%)        5.00 (  16.67%)
Lat 90.0th-qrtle-64         8.00 (   0.00%)        8.00 (   0.00%)
Lat 99.0th-qrtle-64        12.00 (   0.00%)       12.00 (   0.00%)
Lat 99.9th-qrtle-64        17.00 (   0.00%)       17.00 (   0.00%)
Lat 20.0th-qrtle-64     17120.00 (   0.00%)    17120.00 (   0.00%)
Lat 50.0th-qrtle-128        7.00 (   0.00%)        7.00 (   0.00%)
Lat 90.0th-qrtle-128        9.00 (   0.00%)        9.00 (   0.00%)
Lat 99.0th-qrtle-128       13.00 (   0.00%)       14.00 (  -7.69%)
Lat 99.9th-qrtle-128       20.00 (   0.00%)       20.00 (   0.00%)
Lat 20.0th-qrtle-128    31776.00 (   0.00%)    30496.00 (   4.03%)
Lat 50.0th-qrtle-239        9.00 (   0.00%)        9.00 (   0.00%)
Lat 90.0th-qrtle-239       14.00 (   0.00%)       18.00 ( -28.57%)
Lat 99.0th-qrtle-239       43.00 (   0.00%)       56.00 ( -30.23%)
Lat 99.9th-qrtle-239      106.00 (   0.00%)      483.00 (-355.66%)
Lat 20.0th-qrtle-239    30176.00 (   0.00%)    29984.00 (   0.64%)

We can see overall latency improvement and some throughput degradation
when the system gets saturated.

Also, we run schbench (old version) on an EPYC 7543 system, which has
4 NUMA nodes, and each node has 4 LLCs. Monitor the 99.0th latency:

case                    load            baseline(std%)  compare%( std%)
normal                  4-mthreads-1-workers     1.00 (  6.47)   +9.02 (  4.68)
normal                  4-mthreads-2-workers     1.00 (  3.25)  +28.03 (  8.76)
normal                  4-mthreads-4-workers     1.00 (  6.67)   -4.32 (  2.58)
normal                  4-mthreads-8-workers     1.00 (  2.38)   +1.27 (  2.41)
normal                  4-mthreads-16-workers    1.00 (  5.61)   -8.48 (  4.39)
normal                  4-mthreads-31-workers    1.00 (  9.31)   -0.22 (  9.77)

When the LLC is underloaded, the latency improvement is observed. When the LLC
gets saturated, we observe some degradation.

The aggregation of tasks will move tasks towards the preferred LLC
pretty quickly during wake ups. However load balance will tend to move
tasks away from the aggregated LLC. The two migrations are in the
opposite directions and tend to bounce tasks between LLCs. Such task
migrations should be impeded in load balancing as long as the home LLC.
We're working on fixing up the load balancing path to address such issues.

Co-developed-by: Tim Chen <tim.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 include/linux/sched/topology.h |   4 ++
 kernel/sched/fair.c            | 101 ++++++++++++++++++++++++++++++++-
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 198bb5cc1774..9625d9d762f5 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -78,6 +78,10 @@ struct sched_domain_shared {
 	atomic_t	nr_busy_cpus;
 	int		has_idle_cores;
 	int		nr_idle_scan;
+#ifdef CONFIG_SCHED_CACHE
+	unsigned long	util_avg;
+	u64		nr_avg;
+#endif
 };
 
 struct sched_domain {
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1733eb83042c..f74d8773c811 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8791,6 +8791,58 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 #ifdef CONFIG_SCHED_CACHE
 static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
 
+/* expected to be protected by rcu_read_lock() */
+static bool get_llc_stats(int cpu, int *nr, int *weight, unsigned long *util)
+{
+	struct sched_domain_shared *sd_share;
+
+	sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
+	if (!sd_share)
+		return false;
+
+	*nr = READ_ONCE(sd_share->nr_avg);
+	*util = READ_ONCE(sd_share->util_avg);
+	*weight = per_cpu(sd_llc_size, cpu);
+
+	return true;
+}
+
+static bool valid_target_cpu(int cpu, struct task_struct *p)
+{
+	int nr_running, llc_weight;
+	unsigned long util, llc_cap;
+
+	if (!get_llc_stats(cpu, &nr_running, &llc_weight,
+			   &util))
+		return false;
+
+	llc_cap = llc_weight * SCHED_CAPACITY_SCALE;
+
+	/*
+	 * If this process has many threads, be careful to avoid
+	 * task stacking on the preferred LLC, by checking the system's
+	 * utilization and runnable tasks. Otherwise, if this
+	 * process does not have many threads, honor the cache
+	 * aware wakeup.
+	 */
+	if (get_nr_threads(p) < llc_weight)
+		return true;
+
+	/*
+	 * Check if it exceeded 25% of average utiliazation,
+	 * or if it exceeded 33% of CPUs. This is a magic number
+	 * that did not cause heavy cache contention on Xeon or
+	 * Zen.
+	 */
+	if (util * 4 >= llc_cap)
+		return false;
+
+	if (nr_running * 3 >= llc_weight)
+		return false;
+
+	return true;
+}
+
 static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 {
 	struct mm_struct *mm = p->mm;
@@ -8813,6 +8865,9 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	if (cpus_share_cache(prev_cpu, cpu))
 		return prev_cpu;
 
+	if (!valid_target_cpu(cpu, p))
+		return prev_cpu;
+
 	if (static_branch_likely(&sched_numa_balancing) &&
 	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
 		/*
@@ -9564,7 +9619,8 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
 	 */
 	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->mm_sched_cpu >= 0 &&
 	    cpus_share_cache(env->src_cpu, p->mm->mm_sched_cpu) &&
-	    !cpus_share_cache(env->src_cpu, env->dst_cpu))
+	    !cpus_share_cache(env->src_cpu, env->dst_cpu) &&
+	     !valid_target_cpu(env->dst_cpu, p))
 		return 1;
 #endif
 
@@ -10634,6 +10690,48 @@ sched_reduced_capacity(struct rq *rq, struct sched_domain *sd)
 	return check_cpu_capacity(rq, sd);
 }
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * Save this sched group's statistic for later use:
+ * The task wakeup and load balance can make better
+ * decision based on these statistics.
+ */
+static void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
+			     struct sched_group *group)
+{
+	/* Find the sched domain that spans this group. */
+	struct sched_domain *sd = env->sd->child;
+	struct sched_domain_shared *sd_share;
+	u64 last_nr;
+
+	if (!sched_feat(SCHED_CACHE) || env->idle == CPU_NEWLY_IDLE)
+		return;
+
+	/* only care the sched domain that spans 1 LLC */
+	if (!sd || !(sd->flags & SD_SHARE_LLC) ||
+	    !sd->parent || (sd->parent->flags & SD_SHARE_LLC))
+		return;
+
+	sd_share = rcu_dereference(per_cpu(sd_llc_shared,
+				   cpumask_first(sched_group_span(group))));
+	if (!sd_share)
+		return;
+
+	last_nr = READ_ONCE(sd_share->nr_avg);
+	update_avg(&last_nr, sgs->sum_nr_running);
+
+	if (likely(READ_ONCE(sd_share->util_avg) != sgs->group_util))
+		WRITE_ONCE(sd_share->util_avg, sgs->group_util);
+
+	WRITE_ONCE(sd_share->nr_avg, last_nr);
+}
+#else
+static inline void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
+				    struct sched_group *group)
+{
+}
+#endif
+
 /**
  * update_sg_lb_stats - Update sched_group's statistics for load balancing.
  * @env: The load balancing environment.
@@ -10723,6 +10821,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 
 	sgs->group_type = group_classify(env->sd->imbalance_pct, group, sgs);
 
+	update_sg_if_llc(env, sgs, group);
 	/* Computing avg_load makes sense only when group is overloaded */
 	if (sgs->group_type == group_overloaded)
 		sgs->avg_load = (sgs->group_load * SCHED_CAPACITY_SCALE) /
-- 
2.25.1

