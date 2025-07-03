Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6602EA160
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551667; cv=none; b=S1Y38o6xQ4TtNpwQo+USTm92r9E+SwnDoXAAUHyACcG5pCFRh4JPPgo3ncDzczgmEj6LSgBi7d2a944xa5f+ZAo+UOzmrftyIlXfvz4MTQDj8y0odadHKPP+TwEi83R42/3oRG8PReXMYBOZ5H+6WB1B9Rv++62mOirnOH5k7gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551667; c=relaxed/simple;
	bh=QY9AUh/9sbWRVey2XWEDIQEEsAK1y6vLLNwig1fqR50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRdfuQO3SBcn5idNz5kl2Ba2uJ+U8OnN8q7Y4n8W8tXvaM+XP/HB1QvKWPbg/UDbdV28Qw/gtdlr39NFQ+Ij/11APcfpHPbsS3el3y1sTaJu8ncnKI5VLoBCzqq16aho1EIt27Rx1wSP2LfEJ3WmbRyUEEH3UJ00DaC56nLm7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi3cX/BG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi3cX/BG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5D3C4CEF2;
	Thu,  3 Jul 2025 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551667;
	bh=QY9AUh/9sbWRVey2XWEDIQEEsAK1y6vLLNwig1fqR50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qi3cX/BGE6MvsXYCQZ5ZQSZr8cjrtR/u1fbQ5/6Uzb1d+1jbRRRddwO6gE8p1IJ5w
	 k0+cNXhZzgRopQQswSx4Cu1beVVx8XuP5SsKgITRnJ2aPFToP6HHn/y6usKsnTH6V1
	 HnpNaSU0vweHwSuH6tGpfU2AiWCRvUEGNg4GNEX8kjhZx0I6alY4+5cE3KJXvcvnrm
	 /PS6DciVI5u+rzJOZG8AEZ9xuWCMLW6HgR6yHTh5Kp1u4wFvREZ2p3miWDEe4oWVz/
	 jQP2f3bHnvJtvTpOrMPg2zaiOIJUGJvhq1pwm6MPtQ4a9eAotNAwxTmiu+ll4OeuRH
	 kk0o63TmWOmyA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Subject: [PATCH 5/6] sched/isolation: Introduce isolated task work
Date: Thu,  3 Jul 2025 16:07:16 +0200
Message-ID: <20250703140717.25703-6-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703140717.25703-1-frederic@kernel.org>
References: <20250703140717.25703-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some asynchronous kernel work may be pending upon resume to userspace
and execute later on. On isolated workload this becomes problematic once
the process is done with preparatory work involving syscalls and wants
to run in userspace without being interrupted.

Provide an infrastructure to queue a work to be executed from the current
isolated task context right before resuming to userspace. This goes with
the assumption that isolated tasks are pinned to a single nohz_full CPU.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched.h           |  4 ++++
 include/linux/sched/isolation.h | 17 +++++++++++++++++
 kernel/sched/core.c             |  1 +
 kernel/sched/isolation.c        | 23 +++++++++++++++++++++++
 kernel/sched/sched.h            |  1 +
 kernel/time/Kconfig             | 12 ++++++++++++
 6 files changed, 58 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 117aa20b8fb6..931065b5744f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1448,6 +1448,10 @@ struct task_struct {
 	atomic_t			tick_dep_mask;
 #endif
 
+#ifdef CONFIG_NO_HZ_FULL_WORK
+	struct callback_head		nohz_full_work;
+#endif
+
 #ifdef CONFIG_FAULT_INJECTION
 	int				make_it_fail;
 	unsigned int			fail_nth;
diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index d8501f4709b5..9481b7d152c9 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -77,4 +77,21 @@ static inline bool cpu_is_isolated(int cpu)
 	       cpuset_cpu_is_isolated(cpu);
 }
 
+#if defined(CONFIG_NO_HZ_FULL_WORK)
+extern int __isolated_task_work_queue(void);
+
+static inline int isolated_task_work_queue(void)
+{
+	if (!housekeeping_cpu(raw_smp_processor_id(), HK_TYPE_KERNEL_NOISE))
+		return -ENOTSUPP;
+
+	return __isolated_task_work_queue();
+}
+
+extern void isolated_task_work_init(struct task_struct *tsk);
+#else
+static inline int isolated_task_work_queue(void) { return -ENOTSUPP; }
+static inline void isolated_task_work_init(struct task_struct *tsk) { }
+#endif /* CONFIG_NO_HZ_FULL_WORK */
+
 #endif /* _LINUX_SCHED_ISOLATION_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 35783a486c28..eca8242bd81d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4538,6 +4538,7 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
 	p->migration_pending = NULL;
 #endif
 	init_sched_mm_cid(p);
+	isolated_task_work_init(p);
 }
 
 DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 93b038d48900..d74c4ef91ce2 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -249,3 +249,26 @@ static int __init housekeeping_isolcpus_setup(char *str)
 	return housekeeping_setup(str, flags);
 }
 __setup("isolcpus=", housekeeping_isolcpus_setup);
+
+#ifdef CONFIG_NO_HZ_FULL_WORK
+static void isolated_task_work(struct callback_head *head)
+{
+}
+
+int __isolated_task_work_queue(void)
+{
+	if (current->flags & (PF_KTHREAD | PF_USER_WORKER | PF_IO_WORKER))
+		return -EINVAL;
+
+	guard(irqsave)();
+	if (task_work_queued(&current->nohz_full_work))
+		return 0;
+
+	return task_work_add(current, &current->nohz_full_work, TWA_RESUME);
+}
+
+void isolated_task_work_init(struct task_struct *tsk)
+{
+	init_task_work(&tsk->nohz_full_work, isolated_task_work);
+}
+#endif /* CONFIG_NO_HZ_FULL_WORK */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..50e0cada1e1b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -60,6 +60,7 @@
 #include <linux/stop_machine.h>
 #include <linux/syscalls_api.h>
 #include <linux/syscalls.h>
+#include <linux/task_work.h>
 #include <linux/tick.h>
 #include <linux/topology.h>
 #include <linux/types.h>
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index b0b97a60aaa6..34591fc50ab1 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -146,6 +146,18 @@ config NO_HZ_FULL
 
 endchoice
 
+config NO_HZ_FULL_WORK
+	bool "Full dynticks work flush on kernel exit"
+	depends on NO_HZ_FULL
+	help
+	 Selectively flush pending asynchronous kernel work upon user exit.
+	 Assuming userspace is not performing any critical isolated work while
+	 issuing syscalls, some per-CPU kernel works are flushed before resuming
+	 to userspace so that they don't get remotely queued later when the CPU
+	 doesn't want to be disturbed.
+
+	 If in doubt say N.
+
 config CONTEXT_TRACKING_USER
 	bool
 	depends on HAVE_CONTEXT_TRACKING_USER
-- 
2.48.1

