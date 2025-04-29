Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385CD19309C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916463; cv=none; b=jIkG99B9LOsBUmExmXCjNIolOgQvGNXYS1PcC1reSt38Gkk2RrdTgZg6hR4mMU10ukUJZrCLKH+pAtGCNzvHZV4E9r8MPt1XJ5rzXZsKzjSLeHxKF5DbcUYzac+Q2gGUvDmaUoPabca/ELftk7kE/xZXqyGlfUe6S/gZolZISpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916463; c=relaxed/simple;
	bh=lgpG2jtQmNINwbGRLlpQKZ9FNThDYDx5gwJr2kMeQzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mme7QonTT+b0+COuyvQHGsrAdsHoQGZTxvLlcYKixp8F5qrAu+khB45krzuttKpYgeW39D87/fD0H7Ae7KdULAxMO9rOwjTDrecbzded8y1kQ0Fxh0NQXcGerVNKHNbVs33l97px1jEDtFIVmTuifQ0HjnmF0S1zUSevyCLSf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZcvomDfK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZcvomDfK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 93E0D40E01DA;
	Tue, 29 Apr 2025 08:47:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KMKSQnFGedFV; Tue, 29 Apr 2025 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745916452; bh=77olR8K1vAMrIGSVV8oGCOCxEoPxQPYG7u5fhAjPxz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcvomDfKn01oCcT9QxXOUrahvsczdxbGpb5LwrOfEcN0VOwBlQzj2fSXhSsSOVWHK
	 NwZuVsmbYM+fg4fK1SuvEc8u6NZbkjcz9NsPMENblwc0uo70lZmdeyLkc42AYkNQQF
	 xTKn9EDaXTSDaJZYUgLOvoAQiSGyPfrgCyL3H50WZMJIjQBFOB6Mi7izytu9dwtKDI
	 96e4yqN7DwQCPppV4VGdmGf+gBKS6TYmaNjxaaSiQHtV7/fFj9V3Ql9zQIhYPcAfAE
	 GoyFRH7Ipm4qw0oPnOL+YB4q/HG8Ve4LtRottDDQsoVA2B8qPwoVvGd5dyEz0IXKdK
	 y/f+0oYyyZ9mxmUhwdLADaS+J3tK9DqnsRRw/LE7CJCYQma0ldF85azr+sbr5ofkP8
	 YJSGBO2YAM4MiipDe3knLwzoxPMsncojqn/q0MIRdBV4q9d7LGB9wrYI3GoxzgM8BW
	 BVeRlpSgoru8gdeiyfs8gBIEbv2z8hxdIoRJTymTVh153elzP6PMqOaOH0LxcYk6Yl
	 mDMhDvt15lfcM1nveye15EW0Rn6T0v3ehYZFRB4rO+quluAb6DpKmrLmRT9EsVxjk7
	 yQjWx+xFm6qc93SGbNAL0+IfhYP6VxuzUg50sivzLfIsK7+FEWxxoCMbMTOEmlmlqa
	 kd275TqjCXeCgjnIX6lHWKfo=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8DCE640E021A;
	Tue, 29 Apr 2025 08:47:22 +0000 (UTC)
Date: Tue, 29 Apr 2025 10:47:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/16] x86/bugs: Restructure spectre_v2_user mitigation
Message-ID: <20250429084714.GDaBCSEipF3HiG1L9v@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-12-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-12-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:16AM -0500, David Kaplan wrote:
> @@ -217,6 +214,11 @@ void __init cpu_select_mitigations(void)
>  	 * choices.
>  	 */
>  	retbleed_update_mitigation();
> +	/*
> +	 * spectre_v2_user_update_mitigation() depends on
> +	 * retbleed_update_mitigation().
> +	 */

Why aren't you keeping the reason for the dependency from the above comment?

That's important when we need to touch this code again...

> +	spectre_v2_user_update_mitigation();
>  	mds_update_mitigation();
>  	taa_update_mitigation();
>  	mmio_update_mitigation();
> @@ -224,6 +226,7 @@ void __init cpu_select_mitigations(void)
>  
>  	spectre_v1_apply_mitigation();
>  	retbleed_apply_mitigation();
> +	spectre_v2_user_apply_mitigation();
>  	mds_apply_mitigation();
>  	taa_apply_mitigation();
>  	mmio_apply_mitigation();
> @@ -1374,6 +1377,8 @@ enum spectre_v2_mitigation_cmd {
>  	SPECTRE_V2_CMD_IBRS,
>  };
>  
> +static enum spectre_v2_mitigation_cmd spectre_v2_cmd __ro_after_init = SPECTRE_V2_CMD_AUTO;
> +
>  enum spectre_v2_user_cmd {
>  	SPECTRE_V2_USER_CMD_NONE,
>  	SPECTRE_V2_USER_CMD_AUTO,
> @@ -1412,31 +1417,19 @@ static void __init spec_v2_user_print_cond(const char *reason, bool secure)
>  		pr_info("spectre_v2_user=%s forced on command line.\n", reason);
>  }
>  
> -static __ro_after_init enum spectre_v2_mitigation_cmd spectre_v2_cmd;
> -
>  static enum spectre_v2_user_cmd __init
>  spectre_v2_parse_user_cmdline(void)

