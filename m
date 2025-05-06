Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA034AA88
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492569; cv=none; b=eTZa1kPymNvJZFoQA/grmGAk7RWiIT2xCb+lBd6+9wUgOyWw3BotGd6nqHCErcAhhEjqj32rw0SLwiaAL8/EbjukK0OvskvAGEx5LAOy1ScfIdZoflrxCm91IlPNLKGYkyEzoNOEZ+2PLOtajOmIaAzJklk1+J6S+aHO4/fpRDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492569; c=relaxed/simple;
	bh=NPJNsGlptd0n6PNy0NgeClvR6xPjLXuDITIWdR/228E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlUTWgwNATecdBafL++B631n5ocOb/FjbRO4ihxUDNuz+j3TLosqhDfAOW4V+oeJOQH+CAjG1/iI+T1L7vSbrZUAJSs7e9C+WF+hAOjoVr7ID0pHLfpfkhyDFSSn52VTuSRR79nHdZfhkveff9uKlEN619NEael/8xkLbZAinf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-3aS7;
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
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 5/9] x86/mm: Change cpa_flush() to call flush_kernel_range() directly
Date: Mon,  5 May 2025 20:37:43 -0400
Message-ID: <20250506003811.92405-6-riel@surriel.com>
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

The function cpa_flush() calls __flush_tlb_one_kernel() and
flush_tlb_all().

Replacing that with a call to flush_tlb_kernel_range() allows
cpa_flush() to make use of INVLPGB or RAR without any additional
changes.

Initialize invlpgb_count_max to 1, since flush_tlb_kernel_range()
can now be called before invlpgb_count_max has been initialized
to the value read from CPUID.

[riel: remove now unused __cpa_flush_tlb]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/kernel/cpu/amd.c    |  2 +-
 arch/x86/mm/pat/set_memory.c | 20 +++++++-------------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 13a48ec28f32..c85ecde786f3 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -31,7 +31,7 @@
 
 #include "cpu.h"
 
-u16 invlpgb_count_max __ro_after_init;
+u16 invlpgb_count_max __ro_after_init = 1;
 
 static inline int rdmsrq_amd_safe(unsigned msr, u64 *p)
 {
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 30ab4aced761..2454f5249329 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -399,15 +399,6 @@ static void cpa_flush_all(unsigned long cache)
 	on_each_cpu(__cpa_flush_all, (void *) cache, 1);
 }
 
-static void __cpa_flush_tlb(void *data)
-{
-	struct cpa_data *cpa = data;
-	unsigned int i;
-
-	for (i = 0; i < cpa->numpages; i++)
-		flush_tlb_one_kernel(fix_addr(__cpa_addr(cpa, i)));
-}
-
 static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
 
 static void cpa_collapse_large_pages(struct cpa_data *cpa)
@@ -444,6 +435,7 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
 
 static void cpa_flush(struct cpa_data *cpa, int cache)
 {
+	unsigned long start, end;
 	unsigned int i;
 
 	BUG_ON(irqs_disabled() && !early_boot_irqs_disabled);
@@ -453,10 +445,12 @@ static void cpa_flush(struct cpa_data *cpa, int cache)
 		goto collapse_large_pages;
 	}
 
-	if (cpa->force_flush_all || cpa->numpages > tlb_single_page_flush_ceiling)
-		flush_tlb_all();
-	else
-		on_each_cpu(__cpa_flush_tlb, cpa, 1);
+	start = fix_addr(__cpa_addr(cpa, 0));
+	end = fix_addr(__cpa_addr(cpa, cpa->numpages));
+	if (cpa->force_flush_all)
+		end = TLB_FLUSH_ALL;
+
+	flush_tlb_kernel_range(start, end);
 
 	if (!cache)
 		goto collapse_large_pages;
-- 
2.49.0

