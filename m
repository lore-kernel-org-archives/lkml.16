Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3F2DFF25
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883487; cv=none; b=JSkswwHnihwAqNFXFlvtRLCG++vaQ6MXxyPtaAPLAhXNa0zlkd0xqXwRQxxpacANQe9cE1K0LhFelYRzszHPKvMWS9EVJWH6gfeW81h5x9AQH62wtH1rR8q+ORYyO32BN+gK9YzuYDDhYlaUdJH1zzGNVOCpKuytQwVq5KRQ9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883487; c=relaxed/simple;
	bh=sOZ4t17AJ5iVPp4wVyz1H8xJqd/fbypdGdkeH5mDiiI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uwIZACTJFGtA2G3ToU4jsRM3PmzXgcxnBVxxO6cS/nur/mRllzKyryQyZWAeicylKtrS5TCYmAG4RQwW+Clt9TZXSpfPZiFKyZ2DcYOxbmHbwdVYg/5DkEsSJd07fXyiwZ/jvPsADzTuxvR/rFaU0kR3U39iTdQd2Y6N1wgPz3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K42HQz2o; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K42HQz2o"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c36951518so240107a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883485; x=1751488285; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPeymT7NIAooWQEri2B3P7iuuC6t76eak7WRt7BTTBs=;
        b=K42HQz2oqDl0fWq/vbA4gozzTJUdR74ThuC3FOFmmP2qwqPzqEkmEroShUaFhudJnF
         7M6HlYe6vo10FPOfREe4oxbahmNtbKX81ZGHrpqNqXsC7S1wSwOgGH0PF1FdM+f1phId
         gR8+XPPGSNzJcwTmzONqdvWbMxdaFf5iG83gYY0DmjeS2SJSBaWrUlnIxxb5rtPJE4aT
         lHK0EFVO/cxR/+gs9FRyo6dibTM7eo/gh/DdD3ux6qapXWcphfhviJXaUlC3p+jFQ/9E
         49q0Y+77Z7nNxL7XIvKC1jAs6X/p91NOzwlFJieopTi0P2jm8O9WwOl2LvSO6OoVMLcH
         0Qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883485; x=1751488285;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPeymT7NIAooWQEri2B3P7iuuC6t76eak7WRt7BTTBs=;
        b=QQZt5Zo280cqu2hsl7sxyPt2HhLXWW9N7VtgGPCWsOrICytRfJJW3jR1hAHEllTGgv
         5IHEzGTt/aylKKtv1C15hWvcelHUAKkaP/KYVS0t/uBwYnU0yWALaCPayaBVMiDPpDb9
         NNcAYh3CVE+4cXbcx3V1U/QXXtxMEa3qBwBxJD748P+pg8d4LWPgPb5rM/3i6+yMs6MY
         HzifPJy7MmvXqS9M6l/6tx60vp1d+smfgHmgs3ZvtnX9mIzcNMpAF3hGDcdt1DVOelWG
         wqrxaD2K+9s0Iw/+njcIvA4TaQRc0M/jWRYg+WDXSfybZcBnOXFnOGrrPDfplYOrQO3u
         tmjQ==
X-Gm-Message-State: AOJu0YwlDx37/orOZX6OW41bqQerkXSZHlmwNOqPJQlE5cIdLUD8Syzx
	zW0OJsIk1ggeFMeZuzrk3AAfD/4dq60fkgaqEb/dQQt5P53PUa/wOVMv4klNR5aIEaoHJmkJQWw
	xnvib3nOngIMv4MkVjvQPqaJm2zaU7NANxHVNFN2Nal3qxeWU1aqYVzZ8Z6B53z2ZwcRTR1Fx8r
	WyMkpW0ccPAJ9t6Zx7ZVjz5gStnDSq651FEVPOuwzPUnmWkW2f
X-Google-Smtp-Source: AGHT+IHWv7rw9xYClYLSpjznGzC3DSbsn/7oFCuojbsln+hYJ4FF6RN2RlQz5mNTrLiP9vNO64bcvauzZAdH
X-Received: from pgar3.prod.google.com ([2002:a05:6a02:2e83:b0:b31:d4af:e567])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2444:b0:1ee:e33d:f477
 with SMTP id adf61e73a8af0-2207f19c2d0mr8118560637.15.1750883485284; Wed, 25
 Jun 2025 13:31:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:30:58 +0000
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625203110.2299275-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-6-jstultz@google.com>
Subject: [PATCH v18 5/8] sched: Fix runtime accounting w/ split exec & sched contexts
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
	Suleiman Souhlal <suleiman@google.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
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
* Added comment calrifying cfs_rq->curr being rq->donor.se as
  suggested by Peter
* Reworked to fix issue Peter pointed out with thread group
  accounting being done on the donor, rather then the running
  execution context.
* Slight rewording of the commit message to further clairifiy
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
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 kernel/sched/fair.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index edcc7d59ecc3b..c34e0891193a7 100644
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
2.50.0.727.gbf7dc18ff4-goog

