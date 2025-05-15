Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3811E834B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305852; cv=none; b=lfI9KdW8WoTjNPXTPoykdEL4nZ9XLNUOws9YfniHUHrb35V+qJX5lEhvqC+9+ft3BEciPYiR1CFdP8gEb6VGA1HyusjoENI0KFFTnMP3BPjFRLIoeirzfqP9Zqqqh8K/Z9OuuKlA0o0rlwKDDLfdxYpkD8j9QJA5EjjBYD065EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305852; c=relaxed/simple;
	bh=mOO9QS74is4tkJjF///0zapNGyi6/5x8zmHUHUc+3DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YU+rFxe8MtdY+7HAjj7BrvKCKuX5rmYUPhbFmrMixANthTCWXtPHqH/FG5Oi7OJGHExc5+M4ffyfsd/DKYw6wwAKy5gDgVk9S0aQybs6m20tYDZTlgc1vZHIflPM+30uW0/5QaVHaXVzJO6zbMOIr6MKlnocsVxfyvpysDFUnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbLlhzTB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbLlhzTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173F8C4CEE9;
	Thu, 15 May 2025 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747305852;
	bh=mOO9QS74is4tkJjF///0zapNGyi6/5x8zmHUHUc+3DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbLlhzTBGc5HsUDEOHRR/pzimVSUx+hkFV0uB3QbJM9yWY5dV/P0fFKpRSURT96Ce
	 wSbefFqbLWS8IN1or6qOObV9J6uaO33zNf4fiHNSBfvkS7IbVTeGXJjNlIXvQv8hc2
	 H7ZMZilvkzwKvKOt80P+6DnIGbivJj5bX08sLe6mfQoYp6IyexHoxLBAcOeZ1No+l7
	 27PrwvVDCowL2aa55iZIV6am4vxipdVySKompaZwVcE0d9vAOwmpR5M9qtXJtVtJKL
	 iLcXqQEcP1yqqoa2yw4r3Ix/9pO8LcSGYdQ6/BkfedOWzBq33vIAgN/bVzbVFM1DDO
	 9FYK1M5HRyvlw==
Date: Thu, 15 May 2025 12:44:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 07/29] x86/boot/e820: Print out sizes of E820 memory
 ranges
Message-ID: <aCXFdvWiNW94F24R@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-8-mingo@kernel.org>
 <aAc5Wlwj4gaBApIy@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc5Wlwj4gaBApIy@surfacebook.localdomain>


* Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> Mon, Apr 21, 2025 at 08:51:47PM +0200, Ingo Molnar kirjoitti:
> > Before:
> > 
> >         BIOS-provided physical RAM map:
> >         BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> >         BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> >         BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> >         BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
> >         BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
> >         BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
> >         BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> >         BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> >         BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> >         BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> > 
> > After:
> > 
> > 	BIOS-provided physical RAM map:
> > 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]  639   KB kernel usable RAM
> > 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]    1   KB reserved
> > 	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]  320   KB ...
> > 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]   64   KB reserved
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> > 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff]  144   KB reserved
> > 	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]  768   MB ...
> > 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff]  256   MB reserved
> > 	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff] 1005.1 MB ...
> > 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff]   16   KB reserved
> > 	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]    2.8 MB ...
> > 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]   16   KB reserved
> > 	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]   15.7 MB ...
> > 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB reserved
> > 	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff] 1008   GB ...
> > 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]   12   GB reserved
> > 
> > Note how a 1-digit precision field is printed out if a range is
> > fractional in its largest-enclosing natural size unit.
> > 
> > So the "256 MB" and "12 GB" fields above denote exactly 256 MB and
> > 12 GB regions, while "1.9 GB" signals the region's fractional nature
> > and it being just below 2GB.
> > 
> > Printing E820 maps with such details visualizes 'weird' ranges
> > at a glance, and gives users a better understanding of how
> > large the various ranges are, without having to perform hexadecimal
> > subtraction in their minds.
> 
> ...
> 
> > +/*
> > + * Print out the size of a E820 region, in human-readable
> > + * fashion, going from KB, MB, GB to TB units.
> > + *
> > + * Print out fractional sizes with a single digit of precision.
> > + */
> > +static void e820_print_size(u64 size)
> > +{
> > +	if (size < SZ_1M) {
> > +		if (size & (SZ_1K-1))
> > +			pr_cont(" %4llu.%01llu KB", size/SZ_1K, 10*(size & (SZ_1K-1))/SZ_1K);
> > +		else
> > +			pr_cont(" %4llu   KB", size/SZ_1K);
> 
> I would add some spaces here and there for the sake of readability.

I think it's perfectly readable, skipping the whitespace for numeric 
literals is standard style. Linus himself does that occasionally, see:

  94a2bc0f611c ("arm64: add 'runtime constant' support")

  static inline void __runtime_fixup_ptr(void *where, unsigned long val)
  {
           __le32 *p = lm_alias(where);
           __runtime_fixup_16(p, val);
           __runtime_fixup_16(p+1, val >> 16);
           __runtime_fixup_16(p+2, val >> 32);
           __runtime_fixup_16(p+3, val >> 48);
           __runtime_fixup_caches(where, 4);
  }

Or:

  938df695e98d ("vsprintf: associate the format state with the format pointer")

  +       unsigned int shift = 32 - size*8;

which uses visual grouping to make arithmethic expressions more 
readable.

> 
> > +		return;
> > +	}
> > +	if (size < SZ_1G) {
> 
> Can be written in one line as
> 
> 	} else if (...) {

Done. (See delta patch below.)

> 
> Ditto for the rest.
> 
> > +		if (size & (SZ_1M-1))
> > +			pr_cont(" %4llu.%01llu MB", size/SZ_1M, 10*(size & (SZ_1M-1))/SZ_1M);
> > +		else
> > +			pr_cont(" %4llu   MB", size/SZ_1M);
> > +		return;
> > +	}
> > +	if (size < SZ_1T) {
> > +		if (size & (SZ_1G-1))
> > +			pr_cont(" %4llu.%01llu GB", size/SZ_1G, 10*(size & (SZ_1G-1))/SZ_1G);
> > +		else
> > +			pr_cont(" %4llu   GB", size/SZ_1G);
> > +		return;
> > +	}
> > +	if (size & (SZ_1T-1))
> > +		pr_cont(" %4llu.%01llu TB", size/SZ_1T, 10*(size & (SZ_1T-1))/SZ_1T);
> > +	else
> > +		pr_cont(" %4llu   TB", size/SZ_1T);
> > +}
> 
> Don't you want to use string_helpers.h provided API? 
> string_get_size().

I don't think string_get_size() knows the fine distinction between:

    BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB device reserved

and:

    BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256.0 KB device reserved

"256 KB" is exactly 256 KB, while "256.0 KB" denotes a value that is a 
bit larger than 256 KB but rounds down to 256 KB at 1 KB granularity.

When reading platform boot logs it's useful to know when such values 
are exact, at a glance.

Thanks,

	Ingo

====================>
 arch/x86/kernel/e820.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 7f600d32a999..67a477203c97 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -213,22 +213,19 @@ static void e820_print_size(u64 size)
 		else
 			pr_cont(" %4llu   KB", size/SZ_1K);
 		return;
-	}
-	if (size < SZ_1G) {
+	} else if (size < SZ_1G) {
 		if (size & (SZ_1M-1))
 			pr_cont(" %4llu.%01llu MB", size/SZ_1M, 10*(size & (SZ_1M-1))/SZ_1M);
 		else
 			pr_cont(" %4llu   MB", size/SZ_1M);
 		return;
-	}
-	if (size < SZ_1T) {
+	} else if (size < SZ_1T) {
 		if (size & (SZ_1G-1))
 			pr_cont(" %4llu.%01llu GB", size/SZ_1G, 10*(size & (SZ_1G-1))/SZ_1G);
 		else
 			pr_cont(" %4llu   GB", size/SZ_1G);
 		return;
-	}
-	if (size & (SZ_1T-1))
+	} else if (size & (SZ_1T-1))
 		pr_cont(" %4llu.%01llu TB", size/SZ_1T, 10*(size & (SZ_1T-1))/SZ_1T);
 	else
 		pr_cont(" %4llu   TB", size/SZ_1T);
