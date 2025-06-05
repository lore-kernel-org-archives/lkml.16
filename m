Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279B84E1C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141364; cv=none; b=XODpDKtA064wVlpz/0/DlgfN8cOBoDmqqkRGZKcx+K31xrX/mCAf8b7ufccIeY4QO3OhTtQJ7xV1tFI5rU7PRp0LFaBmiKa+OjsYwB+ar7T86l0URpFxrWk+DRmUl1tjlGBgXmbb6PWTBqxP7NjgSl2jM3Q4E4kNL15t7ifoF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141364; c=relaxed/simple;
	bh=25nE3AP6G/VH0ulig6Pf87unBvwnVISmhX6u3B+80Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6xEYWWpXo2bAH1C0JPUVugibcnW4Mw2CPMTNasrxwxUSqNaXNgKukCI8GH7O3ULNe+Qybc40zlE+O62K4DECeV28aWfpeTrj3jnGtURjxgvNmY6RbSerCRvlsfWa2npuLWA+3FZid+5kGrcSKBHbJoBagRKOOl6cxFAyBCq7PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=YZSE4cZM; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="YZSE4cZM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ns8Xv98DYTXn1XvQ4Hh9ILsDIPyjR4wi8vgj74UOuo0=; b=YZSE4cZMuEyy/ZGdbe4TPopc+t
	FJgE21DpYqbfrE4Ee6vXz1YtjoL27HDzkOsTIQhBOebUlYieZabacXcIfvPj5dZKE4GYForzu2VPB
	ZrUJZHyYbCQDXNJ8nhsnji7ESBXXYT1F9JsGG3Y4XL+ixd14r6OI37YVo7qlRk+LtPDp7WZBd9Tts
	dOvJeS6f0kSQOWrC8s+/2HgoLJNLiu6U8hB1jQFgLiYMM6yXwkH60XRGY0a0GSL9tegxz6xt4yC4r
	8l9FaIQFRLK9KaD9OlwpRaDc0eOJOsR/I9sAmfl53/yx2tGSQ0eVxq+z//AhZkeA7tS9zTK6//l5w
	3epVskog==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3faA;
	Thu, 05 Jun 2025 12:35:46 -0400
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
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 6/7] x86/mm: use RAR for kernel TLB flushes
Date: Thu,  5 Jun 2025 12:35:15 -0400
Message-ID: <20250605163544.3852565-7-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
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

