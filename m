Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312627702
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743784129; cv=none; b=l1+K5MfpIYfpJrhKdxT+AlrZSkqtqiN4Ufp+l1yGXAXg5Y/OptsYSnXwc4r/O0NC/Bx5zMI3oFeaEDA2PTj1M9LSL7RK5LltIkFaKNlc8X8iIbTgrawYfcYZah6Wvzn4Z8d2kxODnbukUKO7vqDS1ZlSXyuU0RTaJpo+xHNEuk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743784129; c=relaxed/simple;
	bh=aPfTlnx79I50LknnGIiLimhrM64NquPvfETcrAuxChk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofjwYZSpKqtvvIlsdzYwRNYsnB3vfW37Cwv94qbX6K2+5d0UkvuIFjaXraf9mtZ+NFVieNDmylcltUADEqbAtXxFPhw7VqpLO9IABYrjTbd0sPP7sqiGkWUQ8e7VJUcmdx3O1oTBkoQS8+KsNiAs9xJKRwCBT+3XIXw0SepELzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1RsAGolh; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1RsAGolh"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3feaedb4d2cso1167739b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743784126; x=1744388926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DaO/i+FkA1AGng8olW1HsvMniOQdjloeUrl7nwcQdAQ=;
        b=1RsAGolhuFAhAqFDte0pGdBos54Fe1G8DHewzlsNyeP/A4dh+YDVNZ7moV4XncyEE0
         vlOa9k6DShVfPgLizKUpnnfTN7O4vSnOyNyFJFTUiQeKbKxAO/0tvmOJ8LwUH6yPhHZo
         KOutQQF01lR6d3SNMaGSUttAdWYJLaOCNk6KkQVR5PE1vo1zCh7HJv5ddjKcRe/YEvNd
         U7aRcJtz5VZIRMJk2noFPnxj9CF6EWvVFvfJDkNliu2zJOzSpX+gvCGEVu1ENPrqnsiZ
         BAWjGIffawi1P9hwdZ6KmC38T8GLJI2DH2DbJP/CQNshUcimVGXuYfWnfPS4rLfTR8+H
         jclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784126; x=1744388926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DaO/i+FkA1AGng8olW1HsvMniOQdjloeUrl7nwcQdAQ=;
        b=FdK4TmCeLpoqTqEi+rTdHF0B7aslb7dRVETmk85vX3o8AS/9EfPOr6asRt41f26LlE
         hMxd3/7TvlzILsVe/4lA/GtMB2zz69/Q9xu0/NwCSuT/E7yINSz+u17O1S8AnIxoiqrU
         oDo8tuiyrF0j8TDKynQ6aGDdRL3mQYTPpLNo3LFgYf2/eKMk2ikgq5uXSczLVGOQfwPV
         RKx2XCNkP8GtoF485xCDysnWPTZnuSI+63SAUa+YPXfFlErr518UyUf/ZJgSarHMi4tZ
         w9Gjr7bC1KV6LgWyw6CmV38X1/n1fJsDJFs9Zw9fNpofjG35VCsPkaWMXJyB07/cwXGa
         sBLg==
X-Forwarded-Encrypted: i=1; AJvYcCXdESjMCCP0GULdWReNg2c4UDKSVTaCi+qFcK+VUF4DIocpUTzq3P4nnq95YXGb1XHnXfJ6N6clo62U9ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZQ4asaoa0b17FPQMUi/SVd8FZmiJnhvekmqGLiwzw1yGqNgX
	pFZh9OVjddBRJq3MMuI/svZ2gqMkCDXD2AziRL4kkPqZfpEQhtWgjKdZ7EBVDPcS+tuTP4ZBV9f
	/kGI=
X-Gm-Gg: ASbGncvXeQA64OFOIXk77SUgH9nGI2/kE3c8ysv/j4TmoNoaqvdL6g433n26vZy+ypw
	rCOSmbG0QZv9igjdyvvWc+pEMU8FuK9byFwYRgHIpohVl8/Dyt2wbx5Fy84Erh+HKcTcc7A8/Ak
	uA5U5L/LRC2DW+3YZjf7t0fg4zaxiv23gsy3QcXMHv1mE6ZESprhL9KLtRRCdqIugaaBZ0aqZd1
	02dFlmeMmwj0CWLGuvNOMkZBwO6C6xDQ7KZCWayqHp2Tfz7YHlelyi0vxrjgFtmg74nM/8VEZm5
	va+5f1d9HNvvjGQdWMy9wPz3JhgCx6A+Vjkyat6nYOn2bRVt1SKrB7wYKqeDVOCw1QEeU6DF66T
	iUesDbA==
