Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D12356D2
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365508; cv=none; b=DOGxVdfvXq4OfkKOzX0WGiGm+WNG0sjHT0F0oMXtg9lDM0n+YRPIHVJFRSgjot0Wl/Cdn2B/okWGSHGMzZsBmp5LZr40GvCocYMaY99OqfUaSmmENYafiLcCqdSywOWYtWl7H8TFjf1AqwbkoEaKbNvXxjm2vJNK4xSiVUZuJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365508; c=relaxed/simple;
	bh=mRXBUHnDx0/t6Bfnn0zl3DL5OXDP9kfEF+cehND5bv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MQVitoDfhJGODsL9TeE/jtT4exQTn1E3LSMX2lYg/NeVFrXs7Lcy64Awlz0RDjRzyq1KmgcDEueLKNAa4n8XmG9OIxtuqcsAcnGLMMY79ZLY+wFTzYzs8U7iJubwDncQPbKSjT9NXs9Acq4NaBEojT7NepdTuP5cR8FKj5/B+fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPNKZnMN; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPNKZnMN"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742849f4155so1469831b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747365506; x=1747970306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1QgT4LnfzrEFIEGUXEfdu21sHY2qV5OB8KMqKol4sM=;
        b=lPNKZnMNW6SJ25jO8hqRkTbSF5t8ObqWGeJFxnMzOS7Jn19hCJlIl5iTf800zEqEGJ
         zfoHQVRNWb4qnOD1eThr59vIWID6soKlzikisBtYTA0rHdfsYudNp/L9quTROz8WxDRD
         mz7Q9FoNXkGm9yn6jCEgiGxqK8wyFRjmTEvfRy1JVf6r5nQB0o3uN5Evd1taOXcTCJtm
         lNuosDFyymjEQK2dCED8FKKRX1EynvN/zmYQau+CVWcWcJ4GFZzoRC4FLZO7jBgRbxKj
         1sVnPD8Drky7ra4AMT+pYcfR1+4pdWrbP/CNhTUWpiPkARTFV2y65Wll2i/YghaycIoB
         l2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365506; x=1747970306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1QgT4LnfzrEFIEGUXEfdu21sHY2qV5OB8KMqKol4sM=;
        b=PcwPXxpvdIzyvIsv478V63LwQgRDV05Z9ZV5p6KSLcqw+4rOVccJlYIsnkrJ3kyYlg
         umASaOiKLW/mSrIOpu2R4Z9/x0ONDvj+9olQincLOo/1+q+PeK6rXXHDU0A+agYVpixP
         wnr0uVL6fFQcVtB7KWzLVo4VNDHv9qpOUt4yhVArgt6xefq00wOIMCASVlurkajoHDaz
         j+Yk6WEQjP8DUlpWP0Mtdq7AsapqbZ+dBmnPr1i0+3j6XMd+SIxJv8GS2JKYAUBuv1gf
         VVxpOzNQFKftW5RL8T6tKkTlenrXFj/qgV2SzyVIwuKjUQerJmctbu3gs+wBNk9fQCHd
         KTOg==
X-Gm-Message-State: AOJu0YzmSxl3g7/HTD0ZNMCZ59/WqvkyOJ8MwhmVhnCZEDLr3ASxBeO2
	Dlsf1UmH4E+Bi5vHgV5soy6BejgxMr96uhtZoHKZOtB72zw+bZU4HEEyHDglAUB2KcJrQsdFoaD
	VmvPIyIhas+TmpyrZPgmKMxqwEYkIjT0in44+0aJYky4G0vc8tBeMGcoQ7ORdknbBOoSvSHkAPa
	/4EWMARu4bPcRiySk6AGhV2l6NBZuHY4knntb0PxgeCjf0a3j9
X-Google-Smtp-Source: AGHT+IH39qqGebTeIq3leQiHJN/ljf+IuKMz/xzN4aG5uGk3aXaPrXTA+w3JxltRl489a7SdOKQvAJCmXOq+
X-Received: from pfbjt25.prod.google.com ([2002:a05:6a00:91d9:b0:736:b19c:1478])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3391:b0:736:5969:2b6f
 with SMTP id d2e1a72fcca58-742a9a2b439mr1729173b3a.6.1747365505393; Thu, 15
 May 2025 20:18:25 -0700 (PDT)
