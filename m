Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EFB3C465
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202955; cv=none; b=joCs6gMsF+f43OYVPE6pY1gzOayBjfi8KkIZujmsqDYs9bapF4Q0T8mocoT+UDsFruQHGkLRalL4W7bz9tKTKIpv3RWj3ZemeceelPkJ5CtUeCnQwt3f1sIR2BdsHXLsC92SreAu6PcexWedI+UyXwACgxCXXolR1jisFuoj9fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202955; c=relaxed/simple;
	bh=GmZVisjY0OH449XCfn6FqZPqa1pOcVYvaKNhRd2Uf5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQtAjWRpeE50jk721sD+TeZE25UWF1BIj/GbpSzcPyPnpDqijp9aSmvtwcALscI40+SBd+ZdsB0Ze8c3ambFwMbgvzjb4+zW4TfIFo0sAgk4B57VnpFNAHjrZxia3a97Qd88iLz0QeLs/+5Pa5Hrv3BhIChRZ3sV2CHYwlGvffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Eh3v2fgc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Eh3v2fgc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 86E1040E01CF;
	Fri,  2 May 2025 16:22:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fnix6VhFSBuo; Fri,  2 May 2025 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746202944; bh=nxUOAc5/++coi1p2MZ5Io4zCtrvTkKWFaUc6krNvqvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eh3v2fgcd18+0b5mN4LNkue16Et2FqIVQWHg3BizBCL4jhaRwu/InBlwKHr5dkwEU
	 0xrwY+s3DZ7yFE/5ePt/z3kvEyGxWGGJyIbKMP5vmD3qq//lijLZL5aN8vUYu/npV/
	 0VId7wYwC1XPvQcJeeDhgPc0W1Ez9vQV6bfKEBwywtfQVmHa0FNc8a0RkdkcHA1dRJ
	 bywGF4Y3zcwQWcb/I6gmijIaWIiB2aJ9Q1nDlCaOwvXhkYIrfnB0ZVkcLpHRIAo6Zh
	 4FZ2xEWAX63L0RybRzeXhY9KAXrLephCn5IyYtoqowQYoCRy2Q0RXWHRw2zUA2sckc
	 srHr3eiOG6W0LeFxrbWoEel+jloFMM0m+G699DKQ4osOy5zSSpvpyivBtOHen692l5
	 erM5ZC4iBVUw/ynbezvqIuP8evwukurwWKCA7xMf0Q67ysNYWJq78CVqLALbRS99P8
	 rZsaeO0jD9DbEvXT7Lkju+bbCCU5qjJuIWQZdZaFipLhuFGEHy28QNKVcTPUw4M1Xr
	 jgW+WgsybbLCMoxEpzvNngh3OSkbFADP5LZTz7BYK8jG8STPIvINqERZ9LvNBVcP0t
	 pmwpArDPKk548InKgRC+3LuyG5ZZ8JaaAWgdN1VB4tUee6UowUbdAXKFoJqU5dImFI
	 XaktQNLsdvF7iVh0kEbyIMK4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7E66F40E0192;
	Fri,  2 May 2025 16:22:16 +0000 (UTC)
Date: Fri, 2 May 2025 18:22:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -v2] x86/microcode: Consolidate the loader enablement
 checking
Message-ID: <20250502162210.GCaBTxMhdUT_Iw3_bj@fat_crate.local>
References: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
 <875xjcteq2.ffs@tglx>
 <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
 <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
 <87frhppihj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87frhppihj.ffs@tglx>

On Wed, Apr 30, 2025 at 09:16:56PM +0200, Thomas Gleixner wrote:
> This return here is confusing at best. The only valid return value is
> 'false' according to the above logic, because nothing modifies
> dis_ucode_ldr and that must be false according to the top-most check,
> no?

You mean the return value is the build-time dis_ucode_ldr value which is true.
Well, *was* true, keep on reading.

I.e., the loader was default-disabled unless we decide it is ok to turn it on.

Now that I look at it, this double-negation looks gross:

disable:
        dis_ucode_ldr = true;

"disable the disable loader". Pfff.

> 
> Something like the delta patch below makes it way more obvious and gets
> rid of the ugly gotos as well.

Almost. When we *enable* the loader, we must set dis_ucode_ldr to false. IOW,
we must write dis_ucode_ldr to the newly detected value because
load_ucode_ap() checks it because it can't call microcode_loader_disabled()
because of this:

        /*
         * Can't use microcode_loader_disabled() here - .init section
         * hell. It doesn't have to either - the BSP variant must've
         * parsed cmdline already anyway.
         */


IOW, yours a bit modified. Still untested ofc.

---
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 7771755481ed..652198805ee3 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -42,7 +42,7 @@
 #include "internal.h"
 
 static struct microcode_ops *microcode_ops;
-static bool dis_ucode_ldr = true;
+static bool dis_ucode_ldr = false;
 
 bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
 module_param(force_minrev, bool, S_IRUSR | S_IWUSR);
@@ -84,6 +84,9 @@ static bool amd_check_current_patch_level(void)
 	u32 lvl, dummy, i;
 	u32 *levels;
 
+	if (x86_cpuid_vendor() != X86_VENDOR_AMD)
+		return false;
+
 	native_rdmsr(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
 
 	levels = final_levels;
@@ -100,27 +103,28 @@ bool __init microcode_loader_disabled(void)
 	if (dis_ucode_ldr)
 		return true;
 
-	if (!have_cpuid_p())
-		goto disable;
-
 	/*
-	 * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
-	 * completely accurate as xen pv guests don't see that CPUID bit set but
-	 * that's good enough as they don't land on the BSP path anyway.
+	 * Disable when:
+	 *
+	 * 1) The CPU does not support CPUID
+	 *
+	 * 2) Bit 31 in CPUID[1]:ECX is clear
+	 *    The bit is reserved for hypervisor use. This is still not
+	 *    completely accurate as XEN PV guests don't see that CPUID bit
+	 *    set, but that's good enough as they don't land on the BSP
+	 *    path anyway.
+	 *
+	 * 3) Certain AMD patch levels are not allowed to be
+	 *    overwritten.
 	 */
-	if (native_cpuid_ecx(1) & BIT(31))
-		goto disable;
-
-	if (x86_cpuid_vendor() == X86_VENDOR_AMD) {
-		if (amd_check_current_patch_level())
-			goto disable;
-	}
+	if (!have_cpuid_p() ||
+	    native_cpuid_ecx(1) & BIT(31) ||
+	    amd_check_current_patch_level())
+		dis_ucode_ldr = true;
+	else
+		dis_ucode_ldr = false;
 
 	return dis_ucode_ldr;
-
-disable:
-	dis_ucode_ldr = true;
-	return true;
 }
 
 void __init load_ucode_bsp(void)
@@ -129,7 +133,7 @@ void __init load_ucode_bsp(void)
 	bool intel = true;
 
 	if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") > 0)
-		dis_ucode_ldr = false;
+		dis_ucode_ldr = true;
 
 	if (microcode_loader_disabled())
 		return;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
