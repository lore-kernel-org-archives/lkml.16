Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134728981C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229891; cv=none; b=i4CrZ3THFzaO6+texvIz7n/ITU5dKDa9mgksnncmKutwcgu423NQT8n5GTpGUOH7MpWkoM9gyCbmY2vsss1guY4ldEVgRtWUYTAOvW2fgWj/9l0KMYWc+OAwFslA9kZ4HP6jPlqFGeAKBmk+MEmN+Ls9lPhkJ0zYVZYYf8KmZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229891; c=relaxed/simple;
	bh=pdRvUV9h/SGutwunhxJKENeXCkz2Vk2NqMFNvihGUhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYSSS+QBQs9i92g+6e/tzDheCXJUi/tTj9XKmgebqDYq05n/k5dA3ybK6bEvHV5sAQOhdZ3nwnaMxAMk8yi2ljhJNYXDOuYhoPrRvYcXkIexHXRw5XUHdNi929v3wVqr7yC3WlnI3Bk2+FnKp5Yw5PZY44WCHxg4GDO8WUB36Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=dD7xrdwF; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="dD7xrdwF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CdjWnwKuJqKe6pzZkRWk+shJN45H1hDdYXeyHoLpWq8=; b=dD7xrdwF4vK6419z7zXXVKFcap
	gNvWx/sGPSMBE7h6OobnmSKrHtlNHh3Gt2xW8qAYOxIpFAeaHICmwbGNG3RSBj6O2ojRPnZv37VOo
	PPEmZ0ymlSk2MMjVArGAtZWWAJQYLc2LnKnuKiITlxIqX6Hs0mZMbI6oweZmAj6VBR5Ey8BrKa4YP
	VMtrRoUbzPrvQFmaYpEiHOsU3++J+nuZkRnvDiK7F4ZV0bOhPHoejVCN1TksQpVcKZW/CL+z0J+gi
	odd+/xeNTl6zD4b0XcSYPaYtq0ONzuuwLJ7YzGI8M9f222gkUy/9WdxHD/rHEKUe9w74YVqsTVvnu
	Mkq1BiLQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNab3-000000006Se-1dFD;
	Fri, 06 Jun 2025 13:11:13 -0400
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
	Rik van Riel <riel@meta.com>,
	Rik van Riel <riel@surriel.com>,
	stable@kernel.org
Subject: [PATCH v2 1/3] x86/mm: Fix potential overflow in user_pcid_flush_mask
Date: Fri,  6 Jun 2025 13:10:33 -0400
Message-ID: <20250606171112.4013261-2-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606171112.4013261-1-riel@surriel.com>
References: <20250606171112.4013261-1-riel@surriel.com>
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

The combination of PTI and broadcast TLB flush has a problem:
- invalidate_user_asid() sets a bit corresponding to the process PCID in user_pcid_flush_mask
- SWITCH_TO_USER_CR3 tests and clears a bit corresponding to the process PCID in user_pcid_flush_mask

When using only ASIDs 0-5 this does not cause any issues,
because only PCID numbers 1-6 ever get used.

However, with broadcast TLB flushing PCID numbers up to 2048
can be used, leading to an overflow of the user_pcid_flush_mask,
if a system using INVLPGB is booted with the pti=on option.

Enlarge user_pcid_flush_mask to fit the PCID numbers that can be present
when using broadcast TLB flushing. This takes up 256 or 512 bytes per CPU,
depending on whether or not page table isolation is built into the kernel.

Signed-off-by: Rik van Riel <riel@surriel.com>
Fixes: c3ed3f5b2550 x86/mm: userspace & pageout flushing using Intel RAR
Cc: stable@kernel.org
---
 arch/x86/include/asm/tlbflush.h | 49 +++++++++++++++++++++++++++------
 arch/x86/mm/tlb.c               | 22 +--------------
 2 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..401e93958022 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -23,6 +23,40 @@ void __flush_tlb_all(void);
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
+/*
+ * With page table isolation, the user_pcid_flush_mask is used to indicate
+ * that the TLB for a process needs to be flushed when switching to user
+ * space. Broadcast TLB flushing uses more PCIDs, and a larger bitmap.
+ */
+#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
+# ifdef CONFIG_BROADCAST_TLB_FLUSH
+#  define CR3_AVAIL_PCID_LONGS ((1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG)
+# else
+#  define CR3_AVAIL_PCID_LONGS 1
+# endif
+#else
+# define CR3_AVAIL_PCID_LONGS 0
+#endif
+
 void cr4_update_irqsoff(unsigned long set, unsigned long clear);
 unsigned long cr4_read_shadow(void);
 
@@ -115,14 +149,6 @@ struct tlb_state {
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
@@ -149,6 +175,13 @@ struct tlb_state {
 	 * context 0.
 	 */
 	struct tlb_context ctxs[TLB_NR_DYN_ASIDS];
+
+	/*
+	 * Mask that contains TLB_NR_DYN_ASIDS+1 bits to indicate
+	 * the corresponding user PCID needs a flush next time we
+	 * switch to it; see SWITCH_TO_USER_CR3.
+	 */
+	unsigned long user_pcid_flush_mask[CR3_AVAIL_PCID_LONGS];
 };
 DECLARE_PER_CPU_ALIGNED(struct tlb_state, cpu_tlbstate);
 
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..fceec13a05c1 100644
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
@@ -557,8 +538,7 @@ static inline void invalidate_user_asid(u16 asid)
 	if (!static_cpu_has(X86_FEATURE_PTI))
 		return;
 
-	__set_bit(kern_pcid(asid),
-		  (unsigned long *)this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask));
+	__set_bit(kern_pcid(asid), this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask[0]));
 }
 
 static void load_new_mm_cr3(pgd_t *pgdir, u16 new_asid, unsigned long lam,
-- 
2.49.0

