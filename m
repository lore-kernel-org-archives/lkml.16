Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651A246776
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419855; cv=none; b=L7FdIDM/DftP6iltWJ+gtgUR04Gz652WcrBdpGaKWLUbAyDmJtYCAY1OtfamW02mq0dg5mpZ4wYM4XkkLKGYsWNLz8RgoR4PqS3aEE8SrioXn2CJOxFRxwWQ+dNokG6SUqfR9V3TsDf4RFbXtYJhig9/FJJ3NB2PUSjDywzkSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419855; c=relaxed/simple;
	bh=ny6QSC9rijS4pGlrRodZrfbLqyCq2d1aVXezNqZIRqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXJhP/79qQRBsFhxYWH9kBCyX9RSC2kthGbM7T9xpo9bb/VQgxLEDXBc8GHicbXSopYs4sWwD4YHuhhbnLf/n2qm5ZIYakD6TM8hsSsnJCUNq5yGYKJ4K9U7uw3f2sKE4msphlfv7Q36tySTCtUD/vGN1Chlc8IDhnjwBtq0q58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEFJdf50; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEFJdf50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E34C4CEEF;
	Wed, 28 May 2025 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419855;
	bh=ny6QSC9rijS4pGlrRodZrfbLqyCq2d1aVXezNqZIRqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oEFJdf509spyKk9yi8VjE/pxup1CikaJXd4pRE5b79X6fxtMWp9FW9NIIDLfQCdxz
	 VvJoiEmUzEW2ZYXkEuyiwmBvLChEALTCa79O8nYRnuIyvgEiQLz0sFHXRe2M0yNYC/
	 wOFAgp0huc5mNyduo756CqcLihdhWBeltznOwyYmiN3o3KnwKwUmnqelsLII8zJDKS
	 EshHMaox5Pj3oC+hkv/wrO3ho+MeYFIZR9Vjz7j9lLt0jOWXpdJZYRCFWaqe9G++rV
	 V7j++EsTh6Ba7UQL3qJWBYyevJlxEcQYO3TPzEe0C/Ret6mGF096BG+B8A9hcQ8i6u
	 zJYGLzhDzVjdQ==
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
Subject: [PATCH 19/43] sched/smp: Always define sched_domains_mutex_lock()/unlock(), def_root_domain and sched_domains_mutex
Date: Wed, 28 May 2025 10:09:00 +0200
Message-ID: <20250528080924.2273858-20-mingo@kernel.org>
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

Unconditionally build kernel/sched/topology.c and the main sched-domains
locking primitives.

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
 include/linux/sched.h        | 5 -----
 kernel/sched/build_utility.c | 3 ++-
 kernel/sched/topology.c      | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 45e5953b8f32..77fb5aa73d70 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -395,15 +395,10 @@ enum uclamp_id {
 	UCLAMP_CNT
 };
 
-#ifdef CONFIG_SMP
 extern struct root_domain def_root_domain;
 extern struct mutex sched_domains_mutex;
 extern void sched_domains_mutex_lock(void);
 extern void sched_domains_mutex_unlock(void);
-#else
-static inline void sched_domains_mutex_lock(void) { }
-static inline void sched_domains_mutex_unlock(void) { }
-#endif
 
 struct sched_param {
 	int sched_priority;
diff --git a/kernel/sched/build_utility.c b/kernel/sched/build_utility.c
index bf9d8db94b70..5c485b2dfb95 100644
--- a/kernel/sched/build_utility.c
+++ b/kernel/sched/build_utility.c
@@ -83,9 +83,10 @@
 #ifdef CONFIG_SMP
 # include "cpupri.c"
 # include "stop_task.c"
-# include "topology.c"
 #endif
 
+#include "topology.c"
+
 #ifdef CONFIG_SCHED_CORE
 # include "core_sched.c"
 #endif
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 4f52b8e56c19..7ce0bac86e94 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -15,6 +15,8 @@ void sched_domains_mutex_unlock(void)
 	mutex_unlock(&sched_domains_mutex);
 }
 
+#ifdef CONFIG_SMP
+
 /* Protected by sched_domains_mutex: */
 static cpumask_var_t sched_domains_tmpmask;
 static cpumask_var_t sched_domains_tmpmask2;
@@ -2855,3 +2857,5 @@ void partition_sched_domains(int ndoms_new, cpumask_var_t doms_new[],
 	partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
 	sched_domains_mutex_unlock();
 }
+
+#endif /* CONFIG_SMP */
-- 
2.45.2

