Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFB27B516
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716586; cv=none; b=cKNZzlxX54pbuFts5Y/8WIA3J+Iw40u2jsIQjbrDyh/5NA4w8n5P3foU5MhS53ZoPxkzoXmifQAK86GSH+xp5GN61XQIyNfa6XJQAThhygAGwvsQ0+KEW8R+xPOQNFPXgoHiLKSOwa9bIMTXvDa2O33O/usrYzFeAa8U3i+89FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716586; c=relaxed/simple;
	bh=GVTfeGKHrkRu8eLI3uK43e70/CgAu2MN5heww0lN6nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksSjnMOjWiQub/9eZEXM37B9QPFbdOOyUVumUghAyrGI2JAsdUWOS5xIEczbEAwLbxYvRS+njWZvh63jECSeGPUxhA7WfR0SiIWbPrOoCmddApUmpC3bVzLPPTj/OjVIsdnD60Zy1L9R7vRiYQoYZkbU/O8czv3FLmLIqnIFjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y+T3sffs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w4/IGnJi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y+T3sffs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w4/IGnJi"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMuqN7CQJKVFh5Qod0h7zRKR2zJsoYZx0+h+Dl9/l9Y=;
	b=Y+T3sffsK6pGcrECFfFJ5hOYO0HzYneMkDtsq6QfpFSTwmWVnc1ADqmwHhKzd8FBHY0jRi
	05DA5YsawAH86prndhESAuTYUZ3WLvY18nODU8fPFaXSfMpqmEDbSEF034M7TK6Uomz9XT
	I6y7vVPs2acVzyoOfNvD9Vd+xp/H0j7whFQdaA24jK3X5ISRA6iXkvg1amzwsJjQimtRrj
	km/Y4bLVLTcXHbbYCz61CSze6ANeVKBTFjxGXYnmBqAccZWjnpSydcGr3Bq+UX2LLs3GwA
	ye28GDB9sDtvMJBSRRTDX7h0TjdkTxEk1blAgtFwWvP53ywfSIr7+PgMWKQvbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMuqN7CQJKVFh5Qod0h7zRKR2zJsoYZx0+h+Dl9/l9Y=;
	b=w4/IGnJi+IT1L44wocBxfE6OCnwR1/1pMeNMwwRRfAc5pz84hhpcRD7GrlrkHGISlPIl8h
	KQmzLzkp4WEhfNBw==
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
Subject: [PATCH v1 8/9] x86/cpuid: Rename native_cpuid() to cpuid_native()
Date: Thu,  8 May 2025 17:02:37 +0200
Message-ID: <20250508150240.172915-9-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to let all the APIs under <cpuid/api.h> have a shared "cpuid_"
namespace, rename native_cpuid() to cpuid_native().

Adjust all call-sites accordingly.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/boot/compressed/sev.c           | 6 +++---
 arch/x86/include/asm/cpuid/api.h         | 6 +++---
 arch/x86/kernel/cpu/microcode/intel.c    | 2 +-
 arch/x86/kernel/cpu/microcode/internal.h | 4 ++--
 arch/x86/kernel/paravirt.c               | 2 +-
 arch/x86/mm/mem_encrypt_identity.c       | 6 +++---
 arch/x86/xen/enlighten_pv.c              | 4 ++--
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index f054bf52c10a..4b617f8f9b7f 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -494,7 +494,7 @@ static int sev_check_cpu_support(void)
 	/* Check for the SME/SEV support leaf */
 	eax = 0x80000000;
 	ecx = 0;
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 	if (eax < 0x8000001f)
 		return -ENODEV;
 
@@ -508,7 +508,7 @@ static int sev_check_cpu_support(void)
 	 */
 	eax = 0x8000001f;
 	ecx = 0;
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 	/* Check whether SEV is supported */
 	if (!(eax & BIT(1)))
 		return -ENODEV;
@@ -666,7 +666,7 @@ bool early_is_sevsnp_guest(void)
 		 */
 		eax = 0x8000001f;
 		ecx = 0;
-		native_cpuid(&eax, &ebx, &ecx, &edx);
+		cpuid_native(&eax, &ebx, &ecx, &edx);
 		if (eax & BIT(28)) {
 			struct msr m;
 
diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index e957f09d8a8f..7f4644747649 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -22,7 +22,7 @@ static inline bool cpuid_feature(void)
 }
 #endif
 
