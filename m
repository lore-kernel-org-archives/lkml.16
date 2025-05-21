Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4958D259C8C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821578; cv=none; b=fJf1uv2/fmnDwOUb1EPaFVcWmxlEdYxvbBqKDljvLfnvLtPFhIhVuta93CI9R2QLjPsQGrseDJKI8oHcXzerx+r/v+sgoczwsl1eQN2rDYSjvtk5TivRQkbvhi/A/p0OOfsjbLal+jxFYgxcTZSzuftSyaZmBdP6a/b7EETcI+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821578; c=relaxed/simple;
	bh=cIXiopF//pepKOx8Ft+fRlICcx1g2vpAh8B+5sP3Dc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2qmXwDCkXXonbT/PCT4/kSTuwLHLqn8NBLwGEsiV5b3kPLe9ztdlJMU9uHxYN8xh+K1dAYyg3O8lBGC8U2RWZ1J/6SC2SjRjPX3TNnOpSv3DWDju6k/eCmSTQpQF9JBNerQfHIa5IrxPinmhPwTBuGCflaH3fPIq7EAjThWUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OjqKiO7O; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OjqKiO7O"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BCCAB40E0192;
	Wed, 21 May 2025 09:59:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oYqcbHhXO3bs; Wed, 21 May 2025 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747821561; bh=ZtwcfMLI+afZLfdzDRlllbdzZKQ9MF1ulMMLX6dLplk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjqKiO7OMmQfhK1bZj3UXnIHTuwQN73rAEEYQB1k0BqE5/NxXVEz7X5iWciSZCNVV
	 R2g6hxBjjcju2XV3KC0Hu/AZDlcaZD1O0sfGeT9ku+oBk4F1dtUd1hUJwq0xWD969L
	 EQci8CJIrt94QxGcqJXaoaElnwtrnjCzTGgotj/kT+QsGdd4DPMwYIvZcIxizPE0df
	 gVDzJB8USi+xdkc9t/ffALaE6kqyeDTMkOcUptJpRRxrPe9DzFFFSMJRi4nIu5x7Sr
	 rPodGvK7BsVrZJuWzfA/LN85VPGurXtj3U7coe7rDmRsRKBG9FSzaTFI8OvR+SMOMF
	 IyHBeKjdsRuGU7+wGygpwHZlRnVtrxa9Cfl+oo1XZeG+bAlKPR3LfOlFelWfgeBUFW
	 83M4sTWtLf/RL9s7FK8Ymucp387KeCxeu8h46oZVPzUI8CkxCQ8T6Hgxa3ayuWFvbW
	 oEdarCwqudaC6A/AqUl9W5rmVXqfNqq63yWjwnyhKjWYvpQ1eKpGwgefX+25Qp11lS
	 BGtr+twfu4lblqwkU9155jf/JuCXJUlFeUAz8wF5ycP6QenuAW3IJp1MGgugKqS3l9
	 Yudid0u6oA1+ftwlb62w0booDqxqx/4DjumWhMOTD9R7f8yDvsuy1Yc7YMPwJTL1/E
	 lG1HhhAJN4qK++tFTC1UDFyg=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 34CE340E0239;
	Wed, 21 May 2025 09:59:15 +0000 (UTC)
Date: Wed, 21 May 2025 11:59:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 2/2] x86/its: Allow "=stuff" mitigation when eIBRS is
 enabled
Message-ID: <20250521095914.GBaC2j8kmYixjs66Sd@fat_crate.local>
References: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>
 <20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com>

On Tue, May 20, 2025 at 10:35:36PM -0700, Pawan Gupta wrote:
> After a recent restructuring of ITS mitigation, RSB stuffing can no
> longer be enabled in eIBRS+Retpoline mode. Before ITS, retbleed
> mitigation only allowed stuffing when eIBRS was not enabled. This was
> perfectly fine since eIBRS mitigates retbleed.
> 
> However, RSB stuffing mitigation for ITS is still required with eIBRS.
> The restructuring solely relies on retbleed to deploy stuffing, and does
> not allow it when eIBRS is enabled. This behavior is different from
> what was before the restructuring.
> 
> Allow RSB stuffing mitigation when eIBRS+retpoline is enabled. Also
> allow retbleed and ITS mitigation to independently enable stuffing. The
> dependency is only with respect to retpoline. It is a valid case for
> retbleed to be mitigated by eIBRS while ITS deploys stuffing at the same
> time.

This one definitely needs splitting, just from reading the commit message
I can see separate patches.

