Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD3F26656B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624809; cv=none; b=krJUS7Nh4vHijSovAXyjjdb+L7C1jCFamAFx5vS0jkbqx41dZX5yVpRfE+RR8cEplEKk9hUDu3S9yp5fO/9hY7LJRzid8nARikA0pPg8A6O/CaCfb47EVngNzriL0AsMdIGMPS97iu9ZVtTNFoB69xTipJlBd55JlTRG/XVjl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624809; c=relaxed/simple;
	bh=8vrpjqtgghNs7nruDK9aS3ZX/GAzMdKptutwcMr6yYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8v3q89SN3iQ35HlJ7kGUUtBU1sC4t0dts/fhjlRKFhkCcnMMHSIdguS6Bdo3yJkdBLyTpZLLX/KGAz98RUn2GG6aumPIziun+tAwZUgWrA6OxkGpUValQnTfxfyFnUUF1rsoQvv5lypwvFU1HFK12IsF8PNj9UkK9CFONniS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LLnaCgs9; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LLnaCgs9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 31B9940E0200;
	Mon, 14 Apr 2025 09:59:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IqCN81QKKX7G; Mon, 14 Apr 2025 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744624791; bh=lS1JEjSBGHz4mGjRGcbaBkT9E1rlFsMUX3LcRIEa6w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLnaCgs9N9+H5ow84C2jrjXU9twdnkTigpRbBHZXgXrNZpjB9lCNXdLzEbzfkYUKe
	 D9yPiaGgpuqzEM398ErR43CGqRq4zcq7NPuoMBAUPGaVCrjTWeZi6Q1qfGxCWdxRF2
	 1CG/X6EQvnqnbduRwzQmfv7KhSJpvAvJ2M4SDwiVRqgiEkedy9lTv1z4VF4gayS04P
	 ERAnTZ2lWFa9Ge/JNAaJhwmKW1GluwwI6Onz/YKeMbbInOD/Q7nVMQBdxL7MvuXem9
	 /p93vS0h++jfMstkQSUT20opwZycdcUzEVpep/njGfZ8mjXBMZJ72WreRevA6cnDxs
	 Pgp9mR12gEPh/9iSEIVRcsjCicwyTApKF5M6CUmcUIRMC2S3Ka/cVB7YbQaMSG83kr
	 TmvY911lZySABXd+5fGzAFNL49dZMzIXO3vQyiarsce20IY59yiWvs6rNULQ/GDmQl
	 6555LLUWGG+0k13nLIoswwqY2hod/kUqgFyUXEAroj8q2M6MgoSKUCSwXrWygMew/P
	 otpc7GYtjeLBa0bQvLMAUUpP3bBp83X2gQojdmFa8xxtwlUk/EJEmfahsKlMRHbOe9
	 I0cgJO6qun4CKhipN1KYCJHVvkI/gSsEo2RWdeNqonptI5z1+R/tTjPPco/IF+ukL2
	 17ZSqsz66XNmdh0Z9jD1JGk0=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 049E040E0247;
	Mon, 14 Apr 2025 09:59:42 +0000 (UTC)
Date: Mon, 14 Apr 2025 11:59:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -v2] x86/microcode: Consolidate the loader enablement checking
Message-ID: <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
References: <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
 <875xjcteq2.ffs@tglx>
 <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Consolidate the whole logic which determines whether the microcode loader
should be enabled or not into a single function and call it everywhere.

Well, almost everywhere - not in mk_early_pgtbl_32() because there the kernel
is running without paging enabled and checking dis_ucode_ldr et al would
require physical addresses and uglification of the code.

But since this is 32-bit, the easier thing to do is to simply map the initrd
unconditionally especially since that mapping is getting removed later anyway
by zap_early_initrd_mapping() and avoid the uglification.

Fixes: 4c585af7180c1 ("x86/boot/32: Temporarily map initrd for microcode loading")
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
Link: https://lore.kernel.org/r/CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com
---
 arch/x86/include/asm/microcode.h         |  2 ++
 arch/x86/kernel/cpu/microcode/amd.c      |  6 ++--
 arch/x86/kernel/cpu/microcode/core.c     | 40 ++++++++++++++----------
 arch/x86/kernel/cpu/microcode/intel.c    |  2 +-
 arch/x86/kernel/cpu/microcode/internal.h |  1 -
 arch/x86/kernel/head32.c                 |  4 ---
 6 files changed, 31 insertions(+), 24 deletions(-)

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
index 4a10d35e70aa..96cb992d50ef 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1098,15 +1098,17 @@ static enum ucode_state load_microcode_amd(u8 family, const u8 *data, size_t siz
 
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
index b3658d11e7b6..541a1478ccf0 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -41,8 +41,8 @@
 
 #include "internal.h"
 
-static struct microcode_ops	*microcode_ops;
-bool dis_ucode_ldr = true;
+static struct microcode_ops *microcode_ops;
+static bool dis_ucode_ldr = true;
 
 bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
 module_param(force_minrev, bool, S_IRUSR | S_IWUSR);
@@ -95,11 +95,13 @@ static bool amd_check_current_patch_level(void)
 	return false;
 }
 
-static bool __init check_loader_disabled_bsp(void)
+bool __init microcode_loader_disabled(void)
 {
-	static const char *__dis_opt_str = "dis_ucode_ldr";
-	const char *cmdline = boot_command_line;
-	const char *option  = __dis_opt_str;
+	if (dis_ucode_ldr)
+		return true;
+
+	if (!have_cpuid_p())
+		goto disable;
 
 	/*
 	 * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
@@ -107,17 +109,18 @@ static bool __init check_loader_disabled_bsp(void)
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
-
 	return dis_ucode_ldr;
+
+disable:
+	dis_ucode_ldr = true;
+	return true;
 }
 
 void __init load_ucode_bsp(void)
@@ -125,7 +128,10 @@ void __init load_ucode_bsp(void)
 	unsigned int cpuid_1_eax;
 	bool intel = true;
 
-	if (!have_cpuid_p())
+	if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") > 0)
+		dis_ucode_ldr = false;
+
+	if (microcode_loader_disabled())
 		return;
 
 	cpuid_1_eax = native_cpuid_eax(1);
@@ -146,9 +152,6 @@ void __init load_ucode_bsp(void)
 		return;
 	}
 
-	if (check_loader_disabled_bsp())
-		return;
-
 	if (intel)
 		load_ucode_intel_bsp(&early_data);
 	else
@@ -159,6 +162,11 @@ void load_ucode_ap(void)
 {
 	unsigned int cpuid_1_eax;
 
+	/*
+	 * Can't use microcode_loader_disabled() here - .init section
+	 * hell. It doesn't have to either - the BSP variant must've
+	 * parsed cmdline already anyway.
+	 */
 	if (dis_ucode_ldr)
 		return;
 
@@ -810,7 +818,7 @@ static int __init microcode_init(void)
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
