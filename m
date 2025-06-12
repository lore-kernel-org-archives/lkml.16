Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D71514E4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742534; cv=none; b=LBC3GdDbe5moTHGBVPIuEV7+kWLcBrXW1IkkcrHJwGJBYvThZAo4F0i0oXQVlaoakNZ9kVx78fwfl+4RN92BcHu9R2zpzRI2omC+At6mNbLG0SJgA6Oihp3CYiz6SfkgzoECMHoMT7yPBTPGUEyq9DGvBxb+ElijHueNnVKKl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742534; c=relaxed/simple;
	bh=Rc5fG7+Xp6hbW4uWdUeGdJKwurt/89UdOjOA4u3MW5Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MO0oNaKudR97+qwrWu952MVHMz/RvyXdiRRgGxLiFZBMim3jjLvDxekl3j0HykFq5o0RIf3mAlcUNsiV9V3FP+SYGXeQFjwKCRKMVI30ZlxbWutuf2E8Ku534kEhjMLKmVXaOatLR2alV21VFMDUNogIO3LWOlkXNTm0xAvOFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nVqssfEK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nVqssfEK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f7865b22so209864f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749742531; x=1750347331; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrKb3e7CakgdaivAHMe1lTLQEl14asIVWTpRE1pFTi4=;
        b=nVqssfEKDkiBUdT3qjy6SKheT75ywbnjcn3lnXwN/QWT/FfM729E2hZXDftZVLqI7W
         +OIbNzUnY/W5BiJx3qiYCueGiN3ZR+7e2em/TiNxCdSh8K26aP83JXbQ+5gjepWwiCoZ
         9F7RLhMkVS4davJszeBybrlZ7NqZGCuKPWmKDGzooePgPwgb+8J+crLN9EOCFk0n8BjU
         AvUknF8ytlCvD/IoXBCRDtpo2gZz+0/3ENeJlmFml2Pr+fAaVPXgx8dGgMnHYLGUkV8h
         xGw9HsYBKzMSM2xIUY6RF+kuVlR2OjiNxUD3WUKfyhtSFLFujJyRC1QlFNXOu6HwY/6E
         M9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742531; x=1750347331;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrKb3e7CakgdaivAHMe1lTLQEl14asIVWTpRE1pFTi4=;
        b=qh7jXrrQpe7I8mhwAUu9w+2lqLUu3C55a8T+S0OBzNfbMVZmJ23pW99Bj5e7dDBdy4
         sz2HEwlGeI7a5hrwkX1XWJzTHCDd0wpSusA9tdE2Ek7zBeknlSysETgW0PM8c4/Xxe9M
         8cj9Ao8ccorV2bycEpecpoS4FkjdOKrgjmdoZwRXD/1AcuTjPtpoTaYAUG+2siLrGo4T
         YQdjqEG+sX0PpR5HnXgah7VXXpcGhLAfXs2qRMGEO5MUz1WrZWYS/gMp/ZpXyG5FzWV4
         b3of461/QkjDHICPChfI8XAUavlyKVgPjh0rv53wiBdzfpVm0JIoKlk6YgPHTsXmXTNd
         axWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSrtGs8ydvsIPBxoQQehRvmFcNptN9X/d8ooVla87MlA6wzRIO5nu6c68sgREizwFfgN0izNAbq4xw3+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7nuN7BnuNefHuN+RGEPAEPPr3M20yalFOWdwV/rPZ8nroUXGQ
	gxvWWhbCPU1m9Gz8a/r5V2t8rgClZSRp7f9JU8mMUdT6FuJ7AFtOPVbnEtmvHfSNTAU=
X-Gm-Gg: ASbGnct8yCihYOkLefLqnTSQNO3PaYWrjEiBPIGpNYepsPOwGxcl8NnoHZGzWzHFpJQ
	BAsL9RAUbv5J0kh8knfPxwCPrj/iUh46vQkA8HTC6251ZTIoaaDSKWifeO4GNsGbk1ggFi30+Lo
	GA4eOdRJWEmXHKvXexSkUfdSEers11EmQQzme+NvR5teyFQ9dAu1qoKQb/1lmXF99bNERfJEehj
	uuhq0guDMujup/pmqH39QvOq+yjxDgVDAT9pP3JVY0VXMGRdg3s7Q5H+gkqHo/NI3i4woPSXdKs
	ZSZeMAE05NGAS0gBPAg8LfzFfylZUvHhCtFqVVjl9ihd/eMbW5prfKFedzDe2oacXh9MCw==
X-Google-Smtp-Source: AGHT+IHm6QkUD94TIyh0e2e6tfOgOPCxLc5UKodukZsY3vLNflsEcumr4/7GtmIshD+ErYhzJYlL+A==
X-Received: by 2002:a5d:64c8:0:b0:3a5:324a:a04e with SMTP id ffacd0b85a97d-3a55864fb75mr2538631f8f.0.1749742530967;
        Thu, 12 Jun 2025 08:35:30 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e05f:7af3:1bf9:f101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976894sm2347199f8f.12.2025.06.12.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 17:35:30 +0200
