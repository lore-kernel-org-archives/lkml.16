Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E533991
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743966205; cv=none; b=mNLeB97eem0nOlU/fL7daHd2J+bA4JSrJHNY0IOWa8V6twWnpYhXnjLelif3JgpuQs6qddDkTh6j/CXUcIrK5KMwWf2Hmua1zYNSt2Wr5yF2u/s9XkM+dt1zaRP2uZWRVzoWZ/k0zyPmsBkkKgdW3aXBxKlnie+5hhl1keCFhw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743966205; c=relaxed/simple;
	bh=uGhDltPM+VgK0v5NXG0BQxf3D1fm1KXAixRkxvG8iNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxyaVFx/ckrtHeTPOp9W8eSjOKOVeZTc6IGgh5zYx87+FoPN+YorwdL+D1Wt/FDMKc+XchZc7d9l/2PgVzeIJ0CJPDVTA/sKW2NkUsb9yquMTIfvay1WeSlk3Hei7Z8zZXe9f52ODSiKYCyhW650P9CoVFzvXFVz/h5ICp/vRrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=M0gv7AkN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="M0gv7AkN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1627440E0219;
	Sun,  6 Apr 2025 19:03:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 02TKspydi2OS; Sun,  6 Apr 2025 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743966189; bh=BeygCYewOsclXW5aH59RHERo/DdYO+HWUHClne2EQgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0gv7AkNKnbf/0HAPK7pjEwVyBBOo/h6V32uzOz/I8gRK94HJbdp2X30QPdM16hks
	 H2sZaTbzOhpyMou97KZB68t6Z/XBD3fs+5ynYj17Q+Yc/WaKfRhmuhGQEWvCNDELpi
	 7ni8Y9z3bQ3JTyxdEVSFtwKwJmVf1ZAERevFNqAmJ2wwXubMg98xsJMTTkEAg72F4Y
	 ghKpbtGOvksCtpJWDC6snZ/D7k4Runhua0iq/FpFjBlyZS5Jxe3OM49PpcgxSzOJuJ
	 khMi39iGoSLG0NJqCrhv7DfNgMWnPOTlBHnKXXei1j8SOxJ/4gV7uMwDftGUpr55xN
	 7L89llPg6+TpxTnd8fu1LsCoTeuPXx38CITjMP/SaC6TKRQh5stel5rK1cg3xfBdkp
	 p9yf6ST/46cYT/j9D0yxzjHl4VvJ+UAhYustt/rnI+x7phHU4/pKHwT43atVTnXd24
	 4o78Xm1ynAP+/U6c8LQ7ZoPEbYJrys1D7PWzJnk8wZ5N5QOgo8V2tQ9V17jmJYINY2
	 GhArvWwPFFOqT/8YWnrdBxHDX2la2YCiO+7lIQJJO2k/lSJFZYHliPZMl+bQvDMhuX
	 LVMcDFH0GxMEQG/BFQUhM3/ySEcs46vHaES1fH6Zq/z5qMtRTi1o4bJcWS3k+tv1Gd
	 k++zKThLguSjykyzn8T4F5bI=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 352E940E0214;
	Sun,  6 Apr 2025 19:03:01 +0000 (UTC)
Date: Sun, 6 Apr 2025 21:02:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kevin Koster <lkml@ombertech.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250406174633.2c581923c145687476191753@ombertech.com>

On Sun, Apr 06, 2025 at 05:46:33PM +1000, Kevin Koster wrote:
> But if I move "cpuid_1_eax = native_cpuid_eax(1);" to after the
> microcode_loader_disabled() check in amd.c, like in the first patch, it
> boots fine!

Yeah, I noticed that too last night. Here's a hopefully better version after
I ran it on my 32-bit Atom - I don't have your old rust and maybe you should
simply throw it in the garbage - that thing is probably not worth the
electricity it uses to power up... :-)

Anyway, I wanna do this below.

The only hunk I'm not sure about is in mk_early_pgtbl_32() because I don't
want to uglify the loader checking code with __pa* macros just so that initrd
mapping is made conditional on whether the loader is enabled.

After all, zap_early_initrd_mapping() clears it right after there.

But let's see what tglx says as this is his code:

4c585af7180c ("x86/boot/32: Temporarily map initrd for microcode loading")

Thx.

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
index b61028cf5c8a..dda7f0d409e9 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1099,7 +1099,7 @@ static int __init save_microcode_in_initrd(void)
 	enum ucode_state ret;
 	struct cpio_data cp;
 
-	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
+	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
 		return 0;
 
 	if (!find_blobs_in_containers(&cp))
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
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
