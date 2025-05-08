Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AB27C856
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716589; cv=none; b=XUg3ihIXc5lmaWkXD4RQykJCEsLN8K8Dw6zsjhyikEtzY0sro9FLnlPFXQ6Dcnx7EXD21j1tuL3jlaxEHiUZt3VqBBlz1fhrG72ixH2IaicPPZD/PlCdQPdLmyK6U3gzQeMdcTwfYaibmK3isLnJuZlyFBllAHpy0fL3WRkjXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716589; c=relaxed/simple;
	bh=XJMUrvzkl7T7SJvE5TMLA06hwaBkEJ6l2urEVurF6Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idf6TI54rHqMdZ/YGuBjOiz/3mJ+t97Sez2G7i5fC3p/uAYdqwyHnOABmPm4uhZOSwhyBGlRe5jMjcpJFKQsLgLrm4qQxp69A1RG2RY8omxZb96pK0TL8bUy2t30L4+cA4mMhJ/Gutp6k56EShu15he5QzS9/cWnxzlrrSU00Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b8U6WSTj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6vVvM+7l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b8U6WSTj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6vVvM+7l"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ry0BzcU6tq9UEbAb2PtgSqgInssbUst9H7FdYRIUqdQ=;
	b=b8U6WSTjtJR6HLCAzAaNsKVYkSGWxdTNQSVtTchyRPgdFBkfP8U1U7NBJWiOV47iowFqx8
	KlnZip5GP4Ch6y5q/PqcVW8G/FHzgJ2RZ3q5L5pWEDgHuQGKPeB2m5CkttCUHQobQJf6Ta
	ZlS+PF6uEgapGZfb7joO6dcKjs2H/hh4TOxK+GQ87IxZ51XQauTanN7HDh3nqKeLNiCQcz
	8kFj+Q8H+uhbd23hmTpwFY+SYmY+O/Ug7jnZ7pqyrSVnCBTClCQXpgCN+Fop5y1FoG8uCe
	EgNSjaulmZqdO4C1iDl6cVnr/NyzR1BAvJJYXiikPqglkCWsZBFBVYBwgTq2jA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ry0BzcU6tq9UEbAb2PtgSqgInssbUst9H7FdYRIUqdQ=;
	b=6vVvM+7l+ofqV15G9B9fse4ureL8h6d6WpI51HI0CRpY9YTxF+0Orp4KFgum5Y2l4O+jNN
	weE0qP4EU4GTnLCg==
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
Subject: [PATCH v1 9/9] x86/cpuid: Rename native_cpuid_REG() to cpuid_native_REG()
Date: Thu,  8 May 2025 17:02:38 +0200
Message-ID: <20250508150240.172915-10-darwi@linutronix.de>
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
namespace, rename native_cpuid_REG() to cpuid_native_REG().

To beetter align with the new namespace, also rename the internal
NATIVE_CPUID_REG() macro to __CPUID_NATIVE_REG().

Adjust all call-sites accordingly.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/boot/compressed/pgtable_64.c   |  4 ++--
 arch/x86/include/asm/cpuid/api.h        | 12 ++++++------
 arch/x86/include/asm/microcode.h        |  2 +-
 arch/x86/kernel/cpu/microcode/amd.c     |  2 +-
 arch/x86/kernel/cpu/microcode/core.c    |  6 +++---
 arch/x86/kernel/head32.c                |  2 +-
 drivers/firmware/efi/libstub/x86-5lvl.c |  4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index d8c5de40669d..8cfe50988aa2 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -125,8 +125,8 @@ asmlinkage void configure_5level_paging(struct boot_params *bp, void *pgtable)
 	 */
 	if (IS_ENABLED(CONFIG_X86_5LEVEL) &&
 			!cmdline_find_option_bool("no5lvl") &&
-			native_cpuid_eax(0) >= 7 &&
-			(native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & 31)))) {
+			cpuid_native_eax(0) >= 7 &&
+			(cpuid_native_ecx(7) & (1 << (X86_FEATURE_LA57 & 31)))) {
 		l5_required = true;
 
 		/* Initialize variables for 5-level paging */
diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 7f4644747649..9f8a1176ad86 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -35,8 +35,8 @@ static inline void cpuid_native(u32 *eax, u32 *ebx,
 	    : "memory");
 }
 
