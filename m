Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA1254871
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703059; cv=none; b=H4qsX8yDOnbjQsUaO6noLbimIU14UV62gwI2jTtcSNNHx8JrLFgsS6yPC4UrS07rOt0Jk7xmo9T51mhESYEcq8MqiWZ7g2ETdEgy5dNhJQ3PWvyG9tbPLGUTBKNEBrNSqlr+cD6nVizu1x29lyjcCZw6EqaTmhGmv+1HQIsUAC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703059; c=relaxed/simple;
	bh=+4lCb+L3hsek/DK0bB2KYv8u8TmmG0TuORKcg/bHmiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9wFeq2LR6YwtB6FwpZ8V4v+Hy2cxGG0pb8ypb6Prjz0NY0pvAkZmLsRwaFffmzUj5+PX672KKn3sz1z4wCMpzEf8X9lVRM14BvPKmWUStaI//IyDzmUHGHfLqKqUTPSIqVkMGr6F+82u78yGufeXsAVef5fScGyFFzaVAGwP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHBOd-000000000aB-0U7Z;
	Mon, 19 May 2025 21:03:55 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	nadav.amit@gmail.com,
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC v2 8/9] x86/mm: use RAR for kernel TLB flushes
Date: Mon, 19 May 2025 21:02:33 -0400
Message-ID: <20250520010350.1740223-9-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520010350.1740223-1-riel@surriel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

From: Rik van Riel <riel@fb.com>

Use Intel RAR for kernel TLB flushes, when enabled.

Pass in PCID 0 to smp_call_rar_many() to flush the specified addresses,
regardless of which PCID they might be cached under in any destination CPU.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/mm/rar.c |  4 ++--
 arch/x86/mm/tlb.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/rar.c b/arch/x86/mm/rar.c
index 16dc9b889cbd..9a18c926ea7b 100644
--- a/arch/x86/mm/rar.c
+++ b/arch/x86/mm/rar.c
@@ -142,8 +142,8 @@ void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
 	 * send smp call function interrupt to this cpu and as such deadlocks
 	 * can't happen.
 	 */
-	WARN_ON_ONCE(cpu_online(this_cpu) && irqs_disabled()
-		     && !oops_in_progress && !early_boot_irqs_disabled);
+	if (cpu_online(this_cpu) && !oops_in_progress && !early_boot_irqs_disabled)
+		lockdep_assert_irqs_enabled();
 
 	/* Try to fastpath.  So, what's a CPU they want?  Ignoring this one. */
 	cpu = cpumask_first_and(mask, cpu_online_mask);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f5761e8be77f..35489df811dc 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -21,6 +21,7 @@
 #include <asm/apic.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
+#include <asm/rar.h>
 #include <asm/tlb.h>
 
 #include "mm_internal.h"
@@ -1446,6 +1447,18 @@ static void do_flush_tlb_all(void *info)
 	__flush_tlb_all();
 }
 
+static void rar_full_flush(const cpumask_t *cpumask)
+{
+	guard(preempt)();
+	smp_call_rar_many(cpumask, 0, 0, TLB_FLUSH_ALL);
+	invpcid_flush_all();
+}
+
+static void rar_flush_all(void)
+{
+	rar_full_flush(cpu_online_mask);
+}
+
 void flush_tlb_all(void)
 {
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
@@ -1453,6 +1466,8 @@ void flush_tlb_all(void)
 	/* First try (faster) hardware-assisted TLB invalidation. */
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_flush_all();
+	else if (cpu_feature_enabled(X86_FEATURE_RAR))
+		rar_flush_all();
 	else
 		/* Fall back to the IPI-based invalidation. */
 		on_each_cpu(do_flush_tlb_all, NULL, 1);
@@ -1482,15 +1497,36 @@ static void do_kernel_range_flush(void *info)
 	struct flush_tlb_info *f = info;
 	unsigned long addr;
 
+	/*
+	 * With PTI kernel TLB entries in all PCIDs need to be flushed.
+	 * With RAR the PCID space becomes so large, we might as well flush it all.
+	 *
+	 * Either of the two by itself works with targeted flushes.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_RAR) &&
+	    cpu_feature_enabled(X86_FEATURE_PTI)) {
+		invpcid_flush_all();
+		return;
+	}
+
 	/* flush range by one by one 'invlpg' */
 	for (addr = f->start; addr < f->end; addr += PAGE_SIZE)
 		flush_tlb_one_kernel(addr);
 }
 
+static void rar_kernel_range_flush(struct flush_tlb_info *info)
+{
+	guard(preempt)();
+	smp_call_rar_many(cpu_online_mask, 0, info->start, info->end);
+	do_kernel_range_flush(info);
+}
+
 static void kernel_tlb_flush_all(struct flush_tlb_info *info)
 {
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_flush_all();
+	else if (cpu_feature_enabled(X86_FEATURE_RAR))
+		rar_flush_all();
 	else
 		on_each_cpu(do_flush_tlb_all, NULL, 1);
 }
@@ -1499,6 +1535,8 @@ static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 {
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_kernel_range_flush(info);
+	else if (cpu_feature_enabled(X86_FEATURE_RAR))
+		rar_kernel_range_flush(info);
 	else
 		on_each_cpu(do_kernel_range_flush, info, 1);
 }
-- 
2.49.0

