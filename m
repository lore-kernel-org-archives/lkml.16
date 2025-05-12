Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AAE267B92
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051845; cv=none; b=qETWOUYb0ur/WnGJ+h3/9Lee6J/OMxhr58MjwLqss/9f1s4FXHwcXMEo9n8nArP/4EgEKq+LaoKa4Z6sxArqui3Wte5JJFHXBNSSeY4BhlSpB6fzx6NpLrL/rLMdHqYdwoht1kS8EaCw+Ctyj2rhXH64mwWib5dpZKZ+4RYHr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051845; c=relaxed/simple;
	bh=2QCB2SuN1wpsr9YqrrwuAk0wTgAtxbANKSzHAg2/huQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dgjz5DNdNlnJ320wVxnMftreNWNSsfa6S7ea9oUWpyi/oRu71keMIUrvK6QvjlR9n9jlUGfzRofCsyXx1LJsmj+PgLaniVZx3EP6dMTL8UQHceVN6zpf3gaWR6rloiA/ZhQPOLgh8/N4uifJeTnurGRga7fP673ROzhYFouzhY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lylGVZ2J; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lylGVZ2J"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9Ep5T015457;
	Mon, 12 May 2025 12:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=DN8IsBRjOzjHHBzDJ
	gIL816UD74O6S2zdS//76HcAMM=; b=lylGVZ2J/+prx3ZB3yY86AW2qefNbbRO7
	NnjFnZEUjsSk52PDTEosgb9Lbaej1uwJRJ+nUud8cVoFWUCZCSQ7bxQQgng6WBs/
	Lt150ci+/LwdMazHXRQZHYUjMVrlkw2FULLj3igiWTrXA3pB2rl7thzCkZkoWHZO
	S8EG4r7ZstvGJPJcw+Af4gB2uwFBhI+DQ98yhqDqn6sbciOSPSFJf2mrCKvIZihG
	MGoHdh0qBrqu1YvAJEEDimaS47vylk84opGVaE78GrbJtbzgn+AG/jZXY14zOstj
	2Na7E/kF6TIxB04FhIHIWkvut4AqtX4Ts4Fx0dia8crqZIHVG2qsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ke6j0qsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:10:32 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CCANJl003141;
	Mon, 12 May 2025 12:10:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ke6j0qs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:10:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CA687P024537;
	Mon, 12 May 2025 12:10:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jjmkwr52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:10:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CCAR8C20644370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 12:10:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C011200E7;
	Mon, 12 May 2025 11:53:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D83B7200E1;
	Mon, 12 May 2025 11:53:26 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.111.90.223])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 11:53:26 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com
Subject: [RFC PATCH v3 1/4] sched/fair: introduce new scheduler group type group_parked
Date: Mon, 12 May 2025 13:53:22 +0200
Message-Id: <20250512115325.30022-2-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512115325.30022-1-huschle@linux.ibm.com>
References: <20250512115325.30022-1-huschle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MJxaM8WbEVUomQ4psKk8nSAegtv5IIUz
X-Proofpoint-ORIG-GUID: cT4DVgmvBXYCybM6h1-ft2F8mRiDQxS5
X-Authority-Analysis: v=2.4 cv=auyyCTZV c=1 sm=1 tr=0 ts=6821e538 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=Ig1JQATniH1yXVHltnwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEyNyBTYWx0ZWRfX9aOaB6N+tnm+ ENHN05ccqdcogzjsJ6uPwwP1q3E5cz8PXkBZsHk1HsO5lP6BUfTorZgzQKEV06Q/m2GLqnjRXjs DBHZC0Q0xcY0LYeHP97OM70fUt0xt+AEWzUPjfgxezrAfWNc+IKIzDpPMfBiEGDJhKDs7aQnHOX
 waXrZyVfT4RHvC/x0/Kl1y/rnVgy7xuHhhIxn8KOLX6GZC4B+Vjm6xkqQ6xkJVMhZGkVS5MKv9r O6F5ExFFiRSGTn13S89sp55Vf/rJW+43tVmOt5oiv96ca74FO5jF0vwOsGjqrRheu2QogcFALkq tZk9HMsRb1Gob41IQf+1AmvOYfv7Vc7Qa0MtQPXOS9HOwhEmrhTe55ZtX75h3lVuyYJxbpJoMlc
 vhoGdhWgm6iHct69/ZWVq7SqFSScSe+LVikI9eDJynU1eGU1PV7U70eoQGMvuT8N5ILuHWHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120127

A parked CPU is considered to be flagged as unsuitable to process
workload at the moment, but might be become usable anytime. Depending on
the necessity for additional computation power and/or available capacity
of the underlying hardware.

A scheduler group is considered to be parked, if there are tasks queued
on parked CPUs and there are no idle CPUs, i.e. all non parked CPUs are
busy or there are only parked CPUs. A scheduler group with parked tasks
can be considered to not be parked, if it has idle CPUs which can pick
up the parked tasks. A parked scheduler group is considered to be busier
than another if it runs more tasks on parked CPUs than another parked
scheduler group.

