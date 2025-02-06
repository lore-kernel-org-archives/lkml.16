Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506D214210
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837240; cv=none; b=CzgmQQyfB+c6uGIdCS9KYF0Rlofmk1WsEAhdgzf4h+YDq4h1WwiEdUEhJvA9fK9Q2nfdFm1oy1oYu56CEFVwCd5hnxanB3Rn3hiH6MMoJXKFEgs6CH97zwb76pQs6AYLU9yhgfwPl7DxO/EAsZTenK/YarZj/7H0j2CLvVtTp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837240; c=relaxed/simple;
	bh=DHDNQ38VGunviutybUTG4AXV3T+KGBHmXKCRbokHlCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZfPTG8B6jj7DAzL8ZRmbmE4OKwJmECH7/X9Yr2QmdoboZKWTX5CepQsWSvGHF7mWfkH6DgdO97DrxlC32If57i20TySX7ihkTUtqfJSX0HYV5eptfmeULCFH3wWrmOVw27bjMWik5D+PDyTIM9bxzWVdWGkiyfFdIYC1nRz0Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EG9VlXBH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EG9VlXBH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43622267b2eso7176075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738837237; x=1739442037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYWLPuUcEyViHEWZl2OLoqFTH+F1AYzNF316tnzUCUk=;
        b=EG9VlXBHngH+nJul2ca+dj3mOS0pksL45mUmyN0skqDRBMtz3yDzTFoqe3FPZALj0h
         Hb+J+s9GJt6JcQgIuKpLZBMO/4YfbhoB1aLur4U9B3iJh0hwzLWuxth5ogqS4HtrbzgV
         vSkXHn4lLjPFyTtSwrInTpPtSIMwloTJ0T5rqFhnsiahefw1N8ELFi53zgd98iHE0wsY
         Wm6LN+6r4uVpCju/2aMCqq5l93f7S68n2c5FHdbplYU2UWieAY0nop7IppJ8kvR4sEyg
         mZLwiwn7LRjJWc18B7xl+mJHtEsdVeh02kUjkAyCPS67zuoVxLY53YzbqLrJcyy9hlay
         1rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738837237; x=1739442037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYWLPuUcEyViHEWZl2OLoqFTH+F1AYzNF316tnzUCUk=;
        b=GJsTlO0p8eUEHIll0Io3uyd41Af1VFlkv3h0hASLAhwRDCLGFPJb1d146qd9bWjB+E
         MZNUywScwO0vOJQAZpePGb+jGzsRYxMXrk6WFgGOJ4ZzUb0MAlLX2vUtzJT1g1acjGNd
         Qkp0b6k8p367LBzHGG5x7KVYUKPF86GRLPHJUUKwq61VCw4LpMLMB90eRPVkeXNS/kSc
         IgU75CrDl/Y2Y2N0esgmcGd9cxN3P/MZ7k4W/hYnb1X6WqApooOJD8qExNIorJzjBQkY
         akvLjczKZxXNxmsjbf47qVEK6xoSsLCTZc0DBO3kJ8gxStmZ0GgYFio9zQIZ41nYky03
         RB0w==
X-Forwarded-Encrypted: i=1; AJvYcCUsSdqoOIz0H5uZYE36x9hfXr3qEbhV6SfK0sH/h11WZ0y51IWwHBnzG5ouDb9jVDZUif02t3AEhx0wed0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlyKkh/RNQmcIGO+z6w5XIaa33CHNevvTDEoy9SkV5NY31Pn8
	O6X1IJCOK6UFFYxvonc/HtaFS373ykg4ZpdEcNUpsj/3TQFwHjjkOGhQUVr1rJA=
X-Gm-Gg: ASbGnctA2CU8vXtkpYMy74fT6WTPOfqOFQJUOzeVBpix3V3zEFsgUAbQjrRnWei3vwc
	R20r/Ey0nJ4RVgnIdXxFm+/Ma7BWGfc258KTvpomMBNknFJsQHGdvCzD24zSUFChwwpiXz38OxO
	ZvoJFWUrYEX6AbYFFZwAXSv9ST7eRfUC2o0LC0Q569WmfuM4m4IEbYpazH19gg4PsTpz73G9siR
	klpeXHW+iDvSOpaERj0lNnb0H75Xowt3pAP6yAInUlrPbLET4/YYnPzRo3qRI/wloU38HYPmS5X
	AKp9k6wzFPe4DMq5X5ErERCRZL9es8pOwjZ9B8xAjUrQar9OxYD0jAiNrR7x
