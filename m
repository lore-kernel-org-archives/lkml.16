Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4AA47
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745066249; cv=none; b=ZNw6TAATQ1dtKtwYLkCLWTUjIWayNLboEdNG2fnBUgdwzEF4pIpSng97EnjrpldR2grAFe962LSTyrG14oa0++ES+7lwADph6CxaXgqV0rnSDNP3HrFgjctmgcznNcpQ6m+neXEM10m7o+GWqkXIKtFbEK/Wdjdatp0dMl20MbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745066249; c=relaxed/simple;
	bh=HRt053Fz5AWUEoaV7Alk7mvmYYi+E+2gPZ/3782Z570=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwCW7K1vpJKPXluO7ypw1vxomjXWlUakjrzEccTS9u8wrQBNSzOJfCc8vgSdy88XCk9aHdlTB+NvIuywcTIqJEcPiG9R3x1HILu+wQD5+Ix7RC55IB3XpDal2xpezq+tOdPyHxGo+/GVqtRZy4c7o3w8mbbH0FLayzN1CQTtLjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OwfPxA8A; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OwfPxA8A"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 29A3040E015E;
	Sat, 19 Apr 2025 12:37:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TQqiqw4KvFVM; Sat, 19 Apr 2025 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745066232; bh=IWNeNuZc67ZFXKkKzPlxkl9ZgRH9mX/7lZnso9Mxnik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwfPxA8AgRK8YCcOhCdESo4JPOf8bYIeHVCgXkEhm0W+QW/x54rUaLPBnbsxGA60M
	 eS2rOtjaUG6XtzX+/c/Zq5eQ+dLnOhRwxGmu3lvhhnc7oUZ82n8M5OkHCjJTWIMzDG
	 m/x3/OkE8sHkYDp7Xc+OqnWCaS11B7/cA2gzgQPfxNPTtgREkK98/hIWkhaTFnDIPR
	 bprhFcLn994x+ZV7wvaESkKFnPwVVZBz852CUgfn61uiamv977fXtZCzcYJCUlu+fU
	 rb8P4CE07nFGvMT3+fEu0yiyYw8D75Obrc+O3XKEHsrOAA2X5Ynbdt4hvrcHkKMe37
	 IwfnrGNhBdNko+8KKB3z0Su8q7IQyQVjlxBurWsInm9c33wvCDyYVrAmxFi+mI/7BL
	 0ZtyAHUClvID8SY8Yf+yk+jMpVICG8T+iieT6v2VEooOK2kPqFdA0BmYzPIEWTxP36
	 rOk59TKpREyQ4N/QRknLbgwyF1wuaiDT4/ePSVMVvrs2suc+PP7vkFv+HNOqo7LZMs
	 aSb1OxEMY6SmmnktetvZQFBJMALwQZQ8fbKqINlklWg2KcPyZobhpuIeyR2RNRTmKM
	 2joliUPO2Za52YBDCmSET4jEvD9nBlLRuCu2T1MXMtiuyCF09R54t7PDBzGL7jX4LV
	 ScNXlXIIBHXJ80/wjMW/haEE=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 05A6840E0244;
	Sat, 19 Apr 2025 12:37:01 +0000 (UTC)
Date: Sat, 19 Apr 2025 14:36:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/16] x86/bugs: Restructure TAA mitigation
Message-ID: <20250419123655.GRaAOY5yCyIz6TYcCC@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-3-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-3-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:07AM -0500, David Kaplan wrote:
> @@ -394,6 +399,11 @@ static const char * const taa_strings[] = {
>  	[TAA_MITIGATION_TSX_DISABLED]	= "Mitigation: TSX disabled",
>  };
>  
> +static bool __init taa_vulnerable(void)
> +{
> +	return boot_cpu_has_bug(X86_BUG_TAA) && boot_cpu_has(X86_FEATURE_RTM);
> +}
> +
>  static void __init taa_select_mitigation(void)
>  {
>  	if (!boot_cpu_has_bug(X86_BUG_TAA)) {

Shouldn't you use !taa_vulnerable() here directly too, since we're introducing
it as a helper?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
