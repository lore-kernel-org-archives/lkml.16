Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFB186E54
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674003; cv=none; b=k2bAaZZHInyzkaAjq4hVuemVkqtkA0XX1TEK+3ZJ48Ds66ifXC3sEMWla8v9T4WjSCrs/glzQLofXMzSG5qINtEXIWTOJWFRAuiGmakWgENO4rfZhv2tRunwYH7ilDMMVtyyFRf/u6MXcKgPTVzytcxPxgR/2ymDjNJZMxh3CSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674003; c=relaxed/simple;
	bh=iYxsr6DpSc77rUfj9oGlSZHd/Uv7faBTvcN7MGu1BVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2CVKLrTnL1+OQftOi4MmVFD5Inh5AIHPb5oZM2xRwOuyo9YxCq5dqgPHPmWYA309s01TnGP7SLXjk2eQgAWl0EEWV0jy0mAzICoVcb2FOvrJ7QHRyzxNGC1K7IkLj1hSjsqaZNkV7Ym9mkhymTaj68fpipovLGNW3ZLWCQDe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zbqVPC0H; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zbqVPC0H"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc1f6so578371f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743673999; x=1744278799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zgc8O9PHN7ofrUX2Uaw/x+1FDBIuy7ZJz69b2VTDG1s=;
        b=zbqVPC0HNHNpY0PovPwDBDyV6hAwzi00+X9gL7YHVvLl75cUMNrViGE4wWtLujxak8
         AP2NfpZ55kC3CZDjr1Mugz1bneL+qcuFfJpz6lKXWcv4zJZkHwDQ89MiJAoXkB66Fhj0
         TH3OD2oSG0vGh7e9+P+5U2Be3qlbdv4yxBIaXd/bM4I2t/Lkq7h/D431SqBeI3brd7MA
         al8FK2GGUmuuXeuFvk8ph10l1xRrRKXiR1xYbo7qnCS9osPHopGCwzzhx96NQqwxpiBQ
         UqP1hQZjV5SsafVI4GyuEVr0BI3q78hqAxDJD6htPZG9txbQ5xMAH/AwHrThcYwZ14Mq
         1Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673999; x=1744278799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgc8O9PHN7ofrUX2Uaw/x+1FDBIuy7ZJz69b2VTDG1s=;
        b=Azfwi1dtm2G37000BT/iq1ufIK294cIV8n7f48cFxFAG/UpP3VYKNjDL9t02DSi96Y
         egGsHOS4tS5jL5rpCgaWKkomfe3aZuziy8KBlQka/1MHkp2YYSHnDgxLWMc8drBMowiD
         nQSa8E7i2uJNBni2d6d1bCcWtIJOKLIDBNmupdzWpSeRLlIcY+7mypnDBo/s+D7mW44b
         dfzaLktomdedsW9Bwy4DzQdV4sdsLS/DIyYWA95dr/P4mzg4v6Co3DXk/CY4oe+Xkjpy
         rJX8+FXa+XaMvcqOT/gfDTLxllkWR+8sXSUnT5htprlQJRLLGV6p4k936rFwKsviUfaU
         rxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVzzUiXcxAjtrCe1PbXA1IPdl9UOlz5mw668qx0R4Mlj75c0EGiJLiyDoQwGb5x+B9LWApBfZrAKkyI/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykk9SeXDZBiOYN/crMrdJiMmWscALmg0QcPEL7e3GgP8P99gC/
	zmnSzErxv0Ws3wabYjLM2+b9g1PAWLAg9Ag4P1yLuQ/Ezbb/u4BuB9K1QhWdAYQ=
X-Gm-Gg: ASbGncvUHiF0zHkiAbkyFa7aioFqbGYUnt5yqYhbwL+K6RUQQWbeLGOMqqXgbkyTmUI
	NecOxWIVrtitRnK+ILiaaNAmFrnMhrfnZ4uoaHjquwgGqrHsBh8zZNnIoBCEu52NdNljBpyyiOk
	B5TNR4/Sm95ft8Ev7ivFXrm8ppjH5ZGV5ea/sBltlqAVPYbYEyCJ8Vg21c2MepixW00D6H0KoIE
	UOLEgY7lU3ZFWU5VeBRUtKexG9kpb9eYBhYFmpsYHU+9uCnJlZB4xuq3WFhKkcLWWY+2W46CR8g
	1SGUrT3sm3DDD56UnmofGY6cTPP+QnINpl4yzBTsCmWfQ8OeWanQKw==
X-Google-Smtp-Source: AGHT+IFe7XIclM8+dBjWbfETadNP5kS4PWS+lDpQHA4kCXg9GvgjwYtOIIk3fBz5Pb77tsw0QeE4Yw==
X-Received: by 2002:a05:6000:23c7:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39c1211b77amr10484270f8f.52.1743673999216;
        Thu, 03 Apr 2025 02:53:19 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6c8sm1305623f8f.73.2025.04.03.02.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:53:18 -0700 (PDT)
Message-ID: <f0e1ea2a-e775-405c-8342-dea1b6d05879@linaro.org>
Date: Thu, 3 Apr 2025 10:53:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] mtd: spinand: Use more specific naming for the
 (dual output) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-8-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-8-7846bd88fe83@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/3/25 10:19 AM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really mean by describing the expected bus
