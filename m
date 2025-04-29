Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9962C3761
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931271; cv=none; b=kJ+ZRj4FyEr7jYamY4zGFJc2dK9YxY/e9pvv7LDn0iT1Ir3ZWHwFw/9fTdAzA1+jqOWRwtlJg8gilheWf4NPXGPaKU5AM0DIrHZFtmIcGJua4UsU11ls9/Yx+shJFzDwc3Y4MY8cQEXq6I+xT/N8HFEO8A2SmoNZfFWkyYVgHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931271; c=relaxed/simple;
	bh=UZjt/IAsL4khluVkhUVPMazky1UC93cjT7u35P50h6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4FdElaH1VxFzRYgjPAYv+1ljJyJ4lNv5NwCB6mgpMxZt9zJdhSZYr1xi9G83vWGu23s33lWwSAnN169gR/tyUy8QSrubX/mGGdrU2XOgwaGO5KfI0juY6EaiodTrxcdQdeuTmmFmg+KkSL7wX+2BnVOdqbEkaAPG2aofdG/HtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fOYDV+hv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fOYDV+hv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7571B40E0214;
	Tue, 29 Apr 2025 12:54:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mn-CTOFf24vP; Tue, 29 Apr 2025 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745931262; bh=Xfo4nxHlLCSRs5L/AEjkRORAS+X5OGuM/hPtp498kIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOYDV+hv92jbX6dKPF6yAlwjcLep1c+2cH7cVG6rYFZ7NNncdJM2MpYJ17/6dDwSW
	 jvQQI+lALvUxBLZebZFMYb3v/FTIoux4KBU7CZaaWnGOTXUzPBq3l8+UHhtKCtCoAQ
	 qVtb/15fxFp3N1j1z23Dyyi/4xGxXFTGG+m7aQNfF4uBhwyWz3zfweHfESv1xmqCyY
	 mTTeXmgXqyv0QNahbiAvDIY0PLg8unilmigW9W3TaVozp7j8J4vjRe5sCxzkipOf3t
	 1etEO6QqMhMAdQPowH0eSlL1YIlHoij6SD7kuGIHUisbXiYGyQFVTn2oOLa2HFU1i2
	 Ha9C2BAHx+9WHW0aLsADQInxYM64rWy+p0QyY1Lk27xxzelreTbRglLt3QGVAh87vT
	 SEbTlQxxulNPvimqwras5yTrkdJ7uzamjnwkawTFsgubw3ocpi3hMEGyclmteHg/JU
	 XX/PHWVhd66WafdlDS8k48D7VWuzkPeNgSiWKg68/Z6ks4qTBl5Gj1voaN7Uh0p8Dy
	 4REz8CUd1+ufMhRj9hE9D+9SQCY6RufGvjzJaNB4SC39Ocj8FoX6ouSvhe3mHKnpMw
	 zKnHlhRM/CSyl0sZW5qQ8hhfvu5oJjAtG2XgfkrvfBcTcNTdPh1O15psOwh9j0Ert6
	 e/c99ld7cJezUnwB5iMJnn60=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A4AB140E01FF;
	Tue, 29 Apr 2025 12:54:12 +0000 (UTC)
Date: Tue, 29 Apr 2025 14:54:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/16] x86/bugs: Restructure SSB mitigation
Message-ID: <20250429125405.GGaBDL7StMBtnkuG3S@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-15-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-15-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:19AM -0500, David Kaplan wrote:
> @@ -2224,19 +2226,18 @@ static enum ssb_mitigation_cmd __init ssb_parse_cmdline(void)
>  	return cmd;
>  }
>  
> -static enum ssb_mitigation __init __ssb_select_mitigation(void)
> +static void ssb_select_mitigation(void)

I don't think you meant to drop the __init section here ...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
