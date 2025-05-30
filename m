Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87D284B5D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641376; cv=none; b=sSp1COezvFP6vFc2/a35J6SGxpd5dV7FBnBk+zIQCnBScc69IX6G0HThCInGufI86Ps/li6xKT2D4+1gQTTdJjeCspOnHg6WxYSJy7DQvbvLWQKf4mFkNmWsN1jVAJ/pLhu0ZO57mW0xVccmv9EFj0eBzPbklX1n9r4wh/e5Qjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641376; c=relaxed/simple;
	bh=8+1o7eC+aXD4pTRd5HL+sESwSenxb09dYygx6BjgbW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cGENnGGVPZj7XiRYYsrTRM+pPn9t7Xjf1KFwW/35MAvqXBxOI5qU2b1r9gF4Wvo9vQ8rBEZggnHlM1O8+YjYwqeiODvOTshXvVyUxQmEs0yLJUk+N3bX+zX7QorWmfTwa62BnjQaPXo3pvjtjY0D9Sm9ayL7oMajzgD0qKL3FLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=fpsqPKv6; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="fpsqPKv6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ykPXECAMeK1OqWn5lmkIdJuLH4t8PldZSUUZ0vl3P1A=; b=fpsqPKv6MHGg8b/Qk9oiYRzXHC
	Y6FWUpxvD1OKgE5NGV/zMoxG3eH6QUEetWUhFwJnTs9hUHVrGsM3Fob/LrdDZVfHqrDwi/iq9rNNz
	7qOC0mr2dopG1iD5oC7waNb4Y0lubN8BVa7Jq/gu5z/mW7fp4mob8TT+Z6a1Ys+Am2r6TUNPhfZvb
	6+/PwIxdDsnRP7bvWVwS9HBAqkQJygTWeaYDkwfPWnkX92AYWiHUvUerqaniJ38yazlpNz/s/M/7x
	iG94nZwzOfYkUbT4v96dQnMpWthASGYHGBPC+KB9Rt9MDok2Ru5F0yGvrBTDGF2nvJtYkQ2CmFWE6
	8skuJZUg==;
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uL7Tt-000000003OQ-0ZCj;
	Fri, 30 May 2025 17:41:37 -0400
Date: Fri, 30 May 2025 17:41:36 -0400
From: Rik van Riel <riel@surriel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: [PATCH v2] x86/mm: resize user_pcid_flush_mask for PTI / broadcast
 TLB flush combination
Message-ID: <20250530174136.61b8086a@fangorn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[re-sent]
---8<---
=46rom 96958fa1ed02e2434305fc7b0e37374eee899daf Mon Sep 17 00:00:00 2001
From: Rik van Riel <riel@meta.com>
Date: Fri, 16 May 2025 08:37:04 -0700
Subject: [PATCH] x86/mm: resize user_pcid_flush_mask for PTI / broadcast TL=
B flush combination

Currently no system with AMD INVLPGB support requires the page table
isolation mitigation. However, people could still enable PTI manually,
or a vulnerability could be found in the future that makes PTI useful
on certain AMD CPUs.

Additionally, there are systems that support Intel RAR TLB invalidation,
where PTI is a useful mitigation.

The combination of PTI and broadcast TLB flush has a problem:
- invalidate_user_asid() sets a bit corresponding to the process pcid in us=
er_pcid_flush_mask
- SWITCH_TO_USER_CR3 tests and clears a bit corresponding to the process PC=
ID in user_pcid_flush_mask

Enlarge user_pcid_flush_mask to fit the PCID numbers that can be present wh=
en
using broadcast TLB flushing. This takes up 256 or 512 bytes per CPU, depen=
ding
on whether or not page table isolation is built into the kernel.

Tested by force booting an AMD Milan system with pti=3Don.

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: c3ed3f5b2550 x86/mm: userspace & pageout flushing using Intel RAR
Cc: stable@kernel.org
---
 arch/x86/include/asm/tlbflush.h | 42 ++++++++++++++++++++++++++-------
 arch/x86/kernel/asm-offsets.c   |  2 ++
 arch/x86/mm/tlb.c               | 28 +++-------------------
 3 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflus=
h.h
index e9b81876ebe4..cc9935bbbd45 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -23,6 +23,31 @@ void __flush_tlb_all(void);
 #define TLB_FLUSH_ALL	-1UL
 #define TLB_GENERATION_INVALID	0
=20
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
=20
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
=20
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 6259b474073b..8c41a2e5a53e 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -103,8 +103,10 @@ static void __used common(void)
 	BLANK();
 	DEFINE(PTREGS_SIZE, sizeof(struct pt_regs));
=20
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 	/* TLB state for the entry code */
 	OFFSET(TLB_STATE_user_pcid_flush_mask, tlb_state, user_pcid_flush_mask);
+#endif
=20
 	/* Layout info for cpu_entry_area */
 	OFFSET(CPU_ENTRY_AREA_entry_stack, cpu_entry_area, entry_stack_page);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..f5761e8be77f 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -90,25 +90,6 @@
  *
  */
=20
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
@@ -543,10 +524,7 @@ static void broadcast_tlb_flush(struct flush_tlb_info =
*info)
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
=20
-	__set_bit(kern_pcid(asid),
-		  (unsigned long *)this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask));
+	__set_bit(kern_pcid(asid), this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mas=
k[0]));
+#endif
 }
=20
 static void load_new_mm_cr3(pgd_t *pgdir, u16 new_asid, unsigned long lam,
--=20
2.49.0



--=20
All rights reversed.
