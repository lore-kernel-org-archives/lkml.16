Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEFD1F461D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871266; cv=none; b=AqV2fJoPizOq31297kPccYGXSARvXIZvHaLwJbg9usndiUZA3MLmthOxXQWC3EDs12FaK2mUW0UKz0h1Xuj5ng8OHo5FrmMsmUyHIbyg7ahlKKulbMCKBEfcUM6iQGDnU8k5HwaQT7DlViTzKawYtXlR4jDWN1DeENegpiwI5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871266; c=relaxed/simple;
	bh=3A/nS97NHAJTkWlaiypbzyqySMi04md3ZZ2+u2AUIGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjTK5P1uNO2Azdt5nu+PD/9ZCv1IzPlq5aKDyecaPlX1jXDoM5bQUtvPePiFZOAsS2FFfPeslnmGxHS6uPPlCVn6oGJvxaypzqpwjDDLr2GcHOSFPQam8wI3n/+pAJ8gOvDC+OK8UlEWMKyWg4RTNO9e4FLZa3cTDIyBKPyUAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=h98/2Hq3; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="h98/2Hq3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZxiwV20WeOLhn763SS/ToMhk4JltdQCVVeZkL2ebiuY=; b=h98/2Hq3yOu2vYbCejPYUBv9jW
	KHbVcXynUMm+8I2oYD4uGGHe0lKFdeONynUBI5cPzVUvOBajUPOcMszjpeKBb+IwZI31pt/AYfB0g
	Mi00AOg81Il3OZIwxLFDtHansrRQ9z7HQ7EW4vhu5WlvnoL6Gb3A4wtMZ6Wyt1Np8aNEsM0dPIgbX
	8iVX3bjUf9tEc06smVzZojxSqjMdAvOSBJ99AOvjDUWOtpOCvIFXTbK2zdHOTgwz+crNk1OML139D
	g2E2rw2s93hjYx/clycoMPZdEnl9qMpdPy5nfVQ6WStFaZCF5W3kXdUJSkkL4Cox8Sfkv5dvK+SZb
	b8VPcVwA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uM5Im-000000008IJ-0wB0;
	Mon, 02 Jun 2025 09:34:08 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	yu-cheng.yu@intel.com,
	Rik van Riel <riel@meta.com>,
	Rik van Riel <riel@surriel.com>,
	stable@kernel.org
Subject: [PATCH 1/3] x86/mm: Fix potential overflow in user_pcid_flush_mask
Date: Mon,  2 Jun 2025 09:30:55 -0400
Message-ID: <20250602133402.3385163-2-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133402.3385163-1-riel@surriel.com>
References: <20250602133402.3385163-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rik van Riel <riel@meta.com>

Currently no system with AMD INVLPGB support requires the page table
isolation mitigation. However, people could still enable PTI manually,
or a vulnerability could be found in the future that makes PTI useful
on certain AMD CPUs.

Additionally, there are systems that support Intel RAR TLB invalidation,
where PTI is a useful mitigation.

The combination of PTI and broadcast TLB flush has a problem:
- invalidate_user_asid() sets a bit corresponding to the process PCID in user_pcid_flush_mask
- SWITCH_TO_USER_CR3 tests and clears a bit corresponding to the process PCID in user_pcid_flush_mask

Enlarge user_pcid_flush_mask to fit the PCID numbers that can be present when
using broadcast TLB flushing. This takes up 256 or 512 bytes per CPU, depending
on whether or not page table isolation is built into the kernel.

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: c3ed3f5b2550 x86/mm: userspace & pageout flushing using Intel RAR
Cc: stable@kernel.org
---
 arch/x86/include/asm/tlbflush.h | 42 ++++++++++++++++++++++++++-------
 arch/x86/kernel/asm-offsets.c   |  2 ++
 arch/x86/mm/tlb.c               | 28 +++-------------------
 3 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..cc9935bbbd45 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -23,6 +23,31 @@ void __flush_tlb_all(void);
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
+#ifdef CONFIG_BROADCAST_TLB_FLUSH
+# define CR3_AVAIL_PCID_LONGS ((1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG)
+#else
+# define CR3_AVAIL_PCID_LONGS 1
+#endif
+
 void cr4_update_irqsoff(unsigned long set, unsigned long clear);
 unsigned long cr4_read_shadow(void);
 
@@ -115,14 +140,6 @@ struct tlb_state {
 	 */
 	u8 lam;
 #endif
-
-	/*
-	 * Mask that contains TLB_NR_DYN_ASIDS+1 bits to indicate
-	 * the corresponding user PCID needs a flush next time we
-	 * switch to it; see SWITCH_TO_USER_CR3.
-	 */
-	unsigned short user_pcid_flush_mask;
-
 	/*
 	 * Access to this CR4 shadow and to H/W CR4 is protected by
 	 * disabling interrupts when modifying either one.
@@ -149,6 +166,15 @@ struct tlb_state {
 	 * context 0.
 	 */
 	struct tlb_context ctxs[TLB_NR_DYN_ASIDS];
+
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
+	/*
+	 * Mask that contains TLB_NR_DYN_ASIDS+1 bits to indicate
+	 * the corresponding user PCID needs a flush next time we
+	 * switch to it; see SWITCH_TO_USER_CR3.
+	 */
+	unsigned long user_pcid_flush_mask[CR3_AVAIL_PCID_LONGS];
+#endif
 };
 DECLARE_PER_CPU_ALIGNED(struct tlb_state, cpu_tlbstate);
 
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 6259b474073b..8c41a2e5a53e 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -103,8 +103,10 @@ static void __used common(void)
 	BLANK();
 	DEFINE(PTREGS_SIZE, sizeof(struct pt_regs));
 
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 	/* TLB state for the entry code */
 	OFFSET(TLB_STATE_user_pcid_flush_mask, tlb_state, user_pcid_flush_mask);
+#endif
 
 	/* Layout info for cpu_entry_area */
 	OFFSET(CPU_ENTRY_AREA_entry_stack, cpu_entry_area, entry_stack_page);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..f5761e8be77f 100644
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
@@ -543,10 +524,7 @@ static void broadcast_tlb_flush(struct flush_tlb_info *info)
  */
 static inline void invalidate_user_asid(u16 asid)
 {
-	/* There is no user ASID if address space separation is off */
-	if (!IS_ENABLED(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION))
-		return;
-
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 	/*
 	 * We only have a single ASID if PCID is off and the CR3
 	 * write will have flushed it.
@@ -557,8 +535,8 @@ static inline void invalidate_user_asid(u16 asid)
 	if (!static_cpu_has(X86_FEATURE_PTI))
 		return;
 
-	__set_bit(kern_pcid(asid),
-		  (unsigned long *)this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask));
+	__set_bit(kern_pcid(asid), this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask[0]));
+#endif
 }
 
 static void load_new_mm_cr3(pgd_t *pgdir, u16 new_asid, unsigned long lam,
-- 
2.49.0