A parked CPU must keep its scheduler tick (or have it re-enabled if
necessary) in order to make sure that parked CPUs which only run a
single task which does not give up its runtime voluntarily is still
evacuated as it would otherwise go into NO_HZ.

The status of the underlying hardware must be considered to be
architecture dependent. Therefore the check whether a CPU is parked is
architecture specific. For architectures not relying on this feature,
the check is mostly a NOP.

This is more efficient and non-disruptive compared to CPU hotplug in
environments where such changes can be necessary on a frequent basis.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 include/linux/sched/topology.h | 19 +++++++++
 kernel/sched/core.c            | 13 +++++-
 kernel/sched/fair.c            | 77 +++++++++++++++++++++++++++++-----
 kernel/sched/syscalls.c        |  3 ++
 4 files changed, 101 insertions(+), 11 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 7b4301b7235f..6baf51d45e85 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -251,6 +251,25 @@ unsigned long arch_scale_cpu_capacity(int cpu)
 }
 #endif
 
+#ifndef arch_cpu_parked
+/**
+ * arch_cpu_parked - Check if a given CPU is currently parked.
+ *
+ * A parked CPU cannot run any kind of workload since underlying
+ * physical CPU should not be used at the moment .
+ *
+ * @cpu: the CPU in question.
+ *
+ * By default assume CPU is not parked
+ *
+ * Return: Parked state of CPU
+ */
+static __always_inline bool arch_cpu_parked(int cpu)
+{
+	return false;
+}
+#endif
+
 #ifndef arch_scale_hw_pressure
 static __always_inline
 unsigned long arch_scale_hw_pressure(int cpu)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..90efc322a81e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1358,6 +1358,9 @@ bool sched_can_stop_tick(struct rq *rq)
 	if (rq->cfs.h_nr_queued > 1)
 		return false;
 
+	if (rq->cfs.h_nr_queued > 0 && arch_cpu_parked(cpu_of(rq)))
+		return false;
+
 	/*
 	 * If there is one task and it has CFS runtime bandwidth constraints
 	 * and it's on the cpu now we don't want to stop the tick.
@@ -2449,7 +2452,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 
 	/* Non kernel threads are not allowed during either online or offline. */
 	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+		return !arch_cpu_parked(cpu) && cpu_active(cpu);
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2459,6 +2462,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* CPU should be avoided at the moment */
+	if (arch_cpu_parked(cpu))
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
@@ -3929,6 +3936,10 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
 	if (!scx_allow_ttwu_queue(p))
 		return false;
 
+	/* The task should not be queued onto a parked CPU. */
+	if (arch_cpu_parked(cpu))
+		return false;
+
 	/*
 	 * Do not complicate things with the async wake_list while the CPU is
 	 * in hotplug state.
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a47..ee8ccee69774 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6884,6 +6884,8 @@ static int sched_idle_rq(struct rq *rq)
 #ifdef CONFIG_SMP
 static int sched_idle_cpu(int cpu)
 {
+	if (arch_cpu_parked(cpu))
+		return 0;
 	return sched_idle_rq(cpu_rq(cpu));
 }
 #endif
@@ -7414,6 +7416,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 {
 	int target = nr_cpumask_bits;
 
+	if (arch_cpu_parked(target))
+		return prev_cpu;
+
 	if (sched_feat(WA_IDLE))
 		target = wake_affine_idle(this_cpu, prev_cpu, sync);
 
@@ -9204,7 +9209,12 @@ enum group_type {
 	 * The CPU is overloaded and can't provide expected CPU cycles to all
 	 * tasks.
 	 */