Lemme unbreak that silly thing while here...

>  {
> -	enum spectre_v2_user_cmd mode;
>  	char arg[20];
>  	int ret, i;
>  
> -	mode = IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2) ?
> -		SPECTRE_V2_USER_CMD_AUTO : SPECTRE_V2_USER_CMD_NONE;
> -
> -	switch (spectre_v2_cmd) {
> -	case SPECTRE_V2_CMD_NONE:
> +	if (cpu_mitigations_off() || !IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2))
>  		return SPECTRE_V2_USER_CMD_NONE;
> -	case SPECTRE_V2_CMD_FORCE:
> -		return SPECTRE_V2_USER_CMD_FORCE;
> -	default:
> -		break;
> -	}
>  
>  	ret = cmdline_find_option(boot_command_line, "spectre_v2_user",
>  				  arg, sizeof(arg));
>  	if (ret < 0)
> -		return mode;
> +		return SPECTRE_V2_USER_CMD_AUTO;
>  
>  	for (i = 0; i < ARRAY_SIZE(v2_user_options); i++) {
>  		if (match_option(arg, ret, v2_user_options[i].option)) {
> @@ -1447,7 +1440,7 @@ spectre_v2_parse_user_cmdline(void)
>  	}
>  
>  	pr_err("Unknown user space protection option (%s). Switching to default\n", arg);
> -	return mode;
> +	return SPECTRE_V2_USER_CMD_AUTO;
>  }
>  
>  static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
> @@ -1458,7 +1451,6 @@ static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
>  static void __init
>  spectre_v2_user_select_mitigation(void)

That too.

>  {
> -	enum spectre_v2_user_mitigation mode = SPECTRE_V2_USER_NONE;
>  	enum spectre_v2_user_cmd cmd;

Might as well get rid of that one.

>  	if (!boot_cpu_has(X86_FEATURE_IBPB) && !boot_cpu_has(X86_FEATURE_STIBP))
> @@ -1467,48 +1459,65 @@ spectre_v2_user_select_mitigation(void)
>  	cmd = spectre_v2_parse_user_cmdline();
>  	switch (cmd) {
>  	case SPECTRE_V2_USER_CMD_NONE:
> -		goto set_mode;
> +		return;
>  	case SPECTRE_V2_USER_CMD_FORCE:
> -		mode = SPECTRE_V2_USER_STRICT;
> +		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
> +		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT;

Those should be aligned at the '=' sign for better readability.

...

IOW, all the changes ontop:

---

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index afea9179acdd..dc75195760ca 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -214,9 +214,11 @@ void __init cpu_select_mitigations(void)
 	 * choices.
 	 */
 	retbleed_update_mitigation();
+
 	/*
 	 * spectre_v2_user_update_mitigation() depends on
-	 * retbleed_update_mitigation().
+	 * retbleed_update_mitigation(), specifically the STIBP
+	 * selection is forced for UNRET or IBPB.
 	 */
 	spectre_v2_user_update_mitigation();
 	mds_update_mitigation();
@@ -1422,8 +1424,7 @@ static void __init spec_v2_user_print_cond(const char *reason, bool secure)
 		pr_info("spectre_v2_user=%s forced on command line.\n", reason);
 }
 
-static enum spectre_v2_user_cmd __init
-spectre_v2_parse_user_cmdline(void)
+static enum spectre_v2_user_cmd __init spectre_v2_parse_user_cmdline(void)
 {
 	char arg[20];
 	int ret, i;
@@ -1453,29 +1454,25 @@ static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
 	return spectre_v2_in_eibrs_mode(mode) || mode == SPECTRE_V2_IBRS;
 }
 
-static void __init
-spectre_v2_user_select_mitigation(void)
+static void __init spectre_v2_user_select_mitigation(void)
 {
-	enum spectre_v2_user_cmd cmd;
-
 	if (!boot_cpu_has(X86_FEATURE_IBPB) && !boot_cpu_has(X86_FEATURE_STIBP))
 		return;
 
-	cmd = spectre_v2_parse_user_cmdline();
-	switch (cmd) {
+	switch (spectre_v2_parse_user_cmdline()) {
 	case SPECTRE_V2_USER_CMD_NONE:
 		return;
 	case SPECTRE_V2_USER_CMD_FORCE:
-		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
+		spectre_v2_user_ibpb  = SPECTRE_V2_USER_STRICT;
 		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT;
 		break;
 	case SPECTRE_V2_USER_CMD_AUTO:
 	case SPECTRE_V2_USER_CMD_PRCTL:
-		spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
+		spectre_v2_user_ibpb  = SPECTRE_V2_USER_PRCTL;
 		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
 		break;
 	case SPECTRE_V2_USER_CMD_PRCTL_IBPB:
-		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
+		spectre_v2_user_ibpb  = SPECTRE_V2_USER_STRICT;
 		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
 		break;
 	case SPECTRE_V2_USER_CMD_SECCOMP:

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