Date: Fri, 16 May 2025 03:17:52 +0000
In-Reply-To: <20250516031814.1870508-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516031814.1870508-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516031814.1870508-6-jstultz@google.com>
Subject: [PATCH v17 5/8] sched: Fix runtime accounting w/ split exec & sched contexts
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
rq->curr task *is* running), as well as its thread group.

However the rest of the time accounting (such a vruntime and
cgroup accounting), we charge against the scheduler context
(rq->donor) task, because it is from that task that the time
is being "donated".

If the donor and curr tasks are the same, then it's the same as
without proxy.

Signed-off-by: John Stultz <jstultz@google.com>
---
v16:
* Renamed update_curr_se to update_se_times, as suggested by
  Steven Rostedt.
* Reworded the commit message as suggested by Steven Rostedt
v17:
* Renamed update_se_times to update_se, as suggested by Peter
* Added comment clarifying cfs_rq->curr being rq->donor.se as
  suggested by Peter
* Reworked to fix issue Peter pointed out with thread group
  accounting being done on the donor, rather than the running
  execution context.
* Slight rewording of the commit message to further clarify
  things.

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
---
 kernel/sched/fair.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8d067168185f4..1fd4c78314d6e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1143,30 +1143,40 @@ static void update_tg_load_avg(struct cfs_rq *cfs_rq)
 }
 #endif /* CONFIG_SMP */
 
-static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
+static s64 update_se(struct rq *rq, struct sched_entity *se)
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
+		struct task_struct *donor = task_of(se);
+		struct task_struct *running = rq->curr;
+		/*
+		 * If se is a task, we account the time against the running
+		 * task, as w/ proxy-exec they may not be the same.
+		 */
+		running->se.exec_start = now;
+		running->se.sum_exec_runtime += delta_exec;
 
-	if (entity_is_task(curr)) {
-		struct task_struct *p = task_of(curr);
+		trace_sched_stat_runtime(running, delta_exec);
+		account_group_exec_runtime(running, delta_exec);
 
-		trace_sched_stat_runtime(p, delta_exec);
-		account_group_exec_runtime(p, delta_exec);
-		cgroup_account_cputime(p, delta_exec);
+		/* cgroup time is always accounted against the donor */
+		cgroup_account_cputime(donor, delta_exec);
+	} else {
+		/* If not task, account the time against donor se  */
+		se->sum_exec_runtime += delta_exec;
 	}
 
 	if (schedstat_enabled()) {
 		struct sched_statistics *stats;
 
-		stats = __schedstats_from_se(curr);
+		stats = __schedstats_from_se(se);
 		__schedstat_set(stats->exec_max,
 				max(delta_exec, stats->exec_max));
 	}
@@ -1213,7 +1223,7 @@ s64 update_curr_common(struct rq *rq)
 {
 	struct task_struct *donor = rq->donor;
 
-	return update_curr_se(rq, &donor->se);
+	return update_se(rq, &donor->se);
 }
 
 /*
@@ -1221,6 +1231,12 @@ s64 update_curr_common(struct rq *rq)
  */
 static void update_curr(struct cfs_rq *cfs_rq)
 {
+	/*
+	 * Note: cfs_rq->curr corresponds to the task picked to
+	 * run (ie: rq->donor.se) which due to proxy-exec may
+	 * not necessarily be the actual task running
+	 * (rq->curr.se). This is easy to confuse!
+	 */
 	struct sched_entity *curr = cfs_rq->curr;
 	struct rq *rq = rq_of(cfs_rq);
 	s64 delta_exec;
@@ -1229,7 +1245,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
 	if (unlikely(!curr))
 		return;
 
-	delta_exec = update_curr_se(rq, curr);
+	delta_exec = update_se(rq, curr);
 	if (unlikely(delta_exec <= 0))
 		return;
 
-- 
2.49.0.1101.gccaa498523-goog

