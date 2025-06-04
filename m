Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A22116F6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749068105; cv=none; b=IS1BFywppQXABQopn6WPIo0MvmAElkpNMB1cLIjGOpJ9hdR2QYohfl2AQosMBj3TPoUgs3kGvDttTLyRdj52ClyzM+3OyRy/P0hf+RjTaHAFAP18/Dxeol1Cy+K0igNynqxmwajh6uBBq0Tz9Lbfcxo5bOA1cIGOFDrXYUXj/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749068105; c=relaxed/simple;
	bh=3M80ApW25tcb4bzsgTYXk9LwcbWxkkiaP2Ghn2rZIkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfZ69R0GEZI4e7nLgIVIPfcAjLNRm6F/mnugk6v1PxrWVq0jCP/PIrlYe2O0Cvss4GbuKxPPmFi0eKgDzNppHbXiZgmVQngX2LA/YAl+CA9M+dESMU52kymGoDoHpagVWalDAn/unXmFdh4GL37bxAjrczk4MFX8HeeQo8Hi/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hROKr/xx; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hROKr/xx"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2e404edf6b3so212365fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749068102; x=1749672902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRfaLIDBj2llHsNUOJCUg2y9UIhPzulREBxN8ri02+M=;
        b=hROKr/xx+yxFVFNvLblMV0M0Glq7ORvO35rOObPxi2T1qcZ5jI0uohCC08vf1aQouf
         89ANJx0O4m21gde6pPJSTXbSfgqpeLgb5QjmS+dhyJdu0FHmnAugXx4RSkAVYGOCJD11
         aXVMvvNDKg2ow6m9OSpjYX2rSDywTM8rOgdYLVCClE4ed/qgmvqU0y9RGLSitPs5mj2B
         qeVWRMUC0PtAkWu7U9kJb6m+ejtCH51Yly6e1GPjWZ3veImWstMKIqdjTBe9DvgXfIUn
         1tI8OyVKR7Ik0emSAdDVhQ2XAQaMNRCcjQ5RLemhF1EM8AhEqxsNqv8fQEZ7NhfIqvG9
         JHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749068102; x=1749672902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRfaLIDBj2llHsNUOJCUg2y9UIhPzulREBxN8ri02+M=;
        b=KLkSgjPS0EKOwuA3T+SVymUmWFszFvDEygdCf3SFdhjmGvYkGSNSq0SLiIF43rp6y7
         HgKcRGmBI6mcyZ1U98KA+/0UwFucTFwv3GDExZb6dAPZVDUv8KNtQqIwXcJ+5J0NZrrO
         3FVDs67pVWqvWdxCkoUCfu07qjQHXnN2P2QqtXVA396WONTQMLVBMrfl+uKR3Lexcgfa
         Se9rH/2DBh8Jh84mlFHslJ5oyA1ccfs6IqURvsfIZ/R5ZUHieJoUa6kUHucVM25pLgyG
         uchR5/k+8D/Ibd5JYJBrnCqWiu012VySWkJJUlHwMDF7rU7wZkHkeE0C0bhbv2pX+Aac
         oEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUef1muSEvgnGUq+xWkzIarIIsOQtXtww3q402I1MLO0X2wNclyz708VhejhFe9zMoSTdrzquaY5xBNF0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YymcbLPrCJD3ruYPoeI7TAE26ea3T12lQuX0EOJMPTqhOQE9qHj
	WUO2gojw2uWEoOGSyK2RAmdo5QcevtwIuaiS2igXOwVAjTUNLXO0uDf9L9iPQy0cH4h1Xv+QCzc
	RXjXz
X-Gm-Gg: ASbGncsG0Y8MVcFT6coYJVbK9lIVcuVNK8LYpw1w1t8JAJ6WDMX2j3KX2jAZ9HHFdIs
	EZhOIZ3K+bofwgPjtYBVENvPm2dOZ2l0qJVLQTx2hd96EMEoZU/YxTrrun3VT9nLnfuPB4CUXRU
	YT4oEOPdrd9M3itP79tdRYvoEvGWqJinxxdL0/o1B78vVdlxqUJJteKYnkAhASb0QMN70jTNB9f
	/t/GKnffQ55gkugH4/C0g7h6ng4IOytXHbG1G2BckeeqQAbJWw6981mH4YfyXjr2jaMM4Bve2e3
	tW2GTumap8iMriy03VOOBEVK/MMSgbOoYqIbcfRWtG0/aDvuzJzwzC8OvzhZnq3QlkIKYS5GVe+
	aEu7IhQfN5pqjye8mqnoBAkvj4A==
X-Google-Smtp-Source: AGHT+IHQmjfLAxO850YKxxC8hykPYyb6LLSUw/IxyRagifjPWTVnvXEERLoCM79G7tZdCm40eYYEow==
X-Received: by 2002:a05:6870:200b:b0:2d4:ef88:97bb with SMTP id 586e51a60fabf-2e9bf238aaamr2633199fac.1.1749068102493;
        Wed, 04 Jun 2025 13:15:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:829:fdd0:311c:c481? ([2600:8803:e7e4:1d00:829:fdd0:311c:c481])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906457afesm2830330fac.1.2025.06.04.13.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 13:15:01 -0700 (PDT)
Message-ID: <57edc6dc-bbf7-4491-a43b-c33b9466d8d0@baylibre.com>
Date: Wed, 4 Jun 2025 15:14:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] iio: adc: ad7768-1: Ensure SYNC_IN pulse
 minimum timing requirement
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1749063024.git.Jonathan.Santos@analog.com>
 <d3ee92a533cd1207cf5c5cc4d7bdbb5c6c267f68.1749063024.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <d3ee92a533cd1207cf5c5cc4d7bdbb5c6c267f68.1749063024.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/4/25 2:35 PM, Jonathan Santos wrote:
> The SYNC_IN pulse width must be at least 1.5 x Tmclk, corresponding to
> ~2.5 µs at the lowest supported MCLK frequency. Add a 3 µs delay to
> ensure reliable synchronization timing even for the worst-case scenario.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

> v10 Changes:
> * New patch.
> ---
>  drivers/iio/adc/ad7768-1.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7768-1.c b/drivers/iio/adc/ad7768-1.c
> index 51134023534a..8b414a102864 100644
> --- a/drivers/iio/adc/ad7768-1.c
> +++ b/drivers/iio/adc/ad7768-1.c
> @@ -252,6 +252,24 @@ static const struct regmap_config ad7768_regmap24_config = {
>  	.max_register = AD7768_REG24_COEFF_DATA,
>  };
>  
> +static int ad7768_send_sync_pulse(struct ad7768_state *st)
> +{
> +	/*
> +	 * The datasheet specifies a minimum SYNC_IN pulse width of 1.5 × Tmclk,
> +	 * where Tmclk is the MCLK period. The supported MCLK frequencies range
> +	 * from 0.6 MHz to 17 MHz, which corresponds to a minimum SYNC_IN pulse
> +	 * width of approximately 2.5 µs in the worst-case scenario (0.6 MHz).
> +	 *
> +	 * Add a delay to ensure the pulse width is always sufficient to
> +	 * trigger synchronization.
> +	 */
> +	gpiod_set_value_cansleep(st->gpio_sync_in, 1);
> +	fsleep(3);
> +	gpiod_set_value_cansleep(st->gpio_sync_in, 0);
> +
> +	return 0;

There is no other return, so this could be a void function. In this case, it is
fine because a later patch adds another return. But in the future, be sure to
mention that in the commit message (or below the ---) so that reviewers will
know why without having to look ahead.

> +}
> +
