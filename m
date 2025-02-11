Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3147C1E5B7B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269010; cv=none; b=h2Q0uWZqNckL5zKkMq0XVrc3GHIVeYYlykSJmzqSajJfItguE+7u/aiBQKdBPdjVt0mDTPefLxwvEytAyKyJQ/pFxeoKxSRg2did22zg96ztS4ezq4smPALY0ZCJMd63b4NQb+dr99j7sKHjD4eDSUGTpVFKf6bFFUhY9UUkjlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269010; c=relaxed/simple;
	bh=cJ/GORcIqWt0nlHx5g6cmifZnHNhKYJlIHw+PIuhUVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYIXmur6lSfqfBQHqoXPeBPqPGZjDZ7K1NcC911LQ7WjLvkBJT3T2012ynHMlNZWhIHJIkNokgonkhR4zGaAHdayOAxJqaLv0GXo0l7phxGA1ukL8G/gM5y8OErUI2DRtBU3Ts3873+uEkt6/UCv5Z9xCJaHHpANO8I82PmQunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Q62/+kWo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Q62/+kWo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso30646565e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739269006; x=1739873806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hr+txc8S3MhukU4OHB0qTW/XNv1EfGTILRmXGQLaiSY=;
        b=Q62/+kWoPHKMyrjWvUjVl2PPJFppRy3eCJk0eP+KETJlUvtX3UgIbv8XXrl5LN+r6n
         yI8qaI6Tvjv7XRW0IjQTsbwBiz1QZvB6JmtbPqlv2tRsjOGlw69cvatUl8tEpTtrQzFN
         LshhFZVWKvXTlTf+9/3zAtrbZo9R5XQSIt3ykSSFt6XxlHjS1CWcjD0gl6qWGsP/rjI8
         m4qTx80Oux4CJeYTxAEVgJbbbohZfaUt7vBPOKUh6Rsrf6qLuCOjs74iQTpPPdV6PV1f
         cchxFTfXSAUPIgs3NiqUYoH/XfW5aG9zapzaCf73InwCKflhMsPgi0kZuE/tmSOuaeHh
         TdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269006; x=1739873806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hr+txc8S3MhukU4OHB0qTW/XNv1EfGTILRmXGQLaiSY=;
        b=tHuKsWFDsMl+ecE524KZ4hXazs7Rzq/93vgmiizClBm8JcsMS0hE24whZkrwTGumGt
         yIJ4AQ9Br5Jd5bDw+o7wIHzRQXbp64cJmBRUqALieFvTW9HFrGx1Nq4vNR4Dag5VeIsy
         kDqFkaraPofezlj+G8K24jl4NPr8X/LwbbFeUMgq0LebgFyJsSVxDUJSqIyGEmpzBKUC
         jbPiCXgXIo2t995x85D/8uDk5RHrSfOm1zFLtwmphj8Jw1O6AB/DfTnmYSxhxQ73n4ar
         XMAfTyeP7LZU7n4gy7wXd9fqb/ZqgHsO4xEKATDe4+lkO3H0MI4Jp7FSuZcOMIBikf3l
         bCbw==
X-Forwarded-Encrypted: i=1; AJvYcCVI/E6QJnFs55Z1nzaBNyuhmskd/6Ho5uqk6Xlgj24QPi8P5zH6Lqa4/ohPA3jircJH8kDpvOAYh+Dv9TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQaS0RZq4EludmbiXsTUW3RsfYYpSzt01k3jq0EltpKNolJM7
	7uxN6onda23v+d8Mhu3MJlQ01FVArkmT9G/XkI1K8dNTTHG0fRH/iqj+jimGue0=
X-Gm-Gg: ASbGnctKE2qn7D4a7Zls4GMoz0x7CR9bGmjlCZcQWpR/5GYItvkCWQJT0R2XP+4SG4+
	sf8vDcbwyHls621wrKfg9u3QAHc9qu+gMoJbONf+gQzTYH+a80E0s6V2kY3ite7cIxn9xV6ugM6
	2D2jAudl2rW7AV93266SC30qKDgqEFHcjj32/nGh3IZyAN/aFMlTc6dLaax7vEoxCeQrSx0pFgh
	uTMlezr0HQxRY9tNCZSN080p8faIASCFhp4A+4ybk3qzdp7Og0WVsASJemuE+Ql7LlxQWjPCYTj
	PicYeKyIvL4B1eJLjRE3mKToEZK7lL6V3Xzxe2DxOzwoyZ7aQ4dc/fMqDp4p
