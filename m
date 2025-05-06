Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E14A6539
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492553; cv=none; b=aQfuqyyMmntHl/PB49YZOrebTL7VkwEZ+Cfi2btmir3GjVyV83DZ3mAk9VHuf4y6BoBQvw5nwYcxIwGhTSEt20UIpKO/8LegYwv5eYX73gh/LcTJrbW7yHZPLcK/7M826jEKypbM8GtAt5/Z5NT9WoMIngH8Vv7SrOnfZrHWPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492553; c=relaxed/simple;
	bh=6u/tJ3IaLwF0dUse1JpxumzgYcS9QpDg2Qj+cUBlQPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkaoeMQH3ENKEiv2RlfO9APeseC6LtDglo8TUKMh3cV9S1yVr8yoY3BMCiCBX2CYdroGXxqsn68/DWoKrCq4KgMiAnRQuXfV7UVDeayUEckg/D0scT1DMgAtMwD4SeKv1AsUBWoP9xvST9EEJ5EuEYCchG0krZ4MxNdQvGkYjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-3uS9;
	Mon, 05 May 2025 20:38:14 -0400
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
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 8/9] x86/mm: use RAR for kernel TLB flushes
Date: Mon,  5 May 2025 20:37:46 -0400
Message-ID: <20250506003811.92405-9-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506003811.92405-1-riel@surriel.com>
References: <20250506003811.92405-1-riel@surriel.com>
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

Pass in PCID 0 to smp_call_rar_many() to flush kernel memory.

Unfortunately RAR_INVPCID_ADDR excludes global PTE mappings, so only
full flushes with RAR_INVPCID_ALL will flush kernel mappings.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/mm/tlb.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 7c61bf11d472..a4f3941281b6 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -21,6 +21,7 @@
 #include <asm/apic.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
+#include <asm/rar.h>
 #include <asm/tlb.h>
 
 #include "mm_internal.h"
@@ -1451,6 +1452,18 @@ static void do_flush_tlb_all(void *info)
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
@@ -1458,6 +1471,8 @@ void flush_tlb_all(void)
 	/* First try (faster) hardware-assisted TLB invalidation. */
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_flush_all();
+	else if (cpu_feature_enabled(X86_FEATURE_RAR))
+		rar_flush_all();
 	else
 		/* Fall back to the IPI-based invalidation. */
 		on_each_cpu(do_flush_tlb_all, NULL, 1);
@@ -1487,15 +1502,36 @@ static void do_kernel_range_flush(void *info)
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
@@ -1504,6 +1540,8 @@ static void kernel_tlb_flush_range(struct flush_tlb_info *info)
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

