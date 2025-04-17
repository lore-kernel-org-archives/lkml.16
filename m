Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895181ACEBE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864542; cv=none; b=RbrQy8qYUpwquVdqOZAtkIWfaQ1QhwY4zb8Ib7+LD3lVbfhAyMhzmB39RxKjFKficu8CPP6156QBHAhp8/sFAqvz8X9IFk+w9nrD2/LBDobb1HKVbYfYeqRzjoqGQsw9L5FhEiqfZN4LWX2NPlmYg+BcksXeyYSXz+JAj01HVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864542; c=relaxed/simple;
	bh=tP61bF0crTIs7tkEr4P6HXPSXJFNINEJ//g8KY7W2PI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtaGDi3mNtTsFqEvCKYhyTAhfJBX70koJuRILljpthb2n5eZ4EjySlxxr/6iCW191m8l3UcanHFLaeRWsYZwnGwl7zm4h2juNG/tQvqYF99ggCdKS9hTD7E0IvF6RxwcjOV5GfjOEAaG93ddRv7xCzRLVhLKaTUMuKCFh9biuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 53H4ZVwf074552;
	Thu, 17 Apr 2025 12:35:31 +0800 (+08)
	(envelope-from Xuewen.Yan@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4ZdQ5g4Cdgz2K25fm;
	Thu, 17 Apr 2025 12:34:15 +0800 (CST)
Received: from BJ10918NBW01.spreadtrum.com (10.0.73.73) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 17 Apr 2025 12:35:28 +0800
From: Xuewen Yan <xuewen.yan@unisoc.com>
To: <vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
        <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>
CC: <rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
        <vschneid@redhat.com>, <hongyan.xia2@arm.com>,
        <linux-kernel@vger.kernel.org>, <ke.wang@unisoc.com>,
        <di.shen@unisoc.com>, <xuewen.yan94@gmail.com>,
        <kprateek.nayak@amd.com>, <kuyo.chang@mediatek.com>,
        <juju.sung@mediatek.com>, <qyousef@layalina.io>
Subject: [PATCH V3 1/2] sched/util_est: Simply the condition for util_est_dequeue/enqueue
Date: Thu, 17 Apr 2025 12:34:56 +0800
Message-ID: <20250417043457.10632-2-xuewen.yan@unisoc.com>
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
X-MAIL:SHSQR01.spreadtrum.com 53H4ZVwf074552

To prevent double enqueue/dequeue of the util-est for sched_delayed tasks,
commit 729288bc6856 ("kernel/sched: Fix util_est accounting for DELAY_DEQUEUE")
added the corresponding check. This check excludes double en/dequeue during
task migration and priority changes.

In fact, these conditions can be simplified.

For util_est_dequeue, we know that sched_delayed flag is set in dequeue_entity.
When the task is sleeping, we need to call util_est_dequeue to subtract
util-est from the cfs_rq. At this point, sched_delayed has not yet been set.
If we find that sched_delayed is already set, it indicates that this task
has already called dequeue_task_fair once. In this case, there is no need to
call util_est_dequeue again. Therefore, simply checking the sched_delayed flag
should be sufficient to prevent unnecessary util_est updates during the dequeue.

For util_est_enqueue, our goal is to add the util_est to the cfs_rq
when task enqueue. However, we don't want to add the util_est of a
sched_delayed task to the cfs_rq because the task is sleeping.
Therefore, we can exclude the util_est_enqueue for sched_delayed tasks
by checking the sched_delayed flag. However, when waking up a delayed task,
the sched_delayed flag is cleared after util_est_enqueue. As a result,
if we only check the sched_delayed flag, we would miss the util_est_enqueue.
Since waking up a sched_delayed task calls enqueue_task with the ENQUEUE_DELAYED flag,
we can determine whether to call util_est_enqueue by checking if the
enqueue_flag contains ENQUEUE_DELAYED.

Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
---
v3:
- Separated from the previous patch.
- rework the commit message.
---
 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..18c85857bff0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6941,7 +6941,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	 * Let's add the task's estimated utilization to the cfs_rq's
 	 * estimated utilization, before we update schedutil.
 	 */
-	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & ENQUEUE_RESTORE))))
+	if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
 		util_est_enqueue(&rq->cfs, p);
 
 	if (flags & ENQUEUE_DELAYED) {
@@ -7183,7 +7183,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
  */
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 {
-	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
+	if (!p->se.sched_delayed)
 		util_est_dequeue(&rq->cfs, p);
 
 	util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);
-- 
2.25.1

