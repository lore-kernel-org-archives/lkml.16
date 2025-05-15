Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C612E7F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353145; cv=none; b=ej+ODYKaL28zywbwkPUl9VhULgb12Oef80ORfS0CbQrwQKfL9z+bi22AmjiQGw7p2yuYnYz/SFjHlQTGAxK0fk/QVJiYm9yG5Ikay+fDb0gKtgOLRtqkI22n8JTHabi7JFnd/3e9HcPxY0zsmFqKNoE7rrOB98qGGDDWAbwVkrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353145; c=relaxed/simple;
	bh=cRaHnwVH6BV/qTmDBk8hCL/ClhSuywD+VhWrWF2b3jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6h4jX4ULeTwX4lpeaOpGQ1llNUWJYmI0R046Bb8KxGsbgLFVz09iBXCRkgW87vvp+tZaPRIuqQ7NzDNFGXOHXkkyDSLuPyutzBuntMElO0jUiXgQEnYMtpqc4x1nHZm2wJ5OEwfOyMH2BpVmcBjw9i8L3vPZpKvuZfm0PNoVOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byjzXrNv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byjzXrNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747353144; x=1778889144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRaHnwVH6BV/qTmDBk8hCL/ClhSuywD+VhWrWF2b3jM=;
  b=byjzXrNvkFmtPPJgR5lnTNeYNjokmIJ+Kqdm8QlUpTlFicSPfMfAoORf
   64rIwmCgv1PgbUuUnFMUgh/h/sUFLlOV17FgvxX5zNWU6Gdrp3Cqdd5xo
   p/u7zLcrwa9hFrbPn3fVcUlVn7X2UO2NjOn3LMI1bxZA2nWwLFIAeq2mz
   9pEotCAfUTVtaauwsoiS5uGwlqR3xreUpRoFbewn2cxs5N8l90owGaZxe
   XSyo2HpwqQ0TFlrZMdBvKuwJoFC7Us0A4n+4Ev4o1SpUPzHDZ26FMGWY7
   ajVLiIJxDvvd6NRopgpavXbWuS+5ye+BA1VfhB9/URK/jYYCFS3r+M9BN
   g==;
X-CSE-ConnectionGUID: uJanHGuUSKCNS2vxl5ancQ==
X-CSE-MsgGUID: X9xXN+4FTrKoGivOMoQWoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53128783"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="53128783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 16:52:23 -0700
X-CSE-ConnectionGUID: jQWtpCQNSWiTx+FK0dr4sw==
X-CSE-MsgGUID: i7n391PqR0uL+NEGJMFt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="175648686"
Received: from gkhatri-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.13])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 16:52:18 -0700
Date: Thu, 15 May 2025 16:52:10 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
Message-ID: <20250515235210.ooq7ogymcdvbtakd@desk>
References: <20250515134756.93274-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515134756.93274-1-david.kaplan@amd.com>

