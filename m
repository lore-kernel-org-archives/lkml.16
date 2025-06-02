Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740A18CC1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748855410; cv=none; b=adCxgIGitw5wWEX3cN9HnS4tLn7ILUZWuMXelIYlnAmj4nLjAobrDNOrW0gL64h0YBjEytVpQd17XkUHuLVtoR805cX2HQeN1hDluelZwTn4dv6yPnPsulAnfmUvaSZ/fZqPkURvig3bKKvBEw9hFWZmvZtyGxfzX98uBEX5D9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748855410; c=relaxed/simple;
	bh=r+mNqAPJf3F1VO75d4saOwMjvbL22ywqG35mtYkTWKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI5c5u9gUxFqbzMnMXAd/WPnziZVM/qF4bWoFwnIiJJchYr86XC7SMPBGqvI8cA2UIDZXdOfjRYBryVNDvK31ehNwtwjjmBWiiDqYVnDcFOekIqSjCETh0VVbT97Sc9Py5/4kUWDVPiBmuiXAEM8Qf0CvM6k4irydnnrTfZIZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=S8vPAQyQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="S8vPAQyQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 48A2140E01AD;
	Mon,  2 Jun 2025 09:10:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pqRqbaKd5PpJ; Mon,  2 Jun 2025 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748855399; bh=PXxp7trTgsmgG36RFtwdxLHkx/aINwiUDuoDR3CE7lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8vPAQyQ+10MJTQCzLbLLDyzFokgAMQqp5YuhjepVkPMo2zh3mB/WKDoQJ+hEpZJf
	 mQzfooK8OAoLsOJqyK+JnqggUf5200jjH4xt9yS46Vz83TVxZj0V8JDEp4Xcj2O9fG
	 /4w5dUoOx4qtbSQSMIgMQV9KVUcCbe0aodlAfpCQdCXVq12tLSowkWT/SXaYuAeY05
	 gVsabcdGrLy8WH7mKXJSSV1JjivBWWQ2xYlFFSFzACwPUvqqCw8mXu6tubEW0VxqCm
	 BNH4D4eHxDh/scPfJH43523oPCwOutuq3Dra7NGDnRPBwvIXfWEDSPY/liMruatqta
	 Tf8rLusfYJQ+TSFxpHHBGJiwyD7vuLopjSOQ3vhOXgdbAqyKKUqSbeVZhXNFl0BVMy
	 OnvPRXgi/Omf72ef7DgbgiCMoS+HG2CxwG9NhETVUGtZxxQY2FGvDGWkaDw4K0mHT/
	 gzfqpRTwVxjaWLWHfq/E0JTUKM00mFcNed68cCEMqdMArjtzdpFFOd6ErgPm19K2g/
	 nqgdwZle25Lc5I0msmR7JmYH4m3rcqd9e6TPBA+IQWY29WzJN/jZI0LfyjZsBtV1rG
	 i2dY8GvEgsnL0CZOX+OGdKOIORpjdejXH987BGsyEg4QhJldJgSI2etL1nB90AVFm7
	 Nxwkxd00c2X+79fJmkNcT72A=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C104040E01AB;
	Mon,  2 Jun 2025 09:09:48 +0000 (UTC)
Date: Mon, 2 Jun 2025 11:09:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: pawan.kumar.gupta@linux.intel.com
Cc: Khalid Ali <khaliidcaliy@gmail.com>, tglx@linutronix.de,
	peterz@infradead.org, jpoimboe@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH] kernel/cpu/bugs: log ltf1 mitigation status
Message-ID: <20250602090942.GAaD1qVv5182lZSPtK@fat_crate.local>
References: <20250602073732.734-1-khaliidcaliy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602073732.734-1-khaliidcaliy@gmail.com>

On Mon, Jun 02, 2025 at 07:37:06AM +0000, Khalid Ali wrote:
> Log the L1TF mitigation like other mitigatioons. This one is is the
> only one that doesn't get logged.
> 
> Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 7f94e6a5497d..38cb2a1b2849 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -2803,6 +2803,7 @@ static void __init l1tf_apply_mitigation(void)
>  		return;
>  	}
>  
> +	pr_info("Mitigation: PTE inversion\n");
>  	setup_force_cpu_cap(X86_FEATURE_L1TF_PTEINV);
>  }

Pawan, what's the story here?

There's this stuff further down in that file:

| #define L1TF_DEFAULT_MSG "Mitigation: PTE Inversion"
|         
| #if IS_ENABLED(CONFIG_KVM_INTEL)
| static const char * const l1tf_vmx_states[] = {

which comes from 2018:

72c6d2db64fa ("x86/litf: Introduce vmx status variable")

I guess it is about time we made this mitigation also follow the common
pattern with the mitigation strings and issuing them at the right time?

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
