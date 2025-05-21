Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A32641F3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828448; cv=none; b=DnFW+t80DGbflhDXNm4NMOH2j7pZgaLqVWVEfWWmTy75BqqYFfTSUpPMTdIz6K+iYSGpeA0vtDOQ+Uqp/fkZeIEjVFKnmXxKVAwAeK3MpqgvjN3gjQcQhqYcF/v2uYJ8gwXq0za54+Z2muq/3+REOVY+/IXWeqG0qjDSIpwAyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828448; c=relaxed/simple;
	bh=6IH5AQ7W6+pZRHvlW/QlfAkPQVu6qSbusJW05pe3iFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtJAWVx8F/LUq6ecVF9J/M0egYn5aLDY+CYi/Rkec04vofsXFmxfS5ogsX3gT3yhM6ptl4Tfai3M6i7KjIVZ0RXkW9ow3dS06ePkovyVH7Uw2hsQ+spQOxghSvr0uhFhB+p4I93yMArkh3SbU+zN0QH6oKRBZrephgjefif9rCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JyeqJ1r0; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JyeqJ1r0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E426440E0238;
	Wed, 21 May 2025 11:54:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZUy4qgCg7Jo9; Wed, 21 May 2025 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747828438; bh=oxFFjYIAl6Gx0mrK2huomLlzlORJsSkgG/Z8fhvD5LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyeqJ1r0zEfWOiwV6aDnvMZZimNTNuDHtBBzznXTdNqEJrjFjkktAH5Cp7fLtet5d
	 AHjjWvALvtW7FrVblOJjgr6uN5Pnt5De0CLz8steQQu5qsw8RDRk2cJOn7cIEBJnZI
	 ls482K5mgyMAIBeELHk+ZNoNQnUNyNvzvTOVVJIe19IPNEa8LPgDqQheHCJqovOiTQ
	 ikKj2YmhI96JYtCdYuwdvBTbvhgsPD7DZ8MjDzHQMdNAo/cjb80q/n6ilETI3lUW5K
	 wHKqNEEima7yOL4d/F6DPEKvRKPTDzl0962F9V44vIVqD3MSF8vjrqQzOuijw71Qdu
	 ZJriLyRosC5+VjI/M7Y185+6RY+qKurxHvOqb26bJdWTwgUrda4YMZVJerSk6QhNNT
	 MYgcDZW+CBltDrBKY0dYwXN1gwhGeMGMSucBgj8TFPmeUDfls6i2WQbLddXmvy23MB
	 TwTvNKHjVzzHybGaKR0Q/Ur8kWpi43eFa7Gr1Yt2pL8C2BZxZwo3dPQQVKxTB31MMr
	 /wJfRrwxPr3mOgp2NHZrJ7qhL5pNXMfUYCVT9kBYxsUKwxYqEGEkSFJaf9+aMWiFuu
	 RkRl39bVrDqksDo6glluQ6dQfh20KCNBbO5r+18Syq9duBHHbCt1EvM3pOnlxYUNLt
	 Wl8OQXQGU96MgJJLb4ncttzM=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 654D040E0192;
	Wed, 21 May 2025 11:53:44 +0000 (UTC)
Date: Wed, 21 May 2025 13:53:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, nadav.amit@gmail.com, Rik van Riel <riel@fb.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 4/9] x86/mm: Introduce X86_FEATURE_RAR
Message-ID: <20250521115343.GCaC2-x8LsmMApUkjQ@fat_crate.local>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-5-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520010350.1740223-5-riel@surriel.com>

On Mon, May 19, 2025 at 09:02:29PM -0400, Rik van Riel wrote:
> From: Rik van Riel <riel@fb.com>
> 
> Introduce X86_FEATURE_RAR and enumeration of the feature.
> 
> [riel: moved initialization to intel.c and disabling to Kconfig.cpufeatures]
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

I'm guessing Yu-cheng is the original author - that's expressed differently.

> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/Kconfig.cpufeatures       |  4 ++++
>  arch/x86/include/asm/cpufeatures.h |  2 +-
>  arch/x86/kernel/cpu/common.c       | 13 +++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/Kconfig.cpufeatures b/arch/x86/Kconfig.cpufeatures
> index 250c10627ab3..7d459b5f47f7 100644
> --- a/arch/x86/Kconfig.cpufeatures
> +++ b/arch/x86/Kconfig.cpufeatures
> @@ -195,3 +195,7 @@ config X86_DISABLED_FEATURE_SEV_SNP
>  config X86_DISABLED_FEATURE_INVLPGB
>  	def_bool y
>  	depends on !BROADCAST_TLB_FLUSH
> +
> +config X86_DISABLED_FEATURE_RAR
> +	def_bool y
> +	depends on !BROADCAST_TLB_FLUSH
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 5b50e0e35129..0729c2d54109 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -76,7 +76,7 @@
>  #define X86_FEATURE_K8			( 3*32+ 4) /* Opteron, Athlon64 */
>  #define X86_FEATURE_ZEN5		( 3*32+ 5) /* CPU based on Zen5 microarchitecture */
>  #define X86_FEATURE_ZEN6		( 3*32+ 6) /* CPU based on Zen6 microarchitecture */
> -/* Free                                 ( 3*32+ 7) */
> +#define X86_FEATURE_RAR			( 3*32+ 7) /* Intel Remote Action Request */
>  #define X86_FEATURE_CONSTANT_TSC	( 3*32+ 8) /* "constant_tsc" TSC ticks at a constant rate */
>  #define X86_FEATURE_UP			( 3*32+ 9) /* "up" SMP kernel running on UP */
>  #define X86_FEATURE_ART			( 3*32+10) /* "art" Always running timer (ART) */
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 8feb8fd2957a..dd662c42f510 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1545,6 +1545,18 @@ static void __init cpu_set_bug_bits(struct cpuinfo_x86 *c)
>  	setup_force_cpu_bug(X86_BUG_L1TF);
>  }
>  
> +static void __init detect_rar(struct cpuinfo_x86 *c)
> +{
> +	u64 msr;
> +
> +	if (cpu_has(c, X86_FEATURE_CORE_CAPABILITIES)) {
> +		rdmsrl(MSR_IA32_CORE_CAPABILITIES, msr);
> +
> +		if (msr & CORE_CAP_RAR)
> +			setup_force_cpu_cap(X86_FEATURE_RAR);
> +	}
> +}
> +
>  /*
>   * The NOPL instruction is supposed to exist on all CPUs of family >= 6;
>   * unfortunately, that's not true in practice because of early VIA
> @@ -1771,6 +1783,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
>  		setup_clear_cpu_cap(X86_FEATURE_LA57);
>  
>  	detect_nopl();
> +	detect_rar(c);
>  }

Move all this gunk into early_init_intel().

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
