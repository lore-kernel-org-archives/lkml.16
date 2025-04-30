Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604E3B2A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746040621; cv=none; b=h+VHQE54rFx9fgYyNMLmrIfzWe038JHXI+y3N8iKbCdTUFFZ5aAB/sSsRfOpGFmZWoCJe6DYBRaJA9l2UXAOZz9w/essJXWWoDsbrY/79ndsAruvmRO+tWqAE2zfqpcm/SclavO1R8/qdiU3eOYYBihB0gM01e7gRJGULgRuYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746040621; c=relaxed/simple;
	bh=Mzmquvf7LtMgiAFwuTVlEEXVwfoajArsBFRVJZgRlvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cocUqlisQzzuTps5EC/+7vHJEUG0oJh1sOR7nB4+ZvuX/LGyuxD1tDtfOvXVStHffbYtLwWv7lCKByHfbyGdd3EjVcB3KFmt6/bUquGLO/Hh/WGvUNG5tUQ3mH3kfBtpOhF1SuqpOMPBY1ah+fiE9dNPe+bMdbUCc7Iz2TteIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l3xihCbD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WPDe6rmx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l3xihCbD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WPDe6rmx"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746040617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DdMaZNWu4fq0iykzoFc0UbPlCGvg4LzeewKoTcB+Q0E=;
	b=l3xihCbD010C/ezfMGQLsYjwu40X59Wrka1MzDeIklw2VJbWPZ7R34ld21sBZCc+js2Si0
	kA9cTaUl1Bgomo+91hq6KyC8BcXeFznbWacYCBVUl7bphf3plz8VdK2iEYgfi6+ulQLDxp
	ZCznvSxM/YKNm6U53VMSY5ewZo/onBMfmhmAIcDLNQuKB/HRajnF5nGrzY+OLnfIWarwlD
	SoQc7sIKpiAPHav/BFDWO0QlR9s5YEDvp9uaRA5F8B8ZfxrnyQoyKG+976PUWKhQ5VF0rY
	gqT+MgAXqrs2DpYJH5dWyTF3nVzT2HgVlAcVO1eEcOtH55EataVww3FD8sfVHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746040617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DdMaZNWu4fq0iykzoFc0UbPlCGvg4LzeewKoTcB+Q0E=;
	b=WPDe6rmxWOsdaZ1Fvy8fYpR1+6aGqAnpDr1GL5Dgv5MskgEdHqCpfqQRRn4g905FeqILNh
	bVRZ+9sqdd1g2dCw==
To: Borislav Petkov <bp@alien8.de>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH -v2] x86/microcode: Consolidate the loader enablement
 checking
In-Reply-To: <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
References: <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local> <875xjcteq2.ffs@tglx>
 <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
 <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
Date: Wed, 30 Apr 2025 21:16:56 +0200
Message-ID: <87frhppihj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 14 2025 at 11:59, Borislav Petkov wrote:
> -static bool __init check_loader_disabled_bsp(void)
> +bool __init microcode_loader_disabled(void)
>  {
> -	static const char *__dis_opt_str = "dis_ucode_ldr";
> -	const char *cmdline = boot_command_line;
> -	const char *option  = __dis_opt_str;
> +	if (dis_ucode_ldr)
> +		return true;
> +
> +	if (!have_cpuid_p())
> +		goto disable;
>  
>  	/*
>  	 * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
> @@ -107,17 +109,18 @@ static bool __init check_loader_disabled_bsp(void)
>  	 * that's good enough as they don't land on the BSP path anyway.
>  	 */
>  	if (native_cpuid_ecx(1) & BIT(31))
> -		return true;
> +		goto disable;
>  
>  	if (x86_cpuid_vendor() == X86_VENDOR_AMD) {
>  		if (amd_check_current_patch_level())
> -			return true;
> +			goto disable;
>  	}
>  
> -	if (cmdline_find_option_bool(cmdline, option) <= 0)
> -		dis_ucode_ldr = false;
> -
>  	return dis_ucode_ldr;

This return here is confusing at best. The only valid return value is
'false' according to the above logic, because nothing modifies
dis_ucode_ldr and that must be false according to the top-most check,
no?

Something like the delta patch below makes it way more obvious and gets
rid of the ugly gotos as well.

Thanks,

        tglx
---
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -84,6 +84,9 @@ static bool amd_check_current_patch_leve
 	u32 lvl, dummy, i;
 	u32 *levels;
 
+	if (x86_cpuid_vendor() != X86_VENDOR_AMD)
+		return false;
+
 	native_rdmsr(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
 
 	levels = final_levels;
@@ -100,27 +103,25 @@ bool __init microcode_loader_disabled(vo
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
+	 * 1) The CPU does not support cpuid_p
+	 *
+	 * 2) Bit 31 in CPUID[1]:ECX is clear
+	 *    The bit is reserved for hypervisor use. This is still not
+	 *    completely accurate as XEN PV guests don't see that CPUID bit
+	 *    set, but that's good enough as they don't land on the BSP
+	 *    path anyway.
+	 *
+	 * 3) The AMD specific patch level check succeeds
 	 */
-	if (native_cpuid_ecx(1) & BIT(31))
-		goto disable;
-
-	if (x86_cpuid_vendor() == X86_VENDOR_AMD) {
-		if (amd_check_current_patch_level())
-			goto disable;
+	if (!have_cpuid_p() || native_cpuid_ecx(1) & BIT(31) ||
+	    amd_check_current_patch_level()) {
+		dis_ucode_ldr = true;
+		return true;
 	}
-
-	return dis_ucode_ldr;
-
-disable:
-	dis_ucode_ldr = true;
-	return true;
+	return false;
 }
 
 void __init load_ucode_bsp(void)


