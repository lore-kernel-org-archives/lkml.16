Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ABC213E91
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719663; cv=none; b=URaopj9lxI/4N8IkUW7J2YBLiT/xQKyq4RJMQ4Fl8JIECtEKTzR4VPewaKBW/0NYB//e70TzkqZ9R0DyBX8jqEh0UEiA00S1HeZQZuU/v9oZl8pOydaDVSGw3/30otxfZiztVMyBVz2lbxaswi1n6TNK9vTSMi9ScfEQ07hfueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719663; c=relaxed/simple;
	bh=JyBBjpfUNqZPjlItZf8JqitOAzRjv7P0Wfs26I+vqgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnISKvFZV6vjHIGmeF2bsNz3t6voF38YR7KW02EZ5jb+ztAMUdwX2dDkdBhDEYkqB+xovWILQ9FKvkLqeQJrXlvuyBfew/fcusRqtmxD2YCpnmGQipWLqn2TMXGl9Rlj73vf3iZkCqOUmGrr7vj94bW40+jIgCZcTlX4mVIlhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tfUP4-000000004Cs-2jje;
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
Subject: [PATCH v8 04/12] x86/mm: get INVLPGB count max from CPUID
Date: Tue,  4 Feb 2025 20:39:53 -0500
Message-ID: <20250205014033.3626204-5-riel@surriel.com>
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

The CPU advertises the maximum number of pages that can be shot down
with one INVLPGB instruction in the CPUID data.

Save that information for later use.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/Kconfig.cpu               | 5 +++++
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/include/asm/tlbflush.h    | 7 +++++++
 arch/x86/kernel/cpu/amd.c          | 8 ++++++++
 4 files changed, 21 insertions(+)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 2a7279d80460..abe013a1b076 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -395,6 +395,10 @@ config X86_VMX_FEATURE_NAMES
 	def_bool y
 	depends on IA32_FEAT_CTL
 
+config X86_BROADCAST_TLB_FLUSH
+	def_bool y
+	depends on CPU_SUP_AMD && 64BIT
+
 menuconfig PROCESSOR_SELECT
 	bool "Supported processor vendors" if EXPERT
 	help
@@ -431,6 +435,7 @@ config CPU_SUP_CYRIX_32
 config CPU_SUP_AMD
 	default y
 	bool "Support AMD processors" if PROCESSOR_SELECT
+	select X86_BROADCAST_TLB_FLUSH
 	help
 	  This enables detection, tunings and quirks for AMD processors
 
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 17b6590748c0..f9b832e971c5 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -338,6 +338,7 @@
 #define X86_FEATURE_CLZERO		(13*32+ 0) /* "clzero" CLZERO instruction */
 #define X86_FEATURE_IRPERF		(13*32+ 1) /* "irperf" Instructions Retired Count */
 #define X86_FEATURE_XSAVEERPTR		(13*32+ 2) /* "xsaveerptr" Always save/restore FP error pointers */
+#define X86_FEATURE_INVLPGB		(13*32+ 3) /* INVLPGB and TLBSYNC instruction supported. */
 #define X86_FEATURE_RDPRU		(13*32+ 4) /* "rdpru" Read processor register at user level */
 #define X86_FEATURE_WBNOINVD		(13*32+ 9) /* "wbnoinvd" WBNOINVD instruction */
 #define X86_FEATURE_AMD_IBPB		(13*32+12) /* Indirect Branch Prediction Barrier */
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 02fc2aa06e9e..8fe3b2dda507 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -183,6 +183,13 @@ static inline void cr4_init_shadow(void)
 extern unsigned long mmu_cr4_features;
 extern u32 *trampoline_cr4_features;
 
+/* How many pages can we invalidate with one INVLPGB. */
+#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
+extern u16 invlpgb_count_max;
+#else
+#define invlpgb_count_max 1
+#endif
+
 extern void initialize_tlbstate_and_flush(void);
 
 /*
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 79d2e17f6582..bcf73775b4f8 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -29,6 +29,8 @@
 
 #include "cpu.h"
 
+u16 invlpgb_count_max __ro_after_init;
+
 static inline int rdmsrl_amd_safe(unsigned msr, unsigned long long *p)
 {
 	u32 gprs[8] = { 0 };
@@ -1135,6 +1137,12 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 		tlb_lli_2m[ENTRIES] = eax & mask;
 
 	tlb_lli_4m[ENTRIES] = tlb_lli_2m[ENTRIES] >> 1;
+
+	/* Max number of pages INVLPGB can invalidate in one shot */
+	if (boot_cpu_has(X86_FEATURE_INVLPGB)) {
+		cpuid(0x80000008, &eax, &ebx, &ecx, &edx);
+		invlpgb_count_max = (edx & 0xffff) + 1;
+	}
 }
 
 static const struct cpu_dev amd_cpu_dev = {
-- 
2.47.1

