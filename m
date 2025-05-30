Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0979CF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612953; cv=none; b=YhrJpwgN+3ALH8WSdZfzFTCW8VKTQxQ5gw4fP42bFA8oufTvZ/gyGnoX+c8J3zq9jMvW25qDWiNFFKTy1sPQGHm3yMyOSDBogoV+M52AqdDW8I9dolUBn2L188sMX3JZAN2h4vYe/GZiN19cY3SpuG6cf96I9Uf36SCIzfcHSaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612953; c=relaxed/simple;
	bh=9Mq5hZOOvW2ZFf69WJb4Ff0N/Ky1FM83I7pmjlJ4tUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDBBuIT3nOmF6kBaJld4FY2yy/soP/w8q1Yo1zlOtTzW/3VmzJnfIlBMPEUi2YijiaudhFC/iBIveWkFY2FN7AGwGUlH6vQCQucQfhPhTv3GWKRVTsHYotSdMRH3CucThzRtk9i3EF1ETkpQf4S03VdgRSNF/utwfDS5gVLDMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AdautNmN; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AdautNmN"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6065803ef35so548223eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748612949; x=1749217749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tme1pCrZrM2VXTRq9FlVTDLE9dpQsp+tmaK/1R+aVG0=;
        b=AdautNmNSb+kNQOBVfHwtvT+YM6HxbDWWEXal+gk2zjuMnae8JNvEH+hpsoWSpL1Ye
         waoaFCpa0XX2gxVUViD1TmeP9v490GvbZgyVmtqPqyWVYwEyGK2OT8npB+VIH0njrp48
         iM6ZoGPAyibnBYA8ylk4BjVFs6x49vdui03xmO9MXFfPylO3Z5BSWSBm0yRAJrvXMNyS
         czsqhfYde+y7YTcR5F6efr8R9+kTrQXmbSgEBZaTs8WJxl++2OaSYmwNGBU8rf8g+ke0
         i6DYbH414fgYqklu8TOA/lEjlNqAYXJBCr9SvyfD9sVzIo7eyRFpPe5RrO/rSor9L/5o
         zxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612949; x=1749217749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tme1pCrZrM2VXTRq9FlVTDLE9dpQsp+tmaK/1R+aVG0=;
        b=P1gUZ/3dWHrLSAp3/iRlFxty2Au6995y12gJZUSI6dwFtkeUYfTFV+Z3lTS1Z34SA6
         ahoTw12jXx6wfwppmRAlK0yn49liWNvu3zBxKA5dgwBS3ycVt1rqaufIesZ5xkWFJTJR
         8sJQ6g7/7b/gt5m0vnJxRjbptiq0qT7z5CI2OPcqL1CSGZw46zf+jD78mjhUmmtPVskh
         LowWY3hqMoL9ISlDixvkD5D6F6zt2u+tv3fuGY7riyNDxMX9V1fezhD1/wzbaL10zpRI
         7iwzM/G7s2pv8Gkc4uBNrNnfnH8j6Qr8ivMkKyqAD/ExOU7sfch/21c9fWFJFa2NW1TK
         Yodw==
X-Forwarded-Encrypted: i=1; AJvYcCXbgL/LFPcrUxdR42Fyss6PDAeIYZXQwwyn6I7YQ/CyYI8hCNIz2EUwLCC2LpzbMIx/MHAGKQTVadnbtSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlhizNoOG6FTtg1zLCPg21GlVUmuBYVUmpanPPhSYoY1rkABA6
	AY/RVDv6FeQxICJwxAUhO+npbMHYPjdLe8QV2uKZbm8T1WyKyuRB99nwZTwm3uZlDz8=