On Thu, May 15, 2025 at 08:47:56AM -0500, David Kaplan wrote:
> Restructure the ITS mitigation to use select/update/apply functions like
> the other mitigations.
> 
> There is a particularly complex interaction between ITS and Retbleed as CDT
> (Call Depth Tracking) is a mitigation for both, and either its=stuff or
> retbleed=stuff will attempt to enable CDT.
> 
> retbleed_update_mitigation() runs first and will check the necessary
> pre-conditions for CDT if either ITS or Retbleed stuffing is selected.  If
> checks pass and ITS stuffing is selected, it will select stuffing for
> Retbleed as well.
> 
> its_update_mitigation() runs after and will either select stuffing if
> retbleed stuffing was enabled, or fall back to the default (aligned thunks)
> if stuffing could not be enabled.
> 
> Enablement of CDT is done exclusively in retbleed_apply_mitigation().
> its_apply_mitigation() is only used to enable aligned thunks.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 167 ++++++++++++++++++++-----------------
>  1 file changed, 90 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index dd8b50b4ceaa..db26fb5a0a13 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -92,6 +92,8 @@ static void __init bhi_select_mitigation(void);
>  static void __init bhi_update_mitigation(void);
>  static void __init bhi_apply_mitigation(void);
>  static void __init its_select_mitigation(void);
> +static void __init its_update_mitigation(void);
> +static void __init its_apply_mitigation(void);
>  
>  /* The base value of the SPEC_CTRL MSR without task-specific bits set */
>  u64 x86_spec_ctrl_base;
> @@ -235,6 +237,11 @@ void __init cpu_select_mitigations(void)
>  	 * spectre_v2=ibrs.
>  	 */
>  	retbleed_update_mitigation();
> +	/*
> +	 * its_update_mitigation() depends on spectre_v2_update_mitigation()
> +	 * and retbleed_update_mitigation().
> +	 */
> +	its_update_mitigation();
>  
>  	/*
>  	 * spectre_v2_user_update_mitigation() depends on
> @@ -263,6 +270,7 @@ void __init cpu_select_mitigations(void)
>  	srbds_apply_mitigation();
>  	srso_apply_mitigation();
>  	gds_apply_mitigation();
> +	its_apply_mitigation();
>  	bhi_apply_mitigation();
>  }
>  
> @@ -1125,6 +1133,14 @@ enum retbleed_mitigation {
>  	RETBLEED_MITIGATION_STUFF,
>  };
>  
> +enum its_mitigation {
> +	ITS_MITIGATION_OFF,
> +	ITS_MITIGATION_AUTO,
> +	ITS_MITIGATION_VMEXIT_ONLY,
> +	ITS_MITIGATION_ALIGNED_THUNKS,
> +	ITS_MITIGATION_RETPOLINE_STUFF,
> +};

This is in between retbleed declarations, I would suggest to move this
before retbleed mitigation starts.

enum its_mitigation {
        ITS_MITIGATION_OFF,
        ITS_MITIGATION_AUTO,
        ITS_MITIGATION_VMEXIT_ONLY,
        ITS_MITIGATION_ALIGNED_THUNKS,
        ITS_MITIGATION_RETPOLINE_STUFF,
};

static enum its_mitigation its_mitigation __ro_after_init =
        IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_MITIGATION_AUTO : ITS_MITIGATION_OFF;

#undef pr_fmt
#define pr_fmt(fmt)     "RETBleed: " fmt

enum retbleed_mitigation {

>  static const char * const retbleed_strings[] = {
>  	[RETBLEED_MITIGATION_NONE]	= "Vulnerable",
>  	[RETBLEED_MITIGATION_UNRET]	= "Mitigation: untrained return thunk",
> @@ -1137,6 +1153,9 @@ static const char * const retbleed_strings[] = {
>  static enum retbleed_mitigation retbleed_mitigation __ro_after_init =
>  	IS_ENABLED(CONFIG_MITIGATION_RETBLEED) ? RETBLEED_MITIGATION_AUTO : RETBLEED_MITIGATION_NONE;
>  
> +static enum its_mitigation its_mitigation __ro_after_init =
> +	IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_MITIGATION_AUTO : ITS_MITIGATION_OFF;

Ditto.

>  static int __ro_after_init retbleed_nosmt = false;
>  
>  static int __init retbleed_parse_cmdline(char *str)
> @@ -1242,11 +1261,19 @@ static void __init retbleed_update_mitigation(void)
>  	/*
>  	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
>  	 * then a different mitigation will be selected below.
> +	 *
> +	 * its=stuff will also attempt to enable stuffing.
>  	 */
> -	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF) {
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
> +	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
>  		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {

SPECTRE_V2_EIBRS_RETPOLINE also enables retpoline.

>  			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");

This can be updated to:

  			pr_err("WARNING: retbleed=stuff depends on retpoline\n");

>  			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
> +		} else {
> +			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> +				pr_info("Retbleed mitigation updated to stuffing\n");
> +
> +			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
>  		}
>  	}
>  	/*
> @@ -1338,20 +1365,6 @@ static void __init retbleed_apply_mitigation(void)
>  #undef pr_fmt
>  #define pr_fmt(fmt)     "ITS: " fmt
>  
> -enum its_mitigation_cmd {
> -	ITS_CMD_OFF,
> -	ITS_CMD_ON,
> -	ITS_CMD_VMEXIT,
> -	ITS_CMD_RSB_STUFF,
> -};
> -
> -enum its_mitigation {
> -	ITS_MITIGATION_OFF,
> -	ITS_MITIGATION_VMEXIT_ONLY,
> -	ITS_MITIGATION_ALIGNED_THUNKS,
> -	ITS_MITIGATION_RETPOLINE_STUFF,
> -};
> -
>  static const char * const its_strings[] = {
>  	[ITS_MITIGATION_OFF]			= "Vulnerable",
>  	[ITS_MITIGATION_VMEXIT_ONLY]		= "Mitigation: Vulnerable, KVM: Not affected",
> @@ -1359,11 +1372,6 @@ static const char * const its_strings[] = {
>  	[ITS_MITIGATION_RETPOLINE_STUFF]	= "Mitigation: Retpolines, Stuffing RSB",
>  };
>  
> -static enum its_mitigation its_mitigation __ro_after_init = ITS_MITIGATION_ALIGNED_THUNKS;
> -
> -static enum its_mitigation_cmd its_cmd __ro_after_init =
> -	IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_CMD_ON : ITS_CMD_OFF;
> -
>  static int __init its_parse_cmdline(char *str)
>  {
>  	if (!str)
> @@ -1375,16 +1383,16 @@ static int __init its_parse_cmdline(char *str)
>  	}
>  
>  	if (!strcmp(str, "off")) {
> -		its_cmd = ITS_CMD_OFF;
> +		its_mitigation = ITS_MITIGATION_OFF;
>  	} else if (!strcmp(str, "on")) {
> -		its_cmd = ITS_CMD_ON;
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
>  	} else if (!strcmp(str, "force")) {
> -		its_cmd = ITS_CMD_ON;
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
>  		setup_force_cpu_bug(X86_BUG_ITS);
>  	} else if (!strcmp(str, "vmexit")) {
> -		its_cmd = ITS_CMD_VMEXIT;
> +		its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
>  	} else if (!strcmp(str, "stuff")) {
> -		its_cmd = ITS_CMD_RSB_STUFF;
> +		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
>  	} else {
>  		pr_err("Ignoring unknown indirect_target_selection option (%s).", str);
>  	}
> @@ -1395,85 +1403,90 @@ early_param("indirect_target_selection", its_parse_cmdline);
>  
>  static void __init its_select_mitigation(void)
>  {
> -	enum its_mitigation_cmd cmd = its_cmd;
> -
>  	if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off()) {
>  		its_mitigation = ITS_MITIGATION_OFF;
>  		return;
>  	}
>  
> -	/* Retpoline+CDT mitigates ITS, bail out */
> -	if (boot_cpu_has(X86_FEATURE_RETPOLINE) &&
> -	    boot_cpu_has(X86_FEATURE_CALL_DEPTH)) {
> -		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
> -		goto out;
> -	}
> +	if (its_mitigation == ITS_MITIGATION_AUTO)
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> +
> +	if (its_mitigation == ITS_MITIGATION_OFF)
> +		return;
>  
> -	/* Exit early to avoid irrelevant warnings */
> -	if (cmd == ITS_CMD_OFF) {
> -		its_mitigation = ITS_MITIGATION_OFF;
> -		goto out;
> -	}
> -	if (spectre_v2_enabled == SPECTRE_V2_NONE) {
> -		pr_err("WARNING: Spectre-v2 mitigation is off, disabling ITS\n");
> -		its_mitigation = ITS_MITIGATION_OFF;
> -		goto out;
> -	}
>  	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) ||
>  	    !IS_ENABLED(CONFIG_MITIGATION_RETHUNK)) {
>  		pr_err("WARNING: ITS mitigation depends on retpoline and rethunk support\n");
>  		its_mitigation = ITS_MITIGATION_OFF;
> -		goto out;
> +		return;
>  	}
> +
>  	if (IS_ENABLED(CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B)) {
>  		pr_err("WARNING: ITS mitigation is not compatible with CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B\n");
>  		its_mitigation = ITS_MITIGATION_OFF;
> -		goto out;
> -	}
> -	if (boot_cpu_has(X86_FEATURE_RETPOLINE_LFENCE)) {
> -		pr_err("WARNING: ITS mitigation is not compatible with lfence mitigation\n");
> -		its_mitigation = ITS_MITIGATION_OFF;
> -		goto out;
> +		return;
>  	}
>  
> -	if (cmd == ITS_CMD_RSB_STUFF &&
> -	    (!boot_cpu_has(X86_FEATURE_RETPOLINE) || !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING))) {
> +	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
> +	    !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
>  		pr_err("RSB stuff mitigation not supported, using default\n");
> -		cmd = ITS_CMD_ON;
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;

This and ...

>  	}
>  
> -	switch (cmd) {
> -	case ITS_CMD_OFF:
> +	if (its_mitigation == ITS_MITIGATION_VMEXIT_ONLY &&
> +	    !boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY))
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;

