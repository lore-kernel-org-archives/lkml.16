Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962221931C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525810; cv=none; b=K40bCqfo8VJsV+W5C6fgwAGzwYNI8AqmQ9HpK0PfUIqxG19EWQ+SyYDEWRd3YTDSD6H3yBpRoOPFH5FTS6QaiXl7gWWjiVMHlEMgrY361WMn+VHvJ0y+7eusSOfCO3aMHbpLEmOSur5sh1ZUkZ9NQtBkKJxEk1xAVe51QN9d0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525810; c=relaxed/simple;
	bh=OLOwb1ooeYE8kEqHbAiwmAqVs2RQsyUhuURfPkAdAQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bV5LYikjTEvdgm3R015gPoEGV2LZexkyhgSxtvAABeqiIr3oXCEwKOCBjqrTxqVP/EWOoCVKRt9dMhzQiNdesUj63ivwi+mXrCPtoEMhd8k/fPEceVpJoVCbk9IaAg/GJ5L/RXwsehewl49yJvJ3f3mx1NLnuY0S7pprVwmIDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnEeISpW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnEeISpW"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-225429696a9so168194765ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525808; x=1744130608; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=J4EaWThVax9a+rwMhF6yZ1iQunAjXVQBx8Hy6/tixQ4=;
        b=lnEeISpW1dK+cEevA+wWDVeAveNKwsnIhg43db/iYyyEQatGqQXlIvSynAg3xPnT7a
         1JxZ1GbD79QXmvPJJgfmceLJUhcLCFcsG1jbQmOoo9aIkqMVAEis7LlWwRtizBuduCwm
         8mBuxE10G11ZepnKnNf3RcAPqyNOrqXcnA2KaYQFDmT4aQLUjYDlzP13BPuh+xaL6kak
         rs+we2AFZdYVwURJJ/HO7oFmL16W3fqTs7KFWeDgw/1/km1X1ddvDWUkaG3qJEreGfct
         TEdw+t+PRA3ed3hWqK04MqDQAPeS6bLnr938k7tLw2aU8wuVxm+AO0A2mhT8/LJ9A9dV
         91bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525808; x=1744130608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4EaWThVax9a+rwMhF6yZ1iQunAjXVQBx8Hy6/tixQ4=;
        b=RFAQgWGE2XXVFpMCW1QmI6DS7iI0Sj43hsm2Nf+SByB8eWJj5U38hrCd+UVkg8V3BQ
         U7FdLK36iPXVubK5cYMS1XoAFZy13waxM93NrOxJ9kRcNQGAYVwTk9UQ2Ws5gsho4fPG
         xo5wg9pGzviRF/5U3UosrMncV2HxS8ei9YyM9ygoLgzw8FPaezTAwNqAQufYp7dBp2+I
         ChiCH9GDuKwyYlZzQax/MDDIbU3/g6LJzVgg9YPh8sV2E2ZMkNhOSS/0tE6dYi2BArBw
         1OBi+2J5EYbeP8scPEkvsLZg5FqY3D7Sz8a64MyuzjSj1MiO8UgAp5esYy0iJjBOcSYz
         fidg==
X-Gm-Message-State: AOJu0Yxt7kMJfqhHzK6tycLS7FLOhH9fPvYSpDIzvsLZlBXXUZ0UTjLT
	LaYywyvenWz+AV84XHu0S2r/OP3Vifi6mf9wwBbhLtXBD0KnkIs64WIk7zpqUfZnnA5lMV/GwLN
	vgQ==
