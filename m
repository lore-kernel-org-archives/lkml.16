Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65568270ECD
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419898; cv=none; b=Cg0jRO3rnuo/lSNMHoU0yKy8VYe5nro9gWtJy5mzasTNFupxDSvcKHEhcK+dCH53Q+Y4YK9gQC2EAhL/2sYD8wRa+oubJ80Q2jizg2W2rJHvKxXtJ9/1PmCGsbrytEJ7pMC4uNAJ8bwcXWnesDGqBvM56pRNC80OxgWrJU9jmFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419898; c=relaxed/simple;
	bh=jm3nLmXD/nEkkUF7+EgdT+Vbjj+DyhZtqeD96ddwuLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIApvgdAVJy7mEMDOMdVFDdKNuvWMQ58rBPWPQzZcTTvZwuIzngcGSWco3nZD1uVAANYmzfpIWlr8QHY93R/ImwiR4ElrmfrHfM661AlYa9/RuK3K6barx0/No8GrxwEGHG9EIonvwgu5lNy9HZ+4L1Al9ouF4xcFubRgkUV6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjFcVLiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjFcVLiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF501C4CEEB;
	Wed, 28 May 2025 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419897;
	bh=jm3nLmXD/nEkkUF7+EgdT+Vbjj+DyhZtqeD96ddwuLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TjFcVLiJ77ZidQ/IhhUZMaZRIhbyMTvDDaudL0Q4eM5L1izvYle3q7cR4uEaJ5Vrv
	 Bii88qOyB9+LbPgYwf7eYCRGiliEZ1inw3bIgsm4BrpaZy9JY/Xq7XT5aR5QhIoK9p
	 g+W2JFx3i47FirZVd/dMxOxUqLeflsFL+C1PahgQ9biWReDlrk2CLn8wwdwfeZQeUR
	 EJv74J5+EZeEYT+S8BEOvWHOXuD3MiL6ZaZZK5rRgKRC6TVrIf9RbZgjN4iZG9BsXm
	 fN7Xr2SqxaoqprFtGoqHBorQ63yemdBd7vpNiBnbKZHil1BLzYU4nCse/A8tC2okfq
	 o+bMb1eK8Gmtw==
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
Subject: [PATCH 31/43] sched/smp: Use the SMP version of schedstats
Date: Wed, 28 May 2025 10:09:12 +0200
Message-ID: <20250528080924.2273858-32-mingo@kernel.org>
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
 kernel/sched/stats.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index def01886e93f..adb40371e370 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -114,10 +114,8 @@ static int show_schedstat(struct seq_file *seq, void *v)
 		seq_printf(seq, "timestamp %lu\n", jiffies);
 	} else {
 		struct rq *rq;
-#ifdef CONFIG_SMP
 		struct sched_domain *sd;
 		int dcount = 0;
-#endif
 		cpu = (unsigned long)(v - 2);
 		rq = cpu_rq(cpu);
 
@@ -132,7 +130,6 @@ static int show_schedstat(struct seq_file *seq, void *v)
 
 		seq_printf(seq, "\n");
 
-#ifdef CONFIG_SMP
 		/* domain-specific stats */
 		rcu_read_lock();
 		for_each_domain(cpu, sd) {
@@ -163,7 +160,6 @@ static int show_schedstat(struct seq_file *seq, void *v)
 			    sd->ttwu_move_balance);
 		}
 		rcu_read_unlock();
-#endif /* CONFIG_SMP */
 	}
 	return 0;
 }
-- 
2.45.2

