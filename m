Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867A1CAA85
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855474; cv=none; b=TNo2XIvisuKp8WTH7+kidTdrGWH/992vrDFQwdsk7IBoHMRFTJRBB/Vuvl/OynT64ejMrKmfma2LqNc2MWqE5ImOljP4B/qJKOfMzO0lHOUzvFik4xoVephQW1SCnIjXlcchXmCIbqV2bvc2AE7a34bRVWcKlv1VcxGju0M4snU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855474; c=relaxed/simple;
	bh=Y3t6YLGIXDhsEQt1TnIgGDS52aTj4duWDmAWbWZYpvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahrPbrYRXkwbfLbYnGGI1c0KB7o9/zfj/jJ6XpwKiuhjC5I+pk3r+QTdGnghnbywwK8Shf9Cyy3sqcX4E+hu9FPe6zWzcMlqnkFP49euIjWbciQducelA85Ob0YX/QdD/F4xhf4JpB/P7rFw8CCbMtrqJRiZOf2aQdzaOkILmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgT/Qu9F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgT/Qu9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751855473; x=1783391473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y3t6YLGIXDhsEQt1TnIgGDS52aTj4duWDmAWbWZYpvc=;
  b=SgT/Qu9Fi/94XC0tLhPya1C7Sxh7LP3bjSagKI3fQoWzenfUd41ukdDW
   m/ogYEBDuaIdF416fof0EKExLSNjJLK1L7WL0njx9qyrsrFOH4Lyl+9C0
   kNk3YybUcsOsZ3fkY42jPCW1nRJmL7P6KVJe4U6Ol3NUdHeSw4KFvW6NA
   kv2AVn4N483Iq+iqCoO8QSZ59vFuVu3ypLw1tzXsuN3TlLzqg9b4FiSMO
   Mc8uTpu1LyIpVExtMu1JUVZpU1O/l8acYOf6QlUSLXlaIPcUJKhiZb1M6
   QHx/Zurq//DqAh+Y58uLsydsRWsS3yWBi5LbO2MkdZ2cF64IYDjhl8s+W
   A==;
X-CSE-ConnectionGUID: /h28OwldSfqh8ChJHUvkpQ==
X-CSE-MsgGUID: T7lcVoxDTD67X8dEN8hKGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64756925"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="64756925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 19:31:12 -0700
X-CSE-ConnectionGUID: klHiVf19QLi+9EUxkXTREQ==
X-CSE-MsgGUID: cqmBWf73SEG/aG67lEOQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="159361651"
Received: from linux-pnp-server-17.sh.intel.com ([10.239.166.49])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2025 19:31:10 -0700
From: Pan Deng <pan.deng@intel.com>
To: peterz@infradead.org,
	mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	tianyou.li@intel.com,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	pan.deng@intel.com
Subject: [PATCH 3/4] sched/rt: Split root_domain->rto_count to per-NUMA-node counters
Date: Mon,  7 Jul 2025 10:35:27 +0800
Message-ID: <2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng@intel.com>
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
contention is observed on root_domain `rto_count` and `overloaded` fields.

The SUT is a 2-socket machine with 240 physical cores and 480 logical
CPUs. 60 FFmpeg instances are launched, each pinned to 4 physical cores
(8 logical CPUs) for transcoding tasks. Sub-threads use RT priority 99
with FIFO scheduling. FPS is used as score.

perf c2c tool reveals:
root_domain cache line 1:
- `rto_count` (0x4) is frequently loaded/stored
- `overloaded` (0x28) is heavily loaded
- cycles per load: ~2.8K to 44K:

A separate patch rearranges root_domain to place `overloaded` on a
different cache line, but this alone is insufficient to resolve the
contention on `rto_count`. As a complementary, this patch splits
`rto_count` into per-numa-node counters to reduce the contention.

With this change:
- FPS improves by ~4%
- Kernel cycles% drops from ~20% to ~18.6%
- The cache line no longer appears in perf-c2c report

Appendix:
1. Perf c2c report of root_domain cache line 1:
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
 kernel/sched/rt.c       | 65 +++++++++++++++++++++++++++++++++++++++--
 kernel/sched/sched.h    |  9 +++++-
 kernel/sched/topology.c |  7 +++++
 3 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37033..cc820dbde6d6 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -337,9 +337,58 @@ static inline bool need_pull_rt_task(struct rq *rq, struct task_struct *prev)
 	return rq->online && rq->rt.highest_prio.curr > prev->prio;
 }
 
