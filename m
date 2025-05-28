Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2A26AA8F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419877; cv=none; b=UNqRtMLXMzqvbmLWFxSw1EAdZYwDvhaxoNNMjktTyDOB3DTNUi7kWEpRwHgNfLwJEsGJG5+oHIVqCzTq+4btXz628CXsStFZi3QYBcP4bIMqXwaXfBZ0647W1vgc1y5524B3Dy5DRB8tBSpfptn05zwk1Y3v0+sLipa1lWgYscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419877; c=relaxed/simple;
	bh=wDpwR49UWi0ljBeIQkbNv8UOQoWdLigZTUZ/r3UlnbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSezs7JLa4alDa+RFMJ+1w5eZsze0wZapB7IpjRyLK64utjQsmNcm4RXHY5E5nA0FLhc+5CLLxrRN7GvCNpxfROPCxfnl/ornP1ZJZIJfg9eKXcwtnnAGsfa+HU/3Gf2GQWfa+5ahm0wL56KO97lGzNVgtWvRwkcI5OxyjlVP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVc9nCU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVc9nCU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E7EC4CEEF;
	Wed, 28 May 2025 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419876;
	bh=wDpwR49UWi0ljBeIQkbNv8UOQoWdLigZTUZ/r3UlnbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVc9nCU7eeqtbqtQT9/xbuawzxsjUGBG5/jVN7aWc09YEHEctc8/VbqXzGa+UvSuJ
	 WsER1psHWDChU5kmvQ3p8JYa684Xtat8JyMhkiCllOUlJOytDFRcolu+tiCdROK0T5
	 xsQQtR/d/gSzzxb5w0FPvqa7hJQmA4WnNfIRy/+oinT0bLTDa5qCLMmBdMMy6H3sf9
	 GeJ3DRlSIeDv/hjfE7W3yS0tw8xaRcIdJhQO+BtE4t6SHOg76B5nqJdEMlqEuIUfEO
	 8RzmFTTLz6dIFeyik4i90z+fMBw6UvhEWr5Xj5TCB5rWJw7pV4c7zXE0B/vKw3hcvd
	 s2+yemP6R+Cvw==
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
Subject: [PATCH 25/43] sched/smp: Use the SMP version of wake_up_new_task()
Date: Wed, 28 May 2025 10:09:06 +0200
Message-ID: <20250528080924.2273858-26-mingo@kernel.org>
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
 kernel/sched/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9eefc74f35a8..5a77afcbb60b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4820,7 +4820,6 @@ void wake_up_new_task(struct task_struct *p)
 	activate_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_INITIAL);
 	trace_sched_wakeup_new(p);
 	wakeup_preempt(rq, p, wake_flags);
-#ifdef CONFIG_SMP
 	if (p->sched_class->task_woken) {
 		/*
 		 * Nothing relies on rq->lock after this, so it's fine to
@@ -4830,7 +4829,6 @@ void wake_up_new_task(struct task_struct *p)
 		p->sched_class->task_woken(rq, p);
 		rq_repin_lock(rq, &rf);
 	}
-#endif
 	task_rq_unlock(rq, p, &rf);
 }
 
-- 
2.45.2