X-Google-Smtp-Source: AGHT+IF0A9SWlvxFTUWL4jBUWF4gwatSi74EHA8t1XR+t+JGyhlXqcyw5059y36rJQzknajfZ7Xdyg==
X-Received: by 2002:a05:600c:458f:b0:434:f623:a004 with SMTP id 5b1f17b1804b1-4390d43ddaamr60637135e9.16.1738837236812;
        Thu, 06 Feb 2025 02:20:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc87desm14027315e9.25.2025.02.06.02.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:20:36 -0800 (PST)
Message-ID: <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>
Date: Thu, 6 Feb 2025 11:20:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-quench-entrench-09bed8c8c823@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/02/2025 17:05, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Using Clement's new validation callbacks, support checking that
> dependencies have been satisfied for the vector crpyto extensions.
> Currently riscv_isa_extension_available(<vector crypto>) will return
> true on systems that support the extensions but vector itself has been
> disabled by the kernel, adding validation callbacks will prevent such a
> scenario from occuring and make the behaviour of the extension detection
> functions more consistent with user expectations - it's not expected to
> have to check for vector AND the specific crypto extension.
> 
> The 1.0.0 Vector crypto spec states:
> 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> 	or application ("V") base Vector Extension. All of the other
> 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> 	application ("V") base Vector Extension.
> and this could be used as the basis for checking that the correct base
> for individual crypto extensions, but that's not really the kernel's job
> in my opinion and it is sufficient to leave that sort of precision to
> the dt-bindings. The kernel only needs to make sure that vector, in some
> form, is available.
> 
> Since vector will now be disabled proactively, there's no need to clear
> the bit in elf_hwcap in riscv_fill_hwcap() any longer.

Hey Conor,

To which part of the commit does this refer to ?

> 
> Link: https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 40a24b08d905..1c148ecea612 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -138,6 +138,23 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
>  	return 0;
>  }
>  
> +static int riscv_ext_vector_crypto_validate(const struct riscv_isa_ext_data *data,
> +					    const unsigned long *isa_bitmap)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> +		return -EINVAL;
> +
> +	/*
> +	 * It isn't the kernel's job to check that the binding is correct, so
> +	 * it should be enough to check that any of the vector extensions are
> +	 * enabled, which in-turn means that vector is usable in this kernel
> +	 */
> +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
>  				 const unsigned long *isa_bitmap)
>  {
> @@ -397,8 +414,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
>  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
> -	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
> -	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts, riscv_ext_vector_x_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts, riscv_ext_vector_float_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zve32x, RISCV_ISA_EXT_ZVE32X, riscv_ext_vector_x_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts, riscv_ext_vector_float_validate),
> @@ -406,20 +423,20 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
>  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
>  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
> -	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> -	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
> -	__RISCV_ISA_EXT_BUNDLE(zvkn, riscv_zvkn_bundled_exts),
> -	__RISCV_ISA_EXT_BUNDLE(zvknc, riscv_zvknc_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
> -	__RISCV_ISA_EXT_BUNDLE(zvkng, riscv_zvkng_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
> -	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
> -	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
> -	__RISCV_ISA_EXT_BUNDLE(zvksc, riscv_zvksc_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
> -	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
> -	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkn, riscv_zvkn_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvknc, riscv_zvknc_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkned, RISCV_ISA_EXT_ZVKNED, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkng, riscv_zvkng_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvknha, RISCV_ISA_EXT_ZVKNHA, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvks, riscv_zvks_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksc, riscv_zvksc_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvksed, RISCV_ISA_EXT_ZVKSED, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),

I'm not sure if I already made that comment, so here we go again.
Shouldn't Zvbb use riscv_ext_vector_crypto_validate() as well ?  The
spec states that Zvbb is a superset of Zvkb and Zvkb uses the
riscv_ext_vector_crypto_validate() validation callback. I guess Zvbc
should also use it based on your spec excerpt in the commmit log.

Thanks,

Clément

>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>  	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),

