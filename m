Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E522068A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751094662; cv=none; b=lhC8YjascL5LgJdgNlaYIexaa9JiEyqRm8KhQUlqQKik6ULevFRchH72uQx9AwaQC3OGnC21qnmyptTlwCP0G0mVXy9bsNYh4zF2sH7JjW7UocJ5oGqgVT4u8koeMLPbGbt7sN8rt4BvKnRyUolwxSweWg67fo+R6VmjYCZ9GDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751094662; c=relaxed/simple;
	bh=bNhLn/dsJQRSsFabEZC5C4WabwpzLWb7QLFpccDdDso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ol2DXnfy/UB2p9RcMdHTZJX0nMaY747X/I8AyStqAIHrS4ai5zAkPnmmE2o+9lvy7/KqQFDMw5kSLzyQ9KjgThTCKgGJbTRGnj/gqu3cQ+XzcAesWWLT3s1U90ztfrX8Egpu3oHXiRbZt1xx4RZeCPYLNGG8RjnU0iOY6MMC2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bTjfk3RRMzYm8sx;
	Sat, 28 Jun 2025 14:47:58 +0800 (CST)
Received: from a002.hihonor.com (10.68.31.193) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Jun
 2025 14:50:32 +0800
Received: from a007.hihonor.com (10.68.22.31) by a002.hihonor.com
 (10.68.31.193) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Jun
 2025 14:50:32 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Sat, 28 Jun 2025 14:50:32 +0800
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
Subject: [PATCH v2 1/2] sched_ext: Fix cpu_released while RT task and SCX task
 are scheduled concurrently
Thread-Topic: [PATCH v2 1/2] sched_ext: Fix cpu_released while RT task and SCX
 task are scheduled concurrently
Thread-Index: AQHb5/jx8N0T8swIHEO5GPUnf7Kp9A==
Date: Sat, 28 Jun 2025 06:50:32 +0000
Message-ID: <ced96acd54644325b77c2d8f9fcda658@honor.com>
References: <fca528bb34394de3a7e87a873fadd9df@honor.com>
 <aFmwHzO2AKFXO_YS@slm.duckdns.org>
In-Reply-To: <aFmwHzO2AKFXO_YS@slm.duckdns.org>
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

Supposed RT task(RT1) is running on CPU0 and RT task(RT2) is awakened on CP=
U1,
RT1 becomes sleep and SCX task(SCX1) will be dispatched to CPU0, RT2 will b=
e
placed on CPU0:

CPU0(schedule)                                     CPU1(try_to_wake_up)
set_current_state(TASK_INTERRUPTIBLE)              try_to_wake_up # RT2
__schedule                                           select_task_rq # CPU0 =
is selected
LOCK rq(0)->lock # lock CPU0 rq                        ttwu_queue
  deactivate_task # RT1                                  LOCK rq(0)->lock #=
 busy waiting
    pick_next_task # no more RT tasks on rq                 |
      prev_balance                                          |
        balance_scx                                         |
          balance_one                                       |
            rq->scx.cpu_released =3D false;                   |
              consume_global_dsq                            |
                consume_dispatch_q                          |
                  consume_remote_task                       |
                    UNLOCK rq(0)->lock                      V
                                                         LOCK rq(0)->lock #=
 succ
                    deactivate_task # SCX1               ttwu_do_activate
                    LOCK rq(0)->lock # busy waiting      activate_task # RT=
2 equeued
                       |                                 UNLOCK rq(0)->lock
                       V
                    LOCK rq(0)->lock # succ
                    activate_task # SCX1
      pick_task # RT2 is picked
      put_prev_set_next_task # prev is RT1, next is RT2, rq->scx.cpu_releas=
ed =3D false;
UNLOCK rq(0)->lock

At last, RT2 will be running on CPU0 with rq->scx.cpu_released being false!

So, Add the scx_next_task_picked () and check sched class again to fix the =
value
of rq->scx.cpu_released.

Signed-off-by: l00013971 <l00013971@hihonor.com>
---
 kernel/sched/ext.c   | 24 +++++++++++++++++-------
 kernel/sched/sched.h |  5 +++++
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f5133249f..f161156be 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3187,7 +3187,7 @@ preempt_reason_from_class(const struct sched_class *c=
lass)
 	return SCX_CPU_PREEMPT_UNKNOWN;
 }
=20
-static void switch_class(struct rq *rq, struct task_struct *next)
+static void switch_class(struct rq *rq, struct task_struct *next, bool pre=
v_on_scx)
 {
 	const struct sched_class *next_class =3D next->sched_class;
=20
@@ -3197,7 +3197,8 @@ static void switch_class(struct rq *rq, struct task_s=
truct *next)
 	 * kick_cpus_irq_workfn() who is waiting for this CPU to perform a
 	 * resched.
 	 */
-	smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
+	if (prev_on_scx)
+		smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
 #endif
 	if (!static_branch_unlikely(&scx_ops_cpu_preempt))
 		return;
@@ -3233,6 +3234,19 @@ static void switch_class(struct rq *rq, struct task_=
struct *next)
 	}
 }
=20
+void scx_next_task_picked(struct rq *rq, struct task_struct *prev,
+			  struct task_struct *next)
+{
+	bool prev_on_scx =3D prev && (prev->sched_class =3D=3D &ext_sched_class);
+
+	if (!scx_enabled() ||
+	    !next ||
+	    next->sched_class =3D=3D &ext_sched_class)
+		return;
+
+	switch_class(rq, next, prev_on_scx);
+}
+
 static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 			      struct task_struct *next)
 {
@@ -3253,7 +3267,7 @@ static void put_prev_task_scx(struct rq *rq, struct t=
ask_struct *p,
 		 */
 		if (p->scx.slice && !scx_rq_bypassing(rq)) {
 			dispatch_enqueue(&rq->scx.local_dsq, p, SCX_ENQ_HEAD);
-			goto switch_class;
+			return;
 		}
=20
 		/*
@@ -3269,10 +3283,6 @@ static void put_prev_task_scx(struct rq *rq, struct =
task_struct *p,
 			do_enqueue_task(rq, p, 0, -1);
 		}
 	}
-
-switch_class:
-	if (next && next->sched_class !=3D &ext_sched_class)
-		switch_class(rq, next);
 }
=20
 static struct task_struct *first_local_task(struct rq *rq)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34e..f8e1b2173 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1738,12 +1738,15 @@ static inline void scx_rq_clock_invalidate(struct r=
q *rq)
 	WRITE_ONCE(rq->scx.flags, rq->scx.flags & ~SCX_RQ_CLK_VALID);
 }
=20
+void scx_next_task_picked(struct rq *rq, struct task_struct *prev, struct =
task_struct *next);
 #else /* !CONFIG_SCHED_CLASS_EXT */
 #define scx_enabled()		false
 #define scx_switched_all()	false
=20
 static inline void scx_rq_clock_update(struct rq *rq, u64 clock) {}
 static inline void scx_rq_clock_invalidate(struct rq *rq) {}
+static inline void scx_next_task_picked(struct rq *rq, struct task_struct =
*prev,
+					struct task_struct *next) {}
 #endif /* !CONFIG_SCHED_CLASS_EXT */
=20
 /*
@@ -2465,6 +2468,8 @@ static inline void put_prev_set_next_task(struct rq *=
rq,
=20
 	__put_prev_set_next_dl_server(rq, prev, next);
=20
+	scx_next_task_picked(rq, prev, next);
+
 	if (next =3D=3D prev)
 		return;
=20
--=20
2.17.1

