Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141B1D63CF
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748085424; cv=none; b=ng1EgkhnJdBs7sdvksqlFOw2qz0euPFkdN5ONRj820jl46Po7Ed2cvYyRWti3vQyuyZWGELBPSboPpaeReevm6D5iU3iM6tfuqxc+qD7g80PCBo9x/fGRjNmoobDbOeQQYbWFjim5xpjipaz7opth22eUCpFPTf/FPF1XwJSkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748085424; c=relaxed/simple;
	bh=67jqlbHlJtm0Rlkfb0L68Y6a7GvHMuGvCSLoWYWrCJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLD99odlINaSmwkfdJ8FoCU8lh6+iVf+bre51hJQrLZxG/8ZJRwztVs/XiTV6tTTfF+HtEuCmUnTCvWqW1WF/0FP2OssBko5xkZ/7IOOHSVyrvwqTM2Fws0Bkk3Ics4CGG2vHTI/NAklyxJZiYBnHeZDWaIioaUjGbI006XIfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kMJEmrvf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kMJEmrvf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8F7FF40E0240;
	Sat, 24 May 2025 11:16:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZYo3C1CmFMgp; Sat, 24 May 2025 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748085414; bh=ZPBP9ah9CX5dY3CQgI3ss19ppIRRrEqPsqBBJBFHmow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMJEmrvfZpnNDwUchaiz8GePP+OA1DMI8rr8c/tC6Lv6/2dnzYZGk6GGRwPCyWMzz
	 kDC+ysBAp5ub21xocD+Hkv0JLy4JIkQtoXd51+G8y5fnYhDfBOCykqX34D/N8kIDnX
	 0Z9tV4AeU79fH619mNFw2oE6lhIhzFJRKxjOlyZ2IOr13/YyihyiqyyUAF2bY4BrT2
	 shF9+hkaD/1gJgxjG8WBdFnnWRyBWuG+uWoCy38qd2oRiF2b/VVjXVxmAyPp9yaXKR
	 cHQ5rIPxOH8L9CCHMDTd41nf+v1QynU6TG5ToU8tf9FZd+yrbwW/xvKis2yMhFXCCq
	 lsZYXoViSQPX/Z0W38OxSYHPTOxFR24IMyFEHKoMlGMyK8Z1xlaYFzliad/6EBxb5U
	 kRz40xPsHWDgxYg54uiDzeqW/y2plJLhQnpnH5PCp3xucIX6qakYrVGgCra7gSKpxp
	 ZHmTmNuS3eh612Bl4kTtgP+WCuj18R+rdLBJiViF0Kj9pxuwXZ08ujMhzeNQzE/tZI
	 FCrReViaAvzm/jgYNDBQFqVKOBZj+FqmGr2ob/oqGOvLra4ejlBVI4/dbZ4anu+TZk
	 QVclVpO4CLQ8qWLu3W1qT5jIOL7YHEdiFaX5FCtMF4J0SnpGsqVmZClaA2hBj9ls2+
	 f0TcWFTXHFBS+UhgF5X0cods=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7E52340E0238;
	Sat, 24 May 2025 11:16:47 +0000 (UTC)
Date: Sat, 24 May 2025 13:16:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCH v3 2/7] x86/retbleed: Simplify the =stuff checks
Message-ID: <20250524111640.GIaDGqmJrY64FV1ZEo@fat_crate.local>
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
 <20250522-eibrs-fix-v3-2-12704e291e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-eibrs-fix-v3-2-12704e291e1e@linux.intel.com>

On Thu, May 22, 2025 at 06:20:47PM -0700, Pawan Gupta wrote:
> Simplify the nested checks, remove redundant print and comment.
> 
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 53649df2c4d66c6bd3aa34dec69af9df253bccfc..94d0de3e61aec32b3b67c8d21f89a8c67b93dff3 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1263,24 +1263,16 @@ static void __init retbleed_update_mitigation(void)
>  	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
>  		return;
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
> -			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
> -		} else {
> -			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> -				pr_info("Retbleed mitigation updated to stuffing\n");
> +	 /* ITS can also enable stuffing */
> +	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF)
> +		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
>  
> -			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
> -		}
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
> +	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
> +		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
> +		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
>  	}
> +
>  	/*
>  	 * Let IBRS trump all on Intel without affecting the effects of the
>  	 * retbleed= cmdline option except for call depth based stuffing
> 
> -- 

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
