Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225817FD
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 04:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750479007; cv=none; b=Wyxim5D7N+sLEDlUVK25EiRnwt0qUBo9nJQ2TgG1sCHsZ0kRxZl2G/4r0dT8x7zxXiet0NUgkGCbenwcpb3jkM394iHr2wNyof+QpE4sq8MH64f7lgO7m58T9iqkvTWqHnZsX2MqnnKEEoSO3NQ58v62W7x7Dnwiz56wwQIZbOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750479007; c=relaxed/simple;
	bh=9OQ35JojopA4/79f1LPUMo+a0RFRyC+3+Fm70Q9yVsw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=okI5OX4G5uNaWAF9kAGfHfhTKndTG+NGWG9nbFtMbb0RLu5/EWK/e+8eH7w6fsDmPlna4wtt7DELtGW/xyyLQm985QpuZk3l9Ow5127iRCo7LWglWO4h3JVHONSRFCODlOzUlZOVKlTI4vzr3VfpIbwRTrHaZV4M8CyqqRYTNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bPLR16WfxzYlMtj;
	Sat, 21 Jun 2025 12:07:41 +0800 (CST)
Received: from a005.hihonor.com (10.68.18.24) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 21 Jun
 2025 12:09:56 +0800
Received: from a007.hihonor.com (10.68.22.31) by a005.hihonor.com
 (10.68.18.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 21 Jun
 2025 12:09:56 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Sat, 21 Jun 2025 12:09:56 +0800
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
Subject: [PATCH] sched_ext: Fix cpu_released while RT task and SCX task are
 scheduled concurrently
Thread-Topic: [PATCH] sched_ext: Fix cpu_released while RT task and SCX task
 are scheduled concurrently
Thread-Index: AdviYdJPAxrzVE2lRZOpYb+Wb9OtGg==
Date: Sat, 21 Jun 2025 04:09:55 +0000
Message-ID: <fca528bb34394de3a7e87a873fadd9df@honor.com>
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

Supposed RT task(rt1) is running on one CPU with its rq->scx.cpu_released
set to true, if the rt1 becomes sleeping, then the scheduler will balance
the remote SCX task(scx1) because there is no other RT task on its rq,
and rq->scx.cpu_released is false. While one RT task(rt2) is placed on
this rq(maybe rt2 wakeup or migration occurs) before the scx1 is enqueued,
then the scheduler will pick rt2. At last, rt2 will be running on this cpu
with rq->scx.cpu_released being false!
The main reason is that consume_remote_task() will unlock rq lock.

So, expose the switch_class() and check sched class again to fix the value
of rq->scx.cpu_released.

Signed-off-by: liuwenfang liuwenfang@honor.com

---
 kernel/sched/ext.c   | 2 +-
 kernel/sched/sched.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34e..d377075d0 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1738,6 +1738,7 @@ static inline void scx_rq_clock_invalidate(struct rq =
*rq)
 	WRITE_ONCE(rq->scx.flags, rq->scx.flags & ~SCX_RQ_CLK_VALID);
 }
=20
+void switch_class(struct rq *rq, struct task_struct *next);
 #else /* !CONFIG_SCHED_CLASS_EXT */
 #define scx_enabled()		false
 #define scx_switched_all()	false
@@ -2470,6 +2471,11 @@ static inline void put_prev_set_next_task(struct rq =
*rq,
=20
 	prev->sched_class->put_prev_task(rq, prev, next);
 	next->sched_class->set_next_task(rq, next, true);
+
+#ifdef CONFIG_SCHED_CLASS_EXT
+	if (scx_enabled())
+		switch_class(rq, next);
+#endif
 }
=20
 /*
--=20
2.17.1
