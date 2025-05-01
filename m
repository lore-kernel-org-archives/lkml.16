Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E31F1511
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110697; cv=none; b=N6CuZioQdHd2en7jSPvs/VaToyeBJ+oueU27opknr/HsHtwvDyZPvncngX+8v+nztolgAt89FTLQ3QY9lm5JCzyWYyFJq7XjIQWSie72m8xnLTYfs1wTYSVr9gEtQRJEIGywN0nFlXpfNTfVoy5P7Oz6XWaexckaIZke91hl9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110697; c=relaxed/simple;
	bh=pkCKg8REI2kJ+KBl+ostpIL6/TdSCwYqr+PRuvynaa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqWc50SV3qHFUVydzgRzKgkkB7g2u9/o6gUtMHIvPF4oQ3tFcqzOpU9/g0QHpLpX4GbwbitfA49/phLoRxTOo8ra/bBY+QJVlYrlECui5Ip1zWR5wF8gDpVOdCs/COZgEB/oK7C5C3bParU5SgvWNf+xpN6ywqU2NNjgHuGrpbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U9RMuezs; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U9RMuezs"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c76a1b574cso350872fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746110694; x=1746715494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2Se3FRDk6iAumT2Vgey+XR890FoK1DcHOmHi83BtWw=;
        b=U9RMuezsMOML5RMX7vEaf8SZSTQVeA19fS9lBI72RXPGZhhsCJ9RH90C/991QXCPCB
         mnHeYbB361GIQef1TvOVKw6CsGBBDzLrEy1zVRZLTOWeTVzcrfdDeRth9ZMwF5/YkF2U
         Ix094udzZ+83udIMXOjhtMFtJndmsplKa8JJXl854XiTHRq7h/RfQI7vq5j7bwqogsZr
         +LzjcVeys9bFK4GYmceIBloZI2goOchyg8/gybU5fSYr+CdBBrmxF5D1H+0lVlwULggw
         lUJ1m9iRqCBJJfAbygsIkC6wBuWMC41mI1TElgvVgXWO6G1KY6oEBkH231nL4t923/uj
         U5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110694; x=1746715494;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2Se3FRDk6iAumT2Vgey+XR890FoK1DcHOmHi83BtWw=;
        b=G61qCXg2vL+pmNyGgCFbxrONvRN4ZeRBlvH5dj6k9kMRPjLEa4EfHA6DnxiHXcdUUt
         RlKs6kFAGR80tZKBJJWk/Ofw+vG3gIXkjThHT72NDMH5AWsTeY5KOMbc2riJAV32rcaz
         AzWkW+L+cxJcXy+NGWabs2A53pkfemjyDwqQsp/QtzKI6Hg7/LMNv45EktdxN+obZci7
         BrXTQ5Y6nTM8aKAt6WBtEQUcbEr6GWuMbdAByZrbON69ER4Qv1VDhXqvqO7ag4mTjrt5
         CjlVjkmjMkNygQi7Gtd+rxczaXzqZnQfz+HLv4kWblnytfH33GgA5WnHahJ8SU/phIF+
         UEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvfmIsOoiTDxKX7xRRy8phDrGuTOQUelQOlRI9Jwp0aTzgygJMLS6xOWqUg57kDgiTRNclFgk7B87NcEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJLvrDarV+2mPFuPWSqaR9kOpKA/CxEfaneII1FCwQ8RH6GAVC
	N2JueJceNZTwCqExWUbQ6AbjyApq4apjJj4GMtw26TAuFtqm4TNpUpRVzoTpnuE=
X-Gm-Gg: ASbGncvKJFtVsVrwXpSBhGNsZW4RHYJK6w7fPXC5GuZHGBHJZFPx/FOrKwgut69Pb5J
	DcwzDvrc/kCnPjWH4MtnlWjjTOnkowUAtVx2k76PKxIMzlJWcv5I9sySIKOJRNNC+JLmvMAz5GH
	+DGVcE1TX6qKWidS9knn0JxSD2lce2o5Pvu5cxjV7tMCdWIEZpff1xcxZl74984HPXHXvrePeJy
	oirRZvQthqZJm44yQjmgUwAn+W22uTLzhJv+wplwX2g0pEXhynDO7lS3ZWfFwaTIrtWOhRfn0F6
	BFZ/6YRajwSB8H8S02FAuCsfyTYyMMV9MN0pahahPz+krmDjfcdIA+bZEZqvcS9hpoLX5DX//tb
	GdmHjt6FWneBGB7FT0Q==