-	group_overloaded
+	group_overloaded,
+	/*
+	 * The CPU should be avoided as it can't provide expected CPU cycles
+	 * even for small amounts of workload.
+	 */
+	group_parked
 };
 
 enum migration_type {
@@ -9923,6 +9933,7 @@ struct sg_lb_stats {
 	unsigned long group_runnable;		/* Total runnable time over the CPUs of the group */
 	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
 	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
+	unsigned int sum_nr_parked;
 	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
 	unsigned int group_weight;
 	enum group_type group_type;
@@ -10180,6 +10191,9 @@ group_type group_classify(unsigned int imbalance_pct,
 			  struct sched_group *group,
 			  struct sg_lb_stats *sgs)
 {
+	if (sgs->sum_nr_parked && !sgs->idle_cpus)
+		return group_parked;
+
 	if (group_is_overloaded(imbalance_pct, sgs))
 		return group_overloaded;
 
@@ -10375,6 +10389,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		if (cpu_overutilized(i))
 			*sg_overutilized = 1;
 
+		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+
 		/*
 		 * No need to call idle_cpu() if nr_running is not 0
 		 */
@@ -10480,6 +10496,8 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 	 */
 
 	switch (sgs->group_type) {
+	case group_parked:
+		return sgs->sum_nr_parked > busiest->sum_nr_parked;
 	case group_overloaded:
 		/* Select the overloaded group with highest avg_load. */
 		return sgs->avg_load > busiest->avg_load;
@@ -10643,6 +10661,9 @@ static int idle_cpu_without(int cpu, struct task_struct *p)
 {
 	struct rq *rq = cpu_rq(cpu);
 
+	if (arch_cpu_parked(cpu))
+		return 0;
+
 	if (rq->curr != rq->idle && rq->curr != p)
 		return 0;
 
@@ -10691,6 +10712,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 		nr_running = rq->nr_running - local;
 		sgs->sum_nr_running += nr_running;
 
+		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+
 		/*
 		 * No need to call idle_cpu_without() if nr_running is not 0
 		 */
@@ -10738,6 +10761,8 @@ static bool update_pick_idlest(struct sched_group *idlest,
 	 */
 
 	switch (sgs->group_type) {
+	case group_parked:
+		return false;
 	case group_overloaded:
 	case group_fully_busy:
 		/* Select the group with lowest avg_load. */
@@ -10788,7 +10813,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 	unsigned long imbalance;
 	struct sg_lb_stats idlest_sgs = {
 			.avg_load = UINT_MAX,
-			.group_type = group_overloaded,
+			.group_type = group_parked,
 	};
 
 	do {
@@ -10846,6 +10871,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		return idlest;
 
 	switch (local_sgs.group_type) {
+	case group_parked:
+		return idlest;
 	case group_overloaded:
 	case group_fully_busy:
 
@@ -11097,6 +11124,12 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 	local = &sds->local_stat;
 	busiest = &sds->busiest_stat;
 
+	if (busiest->group_type == group_parked) {
+		env->migration_type = migrate_task;
+		env->imbalance = busiest->sum_nr_parked;
+		return;
+	}
+
 	if (busiest->group_type == group_misfit_task) {
 		if (env->sd->flags & SD_ASYM_CPUCAPACITY) {
 			/* Set imbalance to allow misfit tasks to be balanced. */
@@ -11265,13 +11298,14 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 /*
  * Decision matrix according to the local and busiest group type:
  *
- * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded
- * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced
- * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced
- * misfit_task      force     N/A        N/A    N/A  N/A        N/A
- * asym_packing     force     force      N/A    N/A  force      force
- * imbalanced       force     force      N/A    N/A  force      force
- * overloaded       force     force      N/A    N/A  force      avg_load
+ * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded parked
+ * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced  balanced
+ * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced  balanced
+ * misfit_task      force     N/A        N/A    N/A  N/A        N/A       N/A
+ * asym_packing     force     force      N/A    N/A  force      force     balanced
+ * imbalanced       force     force      N/A    N/A  force      force     balanced
+ * overloaded       force     force      N/A    N/A  force      avg_load  balanced
+ * parked           force     force      N/A    N/A  force      force     balanced
  *
  * N/A :      Not Applicable because already filtered while updating
  *            statistics.
@@ -11310,6 +11344,13 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 		goto out_balanced;
 
 	busiest = &sds.busiest_stat;
+	local = &sds.local_stat;
+
+	if (local->group_type == group_parked)
+		goto out_balanced;
+
+	if (busiest->group_type == group_parked)
+		goto force_balance;
 
 	/* Misfit tasks should be dealt with regardless of the avg load */
 	if (busiest->group_type == group_misfit_task)
@@ -11331,7 +11372,6 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	if (busiest->group_type == group_imbalanced)
 		goto force_balance;
 
-	local = &sds.local_stat;
 	/*
 	 * If the local group is busier than the selected busiest group
 	 * don't try and pull any tasks.
@@ -11444,6 +11484,9 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 		enum fbq_type rt;
 
 		rq = cpu_rq(i);
+		if (arch_cpu_parked(i) && rq->cfs.h_nr_queued)
+			return rq;
+
 		rt = fbq_classify_rq(rq);
 
 		/*
@@ -11614,6 +11657,9 @@ static int need_active_balance(struct lb_env *env)
 {
 	struct sched_domain *sd = env->sd;
 
+	if (arch_cpu_parked(env->src_cpu) && cpu_rq(env->src_cpu)->cfs.h_nr_queued)
+		return 1;
+
 	if (asym_active_balance(env))
 		return 1;
 
@@ -11647,6 +11693,14 @@ static int should_we_balance(struct lb_env *env)
 	struct sched_group *sg = env->sd->groups;
 	int cpu, idle_smt = -1;
 
+	if (arch_cpu_parked(env->dst_cpu))
+		return 0;
+
+	for_each_cpu(cpu, sched_domain_span(env->sd)) {
+		if (arch_cpu_parked(cpu) && cpu_rq(cpu)->cfs.h_nr_queued)
+			return 1;
+	}
+
 	/*
 	 * Ensure the balancing environment is consistent; can happen
 	 * when the softirq triggers 'during' hotplug.
@@ -12788,6 +12842,9 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
 	update_misfit_status(NULL, this_rq);
 
+	if (arch_cpu_parked(this_cpu))
+		return 0;
+
 	/*
 	 * There is a task waiting to run. No need to search for one.
 	 * Return 0; the task will be enqueued when switching to idle.
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index c326de1344fb..4e559d8775da 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -214,6 +214,9 @@ int idle_cpu(int cpu)
 		return 0;
 #endif
 
+	if (arch_cpu_parked(cpu))
+		return 0;
+
 	return 1;
 }
 
-- 
2.34.1

