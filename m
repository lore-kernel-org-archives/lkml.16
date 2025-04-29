Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE10215060
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945458; cv=none; b=XGWwr7ndUpZ5jF0Bw6C+zOPvXAqF3zYSJiEb7oWB2EK3yYX76a6qAoTyGKiwMu8GiZWC2ubyLGMRKuP5XXMgyUZZZM5BeCLMR04/0rhzRfwM4U6+N5vJqG1lk3xDWKb8pf77gQm/oADvr6QW6A9JLSnoX0gyyhY66fjFvdrVnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945458; c=relaxed/simple;
	bh=YicU0zV7ztG//LlCNJQI63gqZUs/cpCP8ikOIeO5FwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj/VHcoegMK3IQJJPRu94xThhTArioPykigaFOWArl3Hotl06EWkVVbvo4NN3h/U0DCtNW4NWeK0Vjf+BHm3z3DZTIRu06wzYS+u4/96sic70zYMhimQ0t0+DTvjNybF0krp/n1L+ZN8FKqZaR1rMOMOA041iqJGFhFAtpKb8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RCfl0H0s; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RCfl0H0s"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A03A40E01DA;
	Tue, 29 Apr 2025 16:50:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QYTWq-p_Ub9x; Tue, 29 Apr 2025 16:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745945448; bh=SUchcJ3ddZMa6sQjxgAPCwFqkH6A/V+MfHCJP2j+eT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCfl0H0staJZd2fHDdIpQ+Q/bFHo22eJVz29OVu5W7L0oMKe+II++SwCeU2+00TkI
	 NKCOM/GExNFdbam5gxEZpxWMsqn9tCqfsGa4bx6JhVK0WehGvvkmler1KTEREsTfB2
	 wRyVHLDM7itC12IBan53XnOupn1eJb87vqyRanCLNuKE7QaAaDKimH4yhdzvUcpI6p
	 91TblELxiXEUJCzcPs2i1+oW7kLAITuslCRp0ceNRhJlJLLa/cDyBWkErQHqxo6OQW
	 /cEHojh4qDYPhU6TukP5atLgTNCQ5F0YbgtRpduq0sNpAeHPaa5GpFRHx7/fm6mt4I
	 xarDcNW+9SafUK/mimnoxzwPPQiALqHo6pj+Uo0ysn3smjEVBGw3Rf8iuFtWpTokMZ
	 Z9L1OREY4V9wpZmaY/aRcC4DsEx1rmL5h9jrnvINeFM/wZDF/xb3yo38VT+K1Nkiqm
	 lpXfKIHhTNxTiX39EZqV+ImwkHBdUBYlOSavJN0wA2BNZ6EcCTxkXMuH/dTRL/C79X
	 XvAj74Gi1O2gPTk7dBjbx7O7Mwr/HSfeDXuZlSxK8Jc1xh50oPnrBj+NWfRO6fzUfS
	 jO3LtQPo6SLh6le/ZcWuut4cb0RV/ivVvJIpL/pLxUKbfZ+WXM5Uz0b9au9GbMS826
	 oYuepW0d7O+EDLBMZZ4BJnyc=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4C00C40E0219;
	Tue, 29 Apr 2025 16:50:38 +0000 (UTC)
Date: Tue, 29 Apr 2025 18:50:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 16/16] x86/bugs: Restructure SRSO mitigation
Message-ID: <20250429165032.GHaBEDWM8qeeE6nfxI@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-17-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-17-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:21AM -0500, David Kaplan wrote:
> @@ -2738,130 +2730,80 @@ static void __init srso_select_mitigation(void)
>  {
>  	bool has_microcode = boot_cpu_has(X86_FEATURE_IBPB_BRTYPE);

I'll push that init after the return so that it doesn't happen unnecessarily.

> -	if (!boot_cpu_has_bug(X86_BUG_SRSO) ||
> -	    cpu_mitigations_off() ||
> -	    srso_cmd == SRSO_CMD_OFF) {
> -		if (boot_cpu_has(X86_FEATURE_SBPB))
> -			x86_pred_cmd = PRED_CMD_SBPB;
> -		goto out;
> -	}
> +	if (!boot_cpu_has_bug(X86_BUG_SRSO) || cpu_mitigations_off())
> +		srso_mitigation = SRSO_MITIGATION_NONE;
> +
> +	if (srso_mitigation == SRSO_MITIGATION_NONE)
> +		return;
> +
> +	if (srso_mitigation == SRSO_MITIGATION_AUTO)
> +		srso_mitigation = SRSO_MITIGATION_SAFE_RET;
>  
>  	if (has_microcode) {
>  		/*
>  		 * Zen1/2 with SMT off aren't vulnerable after the right
>  		 * IBPB microcode has been applied.
> -		 *
> -		 * Zen1/2 don't have SBPB, no need to try to enable it here.

Why?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
