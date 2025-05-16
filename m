Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C631D5CED
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413665; cv=none; b=jxvj7hvm9VC34l9wvLhOldc0GLrzXslvr2wMmkFmOJ5Q2hEeBIm66FO+GkuwkzWHJyihJOEhNoJB/xw+6pLs0M9920GC36Q3pS63qK8j9BHAEYyP1TUku9iiPeN14jfX+kCkTlL+HASCe+x+ifFj6wz1XH1appIG/zNlKBlVbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413665; c=relaxed/simple;
	bh=SbLJnw7SOD8K7+g2wLHqb9CIOTD6uo/fYzt5TOvdEYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6ItqlFhJyXGjKF/7NacCTr8vmPSRA37yKbIFe9x0zEkcMd3w7Ki0oXS+SRutzA/IQYuTIR8Esok6apdRyq5QvLvHNH5+V1EmmEeV0gD33jZUiZcgmV+VCaHhUl1S1nxPU5IiVaDu5L7EGUiKC7FRwFjCwQIMCLEDfmFw+Faq6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uFxzq-0000000047a-0wXp;
	Fri, 16 May 2025 12:33:18 -0400
Date: Fri, 16 May 2025 12:33:17 -0400
From: Rik van Riel <riel@surriel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: [PATCH] x86/mm: resize user_pcid_flush_mask for PTI / broadcast TLB
 flush combination
Message-ID: <20250516123317.70506358@fangorn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: riel@surriel.com

Currently no system with AMD INVLPGB support requires the page table
isolation mitigation. However, people could still enable PTI manually,
or a vulnerability could be found in the future that makes PTI useful
on certain AMD CPUs.

Additionally, there are systems that support Intel RAR TLB invalidation,
where PTI is a useful mitigation.

The combination of PTI and broadcast TLB flush has a problem:
- invalidate_user_asid() sets a bit corresponding to the process PCID
- SWITCH_TO_USER_CR3 tests and clears a bit corresponding to the process PCID

However, the PCIDs no longer fit in the range 0-6 when using global ASIDs.

Enlarge user_pcid_flush_mask to fit the PCID numbers that can be present when
using broadcast TLB flushing. This takes up 256 or 512 bytes per CPU, depending
on whether or not page table isolation is built into the kernel.

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: c3ed3f5b2550 x86/mm: userspace & pageout flushing using Intel RAR
Cc: stable@kernel.org
---
 arch/x86/include/asm/tlbflush.h | 23 +++++++++++++++++++++++
 arch/x86/mm/tlb.c               | 19 -------------------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..9a1317e0f140 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -23,6 +23,25 @@ void __flush_tlb_all(void);
 #define TLB_FLUSH_ALL	-1UL
 #define TLB_GENERATION_INVALID	0
 
+/*
+ * When enabled, MITIGATION_PAGE_TABLE_ISOLATION consumes a single bit for
+ * user/kernel switches
+ */
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
+# define PTI_CONSUMED_PCID_BITS	1
+#else
+# define PTI_CONSUMED_PCID_BITS	0
+#endif
+
+#define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS)
+
+/*
+ * ASIDs are zero-based: 0->MAX_AVAIL_ASID are valid.  -1 below to account
+ * for them being zero-based.  Another -1 is because PCID 0 is reserved for
+ * use by non-PCID-aware users.
+ */
+#define MAX_ASID_AVAILABLE ((1 << CR3_AVAIL_PCID_BITS) - 2)
+
 void cr4_update_irqsoff(unsigned long set, unsigned long clear);
 unsigned long cr4_read_shadow(void);
 
@@ -121,7 +140,11 @@ struct tlb_state {
 	 * the corresponding user PCID needs a flush next time we
 	 * switch to it; see SWITCH_TO_USER_CR3.
 	 */
+#if defined(CONFIG_X86_TLB_BROADCAST_TLB_FLUSH) && defined(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION)
+	unsigned long user_pcid_flush_mask[(1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG];
+#else
 	unsigned short user_pcid_flush_mask;
+#endif
 
 	/*
 	 * Access to this CR4 shadow and to H/W CR4 is protected by
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..40b40b36d257 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -90,25 +90,6 @@
  *
  */
 
-/*
- * When enabled, MITIGATION_PAGE_TABLE_ISOLATION consumes a single bit for
- * user/kernel switches
- */
-#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
-# define PTI_CONSUMED_PCID_BITS	1
-#else
-# define PTI_CONSUMED_PCID_BITS	0
-#endif
-
-#define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS)
-
-/*
- * ASIDs are zero-based: 0->MAX_AVAIL_ASID are valid.  -1 below to account
- * for them being zero-based.  Another -1 is because PCID 0 is reserved for
- * use by non-PCID-aware users.
- */
-#define MAX_ASID_AVAILABLE ((1 << CR3_AVAIL_PCID_BITS) - 2)
-
 /*
  * Given @asid, compute kPCID
  */
-- 
2.49.0