X-Google-Smtp-Source: AGHT+IGe51XhBA8uvfOTpS5Ph4IB3kPeaqWEJ9W+ri8AzVo+M6m3GEUiQubnnboCCLNrcCU4WSijCg==
X-Received: by 2002:a05:600c:4588:b0:439:55fc:81ad with SMTP id 5b1f17b1804b1-43955fc8df7mr5867695e9.7.1739269006486;
        Tue, 11 Feb 2025 02:16:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca0179sm170069325e9.11.2025.02.11.02.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:16:45 -0800 (PST)
Message-ID: <579dbdce-e61e-48ed-8685-a2cda9d753c3@rivosinc.com>
Date: Tue, 11 Feb 2025 11:16:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] RISC-V: add vector extension validation checks
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-defensive-lent-04936dac6bdd@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-defensive-lent-04936dac6bdd@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/02/2025 17:05, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Using Clement's new validation callbacks, support checking that
> dependencies have been satisfied for the vector extensions. From the
> kernel's perfective, it's not required to differentiate between the
> conditions for all the various vector subsets - it's the firmware's job
> to not report impossible combinations. Instead, the kernel only has to
> check that the correct config options are enabled and to enforce its
> requirement of the d extension being present for FPU support.
> 
> Since vector will now be disabled proactively, there's no need to clear
> the bit in elf_hwcap in riscv_fill_hwcap() any longer.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/cpufeature.h |  3 ++
>  arch/riscv/kernel/cpufeature.c      | 57 +++++++++++++++++++----------
>  2 files changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 569140d6e639..5d9427ccbc7a 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -56,6 +56,9 @@ void __init riscv_user_isa_enable(void);
>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
>  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
>  			    ARRAY_SIZE(_bundled_exts), NULL)
> +#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validate) \
> +	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> +			    ARRAY_SIZE(_bundled_exts), _validate)
>  
>  /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
>  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c6ba750536c3..40a24b08d905 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -109,6 +109,35 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
>  	return 0;
>  }
>  
> +static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *data,
> +				       const unsigned long *isa_bitmap)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data,
> +					   const unsigned long *isa_bitmap)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> +		return -EINVAL;
> +
> +	if (!IS_ENABLED(CONFIG_FPU))
> +		return -EINVAL;
> +
> +	/*
> +	 * The kernel doesn't support systems that don't implement both of
> +	 * F and D, so if any of the vector extensions that do floating point
> +	 * are to be usable, both floating point extensions need to be usable.
> +	 */
> +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> +		return -EINVAL;
> +
> +	return 0;
> +}

I think this should also be modified to be like this:

  if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
	  return 0;

  return -EPROBEDEFER;

That won't actually change the way it works since RISCV_ISA_EXT_d (and
all single letter extensions) is always probed before the others though.

Clément

> +
>  static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
>  				 const unsigned long *isa_bitmap)
>  {
> @@ -326,12 +355,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> -	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> -	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts,
> -					  riscv_ext_zicbom_validate),
> -	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
> -					  riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
>  	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
> @@ -372,11 +399,11 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>  	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
>  	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> -	__RISCV_ISA_EXT_SUPERSET(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts),
> -	__RISCV_ISA_EXT_DATA(zve32x, RISCV_ISA_EXT_ZVE32X),
> -	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
> -	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
> -	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts, riscv_ext_vector_float_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zve32x, RISCV_ISA_EXT_ZVE32X, riscv_ext_vector_x_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts, riscv_ext_vector_float_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts, riscv_ext_vector_float_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
>  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
>  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
>  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> @@ -960,16 +987,6 @@ void __init riscv_fill_hwcap(void)
>  		riscv_v_setup_vsize();
>  	}
>  
> -	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> -		/*
> -		 * ISA string in device tree might have 'v' flag, but
> -		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> -		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
> -		 */
> -		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> -			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> -	}
> -
>  	memset(print_str, 0, sizeof(print_str));
>  	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>  		if (riscv_isa[0] & BIT_MASK(i))

