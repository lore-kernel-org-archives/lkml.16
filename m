Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F1272E7C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651383; cv=none; b=KEpMoCd9LBDlY1GbY2HK0gj0VfTviuiHgOG53SPdKQSHPEgKZXL+2OxxjxwJKjo8HREeZBFhteTYuxdAAEm9OtlHqrBRWkCtoX0wfRUpHUu8UDtzYsGmLJ+ugXYaKJHyHGoJ/vkJaGQ5J5Y2yCsBSg+zp78qO8un+Z705cHLvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651383; c=relaxed/simple;
	bh=EXJnlVTnNud7vFOMtkEXkO8+20lQ+8pjSYNNNw59vac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bslM5pP7bNX9hie5fXsJz1ODnSUHviN3VOhrI0OEwwJGyr+fq9drFeIKezc/YrUOfVKg60YjLj0ESVMTCoNtBQ+8L5XSLplp9YDG94DMP9NHoR5wBsyxrvSzEJBTLjcSv7plJkDINsH7U92V/d9quw7/eijmVvYIplBV69U3Ma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1jXgRqFA; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1jXgRqFA"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0ad74483fso67255026d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749651380; x=1750256180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1AY2fjU0MUFNTnTPpkTJ6hjB0BWW24lbL76NZAT2+E=;
        b=1jXgRqFAe+/nZ4Zg6TWlr99Yb+V1RE7vNKLUJk6L6Xx7dQFf+BzShbtNVM1f/T9egF
         +w4eKiW3fvvx5EPeEJaeBL588iWvuxdfb/CCqSUa+ORHCeUGfYfC6Jzb3rh72qYObPJP
         U813kMieIRPnZTXhQCd6jjtnDRYaihwrFXJk9qUKKWOxLrykkyd2pXrAjB7KWPdIBLDM
         sZgbE8N1d+FNekoc/UESOekYx0vfHakaPTLKGffAZvrZNvkkpgW13EQJXBc1ID6cNnaJ
         cekWBjtyD64q4hcLU9vTUncR6ZaByPAEtpiqWJFUwzfKCxhTg/LNzgiedSXu7OgHonaQ
         Re9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651380; x=1750256180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1AY2fjU0MUFNTnTPpkTJ6hjB0BWW24lbL76NZAT2+E=;
        b=rX7++hbsv03I0QFn+vz9jiv89i0IGBvYVwUM3RlOhY5LX3ekjkm7jhLrowbkdIfUTH
         LCEV2P42LEp2iCIs/qxlqEK7cETrYqoY05yd3i9TmRy1NDPob/HjPxpekBpMW23Rm3k6
         JrHWJn7ZTNftgEGcf3u9++OwvEYoSj628R78zpTOmq764vepyPpogy1jDa89K0cp2/4R
         fiZ4hdm7ABuT5HwvcYS4198HoyYZ7pQCatdNKYOsEk0Fvqwp5GrHu+jwSKdrVXryp8td
         FUs3n43ZfzGOHgmUtTrSjVWbpjJ0v/f9gdGjzdnN7uDt7h738Psm3HZJ04wOdywWK38O
         lxxA==
X-Forwarded-Encrypted: i=1; AJvYcCWuWO79g362rOJduiNmwfjWf0vGNb2XnRjti/Q95uEPjFvypeGznqWfEYoDIKXAVyBsckfeNznpiZNEiag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MO7PzVb0NGso9OUqCdNy8iKW4gQMkHQG0ydiaOOwrUYyD5K+
	PoK1EodNRDFMIELmKeL+LAfgm1KK+gs2pjlliovE4ixAnr03Os+yZUGlkGMFctzZe/M=
