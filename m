Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9E49FA33
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492458; cv=none; b=s+Clr+Cx7UL5PCq8ab89NKoSjX3rbTVA48fqesuGM31F+SQg+h+jEYi3DFjOL3MULZJyZtn6YVmsXmWzTk5lUDEh3oOLGrbxwjlkbbirwK9r157tYnDzOKGyxbhbxVaPkaS23Kud4LSNKIut8gQKmDwNRNuW+ZtfaJjbb72pLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492458; c=relaxed/simple;
	bh=+pC0MyfYnCdcvbMCgpYsaCP5hIslJP7GASUOkIvSzuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMuoydgiHxFNnpvo5g6M8fsS2KHgZpMffHNFiuJdYuPGwg3JZmV59sfoazXHECy0YKWEJBNq1W2/ttosWYuVcL9HWnOBrFeynx9qLzIhVIN7IBrDyTQZziJBXupmHHn29NYFvJAyN5doPAwc/geWDlV6HkJhhPf1o8DhiNT5+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-3UXR;
	Mon, 05 May 2025 20:38:14 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	Rik van Riel <riel@fb.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 4/9] x86/mm: Introduce X86_FEATURE_RAR
Date: Mon,  5 May 2025 20:37:42 -0400
Message-ID: <20250506003811.92405-5-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506003811.92405-1-riel@surriel.com>
References: <20250506003811.92405-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

From: Rik van Riel <riel@fb.com>

Introduce X86_FEATURE_RAR and enumeration of the feature.

[riel: move disabling to Kconfig.cpufeatures]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/Kconfig.cpufeatures       |  4 ++++
 arch/x86/include/asm/cpufeatures.h |  2 +-
 arch/x86/kernel/cpu/common.c       | 13 +++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpufeatures b/arch/x86/Kconfig.cpufeatures
index e12d5b7e39a2..60042f8c2837 100644
--- a/arch/x86/Kconfig.cpufeatures
+++ b/arch/x86/Kconfig.cpufeatures
@@ -199,3 +199,7 @@ config X86_DISABLED_FEATURE_SEV_SNP
 config X86_DISABLED_FEATURE_INVLPGB
 	def_bool y
 	depends on !BROADCAST_TLB_FLUSH
+
+config X86_DISABLED_FEATURE_RAR
+	def_bool y
+	depends on !BROADCAST_TLB_FLUSH
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 7642310276a8..06732c872998 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -75,7 +75,7 @@
 #define X86_FEATURE_CENTAUR_MCR		( 3*32+ 3) /* "centaur_mcr" Centaur MCRs (= MTRRs) */
 #define X86_FEATURE_K8			( 3*32+ 4) /* Opteron, Athlon64 */
 #define X86_FEATURE_ZEN5		( 3*32+ 5) /* CPU based on Zen5 microarchitecture */
-/* Free                                 ( 3*32+ 6) */
+#define X86_FEATURE_RAR			( 3*32+ 6) /* Intel Remote Action Request */
 /* Free                                 ( 3*32+ 7) */
 #define X86_FEATURE_CONSTANT_TSC	( 3*32+ 8) /* "constant_tsc" TSC ticks at a constant rate */
 #define X86_FEATURE_UP			( 3*32+ 9) /* "up" SMP kernel running on UP */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index b73e09315413..5666620e7153 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1502,6 +1502,18 @@ static void __init cpu_set_bug_bits(struct cpuinfo_x86 *c)
 	setup_force_cpu_bug(X86_BUG_L1TF);
 }
 
+static void __init detect_rar(struct cpuinfo_x86 *c)
+{
+	u64 msr;
+
+	if (cpu_has(c, X86_FEATURE_CORE_CAPABILITIES)) {
+		rdmsrl(MSR_IA32_CORE_CAPABILITIES, msr);
+
+		if (msr & CORE_CAP_RAR)
+			setup_force_cpu_cap(X86_FEATURE_RAR);
+	}
+}
+
 /*
  * The NOPL instruction is supposed to exist on all CPUs of family >= 6;
  * unfortunately, that's not true in practice because of early VIA
@@ -1728,6 +1740,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 		setup_clear_cpu_cap(X86_FEATURE_LA57);
 
 	detect_nopl();
+	detect_rar(c);
 }
 
 void __init init_cpu_devs(void)
-- 
2.49.0

