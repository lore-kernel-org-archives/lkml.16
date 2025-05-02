Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2569211C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746213324; cv=none; b=MifYsv+/StQnVtqssQqqlK8bt8Vvz+6mfxDH7Z8XsIlW8rfOERy9fWGi50uDsBwRahrv0PMhIlPcC7G9Gwn89BKReqfGa/NIBkC9Kbx7zHiqo1HorQvONtpnVQr9kuG2E+kkV+eaxxo+egJUMycvjJiBLYTYhotdh8dJfCd2PXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746213324; c=relaxed/simple;
	bh=YuQ6sYeZWDqXQlWKOJ9AMWO1R7mDoJTLawFYLpQ9rzY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EaDoB4j67wlzgyWaXrWMLiSIS+EqedFXGMsNmNsxkk0yBTpjmdPyWj0fA9Z3xDXL9pKFmo+r7KPvd1KwvpuGLuyt9EX1cVYoIq1EF65ipR74Uj92x54+T1ZJBI7bcEHIZBYqh+PiDN/Tbk/gCWDLvFlsB+8htJK5SO3rFyCjMKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M1Lxt7lE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yyLQAK5e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M1Lxt7lE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yyLQAK5e"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746213320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qmuBtyMRS3IDSg/UvXGWAy8MjsYUeJZg794cqy74t1I=;
	b=M1Lxt7lEJqnyYIRFcSqbZinxO7uD/hmbLPg2sZDIIpSNMCshYVX0//9rJE51sPZg93sgh7
	gLYzP8Zs82ynz4lDnQ5lfchYBsVOD6naRvgYSX1g8nJoWT89Gw2yCvJui6phgXWT7R7pOz
	FaVg/x5wn0GkwSpFDu6LnxfURsW62fTWgOwqJcb3RJB6nspi0cefMsXIs69impuAfsplIr
	CAGAmSBsq9S6OqNiVTWkAeSJVRYOZR7yvjg5Z0zD5elQ9ty0ZAQOBZrt5uG2hbqRfn7EFf
	sDKKvfbUeWOnEZ0ora0vfRjs3LQkR5oskt11rRsrdPEgD1y5Wa4cewtlfdiUDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746213320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qmuBtyMRS3IDSg/UvXGWAy8MjsYUeJZg794cqy74t1I=;
	b=yyLQAK5eWmGz8firrZ3hb9sJHduLxHn6Rt11gcO36PQ9uoH2qwEkHidkTRY51IeM+qrJr2
	bXiTpx09bHwXDrCg==
To: Borislav Petkov <bp@alien8.de>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH -v2] x86/microcode: Consolidate the loader enablement
 checking
In-Reply-To: <20250502162210.GCaBTxMhdUT_Iw3_bj@fat_crate.local>
References: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local> <875xjcteq2.ffs@tglx>
 <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
 <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local> <87frhppihj.ffs@tglx>
 <20250502162210.GCaBTxMhdUT_Iw3_bj@fat_crate.local>
Date: Fri, 02 May 2025 21:15:19 +0200
Message-ID: <87zffuomd4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 02 2025 at 18:22, Borislav Petkov wrote:
> On Wed, Apr 30, 2025 at 09:16:56PM +0200, Thomas Gleixner wrote:
>> This return here is confusing at best. The only valid return value is
>> 'false' according to the above logic, because nothing modifies
>> dis_ucode_ldr and that must be false according to the top-most check,
>> no?
>
> You mean the return value is the build-time dis_ucode_ldr value which is true.
> Well, *was* true, keep on reading.
>
> I.e., the loader was default-disabled unless we decide it is ok to turn it on.
>
> Now that I look at it, this double-negation looks gross:
>
> disable:
>         dis_ucode_ldr = true;
>
> "disable the disable loader". Pfff.

Indeed and it's all confusing because at the top of the function you
have:

	if (dis_ucode_ldr)                                                                                                                                                                                                                                                                                            
		return true;                                                                                                                                                                                                                                                                                          

That means, that dis_ucode_ldr must be false when it reaches

     	return dis_ucode_ldr;

in your original patch, no?

>> Something like the delta patch below makes it way more obvious and gets
>> rid of the ugly gotos as well.
>
> Almost. When we *enable* the loader, we must set dis_ucode_ldr to false. IOW,
> we must write dis_ucode_ldr to the newly detected value because
> load_ucode_ap() checks it because it can't call microcode_loader_disabled()
> because of this:
>
>         /*
>          * Can't use microcode_loader_disabled() here - .init section
>          * hell. It doesn't have to either - the BSP variant must've
>          * parsed cmdline already anyway.
>          */
>
>
> IOW, yours a bit modified. Still untested ofc.
>
> ---
> diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
> index 7771755481ed..652198805ee3 100644
> --- a/arch/x86/kernel/cpu/microcode/core.c
> +++ b/arch/x86/kernel/cpu/microcode/core.c
> @@ -42,7 +42,7 @@
>  #include "internal.h"
>  
>  static struct microcode_ops *microcode_ops;
> -static bool dis_ucode_ldr = true;
> +static bool dis_ucode_ldr = false;
>  
>  bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
>  module_param(force_minrev, bool, S_IRUSR | S_IWUSR);
> @@ -84,6 +84,9 @@ static bool amd_check_current_patch_level(void)
>  	u32 lvl, dummy, i;
>  	u32 *levels;
>  
> +	if (x86_cpuid_vendor() != X86_VENDOR_AMD)
> +		return false;
> +
>  	native_rdmsr(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
>  
>  	levels = final_levels;
> @@ -100,27 +103,28 @@ bool __init microcode_loader_disabled(void)
>  	if (dis_ucode_ldr)
>  		return true;
>  
> -	if (!have_cpuid_p())
> -		goto disable;
> -
>  	/*
> -	 * CPUID(1).ECX[31]: reserved for hypervisor use. This is still not
> -	 * completely accurate as xen pv guests don't see that CPUID bit set but
> -	 * that's good enough as they don't land on the BSP path anyway.
> +	 * Disable when:
> +	 *
> +	 * 1) The CPU does not support CPUID
> +	 *
> +	 * 2) Bit 31 in CPUID[1]:ECX is clear
> +	 *    The bit is reserved for hypervisor use. This is still not
> +	 *    completely accurate as XEN PV guests don't see that CPUID bit
> +	 *    set, but that's good enough as they don't land on the BSP
> +	 *    path anyway.
> +	 *
> +	 * 3) Certain AMD patch levels are not allowed to be
> +	 *    overwritten.
>  	 */
> -	if (native_cpuid_ecx(1) & BIT(31))
> -		goto disable;
> -
> -	if (x86_cpuid_vendor() == X86_VENDOR_AMD) {
> -		if (amd_check_current_patch_level())
> -			goto disable;
> -	}
> +	if (!have_cpuid_p() ||
> +	    native_cpuid_ecx(1) & BIT(31) ||
> +	    amd_check_current_patch_level())
> +		dis_ucode_ldr = true;
> +	else
> +		dis_ucode_ldr = false;

This still does not make any sense, because if dis_ucode_ldr == true
when this function is called then the first check immediately returns.

So dis_ucode_ldr _IS_ false when this code is reached, no?
  
Thanks,

        tglx