> 
> Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
> Closes: https://lore.kernel.org/lkml/20250519235101.2vm6sc5txyoykb2r@desk/
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 101 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 67 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 7f94e6a5497d9a2d312a76095e48d6b364565777..642d234943fe8fc657c7331ceb3a605201444166 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
>  
>  static void __init set_return_thunk(void *thunk)
>  {
> +	if (thunk == x86_return_thunk)
> +		return;

This needs a separate patch too.

> +
>  	if (x86_return_thunk != __x86_return_thunk)
>  		pr_warn("x86/bugs: return thunk changed\n");
>  
> @@ -1120,6 +1123,39 @@ early_param("nospectre_v1", nospectre_v1_cmdline);
>  
>  enum spectre_v2_mitigation spectre_v2_enabled __ro_after_init = SPECTRE_V2_NONE;
>  
> +static inline bool spectre_v2_in_retpoline_mode(enum spectre_v2_mitigation mode)
> +{
> +	switch (mode) {
> +	case SPECTRE_V2_NONE:
> +	case SPECTRE_V2_IBRS:
> +	case SPECTRE_V2_EIBRS:
> +	case SPECTRE_V2_LFENCE:
> +	case SPECTRE_V2_EIBRS_LFENCE:
> +		return false;
> +
> +	case SPECTRE_V2_RETPOLINE:
> +	case SPECTRE_V2_EIBRS_RETPOLINE:
> +		return true;
> +	}
> +
> +	pr_warn("Unknown spectre_v2 mitigation mode %d\n", mode);
> +
> +	return false;
> +}

A whole function with a almost useless switch-case just for this?

> +
> +/* Depends on spectre_v2 mitigation selected already */
> +static inline bool cdt_possible(enum spectre_v2_mitigation mode)
> +{
> +	if (!IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) ||
> +	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
> +		return false;
> +
> +	if (!spectre_v2_in_retpoline_mode(mode))
> +		return false;

You're using this function only once here. What's wrong with

	if ((mode != SPECTRE_V2_RETPOLINE) &&
	    (mode != SPECTRE_V2_EIBRS_RETPOLINE))

?

> +
> +	return true;
> +}
> +
>  #undef pr_fmt
>  #define pr_fmt(fmt)     "RETBleed: " fmt
>  
> @@ -1258,24 +1294,16 @@ static void __init retbleed_update_mitigation(void)
>  	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
>  		goto out;
>  
> -	/*
> -	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
> -	 * then a different mitigation will be selected below.
> -	 *
> -	 * its=stuff will also attempt to enable stuffing.
> -	 */
> -	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
> -	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
> -		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
> -			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
> -			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
> -		} else {
> -			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> -				pr_info("Retbleed mitigation updated to stuffing\n");
> +	 /* ITS can also enable stuffing */

This needs a separate patch.

> +	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF)
> +		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
>  
> -			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
> -		}
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
> +	    !cdt_possible(spectre_v2_enabled)) {
> +		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
> +		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
>  	}
> +
>  	/*
>  	 * Let IBRS trump all on Intel without affecting the effects of the
>  	 * retbleed= cmdline option except for call depth based stuffing
> @@ -1294,15 +1322,15 @@ static void __init retbleed_update_mitigation(void)
>  			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
>  				pr_err(RETBLEED_INTEL_MSG);
>  		}
> -		/* If nothing has set the mitigation yet, default to NONE. */
> -		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
> -			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
>  	}
> +
> +	/* If nothing has set the mitigation yet, default to NONE. */
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
> +		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
>  out:
>  	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
>  }
>  
> -
>  static void __init retbleed_apply_mitigation(void)
>  {
>  	bool mitigate_smt = false;
> @@ -1449,6 +1477,7 @@ static void __init its_update_mitigation(void)
>  		its_mitigation = ITS_MITIGATION_OFF;
>  		break;
>  	case SPECTRE_V2_RETPOLINE:
> +	case SPECTRE_V2_EIBRS_RETPOLINE:
>  		/* Retpoline+CDT mitigates ITS */
>  		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
>  			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
> @@ -1462,13 +1491,8 @@ static void __init its_update_mitigation(void)
>  		break;
>  	}
>  
> -	/*
> -	 * retbleed_update_mitigation() will try to do stuffing if its=stuff.
> -	 * If it can't, such as if spectre_v2!=retpoline, then fall back to
> -	 * aligned thunks.
> -	 */
>  	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
> -	    retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> +	    !cdt_possible(spectre_v2_enabled))
>  		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
>  
>  	pr_info("%s\n", its_strings[its_mitigation]);
> @@ -1476,15 +1500,24 @@ static void __init its_update_mitigation(void)
>  
>  static void __init its_apply_mitigation(void)
>  {
> -	/* its=stuff forces retbleed stuffing and is enabled there. */
> -	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
> -		return;
> -
> -	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> -		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> +	switch (its_mitigation) {
> +	case ITS_MITIGATION_OFF:
> +	case ITS_MITIGATION_AUTO:
> +	case ITS_MITIGATION_VMEXIT_ONLY:
> +		break;
> +	case ITS_MITIGATION_ALIGNED_THUNKS:
> +		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> +			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
>  
> -	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> -	set_return_thunk(its_return_thunk);
> +		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> +		set_return_thunk(its_return_thunk);
> +		break;
> +	case ITS_MITIGATION_RETPOLINE_STUFF:
> +		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> +		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
> +		set_return_thunk(call_depth_return_thunk);
> +		break;
> +	}

I don't think you need to return the switch-case back but this is
unreviewable. Please split. It is perfectly fine if you split into trivial
patches which do one logical thing and one logical thing only.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
