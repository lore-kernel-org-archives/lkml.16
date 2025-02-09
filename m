Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D156C22F380
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140228; cv=none; b=AWdrCEifnpUTaeW+oAzhVbQ5Qdq7q+jtxM3tADXsBXsWzwCydhcgOBjsTf+z0tnqI5FqyTq9kKhkwSnVckVm/AZT5x+L4BBSOdVyf7dV8xisjFM8+f3JrsRu/O0CTmCicPaDRsrt2npfrc4DpjYErBILQX1VTW9+cGxuhWqX0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140228; c=relaxed/simple;
	bh=hpX5Isxts6HZwFzDaFwdkHMytRYO5OiHbV2gKBTOr1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUEH2w3zFYVLeGSNi3Q/nCaRPwYl/jt5M++Es774FzSEQ/ArxssP/LYe5rTpI5iFpq1CvXtc4lm5M+27zKd895hQLm0VLdckAfNeGzKycFvZPqNaHOknesj5pFw+RZsYFrkeJTbWpwUW83LKFq8ebRuflYsxXCejItSwkS+33IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZCOzR8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZCOzR8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99927C4CEE7;
	Sun,  9 Feb 2025 22:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140228;
	bh=hpX5Isxts6HZwFzDaFwdkHMytRYO5OiHbV2gKBTOr1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZCOzR8nKDpcLHHG+pUeg6XDkn23fPlzAQdzNGIId4ORHo4fyoa7vHVWO+9GkTzkQ
	 rOAL8y9B5yI2fOD/bhpjqte9Ww4uACLQTLAGJ7r1DQtJK++Vu0v3ysxhrN0ae+AgmQ
	 YOyoQmsrC1+06KU7jI2g+OOWGuThvARFCN82GCvxhURurB94W68F854JlfHd+gjI/a
	 0/Stpzb4hrHV3Z5A+rddkQ5H4Tgmv46ELAZEuc240GNCyulpPTbhMuHJ6crLPOE0lC
	 nHBhpPNlvMIz9X+ja6w5uCnxjlAC7wDmN5gdKhX0MbzYNyOsJ0RJfSxRqIBmfDVKDm
	 lGvlFEzyz5cCw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 5/6 v2] sched/isolation: Introduce isolated task work
Date: Sun,  9 Feb 2025 23:30:03 +0100
Message-ID: <20250209223005.11519-6-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250209223005.11519-1-frederic@kernel.org>
References: <20250209223005.11519-1-frederic@kernel.org>
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
 include/linux/sched.h           |  1 +
 include/linux/sched/isolation.h | 17 +++++++++++++++++
 kernel/sched/core.c             |  1 +
 kernel/sched/isolation.c        | 31 +++++++++++++++++++++++++++++++
 kernel/sched/sched.h            |  1 +
 5 files changed, 51 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 10a9aa41b43a..82827f962745 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1410,6 +1410,7 @@ struct task_struct {
 #endif
 
 #ifdef CONFIG_NO_HZ_FULL
+	struct callback_head		nohz_full_work;
 	atomic_t			tick_dep_mask;
 #endif
 
diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index d8501f4709b5..74da4324b984 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -77,4 +77,21 @@ static inline bool cpu_is_isolated(int cpu)
 	       cpuset_cpu_is_isolated(cpu);
 }
 
+#if defined(CONFIG_NO_HZ_FULL)
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
+#endif /* CONFIG_NO_HZ_FULL */
+
 #endif /* _LINUX_SCHED_ISOLATION_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 606f596a6e0d..78b4b996f85d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4525,6 +4525,7 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
 	p->migration_pending = NULL;
 #endif
 	init_sched_mm_cid(p);
+	isolated_task_work_init(p);
 }
 
 DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 81bc8b329ef1..f25a5cb33c0d 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -249,3 +249,34 @@ static int __init housekeeping_isolcpus_setup(char *str)
 	return housekeeping_setup(str, flags);
 }
 __setup("isolcpus=", housekeeping_isolcpus_setup);
+
+#if defined(CONFIG_NO_HZ_FULL)
+static void isolated_task_work(struct callback_head *head)
+{
+}
+
+int __isolated_task_work_queue(void)
+{
+	unsigned long flags;
+	int ret;
+
+	if (current->flags & PF_KTHREAD)
+		return 0;
+
+	local_irq_save(flags);
+	if (task_work_queued(&current->nohz_full_work)) {
+		ret = 0;
+		goto out;
+	}
+
+	ret = task_work_add(current, &current->nohz_full_work, TWA_RESUME);
+out:
+	local_irq_restore(flags);
+	return ret;
+}
+
+void isolated_task_work_init(struct task_struct *tsk)
+{
+	init_task_work(&tsk->nohz_full_work, isolated_task_work);
+}
+#endif /* CONFIG_NO_HZ_FULL */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 38e0e323dda2..f80dc1cad219 100644
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
-- 
2.46.0

