Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E06526FA53
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419891; cv=none; b=DVkJRMMLjMZOlYhuMLPJLsYlfcjYwUNkPyimzxBcMRM85sOBTBfNqqMuliCb76cHJ7qiqiuEVFLyNzp1toyNAc/Lh+f0dJjKntohMlAESf2gzsamnZlaFOReUaPJMlCFVqQkQJzQyppWMP6gWzbCJ2HBhCGGKgcLKOltzjD9fS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419891; c=relaxed/simple;
	bh=phChXyA4Hfddq3zV4Apy/8kpLlEUlQ4HQMTQhYZya1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+lHayNeXby0Xs3bpzu60iLo/xnd+3e/t0TVBrY8ubxGQvmLAMI2Q5C4NgYsX7UyluHJiLj90hxdwuJudEp5V4f3XUfiX3hGSNpAyWsmzwKKZjCVgGglZjE88q0JS0tLlgHpXikLH3AoVYpGOPK2qSgs9ZDn2Ti7CEilQ9uKRJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqdDz1v9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqdDz1v9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF529C4CEEF;
	Wed, 28 May 2025 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419890;
	bh=phChXyA4Hfddq3zV4Apy/8kpLlEUlQ4HQMTQhYZya1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqdDz1v9R9JjWG3vnw4LSoJ6MR3dTElF9hThkHn3dLSJECidLQT2EiTgYNS7rTx2f
	 FRhY1b7fJNGiwbjoneLD5HrIlhEDYORMdS3k/N+PF3VdYuZm470yXVkIUsBjDY7qPS
	 zA/q+ruZe8jWrUvmg+4bPG7UYU96BUGcrKb4rPsC4efHIq7im3axzIX/okMXU+TuUv
	 0y/oHPRgE+wFWqTAO+rv1dbLs4qKdGNYxWLLjhnzwJVTeReQy3ONnp4hvguu/Pqc5G
	 QXSFp7sJomq1/PkeHszJJTIVMYhs14OHkwO1Dgt7XeJd8VPECBzjbaOKjD6z/WJFvV
	 8evWcIOHmUI/w==
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
Subject: [PATCH 29/43] sched/smp: Use the SMP version of the deadline scheduling class
Date: Wed, 28 May 2025 10:09:10 +0200
Message-ID: <20250528080924.2273858-30-mingo@kernel.org>
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
 kernel/sched/deadline.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 80dd95419eac..c36813af9bb3 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3001,7 +3001,6 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p,
 	if (!task_on_rq_queued(p))
 		return;
 
-#ifdef CONFIG_SMP
 	/*
 	 * This might be too much, but unfortunately
 	 * we don't have the old deadline value, and
@@ -3030,13 +3029,6 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p,
 		    dl_time_before(p->dl.deadline, rq->curr->dl.deadline))
 			resched_curr(rq);
 	}
-#else /* !CONFIG_SMP: */
-	/*
-	 * We don't know if p has a earlier or later deadline, so let's blindly
-	 * set a (maybe not needed) rescheduling point.
-	 */
-	resched_curr(rq);
-#endif /* !CONFIG_SMP */
 }
 
 #ifdef CONFIG_SCHED_CORE
-- 
2.45.2

