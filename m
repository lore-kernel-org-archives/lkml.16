Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83A25393D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902215; cv=none; b=RgAC5whlJloLjncRhFFSUHQ6kung4RmcgkVpM2Fblj44+jD7MQPd/R6iSf3K71YfiTftEyS78+eajkPzKT8Hnn6lWXsMrizZykmtgSC6DZETg2sHegYceWg8SFsDVjjoSHxDro2873nGNp0w1LtfLhOrfLB/srIGEpl8wAliMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902215; c=relaxed/simple;
	bh=Xuha6ehtfjg1YtPwETlzII/2HV7SQ0sBfZI7PgOCKVU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WFhO25AtG6ou7AQddHyJ3Gy7KzwBUzPYCbHtLmq579XEWNg3isS6KtnIW2XlygI259bN07hY5ruTvNiEl1o5Q5bn/ZRqiCe2TlmjeZAQbVFIAw0UDcjCLObp4emRjzBz8qKGCq8k5Sx4EGnzW/mVrYN1gp5X2VzbBigVpRrpJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zTeNT6z4; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zTeNT6z4"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311c5d9307eso5756769a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748902213; x=1749507013; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5sZ5DDlYPoP9+KX+1Wg17vVbFiaes9b+IQ4ff8OE6A=;
        b=zTeNT6z4gyKFTbr+nazS5nP0VoILkCgylJ1/mZMkMyeN4VaaYNSoQIgLl7YM09qVId
         OxXj0M8MsGxjwhpVFjVQvLQGI0mL7hYnN6FvCH5/pJ+4NQNVwjAxQvetXLarxb9tQGg9
         UNgqfmqyO98sH1GQD2z+1l7WNiDlEWPXK8iJZ/oyAC2YKwL4U5eB9IgVSIOI2J+k8mkm
         Hp1fUrxERLoDCCJibtxQjocQxmel3xsi3OQ5EsnjXKbxyUi/dilKrd/nYRw1jMsLl6FH
         OkhrAS0eeNWBHU3Bwu3u86IqGjpOQ5kEZZNR/LQKNbhHKcP4bwkfbV4XNHWEr+AWDmY2
         83gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902213; x=1749507013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5sZ5DDlYPoP9+KX+1Wg17vVbFiaes9b+IQ4ff8OE6A=;
        b=PEOYmANv9lQC3bYBxHcNg+lQb8pnA0BRHKPqww3Pl66YD12/Ae37vn669+X3Z+L/hr
         rZRr+402zO3nAUeUJURZW9nnfRxAPZn0jufClT4bw/wJradcE0zAl4Kb+CFbvM6LUM4X
         t9b1hBZc1wN9XjLbrt20rQyISq+xDuHoN7z5xxjy9VaKdk5+gTbXhtwKkrVUij8kBLO5
         iNYIMxOqDpVh0jCEl60Lq4Td8xkU8hSA+ecvkFp2EYQdRrHxICvpVIKhWO/rDFemWzd2
         DYlaASBzs6XdxBhDlX0X+A1eCtxNDYeLF4vtj3phELLTh2k+zDmkOcSu04XhPf3DVxnY
         W5tA==
X-Gm-Message-State: AOJu0YykQ5iK4P2qeH36Go/TweiWX3ObkXRbEooRCb+behmC57w0rQCJ
	y7YPeEUxXkgU2m26bCn2GkGEgvD2D5YsUlQinmwhpV2F3VZNppIKU1Y7TqRhypE1Hub233GXnYH
	pjvX3zMYLsQkiPXExu7KJmuWv2Jv35s/BWGi+RpWOnUADZtJra+KuRVlZ+9tmybEbHu6cWcBsqW
	bZgx5ZgyRHuKi40u2DKyveeXw4YzNIaUZXy2Xgt/FfkzMTUadV
X-Google-Smtp-Source: AGHT+IH2fkYqH6qG0prUn7l082W/tI6Mtl0s54sm8bUBBRGcc1L1Op7gfUSvX2gKjFvLTcC0MyT2dKBcLrIB
X-Received: from pjbpm11.prod.google.com ([2002:a17:90b:3c4b:b0:311:3fe:710a])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48c7:b0:312:959:dc41
 with SMTP id 98e67ed59e1d1-3127c8521cbmr15254230a91.27.1748902213224; Mon, 02
 Jun 2025 15:10:13 -0700 (PDT)
Date: Mon,  2 Jun 2025 22:09:51 +0000
In-Reply-To: <20250602221004.3837674-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602221004.3837674-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602221004.3837674-5-jstultz@google.com>
Subject: [RESEND][PATCH v17 4/8] sched: Move update_curr_task logic into update_curr_se
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

Absorb update_curr_task() into update_curr_se(), and
in the process simplify update_curr_common().

This will make the next step a bit easier.

Signed-off-by: John Stultz <jstultz@google.com>
---
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
 kernel/sched/fair.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a479..8d067168185f4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1155,6 +1155,14 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
 	curr->exec_start = now;
 	curr->sum_exec_runtime += delta_exec;
 
+	if (entity_is_task(curr)) {
+		struct task_struct *p = task_of(curr);
+
+		trace_sched_stat_runtime(p, delta_exec);
+		account_group_exec_runtime(p, delta_exec);
+		cgroup_account_cputime(p, delta_exec);
+	}
+
 	if (schedstat_enabled()) {
 		struct sched_statistics *stats;
 
@@ -1166,13 +1174,6 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
 	return delta_exec;
 }
 
-static inline void update_curr_task(struct task_struct *p, s64 delta_exec)
-{
-	trace_sched_stat_runtime(p, delta_exec);
-	account_group_exec_runtime(p, delta_exec);
-	cgroup_account_cputime(p, delta_exec);
-}
-
 static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched_entity *curr)
 {
 	if (!sched_feat(PREEMPT_SHORT))
@@ -1211,13 +1212,8 @@ static inline bool do_preempt_short(struct cfs_rq *cfs_rq,
 s64 update_curr_common(struct rq *rq)
 {
 	struct task_struct *donor = rq->donor;
-	s64 delta_exec;
 
-	delta_exec = update_curr_se(rq, &donor->se);
-	if (likely(delta_exec > 0))
-		update_curr_task(donor, delta_exec);
-
-	return delta_exec;
+	return update_curr_se(rq, &donor->se);
 }
 
 /*
@@ -1242,10 +1238,6 @@ static void update_curr(struct cfs_rq *cfs_rq)
 	update_min_vruntime(cfs_rq);
 
 	if (entity_is_task(curr)) {
-		struct task_struct *p = task_of(curr);
-
-		update_curr_task(p, delta_exec);
-
 		/*
 		 * If the fair_server is active, we need to account for the
 		 * fair_server time whether or not the task is running on
-- 
2.49.0.1204.g71687c7c1d-goog