X-Google-Smtp-Source: AGHT+IGxJ3NT//fbjvEZXqvWEf4Xd+0HSjpGgi29P3/nQMqcDsGcwtvj80pgndfxfGUJJO0IM6invg==
X-Received: by 2002:a05:6870:6112:b0:29f:97af:a1a0 with SMTP id 586e51a60fabf-2da8c713113mr1738332fac.24.1746110694629;
        Thu, 01 May 2025 07:44:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0? ([2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2daa0ed6ef5sm152040fac.13.2025.05.01.07.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:44:53 -0700 (PDT)
Message-ID: <0c7e4efc-7c2a-46ac-b970-4134c386bc71@baylibre.com>
Date: Thu, 1 May 2025 09:44:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] Documentation: ABI: IIO: add calibphase_delay
 documentation
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
 <20250429-wip-bl-ad7606-calibration-v1-1-eb4d4821b172@baylibre.com>
 <4645ae3e0c3bb1ada9d4cadce77b64fe5e651596.camel@gmail.com>
 <070b269c-c536-49c5-a11d-7e23653613f9@baylibre.com>
 <aBI3eUPirZEXpZgG@smile.fi.intel.com>
 <896023ae-c279-4201-a7a8-dfd9b33fe0e5@baylibre.com>
 <7fe18625-3a25-40c8-bfb7-a7a22a3eccff@baylibre.com>
 <jvhwdzmruov3je7qvsncn4naxg2cbbset27vr6tfjl3fumw7es@v3ho7m6iwaqp>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <jvhwdzmruov3je7qvsncn4naxg2cbbset27vr6tfjl3fumw7es@v3ho7m6iwaqp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/1/25 7:33 AM, Angelo Dureghello wrote:
> On 30.04.2025 10:04, David Lechner wrote:
>> On 4/30/25 9:56 AM, David Lechner wrote:
>>> On 4/30/25 9:45 AM, Andy Shevchenko wrote:
>>>> On Wed, Apr 30, 2025 at 09:21:28AM -0500, David Lechner wrote:
>>>>> On 4/30/25 12:40 AM, Nuno Sá wrote:
>>>>>> On Tue, 2025-04-29 at 15:06 +0200, Angelo Dureghello wrote:
>>>>>>> From: Angelo Dureghello <adureghello@baylibre.com>
>>>>>>>
>>>>>>> Add new IIO calibphase_delay documentation.
>>>>>>>
>>>>>>> The delay suffix is added to specify that the phase, generally in
>>>>>>> radiants, is for this case (needed from ad7606) in nanoseconds.
>>>>
>>>> ...
>>>>
>>>>>>> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_calibphase_delay
>>>>>>
>>>>>> Not sure if I'm too convinced on the _delay suffix
>>>>>>
>>>>> Phase is measured in radians, not seconds, so it seems wrong to use it here.
>>>>>
>>>>> https://en.wikipedia.org/wiki/Phase_(waves)
>>>>>
>>>>> And the delay here is with respect to individual samples in a simultaneous
>>>>> conversion without regard for a sampling frequency, so I don't see how we could
>>>>> convert the time to radians in any meaningful way.
>>>>
>>>> And how this delay is aplicable to the phase in the hardware? Sounds to me that
>>>> HW has some meaningful way of such a conversion?
>>>>
>>>
>>> It is a calibration to account for a phase difference between two input signals.
>>> This is a simultaneous sampling ADC, so all channels normally sample at exactly
>>> the same time. This phase delay calibration factor can introduce a small delay
>>> on an individual channel so that it starts it's conversion some microseconds
>>> after the others.
>>>
>>> There is a nice diagram here:
>>>
>>> https://www.analog.com/media/en/technical-documentation/data-sheets/ad7606c-18.pdf#%5B%7B%22num%22%3A113%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C34%2C594%2C0%5D
>>>
>>> To convert the phase delay to a phase angle and back would require also knowing
>>> the frequency of the input voltage signals.
>>
>> Maybe calling it "conversion delay" would make more sense? Since the phase part
>> of it is really referring to the application rather than to what we are actually
>> adjusting.
> 
> Are there examples of a phase calibration in iio ? Becouse apply a radians 
> calibration seems complicated and maybe non approrpiate for non-periodic 
> signals as often used in real world applications.
> 
> So another viable idea could be to use a IIO_CHAN_INFO_CALIBDELAY instead.
> 
> Regards,
> angelo

I was looking at the datasheet on another ADC that popped up on the mailing list
today. https://www.ti.com/product/ADS1262

It has a "conversion delay" register that does basically the same thing. So I'm
liking that name even more now. Just calling it "delay" seems a bit too vague.
We could make it IIO_CHAN_INFO_CALIBCONV_DELAY to try to keep it shorter.
