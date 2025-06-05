Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1E1FC7CB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107680; cv=none; b=hK6W9N0CG8FnODAFLr1+jb0G0ruUk+3tMaD0g5M0JUjv4x2G9ZcWwG7McmRt0AqFFlWorWwZacdkThHdVYJLRqhlol85J1vpRYL29CJglhhicXPR1awQ/tsJpXIYmxHFsKvZATuMQBkKgxttBEisJrmEWgcH7e8AXfyS7H5mzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107680; c=relaxed/simple;
	bh=akpe+JnFNh0nrYF5bAG6YaO3R78jRwSWyOGs9dvuljg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1XUHB6cBGZ4YrX2g8XKqH9x0hdriPP30rCni3FI0gxz5bdVeXHLFxWMKy9drVy0fINeE+7O7y3lAyiN4X2By/b2B79oLOAhebwjeVYlB+1dL3Uk3RRWFU9bRcT8rKqAcgGnu58S5/cmyyDW/JtWOagIAn7/WsXBfJXhhpoR6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSLyQLYh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSLyQLYh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a361b8a664so592357f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107677; x=1749712477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wunkGBMjdfVg2AP1giwWoYeKTmh1qFR/UdkCw8YVy9E=;
        b=CSLyQLYh39/2MZUFMVgNuS4IscRFPTk/OPpGYuXAf6RgTlSx0yI1pPt3K0xrtyLm+n
         k7w7Z0oDO5nWZ6Qghngyto3+pHbIhnYTeJ7WJ9/7ijiTzG/zcZltM0DUVps7lPB6a1/J
         IAjlG5sIYfiwd0xulsKoqQO1HyUTX6cYZ7XIQPuaH7yZPAcMPuLUN7QlHtwFOESDZt43
         ylsWX7g+1u4iyOpR4n/GglqShqUJuEhlnyy43A5Z6Jexe9cBHWZARaGGhdCz9Q+fwSYj
         glTdpcdwA5Oanm8OSvPNFAWAyen2RYRUV2DLkAy+lQ7Y14LCq+jA0++z/V0wGfX6RJGj
         fj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107677; x=1749712477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wunkGBMjdfVg2AP1giwWoYeKTmh1qFR/UdkCw8YVy9E=;
        b=h6LSoCDijKMd9SbgRqm5qgJb0IznRIBvP/DMj3AV+LnxxaiE5mD7RWliPeTxFq1PTc
         3AYldQQPC5i/TeXphbrEAkQVvgD+ngxDbwg9ftUB9l/jkZDCWtd2pVOSv5RQO0TeKFwQ
         zCbGKZkp6Xkp396wvldRjLW9+78LTKkG7jOIvaZkklI3K6qT9VOjTiOVBYyTd4Nk07tK
         hLvyt+iZATrnQhqNF43MXvqP4VB/AyCjjppmt28TgOCxV37y340tF/VHieE84EWyVVoL
         +Amc4DIYnSrBS4LM+PH22i/zuWUdgrPPDEb/iXgg303MTvZcBm3DkSId2HTNpRvSPVyM
         9Llw==
X-Gm-Message-State: AOJu0YxC7mRqeovqdCq+BfBTXppRxMBcZYrTwZaPIL9UHMNva9Gpm/5j
	0ABeCjjieFwb/7apgBwqPY9V/LX208DPt+SGc/t0SgDgn4V4MJMjz1pC
X-Gm-Gg: ASbGncvp6xpeECTjzmevOaB2Fdda6c1oYcqATN6ZXWWENmLMyeG1TQjqBhpYjMAq8i8
	eWz6gihZk/hN5CReO9x0Ff6Z4H26Qx1PsqJayZNJ+qbjh/JLoLS6S++3eG1YzIJPBvPBiMqpAuV
	7WrW6Z/cbR8emvl+EF0c3dqNcCGwbihs3B59DAosrXEcB8u2bqLEGbdT0hPyDkec8t+M1gEukEx
	Wz+vJ7kgzt0FvqWx7QBUrsEXLnf4SZvki7knT33WVdk7MfLpl4G7WR0edwJvIQ1jvBglEmV66u6
	T9TIED9fLc2aIIgH2sfMWXqRt4yMDL6oRSQEFVhJRzW3unnfe8c5OADZzm3sMjW6
