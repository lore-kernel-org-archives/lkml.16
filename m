Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E00254B16
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227819; cv=none; b=HwDVNjnG5N+xKat/ZogbSiGJOUO4a8yErD5M3YQTqZA8S+UPIEWFMb2tLzJ9xaHzjsl5+IGPSKk99UU5oUnwpzbh7sp3lnQes8tRSdGKQav22ixwWRbHMD5HT0JArB8QQ6Jeyzd7Mh1pRStkJeYIQD1bKB60hDRP0ul0uReaipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227819; c=relaxed/simple;
	bh=Wb+45gPEf/20Zpf4ACHISTZsESbTgHpFa70rqm2g/88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dObEx3QLGQG3qIIrDt1mKIcXf0xNfbfIElSFkP5eCv8rsj+jnu+TlxIdP4PA7l18SkCoAjwR8sfSHwOmLl2nA8s3/b5xzl+T5Devy9TMwZ1ecREm43iJfyANh50Z3JlbrDD+Sys0PvTu+7D0d/3pUl6ScBoP91VRaco+Ob3MROs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM5Ac2v/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM5Ac2v/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1332C4CED1;
	Mon, 10 Feb 2025 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739227818;
	bh=Wb+45gPEf/20Zpf4ACHISTZsESbTgHpFa70rqm2g/88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cM5Ac2v/Di5k05eaTYIpt1WoDN7XmbsMNK3Fw1M+zwvzzbLXm8Tf0nNdq2aM6ZyIO
	 Drys65HWOvIDTmqDFu0ImFqdPVANi8gXItNI/3izjK4m4yek1lMSC9DI6UC5U4TMvr
	 fA8AhNd264t5C2S97LCDxf89U/XXfqgBCIp5MV/46rwV6O9/l7p85TPtpbRE+xQqcD
	 orrCZ7vnzIHGLeyCJrQn6MICRjTNrFrGIHeaJDNsnPNPC5OyuC/Qk4Jpe7p/XPUtCp
	 CTliCPxUjZuPPZfi9io1P3HJNT76h4XYJYeOkWZkn3d/QrTnxcC4l8HdQlMnA6cudS
	 RL/yy4v2KmkMA==
Date: Mon, 10 Feb 2025 14:50:16 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
Message-ID: <20250210225016.cosuartrzzuaftqf@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-6-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-6-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:45PM -0600, David Kaplan wrote:
> @@ -400,48 +402,71 @@ static void __init taa_select_mitigation(void)
>  		return;
>  	}
>  
> -	if (cpu_mitigations_off()) {
> +	if (cpu_mitigations_off())
>  		taa_mitigation = TAA_MITIGATION_OFF;
> -		return;
> -	}
>  
>  	/*
>  	 * TAA mitigation via VERW is turned off if both
>  	 * tsx_async_abort=off and mds=off are specified.
> +	 *
> +	 * MDS mitigation will be checked in taa_update_mitigation().
>  	 */
> -	if (taa_mitigation == TAA_MITIGATION_OFF &&
> -	    mds_mitigation == MDS_MITIGATION_OFF)
> +	if (taa_mitigation == TAA_MITIGATION_OFF)
>  		return;

This check seems rather pointless, the only thing after this is the
TAA_MITIGATION_AUTO check.

>  
> -	if (boot_cpu_has(X86_FEATURE_MD_CLEAR))
> +	/* Microcode will be checked in taa_update_mitigation(). */
> +	if (taa_mitigation == TAA_MITIGATION_AUTO)
>  		taa_mitigation = TAA_MITIGATION_VERW;
> -	else
> -		taa_mitigation = TAA_MITIGATION_UCODE_NEEDED;

In the previous patch, MDS checks for ucode in both select and update,
which is overkill.  That should probably be done only in
mds_update_mitigation() to be consistent with how TAA does it here?

>  
> -	/*
> -	 * VERW doesn't clear the CPU buffers when MD_CLEAR=1 and MDS_NO=1.
> -	 * A microcode update fixes this behavior to clear CPU buffers. It also
> -	 * adds support for MSR_IA32_TSX_CTRL which is enumerated by the
> -	 * ARCH_CAP_TSX_CTRL_MSR bit.
> -	 *
> -	 * On MDS_NO=1 CPUs if ARCH_CAP_TSX_CTRL_MSR is not set, microcode
> -	 * update is required.
> -	 */
> -	if ( (x86_arch_cap_msr & ARCH_CAP_MDS_NO) &&
> -	    !(x86_arch_cap_msr & ARCH_CAP_TSX_CTRL_MSR))
> -		taa_mitigation = TAA_MITIGATION_UCODE_NEEDED;
> +}

Extra whitespace here at the end of the function.

> +static void __init taa_update_mitigation(void)
> +{
> +	if (!boot_cpu_has_bug(X86_BUG_TAA) || cpu_mitigations_off())
> +		return;
> +
> +	if (verw_mitigation_enabled())
> +		taa_mitigation = TAA_MITIGATION_VERW;

This overwrites TAA_MITIGATION_TSX_DISABLED?

I think reporting TSX disabled here is more accurate than reporting
VERW, since the VERW is only done to mitigate the other vulns.

> +static void __init taa_apply_mitigation(void)
> +{
> +	if (taa_mitigation == TAA_MITIGATION_VERW ||
> +	    taa_mitigation == TAA_MITIGATION_UCODE_NEEDED) {
> +		/*
> +		 * TSX is enabled, select alternate mitigation for TAA which is
> +		 * the same as MDS. Enable MDS static branch to clear CPU buffers.
> +		 *
> +		 * For guests that can't determine whether the correct microcode is
> +		 * present on host, enable the mitigation for UCODE_NEEDED as well.
> +		 */
> +		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
> +
> +		if (taa_nosmt || cpu_mitigations_auto_nosmt())
> +			cpu_smt_disable(false);
> +	}
>  
> -	if (taa_nosmt || cpu_mitigations_auto_nosmt())
> -		cpu_smt_disable(false);
>  }

Another extra whitespace here at the end of the function.

-- 
Josh
