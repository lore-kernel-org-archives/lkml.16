Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E32973A3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866818; cv=none; b=dYSQSrpeg6RKvIUOcNrCUcEtHJ9n7O6gGCJGw5fFNMXkqvOHx6jHBzEQewsramiqXeaPmpOY4vaR5Nvc1oXqDactoK3uHZw98Kwro76VMBJu4bG1PEDRxAZc1AaC8UgkZLMusoK/foF/OaAJNIASpV6lFxftj/fZGgNjeZTHIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866818; c=relaxed/simple;
	bh=cPxbDjS02lZQHnqt3nG3AuahmeKMMUQ5hR3l7SQkdO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuoeFv+ZVfcVm4dXtXs/Dtc/7YJKPoaLQKGkv7SvRLo/PO8HEehqytwTJ2bPgduNZPQMV4lI1Y64ri3kGUsSsFczFWP/5wpjk1XD80SypT/uxmPT5vtw5bhJcp9ETYkP5tlE+OePMlXrCvLDVDKsBHME2/RQHOCxvFzl7LBKCCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Pm7ciZs6; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Pm7ciZs6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CADF140E0196;
	Mon, 28 Apr 2025 19:00:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id swwc5YK5Oeh9; Mon, 28 Apr 2025 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745866800; bh=t9Xxe9oP3S7iGMk6Jr7yTH99bRAUyhYg/VVjUxd47X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pm7ciZs617eKz1i79U/suMHJNnt2ub+6eywvrWCqUtwvm19knRrv4OuZ21izkdYzf
	 7ICKrBvvOxQoS57wbDPHrZqo6ZqC4Hc962uFb6pBk338H9/Hztk8ZIDFjIS69Zru89
	 AMzl0aW9ypv71wmHr9dNgW9PslqZ21WXuLWjPwIzfkbb+jR5qzU2VUh42TPSswBE1P
	 oF+NFyWG3Uph3Db5i1KAFL71vdCGGLpBVhBbe8iGmfKnZUjTH0s4open6VKYqrJKaU
	 dycwGU+r4/eJDnqFfe5Odv8cEwsoov03epJBtmgU7x30iCePshmFl+yWmEoL1wd4mM
	 Sk2hp3HC7NUHxXgBrnV3BAB5JKQnZPGIXYhAFb6RLOBzj+4r7OVWlTcVjkzoRVKe5y
	 b5ggiKZJMRHMRNI4aisX0eDsMhFKf2upGGFtZZbfdb7XQqzsDFJIbr4iFT33kGuVkW
	 SQ6iaanIxluxEnD+Ydik6UpwJTz0NlCCOrgRROgX/POPGcAOpe4a4FB25dyQSaWhOC
	 7hqFwM1dzLYY6LXVvJElapiDSIBLfKh+l5NamUOliqBzEo5uswQFlLVrBsF7rOglbO
	 Tt3T9NmNb2xk7RTNHUrtLSEOyUtZ511T4zA5qUoNbfez7zq9TDNWtiq1nzdlWKgDNH
	 jWWOug9F5nemvGSTI1NMeE7g=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9171740E01FA;
	Mon, 28 Apr 2025 18:59:50 +0000 (UTC)
Date: Mon, 28 Apr 2025 20:59:39 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/16] x86/bugs: Restructure retbleed mitigation
Message-ID: <20250428185939.GBaA_QG-bWQ7WQ3vlY@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-11-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-11-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:15AM -0500, David Kaplan wrote:
> @@ -187,11 +189,6 @@ void __init cpu_select_mitigations(void)
>  	/* Select the proper CPU mitigations before patching alternatives: */
>  	spectre_v1_select_mitigation();
>  	spectre_v2_select_mitigation();
> -	/*
> -	 * retbleed_select_mitigation() relies on the state set by
> -	 * spectre_v2_select_mitigation(); specifically it wants to know about
> -	 * spectre_v2=ibrs.
> -	 */
>  	retbleed_select_mitigation();
>  	/*
>  	 * spectre_v2_user_select_mitigation() relies on the state set by
> @@ -219,12 +216,14 @@ void __init cpu_select_mitigations(void)
>  	 * After mitigations are selected, some may need to update their
>  	 * choices.
>  	 */
> +	retbleed_update_mitigation();

Is there any particular reason for the retbleed update function to go first...

>  	mds_update_mitigation();
>  	taa_update_mitigation();
>  	mmio_update_mitigation();
>  	rfds_update_mitigation();

... before those?

I'm under the assumption that the new scheme would get rid of this magical
ordering requirement between the mitigations...

Your commit message is alluding to that but we need to specify this clearly
for future cleanups/changes here.

>  	spectre_v1_apply_mitigation();
> +	retbleed_apply_mitigation();

This too.

>  	mds_apply_mitigation();
>  	taa_apply_mitigation();
>  	mmio_apply_mitigation();

...

> -do_cmd_auto:
> -	case RETBLEED_CMD_AUTO:
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO) {
> +		/* Intel mitigation selected in retbleed_update_mitigation() */
>  		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
>  		    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
>  			if (IS_ENABLED(CONFIG_MITIGATION_UNRET_ENTRY))
> @@ -1212,18 +1187,65 @@ static void __init retbleed_select_mitigation(void)
>  			else if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY) &&
>  				 boot_cpu_has(X86_FEATURE_IBPB))
>  				retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
> +			else
> +				retbleed_mitigation = RETBLEED_MITIGATION_NONE;
>  		}
> +	}
> +}

I'd flip that outer check in order to save an indentation level here:

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 9d6ce4a167be..207a472d1a6e 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1182,18 +1182,19 @@ static void __init retbleed_select_mitigation(void)
 		break;
 	}
 
-	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO) {
-		/* Intel mitigation selected in retbleed_update_mitigation() */
-		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
-		    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
-			if (IS_ENABLED(CONFIG_MITIGATION_UNRET_ENTRY))
-				retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
-			else if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY) &&
-				 boot_cpu_has(X86_FEATURE_IBPB))
-				retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
-			else
-				retbleed_mitigation = RETBLEED_MITIGATION_NONE;
-		}
+	if (retbleed_mitigation != RETBLEED_MITIGATION_AUTO)
+		return;
+
+	/* Intel mitigation selected in retbleed_update_mitigation() */
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
+	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+		if (IS_ENABLED(CONFIG_MITIGATION_UNRET_ENTRY))
+			retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
+		else if (IS_ENABLED(CONFIG_MITIGATION_IBPB_ENTRY) &&
+			 boot_cpu_has(X86_FEATURE_IBPB))
+			retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
+		else
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
 }
 
Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
