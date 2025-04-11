Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E051D95B3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378487; cv=none; b=QIUzXnox7OI0fjQO+SRFMam8FlYM+OazwFxXqlFYffVUNv8+AcuKF1zf0mkmm0IaC9vW/BFyrQpWMBzQTA6qXv3qkbuV6WI6feLlczBxYO5SCdAnkqRdXewuaYvlUhHyEwlw6f+8UwdX+qefbUwmbv5m52R29YEni761BZeql64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378487; c=relaxed/simple;
	bh=cSh27txL7g12Strb6q9ScZqSSlVYAqRMDdbPYxuxSbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEMigNPg7iNHccQswnYw8YpSdy6piGiF4bOxSertzIIWhgRDrMCBo45cMQWUKrpMktTDsX3HcX/hIhHn034OGY+vsfxPiush5/CiOKP/AYGT9UfjOJAeSJoxSAywQRim9nNUWUcd4x0Id6+NijWRFfcf2uLye+sBxJjw0/GCrpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pzJodieH; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pzJodieH"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72bd828f18dso606775a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744378484; x=1744983284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKN2yK5A2t8FCF5ACCCiUYzvtITcUF9NBPgqaU4hUEs=;
        b=pzJodieHa1HsIwrzs+G5Ns+QcuOUBgoYtIISRFt1kPO5+CyKaJy6mTYKdN3fNnEOIe
         udmiK0+BA8TjMP6qdSh8b4xMMkzI64DBf1YPO0J7tP0IPvqFiQO28kWI6jxkTRHz8qEL
         QU2J3qPYC8pKVd9yrA+9ErV7S9Og2UI8vz8aj2TVINB/jkilGnNVqmbyKYVQA7a8VPK6
         ZZSYFZTyNviAV5scQ2O4XREi8V+w1GBPs9eyluiagmtkOzAQuBIUhpOIuRVXxRCxKykG
         KeH5R3NEy0Kl1alrQ6isE+smoPb/0wE/NKTVsX4Ko3lpMs2FUmVwgoJ0Xkx25aNQaubx
         XPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378484; x=1744983284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKN2yK5A2t8FCF5ACCCiUYzvtITcUF9NBPgqaU4hUEs=;
        b=juD1rAd4ox+OrfLCuOmFfSRKVnPwyIUjRhCE5dUa6iXoZ0kRizpUYrZSzHa1c2+Pv+
         Aumv/z+CqCrpGT+OsfZYirMkyIFJAKx7ccqxIO2+joMhlPhP7+BsGi9YIKRdzwQcUCz4
         WX9J/EsAkQp0MCWhq+Hl3uz1q/G64uWKe8vDKHAyT8Uze1wvtt4XBo1TZsjQaHO9fpc1
         wTR3nNmWOWFx1vm22pcQF4Ur0AuaU9oEz0QQ+fLndjAv7q2oGcyx5Knwj8P1jzMJQST7
         C1s4p86Q9UmPYLk2X4BiBC9ATOOgxJwPGhZopXHqc6712G6ECySE66LESSuwB645LCNP
         Bfnw==
X-Forwarded-Encrypted: i=1; AJvYcCVeK3XCO/V9U9DV+rifyJ/tHC0YxTRD9hCo7RRMkNs/3wGht2qvvHwN0yMAJEGGpSKiLwfTt5x/iivVv6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQP2ROTi3WnDpjNG2zwr0fIUM+lILmm0pJl6rAgi3yBmBCIJmL
	GLEzu2v86DsDvTGLfKK1zIU1d13SrpXAfqG32AvEaI/44E4vnVmG7ZlgGIihiRI=
X-Gm-Gg: ASbGnctXVS+UUzhMnQON3aVQG1AHENO2yBL+DzPuZxRu2ji6AHTpvMdzHeuvX8FC9QY
	PwqC8PLtrF1gb8GuXiKwip+AjsFH1YyOQGrzZEpOyjpGOHOMYxtTsOWZi9lM/X1BP20dhxz9xG6
	SY12q0dcSt6LV/KelFeplyZdXmiLNMpPwajPGNWbAjJyoijD2OBavYq4Zkkap6Rc1R5aMIYGF3H
	WD96EIfrZVeTI6QM4EDIdOESalnGVjHe4huNz0ft2tO8nPLBCPxfMykURc9LynAKjUTZ8qozDjP
	jLRxG1+0ndwz775Ak/EsgxhghLHnV3tZ0RNUx4QlWhc1zxkuIYwEWwGE22MX4eubY3SSV4iPrBB
	gsg==
X-Google-Smtp-Source: AGHT+IFcb3rviFsCJrfn4ipJXNeVmWfsFgxwgxvqzCDjBUYafcrhTNRMoGOOe9Z1tVQubzu82tEoJg==
X-Received: by 2002:a05:6830:61cb:b0:72b:a009:db44 with SMTP id 46e09a7af769-72e862d6ca7mr1686691a34.1.1744378484676;
        Fri, 11 Apr 2025 06:34:44 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8fcaasm929090a34.38.2025.04.11.06.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:34:43 -0700 (PDT)
Message-ID: <78d17b05-3f0d-4903-afe3-8051d4bd051d@baylibre.com>
Date: Fri, 11 Apr 2025 08:34:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 8/8] iio: ti-adc128s052: Drop variable vref
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1744022065.git.mazziesaccount@gmail.com>
 <db5cb2e1543e03d5a9953faa3934d66f4621cd12.1744022065.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <db5cb2e1543e03d5a9953faa3934d66f4621cd12.1744022065.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/25 6:37 AM, Matti Vaittinen wrote:
> According to Jonathan, variable reference voltages are very rare. It is
> unlikely it is needed, and supporting it makes the code a bit more
> complex.
> 
> Simplify the driver and drop the variable vref support.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---

...

>  static int adc128_probe(struct spi_device *spi)
>  {
>  	const struct adc128_configuration *config;
> @@ -183,17 +173,12 @@ static int adc128_probe(struct spi_device *spi)
>  	indio_dev->channels = config->channels;
>  	indio_dev->num_channels = config->num_channels;
>  
> -	adc->reg = devm_regulator_get(&spi->dev, config->refname);
> -	if (IS_ERR(adc->reg))
> -		return PTR_ERR(adc->reg);
> +	adc->vref_mv = devm_regulator_get_enable_read_voltage(&spi->dev,
> +							   config->refname);
> +	if (adc->vref_mv < 0)
> +		return adc->vref_mv;
>  
> -	ret = regulator_enable(adc->reg);
> -	if (ret < 0)
> -		return ret;
> -	ret = devm_add_action_or_reset(&spi->dev, adc128_disable_regulator,
> -				       adc->reg);
> -	if (ret)
> -		return ret;
> +	adc->vref_mv /= 1000;

In other drivers, we've been doing:

ret = devm_regulator_get_enable_read_voltage(...);
if (ret < 0)
	return dev_err_probe(dev, ret, "failed to read '%s' voltage, ...);

adc->vref_mv = ret / 1000;

It can be easy to make a typo or forget to specify the voltage when creating
a .dts, so I think the error message is helpful to catch that.

And we use ret to avoid having adc->vref_mv temporarily holding a
value with the wrong units (and can make it have an unsigned type).

>  
>  	if (config->num_other_regulators) {
>  		ret = devm_regulator_bulk_get_enable(&spi->dev,

