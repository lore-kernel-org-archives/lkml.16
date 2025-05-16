Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE6D1C84BB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410314; cv=none; b=DICFa6KfXJa7qvt+fUBrc/qNs0pZnjdHI+R854NAqp/m31IanygIZOhs6cUFKfnQ0RxVStK26jZWtWpQ1NkV8jknZsEyrL/rnUsIHQpAK0iLSiCsXHjxfj8RYH4la1jsFg9C52sqTZv2yFALV5CW8dQu3XGHUUpg+qZ8Lvt08QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410314; c=relaxed/simple;
	bh=GPqjEiXfvgpVyzD7MfRLrA0RhaihGYpKr3DGczzpvTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYGtfMXnivc8r1wcfqm31M24AQ8Qa+SjHm/Hioxf+nMmd7Hw2tub8L4hDZJwrswsd6nznnMSlX0OuH5rhu2/Xqdh+CanyREFs/lNLbJv7psy/q72r0lmEvkhlpCUiPSRCTuS3vanG9jRkxvU8XgEIQzzhJBznzAsVvCFZyaYBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vZmzqCd4; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vZmzqCd4"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c14235af3so1818947a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747410311; x=1748015111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Ec1M58FKkAOe/rNmBRU5GFp7ntrZHiowIyOOzinjDk=;
        b=vZmzqCd4B1S9g7Y1eUe58JAxpVOfMLRS/EfrN48K8nT9Ckz/17kb/TKZzxmQDYDBLB
         sqgvdl+4xf/RpwTAfWTChaLgx/r5Okk64g/5n8FMNe7vIezENo/ToHO6kop3EHzJrgu3
         W00ztlXGJfLDBoNLos5bJGbzoa+7Ly8X47A8KaUf5uJQ1zlwokuwqiM8EZzqVroRRklz
         MYeCGDnsKd9nSCBeucvQjpHTCZHG96nLUkiaQCRK5dtw8rUveHsE+rHcZo2Nk7jxJsJQ
         s2sTnONuCAHD3psk8Ek52I8x3sc7+2tHjE7BFi1IJ65bPdYhs351YwUeP8/USfWeWbrD
         yehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747410311; x=1748015111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ec1M58FKkAOe/rNmBRU5GFp7ntrZHiowIyOOzinjDk=;
        b=W+SIQBMikoJs/vNbhWvpohnzx405Oi3kY4+68X0VI6wGuxFanROz5nIEKMXRW7mb67
         uW9pAdHReJL9pVHFPkxUClyibcMBJwx9kgwFMLEoAVaXWC4rxs6Le4f3TGXuo4MdR50o
         DVVHyEbL/wuxEps6R2nKyHyG9tY0ENZEwDScJli9LhUq6bRTyBm5ZK3Jsxtu6PnWGplx
         hCgpdG8zj/mV6pPcisWdjBgjYY84Q35ibMCzNiPQKX7WS23k2TP7Lpax8AvxFOuXeZ0H
         taq17KWObkghk+P/4fUZk4RagcVXCMCCSkjhqVJ9lWyoyEk4I5Vub2RpsoT4rPm7RzqZ
         O5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp/saYP7VPJySPVBqWeIxzt0enHzNj91S33Ax4dmx1IuLOHd5xdNfO+pigOtl1nUob3tZfmAL+1TYuzLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+WQda5EXAPev/XZ0AzBy9OczI5L8yaKTw4k/fL7IGLTM8Va9G
	w06O/uGDMeNUr+7vFydl6kZ2gAfeIvN/yfYv5UpAlIm2nhmPDSftjzBILy842id7D3M=
X-Gm-Gg: ASbGnct3vT0iyM2ZipGlY4f6qTQ87kYXPTHHH4iwvuB3RJfJcTlykup437gDa6/5P5p
	PIywq92dyOHak3SA7cT1taoAgEyVHbt/GuNh5GC7AO1KpXC1Gej9/VtuG9pOET3TswL/KDA+fVY
	gzFH/YGzCAY/A70OnBKgTvJ2ZOSNVtz4YAoHQUtaiLyOvM6R5Ns9tOim3XqL6Tdsebq2Qilim7S
	PVZn+PovOCTn7pdxdVNDJmJR0eoFOewFbJa9RLZgeiyV3W8txPco2upHZXGUnTYeLpjsGCR+di6
	QPySRScdbvP6UYRv39Wl7CCAlELTvbZ9qgT18fZE8lx5KoyqRz6VByAqIql15LEeY52baNQYBVl
	3M7cHgo6gC1WGsLy0HTTCfcxwRQ==
