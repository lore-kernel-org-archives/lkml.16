Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA2C19340B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744437794; cv=none; b=n7XSkqjityeMsdOIkpDtfsoa8lMPBEncVrG1zDs1B9JOcTZYXPddMxfJ6rwnynlVGpFmHvWAIprfvvj2eS6OalVp6LUox75/hMAjcpFcCxs5qXjcl6a3hdWqxTouJrFSETgMm5EuYUDdnds4rwmGw2S04O3T4gzYW7sQ5YK/760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744437794; c=relaxed/simple;
	bh=AHid+QPjfDxgq+hMgC8goRPXMc3XuzmK7Kqu5KDAZDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tao9xn93QJLdNVH8yZHwkyONiG11h/S/DW53zr+BR5NtVXHOhxmRemKSMfTnSbjzgnwvWkm15WAAyxE6+jeOTz3CsQho72vOmv9ctMlmbJ+A52a92oES4TpYUJOxYB2S1Se13Ya1m2gcrs/eapli/IsW9AlwSKLS7kK+W48jhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OIASH/WM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OIASH/WM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so3847030a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744437792; x=1745042592; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0eSoKWtXz3jskMowbEvQ6wXhZ8nL/54iGlts/Saw/g=;
        b=OIASH/WMMxBba1pBp6DZ67QreaHv6rBcX2b6N3HiNCFaGIh62Za30Q0U6e3YDVcfLK
         tUuWFEdge100yHxe83x47h38BqbE80hNqrn0bFrVTVl/xljFGhP5n+83ZfKfg5Yhl6LX
         3nbj9kzxoMZNcRqZ4WlmXuKRHrZmk3iVKVbppdUIDwG3hC3JO4oXVJobo1JR9hQ5lMkI
         EFo78VcGxrhnVtfd6DWAY62w5sFSDa1mVx9/+R7gvBKZvEMspGF7Jew82ouRpyUtaOBB
         sgopMzSCGr8MdgjDw7wZsPMzlgRVrVgxgjBW+2U9OEfW6MMxUQ2yOCzv8elPIPXrsf4n
         vicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744437792; x=1745042592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0eSoKWtXz3jskMowbEvQ6wXhZ8nL/54iGlts/Saw/g=;
        b=cb6egWm5BhyWIB49e2uCmuwYsi+UR02FmmLbJyBQjdI8Ucz0ZPqy20d4ffWyA+35Cn
         bGpXRWyTRyrLvkRRZzFeaxdZ7BMNCB7rHTPEvqMCD+Lmz5nycy+VbRw4BuAdF/LV3ehX
         r+e/QBVWdA6j+VlXAKuzqRFVLb58W+43LQ/8KmivbLpnakcv0CsW9tn7ecYc/bMPoix1
         BJUNLFYlszB1heijDMR79dHR/nELZBYk9F5Q3MclnOq1LBgNQT7iaX4A8spIwSYuOBmU
         xNe/SNMEYG9U5UPM6OO3Scf0xWqwxzxSSec917NcHzqYjTX/NbgAwg5w6JbOMG3LDFu4
         YoNQ==
X-Gm-Message-State: AOJu0YwZJriWdzJPHoAs7YVUao8RGWuy8fPExCDs3gtlCMpi1cbFeuV0
	CzZcNvEYtczWd/2m9ILjGOMkwpGaerrARjMphzegVt+8oztruliFGMwGcm2bs1xoxXU8s87D9DZ
	jq+db42WDyWYl93XB6csFhEUxFgsR/Gb5g4ro8626kT3j0Jrga7osb/elc91zZk9omcIkLOnISJ
	nKTt1Dclpe/mcQuJhYbZzZboXU5fyqd5/PmHn28YRKCuw+
X-Google-Smtp-Source: AGHT+IEDg48TYHOpe+SUZJtRPXZlETeKa5NztvclyjfQ4aNai/S5HHcRMb3CbvBn9wi5Q/ED+dYCvmdmXXWl
X-Received: from pji12.prod.google.com ([2002:a17:90b:3fcc:b0:2fc:2ee0:d38a])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5206:b0:305:2d27:7ca7
 with SMTP id 98e67ed59e1d1-308236523femr9436973a91.16.1744437792452; Fri, 11
 Apr 2025 23:03:12 -0700 (PDT)
Date: Fri, 11 Apr 2025 23:02:38 -0700
In-Reply-To: <20250412060258.3844594-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412060258.3844594-5-jstultz@google.com>
Subject: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec & sched contexts
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Without proxy-exec, we normally charge the "current" task for
both its vruntime as well as its sum_exec_runtime.

With proxy, however, we have two "current" contexts: the
scheduler context and the execution context. We want to charge
the execution context rq->curr (ie: proxy/lock holder) execution
time to its sum_exec_runtime (so it's clear to userland the
rq->curr task *is* running).

Then instead of charging the execution context (rq->curr) for
the vruntime, we charge the vruntime against the scheduler context
(rq->donor) task, because that is the time it is donating when
it is used as the scheduler-context.

If the donor and curr tasks are the same, then it's the same as
without proxy.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kernel-team@android.com
Signed-off-by: John Stultz <jstultz@google.com>
---
v16:
* Renamed update_curr_se to update_se_times, as suggested by
  Steven Rostedt.
* Reworded the commit message as suggested by Steven Rostedt
---
 kernel/sched/fair.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e5807..da8b0970c6655 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1143,22 +1143,33 @@ static void update_tg_load_avg(struct cfs_rq *cfs_rq)
 }
 #endif /* CONFIG_SMP */
 
-static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
+static s64 update_se_times(struct rq *rq, struct sched_entity *se)
 {
 	u64 now = rq_clock_task(rq);
 	s64 delta_exec;
 
-	delta_exec = now - curr->exec_start;
+	delta_exec = now - se->exec_start;
 	if (unlikely(delta_exec <= 0))
 		return delta_exec;
 
-	curr->exec_start = now;
-	curr->sum_exec_runtime += delta_exec;
+	se->exec_start = now;
+	if (entity_is_task(se)) {
+		struct task_struct *running = rq->curr;
+		/*
+		 * If se is a task, we account the time against the running
+		 * task, as w/ proxy-exec they may not be the same.
+		 */
+		running->se.exec_start = now;
+		running->se.sum_exec_runtime += delta_exec;
+	} else {
+		/* If not task, account the time against se */
+		se->sum_exec_runtime += delta_exec;
+	}
 
 	if (schedstat_enabled()) {
 		struct sched_statistics *stats;
 
-		stats = __schedstats_from_se(curr);
+		stats = __schedstats_from_se(se);
 		__schedstat_set(stats->exec_max,
 				max(delta_exec, stats->exec_max));
 	}
@@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
 	struct task_struct *donor = rq->donor;
 	s64 delta_exec;
 
-	delta_exec = update_curr_se(rq, &donor->se);
+	delta_exec = update_se_times(rq, &donor->se);
 	if (likely(delta_exec > 0))
 		update_curr_task(donor, delta_exec);
 
@@ -1233,7 +1244,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
 	if (unlikely(!curr))
 		return;
 
-	delta_exec = update_curr_se(rq, curr);
+	delta_exec = update_se_times(rq, curr);
 	if (unlikely(delta_exec <= 0))
 		return;
 
-- 
2.49.0.604.gff1f9ca942-goog

