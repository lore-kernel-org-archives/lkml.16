Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF1D286423
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203426; cv=none; b=WdAl21UuQI+6ZAxHgHCnjbi+MJu2deVIZ1n7tsOHRBKESGc0+y6eoXx2OIVTH1DLDeSJmBjOeJ6mV8JjcvcZmiEM7JvuoBH6kWEihY/QqYo8iLHSpNv4XMwqk6R8u81RPxV1T4N5yygIGf4ovKFIvW/mUeaFmfIEWxHC+2sOFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203426; c=relaxed/simple;
	bh=kzUqLZeJ2yjPfSSP5h5qzP0//IHkx/iH5DMtIukoG6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC8AwpR93Qv3G8DB7OPvihY19l+WML7Ukd7u+jPqk/mqeD1utEfTb/zufxmnN95NwgE5o20JgIEwk4cCf7Ygdlq3Vracr7CR2+iLssjQVj0c993oqazNxGu6V+a1sDV2v1TAHfSR3qP++IgjEzjAQ61bjOISR73Bq+xsCvnrVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qfI9cano; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GIm3ZBAV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qfI9cano";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GIm3ZBAV"
Date: Fri, 6 Jun 2025 11:50:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749203421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLSdIgeVQP7vdahEotSJRsbMUWrTn+A4o1VzdMavb+Q=;
	b=qfI9canoTrdbiweyImkK8+XQqUokGbKt6yF73hV5xAPELJjJCwXWYMaClVYXCpgoRJQLdn
	uxngu1G/tD3VZ8m8GD4GT5FwACvglpJj7uHIsXi19E3UyFja1IlyTcK1IfIY02Epv2B2TU
	FCy4xQMKM+Dfez69y+W3b7XyaPZz4CneNK0Ysr+Lqml13Tccp6+XBCgnhPsAP4lXRhsUAG
	8bozl8DE6wKKHeYwNxNdpJNbDhJR2Kp11QD9I2BKtZrE1jpwNpqCWnNDYHZPjRvaw8higO
	rv0EFtRUEPi3/5aWI1qRlw519K8/5HazlwQeDbUhEsnDhtxRtv+GU24rmR8ukw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749203421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLSdIgeVQP7vdahEotSJRsbMUWrTn+A4o1VzdMavb+Q=;
	b=GIm3ZBAV/7x2LRtcycM/uSg7k41ZFVb9zA79HjVHngC7UurtpeqbV+h+P/KogITcjgi8lX
	D2Wb+zEjr8Bv8uCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
Message-ID: <20250606112858-abbbff06-c6cb-4c23-b58b-c69b0719e1a7@linutronix.de>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606092443.73650-2-xry111@xry111.site>

On Fri, Jun 06, 2025 at 05:24:44PM +0800, Xi Ruoyao wrote:
> As recently pointed out by Thomas, if a register is forced for two
> different register variables, among them one is used as "+" (both input
> and output) and another is only used as input, Clang would treat the
> conflicting input parameters as undefined behaviour and optimize away
> the argument assignment.
> 
> Per an example in the GCC documentation, for this purpose we can use "="
> (only output) for the output, and "0" for the input for that we must
> reuse the same register as the output.  And GCC developers have
> confirmed using a simple "r" (that we use for most vDSO implementations)
> instead of "0" is also fine.

The wording is a bit confusing. Maybe this is better:

	Instead use "=r" (only output) for the output parameter and "r" (only input)
	for the input parameter.
	While the example from the GCC documentation uses "0" for the input parameter,
	this is not necessary as confirmed by the GCC developers and "r"
	matches what the other architectures' vDSO implementations are using.

> Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/
> Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html
> Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
> Cc: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

In any case, thanks and

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> 
> v1 -> v2: Keep using "r" for buffer to follow the existing convention
> (that the GCC developers have confirmed fine).
> 
>  arch/riscv/include/asm/vdso/getrandom.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
> index 8dc92441702a..c6d66895c1f5 100644
> --- a/arch/riscv/include/asm/vdso/getrandom.h
> +++ b/arch/riscv/include/asm/vdso/getrandom.h
> @@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
>  	register unsigned int flags asm("a2") = _flags;
>  
>  	asm volatile ("ecall\n"
> -		      : "+r" (ret)
> +		      : "=r" (ret)
>  		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
>  		      : "memory");
>  
> 
> base-commit: dc5240f09bca7b5fc72ad8894d6b9321bce51139
> -- 
> 2.49.0
> 
