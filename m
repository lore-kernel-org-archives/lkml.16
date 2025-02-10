Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF7252910
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198345; cv=none; b=p1L1loYRjj8ithrlYVDp8HZbt3GcTKtK+eLlaiYboX3VjxHyyZVRroSqo/+0LT9c6saUPZ4120xVLLrD98aturK8Y++lA54mq+xeWcxaG98mjXvI2UUeQZ+MSuTEf5sA4ccIhhPy4FU37PNKUYueBUC5j1LvWQo9w+jbU+DhCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198345; c=relaxed/simple;
	bh=LLZv8spMczu++PFSJ3yUBhOJ9eSME+MogTlX8kOq+/I=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=HL5eS3fvHtvlkCLVbngh5rXwaGAwdjv0ieeBmabn8rReZuq3iMPUHT+NRiDnLb0huSpJkhkRwffp+BGYhQ2ix61N58G4ZBOv2ZOECNyBQU8xrLhh1CKKRDr3F6h2SkEEGQP3EvYSvn5xh90wZYbgbYeEJKUQSfEdScyvkgaS5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q9SBBPWm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q9SBBPWm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so8039665e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739198341; x=1739803141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zo0VN4ey+NCxOpRRNUPLhuYri5JxBmbs9To1sFVTXQI=;
        b=q9SBBPWmLmywLTglIF0FlOH9SU6aUbhslPY3lnGCOkHVIkbYbekI84lz1MsKVcNt9G
         fenSxMkTOwov+JfqDIyBdyo5QJJdidEFMk6q7n1JJree8eV4PLvYfAFRFlJC+7QkvW4R
         ffr/1a/rYXw8jLf5QSwSmXayjIAFqBjfQrW6qOgQ3ElIO6frZS9QgkSLg1wiaYx5B+kR
         9p7xNzuhBBE5JxSq38QKanS6Jk2NoJ/xtjb9kyTJ0K28HHsyEG0feiaFw0CyAuIDUNBW
         BeGh0A1QaDGKa7Y7ESKvR+TVQuWY87tLyXLJrFLf9Pt6E3llb0Z+DC/JeoVKG9L6l4iY
         JI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739198341; x=1739803141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo0VN4ey+NCxOpRRNUPLhuYri5JxBmbs9To1sFVTXQI=;
        b=nTwI7kKmJjIV813QlwxIS682b514B8nfdCOsUC7DfSWwo9fxPx2SQYXi8wj9Kahilz
         ALvn0bat65a6Qz03vz3MUFucGF+ByxUFGAAClz8j3wB3kl3mTOUjMiUZeFCHWJVTl6La
         BNC6qiJnh9VBnPcu210yHfrdpQo/6TJKC5RZROpM9nNShQqSLiB56nub3y/EJnVEXomD
         30BN2DPdG/v7fbaj2KjppMrRzELf2ACCgWxDf8+ZUxTfTcMMXW2RJsJ0hYL663xUJg5d
         e/loRJAEmoLZDeD9J0FfamYFF3IfTTU07hnc6SgDvyUgczz+4p4soN2N1OwnCiXYWWSY
         TJNg==
X-Forwarded-Encrypted: i=1; AJvYcCVrJa9LaeplRLDUF+yEuoB7e/PHO1jrwng7e57Vtmj+9SmoELchq2CWJEurjLaMerFEc5tz26ftpzu2Gl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9HDntCDhoRlLPv7xl/xkfpTYSW9puAdhNQyEIe2kwOOWDEIrS
	tuH8/jZ5LnVCRrQQRDjo+L4Sx629G8Eh/MyyzuzCypoZHZauG3VcPYzd0OaTv+s=
X-Gm-Gg: ASbGncvqOslov/hyICs1yq7By5/W/AL8/suI7L2Jij+n35gSqUjg6DrIrW+vQD5KM1o
	bPVIhtr12IZ++mk7pO3UourrA7bK9WwekOrL9eE7ajIE9mCshPO5uuB+1TZCbZVTQ9XAUWaHHtp
	rb1R39dJgHIUeQyP8HKXaZxMK8O+Cwj+WFm8nbI0/bSRUpz++VUJ1VCoa6G/n026uqvMcMRA6Na
	KmOrjBJCBDB1xwwPCg4kFjP7g4Gd2mm8WkSNwxGWkThoz72Tu0zzJo+s52jER2sxUixDC7vc/lK
	8SpG+MST51Cf7M2ffLydO9qbOlmZQ4RpwzPeDqCLeqOfbikrX4qfcAyXY/PZ
X-Google-Smtp-Source: AGHT+IGm5AlxQcuKzP0PEYl2wRs1l7PkvTwrGGHXffc7rJgV/RWXIbNwUCK7tjW///sMOC1+p0rrnA==
X-Received: by 2002:a05:600c:56d0:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-4392dfbd5d8mr83693895e9.13.1739198340511;
        Mon, 10 Feb 2025 06:39:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm45103195e9.23.2025.02.10.06.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:39:00 -0800 (PST)
Message-ID: <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
Date: Mon, 10 Feb 2025 15:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Jesse Taube <jesse@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241206055829.1059293-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/12/2024 06:58, Inochi Amaoto wrote:
> Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> the riscv-isa-manual.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 3 +++
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 869da082252a..14cc29f2a723 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -100,6 +100,9 @@
>  #define RISCV_ISA_EXT_ZICCRSE		91
>  #define RISCV_ISA_EXT_SVADE		92
>  #define RISCV_ISA_EXT_SVADU		93
> +#define RISCV_ISA_EXT_ZFBFMIN		94
> +#define RISCV_ISA_EXT_ZVFBFMIN		95
> +#define RISCV_ISA_EXT_ZVFBFWMA		96
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c0916ed318c2..5cfcab139568 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),

Hi Inochi,

You could add a validation callback to that extension:

static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
			       const unsigned long *isa_bitmap)
{
	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
		return 0;

	return -EPROBE_DEFER;
}

  ...
  __RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN,
riscv_ext_f_depends),


But I'm ok with the current state of that patch since I have the same
thing coming for other extensions as well. So with or without my
previous comment fixed:

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément

>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
>  	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> @@ -373,6 +374,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
>  	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
>  	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
> +	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
> +	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
>  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
>  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
>  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),

