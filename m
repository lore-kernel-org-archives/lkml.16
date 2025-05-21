Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92E266B77
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833305; cv=none; b=JPkImXTSDZOpm9wGPgniIswU+uCGfq2FHfOPyv0DpffJR39wM4JO3iJSe+06vfqLzXjr67jgCBbZ/lHspNCZPJI8HPyca0xDVFS32CdPj1P8+/BaI13FN+gztCIVwzB1s2idgQcFmh182ahhJvGaiy+jznUBye40pWx4yxwUlC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833305; c=relaxed/simple;
	bh=46yPBjwciFLMMrocvFjPrOjdH2xTypHeoYSJWaK7AEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgf8QenIviri6MgTxV4B4yaClXNPNG93hOFJflIvdD+15IIZW/06OFYXVQK+CbI3c9LZ/TlhHFxRYwIkKnXAGUB9goMNn53yZAmFxGZ4dNKa7vcJ0Yalja2AqalpKtyjtYqWcxDEgBYVLhPGdCTKZKwdLmSYhyROr1bNEDzVAfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3DDII2Jh; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3DDII2Jh"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3feaedb4085so4104431b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747833302; x=1748438102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwkvT86/Zl2sJvdjDReDj53Dg8oPYnn4x0+k4uOFFvU=;
        b=3DDII2JhqXNaHu1nBvD8hlqePN1zYoZCfw8DQgXEGSFPXPAWQ4qnZJ9SGwTLyBbff8
         oXZjuVT4nrN1WPQCHbfukdc7wo+CH5ibioasKoRjeUzRxwhbRT8fselvaadKHIe2s1wa
         Sx2g3BeF3/JPFMOs+rLv2yv3qpCgyZaDWBAfgsq7KLCsPJDZXBv9F6zHPWrPFkSUwhzg
         vY93Rg+p+m7W9lZoZrqZw4QxFOxivMp8334Tz4BmHFY5BIOR1BpYIjpoOt7pJzZFWKCl
         D6rDFxPhV4UZYtbj+hfdnr6ViW2YFBI4YSnGpUD5YlhwZ56JWxjhQPqlmPwt8r5q7fk8
         xgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833302; x=1748438102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwkvT86/Zl2sJvdjDReDj53Dg8oPYnn4x0+k4uOFFvU=;
        b=gGPQPVfjkUcrGKrKU+0QfuUCZa6GSRfO8vCK6SnoSzZMzW/Kr4JZgpQ2RgIt21qhWX
         2X07yH6e5mIUQQrGA2k6NswKsw+X4iojZFdcYFwKik/cNOMcfhZZFN1gvkuRSwTF6XuK
         2XqJzg5kvn8qixQQdkDu0mTm2CCmvWlN7XYiRSi3KwBwVgvgNpi+00c0sOtJjI9GYXEY
         XJuCijB/msUqj5m4mkrs/jK4sKuKM5zByr8VUn9tOiyXJT9qC2VYr8kig0M4V/tEbE19
         gyYp5+oe4E+02eG6x57k7U5ZzZ4fxgt8V525fMOOQCWxHkO9b8NqMkoyS/NbHkgeb4AV
         v+UA==
X-Forwarded-Encrypted: i=1; AJvYcCVW6yS2WQcZAM+VbRqJB4lo1nXmKHMgowWSojPnYgbc0XJWTk2/pxlNSyoLFA6HLb2kKa60amzu7Lk0ugg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVcjUBXdsG5jU7S8flIfV4dR5QyiP0PQvcA62KSTc2EEf/0n6
	VzJ9pRMwUCAi037gVBj4z0KuPsa6Ci/+0DAoN8OyXwdwKj69YL2HjdPLobo5gQB6HGxHAyHQHys
	s+tlx
X-Gm-Gg: ASbGnctBemDHMI1c2bNCk3ylddz3ESRLliwpESyaEkM2dfdHWXY/fbHeOIHzRiiAYDR
	H15Jf8GlVKZ0WgwsXrj/1njG/0G2ejOMQbsPq1goDqcGnZIjoe4E3LszFFXw5zEX/ByrylMCutA
	eYSh27bRE/2aYiRNKjGTgrXiT73YYdVHwmRJj8iseXpWk9dQCr+03l+mkDgz7423S0mo3UgIu8S
	NQpzY2zp9G2rZ6yjad8YnYUsP/W+nw1Y4z/zX1yOVyhq4YnEsMdVn/VEsaSAcFafmXzaoRYcUcL
	nppQPdZT3cRY46wwtBMGFSQonyEYXFElA/87A8cqVDK3cogFwiokjiXqFpEmNOjPkp60+zmG6Zx
	WZ2ywigyoUcKb548J89QDb2iC8A==
