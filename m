Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D4244E9A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140231; cv=none; b=D+BKVbDk9FJ0Yc1Sdl5ra206X47Tf9ttqMcHQpOLogrevy/Om6gME/mTp5Yp9guZx+QbDWVrzpivqx0G1tAqVncRX+vlAoEwijiE+ZUiQIUI42kpypG+hHQBUudH8Zvwgvkl3QNbh3cTs6OevABd/o67gnwLrfk8DsnukWS5jRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140231; c=relaxed/simple;
	bh=jJC9e1iQUws78AISrOzytLZgqafLyxgOcIGGwKvAOvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vdb9qCDsPnzP4sPNuubpUAKzt4+qUWEc+yg+XIZgA2twmLeLyJ0AAbN1FjAharhviudaHYdc0EegLE2yWaPK4uqS3FZcn5N3r1HSsrztFvt8lIBMCRH4JxqfSvGGLJ7cOyKtin0Kq9R+R4rvZwC7QZfXLY+oTU67nqiKYTC31zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiznD3kz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiznD3kz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF1BC4CEDD;
	Sun,  9 Feb 2025 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140231;
	bh=jJC9e1iQUws78AISrOzytLZgqafLyxgOcIGGwKvAOvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OiznD3kzJiFVXddt6RYzafH2Caz7uSr1dddZCrIu/u3/8mczDP7ZEKGEDjOVW/9yB
	 btHfhsaIgyvr6xWqi13Em7VXQZrpIGjktay/irh2ACH0rVTRyVFuM/cwBj9P3YzoS2
	 HMYFygOMnWMB+fi00pTr3JpElh/O2dNQg8UHryyWUEt5erxMlSLx3vAWejp1Gl10L3
	 xA5YNFPcDwqlP5fBFm2Bie4loz+E0Sn1Zn5Yqu8KeIyjGU8ahnvAufLyvVx2ooEKYm
	 kmKPw2Hf1FhX5g2//fFphPUfZoIcVTp+CopdTmBHa2lkSa3i/yegVGmp+lerJO4ZiS
	 B3jytGQj0Lgew==
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
Subject: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
Date: Sun,  9 Feb 2025 23:30:04 +0100
Message-ID: <20250209223005.11519-7-frederic@kernel.org>
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

LRUs can be drained through several ways. One of them may add disturbances
to isolated workloads while queuing a work at any time to any target,
whether running in nohz_full mode or not.

Prevent from that on isolated tasks with defering LRUs drains upon
resuming to userspace using the isolated task work framework.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/swap.h     | 1 +
 kernel/sched/isolation.c | 3 +++
 mm/swap.c                | 8 +++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index b13b72645db3..a6fdcc04403e 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -406,6 +406,7 @@ extern void lru_add_drain(void);
 extern void lru_add_drain_cpu(int cpu);
 extern void lru_add_drain_cpu_zone(struct zone *zone);
 extern void lru_add_drain_all(void);
+extern void lru_add_and_bh_lrus_drain(void);
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
 extern void swap_setup(void);
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index f25a5cb33c0d..1f9ec201864c 100644
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
index fc8281ef4241..da1e569ee3ce 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -37,6 +37,7 @@
 #include <linux/page_idle.h>
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
+#include <linux/sched/isolation.h>
 
 #include "internal.h"
 
@@ -376,6 +377,8 @@ static void __lru_cache_activate_folio(struct folio *folio)
 	}
 
 	local_unlock(&cpu_fbatches.lock);
+
+	isolated_task_work_queue();
 }
 
 #ifdef CONFIG_LRU_GEN
@@ -738,7 +741,7 @@ void lru_add_drain(void)
  * the same cpu. It shouldn't be a problem in !SMP case since
  * the core is only one and the locks will disable preemption.
  */
-static void lru_add_and_bh_lrus_drain(void)
+void lru_add_and_bh_lrus_drain(void)
 {
 	local_lock(&cpu_fbatches.lock);
 	lru_add_drain_cpu(smp_processor_id());
@@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
 {
 	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
 
+	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
+		return false;
+
 	/* Check these in order of likelihood that they're not zero */
 	return folio_batch_count(&fbatches->lru_add) ||
 		folio_batch_count(&fbatches->lru_move_tail) ||
-- 
2.46.0

