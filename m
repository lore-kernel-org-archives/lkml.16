Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C66188907
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878432; cv=none; b=pVIGZOM2dihJSOj2tYzYwLJ039sRq/moRQjOCk+YhP5amVnOj35PvlueKAdkxC8y0CPWVUpDIiPMVRFdeQ/DKPimqJv273tc97libzHu644WoROa1PgFA2Y6W9KL2ve5E/JGQsru+mvZ4/RjQy1KbWCx42o6m0Gi3/YutPMlWCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878432; c=relaxed/simple;
	bh=8tOtsQM+x4oiZCMtV4+BcU+eJaqF5wDJFxyrlOBUziE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8480axM+lcNw/HM0jswP9KzUWqDp/joRks6KMiCJ2BWakpsRdz49nPsfUo5oYR9S8Ri+5tH/4MzY10M3MdA8R6MIoEO0ArSLi+tiD5zm/ITZWGMS2Tt8YfxwWQ82ogfJWE1XRhoBRHLFAvNsVBm/s5flwm+qDtxo3uAznTUI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wbb/ZJN5; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wbb/ZJN5"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7cad6a4fae4so693107085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748878429; x=1749483229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNfa+WaZFsZmSiE6Z+4+/C3YChzz471UVxFf3Euk8Ps=;
        b=wbb/ZJN50FlcE2uGj0Aszlrijd191ahUF+4z02hnECkdsqRyTqO5Baqo4pdePhNiJs
         OmIAJIzHxVp3AqB87rZp6vcV8wry5sY8FYdUkJ0CgMtUB8u9wJkNslnPQIt8WEEAhYG4
         d698U7UDQI/RzH7TQc7arCOzVs30ZXv4aNNB1V8xQQMrtEeh33K84P2t7G3nyTMVuh6z
         eNhiKZgXhglM52T3c4W+hQZKFBxhRJT/QtdAPYBfBeboO/jGq3wKJ0JS/dbKLSRAZ080
         Tki1CIyMqcUHVAA/hzgqoVGO3QFGJumQ5YjOewxt+3826igkcfZI3jBdG+N421IW1LYS
         hcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878429; x=1749483229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNfa+WaZFsZmSiE6Z+4+/C3YChzz471UVxFf3Euk8Ps=;
        b=PKLs6uzvFGTFu+Q6w9gZg4jeLN+dRZmcXsrbNL5lhjBngrVT9hQEEaV1yKsw+69fYq
         DYh/QxDKgedThoCpj1M/QZzpEaKQiq487a1VBW32ytrvDbrWEUQO+1YFLkXgVI5GrAmK
         rMCmOGtb1sjzl0zTpxS2GEq2LMg4wzwEJyoL+YDMJwcb+zfqMFINPKY496rG/2JKhUhi
         3rKzoU3+y/PrgRno46SDQ8wvRdDUo6gSggr1xsIljI/rorALsIG0AyZhRIrtEIxzUlGK
         otlm06lFqEEKepHLz8U9czyEk/rriKOjx2f++Wal4v0m850J3l67kmifK/FrpzLX8WGI
         97PA==
X-Forwarded-Encrypted: i=1; AJvYcCXuljJzWW5qw6CGPVRfudqQftw9+PVblD2l2AAdhQkqS3B7l0/1zxSkIb+J7e4bWZ8Z/ju3bv3yI4XoYFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtptRagr5eVKEvE5wCMVq8dhy1qgsup31ZJZF9AzY5omq2B0Yf
	vpiknqe9/SHH04r8fX4vJCUXd7TOKQgJcXRU0LOds42+7ATnn/eI+jKohIvqIXn+6ZareLCi9pX
	pC7qj
X-Gm-Gg: ASbGncvJ4MsGCkt3fluyLjcQmPCmGDU94a68gKgWFeRRTLc6PNFQRtoNJj04/lM9I4v
	jANFDjL4340fgTO1yv7U9kHf4wFO9g3eL9hcX3nL+McHmibYXLbXFPoqwumPMWaOiPL6FB2XniK
	7ecL0xR+1QpT/828ympFZyIBCG83/8mpLEs47aBe0+RUElz8YPJr+Pm/+a6pfA803dW1sa/zKe7
	AnUDJKXXOowYfEEjD8u5rEhX64Iu6xXb7KVSxwaHRnAAXQKRYOepS0WixNiZjGm4oUFFIcFAYar
	pBvxhUsHe/WIg0C0Qard1tz8vbdrfDJ0ejkhcLXv/QgYsBhJaooSZQpaiqkKGo8+nz26NHsaTN0
	tmcig/NIsJVHkGIJJAsxzUNLi0Yppnr8wyyN1Llo=
