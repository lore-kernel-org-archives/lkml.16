Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055FDF59
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845580; cv=none; b=ENqaG9QYBMpZDOh1uWuGFdsgab+mX3cCoS+4FadSLOtKpsLF1M2d3PONDTiQDD/GeRandV5RtKK3V7iQjv+l5/1nc+5vGaJdsBBqFeHX6W+xh0T/hm3MdoPcAFfMHHIGvrY6/HafIpPtqFqi8g91wDTBlatW2fHA9hbQzmH5f34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845580; c=relaxed/simple;
	bh=ZtnldJ4aHLx80uqAG3xwd0UUoMHMSrLb0C1E/w6fF90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJnWRqtrlJQNzvphfK24mXRWSNn5JWmxQQIx6+giihlf0Zt6d8E0nLl6izFgSDjVLlg8vQQp8Eog1FIGJ4WEITRc1vNDsGEl6CecnlNGnB6DrxW8rnkz7WKm30kU/gRTywST2q+O0ISLB/uDOX9V0D8j1bzMpEGXy7JGkH2mP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Cg6D7dlk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Cg6D7dlk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 850BE40E0214;
	Sat,  5 Apr 2025 09:32:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gnp02nHDlOLS; Sat,  5 Apr 2025 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743845561; bh=jsvXZ74841MsrS2xtyuWcjLCsPRFhPZs8mVdawU7Zno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg6D7dlkZ+sQQ72sEIeu0I2yGvs8z7LG1I9xH7/3+wXzzGGCJeynb0VR6WOjEMj4Y
	 M132gIzpDNIZC+I6VlBpOq+ywJe3MLtUBRf+piOi0qi3YWj16W1hYaNr0eT/anwV+W
	 7Uz1rihsWkcuTIV23vVhMFl75dsjzDaCyGBL2DHyVtkE+n6T2/4jqHhv7nyy9QeNzV
	 vRkeE/yaSCbJCl2fp1W4U3vVobDZawIZbb4lnC8vlqGRJrivNA5GpFO7A0MZ4O8p5k
	 pOiIf1pFxL6e6eyW98Z6rHw0vPeg9/nSOWS5SLnGBYyrj3rZy99LemT9Ss++muq5Hm
	 iY4/EbBqv7lpy0tkZkNp2OvoQOMakZm1jcPGb5jhZLX3yDNPFuncGURiCYl2vBkuo9
	 iMZS2Y7r8iFgeG8SA9s5HyLGzP1kZORrgqCgwlI7Hlw1inuZ1+SLWx6RdLqUO90QiC
	 XIhniQWDegYXu2a/8oVFNH/cbzfoQo+D4ZcsHAKl4juaNP00K2M8RAZKJZWCzU2Qi5
	 gmsgmTfO9I7X+ugKxKUa087XUZ2Ho5q+szOpBiuZzIntAB+ctJWBvGHCMgHth5PmxI
	 L+q0nAgNZP4FBTS2vFmc9q7YiKtnVVOfUEPhGhcUqbC3YTnvUj5pRM92tB5oirb9b3
	 XpCffz01rT7OojlD8tWbvNio=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 16AAA40E01FF;
	Sat,  5 Apr 2025 09:32:33 +0000 (UTC)
Date: Sat, 5 Apr 2025 11:32:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250405130306.ca9822c1f27db119cc973603@ombertech.com>

On Sat, Apr 05, 2025 at 01:03:06PM +1100, Kevin Koster wrote:
> On Sat, 19 Oct 2024 08:29:04 +0200
> Oerg866 <oerg866@googlemail.com> wrote:
> 
> > Starting with v6.7-rc1, the kernel was no longer able to boot on early
> > i486-class CPUs.
> 
> Thanks for this patch! It solves my problem with kernel 6.12.11
> rebooting at start-up on 486 CPUs, which had me puzzled. (tested on
> AM486DX2-66 and CX486DX4-100)
> 
> Is there a reason why the patch wasn't accepted?

Yes, too many patches, too little time. :-(

Anyway, does the one below - only build-tested - work for both y'all too?

---
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
index b3658d11e7b6..972338a2abae 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -95,12 +95,15 @@ static bool amd_check_current_patch_level(void)
 	return false;
 }
 
-static bool __init check_loader_disabled_bsp(void)
+bool __init microcode_loader_disabled(void)
 {
 	static const char *__dis_opt_str = "dis_ucode_ldr";
 	const char *cmdline = boot_command_line;
 	const char *option  = __dis_opt_str;
 
+	if (!have_cpuid_p())
+		return true;
+
 	/*
 	 * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
 	 * completely accurate as xen pv guests don't see that CPUID bit set but
@@ -146,7 +149,7 @@ void __init load_ucode_bsp(void)
 		return;
 	}
 
-	if (check_loader_disabled_bsp())
+	if (microcode_loader_disabled())
 		return;
 
 	if (intel)
diff --git a/arch/x86/kernel/head32.c b/arch/x86/kernel/head32.c
index de001b2146ab..f29dc9c95c50 100644
--- a/arch/x86/kernel/head32.c
+++ b/arch/x86/kernel/head32.c
@@ -145,8 +145,7 @@ void __init __no_stack_protector mk_early_pgtbl_32(void)
 	*ptr = (unsigned long)ptep + PAGE_OFFSET;
 
 #ifdef CONFIG_MICROCODE_INITRD32
-	/* Running on a hypervisor? */
-	if (native_cpuid_ecx(1) & BIT(31))
+	if (microcode_loader_disabled())
 		return;
 
 	params = (struct boot_params *)__pa_nodebug(&boot_params);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
