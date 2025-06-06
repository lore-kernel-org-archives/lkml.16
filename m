Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5141A9B3D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749247292; cv=none; b=GKQY3dfsZTFs9ny6IiVnPU/AjgGmGkwO0BLSNwnJJX+pe8SUUhHYSi7oTClJnA0iIq8zexiEAjb4+eGyTZHpmmrHrJkzNccezdSY+ozgt8DsAkZ64Y60QedVQi9THI2p/xwe1gLWaRV2NSVZYglbd5Tp37jXcej/zG7tQfxGH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749247292; c=relaxed/simple;
	bh=QDNc3hB7m3NjGn7ho3WdVBpyCKJL6MbkGvHw+uSZGS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6rL95HalC1IPLo4Ivvd24/rdYVCsBWZL9Zwe3YrnKmOryU4PE2GK3tHNF3X7GCFvCwcVpzaaJIdMMHHj29kaTFnNCnxjwy1Mg4vkbW5PBG4YNVBEiZYtSq4C1qxX8q7Q8NpAdZSNHn+eQZU0o38lO4+YZNKlKELQDRD+WomGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eV245SvJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eV245SvJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2027588b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749247290; x=1749852090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttz69yCGjmx1eoS6euDZxmboEjtbtLBmCyAJgWTUfxI=;
        b=eV245SvJ7G5ixQlpU70N/fHxI1cHn20TEvpcH1StXlcRMULnPJ/NoYkYV8Ftvksi18
         rqPQKk3ADxOA669uyLBWqwAopWNh28eSK0OvQnQISujxEb7rl/Qe3qFZXXMe7yUmEJhq
         kpuqCJGC4aSJhZTvRxIFQv20GxLRquXN1i1BaBT1LDFDIN7y/X1TiaHi8iqFDXAhYn3n
         ht+HO4lAN/TtTbhu6gIb9h5UKrFZ3yfw9A6mWGc8ZVf3PtKdvmm025P9E1lpQxP6UGIL
         NSjvceIt1O7rEHEcqpNQ3tVHOgigEPO0gIxfbAOkA/Zw9/a7LiS8lbjwCrf4ickGEkLZ
         71GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749247290; x=1749852090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttz69yCGjmx1eoS6euDZxmboEjtbtLBmCyAJgWTUfxI=;
        b=gHY7/OBMQumVfNW85BxFRiOV3ypLKNV5SRfe+gAe6VJfl3WcyRKyeORk0q5frkOFq1
         ZMugF9RXzRZN1+cSxpHH3ncAVs3Ab+gAH5X/SOCy4exDX8fJtNkMBKKB3rNZT7tAmZS2
         CmTC2f5u3niCYU90Z4apbFLo1L9hcBpTJXGh4E20BdeCDLAbVCSWF61LLKx24B4KnNYG
         RGCmR57/tD2EBMwufuN5kSO6FcPnbkJi7K4XAa6EA47tFvk5B7vhjatugMHYo2PXcNwY
         zLodbOuktdZFnbQd6MI6E5PuYsFYPA8wN8n5iJHPDoZam3hA/MFE6JZb1tjxT3npfqao
         1n9A==
X-Forwarded-Encrypted: i=1; AJvYcCUTt0oLPtTg6bWK6evYheadXieLNXQsNBReGjU9zLnipdLsMR8WuYrJbFHv/sGG5E5evrd9XcibP5QAzC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXved81I9kluy/TTevj+GTI/airDa0TkDA2Dov4AqUR7fytfi
	0DYH96PRU22FTh3LJZOVwCGuMIUoxex2mu27FTi/hIN8/57h4mvOvizJTW2USoX7o78VvptZUwi
	QT9Qu5NM=
X-Gm-Gg: ASbGncuWjD3Qs3lEInBpy/ei1pFQ8pTZFMYSMWy9pB1CzuZOjg6nS/K3zut7Wgo6Tdp
	usOFiaCsnr9LKACzt5gFb6Vu+orwEr1hh8yu2aloSkFRBwCmKt55JR695NJFlYjD+OXYdC0y6gq
	4wYfuIR1b6v6jBHC8Lx/1iz6ag4JA0eIMLuQ0ENj1CcH6YpJFPf+X5NLrYIH5K+JKmcgJcGe5Lm
	4Mjao1IngqTMOczySoIAtjI/od6dAVaFRc4jm8zQxYgZO0ObIu2Z3LgXS87co/itgBicSKXI/iQ
	lwvme4kFyr7BPe0THUIUsFOtnAwm+EPvO7ApIFLeGwgWGovIUGaS
X-Google-Smtp-Source: AGHT+IEj0bI/X4A5eYGCGK7otcSqbGkj9CDQTq42iS/whU8gXRUwR+/Nu3j77R8mBiu+iyqv60iFhw==
X-Received: by 2002:a05:6a20:430c:b0:21a:de8e:44b4 with SMTP id adf61e73a8af0-21ee25555eamr6427245637.16.1749247289679;
        Fri, 06 Jun 2025 15:01:29 -0700 (PDT)
Received: from [10.0.16.165] ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm1632595a12.10.2025.06.06.15.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 15:01:29 -0700 (PDT)
Message-ID: <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
Date: Fri, 6 Jun 2025 15:01:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
To: Xi Ruoyao <xry111@xry111.site>, Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
From: Vineet Gupta <vineetg@rivosinc.com>
Content-Language: en-US
In-Reply-To: <20250606092443.73650-2-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/6/25 02:24, Xi Ruoyao wrote:
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
>
> Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/
> Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html
> Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
> Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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

My 2 cents as I've dabbled into this for ARC glibc syscall macros [1] where r0
is both the first syscall/function arg and also the function/syscall return.

The v2 approach still keeps 2 different variables in same local reg which has
potential for any future compiler shenanigans.
Segher's example avoided specifying the same reg.
What about something like the following: seems to generate the right code (with
gcc 15)

       register long ret asm("a0");
       register long nr asm("a7") = __NR_getrandom;
       register size_t len asm("a1") = _len;
       register unsigned int flags asm("a2") = _flags;
       ret = (unsigned long) _buffer;

       asm volatile ("ecall\n"
                     : "+r" (ret)                                 // keep "+r"
for input _buffer / output ret
                     : "r" (nr), "r" (len), "r" (flags)
                     : "memory");

       return ret;

Thx,
-Vineet

[1] https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/arc/sysdep.h