+int rto_counts_init(atomic_tp **rto_counts)
+{
+	int i;
+	atomic_tp *counts = kzalloc(nr_node_ids * sizeof(atomic_tp), GFP_KERNEL);
+
+	if (!counts)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_node_ids; i++) {
+		counts[i] = kzalloc_node(sizeof(atomic_t), GFP_KERNEL, i);
+
+		if (!counts[i])
+			goto cleanup;
+	}
+
+	*rto_counts = counts;
+	return 0;
+
+cleanup:
+	while (i--)
+		kfree(counts[i]);
+
+	kfree(counts);
+	return -ENOMEM;
+}
+
+void rto_counts_cleanup(atomic_tp *rto_counts)
+{
+	for (int i = 0; i < nr_node_ids; i++)
+		kfree(rto_counts[i]);
+
+	kfree(rto_counts);
+}
+
 static inline int rt_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->rto_count);
+	int count = 0;
+	int cur_node, nid;
+
+	cur_node = numa_node_id();
+
+	for (int i = 0; i < nr_node_ids; i++) {
+		nid = (cur_node + i) % nr_node_ids;
+		count += atomic_read(rq->rd->rto_counts[nid]);
+
+		// The caller only checks if it is 0
+		// or 1, so that return once > 1
+		if (count > 1)
+			return count;
+	}
+
+	return count;
 }
 
 static inline void rt_set_overload(struct rq *rq)
@@ -358,7 +407,7 @@ static inline void rt_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_rt_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->rto_count);
+	atomic_inc(rq->rd->rto_counts[cpu_to_node(rq->cpu)]);
 }
 
 static inline void rt_clear_overload(struct rq *rq)
@@ -367,7 +416,7 @@ static inline void rt_clear_overload(struct rq *rq)
 		return;
 
 	/* the order here really doesn't matter */
-	atomic_dec(&rq->rd->rto_count);
+	atomic_dec(rq->rd->rto_counts[cpu_to_node(rq->cpu)]);
 	cpumask_clear_cpu(rq->cpu, rq->rd->rto_mask);
 }
 
@@ -443,6 +492,16 @@ static inline void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
 static inline void rt_queue_push_tasks(struct rq *rq)
 {
 }
+
+int rto_counts_init(atomic_tp **rto_counts)
+{
+	return 0;
+}
+
+void rto_counts_cleanup(atomic_tp *rto_counts)
+{
+}
+
 #endif /* CONFIG_SMP */
 
 static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index dd3c79470bfc..f80968724dd6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -953,6 +953,8 @@ struct perf_domain {
 	struct rcu_head rcu;
 };
 
+typedef atomic_t *atomic_tp;
+
 /*
  * We add the notion of a root-domain which will be used to define per-domain
  * variables. Each exclusive cpuset essentially defines an island domain by
@@ -963,12 +965,15 @@ struct perf_domain {
  */
 struct root_domain {
 	atomic_t		refcount;
-	atomic_t		rto_count;
 	struct rcu_head		rcu;
 	cpumask_var_t		span;
 	cpumask_var_t		online;
 
 	atomic_t		dlo_count;
+
+	/* rto_count per node */
+	atomic_tp		*rto_counts;
+
 	struct dl_bw		dl_bw;
 	struct cpudl		cpudl;
 
@@ -1030,6 +1035,8 @@ extern int sched_init_domains(const struct cpumask *cpu_map);
 extern void rq_attach_root(struct rq *rq, struct root_domain *rd);
 extern void sched_get_rd(struct root_domain *rd);
 extern void sched_put_rd(struct root_domain *rd);
+extern int rto_counts_init(atomic_tp **rto_counts);
+extern void rto_counts_cleanup(atomic_tp *rto_counts);
 
 static inline int get_rd_overloaded(struct root_domain *rd)
 {
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b958fe48e020..166dc8177a44 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -457,6 +457,7 @@ static void free_rootdomain(struct rcu_head *rcu)
 {
 	struct root_domain *rd = container_of(rcu, struct root_domain, rcu);
 
+	rto_counts_cleanup(rd->rto_counts);
 	cpupri_cleanup(&rd->cpupri);
 	cpudl_cleanup(&rd->cpudl);
 	free_cpumask_var(rd->dlo_mask);
@@ -549,8 +550,14 @@ static int init_rootdomain(struct root_domain *rd)
 
 	if (cpupri_init(&rd->cpupri) != 0)
 		goto free_cpudl;
+
+	if (rto_counts_init(&rd->rto_counts) != 0)
+		goto free_cpupri;
+
 	return 0;
 
+free_cpupri:
+	cpupri_cleanup(&rd->cpupri);
 free_cpudl:
 	cpudl_cleanup(&rd->cpudl);
 free_rto_mask:
-- 
2.43.5

