Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C412232364
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132995; cv=none; b=l69xBE83hor2TbWNcqrEV9OtlogJe3fbHR5LK9A546Apop1TRnkjJ4y1acCeBFOeEWdyxbr20H1F9SGjgs4S1ihnynMXh6K0NMUK4C6WJsI9ITpWTk6T+7dZGzUK3YUfzxekkUcSVEG+W7+rajjCz+NR18uHAy/cw06RX/xeoHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132995; c=relaxed/simple;
	bh=nONWbrYo6jimOenvOAbjeNu7lkTeUWiJReZeUGGS7yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QV9/sW7hEuiJNGVWfFYJNiWsAlsLZqPEVupHvIjR7qzEcZTnD6UTlznmPM4Y5nIkHPNneGg/lZnYgQErYTa6lfvPf75ovowYdRgUTXyQiVtclgXgj3P85YyVQgrdqcrdswhxuGLhlH/a5cTz+F3+P40VfOw6dQGJXlnYjiQH9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VRqYbkpP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VRqYbkpP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E1DA640E021C;
	Tue,  8 Apr 2025 17:23:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6ds4UuWWjMWh; Tue,  8 Apr 2025 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744132984; bh=hLeG6OsW49xTuuLJsxFbaMO1FAqFmzw9+G1fKJmXkU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRqYbkpPLSKPBXZfEgT0sqZX+btxqDOV5Epbv+VhCKSrl9jXjc5faldQWf4mHguhC
	 doAIGpyQkiXJA0pGj8XspELuVhEr1FKOSvzhH7shFTPWZ7WZaPcxsvbvkNUnRnXsk6
	 qGFNfTHHziyiGkdVNPdyd5EtojNS5yTwUUcEiLxHFRuvaD514yfE9ZulsNncUW5HUw
	 RJYTfINYKhv0iEJIaWx64jccMSOJvcgImTJrtjENJr1KhD/JqoTp8LrAoQvSe2DS1c
	 6ekVGhx2alD4pL89wG2q8verOP5Ie82O6qiUEh2L4xFtLcNxL46HtnUiQXMUG4B98Y
	 /5FhbB+sn5kQDgwFDE3+03Bxb0Gx//GS/z8VxS2fklj2iBxx32ZrFhM1eyJpaujzId
	 wZiRW6oTmNPruZVmhhWqMgd5gVkmU8fAwfpS5KyFuLKk2Akh48ZmAPxETe2zH7N1CU
	 YPLrRV79E/YXy5oysmhy9I3Rq/7yO1Dvn7XdoKGtzg3+43tyX7DOK9N7qTSqkqms/z
	 BLF/pTv3MVQfpEeFWzt5siAUCXPKZmsySxURN5YVxbALpAkei8h9XlcLSWsF5RtSTG
	 7fz8QOdW2yZZDqh4I4KEAY97t0AL5a8ITQt0De6gSdtZ5ccj+uNSYwMCLpetuBsUA7
	 tG4jfbP/7H906psSmaQi5Qeo=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9517240E019F;
	Tue,  8 Apr 2025 17:22:56 +0000 (UTC)
Date: Tue, 8 Apr 2025 19:22:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kevin Koster <lkml@ombertech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/microcode: Consolidate the loader enablement
Message-ID: <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Sat, 5 Apr 2025 12:35:55 +0200

Consolidate the whole logic which determines whether the microcode
loader should be enabled or not into a single function and call it
everywhere.

Well, almost everywhere - not in mk_early_pgtbl_32() because there the
kernel is running without paging enabled and checking dis_ucode_ldr et
al would require physical addresses and uglification of the code.

But since this is 32-bit, the easier thing to do is to simply map the
initrd unconditionally especially since that mapping is getting removed
later anyway by zap_early_initrd_mapping().

