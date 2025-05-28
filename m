Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548F26D4E2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419881; cv=none; b=BvBrmdQQak7piE9qgQk1dferGBaGDMJnnctKGgXfn/HX4t3mPfcaWsz1fUGVE4T9+2DLV+wrNm0y4A3DvibJnBCo+NsmPjArkNz2+JVLrlWeBl739YIXLe12JAJWVqlzuMhcroImswlLhudr/8h+bHtHATNjrtHfErR0ixhOPE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419881; c=relaxed/simple;
	bh=CwbGVD7ViB6aFSnaChoiYxmAyKxsY+s2o/PK3zPWAOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgLdR7DLIks65mi/B/9jF3Me02jQAY2YL5F9E5pBCJW2BnEUnNhqCto1eQH2Htmc6K3hsP067BFytb82wZLAX/NjrouzL+JXsiZdaWkArlKIig8qJ4xsda8sTB1MHXBafAQbwEi+LqYSSAO9NbqJVONAJZVbOmNeilQ+69YbyX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTCK4oP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTCK4oP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AF9C4CEEB;
	Wed, 28 May 2025 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419880;
	bh=CwbGVD7ViB6aFSnaChoiYxmAyKxsY+s2o/PK3zPWAOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTCK4oP5Ysa1Bb0D4duEeVwq5ZVsT19IYi7Czlmo5CaXlD3Hy7kTFCTytVwJ1S1c4
	 tYkpGkUMywYgmto17lSokBolYRcevWkuO86RxRQdH//h8Zd41EYvUlCrvjPbjC7eqi
	 Xgi+1HU/cqxE79b2jh1r1K813Xv+YL8LfPeiys/3YQBFx1Q0/ZKrmXLwDPAifBdm/h
	 bfGAi6x1RliilT/hih7JiW0M5lw+uRbdIXsVjaE91LQlYQoP/1lgrCPzq2ZSkTPQvX
	 MXHPVh+mowcmiTlc5+KXcmg5817eS7MdpeyqVfpw+b6wNJFEUorCx8+HNmSrHaoMyW
	 jMPgnOkiclQlA==
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
Subject: [PATCH 26/43] sched/smp: Use the SMP version of sched_exec()
Date: Wed, 28 May 2025 10:09:07 +0200
Message-ID: <20250528080924.2273858-27-mingo@kernel.org>
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
 include/linux/sched/task.h | 4 ----
 kernel/sched/core.c        | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index ca1db4b92c32..c517dbc242f7 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -109,11 +109,7 @@ int kernel_wait(pid_t pid, int *stat);
 extern void free_task(struct task_struct *tsk);
 
 /* sched_exec is called by processes performing an exec */
-#ifdef CONFIG_SMP
 extern void sched_exec(void);
-#else
-#define sched_exec()   {}
-#endif
 
 static inline struct task_struct *get_task_struct(struct task_struct *t)
 {
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5a77afcbb60b..ac933e6fc465 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5415,8 +5415,6 @@ unsigned int nr_iowait(void)
 	return sum;
 }
 
-#ifdef CONFIG_SMP
-
 /*
  * sched_exec - execve() is a valuable balancing opportunity, because at
  * this point the task has the smallest effective memory and cache footprint.
@@ -5440,8 +5438,6 @@ void sched_exec(void)
 	stop_one_cpu(task_cpu(p), migration_cpu_stop, &arg);
 }
 
-#endif /* CONFIG_SMP */
-
 DEFINE_PER_CPU(struct kernel_stat, kstat);
 DEFINE_PER_CPU(struct kernel_cpustat, kernel_cpustat);
 
-- 
2.45.2