X-Google-Smtp-Source: AGHT+IFPiL6k/rAlAhbgeXT5cOuoAthP4yNSe1X48pEbt2w+TJrnfinK05CsPBV//zd7kId9wRjoEw==
X-Received: by 2002:a05:6000:26d0:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a51d986a6emr4521122f8f.58.1749107676489;
        Thu, 05 Jun 2025 00:14:36 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:36 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH 9/9] sched/deadline: Allow deeper hierarchies of RT cgroups
Date: Thu,  5 Jun 2025 09:14:12 +0200
Message-ID: <20250605071412.139240-10-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605071412.139240-1-yurand2000@gmail.com>
References: <20250605071412.139240-1-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: luca abeni <luca.abeni@santannapisa.it>

Allow creation of cgroup hierachies with depth greater than two.
Add check to prevent attaching tasks to a child cgroup of an active cgroup (i.e.
with a running FIFO/RR task).
Add check to prevent attaching tasks to cgroups which have children with
non-zero runtime.
Update rt-cgroups allocated bandwidth accounting for nested cgroup hierachies.

Co-developed-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/core.c     |  6 ----
 kernel/sched/deadline.c | 69 ++++++++++++++++++++++++++++++++++-------
 kernel/sched/rt.c       | 25 +++++++++++++--
 kernel/sched/sched.h    |  2 +-
 kernel/sched/syscalls.c |  4 +++
 5 files changed, 84 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9c8bc9728..c02cdeccf 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9127,12 +9127,6 @@ cpu_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 		return &root_task_group.css;
 	}
 
-	/* Do not allow cpu_cgroup hierachies with depth greater than 2. */
-#ifdef CONFIG_RT_GROUP_SCHED
-	if (parent != &root_task_group)
-		return ERR_PTR(-EINVAL);
-#endif
-
 	tg = sched_create_group(parent);
 	if (IS_ERR(tg))
 		return ERR_PTR(-ENOMEM);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index b07abbb60..b405b0724 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -414,10 +414,39 @@ int dl_check_tg(unsigned long total)
 	return 1;
 }
 
