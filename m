Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF41A2632
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364238; cv=none; b=QD9Gg0QfOH+osjZNcZN/MP2dhQKdgFovMtWrBXtjQxhQ0O8TIerVR1Q+i3jraD1stkqnbfEAvQ0tEO9AFQFW/Rz6D+kcDlgAovQpOBTk8wBCE9oC350B6STqaLJz6s4G0HLGkdmXFajqBHNG6pGY+ZZB14u2EmAFJ07+cUnSOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364238; c=relaxed/simple;
	bh=25nE3AP6G/VH0ulig6Pf87unBvwnVISmhX6u3B+80Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdGC+6OkGeX8esHySVjPBmUQcUEne0V/gP5KybcUiyv9omzRIoCn8Um78GPO5x2/hJgDR7dvVJcq/jwroYbfbadPKyux4ASMWaIs0aIZKmX8Gwfkjl1CsjjwdYXC0rPyLV58hYrFOqanpt+GeS9tjLLrGHzsB8kCxzbE0F751Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=EPZLF19T; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="EPZLF19T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ns8Xv98DYTXn1XvQ4Hh9ILsDIPyjR4wi8vgj74UOuo0=; b=EPZLF19TTDMFGIg2KqY2VbwNSn
	FCRnphDNqLCYGeHblOKha968zsEgzql6pX4bjeo3ArXmIsLdR0Zl5OtBwtVqs20efA/UZLbRgyIqH
	ncGpOeuyyAl7fB/y6Jmh/5NyfuOsZuep6GdO0Oiv6UnfzuSUNnitxaJZmiTN1lj4kOhHKhjKCB6W3
	Kl0RLnc7F8q2JjsBqjLuMZ70AQWMG5BUQnxUYe7OXcZw5pUcKi/MfYol577ZBh7IxfHop0czPvkfU
	9cKsBkx5ykhgbYQfA/pMrTgTJxwSdIBCVSnq0wS2+6Y1NxXUJujhNnuv+SThlRJH7JZvUPkVbnqpX
	ZUb4GTiA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSLV6-000000000CT-1sGz;
	Thu, 19 Jun 2025 16:04:44 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org,
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v4 6/8] x86/mm: use RAR for kernel TLB flushes
Date: Thu, 19 Jun 2025 16:03:58 -0400
Message-ID: <20250619200442.1694583-7-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619200442.1694583-1-riel@surriel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rik van Riel <riel@fb.com>

Use Intel RAR for kernel TLB flushes, when enabled.

Pass in PCID 0 to smp_call_rar_many() to flush the specified addresses,
regardless of which PCID they might be cached under in any destination CPU.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/mm/tlb.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..8931f7029d6c 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -21,6 +21,7 @@
 #include <asm/apic.h>
 #include <asm/msr.h>
 #include <asm/perf_event.h>
+#include <asm/rar.h>
 #include <asm/tlb.h>
 
 #include "mm_internal.h"
@@ -1468,6 +1469,18 @@ static void do_flush_tlb_all(void *info)
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
@@ -1475,6 +1488,8 @@ void flush_tlb_all(void)
 	/* First try (faster) hardware-assisted TLB invalidation. */
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_flush_all();
+	else if (cpu_feature_enabled(X86_FEATURE_RAR))
+		rar_flush_all();
 	else
 		/* Fall back to the IPI-based invalidation. */
 		on_each_cpu(do_flush_tlb_all, NULL, 1);
@@ -1504,15 +1519,36 @@ static void do_kernel_range_flush(void *info)
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
@@ -1521,6 +1557,8 @@ static void kernel_tlb_flush_range(struct flush_tlb_info *info)
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

