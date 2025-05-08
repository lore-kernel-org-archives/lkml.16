Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576DA2797AE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716570; cv=none; b=fVNgbLEjWCkzsBsSDdXhWelZm5PG70oArlqqn8rGurthxhC0imyBRgqIB0JROgpIz/YpzynbeMhJKFVSBxd5dwcAXlhDZ/2j6hbrcgRFYT/qX3+Bsnutxpa02ytst/sZzs0TpjDH+rQVuc8WSsi7epriO4Yyo/Q3EBwyEcZoWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716570; c=relaxed/simple;
	bh=Av8ETro96thT4uWT57XyQ4plbzhxSuQwb4JgRF1q7Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPZV6EOZ+YVgES/2Yhh28EEoKnZVoebhcfq98ePswEFRARejZohOuBmx1CmrMmBeCT6F5Io6eN77JN2qxvL5NqS8HIbRKPaqHn4e/wmMjrzNLdEZ8E8+xO8Wctu1rcvP9JdVcVJhuQozj8Dtb96Gx6GYQWwxK9PY4fz4TQ4D6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q8+aFH6n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zyWsFM1f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q8+aFH6n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zyWsFM1f"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouXdEehDoqV1+SFbkKragQQWfw01WTv03V9ySvkqWns=;
	b=Q8+aFH6nT/Lb2b6lOV5TJsvAK8G4DhygUmqpSOKEHVDc3yy60nUS0ebt4ZS+ZR0TCBXIF7
	PZNR+jbtna+NxolBmiS+jGQgLSafH988938lXi1x0E2RcVY03DwkvLr6zS8PEYWMenjpcC
	3OnkqEgZfPGF7yHjrT2Qi8DZjG+c5IfHfd1ELLjexpJhFXlkyF9TLJfrIPauiPl1TS78Eu
	9Xkar+AVdnUWww9PjKiS9O8KRgttzV6dapflxgRdRx8UimfAX+OPJUieGi8IxYJPeTodsv
	6IeiaD3wfeEJu8eJ7sd4KqXUHt4uAmC7R94eLqV+UxMYwZnSpVjNV1uU77psbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouXdEehDoqV1+SFbkKragQQWfw01WTv03V9ySvkqWns=;
	b=zyWsFM1fgBbYLJ3YoOzXbosF0thD0QjSxmxVwDaRxBSnydxjL+pEbbRf1Gjbq7NC5g+Ak8
	C4WaSRFSbE1LyfCg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 1/9] x86/cpuid: Move CPUID(0x2) APIs into <cpuid/api.h>
Date: Thu,  8 May 2025 17:02:30 +0200
Message-ID: <20250508150240.172915-2-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all of the CPUID(0x2) APIs at <cpuid/leaf_0x2_api.h> into
<cpuid/api.h>, in order centralize all CPUID APIs into the latter.

While at it, separate the different CPUID leaf parsing APIs using
header comments like "CPUID(0xN) parsing: ".

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid.h              |  1 -
 arch/x86/include/asm/cpuid/api.h          | 75 ++++++++++++++++++++++-
 arch/x86/include/asm/cpuid/leaf_0x2_api.h | 73 ----------------------
 arch/x86/include/asm/cpuid/types.h        |  3 +-
 4 files changed, 75 insertions(+), 77 deletions(-)
 delete mode 100644 arch/x86/include/asm/cpuid/leaf_0x2_api.h

diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
index 585819331dc6..d5749b25fa10 100644
--- a/arch/x86/include/asm/cpuid.h
+++ b/arch/x86/include/asm/cpuid.h
@@ -4,6 +4,5 @@
 #define _ASM_X86_CPUID_H
 
 #include <asm/cpuid/api.h>
-#include <asm/cpuid/leaf_0x2_api.h>
 
 #endif /* _ASM_X86_CPUID_H */
diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index bf76a1706d02..ff8891a0b6c8 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -160,6 +160,10 @@ static inline void __cpuid_read_reg(u32 leaf, u32 subleaf,
 	__cpuid_read_reg(leaf, 0, regidx, (u32 *)(reg));	\
 }
 
