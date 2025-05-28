Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82904272E5D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419912; cv=none; b=qv8plivZZyqeB7R+qLSQDsmB/7YdKbHiuH3ZG8f3Cd3J92FbAc08077ClcAHM93rUnKkA4jDH/NAumQM4+CEWqMZylys5tfSOnKIl47t+RU2w7MxLUWNe/muhDD3+EcDh88lXlI035vfBx6y465bRstHVslmLwWLkMKMbSEwZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419912; c=relaxed/simple;
	bh=ogTWmMEsymIxICRnXFYXfrvFLT7gHSyLw0APjFo2rec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lV5sonzSuPMuMJ+mY0alJ/ljQSF/Qs+r2YJGysTYWqaiRM6ZdRQPm10xH5Rf3r+bFszdyv5ImW4B708/aMcOeTwkhl8AoCbc+/kIMMz8vmoInCQRMNmIke2FtEgIsFpoKdflotffSSRTGoz1nnci+KcpmmuPLbeCXymGP+IZKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgLipuX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgLipuX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FBBC4CEEB;
	Wed, 28 May 2025 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419911;
	bh=ogTWmMEsymIxICRnXFYXfrvFLT7gHSyLw0APjFo2rec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WgLipuX3ICPcvodtpS4mxNu9XzZOz9mXa9srdyNtgk9im7iOqRLT5At6+RPo7gwkj
	 bLmGsuPsxVL1U7HzTYEp4whussFVO01GVeHIwZEdhNeTCkVwRF33vLkp/9OLCe+kFp
	 jJ/Frt2ws3Ul6dIm+R8iXUuL41m0fAHCclrrx0J4JBH+CUSiILjgtpsGLa+kxfbWWW
	 Q5Ubcthy1lCDft6rbtmjjCUwqBlATYK7v4cl+sr+HNuWWqiVrLEwEC0bpqCg4GWaN+
	 64n6212sYQE/hv5QmjBxIsYp+aw0l/bNLWp0sgkOb9RpU9kV1LQ+41hgFMHGuBnxnD
	 I+dD64lcUQL2w==
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
Subject: [PATCH 35/43] sched/smp: Use the SMP version of the stop-CPU scheduling class
Date: Wed, 28 May 2025 10:09:16 +0200
Message-ID: <20250528080924.2273858-36-mingo@kernel.org>
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
 kernel/sched/stop_task.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index 058dd42e3d9b..7314c8be6e30 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -8,7 +8,6 @@
  * See kernel/stop_machine.c
  */
 
-#ifdef CONFIG_SMP
 static int
 select_task_rq_stop(struct task_struct *p, int cpu, int flags)
 {
@@ -20,7 +19,6 @@ balance_stop(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 {
 	return sched_stop_runnable(rq);
 }
-#endif /* CONFIG_SMP */
 
 static void
 wakeup_preempt_stop(struct rq *rq, struct task_struct *p, int flags)
@@ -106,11 +104,9 @@ DEFINE_SCHED_CLASS(stop) = {
 	.put_prev_task		= put_prev_task_stop,
 	.set_next_task          = set_next_task_stop,
 
-#ifdef CONFIG_SMP
 	.balance		= balance_stop,
 	.select_task_rq		= select_task_rq_stop,
 	.set_cpus_allowed	= set_cpus_allowed_common,
-#endif
 
 	.task_tick		= task_tick_stop,
 
-- 
2.45.2

