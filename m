Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D493248F7E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419940; cv=none; b=m9cLvZys/VyY7j1R4RkAXoblqR4Sy/aI3tQiwUQlM6iGZJwSb9oQjPpVyigw1LBLsR3etM5q0dC3f/DK28mjpiohsaoi/sTf6xDoK7yqLLdobe3Kx2lI2BSGuDbUje1eW0ZYOGbxQjkfSdPIUAXxZJA8iqE/I8o+jOYa8BERcLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419940; c=relaxed/simple;
	bh=SlC96ZS+oaGKKEF2VkZ32gtN91o4MUhZYLJuONUwBV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feNzsqHPMAhobwvbzdRtbevYudVWkO2s0fbBmax8ToLMOqnRt7Sn+5yrYiEy074tzVypucwToqw/Kp/Vk+Ze/6DfC9omtqEfOGcwu7QPNKObNYoCWMGAC0trKX1fKAH422W2wpTQ7oE9YlHKeM4NBMv8ipL2secrVk4hekYcWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKLxPC0P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKLxPC0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35753C4CEEB;
	Wed, 28 May 2025 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419940;
	bh=SlC96ZS+oaGKKEF2VkZ32gtN91o4MUhZYLJuONUwBV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKLxPC0P1EtdgHsrspnwunI0sy5m8MQ/xkpksZAhIjaoU3Kvdc2dilCKfzGjgo6xC
	 +d80gr4gsX9tt+AUqrMMFSgD1dDjFoRXxxgy0GwmZnEj1taRGLKB7BECgBc30F9+7N
	 rfW5ljfMvXR4zjIukt+KUnkKDhYNfMpPE7Nx2ob42P/kaK5AJI9GCREZ78QexbEyd3
	 GpCSOQmpBvEIGirBbNmFQaZ0vpzuJvk2ONR1n+tgRARxZ+y/1gyh6kWH6XKbHRhY7s
	 S0ZZYfTcSXJJ9wxqBq1RcOaf7FNnYmSrmekgNQ0IpE3giYkT1IfTOeLHhCCRsQg+od
	 tjHaqvSg+Yz3w==
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
Subject: [PATCH 43/43] sched/smp: Use the SMP version of double_rq_clock_clear_update()
Date: Wed, 28 May 2025 10:09:24 +0200
Message-ID: <20250528080924.2273858-44-mingo@kernel.org>
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
 kernel/sched/sched.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e6d637015d0c..dedf92fae94f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2839,10 +2839,7 @@ unsigned long arch_scale_freq_capacity(int cpu)
 static inline void double_rq_clock_clear_update(struct rq *rq1, struct rq *rq2)
 {
 	rq1->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
-	/* rq1 == rq2 for !CONFIG_SMP, so just clear RQCF_UPDATED once. */
-#ifdef CONFIG_SMP
 	rq2->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
-#endif
 }
 
 #define DEFINE_LOCK_GUARD_2(name, type, _lock, _unlock, ...)				\
-- 
2.45.2

