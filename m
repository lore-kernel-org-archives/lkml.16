Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8CB2DFA35
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883486; cv=none; b=KvlsdB0OCJPJpec8a99NqMhsFIzrqand1m8ML/7djyjbmCXOo3Je6XxxIHGHxUEoQfM5TGjPTwe2zL9WvQOrNNbZfl0k2aCAIjm26tjRTRhvdKEjomeM/Z/MJNY48jYEtFcBqMsPL2MZDjdZAxJoLy9HQiGMmjycgzQ3WG9pA58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883486; c=relaxed/simple;
	bh=nLZ/ViKh9mCSmL/QUFoTZ524l89j3+XT4qT6eKR2NHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CR5PLETLNZJcjKnzhOOtzbGOZHVTfKgY846l8tQDW9OHj2mdxo5soGYyiP2pfVe8vOsCsKaYWGCTR1Bh6w8R27yAP0WI3/dcTyjpMnD2IW/5xx/M4oyNMYZAXFva77W5HIvvtN9yLtn9JQmF5doMKCoKxRqlT/J7vyhLw0p5wlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PyzaRGm+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PyzaRGm+"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso293686a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750883484; x=1751488284; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWMZEwaLzB4ZLAXRICQvTxcHO4sAmAm0N54ZCGAyYPs=;
        b=PyzaRGm+QBDX76TZmNSgaY6a30iD59r82MQrFwjfkiWb8nUwCnWkAMZ/pAJhKvN+W+
         3PNC1gs8Q7+nCwWaCv8DqJwBrMzdkHZW0Y0Xl96MECbabiX3C2fk2DKGRIBrisVAu14t
         54hvK4TAbCJvC5lq7YG5K4Uam3uqdh7/kxC5hOUs4zp0pP+jAQwv0flR0IXMTzKz4QfL
         2GY+VtsuuqjgpajTcGVQ6+dzBYgS1eOxqHYLUlWNHrBIZVBXF3cLe9mRQl/ckldE4P+y
         +YWqCo1pPJy6kJSQKg0R9LDkEnT7+L1yjAbd7Em3EZkY/sDkrh93Kkrq2inkEf0nUOYP
         4kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750883484; x=1751488284;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWMZEwaLzB4ZLAXRICQvTxcHO4sAmAm0N54ZCGAyYPs=;
        b=hlux4hpmGl7+hdE5w1vR3M69d5w8kb0DpHfDoyIz0P9c0FlVeSvzUllfGcW+FPJSCY
         IQ10GfgEphEDEWzlNNckrotXKeLb/xPYmY2eWVm+XNpYAYu85Ki+GZxrW9U+/TXq9vxp
         j0Z9hHN4PuydKu9a4Cm5UzSW/kgg6ycFIcUScIx2nSBkDl8V9Wb42Yvxcrr70H67lfv1
         ZpcHqb/CHbWVMJBsskdHC2cnF8ZGD7XdgMwtuqC+zK5zxIxxU5RxtZZ4pj1L3NpnX2j3
         okikOWHlHnQlnv0WheSY4EwFWqgksQO1gaxUWQblNa6DJPVjA+3rVkXBMSE/ksq8KehW
         PvBg==
X-Gm-Message-State: AOJu0YzT5juEu6k4NVfd4O3LAQ1vrkwGbIoh/1ZpVMENS3tV84IXMy+p
	4AHZowA0Ua6TjV3yBorZnBpe5iXrtDEnvcnp6CnxPXkGQZVlzf/jIL2bhmGIpZyHwLqMqHn45JE
	c+5Y1pY+SS8Q8vJ5wsX3Aks/Lbdu/oyMmZl19I4T4NVrhiG5niYTHIFOTRuPGlgvT41wiaoxb2z
	/t95ya9FsKDVugmYIGum8OHkYsF4Suw/NnsigTi1UYE1Kca6GB
X-Google-Smtp-Source: AGHT+IF+V1NliafRtG0Qu5AbXO5KkZeLJZHhGeYYmtoo+Ilo+hYYd6k76OF3fjQfn6z52FmBUmPy2RU6z28w
X-Received: from pjbdy12.prod.google.com ([2002:a17:90b:6cc:b0:311:462d:cb60])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c5:b0:312:1508:fb4e
 with SMTP id 98e67ed59e1d1-315f2675bbbmr6780975a91.17.1750883483656; Wed, 25
 Jun 2025 13:31:23 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:30:57 +0000
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625203110.2299275-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250625203110.2299275-5-jstultz@google.com>
Subject: [PATCH v18 4/8] sched: Move update_curr_task logic into update_curr_se
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
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 kernel/sched/fair.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb2..edcc7d59ecc3b 100644
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
2.50.0.727.gbf7dc18ff4-goog

