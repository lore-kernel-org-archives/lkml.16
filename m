Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06D1EA7D2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298634; cv=none; b=GF8ozlGaYw8tJD3yxxn7Rv4wvnfQjCuS7zDCd8yA95+dU/BFUdgnK9pPcfkMLOO5UXVfFXmYoni4Ie+1GVAmWEPApeprdwBNg7Iunfpx1+ptV8eV9qKbrZYYskCFv52aemFbRXONhb8plt78MAsZfekRMSwyn1XRIX6ZiFKESSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298634; c=relaxed/simple;
	bh=mUaotrL5SLp9Dul2a/IS6zLfFa040Gs6YVO08bgNqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvQXZmHLpqKx+HiFbMd6Md0FfEaFAjOEoCPhZAvDEWAA2KJWb9f7a088UWcMjk1cP7y+y8Y+1Py6Unu9kIJh9gAQ94O8idZE8rDRoxoSAkAHB2/m5l3SmQJH4NUOW0FeMDgtnxCEym16/O/wWrhFit5IGRQO2UD8mgZAjQUcEuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RW9KHCid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RW9KHCid"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09497C4CEDD;
	Thu, 10 Apr 2025 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298633;
	bh=mUaotrL5SLp9Dul2a/IS6zLfFa040Gs6YVO08bgNqSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RW9KHCid5MwDdaD5X2IFz/T1e97biRC12D1QXwfyy+s3NSH1Ro05JZ5YD8Q1ZNW1o
	 0QSePthhlFiAJuzXn/LHvY1akEowaX2Oqsjb4xYhFfMqZDTqwQAUtaSGTZ2SRfCI4h
	 fILGR7GF0FJzviUX7xNzYfB7XUeroyF5fobplI/6r2NK4LigzCM8fYo7d0eAEnYxS4
	 UhI6YxhP9u3MNv0jT7iukB/zfpHA4u0QsTaY13s2Z9LW1f3Z5EGRw0ZvSvrPrhJz2A
	 FUHr1+4q/KXsIwH4j7NZ/S2UP+TflYHDZsct17x9X5U5GZ2tzz2ge/zTyl4RTtRvNv
	 7DcXOyLdgeM2Q==
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
Subject: [PATCH 6/6] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
Date: Thu, 10 Apr 2025 17:23:27 +0200
Message-ID: <20250410152327.24504-7-frederic@kernel.org>
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

LRU batching can be source of disturbances for isolated workloads
running in the userspace because it requires kernel worker to handle
that and that would preempt the said task. The primary source for such
disruption would be __lru_add_drain_all which could be triggered from
non-isolated CPUs.

Why would an isolated CPU have anything on the pcp cache? Many syscalls
allocate pages that might end there. A typical and unavoidable one would
be fork/exec leaving pages on the cache behind just waiting for somebody
to drain.

Address the problem by noting a batch has been added to the cache and
schedule draining upon return to userspace so the work is done while the
syscall is still executing and there are no suprises while the task runs
in the userspace where it doesn't want to be preempted.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/pagevec.h  | 18 ++----------------
 include/linux/swap.h     |  1 +
 kernel/sched/isolation.c |  3 +++
 mm/swap.c                | 30 +++++++++++++++++++++++++++++-
 4 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 5d3a0cccc6bf..7e647b8df4c7 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -61,22 +61,8 @@ static inline unsigned int folio_batch_space(struct folio_batch *fbatch)
 	return PAGEVEC_SIZE - fbatch->nr;
 }
 
-/**
- * folio_batch_add() - Add a folio to a batch.
- * @fbatch: The folio batch.
- * @folio: The folio to add.
- *
- * The folio is added to the end of the batch.
- * The batch must have previously been initialised using folio_batch_init().
- *
- * Return: The number of slots still available.
- */
-static inline unsigned folio_batch_add(struct folio_batch *fbatch,
-		struct folio *folio)
-{
-	fbatch->folios[fbatch->nr++] = folio;
-	return folio_batch_space(fbatch);
-}
+unsigned int folio_batch_add(struct folio_batch *fbatch,
+			     struct folio *folio);
 
 /**
  * folio_batch_next - Return the next folio to process.
diff --git a/include/linux/swap.h b/include/linux/swap.h
index db46b25a65ae..8244475c2efe 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -401,6 +401,7 @@ extern void lru_add_drain(void);
 extern void lru_add_drain_cpu(int cpu);
 extern void lru_add_drain_cpu_zone(struct zone *zone);
 extern void lru_add_drain_all(void);
+extern void lru_add_and_bh_lrus_drain(void);
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
 extern void swap_setup(void);
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index e246287de9fa..553889f4e9be 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -8,6 +8,8 @@
  *
  */
 
+#include <linux/swap.h>
+
 enum hk_flags {
 	HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
 	HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
@@ -253,6 +255,7 @@ __setup("isolcpus=", housekeeping_isolcpus_setup);
 #if defined(CONFIG_NO_HZ_FULL)
 static void isolated_task_work(struct callback_head *head)
 {
+	lru_add_and_bh_lrus_drain();
 }
 
 int __isolated_task_work_queue(void)
diff --git a/mm/swap.c b/mm/swap.c
index 77b2d5997873..99a1b7b81e86 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -37,6 +37,7 @@
 #include <linux/page_idle.h>
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
+#include <linux/sched/isolation.h>
 
 #include "internal.h"
 
@@ -155,6 +156,29 @@ static void lru_add(struct lruvec *lruvec, struct folio *folio)
 	trace_mm_lru_insertion(folio);
 }
 
+/**
+ * folio_batch_add() - Add a folio to a batch.
+ * @fbatch: The folio batch.
+ * @folio: The folio to add.
+ *
+ * The folio is added to the end of the batch.
+ * The batch must have previously been initialised using folio_batch_init().
+ *
+ * Return: The number of slots still available.
+ */
+unsigned int folio_batch_add(struct folio_batch *fbatch,
+			     struct folio *folio)
+{
+	unsigned int ret;
+
+	fbatch->folios[fbatch->nr++] = folio;
+	ret = folio_batch_space(fbatch);
+	isolated_task_work_queue();
+
+	return ret;
+}
+EXPORT_SYMBOL(folio_batch_add);
+
 static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 {
 	int i;
@@ -738,7 +762,7 @@ void lru_add_drain(void)
  * the same cpu. It shouldn't be a problem in !SMP case since
  * the core is only one and the locks will disable preemption.
  */
-static void lru_add_and_bh_lrus_drain(void)
+void lru_add_and_bh_lrus_drain(void)
 {
 	local_lock(&cpu_fbatches.lock);
 	lru_add_drain_cpu(smp_processor_id());
@@ -864,6 +888,10 @@ static inline void __lru_add_drain_all(bool force_all_cpus)
 	for_each_online_cpu(cpu) {
 		struct work_struct *work = &per_cpu(lru_add_drain_work, cpu);
 
+		/* Isolated CPUs handle their cache upon return to userspace */
+		if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
+			continue;
+
 		if (cpu_needs_drain(cpu)) {
 			INIT_WORK(work, lru_add_drain_per_cpu);
 			queue_work_on(cpu, mm_percpu_wq, work);
-- 
2.48.1

