Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADC21E082
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747855795; cv=none; b=bFLepTcXfVnRdS+p55goKi4g23H2SJq74oeafcbhZD0i5euFUeWJre8lvKydrgtdgQQv5UHgYi2W/3USn8Rc0HQxLiLhu9UuX1cVMOXp5g59SzHq1wXJX0jtkYIrXYihpNNJ0Vt9hBhXWQ8LsXyErEQb12+aPPF6MFA6c1mpYtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747855795; c=relaxed/simple;
	bh=h6XilRWuBp7+PgmTU9jiMKkkq4FnFRWE5CVr1eHQsDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbXNve2aIGxZeYhmS6+OQ/QW25Vp2N1O0U6FN41lDWet7NszhbbTVYscP5lrEPg5c7nMcsoiblNaalG05BWSeLlNCZN8oE0IiRX91ZMl5INFrxUREIdJVHeoPPTsGjtHueq3SsZHDtN81pVh0RmFxmZsGuxJjcnFs8vOI9Z5FQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MUfJAHxS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MUfJAHxS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 02A6440E0238;
	Wed, 21 May 2025 19:29:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TbjGMxBQ_vK4; Wed, 21 May 2025 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747855786; bh=F6H3aHv8gh5alAtFsD2d4Wn0ntmMSpzzynBU1+ZZ9p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUfJAHxSDEdo94bVwdODqkU4+bO+QCQIws1/C+y7kJo/YIaAvQzDb/uB4QDNnkAAW
	 nZllglYwrv1z5rTmB8ckklVJgN3vZNnD7xZXKbbUq8U5+xwCr8GXULw+qerQaIErbu
	 SqO0hHodsRg02GvYpIJfqEvitPTff8yzydnK8co7ligYEDm9JvBJ6X4Tudj4NmAKrW
	 XPNQF59xM3TMF8Wh5F84uXGqCNM9Coqxp4Dhhvv0cH7rTrfFxkvvJjk+Ixg5ra59hn
	 nXn8Key4oRA84LWVMxXJEeKF8Ysy9f6xhsDBmpMd0yHyWo//cQGNi7lLASG4hA7fvY
	 G8geDy8CYixsqiWA/e7LL+Bq+Q5RA+Yl/qSUmizg24pSxn6kyz+AH/WnDQFcBAfMMR
	 k6uavfdSGcMilHk/GL9+1vQ18KfmFysFS+tIeBgXhRqleJnVFmBrFEI8elZVKRLcA6
	 +d2EY4pJIpy2NNwzmQo6oAq1P/PqEb6jvql6eoOqzWnAJd5+LY9Q/dtn4TIjwlzktO
	 wdp20o5Rtke5j+Y6AihvH/vcVUcAIqFR4iTY7B/t/jQMcTzTlu4MUCbY0+Blsqg9qr
	 c4ZaAwxQy+2/ZITb7E3Jdj0uXEBR7PU5xDmuO3WFJsHcs5XWjX8el4lTNgDHTFJPvy
	 9mCBbqiss1Tn57UHvghimMU4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E02C940E01FA;
	Wed, 21 May 2025 19:29:35 +0000 (UTC)
Date: Wed, 21 May 2025 21:29:30 +0200
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
Message-ID: <20250521192930.GEaC4pmmpuktvClDxj@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
 <874ixernra.ffs@tglx>
 <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local>
 <87sekxrdws.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sekxrdws.ffs@tglx>

On Wed, May 21, 2025 at 08:56:19PM +0200, Thomas Gleixner wrote:
> Yes, and the process is that the leaf/bit needs to be in the data base so
> that the headers containing the new leaf/bit can be auto generated.

Ack.

> Kinda, but you're conflating things here. leaf_7.la57 is a hardware
> property and leaf_linux_$N.la57 is a software property.
> 
> Of course you might say, that clearing leaf_7.la57 is sufficient to achieve
> this.
> 
> But in fact, "clearing" the hardware view is the wrong thing to do from
> a conceptual point of view. The hardware view is "cast in stone" no
> matter what and having a clear distinction of a separate software view
> will make things way more clear and understandable.

Right, if I had a time machine, I would fly back and define this thing in
a whole different way: X86_FEATURE would be what the kernel has enabled and if
the bits completely or partially overlap with the definition of a respective
CPUID bit, so be it. But they would not parrot CPUID.

IOW, I would completely decouple X86_FEATURE_ bits from CPUID and have all
in-kernel users check X86_FEATURE flags and not touch CPUID at all.

But ok, in another life...

> I've stared at code for hours just to figure out that there was some
> obscure way to end up with a disabled feature bit.
> 
> Having a software view in the first place makes it clear that this is
> subject to a logical operation of 'hardware capable' _and_ 'software
> willing' instead of some hidden and obscure 'pretend that the hardware
> is not capable' magic.
> 
> Clear conceptual seperation is the only way to keep sanity in this ever
> increasing complexity nightmare.

As long as we all agree and follow this, I'm a happy camper. Ofc, there will
be confusion where: "hey, I'm checking the CPUID bit but the kernel has
disabled it and marked this in the synthetic bit, blabla..." but once we know
and agree to what goes where, it should work.

> Claiming that saving 5 bits of extra memory is a brilliant idea was
> even wrong 30 years ago when all of this madness started.
> 
> I freely admit that I was thinking the same way back then, because I was
> coming from really memory constraint microcontroller systems. But in the
> context of Linux and contemporary hardware complexity we really need to
> shift the focus to comprehensible concepts and strict abstractions
> between the hardware and software point of view.

Right.

And as said, arch/x86/ should be solely looking at the hw view and
representing to the rest what is enabled or not. But I'm preaching to the
choir here.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
