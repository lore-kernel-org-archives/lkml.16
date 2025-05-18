Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A617E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747527223; cv=none; b=pDD7Sdj/tNbSCciA1ik6d9wz/RmHLggygcniHvuwPwMuYHoFjjuqb4yRFuZEz5kg4ivsC7B/bwPe5j1j8o22kWW9PGs0FmoRBkWW1ceyr/3iNjtGguRFaXnBF9rDnzpsWXQgTQSMB9zvXDaEhk5rMKSCDVN76fsIwNfdnmrV4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747527223; c=relaxed/simple;
	bh=0hUhlD1OKk8+z6x2z8kg72vOw3yVMiAgJJuoBs3o1pM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZ91kukRCIVmSMDGajVLN+zc7DHLoyt9XaAuOIbpALZbM3QeZW2OU9OazJ3nE9Xo6K4EAvaOYmu8wFnZPEIBdwb4D32FAvC0ydyl37xnxzibeO8BEWnh28x7VXB5HSCO0E2e0pA83Qap6iDrFuuSsHzNjDzX9yWNJQICm49pvSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uGReB-000000002FQ-3eKg;
	Sat, 17 May 2025 20:12:55 -0400
Date: Sat, 17 May 2025 20:12:55 -0400
From: Rik van Riel <riel@surriel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2] x86/mm: resize user_pcid_flush_mask for PTI / broadcast
 TLB flush combination
Message-ID: <20250517201255.1bc4e61b@fangorn>
In-Reply-To: <aChB9ORFxaL8VfyD@gmail.com>
References: <20250516123317.70506358@fangorn>
	<aChB9ORFxaL8VfyD@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: riel@surriel.com

On Sat, 17 May 2025 09:59:48 +0200
Ingo Molnar <mingo@kernel.org> wrote:

> [many good suggestions]

Thank you for your suggestions. The code looks better now, and the
compiler almost allowed all of your ideas, with the one difference
being that gcc 14.2.1 is unhappy when passing ___set_bit() a
pointer to an array of unsigned longs:

In file included from ./arch/x86/include/asm/bitops.h:430,
                 from ./include/linux/bitops.h:68:
./include/asm-generic/bitops/instrumented-non-atomic.h:26:54: note:
expected =E2=80=98volatile long unsigned int *=E2=80=99 but argument is of =
type =E2=80=98long
unsigned int (*)[32]=E2=80=99
   26 | ___set_bit(unsigned long nr, volatile unsigned long *addr)
      |             =20

But it is perfectly happy with getting the address of the first long
in that array, which works for both array size 1 and array size 32.

Thank you!

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