X-Google-Smtp-Source: AGHT+IHzdgJCdBOe5f51v9BfhJeduP2MKryKFQE+tj3FZojFtyNm/Wv+bOouQTctgWKdWzwI//4zpw==
X-Received: by 2002:a05:6808:1b8e:b0:403:3660:412f with SMTP id 5614622812f47-404d87fe42cmr14605026b6e.25.1747833302026;
        Wed, 21 May 2025 06:15:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff? ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98cbbfesm2137735b6e.41.2025.05.21.06.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:15:01 -0700 (PDT)
Message-ID: <be02b9cd-803c-4aae-9420-ff3bf445efc1@baylibre.com>
Date: Wed, 21 May 2025 08:14:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pwm: adi,axi-pwmgen: add external clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
 <20250520-pwm-axi-pwmgen-add-external-clock-v1-2-6cd63cc001c8@baylibre.com>
 <20250521-tidy-heron-of-genius-4dc9a1@kuoka>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250521-tidy-heron-of-genius-4dc9a1@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 5:09 AM, Krzysztof Kozlowski wrote:
> On Tue, May 20, 2025 at 04:00:45PM GMT, David Lechner wrote:
>> Add external clock to the schema.
>>
>> The AXI PWMGEN IP block has a compile option ASYNC_CLK_EN that allows
>> the use of an external clock for the PWM output separate from the AXI
>> clock that runs the peripheral.
>>
>> In these cases, we should specify both clocks in the device tree. The
>> intention here is that if you specify both clocks, then you include the
>> clock-names property and if you don't have an external clock, then you
>> omit the clock-names property.
>>
>> There can't be more than one allOf: in the top level of the schema, so
>> it is stolen from $ref since it isn't needed there and used for the
>> more typical case of the if statement (even though technically it isn't
>> needed there either at this time).
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  .../devicetree/bindings/pwm/adi,axi-pwmgen.yaml    | 26 ++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>> index bc44381692054f647a160a6573dae4cff2ee3f31..90f702a5cd80bd7d62e2436b2eed44314ab4fd53 100644
>> --- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
>> @@ -16,8 +16,7 @@ description:
>>  
>>    https://analogdevicesinc.github.io/hdl/library/axi_pwm_gen/index.html
>>  
>> -allOf:
>> -  - $ref: pwm.yaml#
>> +$ref: pwm.yaml#
>>  
>>  properties:
>>    compatible:
>> @@ -30,7 +29,13 @@ properties:
>>      const: 3
>>  
>>    clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: axi
>> +      - const: ext
>>  
>>  required:
>>    - reg
>> @@ -38,11 +43,24 @@ required:
>>  
>>  unevaluatedProperties: false
>>  
>> +allOf:
>> +  - if:
>> +      required: [clock-names]
> 
> 
> No, don't do that. If you want clock-names, just add them for both
> cases. Otherwise, just describe items in clocks and no need for
> clock-names.

Would it be OK then to make clock-names required and just let the
driver still handle one clocks, no clock-names for backwards compatibility?

> 
> 
> 
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +    else:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +
>>  examples:
>>    - |
>>      pwm@44b00000 {
>>          compatible = "adi,axi-pwmgen-2.00.a";
>>          reg = <0x44b00000 0x1000>;
>> -        clocks = <&spi_clk>;
>> +        clocks = <&fpga_clk>, <&spi_clk>;
> 
> What was the clock[0] before? Axi, right, so SPI_CLK. Now FPGA is the
> AXI_CLK? This feels like clock order reversed.

The problem being fixed here is that since there was only one clock in
the binding, existing .dts files have either have the spi_clock or
the FPGA/AXI clock. So the one clock could be either and there are
existing .dtbs out in the world with both cases.

But we could consider reversing this so that if someone uses the new
bindings with an old kernel, then it would still work.

> 
> Best regards,
> Krzysztof
> 