Fixes: 4c585af7180c1 ("x86/boot/32: Temporarily map initrd for microcode loading")
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
Link: https://lore.kernel.org/r/CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com
---
 arch/x86/include/asm/microcode.h         |  2 ++
 arch/x86/kernel/cpu/microcode/amd.c      |  6 ++--
 arch/x86/kernel/cpu/microcode/core.c     | 37 ++++++++++++++----------
 arch/x86/kernel/cpu/microcode/intel.c    |  2 +-
 arch/x86/kernel/cpu/microcode/internal.h |  1 -
 arch/x86/kernel/head32.c                 |  4 ---
 6 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 695e569159c1..d53148fb893a 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -17,10 +17,12 @@ struct ucode_cpu_info {
 void load_ucode_bsp(void);
 void load_ucode_ap(void);
 void microcode_bsp_resume(void);
+bool __init microcode_loader_disabled(void);
 #else
 static inline void load_ucode_bsp(void)	{ }
 static inline void load_ucode_ap(void) { }
 static inline void microcode_bsp_resume(void) { }
+bool __init microcode_loader_disabled(void) { return false; }
 #endif
 
 extern unsigned long initrd_start_early;
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index b61028cf5c8a..9b7b725643ef 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1093,15 +1093,17 @@ static enum ucode_state load_microcode_amd(u8 family, const u8 *data, size_t siz
 
 static int __init save_microcode_in_initrd(void)
 {
-	unsigned int cpuid_1_eax = native_cpuid_eax(1);
 	struct cpuinfo_x86 *c = &boot_cpu_data;
 	struct cont_desc desc = { 0 };
+	unsigned int cpuid_1_eax;
 	enum ucode_state ret;
 	struct cpio_data cp;
 
-	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
+	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
 		return 0;
 
+	cpuid_1_eax = native_cpuid_eax(1);
+
 	if (!find_blobs_in_containers(&cp))
 		return -EINVAL;
 
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..b6125149894b 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -42,7 +42,7 @@
 #include "internal.h"
 
 static struct microcode_ops	*microcode_ops;
-bool dis_ucode_ldr = true;
+static int dis_ucode_ldr = -1;
 
 bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
 module_param(force_minrev, bool, S_IRUSR | S_IWUSR);
@@ -95,11 +95,20 @@ static bool amd_check_current_patch_level(void)
 	return false;
 }
 
-static bool __init check_loader_disabled_bsp(void)
+bool __init microcode_loader_disabled(void)
 {
-	static const char *__dis_opt_str = "dis_ucode_ldr";
-	const char *cmdline = boot_command_line;
-	const char *option  = __dis_opt_str;
+	if (dis_ucode_ldr < 0) {
+		if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") <= 0)
+			dis_ucode_ldr = 0;
+		else
+			goto disable;
+	}
+
+	if (dis_ucode_ldr > 0)
+		return true;
+
+	if (!have_cpuid_p())
+		goto disable;
 
 	/*
 	 * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
@@ -107,17 +116,18 @@ static bool __init check_loader_disabled_bsp(void)
 	 * that's good enough as they don't land on the BSP path anyway.
 	 */
 	if (native_cpuid_ecx(1) & BIT(31))
-		return true;
+		goto disable;
 
 	if (x86_cpuid_vendor() == X86_VENDOR_AMD) {
 		if (amd_check_current_patch_level())
-			return true;
+			goto disable;
 	}
 
-	if (cmdline_find_option_bool(cmdline, option) <= 0)
-		dis_ucode_ldr = false;
+	return (bool)dis_ucode_ldr;
 
-	return dis_ucode_ldr;
+disable:
+	dis_ucode_ldr = 1;
+	return true;
 }
 
 void __init load_ucode_bsp(void)
@@ -125,7 +135,7 @@ void __init load_ucode_bsp(void)
 	unsigned int cpuid_1_eax;
 	bool intel = true;
 
-	if (!have_cpuid_p())
+	if (microcode_loader_disabled())
 		return;
 
 	cpuid_1_eax = native_cpuid_eax(1);
@@ -146,9 +156,6 @@ void __init load_ucode_bsp(void)
 		return;
 	}
 
-	if (check_loader_disabled_bsp())
-		return;
-
 	if (intel)
 		load_ucode_intel_bsp(&early_data);
 	else
@@ -810,7 +817,7 @@ static int __init microcode_init(void)
 	struct cpuinfo_x86 *c = &boot_cpu_data;
 	int error;
 
-	if (dis_ucode_ldr)
+	if (microcode_loader_disabled())
 		return -EINVAL;
 
 	if (c->x86_vendor == X86_VENDOR_INTEL)
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 819199bc0119..2a397da43923 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -389,7 +389,7 @@ static int __init save_builtin_microcode(void)
 	if (xchg(&ucode_patch_va, NULL) != UCODE_BSP_LOADED)
 		return 0;
 
-	if (dis_ucode_ldr || boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
+	if (microcode_loader_disabled() || boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
 	uci.mc = get_microcode_blob(&uci, true);
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 5df621752fef..50a9702ae4e2 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -94,7 +94,6 @@ static inline unsigned int x86_cpuid_family(void)
 	return x86_family(eax);
 }
 
-extern bool dis_ucode_ldr;
 extern bool force_minrev;
 
 #ifdef CONFIG_CPU_SUP_AMD
diff --git a/arch/x86/kernel/head32.c b/arch/x86/kernel/head32.c
index de001b2146ab..375f2d7f1762 100644
--- a/arch/x86/kernel/head32.c
+++ b/arch/x86/kernel/head32.c
@@ -145,10 +145,6 @@ void __init __no_stack_protector mk_early_pgtbl_32(void)
 	*ptr = (unsigned long)ptep + PAGE_OFFSET;
 
 #ifdef CONFIG_MICROCODE_INITRD32
-	/* Running on a hypervisor? */
-	if (native_cpuid_ecx(1) & BIT(31))
-		return;
-
 	params = (struct boot_params *)__pa_nodebug(&boot_params);
 	if (!params->hdr.ramdisk_size || !params->hdr.ramdisk_image)
 		return;
-- 
2.43.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