... this are essentially resetting the mitigation to default. This will be
more clear if you could change the mitigation to ITS_MITIGATION_AUTO here,
and at the end have:

	if (its_mitigation == ITS_MITIGATION_AUTO)
		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> +
> +}
> +
> +static void __init its_update_mitigation(void)
> +{
> +	if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off())
> +		return;
> +
> +	switch (spectre_v2_enabled) {
> +	case SPECTRE_V2_NONE:
> +		pr_err("WARNING: Spectre-v2 mitigation is off, disabling ITS\n");
>  		its_mitigation = ITS_MITIGATION_OFF;
>  		break;
> -	case ITS_CMD_VMEXIT:
> -		if (boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY)) {
> -			its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
> -			goto out;
> -		}
> -		fallthrough;
> -	case ITS_CMD_ON:
> -		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
> -		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> -			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> -		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> -		set_return_thunk(its_return_thunk);
> +	case SPECTRE_V2_RETPOLINE:

Also SPECTRE_V2_EIBRS_RETPOLINE.

> +		/* Retpoline+CDT mitigates ITS */
> +		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)



> +			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
>  		break;
> -	case ITS_CMD_RSB_STUFF:
> -		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
> -		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> -		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
> -		set_return_thunk(call_depth_return_thunk);
> -		if (retbleed_mitigation == RETBLEED_MITIGATION_NONE) {
> -			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
> -			pr_info("Retbleed mitigation updated to stuffing\n");
> -		}
> +	case SPECTRE_V2_LFENCE:
> +	case SPECTRE_V2_EIBRS_LFENCE:
> +		pr_err("WARNING: ITS mitigation is not compatible with lfence mitigation\n");
> +		its_mitigation = ITS_MITIGATION_OFF;
> +		break;
> +	default:
>  		break;
>  	}
> -out:
> +
> +	/*
> +	 * retbleed_update_mitigation() will try to do stuffing if its=stuff.
> +	 * If it can't, such as if spectre_v2!=retpoline, then fall back to
> +	 * aligned thunks.
> +	 */
> +	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
> +	    retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;

The =stuff mitigation depends on retpoline, not really on retbleed.
Shouldn't this be handled in the switch (spectre_v2_enabled) above?

>  	pr_info("%s\n", its_strings[its_mitigation]);
>  }
>  
> +static void __init its_apply_mitigation(void)
> +{
> +	/* its=stuff forces retbleed stuffing and is enabled there. */

Oh, this is why you are depending on retbleed_mitigation above, this part is
a bit confusing.

Will think about it more later, trying to have a couple of days off.

> +	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
> +		return;
> +
> +	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> +		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> +
> +	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> +	set_return_thunk(its_return_thunk);
> +}
