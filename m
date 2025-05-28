Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2997256C9E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419823; cv=none; b=SL7vjJZ/jR5xwIudq6AIqGy6KtlnRHdDe2oH/o3ReXoIvF/rSZ9LQA0qfDca7kHiX2boZ7Mluv5YRRJuTaDAQWT9t1nGoeue5RuX3NjBYfjYriSY0yKUEi+/nx0nlFbYmp/iIt7wfxldrIamE4tZPeJd59oYWVTq9+xdleY8nyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419823; c=relaxed/simple;
	bh=iW2wp64UhYj72B17BJT/RjglonE4/PkPrYzggByrwHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7LnhjwDEoE+apX5HHM2Q9RXjOIFxe/hLHwfPELRsM7/5cc7CRf1IaFXoadHYKXGnbFQwpZ5mKDYh+76G8VNwY/dEOr41ljZKVlaV0gFvq3iBTQDvxwEG3J+4Dli3hCmIY6RBoYqPGE59heV+2xXlPJ2KUqcb8n2TeMhaUEm6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiP70I7S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiP70I7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C6EC4CEEF;
	Wed, 28 May 2025 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419823;
	bh=iW2wp64UhYj72B17BJT/RjglonE4/PkPrYzggByrwHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MiP70I7S0UmS6XnSZZPzgIlLQWbHvAKff3nNFSKBMQ5UeD926ebRqs6W76mQikekH
	 rx+6hBZu6uKQ+CKAHePuldY4AJItLW5dM/zCeeSQC3dCbWj9o+4xVlwa4daRKn6W9+
	 qE8YYT6mqH1a15Gd4zuTVjS5rfdEiTqWZoNfbatz9R+miHzHZIjBP2SGb5A+40stmM
	 2+m/JsGjmVGGAm26DOHa/M3ENf6xChT/L2wCvorKQJSbls4Sd1hkpBaNZPT1wO11bB
	 kUPJj/IoaJ7sMZe3E/E3X0KklT4GGOs64PTmKvAfOBM0hBFyE3EheglcPx4iHwBWRz
	 WQ6q+8K9SVXAw==
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
Subject: [PATCH 10/43] sched: Clean up and standardize #if/#else/#endif markers in sched/idle.c
Date: Wed, 28 May 2025 10:08:51 +0200
Message-ID: <20250528080924.2273858-11-mingo@kernel.org>
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

 - Use the standard #ifdef marker format for larger blocks,
   where appropriate:

        #if CONFIG_FOO
        ...
        #else /* !CONFIG_FOO: */
        ...
        #endif /* !CONFIG_FOO */

 - Fix whitespace noise and other inconsistencies.

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
 kernel/sched/idle.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 2c85c86b455f..cb01b063d733 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -47,7 +47,7 @@ static int __init cpu_idle_nopoll_setup(char *__unused)
 	return 1;
 }
 __setup("hlt", cpu_idle_nopoll_setup);
-#endif
+#endif /* CONFIG_GENERIC_IDLE_POLL_SETUP */
 
 static noinline int __cpuidle cpu_idle_poll(void)
 {
@@ -95,10 +95,10 @@ static inline void cond_tick_broadcast_exit(void)
 	if (static_branch_unlikely(&arch_needs_tick_broadcast))
 		tick_broadcast_exit();
 }
-#else
+#else /* !CONFIG_GENERIC_CLOCKEVENTS_BROADCAST_IDLE: */
 static inline void cond_tick_broadcast_enter(void) { }
 static inline void cond_tick_broadcast_exit(void) { }
-#endif
+#endif /* !CONFIG_GENERIC_CLOCKEVENTS_BROADCAST_IDLE */
 
 /**
  * default_idle_call - Default CPU idle routine.
@@ -439,7 +439,7 @@ balance_idle(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 {
 	return WARN_ON_ONCE(1);
 }
-#endif
+#endif /* CONFIG_SMP */
 
 /*
  * Idle tasks are unconditionally rescheduled:
-- 
2.45.2

