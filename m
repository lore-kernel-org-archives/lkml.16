Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B73253F1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902217; cv=none; b=XZ6TjhZ81VVc+PVF4LxLUL4pFG6HmaJVojEaop2pYWBqICOQ5sQ7WxOqtvB4e8zBHF5lweDzX+Xd/AvUKE51aWdojzYZzveiKjm86rYe5BkyFT+pvZjxgNUjyMd2ZPrUAaAgN3P8q6/9TVOvvaOdufQAQ++r5iIZRWvu32/bZ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902217; c=relaxed/simple;
	bh=NCUrEGi2u1oCtkJO4Dp4w852bBBi4EAOIH6ah3MsQy8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Agn2qNDCm8TyxrAm0knZ1b1m+r8I4D2bUQvzFTTPal6QRH7uTCvUTdlSPgWd3aAyBZQHeVuXES7p0m+Kw0u9bwyv6T70rpkj9OPyNvYARcAk+PYzlLOqxBaugr+I3NWDkbogz9vj7uuYgsPZ2emLFLmKcDHSw5Fzw7woHQ1/biE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hkGq6AxE; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hkGq6AxE"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a969a4d0so4186068b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902215; x=1749507015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aRsxl7DlHgjIL8w0jjEFHtbm0Ysvj4vLREqaVlUkTVI=;
        b=hkGq6AxEAMSN40dxyvVB/4gRdPPkq/kKheqt14yXjJ7H8P6iacFPA99bF1iKrVbAo5
         JMEPWEVu/imp4+cSd6N6c3x39cY7z+VZjyrzUeyZ372MagVHaTGfJ4czossC2ENQLW88
         CNHZBYIny6xFJx+gz+FAhABIS7P1AYnJGny8ZyQV7l8oPTbVNK47nf9yKJJo+yVMaKDx
         vrWncGUYOKUpWFL8d/y3gouUah5fNUnrr3xmd8Mt7zLiloXd4JCVHS7nG0kPkYNR1gya
         mz2tPkvRU+KF78B5+wkccOGqzs3ONypTZE4OXwQZUISf7RVwNHc0t8sqPyc+FX01E/1D
         /ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902215; x=1749507015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRsxl7DlHgjIL8w0jjEFHtbm0Ysvj4vLREqaVlUkTVI=;
        b=jI3qMYj/Z+Usdib3+dZh6fADM1Re7kNCQPKn/bp9w/Tm7Gip5vHsLmzZ84hSvpwfI1
         LcKwsN6Yev4yQFezApbm7G1QDrtsRMtk+v8clczXZcCbH/HSD3GUuONSeW5560VM5Lxq
         1meSnQ2AfVvgrfyX+r2llpD9B0qPh+LVjAMNFQzT6+buu+3dNLUYiWNKp7Iy+RX0wKAQ
         +MDj2B1pBg0+gJMcmuuRYmMSSRlrQabdTPt4xDyVl6YoGmRFLRMj59mqQfTUBJup7V98
         Tb8xI73Eb72HJRIUpK4tG3fiI+cuQ05dViHp90vzlvgrEN4i0EKllKBscjiQ7MwMu9Am
         jbyw==
X-Gm-Message-State: AOJu0YzoGBsuSXQ8M7kFbZrJplp3ZUwNtFuIBGsD2E2pu2xF+YNHj+5s
	etfc++yQblLO0g6L/+sMt97B3W7xkskL33d/TkeaY98bVibLaMmum0b3fIuFbs5KSFdj6aVCGa5
	uIJdtzkrIxFVFKLINWNbTYVcyveV74FikHnqyP0sNdmtZqWNImMJ2PPC329vVUVU7VgC2PaMdTx
	0ZWTp1cAy2zRx4FG0aGHfFkH6lXcTIbjas6DHeDf5ROqPiUwB7
X-Google-Smtp-Source: AGHT+IECcwqQM+pz0Wes8Q07zDBNdCv+B1A1XXND7lHfcn0z8ifCeU5Rb3jYjmB3a8HAYDk27d+RUXD1SSTu
X-Received: from pfve14.prod.google.com ([2002:a05:6a00:1a8e:b0:73c:6d5:ce4c])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:807:b0:742:9fea:a2d1
 with SMTP id d2e1a72fcca58-747d1ae28e5mr12030036b3a.23.1748902214703; Mon, 02
 Jun 2025 15:10:14 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:52 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-6-jstultz@google.com>
Subject: [RESEND][PATCH v17 5/8] sched: Fix runtime accounting w/ split exec &
 sched contexts
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
2.49.0.1204.g71687c7c1d-goog

