Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099D42A82
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322181; cv=none; b=i9XyrQwzEC/06WFiCtuYAW9WGiLILhDM0uHEJB0o6mQLeIMIkRo52FRkLJX+J2FBIii78cdBjMSc3jcMeVD2qIs1+wOCNE5giAd3eLvHIEUB7VdM6Vni6kTz+/TSYzg4PDiS2GmErenTJ8dTlT2j18asHnS5LUOGbgAY2hmpuSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322181; c=relaxed/simple;
	bh=sPyAVycxcJ0D1C/UAD2TstnPXUFKGB6F6fjmwgb+N4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtUVQ8yZpUTitDsYmaY6P8pRZ87otEo3TroOHs1iZJi+1BRiMtg6lQQKHMw3g95PwQvcC4PRvi26Yo2QRez6sbnTraO0ccEVdwh/OFmkW9+wVEUsKr2u5zjWQe7S0F4/CBF7HxQCBHmyMwko63JRl/CeWYGnwtrZUj9W9fK/yig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lSw2baZ5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lSw2baZ5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5F74A40E0222;
	Thu, 15 May 2025 15:16:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qDhr6EV5YsTV; Thu, 15 May 2025 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747322173; bh=lzbgCcnq7yzl/KudcdPAeH53uYqWbFn4WHR1nkY/0zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSw2baZ5BWEuGQe+deamInwfX1pxlIOXahSUMcWjWEXwYbR1l3Zv6pIcFjUBhaNae
	 OkCgaoDXi/7wCQyfFZl8l6ExSCuky6tNqfqI/m7PM7AMeecerAQ0I8HpimN5LxW6vI
	 xi/xq4RFBkxaBjtu423GuVQOVN0vGRjwraPbN7OPC7xcxORGbJXBgMAKbhnm4lmFlH
	 kJSajgIV3V978kOtArowzbhBbmHBEeVwJcwNLo3PMfc8wzfMQNLDqE5cFliyTvUICA
	 ccDKsmg0ZRVNH89aXLuze3T191M3pfIg42e7SRtc+gEVHYjRhLsekcTw3RMzHkMp3H
	 QmywFVKVdUJHX/i1umcp/K0ZzceIGvwj2sC3LvQtBX60ZdZDl6oWMUHH88KNC98KGf
	 TBLrqzvMvitdu6m1crseHlq0xEQ+cEoY41eiOK9+T2OoiwGi9mC8t49I0Lq9OR3M24
	 WnJTD2hmjnhygkfllHjlC+28Ec+pyKpPPdw+PIm0yPP3bwXefU33i+p18LB2DpH/tY
	 CopBXk+SvVw6/5PzYYEwMr+1bvW69E0bObgPKcJ9ohOoqR4Oc5xbtjrplTnLyLcCCL
	 ikm/+Jn1xiUGfDZU2dIHug1dHfTt8c/OmDUqPlDidWCHLWHk4DMUom9d8PGpkQ28f1
	 hrXjh/bHVCnaOVqSd1bES6B8=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C0D6A40E0196;
	Thu, 15 May 2025 15:16:02 +0000 (UTC)
Date: Thu, 15 May 2025 17:16:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
Message-ID: <20250515151601.GHaCYFMdcyIUmFgCNx@fat_crate.local>
References: <20250515134756.93274-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515134756.93274-1-david.kaplan@amd.com>

On Thu, May 15, 2025 at 08:47:56AM -0500, David Kaplan wrote:
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
>  			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
>  			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
> +		} else {
> +			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> +				pr_info("Retbleed mitigation updated to stuffing\n");

I've seen this patch offlist already so only one thing about this here above
which is already there in the current tree.

Let's zap it. One can see to what the retbleed mitigation was updated by other
means. No need to add more spaghetti to the code.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