-static inline void native_cpuid(u32 *eax, u32 *ebx,
+static inline void cpuid_native(u32 *eax, u32 *ebx,
 				u32 *ecx, u32 *edx)
 {
 	/* ecx is often an input as well as an output. */
@@ -40,7 +40,7 @@ static inline u32 native_cpuid_##reg(u32 op)			\
 {								\
 	u32 eax = op, ebx, ecx = 0, edx;			\
 								\
-	native_cpuid(&eax, &ebx, &ecx, &edx);			\
+	cpuid_native(&eax, &ebx, &ecx, &edx);			\
 								\
 	return reg;						\
 }
@@ -56,7 +56,7 @@ NATIVE_CPUID_REG(edx)
 #ifdef CONFIG_PARAVIRT_XXL
 # include <asm/paravirt.h>
 #else
-# define __cpuid native_cpuid
+# define __cpuid	cpuid_native
 #endif
 
 /*
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 819199bc0119..66693831f665 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -347,7 +347,7 @@ static __init bool load_builtin_intel_microcode(struct cpio_data *cp)
 	if (IS_ENABLED(CONFIG_X86_32))
 		return false;
 
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 
 	sprintf(name, "intel-ucode/%02x-%02x-%02x",
 		x86_family(eax), x86_model(eax), x86_stepping(eax));
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 5df621752fef..6049fd7ac16a 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -73,7 +73,7 @@ static inline int x86_cpuid_vendor(void)
 	u32 eax = 0x00000000;
 	u32 ebx, ecx = 0, edx;
 
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 
 	if (CPUID_IS(CPUID_INTEL1, CPUID_INTEL2, CPUID_INTEL3, ebx, ecx, edx))
 		return X86_VENDOR_INTEL;
@@ -89,7 +89,7 @@ static inline unsigned int x86_cpuid_family(void)
 	u32 eax = 0x00000001;
 	u32 ebx, ecx = 0, edx;
 
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 
 	return x86_family(eax);
 }
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccd05d8999f..e2c812beb06c 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -122,7 +122,7 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.io_delay		= native_io_delay,
 
 #ifdef CONFIG_PARAVIRT_XXL
-	.cpu.cpuid		= native_cpuid,
+	.cpu.cpuid		= cpuid_native,
 	.cpu.get_debugreg	= pv_native_get_debugreg,
 	.cpu.set_debugreg	= pv_native_set_debugreg,
 	.cpu.read_cr0		= native_read_cr0,
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index 5eecdd92da10..6bad28dd8b07 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -501,7 +501,7 @@ void __head sme_enable(struct boot_params *bp)
 	/* Check for the SME/SEV support leaf */
 	eax = 0x80000000;
 	ecx = 0;
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 	if (eax < 0x8000001f)
 		return;
 
@@ -518,7 +518,7 @@ void __head sme_enable(struct boot_params *bp)
 	 */
 	eax = 0x8000001f;
 	ecx = 0;
-	native_cpuid(&eax, &ebx, &ecx, &edx);
+	cpuid_native(&eax, &ebx, &ecx, &edx);
 	/* Check whether SEV or SME is supported */
 	if (!(eax & (AMD_SEV_BIT | AMD_SME_BIT)))
 		return;
@@ -552,7 +552,7 @@ void __head sme_enable(struct boot_params *bp)
 		 */
 		eax = 1;
 		ecx = 0;
-		native_cpuid(&eax, &ebx, &ecx, &edx);
+		cpuid_native(&eax, &ebx, &ecx, &edx);
 		if (ecx & BIT(31))
 			return;
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 21c7f524766e..d1a1a3546bd5 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -327,7 +327,7 @@ static bool __init xen_check_mwait(void)
 	ax = 1;
 	cx = 0;
 
-	native_cpuid(&ax, &bx, &cx, &dx);
+	cpuid_native(&ax, &bx, &cx, &dx);
 
 	mwait_mask = (1 << (X86_FEATURE_EST % 32)) |
 		     (1 << (X86_FEATURE_MWAIT % 32));
@@ -344,7 +344,7 @@ static bool __init xen_check_mwait(void)
 	cx = 0;
 	dx = 0;
 
-	native_cpuid(&ax, &bx, &cx, &dx);
+	cpuid_native(&ax, &bx, &cx, &dx);
 
 	/* Ask the Hypervisor whether to clear ACPI_PROC_CAP_C_C2C3_FFH. If so,
 	 * don't expose MWAIT_LEAF and let ACPI pick the IOPORT version of C3.
-- 
2.49.0

