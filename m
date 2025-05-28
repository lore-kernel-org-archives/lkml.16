Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236752580F2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419919; cv=none; b=UpGuEpJ+wROUXUuqoQPqwin4rrd2TKfannN4WUuiIvzqy4zyWFsK1PAuhIl1RWdxgm8xrVKGkECB0sMoN8mEeMEeRGaIKNlRAtmY036EUqotkw78Y9ILIVAEeAx6TRRIsXIB9uq+5E9Cb+0YLO1xPHj4xU9Ja5ufx9QFE3OIu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419919; c=relaxed/simple;
	bh=OdEdF01Lr/j0cfTsEp63McwuOtKGRi8w3iIcNvfjKK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDWbWi27kE6m2omqpy8lD2wv/cF8rMyg5rssBXVBsuntxYWxUea34yQs0y/TEftez2jufuRpQtr3VtXALs6Bi2+JA/3hsbC7EBrfLQY0vHmtytXGQHG/ilkSKGzsM6GIrtgMgk1qY+dnzreKtK/15G5UOr/TAprKcNyVbEJAOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxCdjdNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxCdjdNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF99EC4CEE7;
	Wed, 28 May 2025 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419919;
	bh=OdEdF01Lr/j0cfTsEp63McwuOtKGRi8w3iIcNvfjKK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxCdjdNUbh9R6zyOeJGeZf46ul6b61C4oIw5DXFp7PxkSGkEgdV9LAljHMnJsYHDD
	 iUCGDWItZdPDOHelilZbB975vRQ5+nyxyTBpRorkYH6096+BDmsJXOV4wCjiljvpp9
	 PajWRIivPHgVBoV4mTYtWT5TaZ3VNzg3cYSFMNdWuWh/AdJ8YJpjUKIntVyGQ/hB/G
	 W+lap/BwgRg9W1Y0MnEbMpdJG36oq1vIX0j+QVwnitcXEnQuKpucf3z2bUjAGEu2lF
	 6A5SNQwkEZ1K44JeiXGyw3Pv0CVGUDAu5WL9qpKcLQjK5zGuNABcLLVFN3g1EtyVxu
	 ehuGjO6u6VDoA==
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
Subject: [PATCH 37/43] sched/smp: Use the SMP version of is_migration_disabled()
Date: Wed, 28 May 2025 10:09:18 +0200
Message-ID: <20250528080924.2273858-38-mingo@kernel.org>
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
 kernel/sched/sched.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 19808e09bd94..61a5f683c502 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1300,11 +1300,7 @@ static inline int cpu_of(struct rq *rq)
 
 static inline bool is_migration_disabled(struct task_struct *p)
 {
-#ifdef CONFIG_SMP
 	return p->migration_disabled;
-#else
-	return false;
-#endif
 }
 
 DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
-- 
2.45.2

