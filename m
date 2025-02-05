Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0741B20C471
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719661; cv=none; b=uGzAtzvF6Yz+d7RrVymqeS62DzwIi80eAIamgdJFSdHvSEh2X0n3jXsEz3j176HhkWGlkUUtaTH+1v36m0iMUUylJk+TmPigci4UZZNs0y4EiPcJInXZN4fXtVhvXiVicmaJ6h/wEKAltnPMVa7knpJVh+SF2xqV4bomoGfCzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719661; c=relaxed/simple;
	bh=UpoxwSUQ1uJhu79JqG6ckmfbyUZ1cNFPTXnqXKUfOgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skz4EM7ZIL90bvnkufsUqK04S3Ihbw+opN3fWKJ8El+FWrUr8tNdgpL3jdUC8cSm9x2taGVJUtsCuT/XwtxTR6r7goOEdr1dpkhNq3/jW0BeaH9GlQC20DkvBvQcNY2xixB3lcFgDuoWrtLCEMz89pB8Hj/3sDMUW6aHgvdMV3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tfUP4-000000004Cs-2p3a;
	Tue, 04 Feb 2025 20:40:34 -0500
From: Rik van Riel <riel@surriel.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	bp@alien8.de,
	peterz@infradead.org,
	dave.hansen@linux.intel.com,
	zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com,
	thomas.lendacky@amd.com,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	mhklinux@outlook.com,
	andrew.cooper3@citrix.com,
	Rik van Riel <riel@surriel.com>,
	Manali Shukla <Manali.Shukla@amd.com>
Subject: [PATCH v8 05/12] x86/mm: add INVLPGB support code
Date: Tue,  4 Feb 2025 20:39:54 -0500
Message-ID: <20250205014033.3626204-6-riel@surriel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205014033.3626204-1-riel@surriel.com>
References: <20250205014033.3626204-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

Add invlpgb.h with the helper functions and definitions needed to use
broadcast TLB invalidation on AMD EPYC 3 and newer CPUs.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/include/asm/invlpgb.h  | 101 ++++++++++++++++++++++++++++++++
 arch/x86/include/asm/tlbflush.h |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 arch/x86/include/asm/invlpgb.h

diff --git a/arch/x86/include/asm/invlpgb.h b/arch/x86/include/asm/invlpgb.h
new file mode 100644
index 000000000000..a1d5dedd5217
--- /dev/null
+++ b/arch/x86/include/asm/invlpgb.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_INVLPGB
+#define _ASM_X86_INVLPGB
+
+#include <linux/kernel.h>
+#include <vdso/bits.h>
+#include <vdso/page.h>
+
+/*
+ * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
+ *
+ * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
+ * be done in a parallel fashion.
+ *
+ * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
+ * this CPU have completed.
+ */
+static inline void __invlpgb(unsigned long asid, unsigned long pcid,
+			     unsigned long addr, u16 extra_count,
+			     bool pmd_stride, u8 flags)
+{
+	u32 edx = (pcid << 16) | asid;
+	u32 ecx = (pmd_stride << 31) | extra_count;
+	u64 rax = addr | flags;
+
+	/* The low bits in rax are for flags. Verify addr is clean. */
+	VM_WARN_ON_ONCE(addr & ~PAGE_MASK);
+
+	/* INVLPGB; supported in binutils >= 2.36. */
+	asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
+}
+
+/* Wait for INVLPGB originated by this CPU to complete. */
+static inline void tlbsync(void)
+{
+	cant_migrate();
+	/* TLBSYNC: supported in binutils >= 0.36. */
+	asm volatile(".byte 0x0f, 0x01, 0xff" ::: "memory");
+}
+
+/*
+ * INVLPGB can be targeted by virtual address, PCID, ASID, or any combination
+ * of the three. For example:
+ * - INVLPGB_VA | INVLPGB_INCLUDE_GLOBAL: invalidate all TLB entries at the address
+ * - INVLPGB_PCID:			  invalidate all TLB entries matching the PCID
+ *
+ * The first can be used to invalidate (kernel) mappings at a particular
+ * address across all processes.
+ *
+ * The latter invalidates all TLB entries matching a PCID.
+ */
+#define INVLPGB_VA			BIT(0)
+#define INVLPGB_PCID			BIT(1)
+#define INVLPGB_ASID			BIT(2)
+#define INVLPGB_INCLUDE_GLOBAL		BIT(3)
+#define INVLPGB_FINAL_ONLY		BIT(4)
+#define INVLPGB_INCLUDE_NESTED		BIT(5)
+
+/* Flush all mappings for a given pcid and addr, not including globals. */
+static inline void invlpgb_flush_user(unsigned long pcid,
+				      unsigned long addr)
+{
+	__invlpgb(0, pcid, addr, 0, 0, INVLPGB_PCID | INVLPGB_VA);
+	tlbsync();
+}
+
+static inline void invlpgb_flush_user_nr_nosync(unsigned long pcid,
+						unsigned long addr,
+						u16 nr,
+						bool pmd_stride)
+{
+	__invlpgb(0, pcid, addr, nr - 1, pmd_stride, INVLPGB_PCID | INVLPGB_VA);
+}
+
+/* Flush all mappings for a given PCID, not including globals. */
+static inline void invlpgb_flush_single_pcid_nosync(unsigned long pcid)
+{
+	__invlpgb(0, pcid, 0, 0, 0, INVLPGB_PCID);
+}
+
+/* Flush all mappings, including globals, for all PCIDs. */
+static inline void invlpgb_flush_all(void)
+{
+	__invlpgb(0, 0, 0, 0, 0, INVLPGB_INCLUDE_GLOBAL);
+	tlbsync();
+}
+
+/* Flush addr, including globals, for all PCIDs. */
+static inline void invlpgb_flush_addr_nosync(unsigned long addr, u16 nr)
+{
+	__invlpgb(0, 0, addr, nr - 1, 0, INVLPGB_INCLUDE_GLOBAL);
+}
+
+/* Flush all mappings for all PCIDs except globals. */
+static inline void invlpgb_flush_all_nonglobals(void)
+{
+	__invlpgb(0, 0, 0, 0, 0, 0);
+	tlbsync();
+}
+
+#endif /* _ASM_X86_INVLPGB */
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 8fe3b2dda507..dba5caa4a9f4 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/special_insns.h>
 #include <asm/smp.h>
+#include <asm/invlpgb.h>
 #include <asm/invpcid.h>
 #include <asm/pti.h>
 #include <asm/processor-flags.h>
-- 
2.47.1

