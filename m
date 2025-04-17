Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BB91C5D70
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864543; cv=none; b=Gcuan0yJwKT6iJ1SbJkWzDFAU7Hbh2eCdow2McN3GphqiI5sHxX+5CiBdpsU5cvmzD0oO3q5nVt41145pBNf992JMz5vWO6zwjvmMMDJGjHgkao+E1uwzCLs3guaIM8/UBJuxYlUNDt/i9NdGlMfrCOae4qwi0ustpXdCQ477Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864543; c=relaxed/simple;
	bh=P0naeDKs18PRc4JK0iPeu074AYU0v3jDpdpAb3Mc0Zo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sCdHG9ykEnClLuXRYJTNsvNhAJK80CvMy0+FkG7IBacbhbxojix+3/MByscu+XfSHcnbqMee/kT9jLapZ9VnM3i3O/sOBNXkKFU9rbBWs3JWaeGW7epNarD6+78lAy4PLwcD7msM7JOmVz57sNgxMguXun/1hD+X2XauMv3EspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 53H4ZbdU075302;
	Thu, 17 Apr 2025 12:35:37 +0800 (+08)
	(envelope-from Xuewen.Yan@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4ZdQ5m2JJ6z2K25fm;
	Thu, 17 Apr 2025 12:34:20 +0800 (CST)
Received: from BJ10918NBW01.spreadtrum.com (10.0.73.73) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 17 Apr 2025 12:35:33 +0800
From: Xuewen Yan <xuewen.yan@unisoc.com>
To: <vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
        <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>
CC: <rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
        <vschneid@redhat.com>, <hongyan.xia2@arm.com>,
        <linux-kernel@vger.kernel.org>, <ke.wang@unisoc.com>,
        <di.shen@unisoc.com>, <xuewen.yan94@gmail.com>,
        <kprateek.nayak@amd.com>, <kuyo.chang@mediatek.com>,
        <juju.sung@mediatek.com>, <qyousef@layalina.io>
Subject: [PATCH V3 2/2] sched/uclamp: Align uclamp and util_est and call before freq update
Date: Thu, 17 Apr 2025 12:34:57 +0800
Message-ID: <20250417043457.10632-3-xuewen.yan@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417043457.10632-1-xuewen.yan@unisoc.com>
References: <20250417043457.10632-1-xuewen.yan@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 53H4ZbdU075302

The commit dfa0a574cbc47 ("sched/uclamg: Handle delayed dequeue")
has add the sched_delayed check to prevent double uclamp_dec/inc.
However, it put the uclamp_rq_inc() after enqueue_task().
This may lead to the following issues:
When a task with uclamp goes through enqueue_task() and could trigger
cpufreq update, its uclamp won't even be considered in the cpufreq
update. It is only after enqueue will the uclamp be added to rq
buckets, and cpufreq will only pick it up at the next update.
This could cause a delay in frequency updating. It may affect
the performance(uclamp_min > 0) or power(uclamp_max < 1024).

So, just like util_est, put the uclamp_rq_inc() before enqueue_task().
And as for the sched_delayed_task, same as util_est, using the
sched_delayed flag to prevent inc the sched_delayed_task's uclamp,
using the ENQUEUE_DELAYED flag to allow inc the sched_delayed_task's uclamp
which is being woken up.

Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
---
v3:
- rework the commit message;
- remove the util_est change;
v2:
- simply the util-est's en/dequeue check;
---
 kernel/sched/core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..0f4ab0c17c58 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1752,7 +1752,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
 	}
 }
 
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
+static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
 {
 	enum uclamp_id clamp_id;
 
@@ -1768,7 +1768,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
 	if (unlikely(!p->sched_class->uclamp_enabled))
 		return;
 
-	if (p->se.sched_delayed)
+	/* Only inc the delayed task which being woken up. */
+	if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
 		return;
 
 	for_each_clamp_id(clamp_id)
@@ -2036,7 +2037,7 @@ static void __init init_uclamp(void)
 }
 
 #else /* !CONFIG_UCLAMP_TASK */
-static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) { }
+static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
@@ -2072,12 +2073,14 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (!(flags & ENQUEUE_NOCLOCK))
 		update_rq_clock(rq);
 
-	p->sched_class->enqueue_task(rq, p, flags);
 	/*
-	 * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
-	 * ->sched_delayed.
+	 * Can be before ->enqueue_task() because uclamp considers the
+	 * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
+	 * in ->enqueue_task().
 	 */
-	uclamp_rq_inc(rq, p);
+	uclamp_rq_inc(rq, p, flags);
+
+	p->sched_class->enqueue_task(rq, p, flags);
 
 	psi_enqueue(p, flags);
 
-- 
2.25.1

