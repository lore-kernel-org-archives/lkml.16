Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790A26A087
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419873; cv=none; b=i9i5j2pF+PfVur2hNBl97uUipAwP7GmGZQd3LmSZsDCpuHh0v0rFTU6oPC8W2HyJoZuyE2bz4Uip/CSCAqNbPnxdeTZffA8MD3HQ3B/GeEH2lmhhTunsDNefDOxTcARQL3oFkKb1bJ1QwT5HOH7aCLKoIaUGD/VxPP46j+7auYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419873; c=relaxed/simple;
	bh=Miv7nCGwvNTejjIOfYKmadg9kS3OXpi2GOuOWy9Ycc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VamRZYqDqif44E3pEcnIF7wVD8SkisUFKR5NB+iIJOQV7lhl4JIl3WRSybt9CGgAS/KyoijQ75y+UBv/oppWDpglIpjpU2oa8IUZLBTivHqx56O4VFgMOceJ9j7JmtBlR/ZIIWrmZXwtoze+DLzkXgbuc5e7KKtJI3rj/vvr620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAGspQnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAGspQnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E53C4CEE7;
	Wed, 28 May 2025 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419873;
	bh=Miv7nCGwvNTejjIOfYKmadg9kS3OXpi2GOuOWy9Ycc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fAGspQnplhd7jSQyrvyLcekSXjStDCnmfp1FrblhUhIoxdeCms0KraRIpkcuPHGKC
	 wKF6twwr9us1JVbFWmS1gfz7udwb+GY8p4blrhXbK8plFps9/olr2pJnRERMQcyUOD
	 NI7Cmm+DuV3i93ONKZ7ZLMYLe/1hI3ISiX5cEKj7NvVnC8Kr1AGIPyeG3+0lWLqGPv
	 nCqZkzNtx9wmagoGEfPIojQY7vmMQ2JIssSgTzxxHc9WKRFPbsRGct1XsDD70I/chC
	 SAD0Cbsbs2kzGhs0FnpnV+p8aaaK68YJzjON+GNr7pmb4ao/5zrhWiFYgGqvTGduui
	 OEKb1/TrUQkog==
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
Subject: [PATCH 24/43] sched/smp: Use the SMP version of __task_needs_rq_lock()
Date: Wed, 28 May 2025 10:09:05 +0200
Message-ID: <20250528080924.2273858-25-mingo@kernel.org>
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
index 850f39fe5b8f..9eefc74f35a8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4308,14 +4308,12 @@ static bool __task_needs_rq_lock(struct task_struct *p)
 	if (p->on_rq)
 		return true;
 
-#ifdef CONFIG_SMP
 	/*
 	 * Ensure the task has finished __schedule() and will not be referenced
 	 * anymore. Again, see try_to_wake_up() for a longer comment.
 	 */
 	smp_rmb();
 	smp_cond_load_acquire(&p->on_cpu, !VAL);
-#endif
 
 	return false;
 }
-- 
2.45.2

