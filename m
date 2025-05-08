Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12AF78F32
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722517; cv=none; b=CzJ+iY7Dj0wlWBqEEtn6YvUaUjQVXvXuo+nESAz0O98pqeUBuKNfiZukNreyz1EDO2K4+/UCDa7TTAFJLd+pZlrWflG+UoMKZPEl0teJC2tj7tgKzMVMAZd5PUsn542koNCTWMyiOvLODqNzXVnFJWBv4qrW/ouWZiZDu2jf7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722517; c=relaxed/simple;
	bh=lQO1jHxaiYx52ybVdJLV2CjY0oqw5bUftoInQJ2KDP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s1w0xu+WpHBWv94r9Ec7ExyVVJeMWV6DRo+D6e4ieOST8L/4wyWO9yTTkN0Hcctc9ifb08ia+D0THRLUwTsdxMxNVu8qyL0DSwQpy4xNcg0R7axH+79+RQsMIbIBzA36gVh0IIn92v07Cct01igjoRaXr0tiplDP/9OM8IQjxik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iKQlWLZR; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iKQlWLZR"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7301c227512so1032448a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746722513; x=1747327313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNOV3q6ACWoDC2oi9ipTkEmiaERn4Lb/0vudYXDkojM=;
        b=iKQlWLZRmIgcFpoKq1X8P17IrPm0e0oIhqpT24TAjeaEEhz8DHgWQd1sHUXo+9yFDT
         pm+Pu1aNRPS0lAMd07EEt35SOk6Owzh6/iQ4oDaPMDVgXaC52rK0RhYJo1zOte9QfjPk
         WAm6ajepUQrmLPgu5cp7jJpsXRGE7hPI+16iveAOuWx+faPypBE2gPHOIN88u6Xkm7Vd
         b2gtS+/11NfBJWlINQXXy4UpKkeaNnhGlXBHLM/6aHsIYN+wekjJmJJdCiA93YxOA2HQ
         jNG1UlC8L8ieHX/hJwn4oK3NblRHt0VRW+bbAZM9ECTrwpsDDPXcFSrhKuelLsdZ0VJg
         GAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746722513; x=1747327313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNOV3q6ACWoDC2oi9ipTkEmiaERn4Lb/0vudYXDkojM=;
        b=PjWwo9CvwP3Lf4+T+o8GOBaTqHk8Qt9ddPao1YMuoJx9p2mAvOS9EOFep7Pn9DAqiT
         Z64k5H9y/erE9AgzqrTtiTZz43VNNk6FtazahQSPm4j/ekGwBBzRK5beI7fgPMSUKFwe
         pRTIm8XDcXfm01dFdMPa5QJcqhxOtzlvZHt967rV1uCmiWtknObSBS/W1lzDeKXrsEYE
         ajbd4tAHURdaqdeigkduK4AYlZuhkPZn/XM3wx5EREiB6bHqMWjNaBnLO0zB3A7uX+2u
         zHYlL/cEQCPkvBYzmfvN1PbgK/49EksSk3+m/xNfKBA/t5zAMX9TFLx/SgYOFOIxqE95
         N0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4PhXQ7PE1G7pQjokJBhi+zVepRNe7X3QBlzA8sihdKz8yi72zr9uPEz+gP8qDQaFsZr1sYFvL1Y5/CMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BV44wecPLDF4lFy7mfq4uQFXtypOlRWjw0U4tWy5vhoRtl8h
	lvMCWRBnLCET2EsHXuvGo98c+8Yi2SFlY40rzoq9cJZAJK37m5DnV7n66WpVBEc=
X-Gm-Gg: ASbGncuk3tzBpa19KA5oXHh1bQ4J4q01f1rLhWfr91O0Vhg8LaA1SKGaowvUcWHKU7c
	biE5LSPq2s+TccUju6yad9JD5G+7IRc1wfLHaQDdOCJpKyTsChSS5suxoMHpSnFTV4/bdf/Omyf
	kxSKOAhqWKZ+aScQuHPxvAg19iBPGByeQ4pOre2HgeAvok2rojGQSG03IXb5R/lZc8NeW2OtZEI
	4S0ysZjruPK8vTOaD0QCerGQDcNTxKqLVhtfrjdJ3W3dY7C3UOBLPsE159CvfHbypmKndNuUIxf
	g3kZ0IjNTtkE4GL91dwVFWdL2cU+aU+0oAVl5JaEVjXPndoR0OCjX3OBMMJv/kEK/yQ1IMyDv/C
	plr4B/ge/lURac8ZCbw==
X-Google-Smtp-Source: AGHT+IGNhnI7HfO8AULxSLmDUzdqJUBnRfjFQE3CN52ECHOPdXWRZ2JFQRrWSXPaydXFEJiS+fRYog==
X-Received: by 2002:a05:6871:80d:b0:2d5:b7b7:2d6e with SMTP id 586e51a60fabf-2dba45e8ce5mr83184fac.38.1746722513514;
        Thu, 08 May 2025 09:41:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0b7ebfesm127024fac.46.2025.05.08.09.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:41:52 -0700 (PDT)
Message-ID: <20c76ae9-02dd-4f77-8676-523892a33c1d@baylibre.com>
Date: Thu, 8 May 2025 11:41:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] iio: backend: update
 iio_backend_oversampling_ratio_set
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250508123107.3797042-1-pop.ioan-daniel@analog.com>
 <20250508123107.3797042-2-pop.ioan-daniel@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250508123107.3797042-2-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 7:30 AM, Pop Ioan Daniel wrote:
> In the function iio_backend_oversampling_ratio_set the chan parameter
> was added. The function can be used in contexts where the channel
> must be specified. All affected files have been modified.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
> changes in v2:
>  - remove iio_backend_set_dec_rate function and use 
>    iio_backend_oversampling_ratio_set function
>  drivers/iio/adc/ad4851.c           | 2 +-
>  drivers/iio/adc/adi-axi-adc.c      | 3 ++-
>  drivers/iio/industrialio-backend.c | 3 ++-
>  include/linux/iio/backend.h        | 3 ++-
>  4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad4851.c b/drivers/iio/adc/ad4851.c
> index 98ebc853db79..a943d5aac9e5 100644
> --- a/drivers/iio/adc/ad4851.c
> +++ b/drivers/iio/adc/ad4851.c
> @@ -321,7 +321,7 @@ static int ad4851_set_oversampling_ratio(struct iio_dev *indio_dev,
>  			return ret;
>  	}
>  
> -	ret = iio_backend_oversampling_ratio_set(st->back, osr);
> +	ret = iio_backend_oversampling_ratio_set(st->back, chan, osr);

Isn't this a compile error? chan here is const struct iio_chan_spec *, not
unsigned int.

>  	if (ret)
>  		return ret;
>  
