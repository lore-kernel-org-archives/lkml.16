Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520FC24EA86
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902476; cv=none; b=GWFZSAAD3GOV33V3baLD64/B2o488WxJWkAzNXkuYJRImri+YAnTB717MYA8Ro/ifX3lB2ddkyx6H6z3YTfSWck8TQTFaQQ1RJsu9dDB6r/GdlFIhBBghs1pUKN2wUVOGqYx3SdZ+Z/QbaFkTI+rRmcFpQefmAsMr9I/dKJDAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902476; c=relaxed/simple;
	bh=Y7sBMJl9huCoJbTO8M1vR4VKFo+G40GzBvX0w6rClRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LaBf2UO/wexlHF53kWr1XZcjfBSjfwRVwY3uSt/0eLJru6GWXdq2rcSkyOQTUSlOQrVE/D1HyKjNhZjLT3SJNkrGuJ8Cwmqa+ws9MSWcfHNIqkZPor6GcqDFYamsHEWx/9srymrrseowDum6ymkFEw/DGv2i2ov22+tPUvZBTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k72PNw5+; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k72PNw5+"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72ecc30903cso479381a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744902472; x=1745507272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fO4PGom8r+nn+/7wCMZh1CHX3FkJE/YgsW+Sw+QFjaI=;
        b=k72PNw5+q0fYh1Ii9h+u2kScdyU9nAN+fbiTPZeQrCDmJOO5I2917xkd6mM0KZt+M2
         dyBFDCUW/svxMQadEE+GPC0cEZpee+UrHvWKei8KB3liNZ102VsOn0uaKhtjl7PYWuoO
         cjWsycULv95/gdurn8e1IyyCybDohAAo6q16CDvgZlMubFe8hlY1K33/1eONMZmSAzU6
         AKV0zO4nakjyeWilMsf1j6qeEQLL4b/cQPNzD3KXE0NUOJe5z0WlzOJQPvUBukF95wI9
         ZPbkRCPh0B4chRR8nUUZOPhBXv3eMQPgy2ahElv4Z5zOrG8Mihfdl5kmcOP1kLDW6Nvs
         AKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744902472; x=1745507272;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fO4PGom8r+nn+/7wCMZh1CHX3FkJE/YgsW+Sw+QFjaI=;
        b=JYMeOHtceV+eZLqwb7P8e1bVFmUG6dJXidDOaCu0DGywbLELfHsuYJJQ1kodYBA7/T
         KvAUkC/HMdGspM58SU0A0h1CLE9inQP7/5zfSpl87/uJudo4TGAxWsmFc9s3v7XrcTBG
         cY0WfxJQn6BP9A0wtEcd1Ky2bvvQK/xdAVf0xS6zmnpIVfPIY7iE12z78ut97U1cfghZ
         wgnfDV1IaxsN+KCV9cAs0KsQ7dup3CcTqG+bzB73u1BDyLlW8oIxg/dIy1USp3uM/P+l
         s18gcMLyF4nCjP15yNMAhXQlCDxg5BrCrkpCvfevQSqg7L2RS5wMieXgT3m3A+GLdAcy
         Xx7g==
X-Forwarded-Encrypted: i=1; AJvYcCXexzfSC+RyKO9gCXJ3zHIU6n9vr0bjXdA773Obro+O0PyOQGzQPU3/nmIrOiExo8/WhKK64+E53Kj8UYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkxKrw4cjbycco//vbuXed/KyJmK7GGVnb+8S1HPTz9p9IRqq
	rc2N3evL6ff1M9piimkIk+6+qGvP7NCE9zYx3GnT+17eewx/sJqs6/qMuWtisPQ=
