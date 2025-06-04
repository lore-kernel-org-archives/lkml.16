Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146557C9F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 01:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749001898; cv=none; b=PCMBA17Bf2dTQnlA38v/Q669m6SyELkP3BNkoXizVYkcTNlQCY5gIWZZkGRVFDqDCdn5tFveFwosDkIgCKSh2MQn+6s4QoFJrULiJG/yxpQl8kFBzUTAdf49zN/l5dtnR3HbSWgH99xZOLfYKXlIK5SNhpqLJNk9rTt9k4Z8eK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749001898; c=relaxed/simple;
	bh=DjrbL93m1FlADAq7GP6a6Oe+jV5ga9pRcrA1cKeDBE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egKvFwD0+wk5j8JRVmWDqybHbXJi6N7a3XimE/gR4v7KIB1RFFkWMYtpBvrL4dQAZCYbsOww3mcRllOw05lvBCnYG2EjqzdMxTtvjaEdUvW2gItBSEhAamONn0tVaZp6kr+/CEFP/e+18It4g6bbTJDsKN+7IoDZDYALrOiWoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CaIYC9zf; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CaIYC9zf"
Message-ID: <f661db68-4271-4fea-8309-47aa83c1078a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749001894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNkTgxFuYHAfdqRxN2GV5weXMJ1rFGnyltVUWaIL2Ug=;
	b=CaIYC9zfnmLYSixTyDznsJnXDHRzhcrJoS5Zl22p2NS+d/1RH03HmjL2ZLv96zA4tAi1Da
	qCHFyyMAeDH9hyyboHgXNhZOOElavcy0XmyHfP40RJ+mytNbNOxCJwEzXMmmWQKv9X1aQ4
	PeFR99OC4LWtNtEWw/lwKxr9oTtZ/4k=
Date: Wed, 4 Jun 2025 09:51:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: vDSO: correctly use asm parameters in syscall
 wrappers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org
References: <20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 6/3/25 7:48 PM, Thomas WeiÃschuh 写道:
> The syscall wrappers use the "a0" register for two different register
> variables, both the first argument and the return value. The "ret"
> variable is used as both input and output while the argument register is
> only used as input. Clang treats the conflicting input parameters as
> undefined behaviour and optimizes away the argument assignment.
> 
> The code seems to work by chance for the most part today but that may
> change in the future. Specifically clock_gettime_fallback() fails with
> clockids from 16 to 23, as implemented by the upcoming auxiliary clocks.
> 
> Switch the "ret" register variable to a pure output, similar to the other
> architectures' vDSO code. This works in both clang and GCC.

I don't know Clang and GCC, but I think it's great to do so.

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> 
> Link: https://lore.kernel.org/lkml/20250602102825-42aa84f0-23f1-4d10-89fc-e8bbaffd291a@linutronix.de/
> Link: https://lore.kernel.org/lkml/20250519082042.742926976@linutronix.de/
> Fixes: c6b99bed6b8f ("LoongArch: Add VDSO and VSYSCALL support")
> Fixes: 18efd0b10e0f ("LoongArch: vDSO: Wire up getrandom() vDSO implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/loongarch/include/asm/vdso/getrandom.h    | 2 +-
>   arch/loongarch/include/asm/vdso/gettimeofday.h | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch/include/asm/vdso/getrandom.h
> index 48c43f55b039b42168698614d0479b7a872d20f3..a81724b69f291ee49dd1f46b12d6893fc18442b8 100644
> --- a/arch/loongarch/include/asm/vdso/getrandom.h
> +++ b/arch/loongarch/include/asm/vdso/getrandom.h
> @@ -20,7 +20,7 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
>   
>   	asm volatile(
>   	"      syscall 0\n"
> -	: "+r" (ret)
> +	: "=r" (ret)
>   	: "r" (nr), "r" (buffer), "r" (len), "r" (flags)
>   	: "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8",
>   	  "memory");
> diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loongarch/include/asm/vdso/gettimeofday.h
> index 88cfcf13311630ed5f1a734d23a2bc3f65d79a88..f15503e3336ca1bdc9675ec6e17bbb77abc35ef4 100644
> --- a/arch/loongarch/include/asm/vdso/gettimeofday.h
> +++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
> @@ -25,7 +25,7 @@ static __always_inline long gettimeofday_fallback(
>   
>   	asm volatile(
>   	"       syscall 0\n"
> -	: "+r" (ret)
> +	: "=r" (ret)
>   	: "r" (nr), "r" (tv), "r" (tz)
>   	: "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7",
>   	  "$t8", "memory");
> @@ -44,7 +44,7 @@ static __always_inline long clock_gettime_fallback(
>   
>   	asm volatile(
>   	"       syscall 0\n"
> -	: "+r" (ret)
> +	: "=r" (ret)
>   	: "r" (nr), "r" (clkid), "r" (ts)
>   	: "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7",
>   	  "$t8", "memory");
> @@ -63,7 +63,7 @@ static __always_inline int clock_getres_fallback(
>   
>   	asm volatile(
>   	"       syscall 0\n"
> -	: "+r" (ret)
> +	: "=r" (ret)
>   	: "r" (nr), "r" (clkid), "r" (ts)
>   	: "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7",
>   	  "$t8", "memory");
> 
> ---
> base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
> change-id: 20250603-loongarch-vdso-syscall-f585a99bea03
> 
> Best regards,