Message-Id: <DAKNYLI1ZWNU.2RGRA0ONMCIYL@ventanamicro.com>
Subject: Re: [PATCH 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
 <20250612170632-59116c0a-6b38-4cd9-8df1-b193251d598c@linutronix.de>
In-Reply-To: <20250612170632-59116c0a-6b38-4cd9-8df1-b193251d598c@linutronix.de>

2025-06-12T17:14:09+02:00, Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutro=
nix.de>:
> On Thu, Jun 12, 2025 at 04:57:54PM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 wro=
te:
>> Counting the arguments to sbi_ecall() and padding with zeros gets old
>> pretty quick.  It's also harder to distinguish a tailing 0 argument and
>> the padding.  The patch changes sbi_ecall() to accept anything between 1
>> and 8 integer arguments.
>>=20
>> Those who can count are also given sbi_ecall1() to sbi_ecall8(), which
>> the variadic magic uses under the hood.  The error messages upon a
>> programmer error are a bit hairy, as expected of macros, and the
>> static_assert is there to improve them a bit.
>>=20
>> The final goal would be avoid clobbering registers that are not used in
>> the ecall, but we first have to fix the code generation around
>> tracepoints if sbi_ecall is expected to be used in paths where
>> performance is critical.
>>=20
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
>> ---
>>  arch/riscv/include/asm/sbi.h | 34 +++++++++++++++++++++++++++++++++-
>>  1 file changed, 33 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 341e74238aa0..c62db61bd018 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/types.h>
>>  #include <linux/cpumask.h>
>>  #include <linux/jump_label.h>
>> +#include <linux/build_bug.h>
>> =20
>>  #ifdef CONFIG_RISCV_SBI
>>  enum sbi_ext_id {
>> @@ -465,9 +466,40 @@ struct sbiret __sbi_ecall(unsigned long arg0, unsig=
ned long arg1,
>>  			  unsigned long arg2, unsigned long arg3,
>>  			  unsigned long arg4, unsigned long arg5,
>>  			  int fid, int ext);
>> -#define sbi_ecall(e, f, a0, a1, a2, a3, a4, a5)	\
>> +
>> +#define sbi_ecall1(e) \
>> +		__sbi_ecall(0, 0, 0, 0, 0, 0, 0, e)
>> +#define sbi_ecall2(e, f) \
>> +		__sbi_ecall(0, 0, 0, 0, 0, 0, f, e)
>> +#define sbi_ecall3(e, f, a0) \
>> +		__sbi_ecall(a0, 0, 0, 0, 0, 0, f, e)
>> +#define sbi_ecall4(e, f, a0, a1) \
>> +		__sbi_ecall(a0, a1, 0, 0, 0, 0, f, e)
>> +#define sbi_ecall5(e, f, a0, a1, a2) \
>> +		__sbi_ecall(a0, a1, a2, 0, 0, 0, f, e)
>> +#define sbi_ecall6(e, f, a0, a1, a2, a3) \
>> +		__sbi_ecall(a0, a1, a2, a3, 0, 0, f, e)
>> +#define sbi_ecall7(e, f, a0, a1, a2, a3, a4) \
>> +		__sbi_ecall(a0, a1, a2, a3, a4, 0, f, e)
>> +#define sbi_ecall8(e, f, a0, a1, a2, a3, a4, a5) \
>>  		__sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
>> =20
>> +#define __sbi_count_args_magic(_, a, b, c, d, e, f, g, h, N, ...) N
>> +#define __sbi_count_args(...) \
>> +	__sbi_count_args_magic(_, ## __VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1, 0)
>
> This looks a lot like COUNT_ARGS() from include/linux/args.h.
>
>> +#define __sbi_count_args2(...) \
>> +	(sizeof((unsigned long[]){0, ## __VA_ARGS__}) / sizeof(unsigned long) =
- 1)
>> +#define __sbi_concat_expanded(a, b) a ## b
>
> ... and CONCATENATE()

Thanks for pointing them out, I will use them in v2.

>> +#define __sbi_concat(n) __sbi_concat_expanded(sbi_ecall, n)
>> +
>> +/* sbi_ecall selects the appropriate sbi_ecall1 to sbi_ecall8 */
>> +#define sbi_ecall(...)  \
>> +	({ \
>> +		static_assert(__sbi_count_args2(__VA_ARGS__) <=3D 8); \
>
> Why does this need to use __sbi_count_args2() ?

When you go over the hardcoded maximum count in COUNT_ARGS, the macro
stops counting and returns the arguments instead.
The array approach in __sbi_count_args2() counts any number of
arguments, so it gives a much more understandable error.

I guess using COUNT_ARGS() and condemning programmers that overshoot the
15 counted arguments is better.  We don't really need a static_assert
then either, and v2 coud be just:

#define sbi_ecall(...) \
	CONCATENATE(sbi_ecall, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__);
