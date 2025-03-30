Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D91922F4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743361635; cv=none; b=Ckx88G4blB41gvN4OQeMpmhezZqyhOUChdjdyoPtag0jFrQGACVd3+VfPJAcCTWjqDB7DV9hefbowVV9OHjPjYVkPk21BJEyvx3IRnaikppg/COjQtzB2hD9pkzc5uv9ctA+dqmLRwrZWolwzGiOmX89cSFZWhwRLOy/PyM3Q9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743361635; c=relaxed/simple;
	bh=w+bgsNVI8fs5XCOzxrD8UctlNaXHSRXaILFL2u163v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4nmqhl9Q6v+BdVM/5xQ0m6cMqtiTrVP6rZhn/40svT/4gaxOGRjtWxnCNauhwuLbHdNtdenToANlVv5Myg5bjpu8GjAIQRDtNL12OJUa1TskIczdk6PjHXYGW8jDmk8oV51HziwaqvatI0MkXZZsgyUdDUCvhs/nr/rQzIuP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ehUN5OgM; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ehUN5OgM"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EA99B40E020E;
	Sun, 30 Mar 2025 19:07:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zrTyePmCf7_9; Sun, 30 Mar 2025 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743361625; bh=EkdA5Y8KPgWEJkk3DAyvYdJIqpBQeitRzLIFyYy95PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehUN5OgMaa08NezoA37F99w6LOtLn4p+JHSOgRv/4GmS3/xHYlLzd9+jYdYQxp6j8
	 BKnEI3qoxdeRlTl4TTTlltTg1icGc5ydN9JErqIT2B/bALG0/D+8UGiqSPFCcN+2BG
	 CR/IAGbBmoEGAL96or/pwUrj7ZEiR/Mh+/teO9HWzDO9qy8yF7qUPmU8X9vNptUJZl
	 V+znJR057CL9NPyO29TIDAOcngIBwVwi4ulW7dPryOsdPMVqqhHyNK6yGAcyrnLNRO
	 I1WaxEFkkfyud2W45cb5Bo1fTChaP/YpXEU3xSVCmsDPBR/99ofgbAxIRmb0m9acBx
	 xJrQuqQMPPN2qNrh0SMEK7Iqn1zzhVGKOdpZ+RYE7xEsOAptlbMcb60bX0dmXyw21A
	 iK7DIsfSpgOd4b2EfMwTjRVjdTSuUQM0RqRh9kJ1TQq4u9XOX2C49gRauZkh0PPMOX
	 q7dF3ZqPprZVy8mC4jT42MMsD2LdNlgd6IgM+jltpZAeL7vuljQvMKA5XhWwekMZtU
	 jo+LjAKrHXeDchacBuepEpzq1jlnu1vOn/0vLHfWLC3TAf4rDiEdKX+s8hEmFdF6bd
	 wO2hKwuSxEAkCzYb2hjMoDTi14VQWa4QzF5FstjAotcY7/iGc5Cpqj4rd+26F4ZNLH
	 7H305L+hS31p+W7c+PE4hFe0=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EE77A40E016E;
	Sun, 30 Mar 2025 19:06:57 +0000 (UTC)
Date: Sun, 30 Mar 2025 21:06:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <20250330190651.GDZ-mWS5RRwsN8Q3g4@fat_crate.local>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
 <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>
 <20250330173140.GCZ-l__PVdSx6mj-zL@fat_crate.local>
 <Z-mRwxb3r1yrH332@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-mRwxb3r1yrH332@gmail.com>

On Sun, Mar 30, 2025 at 08:47:31PM +0200, Ingo Molnar wrote:
>  +#ifdef __POPCNT__
>  +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
>  +                 : [cnt] "=&r" (res)
>  +                 : [val] ASM_INPUT_RM (w));
>  +#else
>        asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
>                                "call __sw_hweight32",
>                                ASM_CLR "popcntl %[val], %[cnt]",
>                                X86_FEATURE_POPCNT)
>                         : [cnt] "=a" (res), ASM_CALL_CONSTRAINT
>                         : [val] REG_IN (w));
>  -
>  +#endif

That ifdeffery.

The alternative only is fine as this is the usual way we do those insns.

The ifdeffery around it is ugly and is pushing it and it would be fine if it
would bring anything but it doesn't. It is making the code ugly for no good
reason whatsoever.

> Which is 3 straightforward lines of assembly code and a straightforward #ifdef.

And they bring what exactly?

I haven't seen anything besides some super minor, completely pointless, hm,
"savings". So much so that the uglification of the function is not worth it in
the *least*.

When I look at that code, I need to wonder now, is the __POPCNT__ defined or
not?

> My main objection is different: if __POPCNT__ isn't defined during the
> kernel build of major Linux distros, then this optimization almost
> doesn't exist to our users. And I don't think it's defined.

Yah, that too.

This whole effort is a total waste of time and energy.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