+/*
+ * Hypervisor-related APIs:
+ */
+
 static __always_inline bool cpuid_function_is_indexed(u32 function)
 {
 	switch (function) {
@@ -208,7 +212,76 @@ static inline u32 hypervisor_cpuid_base(const char *sig, u32 leaves)
 }
 
 /*
- * CPUID(0x80000006) parsing helpers
+ * CPUID(0x2) parsing:
+ */
+
+/**
+ * cpuid_get_leaf_0x2_regs() - Return sanitized leaf 0x2 register output
+ * @regs:	Output parameter
+ *
+ * Query CPUID leaf 0x2 and store its output in @regs.	Force set any
+ * invalid 1-byte descriptor returned by the hardware to zero (the NULL
+ * cache/TLB descriptor) before returning it to the caller.
+ *
+ * Use for_each_leaf_0x2_entry() to iterate over the register output in
+ * parsed form.
+ */
+static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
+{
+	cpuid_leaf(0x2, regs);
+
+	/*
+	 * All Intel CPUs must report an iteration count of 1.	In case
+	 * of bogus hardware, treat all returned descriptors as NULL.
+	 */
+	if (regs->desc[0] != 0x01) {
+		for (int i = 0; i < 4; i++)
+			regs->regv[i] = 0;
+		return;
+	}
+
+	/*
+	 * The most significant bit (MSB) of each register must be clear.
+	 * If a register is invalid, replace its descriptors with NULL.
+	 */
+	for (int i = 0; i < 4; i++) {
+		if (regs->reg[i].invalid)
+			regs->regv[i] = 0;
+	}
+}
+
+/**
+ * for_each_leaf_0x2_entry() - Iterator for parsed leaf 0x2 descriptors
+ * @regs:   Leaf 0x2 register output, returned by cpuid_get_leaf_0x2_regs()
+ * @__ptr:  u8 pointer, for macro internal use only
+ * @entry:  Pointer to parsed descriptor information at each iteration
+ *
+ * Loop over the 1-byte descriptors in the passed leaf 0x2 output registers
+ * @regs.  Provide the parsed information for each descriptor through @entry.
+ *
+ * To handle cache-specific descriptors, switch on @entry->c_type.  For TLB
+ * descriptors, switch on @entry->t_type.
+ *
+ * Example usage for cache descriptors::
+ *
+ *	const struct leaf_0x2_table *entry;
+ *	union leaf_0x2_regs regs;
+ *	u8 *ptr;
+ *
+ *	cpuid_get_leaf_0x2_regs(&regs);
+ *	for_each_leaf_0x2_entry(regs, ptr, entry) {
+ *		switch (entry->c_type) {
+ *			...
+ *		}
+ *	}
+ */
+#define for_each_leaf_0x2_entry(regs, __ptr, entry)				\
+	for (__ptr = &(regs).desc[1];						\
+	     __ptr < &(regs).desc[16] && (entry = &cpuid_0x2_table[*__ptr]);	\
+	     __ptr++)
+
+/*
+ * CPUID(0x80000006) parsing:
  */
 
 static inline bool cpuid_amd_hygon_has_l3_cache(void)
diff --git a/arch/x86/include/asm/cpuid/leaf_0x2_api.h b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
deleted file mode 100644
index 09fa3070b271..000000000000
--- a/arch/x86/include/asm/cpuid/leaf_0x2_api.h
+++ /dev/null
@@ -1,73 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_CPUID_LEAF_0x2_API_H
-#define _ASM_X86_CPUID_LEAF_0x2_API_H
-
-#include <asm/cpuid/api.h>
-#include <asm/cpuid/types.h>
-
-/**
- * cpuid_get_leaf_0x2_regs() - Return sanitized leaf 0x2 register output
- * @regs:	Output parameter
- *
- * Query CPUID leaf 0x2 and store its output in @regs.	Force set any
- * invalid 1-byte descriptor returned by the hardware to zero (the NULL
- * cache/TLB descriptor) before returning it to the caller.
- *
- * Use for_each_leaf_0x2_entry() to iterate over the register output in
- * parsed form.
- */
-static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
-{
-	cpuid_leaf(0x2, regs);
-
-	/*
-	 * All Intel CPUs must report an iteration count of 1.	In case
-	 * of bogus hardware, treat all returned descriptors as NULL.
-	 */
-	if (regs->desc[0] != 0x01) {
-		for (int i = 0; i < 4; i++)
-			regs->regv[i] = 0;
-		return;
-	}
-
-	/*
-	 * The most significant bit (MSB) of each register must be clear.
-	 * If a register is invalid, replace its descriptors with NULL.
-	 */
-	for (int i = 0; i < 4; i++) {
-		if (regs->reg[i].invalid)
-			regs->regv[i] = 0;
-	}
-}
-
-/**
- * for_each_leaf_0x2_entry() - Iterator for parsed leaf 0x2 descriptors
- * @regs:   Leaf 0x2 register output, returned by cpuid_get_leaf_0x2_regs()
- * @__ptr:  u8 pointer, for macro internal use only
- * @entry:  Pointer to parsed descriptor information at each iteration
- *
- * Loop over the 1-byte descriptors in the passed leaf 0x2 output registers
- * @regs.  Provide the parsed information for each descriptor through @entry.
- *
- * To handle cache-specific descriptors, switch on @entry->c_type.  For TLB
- * descriptors, switch on @entry->t_type.
- *
- * Example usage for cache descriptors::
- *
- *	const struct leaf_0x2_table *entry;
- *	union leaf_0x2_regs regs;
- *	u8 *ptr;
- *
- *	cpuid_get_leaf_0x2_regs(&regs);
- *	for_each_leaf_0x2_entry(regs, ptr, entry) {
- *		switch (entry->c_type) {
- *			...
- *		}
- *	}
- */
-#define for_each_leaf_0x2_entry(regs, __ptr, entry)				\
-	for (__ptr = &(regs).desc[1];						\
-	     __ptr < &(regs).desc[16] && (entry = &cpuid_0x2_table[*__ptr]);	\
-	     __ptr++)
-
-#endif /* _ASM_X86_CPUID_LEAF_0x2_API_H */
diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index c95fee66e148..8a00364b79de 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -31,8 +31,7 @@ enum cpuid_regs_idx {
 #define CPUID_LEAF_TILE		0x1d
 
 /*
- * Types for CPUID(0x2) parsing
- * Check <asm/cpuid/leaf_0x2_api.h>
+ * Types for CPUID(0x2) parsing:
  */
 
 struct leaf_0x2_reg {
-- 
2.49.0