-int dl_init_tg(struct sched_dl_entity *dl_se, u64 rt_runtime, u64 rt_period)
+static inline bool is_active_sched_group(struct task_group *tg)
 {
+	struct task_group *child;
+	bool is_active = 1;
+
+	// if there are no children, this is a leaf group, thus it is active
+	list_for_each_entry_rcu(child, &tg->children, siblings) {
+		if (child->dl_bandwidth.dl_runtime > 0) {
+			is_active = 0;
+		}
+	}
+	return is_active;
+}
+
+static inline bool sched_group_has_active_siblings(struct task_group *tg)
+{
+	struct task_group *child;
+	bool has_active_siblings = 0;
+
+	// if there are no children, this is a leaf group, thus it is active
+	list_for_each_entry_rcu(child, &tg->parent->children, siblings) {
+		if (child != tg && child->dl_bandwidth.dl_runtime > 0) {
+			has_active_siblings = 1;
+		}
+	}
+	return has_active_siblings;
+}
+
+int dl_init_tg(struct task_group *tg, int cpu, u64 rt_runtime, u64 rt_period)
+{
+	struct sched_dl_entity *dl_se = tg->dl_se[cpu];
 	struct rq *rq = container_of(dl_se->dl_rq, struct rq, dl);
-	int is_active;
+	int is_active, is_active_group;
 	u64 old_runtime;
 
 	/*
@@ -434,24 +463,40 @@ int dl_init_tg(struct sched_dl_entity *dl_se, u64 rt_runtime, u64 rt_period)
 	if (rt_period & (1ULL << 63))
 		return 0;
 
+	is_active_group = is_active_sched_group(tg);
+
 	raw_spin_rq_lock_irq(rq);
 	is_active = dl_se->my_q->rt.rt_nr_running > 0;
 	old_runtime = dl_se->dl_runtime;
 	dl_se->dl_runtime  = rt_runtime;
 	dl_se->dl_period   = rt_period;
 	dl_se->dl_deadline = dl_se->dl_period;
-	if (is_active) {
-		sub_running_bw(dl_se, dl_se->dl_rq);
-	} else if (dl_se->dl_non_contending) {
-		sub_running_bw(dl_se, dl_se->dl_rq);
-		dl_se->dl_non_contending = 0;
-		hrtimer_try_to_cancel(&dl_se->inactive_timer);
+	if (is_active_group) {
+		if (is_active) {
+			sub_running_bw(dl_se, dl_se->dl_rq);
+		} else if (dl_se->dl_non_contending) {
+			sub_running_bw(dl_se, dl_se->dl_rq);
+			dl_se->dl_non_contending = 0;
+			hrtimer_try_to_cancel(&dl_se->inactive_timer);
+		}
+		__sub_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
+		dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
+		__add_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
+	} else {
+		dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
+	}
+
+	// add/remove the parent's bw
+	if (tg->parent && tg->parent != &root_task_group)
+	{
+		if (rt_runtime == 0 && old_runtime != 0 && !sched_group_has_active_siblings(tg)) {
+			__add_rq_bw(tg->parent->dl_se[cpu]->dl_bw, dl_se->dl_rq);
+		} else if (rt_runtime != 0 && old_runtime == 0 && !sched_group_has_active_siblings(tg)) {
+			__sub_rq_bw(tg->parent->dl_se[cpu]->dl_bw, dl_se->dl_rq);
+		}
 	}
-	__sub_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
-	dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
-	__add_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
 
-	if (is_active)
+	if (is_active_group && is_active)
 		add_running_bw(dl_se, dl_se->dl_rq);
 
 	raw_spin_rq_unlock_irq(rq);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index ce3320f12..225684450 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -106,7 +106,8 @@ void free_rt_sched_group(struct task_group *tg)
 			 * Fix this issue by changing the group runtime
 			 * to 0 immediately before freeing it.
 			 */
-			BUG_ON(!dl_init_tg(tg->dl_se[i], 0, tg->dl_se[i]->dl_period));
+			if (tg->dl_se[i]->dl_runtime)
+				BUG_ON(!dl_init_tg(tg, i, 0, tg->dl_se[i]->dl_period));
 			raw_spin_rq_lock_irqsave(cpu_rq(i), flags);
 			BUG_ON(tg->rt_rq[i]->rt_nr_running);
 			raw_spin_rq_unlock_irqrestore(cpu_rq(i), flags);
@@ -2197,6 +2198,14 @@ static int tg_set_rt_bandwidth(struct task_group *tg,
 {
 	int i, err = 0;
 
+	/*
+	 * Do not allow to set a RT runtime > 0 if the parent has RT tasks
+	 * (and is not the root group)
+	 */
+	if (rt_runtime && (tg != &root_task_group) && (tg->parent != &root_task_group) && tg_has_rt_tasks(tg->parent)) {
+		return -EINVAL;
+	}
+
 	/* No period doesn't make any sense. */
 	if (rt_period == 0)
 		return -EINVAL;
@@ -2220,7 +2229,7 @@ static int tg_set_rt_bandwidth(struct task_group *tg,
 		goto unlock_bandwidth;
 
 	for_each_possible_cpu(i) {
-		if (!dl_init_tg(tg->dl_se[i], rt_runtime, rt_period)) {
+		if (!dl_init_tg(tg, i, rt_runtime, rt_period)) {
 			err = -EINVAL;
 			break;
 		}
@@ -2290,6 +2299,9 @@ static int sched_rt_global_constraints(void)
 
 int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk)
 {
+	struct task_group *child;
+	int can_attach = 1;
+
 	/* Allow executing in the root cgroup regardless of allowed bandwidth */
 	if (tg == &root_task_group)
 		return 1;
@@ -2298,7 +2310,14 @@ int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk)
 	if (rt_group_sched_enabled() && tg->dl_bandwidth.dl_runtime == 0)
 		return 0;
 
-	return 1;
+	/* If one of the children has runtime > 0, cannot attach RT tasks! */
+	list_for_each_entry_rcu(child, &tg->children, siblings) {
+		if (child->dl_bandwidth.dl_runtime) {
+			can_attach = 0;
+		}
+	}
+
+	return can_attach;
 }
 
 #else /* !CONFIG_RT_GROUP_SCHED */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 686578666..fde133f9c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -384,7 +384,7 @@ extern void dl_server_init(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task);
 int dl_check_tg(unsigned long total);
-int dl_init_tg(struct sched_dl_entity *dl_se, u64 rt_runtime, u64 rt_period);
+int dl_init_tg(struct task_group *tg, int cpu, u64 rt_runtime, u64 rt_period);
 
 extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p);
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 45a38fe5e..7e5e6de92 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -630,6 +630,10 @@ int __sched_setscheduler(struct task_struct *p,
 
 	if (user) {
 #ifdef CONFIG_RT_GROUP_SCHED
+		if (dl_bandwidth_enabled() && rt_policy(policy) && !sched_rt_can_attach(task_group(p), p)) {
+			retval = -EPERM;
+			goto unlock;
+		}
 		/*
 		 * Do not allow real-time tasks into groups that have no runtime
 		 * assigned.
-- 
2.49.0

