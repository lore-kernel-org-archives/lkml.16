Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4671027A445
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741253; cv=none; b=cP83uQphLFlcgPaE81TPs+6FUO3H5Co98VhzrsZ6RTGKd8/xxczFyooeR/RsuEzlR3ImxN74hma5Z4qnzlMESq+5HVe067ZUAlPSGkjEJQIw0BPFSzrne6tQpPAzB0m8HbbfULkjFQQ5WehLlGttZtF1LExLy6jCVBf9lVcCLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741253; c=relaxed/simple;
	bh=j4VSmi7G47BGKw47cF9jLjR8nBeRQe2ObFKwA/SbkhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brqd3RVK8OEF9AuizEJrWYPrjkq9rAt8+GVQr/k0e23OpryQEQWwXv8zQABLJPoaBWDFbeP9tvDjxrvc4T+pB3qRxyjJawInIwmCD0OCQMWGns4VdG+kfu0MqWAJiLqfCUbKFWc2pFgSYTMzXV1qja1miFnVbKxnNAhHJKSgmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vYl1SOK6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=REdK3K7n; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vYl1SOK6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="REdK3K7n"
Date: Thu, 12 Jun 2025 17:14:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749741250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOZoXB1I46+nODXC8g7QxkLdyXfc3FWgBVKFHXkZNOA=;
	b=vYl1SOK6JnmyoVMdVWBSgD6A7hfZm6BvWuoqH4PEepcb0z7Tv+Aa9l4t/ua3kdIDQI9qpd
	PT82MZ7qkEe2DOPP7uG7knP0q9kbreaeFUpQuPhkjifv2pmcMt3uZYaNCUqIb9LisT/xkF
	OkWJ5TiUyXD8Y22PJ7MLXWR/qI9NkjPm3x1h1Yg8sLkzC/0yniDpMJT53Mg8R1bFUZiGZW
	o7UVabQQytpxP78wZ1uitwsPwDtt34VhyKV6ee9MAyuK8zlCgWnpjQN8SN7+XLaxfnVbM8
	qCyG3ciY/hrcVHDqmnfZpTbbrwk9gMFQfCTDnU8/BKqW4nlt7t6v2dua4U3tlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749741250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOZoXB1I46+nODXC8g7QxkLdyXfc3FWgBVKFHXkZNOA=;
	b=REdK3K7ncGsHybRmLY5g0/tQS5r+Zop89uDb19CEpmyqCXXTIX4sTiKiix8vvCKi827g9n
	qjJzOacT8iGG56DA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Message-ID: <20250612170632-59116c0a-6b38-4cd9-8df1-b193251d598c@linutronix.de>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612145754.2126147-3-rkrcmar@ventanamicro.com>

On Thu, Jun 12, 2025 at 04:57:54PM +0200, Radim Krčmář wrote:
> Counting the arguments to sbi_ecall() and padding with zeros gets old
> pretty quick.  It's also harder to distinguish a tailing 0 argument and
> the padding.  The patch changes sbi_ecall() to accept anything between 1
> and 8 integer arguments.
> 
> Those who can count are also given sbi_ecall1() to sbi_ecall8(), which
> the variadic magic uses under the hood.  The error messages upon a
> programmer error are a bit hairy, as expected of macros, and the
> static_assert is there to improve them a bit.
> 
> The final goal would be avoid clobbering registers that are not used in
> the ecall, but we first have to fix the code generation around
> tracepoints if sbi_ecall is expected to be used in paths where
> performance is critical.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 341e74238aa0..c62db61bd018 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -10,6 +10,7 @@
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
>  #include <linux/jump_label.h>
> +#include <linux/build_bug.h>
>  
>  #ifdef CONFIG_RISCV_SBI
>  enum sbi_ext_id {
> @@ -465,9 +466,40 @@ struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
>  			  unsigned long arg2, unsigned long arg3,
>  			  unsigned long arg4, unsigned long arg5,
>  			  int fid, int ext);
> -#define sbi_ecall(e, f, a0, a1, a2, a3, a4, a5)	\
> +
> +#define sbi_ecall1(e) \
> +		__sbi_ecall(0, 0, 0, 0, 0, 0, 0, e)
> +#define sbi_ecall2(e, f) \
> +		__sbi_ecall(0, 0, 0, 0, 0, 0, f, e)
> +#define sbi_ecall3(e, f, a0) \
> +		__sbi_ecall(a0, 0, 0, 0, 0, 0, f, e)
> +#define sbi_ecall4(e, f, a0, a1) \
> +		__sbi_ecall(a0, a1, 0, 0, 0, 0, f, e)
> +#define sbi_ecall5(e, f, a0, a1, a2) \
> +		__sbi_ecall(a0, a1, a2, 0, 0, 0, f, e)
> +#define sbi_ecall6(e, f, a0, a1, a2, a3) \
> +		__sbi_ecall(a0, a1, a2, a3, 0, 0, f, e)
> +#define sbi_ecall7(e, f, a0, a1, a2, a3, a4) \
> +		__sbi_ecall(a0, a1, a2, a3, a4, 0, f, e)
> +#define sbi_ecall8(e, f, a0, a1, a2, a3, a4, a5) \
>  		__sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
>  
> +#define __sbi_count_args_magic(_, a, b, c, d, e, f, g, h, N, ...) N
> +#define __sbi_count_args(...) \
> +	__sbi_count_args_magic(_, ## __VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1, 0)

This looks a lot like COUNT_ARGS() from include/linux/args.h.

> +#define __sbi_count_args2(...) \
> +	(sizeof((unsigned long[]){0, ## __VA_ARGS__}) / sizeof(unsigned long) - 1)
> +#define __sbi_concat_expanded(a, b) a ## b

... and CONCATENATE()

> +#define __sbi_concat(n) __sbi_concat_expanded(sbi_ecall, n)
> +
> +/* sbi_ecall selects the appropriate sbi_ecall1 to sbi_ecall8 */
> +#define sbi_ecall(...)  \
> +	({ \
> +		static_assert(__sbi_count_args2(__VA_ARGS__) <= 8); \

Why does this need to use __sbi_count_args2() ?

> +		__sbi_concat(__sbi_count_args(__VA_ARGS__)) \
> +				(__VA_ARGS__); \
> +	})
> +
>  #ifdef CONFIG_RISCV_SBI_V01
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> -- 
> 2.49.0
> 
