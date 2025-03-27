Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B237515533F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089295; cv=none; b=q/Fa4aI5bEJlNIPFPAgSIE5BNcCDBfCqwIoBwK3ZCycutpfadnZ/NAuLFq1P+oQuSL4MoxuFqTGSKUb0SqIe/FsUlLaYiPfk9NneDlPb442whitZlYkqPMzxXiy4+EiV3tWRgCSpffvDpkzdcecsuMdT4dnVQJ9GsjFU5YtxPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089295; c=relaxed/simple;
	bh=YymQ6ahG80mrKgqfcbQAuESe/2/S69Lv/dfjPcGT7Ng=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IBGs4FRkbpxejfNaD2FH48kdT4knw371U2x1OvN7ZXVOV/ibgbRiqcnFDeydMMRb9gj2PsEeLAqS+DlS4bQSNN7zDCvpINn87rU8A/yFRr0/dbCByYbw5QnB6hn3SCdbowu340RvRWTT9CqxkHgY/nkkwKBGV5R15fGEy0ueKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8118C1063;
	Thu, 27 Mar 2025 08:28:11 -0700 (PDT)
Received: from e126645.arm.com (unknown [10.57.86.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D82B23F58B;
	Thu, 27 Mar 2025 08:28:02 -0700 (PDT)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Lukasz.Luba@arm.com,
	Chritian Loehle <christian.loehle@arm.com>,
	Hongyan Xia <hongyan.xia2@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: [PATCH] sched/fair: Check runnable signal to skip util_est updates
Date: Thu, 27 Mar 2025 16:27:51 +0100
Message-Id: <20250327152752.3677034-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 50181c0cff31 ("sched/pelt: Avoid underestimation of task
utilization")
allowed to skip decaying util_est to handle the case where the util_avg
signal of a task is decreased due to the presence of co-scheduled tasks.
In such case, a given task will receive less running time, lowering
its util_avg.

Checking the util_avg and runnable signals are within a certain margin
effectively means that a task received less CPU time that desired.
The margin represents 10 util (=1% * 1024). However there can be 2
different cases:
1.
The task is always running.
In that case, the util_avg value is capped by the relative load of the
CPU. E.g.: three 100% duty_cycle tasks will only reach a peak util_avg
of ~340.
2.
The task is not always running.
In that case, the util_avg value will grow slower and reach a lower
value than if there was no co-scheduled task. However, the util_avg
of the task is not capped.

This patch aims to only prevent util_est from decaying in the case 1.
Indeed, in the PELT computation, the last 4ms impact signals for
respectively:
1ms: 22, 2ms: 21, 3ms: 21, 4ms: 20
I.e. a co-scheduled task will create a delta between the runnable and
util_avg signals of 84 (=22 + 21 + 21 + 20) after not running during
4ms.
Thus, a delta of 10 between the runnable/util_avg signal the margin
- is easy to reach
- takes time to remove

A task is considered as always running when its runnable signal
reaches ~80% * 1024. The condition is arguable, but the current
condition is easily triggered and maintains an overestimation of the
size of tasks through util_est.

Running 5 iterations of speedometer 2.1 on a Pixel6, based on a 6.12
kernel:
Triggering the condition:
- Base condition: triggered ~47%
- New condition: triggered ~10%
Overutilized state:
- Base condition: OU state ~65% of the time
- New condition: triggered ~57% of the time
Energy (using energy counters):
- Base condition: 99884 +/- 936
- New condition: 98857 +/-1325
Score:
- Base condition: 204 +/- 1.5
- New condition: 201.5 +/-1.4

So the patch lowers the overutilzed state residency and reduces the
score. However, over-estimating tasks can only improve the score.
This patch doesn't solve the initial issue reported by Lukasz Luba at
[1], but another way to detect the initial issue should ideally be
used.

[1] https://lore.kernel.org/lkml/f1b1b663-3a12-9e5d-932b-b3ffb5f02e14@arm.com/

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 kernel/sched/fair.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6fab28c3360a..9f5509e3036f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4919,10 +4919,12 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
 		goto done;
 
 	/*
-	 * To avoid underestimate of task utilization, skip updates of EWMA if
-	 * we cannot grant that thread got all CPU time it wanted.
+	 * Prevent util_est from decaying when the task is considered as always
+	 * running, i.e. its runnable reaches 80% of the max. capacity. In that
+	 * case, co-scheduled tasks prevent util_avg to grow and reach its peak,
+	 * leading to a lower util_est.
 	 */
-	if ((dequeued + UTIL_EST_MARGIN) < task_runnable(p))
+	if (!fits_capacity(task_runnable(p), SCHED_CAPACITY_SCALE))
 		goto done;
 
 
-- 
2.25.1