X-Google-Smtp-Source: AGHT+IG+549uJ+p5h+jsssZ8JRnj/shC1446VEr9mloO2RqS2MvoVJe5+Bo4jdQs31e7cn/R3826qBseTE8=
X-Received: from pfbde10.prod.google.com ([2002:a05:6a00:468a:b0:730:7b0c:592c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2383:b0:736:34a2:8a18
 with SMTP id d2e1a72fcca58-7398044db06mr17829997b3a.24.1743525808635; Tue, 01
 Apr 2025 09:43:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:34:47 -0700
In-Reply-To: <20250401163447.846608-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401163447.846608-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401163447.846608-9-seanjc@google.com>
Subject: [PATCH v2 8/8] x86/irq: KVM: Add helper for harvesting PIR to
 deduplicate KVM and posted MSIs
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that posted MSI and KVM harvesting of PIR is identical, extract the
code (and posted MSI's wonderful comment) to a common helper.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/posted_intr.h | 64 ++++++++++++++++++++++++++++++
 arch/x86/kernel/irq.c              | 50 ++---------------------
 arch/x86/kvm/lapic.c               | 16 +-------
 3 files changed, 69 insertions(+), 61 deletions(-)

diff --git a/arch/x86/include/asm/posted_intr.h b/arch/x86/include/asm/posted_intr.h
index c3e6e4221a5b..3198e4f217dc 100644
--- a/arch/x86/include/asm/posted_intr.h
+++ b/arch/x86/include/asm/posted_intr.h
@@ -1,8 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _X86_POSTED_INTR_H
 #define _X86_POSTED_INTR_H
+
+#include <asm/cmpxchg.h>
+#include <asm/rwonce.h>
 #include <asm/irq_vectors.h>
 
+#include <linux/bitmap.h>
+
 #define POSTED_INTR_ON  0
 #define POSTED_INTR_SN  1
 
@@ -26,6 +31,65 @@ struct pi_desc {
 	u32 rsvd[6];
 } __aligned(64);
 
+/*
+ * De-multiplexing posted interrupts is on the performance path, the code
+ * below is written to optimize the cache performance based on the following
+ * considerations:
+ * 1.Posted interrupt descriptor (PID) fits in a cache line that is frequently
+ *   accessed by both CPU and IOMMU.
+ * 2.During software processing of posted interrupts, the CPU needs to do
+ *   natural width read and xchg for checking and clearing posted interrupt
+ *   request (PIR), a 256 bit field within the PID.
+ * 3.On the other side, the IOMMU does atomic swaps of the entire PID cache
+ *   line when posting interrupts and setting control bits.
+ * 4.The CPU can access the cache line a magnitude faster than the IOMMU.
+ * 5.Each time the IOMMU does interrupt posting to the PIR will evict the PID
+ *   cache line. The cache line states after each operation are as follows,
+ *   assuming a 64-bit kernel:
+ *   CPU		IOMMU			PID Cache line state
+ *   ---------------------------------------------------------------
+ *...read64					exclusive
+ *...lock xchg64				modified
+ *...			post/atomic swap	invalid
+ *...-------------------------------------------------------------
+ *
+ * To reduce L1 data cache miss, it is important to avoid contention with
+ * IOMMU's interrupt posting/atomic swap. Therefore, a copy of PIR is used
+ * when processing posted interrupts in software, e.g. to dispatch interrupt
+ * handlers for posted MSIs, or to move interrupts from the PIR to the vIRR
+ * in KVM.
+ *
+ * In addition, the code is trying to keep the cache line state consistent
+ * as much as possible. e.g. when making a copy and clearing the PIR
+ * (assuming non-zero PIR bits are present in the entire PIR), it does:
+ *		read, read, read, read, xchg, xchg, xchg, xchg
+ * instead of:
+ *		read, xchg, read, xchg, read, xchg, read, xchg
+ */
+static __always_inline bool pi_harvest_pir(unsigned long *pir,
+					   unsigned long *pir_vals)
+{
+	unsigned long pending = 0;
+	int i;
+
+	for (i = 0; i < NR_PIR_WORDS; i++) {
+		pir_vals[i] = READ_ONCE(pir[i]);
+		pending |= pir_vals[i];
+	}
+
+	if (!pending)
+		return false;
+
+	for (i = 0; i < NR_PIR_WORDS; i++) {
+		if (!pir_vals[i])
+			continue;
+
+		pir_vals[i] = arch_xchg(&pir[i], 0);
+	}
+
+	return true;
+}
+
 static inline bool pi_test_and_set_on(struct pi_desc *pi_desc)
 {
 	return test_and_set_bit(POSTED_INTR_ON, (unsigned long *)&pi_desc->control);
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index 3753a8acd009..f7c6d94cf070 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -375,58 +375,14 @@ void intel_posted_msi_init(void)
 	this_cpu_write(posted_msi_pi_desc.ndst, destination);
 }
 
-/*
- * De-multiplexing posted interrupts is on the performance path, the code
- * below is written to optimize the cache performance based on the following
- * considerations:
- * 1.Posted interrupt descriptor (PID) fits in a cache line that is frequently
- *   accessed by both CPU and IOMMU.
- * 2.During posted MSI processing, the CPU needs to do 64-bit read and xchg
- *   for checking and clearing posted interrupt request (PIR), a 256 bit field
- *   within the PID.
- * 3.On the other side, the IOMMU does atomic swaps of the entire PID cache
- *   line when posting interrupts and setting control bits.
- * 4.The CPU can access the cache line a magnitude faster than the IOMMU.
- * 5.Each time the IOMMU does interrupt posting to the PIR will evict the PID
- *   cache line. The cache line states after each operation are as follows:
- *   CPU		IOMMU			PID Cache line state
- *   ---------------------------------------------------------------
- *...read64					exclusive
- *...lock xchg64				modified
- *...			post/atomic swap	invalid
- *...-------------------------------------------------------------
- *
- * To reduce L1 data cache miss, it is important to avoid contention with
- * IOMMU's interrupt posting/atomic swap. Therefore, a copy of PIR is used
- * to dispatch interrupt handlers.
- *
- * In addition, the code is trying to keep the cache line state consistent
- * as much as possible. e.g. when making a copy and clearing the PIR
- * (assuming non-zero PIR bits are present in the entire PIR), it does:
- *		read, read, read, read, xchg, xchg, xchg, xchg
- * instead of:
- *		read, xchg, read, xchg, read, xchg, read, xchg
- */
 static __always_inline bool handle_pending_pir(unsigned long *pir, struct pt_regs *regs)
 {
-	unsigned long pir_copy[NR_PIR_WORDS], pending = 0;
-	int i, vec = FIRST_EXTERNAL_VECTOR;
+	unsigned long pir_copy[NR_PIR_WORDS];
+	int vec = FIRST_EXTERNAL_VECTOR;
 
-	for (i = 0; i < NR_PIR_WORDS; i++) {
-		pir_copy[i] = READ_ONCE(pir[i]);
-		pending |= pir_copy[i];
-	}
-
-	if (!pending)
+	if (!pi_harvest_pir(pir, pir_copy))
 		return false;
 
-	for (i = 0; i < NR_PIR_WORDS; i++) {
-		if (!pir_copy[i])
-			continue;
-
-		pir_copy[i] = arch_xchg(&pir[i], 0);
-	}
-
 	for_each_set_bit_from(vec, pir_copy, FIRST_SYSTEM_VECTOR)
 		call_irq_handler(vec, regs);
 
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 13363327ad87..1c611b84b8ab 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -657,7 +657,7 @@ static u8 count_vectors(void *bitmap)
 
 bool __kvm_apic_update_irr(unsigned long *pir, void *regs, int *max_irr)
 {
-	unsigned long pir_vals[NR_PIR_WORDS], pending = 0;
+	unsigned long pir_vals[NR_PIR_WORDS];
 	u32 *__pir = (void *)pir_vals;
 	u32 i, vec;
 	u32 irr_val, prev_irr_val;
@@ -666,21 +666,9 @@ bool __kvm_apic_update_irr(unsigned long *pir, void *regs, int *max_irr)
 	max_updated_irr = -1;
 	*max_irr = -1;
 
-	for (i = 0; i < NR_PIR_WORDS; i++) {
-		pir_vals[i] = READ_ONCE(pir[i]);
-		pending |= pir_vals[i];
-	}
-
-	if (!pending)
+	if (!pi_harvest_pir(pir, pir_vals))
 		return false;
 
-	for (i = 0; i < NR_PIR_WORDS; i++) {
-		if (!pir_vals[i])
-			continue;
-
-		pir_vals[i] = arch_xchg(&pir[i], 0);
-	}
-
 	for (i = vec = 0; i <= 7; i++, vec += 32) {
 		u32 *p_irr = (u32 *)(regs + APIC_IRR + i * 0x10);
 
-- 
2.49.0.472.ge94155a9ec-goog

