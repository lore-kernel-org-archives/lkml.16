Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8BB21FF25
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539495; cv=none; b=rJDbal01YgBncic1+AtVNzlfT6S0O31GajNEt+Efg0ru+rmNYNpknDzSuFHcLTNDeoKats/btdCF0FbDaiom98njZP00Qt8jVOG8elqcDTTKVVgP7EA3WidxbRHlIjzhfxUFLXtfbWbPaXMv45ZMjyE3DONYCTyrvKZ9bNZ08IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539495; c=relaxed/simple;
	bh=LZRD70+98HkmlBjEKXhJksoyA7T1QwDLFiyog8az9JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePazu21PF/8+oa6DnImKJ13TdgOw2k9ZN4kKWDBMsoh6QnXK5IlL11IxQpm383yrixfag+7XPdpiBbV2ClV79xF+bS8V4p40LxIR2zzKqTHW6leGUC9v1RBdFiH0pieZ5rCKAZV9mKk51sOxwxsGe04DpKqjeynD+tk45a1eCTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U6rRYD6A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xwt91q1F; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U6rRYD6A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xwt91q1F"
Date: Tue, 10 Jun 2025 09:11:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749539492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjKNx+UqOSaW/5Z0xhucrewFq9jqNFu8JVC4O9AKh2c=;
	b=U6rRYD6AqSUxdFmZJx8Tek5zKRMLScgYkIAAhOI4gej/rUUneRdhYEm2gte7qoYYNnRSAe
	TijkiYOJu3BCQThdooxNSVGAC9PvUGETI9AWhMRWr1n2P7BaoHERpkgoCQQ1nloJiuT8tc
	jXlgemqO9hcH0EulyUmJXsf0aF8me6rgiZsqhabaVYOU8j73vNgW4yzuDY/Ft02HVSF+uE
	Noz+mvBY5eg8j8/3uOZw4nYXS1BxAt5+NDcmQiKjKpJsNXjJOEmtZjDZCuIs/+fkhIIO/A
	7qfvJjj0y/nLVaBf8IPuGz0TjTV0Nz+S/6Y781qdU0I+0SXXZctMTf9cEfbfMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749539492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjKNx+UqOSaW/5Z0xhucrewFq9jqNFu8JVC4O9AKh2c=;
	b=Xwt91q1FEe8Of8Xgs0LlFlfiuxflDP2u5NAryYIVJCD2Db2rcbdWoZnGIFn6Bh3AQVNY8V
	CJ4qs5aEU16IG5Dw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Vineet Gupta <vineetg@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
Message-ID: <20250610090648-c6d4e08a-3efa-4c19-9a03-d04a65d18af2@linutronix.de>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
 <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
 <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>

On Sat, Jun 07, 2025 at 10:16:34PM +0800, Xi Ruoyao wrote:
> On Fri, 2025-06-06 at 15:01 -0700, Vineet Gupta wrote:
> > On 6/6/25 02:24, Xi Ruoyao wrote:
> > > As recently pointed out by Thomas, if a register is forced for two
> > > different register variables, among them one is used as "+" (both input
> > > and output) and another is only used as input, Clang would treat the
> > > conflicting input parameters as undefined behaviour and optimize away
> > > the argument assignment.
> > > 
> > > Per an example in the GCC documentation, for this purpose we can use "="
> > > (only output) for the output, and "0" for the input for that we must
> > > reuse the same register as the output.† And GCC developers have
> > > confirmed using a simple "r" (that we use for most vDSO implementations)
> > > instead of "0" is also fine.
> > > 
> > > Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/
> > > Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html
> > > Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
> > > Cc: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > > ---
> > > 
> > > v1 -> v2: Keep using "r" for buffer to follow the existing convention
> > > (that the GCC developers have confirmed fine).
> > > 
> > > †arch/riscv/include/asm/vdso/getrandom.h | 2 +-
> > > †1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
> > > index 8dc92441702a..c6d66895c1f5 100644
> > > --- a/arch/riscv/include/asm/vdso/getrandom.h
> > > +++ b/arch/riscv/include/asm/vdso/getrandom.h
> > > @@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
> > > †	register unsigned int flags asm("a2") = _flags;
> > > †
> > > †	asm volatile ("ecall\n"
> > > -		††††† : "+r" (ret)
> > > +		††††† : "=r" (ret)
> > > †		††††† : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
> > > †		††††† : "memory");
> > 
> > My 2 cents as I've dabbled into this for ARC glibc syscall macros [1] where r0
> > is both the first syscall/function arg and also the function/syscall return.
> > 
> > The v2 approach still keeps 2 different variables in same local reg which has
> > potential for any future compiler shenanigans.
> > Segher's example avoided specifying the same reg.
> > What about something like the following: seems to generate the right code (with
> > gcc 15)
> > 
> > †††††† register long ret asm("a0");
> 
> Then it would be better to rename this variable to just "a0".  And I
> guess Thomas doesn't want a new convention different from all other
> syscall wrappers in vDSO...

Indeed. I want to keep it consistent. Especially for a bugfix.
Speaking of which, IMO this patch should have a Fixes tag.

Then we could start a new discussion about changing it to something else everywhere.
Although I don't think that the single-variable variant is better.

> > †††††† register long nr asm("a7") = __NR_getrandom;
> > †††††† register size_t len asm("a1") = _len;
> > †††††† register unsigned int flags asm("a2") = _flags;
> > †††††† ret = (unsigned long) _buffer;
> > 
> > †††††† asm volatile ("ecall\n"
> > †††††††††††††††††††† : "+r" (ret)†††††††††††††††††††††††††††††††† // keep "+r"
> > for input _buffer / output ret
> > †††††††††††††††††††† : "r" (nr), "r" (len), "r" (flags)
> > †††††††††††††††††††† : "memory");
> > 
> > †††††† return ret;
> > 
> > Thx,
> > -Vineet
> > 
> > [1] https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/arc/sysdep.h
> 
> -- 
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