-#define NATIVE_CPUID_REG(reg)					\
-static inline u32 native_cpuid_##reg(u32 op)			\
+#define __CPUID_NATIVE_REG(reg)					\
+static inline u32 cpuid_native_##reg(u32 op)			\
 {								\
 	u32 eax = op, ebx, ecx = 0, edx;			\
 								\
@@ -48,10 +48,10 @@ static inline u32 native_cpuid_##reg(u32 op)			\
 /*
  * Native CPUID functions returning a single datum:
  */
-NATIVE_CPUID_REG(eax)
-NATIVE_CPUID_REG(ebx)
-NATIVE_CPUID_REG(ecx)
-NATIVE_CPUID_REG(edx)
+__CPUID_NATIVE_REG(eax)
+__CPUID_NATIVE_REG(ebx)
+__CPUID_NATIVE_REG(ecx)
+__CPUID_NATIVE_REG(edx)
 
 #ifdef CONFIG_PARAVIRT_XXL
 # include <asm/paravirt.h>
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 695e569159c1..755c9f693118 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -64,7 +64,7 @@ static inline u32 intel_get_microcode_revision(void)
 	native_wrmsrl(MSR_IA32_UCODE_REV, 0);
 
 	/* As documented in the SDM: Do a CPUID 1 here */
-	native_cpuid_eax(1);
+	cpuid_native_eax(1);
 
 	/* get the current revision from MSR 0x8B */
 	native_rdmsr(MSR_IA32_UCODE_REV, dummy, rev);
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 4a10d35e70aa..d757383b653c 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1098,7 +1098,7 @@ static enum ucode_state load_microcode_amd(u8 family, const u8 *data, size_t siz
 
 static int __init save_microcode_in_initrd(void)
 {
-	unsigned int cpuid_1_eax = native_cpuid_eax(1);
+	unsigned int cpuid_1_eax = cpuid_native_eax(1);
 	struct cpuinfo_x86 *c = &boot_cpu_data;
 	struct cont_desc desc = { 0 };
 	enum ucode_state ret;
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 1395fa72960f..9924b8238492 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -106,7 +106,7 @@ static bool __init check_loader_disabled_bsp(void)
 	 * completely accurate as xen pv guests don't see that CPUID bit set but
 	 * that's good enough as they don't land on the BSP path anyway.
 	 */
-	if (native_cpuid_ecx(1) & BIT(31))
+	if (cpuid_native_ecx(1) & BIT(31))
 		return true;
 
 	if (x86_cpuid_vendor() == X86_VENDOR_AMD) {
@@ -128,7 +128,7 @@ void __init load_ucode_bsp(void)
 	if (!cpuid_feature())
 		return;
 
-	cpuid_1_eax = native_cpuid_eax(1);
+	cpuid_1_eax = cpuid_native_eax(1);
 
 	switch (x86_cpuid_vendor()) {
 	case X86_VENDOR_INTEL:
@@ -162,7 +162,7 @@ void load_ucode_ap(void)
 	if (dis_ucode_ldr)
 		return;
 
-	cpuid_1_eax = native_cpuid_eax(1);
+	cpuid_1_eax = cpuid_native_eax(1);
 
 	switch (x86_cpuid_vendor()) {
 	case X86_VENDOR_INTEL:
diff --git a/arch/x86/kernel/head32.c b/arch/x86/kernel/head32.c
index de001b2146ab..43aa1cfc1b65 100644
--- a/arch/x86/kernel/head32.c
+++ b/arch/x86/kernel/head32.c
@@ -146,7 +146,7 @@ void __init __no_stack_protector mk_early_pgtbl_32(void)
 
 #ifdef CONFIG_MICROCODE_INITRD32
 	/* Running on a hypervisor? */
-	if (native_cpuid_ecx(1) & BIT(31))
+	if (cpuid_native_ecx(1) & BIT(31))
 		return;
 
 	params = (struct boot_params *)__pa_nodebug(&boot_params);
diff --git a/drivers/firmware/efi/libstub/x86-5lvl.c b/drivers/firmware/efi/libstub/x86-5lvl.c
index 77359e802181..db347c91edb3 100644
--- a/drivers/firmware/efi/libstub/x86-5lvl.c
+++ b/drivers/firmware/efi/libstub/x86-5lvl.c
@@ -34,8 +34,8 @@ efi_status_t efi_setup_5level_paging(void)
 		return EFI_SUCCESS;
 
 	/* check for 5 level paging support */
-	if (native_cpuid_eax(0) < 7 ||
-	    !(native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & 31))))
+	if (cpuid_native_eax(0) < 7 ||
+	    !(cpuid_native_ecx(7) & (1 << (X86_FEATURE_LA57 & 31))))
 		return EFI_SUCCESS;
 
 	/* allocate some 32-bit addressable memory for code and a page table */
-- 
2.49.0