X-Google-Smtp-Source: AGHT+IEkqUFuTsF9DpWKUAtQj8c+kb6zBiRbPxTHELYMYo/Mt6uOX2gp4gqviwKs1uyy7BfnRAertw==
X-Received: by 2002:a05:6808:1246:b0:3f6:abbf:bb88 with SMTP id 5614622812f47-4004563ad1amr1867597b6e.29.1743784125715;
        Fri, 04 Apr 2025 09:28:45 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4003ff6c255sm670214b6e.18.2025.04.04.09.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:28:45 -0700 (PDT)
Message-ID: <dcb9c90f-480d-456e-ab01-d68171356050@baylibre.com>
Date: Fri, 4 Apr 2025 11:28:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: dac: Add adi,ad3530r.yaml
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250403-togreg-v3-0-d4b06a4af5a9@analog.com>
 <20250403-togreg-v3-2-d4b06a4af5a9@analog.com>
 <b2082b59fcbffe9f546bb681eb33276a3c5896c5.camel@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b2082b59fcbffe9f546bb681eb33276a3c5896c5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/3/25 6:15 AM, Nuno Sá wrote:
> 
> Hi Kim,
> 
> On Thu, 2025-04-03 at 13:33 +0800, Kim Seer Paller wrote:
>> Document the AD3530/AD3530R (8-channel) and AD3531/AD3531R (4-channel)
>> low-power, 16-bit, buffered voltage output DACs with software-
>> programmable gain controls. They provide full-scale output spans of 2.5V
>> or 5V for reference voltages of 2.5V. These devices operate on a single
>> 2.7V to 5.5V supply and are guaranteed to be monotonic by design.
>> The "R" variants include a 2.5V, 5ppm/°C internal reference, which is
>> disabled by default.
>>
>> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
>> ---
>>  .../devicetree/bindings/iio/dac/adi,ad3530r.yaml   | 99
>> ++++++++++++++++++++++
>>  MAINTAINERS                                        |  7 ++
>>  2 files changed, 106 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
>> b/Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..cf4a3eb98f1fa30afdeb0740bba7f052d8ec
>> 2cd4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/dac/adi,ad3530r.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices AD3530R and Similar DACs
>> +
>> +maintainers:
>> +  - Kim Seer Paller <kimseer.paller@analog.com>
>> +
>> +description: |
>> +  The AD3530/AD3530R (8-channel) and AD3531/AD3531R (4-channel) are low-
>> power,
>> +  16-bit, buffered voltage output digital-to-analog converters (DACs) with
>> +  software-programmable gain controls, providing full-scale output spans of
>> 2.5V
>> +  or 5V for reference voltages of 2.5V. These devices operate from a single
>> 2.7V
>> +  to 5.5V supply and are guaranteed monotonic by design. The "R" variants
>> +  include a 2.5V, 5ppm/°C internal reference, which is disabled by default.
>> +  Datasheet can be found here:
>> + 
>> https://www.analog.com/media/en/technical-documentation/data-sheets/ad3530_ad530r.pdf
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - adi,ad3530
>> +      - adi,ad3530r
>> +      - adi,ad3531
>> +      - adi,ad3531r
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  spi-max-frequency:
>> +    maximum: 50000000
>> +
>> +  vdd-supply:
>> +    description: Power Supply Input.
>> +
>> +  iovdd-supply:
>> +    description: Digital Power Supply Input.
>> +
>> +  io-channels:
>> +    description:
>> +      ADC channel used to monitor internal die temperature, output voltages,
>> and
>> +      current of a selected channel via the MUXOUT pin.
>> +    maxItems: 1
>>
> 
> I'm a bit puzzled... Isn't this device the provider of such a channel?
> Therefore, I believe we should have #io-channel-cells, right?

Nope. :-)

The MUXOUT is an analog output pin, so this property is to read back from
an external ADC what the analog value of MUXOUT is. The DAC doesn't have an
internal ADC for measuring these values.

Comes from Jonathan's suggestion on a similar chip:
https://lore.kernel.org/linux-iio/20240413160610.4cec010b@jic23-huawei/

> 
> - Nuno Sá
> 
> 


