Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3EB272E6F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419908; cv=none; b=WRLEsWSUPp2uLc9TdFGqOEP89JsV4dRxWaiPYprGgkSvc87xDZM56XA4T7aw31Zqadgybe7jpbTuG1316s366luaS1SnY58pHmtweayddpGa1bnsmAuw6XMFwWlUH5lQMkF99z4bameY7wj1H1hfC/ktmn1kT82P6tyOgv3FP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419908; c=relaxed/simple;
	bh=L9VeFm6TXPaYNLcRaVe3jedRlD2BYFO33qmbvkTkCBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAeAVBua++Io1FmJCPU1OPjUjmB126m15XrMNGIDhkTw91vkoDEFOWT0+YUdcayg4payon7nDuefV0d54RkWK+H/rL9p41L+63bhi2U/X707Vlf3mJjClO2d0BdoIAfDgQns9FhqEorSKgik6H8ENYR08XuQuJYEHll1shmQ8jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPwy8Meu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPwy8Meu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655F1C4CEEB;
	Wed, 28 May 2025 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419908;
	bh=L9VeFm6TXPaYNLcRaVe3jedRlD2BYFO33qmbvkTkCBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPwy8Meu7GdH8nXph6bPh7x66XI9JgcgaM/jui9JgYs1EKZbLtS47BxVLQEzrZ3ne
	 hWGuKeoioFdSDRS5Vh+NxFWN6NkGwSusD0nva6dGASGrH1wbxhWE9O6MpxcNGEMvMQ
	 HEjs/OO0V6POqJJ4oCeO4oI0h9EIVBNRRkQrLZTpUAMru6FwflDmQINjsoxwZyrNTW
	 AMGiBnpLGqDS8Q1YLMgB26yHI7Fs/CIQhqSOQ0/hK+8EBpXPFG5/Fb62PQqkOJ0pOp
	 AVS0rjXla71MrePkxtUeVhk2ZxbdQuHppefZJRndVPWiaugEXkie7H2Uc6X4c4sCwX
	 tiZXrex5/3OQQ==
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
Subject: [PATCH 34/43] sched/smp: Use the SMP version of the idle scheduling class
Date: Wed, 28 May 2025 10:09:15 +0200
Message-ID: <20250528080924.2273858-35-mingo@kernel.org>
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
 kernel/sched/idle.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index cb01b063d733..2571ce6908a1 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -427,7 +427,6 @@ void cpu_startup_entry(enum cpuhp_state state)
  * idle-task scheduling class.
  */
 
-#ifdef CONFIG_SMP
 static int
 select_task_rq_idle(struct task_struct *p, int cpu, int flags)
 {
@@ -439,7 +438,6 @@ balance_idle(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 {
 	return WARN_ON_ONCE(1);
 }
-#endif /* CONFIG_SMP */
 
 /*
  * Idle tasks are unconditionally rescheduled:
@@ -526,11 +524,9 @@ DEFINE_SCHED_CLASS(idle) = {
 	.put_prev_task		= put_prev_task_idle,
 	.set_next_task          = set_next_task_idle,
 
-#ifdef CONFIG_SMP
 	.balance		= balance_idle,
 	.select_task_rq		= select_task_rq_idle,
 	.set_cpus_allowed	= set_cpus_allowed_common,
-#endif
 
 	.task_tick		= task_tick_idle,
 
-- 
2.45.2

