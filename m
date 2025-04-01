Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0403D1C5F27
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525531; cv=none; b=M1ts/iRAM7TyEjY62UePSQkOuqy7/011SLdtDskutMXgCcHWu2Ft8SZzl2KV/TN0QVAXWLre/abfFQ05YAZv1jEKq0f/0+9QuHR+3CaNREcHykI9+GRXqmXdLxFiAR97AMDR/xOr6PRAr3EZyBQnd7QPVGGQcCmuirhCcsTyudc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525531; c=relaxed/simple;
	bh=L/QUB900bn4/5qxSQgXevW35Ho7xDBeu2EqGEEQtfrg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j013t2RF2HDBG8/oA9PMWax5EPZHyrnJGceDPURUXskCOhblRLYfkdr7JlX3fWgeYG6VfNIUnVXNEwPu+1R5cHs12qWrhyjURh4tJZid8kmmsOkn9/oGjC3wwozNpBDjUn22Z3s9fvsHwu9czgrQGv2hWZIQRgGo2ZNhKbb7ozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MACl2xXx; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MACl2xXx"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c6ed7ec0a5so2141232fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743525527; x=1744130327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn5wscEL3RLQT1/gL56P3oGMeI2WM/NBihFUEPIxOCo=;
        b=MACl2xXxoVtGErHozFr5CJb9eqqbVUZ/dvBEwvg8G3c69v05Q/fPITlDwnJPfpfV8+
         rfMB4z52zAXCGJC+jh8z1WZK0MHalEw/Dcr8uHEm/DBBELQTD20WvB8hAz51Zj4UeFw4
         eAaTuhDmsx+MdayDPaN46ux1pZIwyFIIdLQ2kukOAb4MPAXQtp/hrQwlEWTxraC1Sm+i
         Y4vBU+Q/B3kGfxTvMFk0nB/YJ62fzf/TKePlrQIxNpvuY88BiMPIU0OLS/1QSZaxgFKJ
         WV/If6czgmUyJqFBlsC6IZNVrdYqUNXEqX3pZKJABCSEbR2xMpQi0djgjupBwCuCRtuw
         YHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525527; x=1744130327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn5wscEL3RLQT1/gL56P3oGMeI2WM/NBihFUEPIxOCo=;
        b=QyH6cyhDKACYm9rQ3VmnOt6SQNb4JLf/53fSESyVf3VwwefTSkB59BttS3ij+V78zk
         xlh1DhtPzwFu8Mkh0joFPa+sf1CWPU/XSYbDYd/Iz6SnAiRaOb7r6mwySzVuiAd29Lqt
         nwDY+afNyK/e7go/kvo2YJs7R4/fF8UzGa7xwKksttjurWEpT7vnFCJAYC2tSTVUIiWw
         XBEUpZU9PDiuV6L64Zz//EZOM/9+/VyQZbyPO393sIETtezLwdXthK/IAWz40AqyVihy
         eJA5EwTR5uvVr5Q286ngNaUWFsyeoOc72UdB+/U2XIlTMn7IqoRApcH6m2MCBTk0/P00
         Gfzg==
X-Forwarded-Encrypted: i=1; AJvYcCWiw0ncTruPXHK7jlUtLKNEvPTYgaU63+EQSrYVSHSBAPlwgPpz36hQQpTthIp+CXL1UnBubCY/9UH4L40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfJmdWsrwgIjaSJNSWhxcELvuC5DoN+peZjmoieNXx67cmn4k
	OwwQHlG/mww7FeXgUYhqWT+Nv6mEyUxHJWkfLg8OWcq6Njru1NT0fqSTSF0mX+c=
X-Gm-Gg: ASbGncs8hTx60QmbCf0006dMgtI/Z+HCFvGphBkiHWFDKErA4DubSot84u4WXVRTczE
	uwwsUp3bKxbY1Wab1G6bGxlC78onGDPJvA83BiXzFfsEU15pMX9Rz8uFgIxrfj931hBmAeBfmkt
	U5WAawrWkCmK9mu5P2VV/6V9N4EaGet6rZO02HtZEiFGx/OK3v01WEqr5pzgD52yosiB4TCbaFZ
	Olq4ei/QgRtquseLoHkZ5DHPNqygrroAHBx9HONnb61nu+3FmwNLOh2IXMxryjW1miFlLdQ3mYN
	6Zf8TNZGTTXG/HXmSZsOh/Z21pz0F1FwURJYz/E/TPX/iiwW/ShAWYV6r5ZC/gjxaWt2dL1b7hp
	XIQZ2sw==
X-Google-Smtp-Source: AGHT+IHU9FmD92LPJ3uip+4pws/5mX50Amq6nNJFvx9VLdxVBV3Kz6b76Gzjd/YUI+o3AWOY0Nu22Q==
X-Received: by 2002:a05:6871:69c6:b0:297:2719:deb6 with SMTP id 586e51a60fabf-2cbcf477394mr7400077fac.1.1743525527071;
        Tue, 01 Apr 2025 09:38:47 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a856e16sm2378333fac.37.2025.04.01.09.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:38:46 -0700 (PDT)
Message-ID: <6b9cce5c-6d4b-4be8-ba11-74b3471e358d@baylibre.com>
Date: Tue, 1 Apr 2025 11:38:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] iio: adc: ad7768-1: convert driver to use regmap
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <b0c7976d4bc817b7056ef40e3ce870b42e8a2d80.1741268122.git.Jonathan.Santos@analog.com>
 <c72e422c-1ad0-4314-8171-1c3830f63fa5@baylibre.com>
Content-Language: en-US
In-Reply-To: <c72e422c-1ad0-4314-8171-1c3830f63fa5@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/25 11:31 AM, David Lechner wrote:
> On 3/6/25 3:02 PM, Jonathan Santos wrote:
>> Convert the AD7768-1 driver to use the regmap API for register
>> access. This change simplifies and standardizes register interactions,
>> reducing code duplication and improving maintainability.
>>
>> Create two regmap configurations, one for 8-bit register values and
>> other for 24-bit register values.
>>
>> Since we are using regmap now, define the remaining registers from 0x32
>> to 0x34.
>>
>> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
>> ---
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 
>> +static const struct regmap_range ad7768_regmap_rd_ranges[] = {
>> +	regmap_reg_range(AD7768_REG_CHIP_TYPE, AD7768_REG_DIG_DIAG_ENABLE),
> 
> Technically, there are a few holes in here where registers are not defined
> so we could split this up in to a few ranges to only include registers that
> actually contain a useful value.
> 
>> +	regmap_reg_range(AD7768_REG_MASTER_STATUS, AD7768_REG_COEFF_CONTROL),
>> +	regmap_reg_range(AD7768_REG_ACCESS_KEY, AD7768_REG_ACCESS_KEY),
>> +};
>>  

Also just realized we can drop the AD7768_RD_FLAG_MSK and AD7768_WR_FLAG_MSK
macro definitions in this patch.