X-Google-Smtp-Source: AGHT+IF57uQxHGgOlzBwzxJo2Ni/WLdwC/o2d4xhErwQ5I03YvinhZUc+GTLgNq4seyU6RFMT+NPuQ==
X-Received: by 2002:a4a:ee08:0:b0:60d:63fe:2472 with SMTP id 006d021491bc7-60d63fe2755mr6583332eaf.1.1748878418793;
        Mon, 02 Jun 2025 08:33:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:74f4:5886:86e1:3bcf? ([2600:8803:e7e4:1d00:74f4:5886:86e1:3bcf])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1ebb00f9sm1488625eaf.40.2025.06.02.08.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 08:33:37 -0700 (PDT)
Message-ID: <008ea5d1-52f1-44dc-8576-d8bdd5c5beda@baylibre.com>
Date: Mon, 2 Jun 2025 10:33:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] iio: adc: add support for ad4052
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20250422-iio-driver-ad4052-v2-0-638af47e9eb3@analog.com>
 <20250422-iio-driver-ad4052-v2-5-638af47e9eb3@analog.com>
 <c82b8c53-e653-4cd3-80ef-37c5daf9314c@baylibre.com>
 <zofjbh4yvtz4sfj2t6cpdohqqlrgwqdqtiahpvalbbfv2tdqqi@g5zpdp3zn4gb>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <zofjbh4yvtz4sfj2t6cpdohqqlrgwqdqtiahpvalbbfv2tdqqi@g5zpdp3zn4gb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 6:16 AM, Jorge Marques wrote:
> Hi David,
> 
> On Fri, Apr 25, 2025 at 06:13:48PM -0500, David Lechner wrote:
>> On 4/22/25 6:34 AM, Jorge Marques wrote:

...

>>> +static int ad4052_probe(struct spi_device *spi)
>>> +{
>>> +	const struct ad4052_chip_info *chip;
>>> +	struct device *dev = &spi->dev;
>>> +	struct iio_dev *indio_dev;
>>> +	struct ad4052_state *st;
>>> +	int ret = 0;
>>> +
>>> +	chip = spi_get_device_match_data(spi);
>>> +	if (!chip)
>>> +		return dev_err_probe(dev, -ENODEV,
>>> +				     "Could not find chip info data\n");
>>> +
>>> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
>>> +	if (!indio_dev)
>>> +		return -ENOMEM;
>>> +
>>> +	st = iio_priv(indio_dev);
>>> +	st->spi = spi;
>>> +	spi_set_drvdata(spi, st);
>>> +	init_completion(&st->completion);
>>> +
>>> +	st->regmap = devm_regmap_init_spi(spi, &ad4052_regmap_config);
>>> +	if (IS_ERR(st->regmap))
>>> +		return dev_err_probe(dev, PTR_ERR(st->regmap),
>>> +				     "Failed to initialize regmap\n");
>>> +
>>> +	st->mode = AD4052_SAMPLE_MODE;
>>> +	st->wait_event = false;
>>> +	st->chip = chip;
>>> +	st->grade = chip->prod_id <= 0x75 ? AD4052_2MSPS : AD4052_500KSPS;
>>> +	st->oversampling_frequency = AD4052_FS_OFFSET(st->grade);
>>> +	st->events_frequency = AD4052_FS_OFFSET(st->grade);
>>
>> Somewhere around here, we should be turning on the power supplies. Also, it
>> looks like we need some special handling to get the reference voltage. If there
>> is a supply connected to REF, use that, if not, use VDD which requires writing
>> to a register to let the chip know.
>>
> Yes, v3 will add regulators.
> Vref can be sourced from either REF (default) or VDD.
> So the idea is, if REF node not provided, set VDD as REF?
> 
Yes, you can do this with devm_regulator_get_enable_read_voltage() if it
returns -ENODEV, for the REF supply, then call it again on the VDD supply.