X-Google-Smtp-Source: AGHT+IFTiBMCmlFr4Xr0IwvjcWT2W9Ff39GtxaqewQ9MPpe3zVgv86xbspnneLI+BuJWWeAsX6ukEg==
X-Received: by 2002:a05:6830:d82:b0:72b:7e3c:7284 with SMTP id 46e09a7af769-734f994c4f5mr1927613a34.18.1747410310861;
        Fri, 16 May 2025 08:45:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d2f:9b08:7c22:3090? ([2600:8803:e7e4:1d00:d2f:9b08:7c22:3090])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a4b101sm389197a34.9.2025.05.16.08.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:45:10 -0700 (PDT)
Message-ID: <5318e6be-5299-47bf-8c6d-1d30a1765b9b@baylibre.com>
Date: Fri, 16 May 2025 10:45:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: iio: adc: add ad7405
To: Conor Dooley <conor@kernel.org>,
 Pop Ioan Daniel <pop.ioan-daniel@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
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
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516105810.3028541-1-pop.ioan-daniel@analog.com>
 <20250516105810.3028541-4-pop.ioan-daniel@analog.com>
 <20250516-moonshine-engine-006e72665702@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250516-moonshine-engine-006e72665702@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/16/25 9:18 AM, Conor Dooley wrote:
> On Fri, May 16, 2025 at 01:58:03PM +0300, Pop Ioan Daniel wrote:
>> Add devicetree bindings for ad7405/adum770x family.
>>
>> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
>> ---
>> changes in v2:
>>  - fix properties: clocks issue
>>  .../bindings/iio/adc/adi,ad7405.yaml          | 60 +++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7405.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7405.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7405.yaml
>> new file mode 100644
>> index 000000000000..939de3bd6f26
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7405.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright 2025 Analog Devices Inc.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7405.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices AD7405 family
>> +
>> +maintainers:
>> +  - Dragos Bogdan <dragos.bogdan@analog.com>
>> +  - Pop Ioan Daniel <pop.ioan-daniel@analog.com>
>> +
>> +description: |
>> +  Analog Devices AD7405 is a high performance isolated ADC, 1-channel,
>> +  16-bit with a second-order Σ-Δ modulator that converts an analog input signal
>> +  into a high speed, single-bit data stream.
>> +
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad7405.pdf
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/adum7701.pdf
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/adum7702.pdf
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ADuM7703.pdf
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - adi,ad7405
>> +      - adi,adum7701
>> +      - adi,adum7702
>> +      - adi,adum7703
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  vdd1-supply: true
>> +
>> +  vdd2-supply: true
>> +
>> +  io-backends:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - vdd1-supply
>> +  - vdd2-supply
>> +  - io-backends
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    adc {
>> +        compatible = "adi,ad7405";
>> +        clocks = <&axi_clk_gen 0>;
> 
> No reg here, how do you actually access this device?
> Is it entirely via the backend?

Yeah, it is just a high speed serial bus (not SPI) that reads data
and there are no programmable registers.

It would probably make sense to have this as a child node of the
backend rather than a random platform device. We had a similar
discussion about a similar case a while back [1].

However, the conclusion in that case was different because that
device had both configuration registers and non-SPI compatible
data stream on the same lines. So we concluded that even though
this was the same line on the DAC, it was two different buses.
We ended up with the AXI ADC node as a parent SPI controller node
that also used the io-backends binding to represent the separate
data bus.

In this case though, we only have one bus, so instead of using the
io-backend binding, we could just have the AXI ADC node be the
parent of the ADC node as was suggested in [2].

[1]: https://lore.kernel.org/linux-iio/f9a2b74f371fb4b02486ad7426c57b75739438f3.camel@gmail.com/
[2]: https://lore.kernel.org/linux-iio/e8af0f3f-a09c-42d7-b8ca-dd633539af73@kernel.org/

> 
>> +        vdd1-supply = <&vdd1>;
>> +        vdd2-supply = <&vdd2>;
>> +        io-backends = <&iio_backend>;
>> +    };
>> +...
>> -- 
>> 2.34.1
>>

