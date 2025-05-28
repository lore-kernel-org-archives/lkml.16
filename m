Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243EB247285
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419810; cv=none; b=XBwuMA+vGzCLKZP9YLFfgfcwJFPKPa7XwrTuZeXVQrF8TSyDWEKQFE710orvXuXak4RlMZpf8JBsEvEvHeMCiDG/mA6PjtjkFp2TvX6m1AVqt6h0yg2LPvVPoEKaiAHd1+rA3Csf0fFvmLl5iomjPUvwh1jaOTdwBrSwROwgHHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419810; c=relaxed/simple;
	bh=AxBFKsNuYs50HDFmVhGNFAAe2Ve+EczsBe0uyX7QE48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj05zprnPMxTvsLpYgnCYEfzoLAIi6ZD4ZF4GF7a1IjZjCiGfCLNbDCG7RRbWP5jasgCJKo/wQ74AJs4Mkc5QXZh5mCT5ZaXCHZqCnm/iffjHBpVdONHy6fj0viNKIto3la8H1WABQqn251jpXxmtlNy81xHdz8O6n/wMJbhMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5ZxzWpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5ZxzWpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BB9C4CEE7;
	Wed, 28 May 2025 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419809;
	bh=AxBFKsNuYs50HDFmVhGNFAAe2Ve+EczsBe0uyX7QE48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z5ZxzWpNo19c9sXgQhYikwqccMUU3EZ2fuFL1EWGt/rt4ZFZz4kReLd5uRZ1sOLPJ
	 vy+oSxBR++I0YPyDDNJqprm72Mbkxxu0NTlcigehr4WLfgbuewwLhwVshN9YDjfwGh
	 ttHwPgk67HsWpqcpnsW+xks57/FtV4hIp3+cOCFPHuzqpfCjjVan77/8z1cTKyLuNP
	 jhUpeQbkun6G27BXLFUPQYZxFlie1NBagCm0iWO6Q/d2weJ5szwo9ZoyNRyrrjzLsT
	 3dsIoaAtoEfysQlijfXhtWJUz0e2+RogU2Ho80+RiBqJDNHezIIMprUvnfZMU4xyIP
	 iv1U5s9VLA0cA==
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
Subject: [PATCH 06/43] sched: Clean up and standardize #if/#else/#endif markers in sched/cputime.c
Date: Wed, 28 May 2025 10:08:47 +0200
Message-ID: <20250528080924.2273858-7-mingo@kernel.org>
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
 kernel/sched/cputime.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 6dab4854c6c0..dd745789c9fc 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -88,7 +88,7 @@ static u64 irqtime_tick_accounted(u64 maxtime)
 	return delta;
 }
 
-#else /* CONFIG_IRQ_TIME_ACCOUNTING */
+#else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 
 static u64 irqtime_tick_accounted(u64 dummy)
 {
@@ -241,7 +241,7 @@ void __account_forceidle_time(struct task_struct *p, u64 delta)
 
 	task_group_account_field(p, CPUTIME_FORCEIDLE, delta);
 }
-#endif
+#endif /* CONFIG_SCHED_CORE */
 
 /*
  * When a guest is interrupted for a longer amount of time, missed clock
@@ -262,7 +262,7 @@ static __always_inline u64 steal_account_process_time(u64 maxtime)
 
 		return steal;
 	}
-#endif
+#endif /* CONFIG_PARAVIRT */
 	return 0;
 }
 
@@ -288,7 +288,7 @@ static inline u64 read_sum_exec_runtime(struct task_struct *t)
 {
 	return t->se.sum_exec_runtime;
 }
-#else
+#else /* !CONFIG_64BIT: */
 static u64 read_sum_exec_runtime(struct task_struct *t)
 {
 	u64 ns;
@@ -301,7 +301,7 @@ static u64 read_sum_exec_runtime(struct task_struct *t)
 
 	return ns;
 }
-#endif
+#endif /* !CONFIG_64BIT */
 
 /*
  * Accumulate raw cputime values of dead tasks (sig->[us]time) and live
@@ -411,11 +411,11 @@ static void irqtime_account_idle_ticks(int ticks)
 {
 	irqtime_account_process_tick(current, 0, ticks);
 }
-#else /* CONFIG_IRQ_TIME_ACCOUNTING */
+#else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
 static inline void irqtime_account_idle_ticks(int ticks) { }
 static inline void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 						int nr_ticks) { }
-#endif /* CONFIG_IRQ_TIME_ACCOUNTING */
+#endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
 /*
  * Use precise platform statistics if available:
-- 
2.45.2

