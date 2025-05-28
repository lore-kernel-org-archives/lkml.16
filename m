Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93EF2459D9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419816; cv=none; b=DWAgUVhDchU9FaMEOWH3rv5iW3lAy4OjA7xLwmywMmHgujqpewmeVMXBsekscYehGhJ8uwOKIogDZ71L0LlPvpV+oRp8FSP2NigH/rtzzt24QisZReTYExtL8F7sbj1m/mYYbrm41Am3E2No7w0RaaQk8PLMOyKNKvx6iL5/bS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419816; c=relaxed/simple;
	bh=FltFMf430RirGxiT9qRIFlCszu6z4QCr5D/YG0W1Npc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PyPoebHRjHNMK+rpwZHqJyTlRU3JG4HsbYuYEzllqHlATgZ3/8NBUvoSiiG3z4UT9Cx+HZ4fGyffJoOPNlwPZy8iEwKPylJwVJt/qZQenNgSj1i29k7PQ9LILK2PH0Avv2VxHGPkITpLvAPp0Ni/qQgUQxjF7sQxFz+1dc5TA7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwziJpUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwziJpUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FB0C4CEEF;
	Wed, 28 May 2025 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419816;
	bh=FltFMf430RirGxiT9qRIFlCszu6z4QCr5D/YG0W1Npc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwziJpUkgFPLH6a1rt5o95YXb3kH1SygqhLXE61LX7vzmJXY1YDXf4NeAGThqO7wq
	 dxlKVHYpb7NiXVQCYGOlsQV73iSpwxg9I/5B3cH7MJ4AgvJSrFz8Pfx9HNlIUnlKNT
	 fi/d/7+fmWGl7R+UKM3xKheH1CW7tuqkPynR2oaLto0MBrhc/LYyHz4niRJ/QveL0D
	 B4ARhKSUjGyhWgbBi1NOkdnwsnzxBJhABGUKxWDx4qkVvTMIm5tHT1zItArIPOVdZf
	 cMCEskvrqE/5TBtHT3QbLk7J3o3O4Hz8emV2tK9iEaYsuJcmj9UQXyRoPIN+oLRUgE
	 mGoPEJ/Z6ZOVg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 08/43] sched: Clean up and standardize #if/#else/#endif markers in sched/debug.c
Date: Wed, 28 May 2025 10:08:49 +0200
Message-ID: <20250528080924.2273858-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Use the standard #ifdef marker format for larger blocks,
   where appropriate:

        #if CONFIG_FOO
        ...
        #else /* !CONFIG_FOO: */
        ...
        #endif /* !CONFIG_FOO */

 - Fix whitespace noise and other inconsistencies.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/debug.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 557246880a7e..aaba8661aa46 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -90,10 +90,10 @@ static void sched_feat_enable(int i)
 {
 	static_key_enable_cpuslocked(&sched_feat_keys[i]);
 }
-#else
+#else /* !CONFIG_JUMP_LABEL: */
 static void sched_feat_disable(int i) { };
 static void sched_feat_enable(int i) { };
-#endif /* CONFIG_JUMP_LABEL */
+#endif /* !CONFIG_JUMP_LABEL */
 
 static int sched_feat_set(char *cmp)
 {
@@ -214,7 +214,7 @@ static const struct file_operations sched_scaling_fops = {
 	.release	= single_release,
 };
 
-#endif /* SMP */
+#endif /* CONFIG_SMP */
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
@@ -311,9 +311,9 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
 
 	return result;
 }
-#else
-#define sched_verbose_write debugfs_write_file_bool
-#endif
+#else /* !CONFIG_SMP: */
+# define sched_verbose_write debugfs_write_file_bool
+#endif /* !CONFIG_SMP */
 
 static const struct file_operations sched_verbose_fops = {
 	.read =         debugfs_read_file_bool,
@@ -520,7 +520,7 @@ static __init int sched_init_debug(void)
 	sched_domains_mutex_lock();
 	update_sched_domain_debugfs();
 	sched_domains_mutex_unlock();
-#endif
+#endif /* CONFIG_SMP */
 
 #ifdef CONFIG_NUMA_BALANCING
 	numa = debugfs_create_dir("numa_balancing", debugfs_sched);
@@ -530,7 +530,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("scan_period_max_ms", 0644, numa, &sysctl_numa_balancing_scan_period_max);
 	debugfs_create_u32("scan_size_mb", 0644, numa, &sysctl_numa_balancing_scan_size);
 	debugfs_create_u32("hot_threshold_ms", 0644, numa, &sysctl_numa_balancing_hot_threshold);
-#endif
+#endif /* CONFIG_NUMA_BALANCING */
 
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
@@ -694,14 +694,14 @@ static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group
 	P(se->avg.load_avg);
 	P(se->avg.util_avg);
 	P(se->avg.runnable_avg);
-#endif
+#endif /* CONFIG_SMP */
 
 #undef PN_SCHEDSTAT
 #undef PN
 #undef P_SCHEDSTAT
 #undef P
 }
-#endif
+#endif /* CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_CGROUP_SCHED
 static DEFINE_SPINLOCK(sched_debug_lock);
@@ -874,8 +874,8 @@ void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
 			cfs_rq->tg_load_avg_contrib);
 	SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
 			atomic_long_read(&cfs_rq->tg->load_avg));
-#endif
-#endif
+#endif /* CONFIG_FAIR_GROUP_SCHED */
+#endif /* CONFIG_SMP */
 #ifdef CONFIG_CFS_BANDWIDTH
 	SEQ_printf(m, "  .%-30s: %d\n", "throttled",
 			cfs_rq->throttled);
@@ -951,9 +951,9 @@ static void print_cpu(struct seq_file *m, int cpu)
 		SEQ_printf(m, "cpu#%d, %u.%03u MHz\n",
 			   cpu, freq / 1000, (freq % 1000));
 	}
-#else
+#else /* !CONFIG_X86: */
 	SEQ_printf(m, "cpu#%d\n", cpu);
-#endif
+#endif /* !CONFIG_X86 */
 
 #define P(x)								\
 do {									\
@@ -981,7 +981,7 @@ do {									\
 	P64(avg_idle);
 	P64(max_idle_balance_cost);
 #undef P64
-#endif
+#endif /* CONFIG_SMP */
 
 #define P(n) SEQ_printf(m, "  .%-30s: %d\n", #n, schedstat_val(rq->n));
 	if (schedstat_enabled()) {
@@ -1163,7 +1163,7 @@ static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 	SEQ_printf(m, "current_node=%d, numa_group_id=%d\n",
 			task_node(p), task_numa_group_id(p));
 	show_numa_stats(p, m);
-#endif
+#endif /* CONFIG_NUMA_BALANCING */
 }
 
 void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
@@ -1256,13 +1256,13 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 	P(se.avg.util_avg);
 	P(se.avg.last_update_time);
 	PM(se.avg.util_est, ~UTIL_AVG_UNCHANGED);
-#endif
+#endif /* CONFIG_SMP */
 #ifdef CONFIG_UCLAMP_TASK
 	__PS("uclamp.min", p->uclamp_req[UCLAMP_MIN].value);
 	__PS("uclamp.max", p->uclamp_req[UCLAMP_MAX].value);
 	__PS("effective uclamp.min", uclamp_eff_value(p, UCLAMP_MIN));
 	__PS("effective uclamp.max", uclamp_eff_value(p, UCLAMP_MAX));
-#endif
+#endif /* CONFIG_UCLAMP_TASK */
 	P(policy);
 	P(prio);
 	if (task_has_dl_policy(p)) {
-- 
2.45.2

