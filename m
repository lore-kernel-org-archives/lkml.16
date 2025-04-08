Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431421DD9A6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121179; cv=none; b=NLcy2jzI4BJCCh6DWp+o/F/AmkEAAyApcWV5u1Xsx4/is9WbaHWTgKGO3xTMB+gAetber3W53hCrCVZpxrM1XRz4z7KVKgpY2wHnINjHk/V93L0qNiIiEeC9U3y6EMIEYonzPO2WDRDJx9fRcBzYi2kdqWklusSy2tDLXatUpL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121179; c=relaxed/simple;
	bh=ccn+5EjBCBAZog8J2jgDf6TBp/pRYSIg1+WTilFcn2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVhBlHbFrwSRy8BfaeFuutcjrtg3P21Q0wkoUTNvRNBpJnq1x1WiQSk2LolX0Zbb1xSTYLyHVjNJeYjPGGoj7vL0+qmxFGGNWRpScj6nuGDUx7/lA91mCGPWqgZbFj14uYsIoLS+AhrOI9ekNg8WMyOEbpOlLprGCjjgqQOOENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WzIr2Z1n; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WzIr2Z1n"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72a4793d4e2so3468471a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744121176; x=1744725976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awTzyD3tiaTSsEy1mjlUb+KI9F9b893/y6sLaVTL5xk=;
        b=WzIr2Z1nBwKoKh/r7LY+Q/hSTefKxlioFRxZV/XWypSNArxrB0crm0XKcu/bdZHGpm
         Ieez9HIQAFzGx+R8YjEdYB790ZsUUGSUUdEqJJdbYRRuPAa5j1LfpkcJ9gXIBRLQ54TL
         6dEcZmxeM06H++O5CL8yPtfiAVIoOMxfm9TeNMyqZxSl9tMY9ojyk4SvIsdBrMRviUhg
         u/vXFlektxtCUVaNLAFxKDVeh7gHGgbcKUyuF3Ue9Ffc1C0u6JfoorvAFJCCOR3a9mnL
         1Lj40vK5VIUD/7e3Yuk5NmWD2A+jNr3RJZR38NymbvWY4XxUDjnKbqQse8gsXwLSuPhi
         o04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121176; x=1744725976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awTzyD3tiaTSsEy1mjlUb+KI9F9b893/y6sLaVTL5xk=;
        b=ZEazJh4uXZafsdv5uPJI71qR8GqAd9edP0b7EIHhyNt1DL6cuuqZBPcoqrnLjuP9h4
         8+ng4dCbY9mANnXLeTYEOgtG6XKcNXE7kpBaAGHlkAJGU/eOEFdbwhffXl/2XbdcqL0e
         6oVxrkOVDX0/5/KUa/IVG4p9KU69NRlT3Rd5CL1oqxhHfqAJy0PlJIfkR4RHMy/bWYy2
         XGBJPANCusNvKu4phCxsmA8KSYUBVysccZmxrXGv7E1/JX14B6ousYz9SC0L6dMNB1ym
         gyu3vL9jBwjyhLbTWmKHfBHvjk2zdbwc/5FDV7k9yf+fXjgILIUgUzOIUQJFh5NUFp5H
         PoeA==
X-Forwarded-Encrypted: i=1; AJvYcCXHdMXpsaXUxGrRuj9xT0sB/daO7ZSHbd2BGIZZT0avLtOMXKqgZGJc8JOhuuhlr9RxJGE85++wdP9C208=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Uv8IHrFmP5AfpocO+iaFgr9Bh44fbpf0OX3SSpU9x+hHDGLg
	sxGvcS1AOmW8w6rel9rHm3ntsSUuqN1P5XErdf8T4+KOnKp7M+n917uaK0R9d2M=
X-Gm-Gg: ASbGncu/dDPAUT9gJh+FMGjmTTWSchpUbSIfd8+EYsv1U/GkU2jt57t97Q6os1VnLwj
	58XtGZSAnHJ35j2dxkvvjCEv34/yYgzDKsx7UhgNzWW4PY0rsQnTZ/Ni+PPp8RpSjaGCTkroQPE
	z+xXi2upsH59o/M8Do7+mLMCNZ/xR8frt2tVTfH0eCixTcSBMTYR+UF3RoZiUM9EyCaVWRd1480
	jcU9erJUQOhWOw5zv4C7RaBt54QkJm/CSLwPHyLPUpGtFbZl+Kindts6NaDSAinXrMF9xWZ5FOj
	zBUPMTttQRDk5WvUcLRtXM8MdSO9WI7KuDbs9VD2vy13Zp5mzIYy4w2kNENhg8qKh2g82KVM12O
	hUwSkYw==
X-Google-Smtp-Source: AGHT+IGI8akES2tMKtN9OgqCGGv0YCjv3fajcZabsYwfuE6WQ9bdTeDcItimlghdyvozI9ofTv1KRw==
X-Received: by 2002:a05:6830:7305:b0:72b:7d60:fda6 with SMTP id 46e09a7af769-72e365c2c3dmr11493160a34.0.1744121176268;
        Tue, 08 Apr 2025 07:06:16 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e65272502sm457114a34.65.2025.04.08.07.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:06:15 -0700 (PDT)
Message-ID: <a66220e9-f690-4f95-9a14-d2b663d63490@baylibre.com>
Date: Tue, 8 Apr 2025 09:06:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] iio: dac: ad3530r: Add driver for AD3530R and
 AD3531R
To: "Paller, Kim Seer" <KimSeer.Paller@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250403-togreg-v3-0-d4b06a4af5a9@analog.com>
 <20250403-togreg-v3-3-d4b06a4af5a9@analog.com>
 <fd2116bd-b0e2-4db4-97ff-1a1e88545413@baylibre.com>
 <PH0PR03MB714159E822B96E7A788A5CD4F9AA2@PH0PR03MB7141.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <PH0PR03MB714159E822B96E7A788A5CD4F9AA2@PH0PR03MB7141.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/25 3:01 AM, Paller, Kim Seer wrote:
>>> +	for (i = 0; i < chip_info->num_channels; i++)
>>> +		st->chan[i].powerdown_mode =
>> AD3530R_32KOHM_POWERDOWN_MODE;
>>> +
>>> +	st->ldac_gpio = devm_gpiod_get_optional(dev, "ldac",
>> GPIOD_OUT_HIGH);
>>> +	if (IS_ERR(st->ldac_gpio))
>>> +		return dev_err_probe(dev, PTR_ERR(st->ldac_gpio),
>>> +				     "Failed to get ldac GPIO\n");
>>> +
>>> +	if (device_property_present(dev, "adi,double-output-range")) {
>>
>> This is not documented in the DT bindings.
>>
>> This could instead be implemented by making the out_voltage_scale attribute
>> writeable.
>>
>> If we really do need it in the devicetree because we want to protect against
>> someone accidentally setting it too high, then the property should be the actual
>> multipler value with an enum specifier of 1, 2 and a default of 1 rather than a
>> flag (e.g. adi,output-multipler).
> 
> Thank you for the feedback. This should be adi,range-double, which is already
> documented in the DT bindings and is also used as a boolean type in other drivers.
> I just forgot to update it here. This is a one-bit configuration that doubles the
> output range (multiplier of 2).  Should I proceed with the suggested approach?
> 

I see adi,range-double in
Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml

We would need to add the same in the new .yaml file added in this
series along with a justification in the commit message of why this
needs to be set in the devicetree rather than at runtime.

Ideally, we would ask the applications engineer for this chip to
find out how real users would want to use this feature to make sure
setting it in the devicetree aligns with that and is not too
restrictive.
