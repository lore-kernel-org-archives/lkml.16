Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ACE2580F2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419922; cv=none; b=BmsCodQ/XZhNAtcmZqSvaadC+ChHwTv+nHkI1g+g82N3js5bKdBZWNH36kNPQjauSTZFTtQmGmpPXOjTiPW5UyIgxlPvfMLfqEM4Pi4e4NkcogJ2CMx/dIIN0CwomVMgxJGirWcLPIeNBijagFQy3H/1n9V1B1roawyxhU1PIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419922; c=relaxed/simple;
	bh=fZXEfXDXoR6mUA8KJflJTQEmYbNsOdcpzlbTVIKB9QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNYveAMV/K2fxMEYTrnnDH2vRDUfD78y6D4zGIXVqKyW/FxAR9G2IcBD74W1BsPJGufbXhpw6jlNiUmU4q4QyObGgiC2AQqSN5ZMWC0E2WHOms8kdGqaEXG6iCqgqzNwEOTqpe6NxNro+Rj8FKwcDY6Xmot1G7V4syPxoKaGsW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwpD6ON1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwpD6ON1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC0EC4CEEB;
	Wed, 28 May 2025 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419922;
	bh=fZXEfXDXoR6mUA8KJflJTQEmYbNsOdcpzlbTVIKB9QQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AwpD6ON1Qv9faraH5aJAAiDJGRcZrY53tfelt1/YbPrDpHRcXF2HSg4Nwb177DT1H
	 xERUHQzius13u76y6AIFZ6YChDFqKaZVOnUn+G+QVD2rXL67TFGnt5sRzS8KOyqbux
	 HZmXKW4qo+76lA7OARnNIGA3jNXLLwDufKgDRxLKntGxE8m5ZWvlQYr9O0EWgc9703
	 9SZUB4PYVBbEClEEu2Ljk/bn966DM5mPXLG1LcK0r+/oWCjfJdSetdRlvR1GVLpYwC
	 87nKuA80b1+Ln6UAi37MBBrUvSDTzvPS2mPG+n8lhVzQf2Y8xG2h/XTLjPe+Uddcbw
	 1xOpXEiEpmD/Q==
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
Subject: [PATCH 38/43] sched/smp: Use the SMP version of rq_pin_lock()
Date: Wed, 28 May 2025 10:09:19 +0200
Message-ID: <20250528080924.2273858-39-mingo@kernel.org>
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
 kernel/sched/sched.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 61a5f683c502..28e2847a3584 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1744,9 +1744,7 @@ static inline void rq_pin_lock(struct rq *rq, struct rq_flags *rf)
 
 	rq->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
 	rf->clock_update_flags = 0;
-#ifdef CONFIG_SMP
 	WARN_ON_ONCE(rq->balance_callback && rq->balance_callback != &balance_push_callback);
-#endif
 }
 
 static inline void rq_unpin_lock(struct rq *rq, struct rq_flags *rf)
-- 
2.45.2