X-Gm-Gg: ASbGncufEoqiCgkcWIzjtDgLl86+9G7iloMvRbc5K8N887mzufzYFyT+O5/5RNRscvI
	8U+webjmysrJe3l8QMRe/xqtbIuJ6+/ecOrfOtBcRfJP0FuKGgKCg4o6Ee+Yl2mtR9y6asERMg4
	bmqEjMwPrF4ba4LfZetePgx9AC9yiS7YuQGPe2VivpmMFbuiZZvCXqPZd7KoIhAmg25nFt/3eNK
	UYgXX9xa4yJJCnxgEcuC44CVyWoFE8MqccILOjPQtpZRS6BYgWzYnyWqN0AjZfPEEGW7Kj9/uTB
	QbM3kcvN2OZ3hpAHcxy9al2d/y2i+64GGOib6UaBtOerXBStu4k7T5L2RbBQuAm4Cu8JDcV6hjJ
	YesATkkYBS8Gwdi1+Ho/R61qv8SeOEN08a7hH
X-Google-Smtp-Source: AGHT+IHUfOaV6u8X5qxFKUlC7LB2yebCfftGMi8JimcjPKwM6QWalazzeWJt1jF5l4ISY9kVP+ktuQ==
X-Received: by 2002:a05:6808:3086:b0:403:3814:b2b1 with SMTP id 5614622812f47-40a5d081c0emr2562964b6e.10.1749651368697;
        Wed, 11 Jun 2025 07:16:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494? ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d95e797sm337318b6e.40.2025.06.11.07.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:16:08 -0700 (PDT)
Message-ID: <71b66cbb-ab2f-44e3-926f-9ae4bcb3aadc@baylibre.com>
Date: Wed, 11 Jun 2025 09:16:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] spi: expand bits_per_word_mask to 64 bits
To: Da Xue <da@libre.computer>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev
References: <20250611000516.1383268-1-da@libre.computer>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611000516.1383268-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 7:05 PM, Da Xue wrote:
> Most current controller IP support 64-bit words.
> Update the mask to u64 from u32.
> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/iio/adc/ad7949.c         | 2 +-
>  drivers/spi/spi-dln2.c           | 2 +-
>  drivers/spi/spi-ingenic.c        | 2 +-
>  drivers/spi/spi-sh-msiof.c       | 2 +-
>  drivers/spi/spi.c                | 4 ++--
>  drivers/staging/greybus/spilib.c | 2 +-
>  include/linux/spi/altera.h       | 2 +-
>  include/linux/spi/spi.h          | 6 +++---
>  8 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
> index edd0c3a35ab7..469789ffa4a3 100644
> --- a/drivers/iio/adc/ad7949.c
> +++ b/drivers/iio/adc/ad7949.c
> @@ -308,7 +308,7 @@ static void ad7949_disable_reg(void *reg)
>  
>  static int ad7949_spi_probe(struct spi_device *spi)
>  {
> -	u32 spi_ctrl_mask = spi->controller->bits_per_word_mask;
> +	u64 spi_ctrl_mask = spi->controller->bits_per_word_mask;

I think this driver is incorrectly accessing bits_per_word_mask
directly and should be using spi_is_bpw_supported() instead.

This driver checks for SPI_BPW_MASK(8) at one point but doesn't
take into account that if bits_per_word_mask == 0, then 8 is
implied. spi_is_bpw_supported(), on the other hand, takes this
into account.

>  	struct device *dev = &spi->dev;
>  	const struct ad7949_adc_spec *spec;
>  	struct ad7949_adc_chip *ad7949_adc;

...

> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 24e9c909fa02..087eed1879b1 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -27,7 +27,7 @@ struct gb_spilib {
>  	unsigned int		op_timeout;
>  	u16			mode;
>  	u16			flags;
> -	u32			bits_per_word_mask;
> +	u64			bits_per_word_mask;

This is assigned by:

	spi->bits_per_word_mask = le32_to_cpu(response.bits_per_word_mask);

in gb_spi_get_master_config(), so changing to u64 doesn't have any
effect and should likely be omitted to avoid confusion.

(The response struct is defined by a communication protocol and can't be
changed, otherwise it would break the communications.)

>  	u8			num_chipselect;
>  	u32			min_speed_hz;
>  	u32			max_speed_hz;
