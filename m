Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E700626FDBF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419896; cv=none; b=UbyOjndxjcPbD/7k4z2zw3jyHDRbrHgVH0lammZCoGRigpsg+L2W0pipugmmrm8PJvmGYW/2Q8zzALa5/7rYJzjFozc7/Y4NDmCM1bI4qNUQQKawcL+LVes/7paYKA4pzWKYXpCrsvDjgcrEgXTt2DzeWWjbkwLNPB8VoyGiFr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419896; c=relaxed/simple;
	bh=vBN0Da9DcpTu33EGFTW075QZ94s78ZZf5o+m0YBdyog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzMWTZ/A++x4FGDUFnfZ9XrUzWpcbWM8jt5mKRwkWNcNxWwCQgPwvXc6O4HbP6ZooyauoXs+SgdJigTxoCHQV8r8OE4cRCG7WIZtw13QcX+GAzdQMu4egk783k05PRq5/4Ay7Xkj9EPEsUqY3vfKf2cSTlQUf47T3uc236PW5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBFAdk9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBFAdk9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C4EC4CEE7;
	Wed, 28 May 2025 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419894;
	bh=vBN0Da9DcpTu33EGFTW075QZ94s78ZZf5o+m0YBdyog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBFAdk9ct4zvv1Pw6m0RgC9xRQucfWbRoNfQ5VaX631DwAtdOElJfhN9RjtITikXH
	 FgmGe8Kz49Y6cA1trXVABM1/1+mYncTrWGAeIdyj2ymB7z2oAFwK9acHftAKynwhy/
	 Ni5X2xaTHld/FjJh8VT5jpLeLn7vdv8tM7o/s2SPkNAAW7AWrQUAMXRjmLHzTDyPXV
	 r0nvKvKUnHL6fN3nEXbWjsBr50V6TRAwbfuVay89OBpKNy3og5SRqnCseuL4ZYLEI3
	 RTKOOtGVzZh9o9EvG4LcB1NCxhKsyVDrnaT48s65dXnTfRiEbrbxdWXbRrR88aHfJC
	 d6BRwgdsbI0fw==
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
Subject: [PATCH 30/43] sched/smp: Use the SMP version of scheduler debugging data
Date: Wed, 28 May 2025 10:09:11 +0200
Message-ID: <20250528080924.2273858-31-mingo@kernel.org>
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

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

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
 kernel/sched/debug.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 027750931420..aea71013c371 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -166,8 +166,6 @@ static const struct file_operations sched_feat_fops = {
 	.release	= single_release,
 };
 
-#ifdef CONFIG_SMP
-
 static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
 				   size_t cnt, loff_t *ppos)
 {
@@ -214,8 +212,6 @@ static const struct file_operations sched_scaling_fops = {
 	.release	= single_release,
 };
 
-#endif /* CONFIG_SMP */
-
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
 static ssize_t sched_dynamic_write(struct file *filp, const char __user *ubuf,
@@ -508,7 +504,6 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
 	debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
 
-#ifdef CONFIG_SMP
 	debugfs_create_file("tunable_scaling", 0644, debugfs_sched, NULL, &sched_scaling_fops);
 	debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, &sysctl_sched_migration_cost);
 	debugfs_create_u32("nr_migrate", 0644, debugfs_sched, &sysctl_sched_nr_migrate);
@@ -516,7 +511,6 @@ static __init int sched_init_debug(void)
 	sched_domains_mutex_lock();
 	update_sched_domain_debugfs();
 	sched_domains_mutex_unlock();
-#endif /* CONFIG_SMP */
 
 #ifdef CONFIG_NUMA_BALANCING
 	numa = debugfs_create_dir("numa_balancing", debugfs_sched);
@@ -682,11 +676,9 @@ static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group
 	}
 
 	P(se->load.weight);
-#ifdef CONFIG_SMP
 	P(se->avg.load_avg);
 	P(se->avg.util_avg);
 	P(se->avg.runnable_avg);
-#endif /* CONFIG_SMP */
 
 #undef PN_SCHEDSTAT
 #undef PN
@@ -846,7 +838,6 @@ void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
 	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
 	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
 	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
-#ifdef CONFIG_SMP
 	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
 			cfs_rq->avg.load_avg);
 	SEQ_printf(m, "  .%-30s: %lu\n", "runnable_avg",
@@ -867,7 +858,6 @@ void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
 	SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
 			atomic_long_read(&cfs_rq->tg->load_avg));
 #endif /* CONFIG_FAIR_GROUP_SCHED */
-#endif /* CONFIG_SMP */
 #ifdef CONFIG_CFS_BANDWIDTH
 	SEQ_printf(m, "  .%-30s: %d\n", "throttled",
 			cfs_rq->throttled);
@@ -964,12 +954,10 @@ do {									\
 #undef P
 #undef PN
 
-#ifdef CONFIG_SMP
 #define P64(n) SEQ_printf(m, "  .%-30s: %Ld\n", #n, rq->n);
 	P64(avg_idle);
 	P64(max_idle_balance_cost);
 #undef P64
-#endif /* CONFIG_SMP */
 
 #define P(n) SEQ_printf(m, "  .%-30s: %d\n", #n, schedstat_val(rq->n));
 	if (schedstat_enabled()) {
@@ -1235,7 +1223,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 	__PS("nr_involuntary_switches", p->nivcsw);
 
 	P(se.load.weight);
-#ifdef CONFIG_SMP
 	P(se.avg.load_sum);
 	P(se.avg.runnable_sum);
 	P(se.avg.util_sum);
@@ -1244,7 +1231,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 	P(se.avg.util_avg);
 	P(se.avg.last_update_time);
 	PM(se.avg.util_est, ~UTIL_AVG_UNCHANGED);
-#endif /* CONFIG_SMP */
 #ifdef CONFIG_UCLAMP_TASK
 	__PS("uclamp.min", p->uclamp_req[UCLAMP_MIN].value);
 	__PS("uclamp.max", p->uclamp_req[UCLAMP_MAX].value);
-- 
2.45.2

