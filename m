Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB0127F199
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507942; cv=none; b=KxMXiKx1mKqodDZ0XjcpGpgy4y/VV504krIR7QMaEpOhtqYsAqzpA8bNgzyvEVqbPqqQ8mV/EkACV49FiVFzGNNQBVbGT2CkdSqjEEDeEGQY37LdCj0UZja71uc9nuhuupslYLgk5upi8R/hXxFykNm5oY35q6xTQpQJxuvg3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507942; c=relaxed/simple;
	bh=ZnXm6XJwPTqIgsaF2IwVlXmv2VjiCK2LmFEp67sepYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJ9oaWRyG+duhncwh1GmFyhKNSSIh1MWFGpDQtXOhoBxr19BAjj9v6DQKqy1HakWs0N2POM3X7/GjtBD/Qkl50o85hEEMdMDjdBD/4MtGIBKu15iSFjyFYkaJo2uRmO7tYPdA9KEzefhY1c+b64kZyn+z4kSHGotikK15bohr48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dLkhr9XX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yJheuva7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dLkhr9XX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yJheuva7"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/40KDK3UJv/wCFeKeh1Y/BjOGHq89fouQlj1buwkxb8=;
	b=dLkhr9XXOSDeztdWNQQRpnCnYj347HocU0Y8+gkynVwvb96t0TCvpJPmAEMepo15XIWRxi
	ZM0SQRLinQ+DYrVGPPbzd0HVkKCV2r/9mIMt3loAGkNx1EgjSP7jvFBgZu7lEwwIhWfvIE
	CkutVg/Gxejau4RT2OyLlcmtjOn9zPIbZBBiqXYV7JuWR7F/gr1dnvk8wM15SEKCbWsWHM
	Slrgzes3vB+gkM7+oM5rDcoP1YQBPAIAILQzjBDjVUwkYtOFWKB3UBYfZndVjSud6TQEny
	yfKyt+H+JqAFDOESc8rqcMh9Cu9p08ybZICkYYpEH8CQh7/mlYFCRv8JKs2EBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/40KDK3UJv/wCFeKeh1Y/BjOGHq89fouQlj1buwkxb8=;
	b=yJheuva790Z+XGkF4HZwkxlwnzS2bUTQZy11uP0XoQJD68Ln1s1+23B/0PsmaygQXJsTBy
	N1UVuV2onJ+PzBDQ==
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
Subject: [PATCH v1 17/26] x86/cpuid: Remove direct CPUID(0x2) query API
Date: Tue,  6 May 2025 07:04:28 +0200
Message-ID: <20250506050437.10264-18-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All call sites at x86/cpu and x86/cacheinfo has been switched from direct
CPUID(0x2) access to scanned CPUID access.  Remove the direct CPUID(0x2)
query APIs at <asm/cpuid/leaf_0x2_api.h>.

Rename the iterator macro:

    for_each_scanned_leaf_0x2_entry()

back to:

    for_each_leaf_0x2_entry()

since the "for_each_scanned_.." name and was just chosen to accommodate
the direct CPUID(0x2) to scanned CPUID(0x2) transition.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/leaf_0x2_api.h | 72 +----------------------
 arch/x86/kernel/cpu/cacheinfo.c           |  2 +-
 arch/x86/kernel/cpu/intel.c               |  2 +-
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/leaf_0x2_api.h b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
index be3d7e113421..98876bcb38c3 100644
--- a/arch/x86/include/asm/cpuid/leaf_0x2_api.h
+++ b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
@@ -2,76 +2,10 @@
 #ifndef _ASM_X86_CPUID_LEAF_0x2_API_H
 #define _ASM_X86_CPUID_LEAF_0x2_API_H
 
-#include <asm/cpuid/api.h>
 #include <asm/cpuid/types.h>
 
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
 /**
  * for_each_leaf_0x2_entry() - Iterator for parsed leaf 0x2 descriptors
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
-/**
- * for_each_scanned_leaf_0x2_entry() - Iterator for parsed CPUID(0x2) descriptors
  * @regs:   Leaf 0x2 register output, as returned by cpudata_cpuid_regs()
  * @__ptr:  u8 pointer, for macro internal use only
  * @entry:  Pointer to parsed descriptor information at each iteration
@@ -99,9 +33,9 @@ static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
  *		}
  *	}
  */
-#define for_each_scanned_leaf_0x2_entry(regs, __ptr, entry)					\
-	for (({ static_assert(sizeof(*regs) == sizeof(union leaf_0x2_regs)); }),		\
-	     __ptr = &((union leaf_0x2_regs *)(regs))->desc[1];					\
+#define for_each_leaf_0x2_entry(regs, __ptr, entry)					\
+	for (({ static_assert(sizeof(*regs) == sizeof(union leaf_0x2_regs)); }),	\
+	     __ptr = &((union leaf_0x2_regs *)(regs))->desc[1];				\
 	     __ptr < &((union leaf_0x2_regs *)(regs))->desc[16] && (entry = &cpuid_0x2_table[*__ptr]);\
 	     __ptr++)
 
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 696ef5e9e14b..665f3b187964 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -389,7 +389,7 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 	if (!regs)
 		return;
 
-	for_each_scanned_leaf_0x2_entry(regs, ptr, entry) {
+	for_each_leaf_0x2_entry(regs, ptr, entry) {
 		switch (entry->c_type) {
 		case CACHE_L1_INST:	l1i += entry->c_size; break;
 		case CACHE_L1_DATA:	l1d += entry->c_size; break;
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 24b506a28ce8..5cefe726c18d 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -717,7 +717,7 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
 	if (!regs)
 		return;
 
-	for_each_scanned_leaf_0x2_entry(regs, ptr, entry)
+	for_each_leaf_0x2_entry(regs, ptr, entry)
 		intel_tlb_lookup(entry);
 }
 
-- 
2.49.0

