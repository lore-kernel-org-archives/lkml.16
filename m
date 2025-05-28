Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1024469C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419831; cv=none; b=bH4veU/qwZSQ9CrnLsc3eIuOF+Z7ZC5XlKaILlLZRl2aToe5AHF5MD9ekUxM0/Mul7e9oUt7jyMJQjM7faOZacdSEzPhfNahnoJuEF+XjIRg4HaAZORh0tJxbmuu+TzztIQEhio/XXPQWX+iCtmhLFqg75yizFp1KPAhAdnTnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419831; c=relaxed/simple;
	bh=ujQDYZVP7hXF+6mTGhNSKv+0Wz4zSkV/GbzAuJP3/HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdQSn5h3/5jQKY4Mp/ETy4Kp+ayiUkVchQpTkADQKlB6xFWg+cKIBu946dVB7WdBcoemuxSqrWE2dqQCPfsRmZZotgHNAKfxi4DuN1r8SNKVHpyhnUAaYRu27bOBwPdJhq+0o1nF1I3rClImOY1h+MxoTwIBuLgk9Zsj1MOJxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+f/elGh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+f/elGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79E2C4CEE7;
	Wed, 28 May 2025 08:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419830;
	bh=ujQDYZVP7hXF+6mTGhNSKv+0Wz4zSkV/GbzAuJP3/HM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d+f/elGhV+HtzzVj2+v1eOADh4nj6h09oRUDmKUQLLikWGCIQ9E5JLT/xlCtk+f0j
	 /bv00LoEuLGORPJh6GCteb8HpOQkuRRUq1CUWsf+AE8+UxnLukSnJ+zuIYocwWBdYt
	 xQ2QVKiOpvJ0d/e1PjPhbKoIit5rTb6YEoPSmtkfCH/aGKGx0SJowLkGXu8++oxU9+
	 jyjjNgMhdad9O2ur+HtY2+WTmj9miQ5AobKteBpBGvp89WaB4vZReSIW0yowOWZPc2
	 aHP03+B6stOSlQsrz/HHD4M7LbqKuIB3n4WHZrPjtkcSVm+lWfPj8QzZG1LIpdbU4O
	 xUJ7DiWlbqifw==
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
Subject: [PATCH 12/43] sched: Clean up and standardize #if/#else/#endif markers in sched/pelt.[ch]
Date: Wed, 28 May 2025 10:08:53 +0200
Message-ID: <20250528080924.2273858-13-mingo@kernel.org>
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
 kernel/sched/pelt.c |  4 ++--
 kernel/sched/pelt.h | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 7a8534a2deff..7ec1ca5a6178 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -413,7 +413,7 @@ int update_hw_load_avg(u64 now, struct rq *rq, u64 capacity)
 
 	return 0;
 }
-#endif
+#endif /* CONFIG_SCHED_HW_PRESSURE */
 
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
 /*
@@ -466,7 +466,7 @@ int update_irq_load_avg(struct rq *rq, u64 running)
 
 	return ret;
 }
-#endif
+#endif /* CONFIG_HAVE_SCHED_AVG_IRQ */
 
 /*
  * Load avg and utiliztion metrics need to be updated periodically and before
diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
index f4f6a0875c66..2635ec239bff 100644
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -15,7 +15,7 @@ static inline u64 hw_load_avg(struct rq *rq)
 {
 	return READ_ONCE(rq->avg_hw.load_avg);
 }
-#else
+#else /* !CONFIG_SCHED_HW_PRESSURE: */
 static inline int
 update_hw_load_avg(u64 now, struct rq *rq, u64 capacity)
 {
@@ -26,7 +26,7 @@ static inline u64 hw_load_avg(struct rq *rq)
 {
 	return 0;
 }
-#endif
+#endif /* !CONFIG_SCHED_HW_PRESSURE */
 
 #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
 int update_irq_load_avg(struct rq *rq, u64 running);
@@ -174,15 +174,15 @@ static inline u64 cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
 
 	return rq_clock_pelt(rq_of(cfs_rq)) - cfs_rq->throttled_clock_pelt_time;
 }
-#else
+#else /* !CONFIG_CFS_BANDWIDTH: */
 static inline void update_idle_cfs_rq_clock_pelt(struct cfs_rq *cfs_rq) { }
 static inline u64 cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
 {
 	return rq_clock_pelt(rq_of(cfs_rq));
 }
-#endif
+#endif /* !CONFIG_CFS_BANDWIDTH */
 
-#else
+#else /* !CONFIG_SMP: */
 
 static inline int
 update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq)
@@ -231,6 +231,5 @@ static inline void
 update_idle_rq_clock_pelt(struct rq *rq) { }
 
 static inline void update_idle_cfs_rq_clock_pelt(struct cfs_rq *cfs_rq) { }
-#endif
-
 
+#endif /* !CONFIG_SMP */
-- 
2.45.2

