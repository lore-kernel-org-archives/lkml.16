Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEE279789
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541883; cv=none; b=jPgrE+N7DCeOI40fFOeylozDAwpuJOF7Iw79LcX4NXpo7FRwbH/7vBqF2h+PruQplmUfvxNQysKBG2RPWi5tzxW3H0bj7fiiyqfq5B8SvlTSGyignWwjbVwShgb5/6gGXx7rwqnOy93sn1yZ2dIzYdWWkhOjjREkP7lGcSEfxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541883; c=relaxed/simple;
	bh=FW5e3IBdBKRe6Zi65OUzZLCZMrzrXe5RKIGz7SBgs18=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KngaP5zoDKQFyijb+N+8BhO47ldDYkynSetngXhUoo20UayA/OKUolR5Dg3LXGLDMliMupKBk9dvTmhsctsRWOFfPOtKfWqkUQFuO1f6XkDESnH6jLt+aUGjLoD/mvy1F/9S39UkPh32ujuo0jg+UyNJnhZicluJVzAd8qvVvA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bGgsq4tGMzYlgYR;
	Tue, 10 Jun 2025 15:49:19 +0800 (CST)
Received: from a007.hihonor.com (10.68.22.31) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Jun
 2025 15:51:18 +0800
Received: from a007.hihonor.com (10.68.22.31) by a007.hihonor.com
 (10.68.22.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Jun
 2025 15:51:17 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Tue, 10 Jun 2025 15:51:17 +0800
From: liuwenfang <liuwenfang@honor.com>
To: 'Tejun Heo' <tj@kernel.org>
CC: 'David Vernet' <void@manifault.com>, 'Andrea Righi' <arighi@nvidia.com>,
	'Changwoo Min' <changwoo@igalia.com>, 'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>, 'Juri Lelli'
	<juri.lelli@redhat.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>, 'Steven Rostedt'
	<rostedt@goodmis.org>, 'Ben Segall' <bsegall@google.com>, 'Mel Gorman'
	<mgorman@suse.de>, 'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: [PATCH] sched_ext: idle: Fix cpu_released while RT task is scheduled
 on an idle core
Thread-Topic: [PATCH] sched_ext: idle: Fix cpu_released while RT task is
 scheduled on an idle core
Thread-Index: AdvZ29rl5R/nAahrQJWc2mgRCO7nQQ==
Date: Tue, 10 Jun 2025 07:51:17 +0000
Message-ID: <ff3aa51349414f169cd550f25b245c38@honor.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Assume task RT1 and RT2 have RT prio, one cpu has scheduled task RT1,
task idle, and task RT2 in order, and rq->scx.cpu_released was true while
task RT1 was running. then rq->scx.cpu_released was changed from true to
false while task RT1 was scheduled out and idle was scheduled in.
But rq->scx.cpu_released could not be changed to true while task RT2 was
scheduled in later.

The sched_class of next task can be observed while update_idle and the
state of rq->scx.cpu_released can be changed properly.

Signed-off-by: liuwenfang liuwenfang@honor.com=20
---
 kernel/sched/ext.c      |  2 +-
 kernel/sched/ext.h      | 11 +++++++----
 kernel/sched/ext_idle.c |  6 +++++-
 kernel/sched/ext_idle.h |  1 +
 kernel/sched/idle.c     |  6 +++---
 5 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f5133249f..6bbea0ea1 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3187,7 +3187,7 @@ preempt_reason_from_class(const struct sched_class *c=
lass)
 	return SCX_CPU_PREEMPT_UNKNOWN;
 }
=20
-static void switch_class(struct rq *rq, struct task_struct *next)
+void switch_class(struct rq *rq, struct task_struct *next)
 {
 	const struct sched_class *next_class =3D next->sched_class;
=20
diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index 1bda96b19..eddfcc98e 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -67,15 +67,18 @@ static inline void init_sched_ext_class(void) {}
 #endif	/* CONFIG_SCHED_CLASS_EXT */
=20
 #if defined(CONFIG_SCHED_CLASS_EXT) && defined(CONFIG_SMP)
-void __scx_update_idle(struct rq *rq, bool idle, bool do_notify);
+void __scx_update_idle(struct rq *rq, struct task_struct *next,
+		       bool idle, bool do_notify);
=20
-static inline void scx_update_idle(struct rq *rq, bool idle, bool do_notif=
y)
+static inline void scx_update_idle(struct rq *rq, struct task_struct *next=
,
+				   bool idle, bool do_notify)
 {
 	if (scx_enabled())
-		__scx_update_idle(rq, idle, do_notify);
+		__scx_update_idle(rq, next, idle, do_notify);
 }
 #else
-static inline void scx_update_idle(struct rq *rq, bool idle, bool do_notif=
y) {}
+static inline void scx_update_idle(struct rq *rq, struct task_struct *next=
,
+				   bool idle, bool do_notify) {}
 #endif
=20
 #ifdef CONFIG_CGROUP_SCHED
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index e67a19a07..9735f1fb1 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -660,12 +660,16 @@ static void update_builtin_idle(int cpu, bool idle)
  * while avoiding unnecessary updates and maintaining balanced state
  * transitions.
  */
-void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
+void __scx_update_idle(struct rq *rq, struct task_struct *next,
+		       bool idle, bool do_notify)
 {
 	int cpu =3D cpu_of(rq);
=20
 	lockdep_assert_rq_held(rq);
=20
+	if (!idle && !rq->scx.cpu_released && next)
+		switch_class(rq, next);
+
 	/*
 	 * Trigger ops.update_idle() only when transitioning from a task to
 	 * the idle thread and vice versa.
diff --git a/kernel/sched/ext_idle.h b/kernel/sched/ext_idle.h
index 511cc2221..83d74ea37 100644
--- a/kernel/sched/ext_idle.h
+++ b/kernel/sched/ext_idle.h
@@ -31,5 +31,6 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cp=
u, u64 wake_flags, u64
 void scx_idle_enable(struct sched_ext_ops *ops);
 void scx_idle_disable(void);
 int scx_idle_init(void);
+void switch_class(struct rq *rq, struct task_struct *next);
=20
 #endif /* _KERNEL_SCHED_EXT_IDLE_H */
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 2c85c86b4..1b77b56bc 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -452,20 +452,20 @@ static void wakeup_preempt_idle(struct rq *rq, struct=
 task_struct *p, int flags)
 static void put_prev_task_idle(struct rq *rq, struct task_struct *prev, st=
ruct task_struct *next)
 {
 	dl_server_update_idle_time(rq, prev);
-	scx_update_idle(rq, false, true);
+	scx_update_idle(rq, next, false, true);
 }
=20
 static void set_next_task_idle(struct rq *rq, struct task_struct *next, bo=
ol first)
 {
 	update_idle_core(rq);
-	scx_update_idle(rq, true, true);
+	scx_update_idle(rq, next, true, true);
 	schedstat_inc(rq->sched_goidle);
 	next->se.exec_start =3D rq_clock_task(rq);
 }
=20
 struct task_struct *pick_task_idle(struct rq *rq)
 {
-	scx_update_idle(rq, true, false);
+	scx_update_idle(rq, NULL, true, false);
 	return rq->idle;
 }
=20
--=20
2.17.1
