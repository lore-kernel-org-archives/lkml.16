Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189D1F0E26
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107741; cv=none; b=D45meyXA0ExruzsGpHoo8paL+7LHbRmX/kJekPODeATqianvTprzNYB9lIBjFYOR+uHfGDbdORtrztE7L8PTTkZpBImDrFu+vv4QzBIIS5K270We7Ux2BYw1DzvhVvRz2hhqkGmC5DZnteMHOiRvsrzg+jFfizIWXUhU3HGK/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107741; c=relaxed/simple;
	bh=eQ+6FyRVM8PPKszPrCrL3SlSesv5MrWqZAnxeCxvKAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+8u1XBQhBWJ9gzWGp8iafhnDg91t+c3qyhVDO4BvT3u5D4jjbidmNlBaGvBgTv2vlh42ddVfej9F+Fk6wIiGaRTucODJ2TaZtrXgwMISsfwIS+jO5EVrYUGDczD0KIoXH0qoVFvar+SF7YnmkxvSTg/1Jz0z41aPJ5YXdEa4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cdQvLKjk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ll0Txor3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cdQvLKjk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ll0Txor3"
Date: Thu, 5 Jun 2025 09:15:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749107738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umTS7/wxwJGZ/2nVekjYJpD6hur1aVjvLdCfSnqSTYU=;
	b=cdQvLKjkv3D1G2gKqvV4B3QBUO+wOWe7TkECPamTTWyc2+Hj0YZo5lKUSPqpMezodLf9LC
	P8VModRaY59790cYs9rxFdwq7Nb/jkTnwZk7syHafuFMQyIZNNaFKbHW6aBFdWsnmsjZkF
	hfMeLglQPzd4qwY/DOmCoQrvy5CKX+mNB90lOFfE1jFVMdiP+LpEuJxN48otO5rjdjQFLl
	oR7cznjKUQ35/HWUMRA+iIKtuYYNNJhoKRMMdqfT/aAptu8eM52h8ZYa1qPpm5uYdJIzWn
	L+o0ZY6D7mogXi4K0sDvVrqhK4GstaExO2lBO9h6t1Y580HoiZ4uqcyNBasC1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749107738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umTS7/wxwJGZ/2nVekjYJpD6hur1aVjvLdCfSnqSTYU=;
	b=Ll0Txor30Y+PWfzfK/UtImbmkgW7nNqiQS6WFGjTZWIhCwuSH5LkB5CTqgZdzpSXylUUv0
	s9PcEnt2MwwW18CQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: vDSO: Correct inline assembly constraints in the
 getrandom syscall wrapper
Message-ID: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
References: <20250411024600.16045-1-xry111@xry111.site>
 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
 <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
 <0f0eb024d7ed062141a8aa048017e6f7ef7c1fd4.camel@xry111.site>
 <57a1ced6-406b-4197-96ca-6b83d99ca1a0@ghiti.fr>
 <5065dcf8fe1995859874196aa9ea5c0bff056ae3.camel@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5065dcf8fe1995859874196aa9ea5c0bff056ae3.camel@xry111.site>

Hi Xi,

On Wed, Jun 04, 2025 at 11:09:52PM +0800, Xi Ruoyao wrote:
> As recently pointed out by Thomas, if a register is forced for two
> different register variables, among them one is used as "+" (both input
> and output) and another is only used as input, Clang would treat the
> conflicting input parameters as undefined behaviour and optimize away
> the argument assignment.

Good catch, I forgot to check the getrandom() implementations.
 
> Per an example in the GCC documentation, for this purpose we can use "="
> (only output) for the output, and "0" for the input for that we must
> reuse the same register as the output.  I'm not sure if using a simple
> "r" for the input is safe or not here, so just follow the documentation.

This looks good in general. However the usage of the "0" constraint now differs
from the "r" constraint used by all other vDSO implementations, even the RISC-V
gettimeofday() itself.
I'd like to hold off applying this commit and wait for the conclusion of the
discussion linked below and then implement the result of that everywhere.

> Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/
> Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html
> Cc: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/riscv/include/asm/vdso/getrandom.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
> index 8dc92441702a..0d84a38e79da 100644
> --- a/arch/riscv/include/asm/vdso/getrandom.h
> +++ b/arch/riscv/include/asm/vdso/getrandom.h
> @@ -18,8 +18,8 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
>  	register unsigned int flags asm("a2") = _flags;
>  
>  	asm volatile ("ecall\n"
> -		      : "+r" (ret)
> -		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
> +		      : "=r" (ret)
> +		      : "r" (nr), "0" (buffer), "r" (len), "r" (flags)
>  		      : "memory");
>  
>  	return ret;
> 
> base-commit: dc5240f09bca7b5fc72ad8894d6b9321bce51139
> -- 
> 2.49.0