X-Gm-Gg: ASbGncukxuKvp7NsvGaDPnZ3s59louNMq5dHhqGDsRF4xm6sy7wa4TEri43Wsy8yh69
	vWxwCpzPTAQH+ftlopcCMSGmGk8aQE0NjI/QEifN694gqzG1hYFLvcM8cm5eD5M/bUxfUVqlmga
	Kt2zbau3VTP/nlugcBERFFRr5Jl1rnsv99i2iLc4TLWaJ0O9wpozGXGw2KzL6VN51/y0Sgfx9Ug
	gkzod3vOUf+TDWm8fnO8+1KTO2jiokyEdbVfSSIWwbHlQVEp365TaCSOF+bARM1LhfbnfyYxC3t
	PyRWSG0i6SOhwQDVoGAcysAtttdSJLdegDUz6MI2FtXJXHkaS4jDOxD4mwFXx9Eq83JVGPMErpF
	figtiRGI1DC+H0SbiyPb0/7JfqUAH
X-Google-Smtp-Source: AGHT+IGSeNzdLtM8Wcq3bN9hHuw1X1n/uK7UqEskLwhdNIeOIspP/rFrJu1kmWlprYDK4upeBv0Wxg==
X-Received: by 2002:a05:6820:98b:b0:60b:edbb:1f50 with SMTP id 006d021491bc7-60d52d6db2fmr1085212eaf.4.1748612948983;
        Fri, 30 May 2025 06:49:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777? ([2600:8803:e7e4:1d00:29cb:b1cd:c8f4:2777])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c8ae0asm392439eaf.20.2025.05.30.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 06:49:08 -0700 (PDT)
Message-ID: <9ed23409-f402-4d08-ad59-af8ac48d88d2@baylibre.com>
Date: Fri, 30 May 2025 08:49:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: ad7606: add enabling of optional Vrefin
 voltage
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
 <20250529-wip-bl-ad7606-reference-voltages-v1-2-9b8f16ef0f20@baylibre.com>
 <521f5868-5836-47d9-9a68-88a9d4e843f6@baylibre.com>
 <dv72cvn7rihavqxg6wnybhedhunabo7bremwb5pkutqljwarcf@eo6zc7vi7fbu>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <dv72cvn7rihavqxg6wnybhedhunabo7bremwb5pkutqljwarcf@eo6zc7vi7fbu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/30/25 2:39 AM, Angelo Dureghello wrote:
> On 29.05.2025 12:52, David Lechner wrote:
>> On 5/29/25 4:13 AM, Angelo Dureghello wrote:
>>> From: Angelo Dureghello <adureghello@baylibre.com>
>>>
>>> Add optional refin voltage enabling. The property "refin-supply" is
>>> already available and optional in the current fdt dt_schema.
>>>
>>> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
>>> ---
>>>  drivers/iio/adc/ad7606.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
>>> index 3bbe9c05b5edbc11e8016c995c6ab64104836e7b..21e63260965c32988d0ab3b8bb1201aa2396f1ba 100644
>>> --- a/drivers/iio/adc/ad7606.c
>>> +++ b/drivers/iio/adc/ad7606.c
>>> @@ -1335,6 +1335,10 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>>>  		return dev_err_probe(dev, ret,
>>>  				     "Failed to enable Vdrive supply\n");
>>>  
>>> +	ret = devm_regulator_get_enable_optional(dev, "refin");
>>> +	if (ret < 0 && ret != -ENODEV)
>>
>> < 0 is probably not needed.
>>
> The above code looks correct to me. What is the issue ?

Like Nuno said, it can't be > 0, so if (ret && ret != -ENODEV)

>  
>>> +		return dev_err_probe(dev, ret, "failed to get refin voltage\n");
>>
>> We aren't reading the voltage, so the message doesn't make sense.
>>
> Is it better a 
> "failed to get refin-supply\n" or
> "failed to enable refin voltage\n"

I would make the message the same as Vdrive.

 "Failed to enable REFIN supply\n");

> 
> ?
> 
>>> +
>>>  	st->chip_info = chip_info;
>>>  
>>>  	if (st->chip_info->oversampling_num) {
>>>
>>
> Regards,
> angelo

