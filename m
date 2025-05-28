Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A602690D6
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419866; cv=none; b=su8oT//udXciO1iF2RN6JoFGFV9JeT42+SkAVJHM58pRmTLbd8Krb8jPDmcD2aIPOQQgOvdiL0MZ9OdA8BStTq4nDPktC/QWMF5/TTgvbc4csBz3yub+raWj7GeIbLq/a/X1X0LCgodWO9AsFQlgv5gl8HtHj4gS937Yrc2ZR+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419866; c=relaxed/simple;
	bh=j4zcNcSlSsYbTd3vaYS/4fsyrq1dVdZgtgW88vkwa6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJPhkgsKw4LV/KFe/E68cgEXMioDuMV32dGSKHvIYW4B1rdmEpU40TNh/AcSh/RLWUcNr/uK74owIqn3pOW+3CdvU7UaDbJdqbxT1UsbFN4tJ22YJ7LwwVnk9L1ydf2hAbO7zwfnOfcdKNh7v8JE+QoOJwnfOOkYxln3U8AZkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAbtIWv8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAbtIWv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E05BC4CEF0;
	Wed, 28 May 2025 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419866;
	bh=j4zcNcSlSsYbTd3vaYS/4fsyrq1dVdZgtgW88vkwa6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OAbtIWv8g+FA7UDxonQXuvBhhhr/yPReoX3FKiQARyX920jUbqx/T+NBo+/uttP85
	 sG0sCX0zHHxGOstxWzqeaw0faYqzWChET069iKUkYgIfZSnINNgpq7EonvAVewt2kX
	 bRhx0wZHIngRCAo1uFA6ZLw4FrPhiY7Vr8jopg9kWK9IKmt168JuJAVZVGfvdzkrQt
	 7Tfv4Wnattjh5jQGljmmpJDoSungm4JEeG56H0LmmULL2iygc1IPiWHmJZGizZC27I
	 kUD0D4Q8HVXj66CcJB9aOs7m+gnkma8OWNOsPEAtAEPaJd6n3ZMjiR67isH2rL8Oia
	 ViToytKFNJAUA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 22/43] sched/smp: Always define rq->hrtick_csd
Date: Wed, 28 May 2025 10:09:03 +0200
Message-ID: <20250528080924.2273858-23-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c  | 23 -----------------------
 kernel/sched/sched.h |  2 --
 2 files changed, 25 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8e5f728df3e0..73f035c21fbe 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -851,8 +851,6 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
 	return HRTIMER_NORESTART;
 }
 
-#ifdef CONFIG_SMP
-
 static void __hrtick_restart(struct rq *rq)
 {
 	struct hrtimer *timer = &rq->hrtick_timer;
@@ -897,30 +895,9 @@ void hrtick_start(struct rq *rq, u64 delay)
 		smp_call_function_single_async(cpu_of(rq), &rq->hrtick_csd);
 }
 
-#else /* !CONFIG_SMP: */
-/*
- * Called to set the hrtick timer state.
- *
- * called with rq->lock held and IRQs disabled
- */
-void hrtick_start(struct rq *rq, u64 delay)
-{
-	/*
-	 * Don't schedule slices shorter than 10000ns, that just
-	 * doesn't make sense. Rely on vruntime for fairness.
-	 */
-	delay = max_t(u64, delay, 10000LL);
-	hrtimer_start(&rq->hrtick_timer, ns_to_ktime(delay),
-		      HRTIMER_MODE_REL_PINNED_HARD);
-}
-
-#endif /* !CONFIG_SMP */
-
 static void hrtick_rq_init(struct rq *rq)
 {
-#ifdef CONFIG_SMP
 	INIT_CSD(&rq->hrtick_csd, __hrtick_start, rq);
-#endif
 	hrtimer_setup(&rq->hrtick_timer, hrtick, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 }
 #else /* !CONFIG_SCHED_HRTICK: */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index bb70bcc68e2b..de130ffa42b2 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1218,9 +1218,7 @@ struct rq {
 	long			calc_load_active;
 
 #ifdef CONFIG_SCHED_HRTICK
-#ifdef CONFIG_SMP
 	call_single_data_t	hrtick_csd;
-#endif
 	struct hrtimer		hrtick_timer;
 	ktime_t			hrtick_time;
 #endif
-- 
2.45.2