> topology in the (dual output) read from cache macro names.
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

ah, my bad, I forgot I already gave R-b. maybe drop the acked-by when
applying.

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/alliancememory.c | 2 +-
>  drivers/mtd/nand/spi/esmt.c           | 2 +-
>  drivers/mtd/nand/spi/foresee.c        | 2 +-
>  drivers/mtd/nand/spi/gigadevice.c     | 8 ++++----
>  drivers/mtd/nand/spi/macronix.c       | 2 +-
>  drivers/mtd/nand/spi/micron.c         | 4 ++--
>  drivers/mtd/nand/spi/paragon.c        | 2 +-
>  drivers/mtd/nand/spi/skyhigh.c        | 2 +-
>  drivers/mtd/nand/spi/toshiba.c        | 2 +-
>  drivers/mtd/nand/spi/winbond.c        | 6 +++---
>  drivers/mtd/nand/spi/xtx.c            | 2 +-
>  include/linux/mtd/spinand.h           | 6 +++---
>  12 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
> index 723c740308d26e901fd3d9a402ddd48e8e69060f..9709774dcf30be370c999f7ab445c1e684ef2210 100644
> --- a/drivers/mtd/nand/spi/alliancememory.c
> +++ b/drivers/mtd/nand/spi/alliancememory.c
> @@ -20,7 +20,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
> index aad751f95269b3f501aff01753c4bf0ff9484fbe..41fb4173af34429265c8db60851747e147c5a36c 100644
> --- a/drivers/mtd/nand/spi/esmt.c
> +++ b/drivers/mtd/nand/spi/esmt.c
> @@ -14,7 +14,7 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
> index 8a9725ea29bac5901d67304db95ed5573bd7fa40..729dfde4292108fe588b317dbe8731b4f6535246 100644
> --- a/drivers/mtd/nand/spi/foresee.c
> +++ b/drivers/mtd/nand/spi/foresee.c
> @@ -13,7 +13,7 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index 76856f1de8fefc6404345e363b2c873cc3c02e52..d357f914765b294ec4288276cd826555bb50f735 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -27,7 +27,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> @@ -35,7 +35,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants_f,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_3A_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(0, 0, NULL, 0));
>  
> @@ -43,7 +43,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> @@ -51,7 +51,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
> index 59bd476a29f03967a3f5a814872f9a6039b0a585..4d7820e8952871df2ccd9b17610fa403d347574f 100644
> --- a/drivers/mtd/nand/spi/macronix.c
> +++ b/drivers/mtd/nand/spi/macronix.c
> @@ -27,7 +27,7 @@ struct macronix_priv {
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index d7dbd22db1a3f8457c8947f4044dd8442dc475cb..8d06091cef05365f58fa3f593f2c8de9413af099 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -32,7 +32,7 @@ static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> @@ -47,7 +47,7 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
>  /* Micron  MT29F2G01AAAED Device */
>  static SPINAND_OP_VARIANTS(x4_read_cache_variants,
>  			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
> index ae3527d6d5fa358be482eb8cf0ba4e1e2304e441..b4daee6c9b2f4782bbb2ed3400c71406e34f0fdd 100644
> --- a/drivers/mtd/nand/spi/paragon.c
> +++ b/drivers/mtd/nand/spi/paragon.c
> @@ -25,7 +25,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
> index ffbedb8d92f659967f6aa0c80d5b0aa7d088929c..e03343f0c404ad62d0567ef83045e4db7a675c46 100644
> --- a/drivers/mtd/nand/spi/skyhigh.c
> +++ b/drivers/mtd/nand/spi/skyhigh.c
> @@ -20,7 +20,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index bc5adadf6084f48ff482d6846be1c6d2e9157e85..a497de9241b65f9fa6e8ae43f629b4a35977d375 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -16,7 +16,7 @@
>  
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 8379a1d12dd563e573c6d37cf099759088176da4..66f272ed734a8f95d974153005a8fea637bef0d2 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -29,9 +29,9 @@ static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_DTR_OP(0, 4, NULL, 0, 80 * HZ_PER_MHZ),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_2D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
> @@ -40,7 +40,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
> index a0003f52ae8f52ab00374fedc457476136a78568..08dc4a3efbb0238b21eaedcd2b76d4ed7b4b0294 100644
> --- a/drivers/mtd/nand/spi/xtx.c
> +++ b/drivers/mtd/nand/spi/xtx.c
> @@ -26,7 +26,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> -		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
>  		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
>  
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 868d983b4544d88965f9bd52830e39e8c8c34346..a3387beb51e958ef366310a462782137b6122931 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -94,19 +94,19 @@
>  		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),			\
>  		   SPI_MEM_OP_MAX_FREQ(freq))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
> +#define SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>  		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(addr, ndummy, buf, len)	\
> +#define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_2S_OP(addr, ndummy, buf, len) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>  		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>  		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>  		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>  
> -#define SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(addr, ndummy, buf, len, freq) \
> +#define SPINAND_PAGE_READ_FROM_CACHE_1S_1D_2D_OP(addr, ndummy, buf, len, freq) \
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3d, 1),				\
>  		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
>  		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\
> 

