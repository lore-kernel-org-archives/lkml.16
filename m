Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522E190477
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856918; cv=none; b=eXvk+7OMzjWYcC1k0njN3BFPLR7W2k8awiLmKLWotbjR8sHJ4Eu64yZquNDtimnCRmHEBTegVGJPCJibUGwYkpNNEMQXPJ4/2owgFlszL0pyMHQ36SJRLS+jDOseHFauCj/uy05vBM6bdSETkk5ElSu1opVRGJzlvI+zJWVknlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856918; c=relaxed/simple;
	bh=bspnAnfOYPXkckqpugaOONGwBNl+ZqbdMZmypY1pVHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMxxuV2V0HBu15YrcUcdDzqyM4nkNBWkj7q1EKUUqoJbJCE9oqTCrH8kzu+GdYzWNOYjI/H96vDkBgNIvqsPVrseXXngCK6NKivXzMcVGAUWkoUAM1yyKAwIA7JYRhH1bnuVj6dL1FCa+vnEvpQk+eE/wF1SrFp97hiIw9bJ8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=WMiole2G; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="WMiole2G"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 487D140E0238;
	Wed, 21 May 2025 19:48:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QdPjYpmW-E45; Wed, 21 May 2025 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747856910; bh=dguXMRCWnygXWoSelReroPWOfywbc8kpODIQd7D6n40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMiole2GmkBa5H5P1kWJDNdgSOzwsTg0un/LZ0qIo1OBRexG4g2OXGUlOmzVRg6KT
	 1NDNlgaECAoVZ0VsnvLCec2nZS0RtG8oyGXEaadExJYgzTv0fWY8jiK4t0tlIFTalp
	 ZqhCmZvOreMEqweM1I5ZC64z3XQV19lHD7IyaDrbbjJ7cXTcPkIWRBNi2PYLm8p8eA
	 SPXfNwpGva015QtjwIzpU6SEEA5ZaObrjxNIbEjzmOJnk+xQT4etGmilR/6in7rtcL
	 mBWsat5H8jNCqbDNiH8xfi+0sitvEWJK0rZj3+xWPKQHtLuZw6Mgrry7motzXxcfR8
	 GQOSCPJr6GCwSuUsB/qSih3YiTFdB0DiD+CJCQ0LYCMp7ucYLV7FGKw40y7aS4Dw1Y
	 PHnYYGi+LoZpMpx86E8tHhstaqF0KpIJkGBhvYXoaHmyiaAkdex8ymFjdQTAheiAE9
	 2JIl0l18vkv/Um81P3eo0LU7e/l+LtCLqrScTMI+RIVmjQb6zgYbNoJ1hi1vS465gx
	 CT/teU2Lf6MlyXidttKjYgOpYD13XLLzjpY6NGsjidzwLpUvVsJXfhNGk5HSVtAUMR
	 bSBeTKNMDqzfr5OddJnwQb6DsWnqzF167FCuVpsL/1T0CIY0ECrRIDtCDItFQiY2yR
	 /TMIup/DKKY/rli4vwKtjvYU=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6280040E0163;
	Wed, 21 May 2025 19:48:20 +0000 (UTC)
Date: Wed, 21 May 2025 21:48:19 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250521194819.GGaC4uA6mwlMBoqDMt@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
 <874ixernra.ffs@tglx>
 <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local>
 <87sekxrdws.ffs@tglx>
 <20250521192930.GEaC4pmmpuktvClDxj@fat_crate.local>
 <87msb5rbub.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87msb5rbub.ffs@tglx>

On Wed, May 21, 2025 at 09:41:00PM +0200, Thomas Gleixner wrote:
> > Right, if I had a time machine, I would fly back and define this thing in
> > a whole different way: X86_FEATURE would be what the kernel has enabled and if
> > the bits completely or partially overlap with the definition of a respective
> > CPUID bit, so be it. But they would not parrot CPUID.
> >
> > IOW, I would completely decouple X86_FEATURE_ bits from CPUID and have all
> > in-kernel users check X86_FEATURE flags and not touch CPUID at all.
> >
> > But ok, in another life...
> 
> We can do that now.

Yeah, we will have to because of alternatives...

> The fact that user space can check CPUID and make uninformed assumptions
> about the kernel's view was a design fail in the first place. 

Yeah.

> Of course everyone assumed that nothing needs the kernel to be involved and
> all of this will magically support itself, but that was delusional as we all
> know.

Yeah, look at glibc doing CPUID and making decisions about what to use. Now
imagine kernel disables something under its feet. Boom.

> In the long run we really want to disable user space CPUID and emulate
> it when the hardware supports CPUID faulting, which should be made an
> architectural feature IMO.

Both vendors do support it. I probably should do the AMD side. It is about
time...

> Let me restrict this further:
> 
>     arch/x86/kernel/cpu/cpuid_eval.c::cpuid_eval() (or whatever name the
>     bikeshed painting debate agrees on) should be the only place which
>     can use the actual CPUID instruction.

Right.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
