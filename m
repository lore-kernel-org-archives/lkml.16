Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA96232379
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365506; cv=none; b=EzfL3Ef3ixn88G/hOuhvefHQtcM+OY6xtbJPDU0NoCkyeevzBQFLKjHWOOR6nHyg65TVI7ncPrrXYQeWomAeMaAtGkgQJhrH8rc33Pw0VYUTRaa4XiJoTcJ65BOunPE+rn8PXA6gefULo6C1aeMm7WDoNDyvAh0BRFlxjesobzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365506; c=relaxed/simple;
	bh=nwn1ip5sorAl7sIt+QYZoSsok9OqoFoZgbUd7Oruz9Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=URY50MIGi1eKTD0g1Xm9nPlqw3dOOPIpsNUjszNykAo4NyOnGoAI2mTrt7YK0RTlVH4s6RCz8irWWfThTdbBjPKfcNF252uQV+thwSyEgHH8B2uWTziHoQKAoI1gyLtbCPFMLphaHFxHQ30aw2vi3Cc0KlT3noVOf/iKdNYhyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=luyEFr7e; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="luyEFr7e"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b269789425bso1667946a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747365504; x=1747970304; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf4JRy2bBSRp1tqD9zq84E6PlIxIX+Ttn732q2H6HD8=;
        b=luyEFr7ee38R28xxTS/x1e14UTKVBHSF+jEYnomhCLsYutvQ3TT+5t4MlMQAyjDw5Y
         0fE8RIXIdxZ7nECDbA3RjCTXOgkspkRxkhbYnpSJ02JZhN/5d/I1OJU0tGpLb6McAYvv
         mkhKuEKWp+kAXKQ1C6ZLIrqqs0lqF55BF7AYMy25ZDWOX0PflObptNrPR9P2O0ryrUQU
         nbMVX8+TkZaY1uXnloklYCYNcyH41jCO4Y57OVAJpnXvnUrC2kx8diEQaBrQCiG0boiK
         UUbgJA6KcmvOgkTg1lwENfdDvGfNcaRhhNJkGJ14sgJ9DhItzwq3Vdq5ngypowrI9xoj
         2tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365504; x=1747970304;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf4JRy2bBSRp1tqD9zq84E6PlIxIX+Ttn732q2H6HD8=;
        b=gj5S5dWyAkEPFBnuGh5bsnXitNaJ05IcZc0i10faHnOCY3PppqHXQ5E7nwShwBXybw
         Iinh2mBHhdh+uW3A9rDcF9FO/qTV6of8qVAkWt6vQ/2mIK+h5u+hGgn3IqtFn0aOwn93
         LGBN23E/k+vDpIQzskTYV4rz4XKxohUn5I3BIBvDeAmkST8JSxdoKvxmTXE8BZ7cU6P6
         T1t1OpPdU07nsatqEvcaUaGqAsZfqwRlL/JRkf9gJfoRnyy2D5T2nXKviDV4Cct1TTmY
         NyafqbY78+XVA2isTFkZ0m5NAuW+6LJZAekT0Ubm8DT4ybdbrzh4x7XOgymrZbj7KVH2
         gOeA==
X-Gm-Message-State: AOJu0YyBFni1UJq7x4BXOqlKmboKgivHbsK5nBmKS2mPv0k3ddUyxiBy
	v2if9Ml9I/rec2bMCwYlNuW3gXr+5/weriGtm6J0/TAUEvGpiGcrLIS2Sae460F0b84NlnoUwm9
	Wmd0RvyMrlsweJpAXCtlopy8yPnJtuhlkH7pEu9CBx9uGoHaqXrtFCefe7re208LyIp5jDxTw2W
	IinYWQXY+Xc0sZU3t3GH0F4ZT6Rwe+F1/6it/2613PCJAF3tnt
X-Google-Smtp-Source: AGHT+IH8dj8X6VcOLI8/XvKa4wZ/fdV+YFmj5ecsN4a8ck4TQ6plRBpfykCsBUPpU49L318xBHADBfPzoH1v
X-Received: from pfam8.prod.google.com ([2002:aa7:8a08:0:b0:742:a008:3dcf])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9988:b0:1f5:80a3:b008
 with SMTP id adf61e73a8af0-216219b25c7mr2616517637.32.1747365503773; Thu, 15
 May 2025 20:18:23 -0700 (PDT)
Date: Fri, 16 May 2025 03:17:51 +0000
In-Reply-To: <20250516031814.1870508-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516031814.1870508-1-jstultz@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516031814.1870508-5-jstultz@google.com>
Subject: [PATCH v17 4/8] sched: Move update_curr_task logic into update_curr_se
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
2.49.0.1101.gccaa498523-goog