X-Gm-Gg: ASbGncvc9EbHZvwc/Y39y2fFvjI2ikmX01XDLiaE8NwyyAsoSXhbTXL7BGkc6AvU+WC
	wCsSihLjClk63x9TEXh+GZIFgB8iamUXMyQtuiXXMFtlxltcpWg4oRu9r+d2dVD0lwTPYJ5SEC7
	vg4nzdpc55H3UNCABp09HrMZvxn5GuuSYPQyg+tH32k+SrJV/1wZ4bngAD7loqEWVaF8p2zV90w
	j0kME5lz+/13gI51BVgL22JPgDuR8KjSq28tZtOUKufbEmxHMuCQkuGaEJwz5FoFbQpGDF1HqOE
	dCg+xdc8JKlmQIi2H6l7IDQPFXLyKpuebnfqnzpHPPvexCC1QtMi9tHMjZYbfKnrmkua4o2MacA
	aEYwp6W4RxSI/MyGmcA==
X-Google-Smtp-Source: AGHT+IEYK1dnPkBo/RCRsPA4Fw4LOSVoCMCliXwjzRUw7NtO1yHMkAzC2RAg+ysD2YBbHrA5uY1uvg==
X-Received: by 2002:a05:6808:800e:b0:401:bcaa:c52f with SMTP id 5614622812f47-401bcaad927mr147985b6e.38.1744902472319;
        Thu, 17 Apr 2025 08:07:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400763bab7bsm3121606b6e.45.2025.04.17.08.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:07:51 -0700 (PDT)
Message-ID: <d6a636c7-36df-4648-92a1-2db1ff4754e6@baylibre.com>
Date: Thu, 17 Apr 2025 10:07:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] dt-bindings: iio: adc: ad7768-1: add
 trigger-sources property
To: 3027a9b0-cf4a-4e55-80a7-7f0dd2a008e4@baylibre.com
Cc: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <35481552e9ce39a24a0257ab001c0bcfea1a23be.1744325346.git.Jonathan.Santos@analog.com>
 <3027a9b0-cf4a-4e55-80a7-7f0dd2a008e4@baylibre.com>
 <aABJ4UuFWDsJX6vT@JSANTO12-L01.ad.analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aABJ4UuFWDsJX6vT@JSANTO12-L01.ad.analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 7:22 PM, Jonathan Santos wrote:
> On 04/11, David Lechner wrote:
>> On 4/11/25 10:56 AM, Jonathan Santos wrote:
>>> In addition to GPIO synchronization, The AD7768-1 also supports
>>> synchronization over SPI, which use is recommended when the GPIO
>>> cannot provide a pulse synchronous with the base MCLK signal. It
>>> consists of looping back the SYNC_OUT to the SYNC_IN pin and send
>>> a command via SPI to trigger the synchronization.
>>>
>>> Introduce the 'trigger-sources' property to support SPI-based
>>> synchronization, along with additional optional entries for the SPI
>>> offload trigger and the START signal via GPIO3.
>>>
>>> While at it, add description to the interrupts property.
>>>
>>> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
>>> ---
>>
>> ...
>>
>>> @@ -57,6 +80,15 @@ properties:
>>>    "#io-channel-cells":
>>>      const: 1
>>>  
>>> +  "#trigger-source-cells":
>>> +    description: |
>>> +      Indicates the trigger source type for each entry:
>>> +      0 = Synchronization GPIO-based trigger
>>> +      1 = Synchronization device trigger (e.g., another ad7768-1)
>>> +      2 = GPIO3 pin acting as START signal
>>> +      3 = DRDY pin acting as SPI offload trigger
>>> +    const: 1
>>> +
>>
>> 0 and 1 don't sound like trigger outputs that this ADC is providing, so don't
>> seem appropriate here. But the SYNC_OUT pin is missing from this list.
>>
>> Also, outputs could be used to trigger anything, not just SPI offload, so don't
>> need to mention that.
> 
> You mean like this:
> 
> ...
>   "#trigger-source-cells":
>     description: |
>       Cell indicates the trigger output signal: 0 = SYNC_OUT, 1 = GPIO3,
>       2 = DRDY.
> 
>     const: 1
> ...
> 
> It would be like interfacing those output pins for a generic trigger
> usage?
> 
>>

Yes this looks correct now.

I don't think this is the case, but in general, if GPIO3 could be programmed
to have different trigger signals, then we would need a 2nd cell. But IIRC,
it can only be the START signal, so 1 cell should be sufficient in this case.
