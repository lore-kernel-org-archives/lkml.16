Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3447266571
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419845; cv=none; b=kZVKFLiNoRqRyMbX3h+2KpRJRdcpVS7tQOYjvTcBt8SznGGlnKFI81OCSNeACgl+G8hZokwnuanxUK8Z+WxARMHjbbNJFtEYOPFGwNqbd7U/hEOWYqhkzY2VqnNYmKv4jQy+ZrzOCgUNhzYDsQCUDFR43nWMAmSTg43cXpYsB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419845; c=relaxed/simple;
	bh=DqPTk2T9hd5pdXj/uwXvK+7QERI5wMwFXM+0Isu80bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AonlM+bwoln29ber7M5W5IkwH6krUVTg4cQob+gZit/j2jZnPJ4mNwzTU94qLCJx8fSq8vjWhGQZ/ZaJe5/tGNfmNXcPiP7ONc5fRMhVCwMXjaweYDzzj3PUyIDNJ/cryo8d1IkqdOMyzUPg/NuR4Qxh+eGjZoC30mq7hxm5y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/Wlo97Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/Wlo97Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C277FC4CEE7;
	Wed, 28 May 2025 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419844;
	bh=DqPTk2T9hd5pdXj/uwXvK+7QERI5wMwFXM+0Isu80bU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/Wlo97YMGxgyr7YA633lUiVZ4AR0qFhhBzaoTT7/0D7u4/l9GbxbnqrFD/RnRc/u
	 Nc7hvwwFw26e4PSBccBk4j8A//upKHyZc9yaIGnRwXY7JQbwdWKubqUZgSOHCQqNHk
	 bAJ9ZYzlLpv3gOxrG0L9VbzYoWddCw8pHngR4Bha2dfMbRKzjzHhMuGI9qeoKGFha5
	 3ToPje/z3M4y+hqGqOwqkl5aisFPOEtGKJwKAaozMhHTSK5uOULKIAahcyZLj5eO/q
	 CP8XwR1rqsLdSwyqW9SSsTCsS9gFqe9DdAB6skIOrYB/mvSsVC5jdoclfBUzQc/NmR
	 Ehwj4N+Z9T56w==
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
Subject: [PATCH 16/43] sched: Clean up and standardize #if/#else/#endif markers in sched/stats.[ch]
Date: Wed, 28 May 2025 10:08:57 +0200
Message-ID: <20250528080924.2273858-17-mingo@kernel.org>
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
 kernel/sched/stats.c |  2 +-
 kernel/sched/stats.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index 4346fd81c31f..def01886e93f 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -163,7 +163,7 @@ static int show_schedstat(struct seq_file *seq, void *v)
 			    sd->ttwu_move_balance);
 		}
 		rcu_read_unlock();
-#endif
+#endif /* CONFIG_SMP */
 	}
 	return 0;
 }
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index 452826df6ae1..26f3fd4d34ce 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -112,10 +112,10 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		     bool sleep);
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING
 void psi_account_irqtime(struct rq *rq, struct task_struct *curr, struct task_struct *prev);
-#else
+#else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
 				       struct task_struct *prev) {}
-#endif /*CONFIG_IRQ_TIME_ACCOUNTING */
+#endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 /*
  * PSI tracks state that persists across sleeps, such as iowaits and
  * memory stalls. As a result, it has to distinguish between sleeps,
@@ -220,7 +220,7 @@ static inline void psi_sched_switch(struct task_struct *prev,
 	psi_task_switch(prev, next, sleep);
 }
 
-#else /* CONFIG_PSI */
+#else /* !CONFIG_PSI: */
 static inline void psi_enqueue(struct task_struct *p, bool migrate) {}
 static inline void psi_dequeue(struct task_struct *p, bool migrate) {}
 static inline void psi_ttwu_dequeue(struct task_struct *p) {}
@@ -229,7 +229,7 @@ static inline void psi_sched_switch(struct task_struct *prev,
 				    bool sleep) {}
 static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
 				       struct task_struct *prev) {}
-#endif /* CONFIG_PSI */
+#endif /* !CONFIG_PSI */
 
 #ifdef CONFIG_SCHED_INFO
 /*
@@ -334,6 +334,6 @@ sched_info_switch(struct rq *rq, struct task_struct *prev, struct task_struct *n
 # define sched_info_enqueue(rq, t)	do { } while (0)
 # define sched_info_dequeue(rq, t)	do { } while (0)
 # define sched_info_switch(rq, t, next)	do { } while (0)
-#endif /* CONFIG_SCHED_INFO */
+#endif /* !CONFIG_SCHED_INFO */
 
 #endif /* _KERNEL_STATS_H */
-- 
2.45.2

