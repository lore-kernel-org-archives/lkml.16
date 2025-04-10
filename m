Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77BF189F5C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298630; cv=none; b=HGwfjU+Txa8hFwo3h5rrX/ML+g6kNo/o9FH6Fg6HiJxku3o2+o2h6tRw/gliCs29hV6X5AUzao5aU/b9b4c+T3MmuoIBQVUfWCMi+YMVlFBZJnJ4vTlquCE5n9zTZV1RFewz6sgPZQU95fU8+M32db+SI7hNN18asBt7ilPaUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298630; c=relaxed/simple;
	bh=uy0c2oFcabCgEI0cFKHtoYjpr7+77MB0L7hpksyKfHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FY129U9vcKtit4xaQh00XN3FihaMMsJPT65G1mZ/KFZb9wFaz44mGlxFZEuJVtILZRbkoDHlb2nPAm2OchadOmvrjCEv5RXgjoPqIHUyfzdMO6SX+I4kCEHe+CEthKCo2biJB2Em6e3/bpr2RN+vh+1tDTqSmBUZZyPhhpQuCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBZB64Tv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBZB64Tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272C5C4CEDD;
	Thu, 10 Apr 2025 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298630;
	bh=uy0c2oFcabCgEI0cFKHtoYjpr7+77MB0L7hpksyKfHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cBZB64TvnjyyfMbQs693eWSSDRKWnwPO1MetMG7eHb3iXXOJZtEfa824H25luTplL
	 GepSJ+c/iNoAm6Dnc5W5ClEx7Abyoyp19dBkJFK4YXwJh1mgflHpvVwkluUr3NpBAr
	 9cVqcWIE1c2Iog8Dye5Mt999H4pFNFd7mkknWxblbA80ecio3iXYjHs3erzd5czkJh
	 A64lYdbYyb/3lv6cN4Pn60IC0KRcOQmo+6JNXZ6s8eLcmUQC45twqa4V4O7zgqEk0g
	 ekInDXHd4YWoMTGkyxGdhaV2Z4Rpurn9zxmBCO/9fQ0eehosPDGlOZosiWqymcqNXm
	 uDROZVeA9Lrtw==
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
Date: Thu, 10 Apr 2025 17:23:26 +0200
Message-ID: <20250410152327.24504-6-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410152327.24504-1-frederic@kernel.org>
References: <20250410152327.24504-1-frederic@kernel.org>
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
index b5ce76db6d75..4d764eb96e3e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1437,6 +1437,7 @@ struct task_struct {
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
index add41254b6e5..c8b8b61ac3a6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4524,6 +4524,7 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
 	p->migration_pending = NULL;
 #endif
 	init_sched_mm_cid(p);
+	isolated_task_work_init(p);
 }
 
 DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 81bc8b329ef1..e246287de9fa 100644
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
+		return -EINVAL;
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
index 47972f34ea70..e7dc4ae5ccc1 100644
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
2.48.1

