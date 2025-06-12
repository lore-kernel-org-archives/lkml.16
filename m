Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567E26E717
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740624; cv=none; b=b6Oj74YnMBAUe++6215kJsAB9KmA1bMkBBu/9AWNHKu6ml57iCBNRCc05xY5ewPeCqX21tKzFGmG2gMrouklmn71YQOa36hSyW5VghCiwga/ifQYMn8BgKtbA970aJT8s4H+SlyJhgXquQp/j2EFFZW5p52xMO8DeJv+R0Ccnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740624; c=relaxed/simple;
	bh=HT0OPOWngJLYGraue4dv+E8G+K+QgCbixj7ubRpcOTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/Z+0wKJf8yuTyE2TfDW7iBOAyIcXy/7dEFe2STC4pYhluEFBpKbcAEj05pH2Tg8IkclgXOP+43QnBya2mW31j7KvrYbWuFmoVtI7Bo517LEPOIs1pXsxmBfVPH6cuJM5Y3oEiMFIsOjgkocsua0cv386Q/DlySE/ef8oyyFBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wKtI/wGf; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wKtI/wGf"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60b8a9be972so312280eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749740621; x=1750345421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CWX5K7cUh5q7+ZKZX3fft9+sBWTbcloK0NCvH6AyF8=;
        b=wKtI/wGfQ4n1DeeG2Z00cUSVW7upOwHN9Z3esgRFY1ny6kibGIw5gKGZJbzgMZWLQH
         riAasdI3mbxtIeWAtbjKqgCcKfXe5wGeKftX6dXSOl6bQdrmS2MnvdM/DiyGmZAV2+yX
         buXG/A2DCBR5qqL3Sh1auh4VARG3Mr3ehtX3WcjCq0Sdd0PXa8NXagJTeNmfao/RmEC2
         mZEYnwml946pUTI+3X5ZwGZUdbYRPQ08yNuBZHyXtdVQUNG0Q3q2A+AVN5OYInU+BzIe
         aPLfdHFrlRFaOvgS2cWLQ++MiY2KPWYjfHt6LvMb84GhZKXhTO7PB2/flkXP3W2fHdno
         Hc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740621; x=1750345421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CWX5K7cUh5q7+ZKZX3fft9+sBWTbcloK0NCvH6AyF8=;
        b=CrndNTZ9YlF7Ng0NGGYCEFrD5ALwpuywqDJ5kftUXav8IR4sls14eTNYXz8E8sWlLc
         R0w1yHERWFOyTtSaE/borDlKRPpb8/PRSViPLo0ftsMKuxkrYW7NZMwmXsZpF2OqtshI
         afJAaaBdPon5/5ybnHaQACy2uswr8//QbvDnHFoNw5TO9c/CQZ3VMH2iRfZnkHtbtr0k
         ABlBhsep0jphVoW8kiP0QWyEW+HuhjgMSR3OuYMgfPV8gHxIPb1Ravco/1HAMs4kksLk
         S0b47dOhOALJsG463nD8/dHasd+5LvBcwi98qM9l5Iyecz4yNLw8EED4blcJfQZXaaSb
         KiuA==
X-Forwarded-Encrypted: i=1; AJvYcCViJsZCu7SN+3Npu+HlssFTqZMc0+opKaQ89cqYAYAtSK+vAPX8Wgj81ANbn7WjGFUwTE3DnQrUlvhYEXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiAH2MAjIuXSIMOS4lHCkQfTQH/1pLSRyhXOyFtrNNS4uWJJnN
	tKIq4f0lRVirAOQUkBWoczxk0dh5518cb11AE2+bMC3bSQEu0patLpfDbbsLwA/8vMg=
X-Gm-Gg: ASbGnctRWdp3H+lXGl3Tjxq/OkEh5Phgbhz7s/NHNKV7MXoRAW8lHoKD3LNDtf0ueSl
	Yu9xfcElyHErhQApa/OA9vE5+ttqmTZS4DGR8gWh7PDTqhyqEIqgF+XvvQQayrumUVdLayxQspQ
	qHUqnWzI3yheyQlMUT+KeWxqhgquzqcY17cklKRgUS1cIq0yCDYehu1X34xDM78sqk/EiueqreV
	ZpgZpd/PRBUOH2zxHbIWBFwzdcKD0hDzHsJy/sweVnlNoza8tS+tix2A3cp9nzj2v/8x6UWcixu
	t2EDruXsTlX/NuhPdWxK1qvCXlKCCw5j93K9SCf6N/GA/v2IXWMXRXYFq6rdzeNinL+HMW+65dc
	dXS7QfPDj8H6kNmfbXPCEXGrNmhXTqINa4b0aDt8=
X-Google-Smtp-Source: AGHT+IHPsllSyEnOVWrSdTMtSNh/JbEncApgsNcq4KhwIS/LyDsZLEXq3MJMsM7IZl//e0XvwhL3zw==
X-Received: by 2002:a05:6820:216:b0:610:fbf2:bd7d with SMTP id 006d021491bc7-610fbf2c05emr2541424eaf.6.1749740620626;
        Thu, 12 Jun 2025 08:03:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-610fd4fbe3asm207044eaf.28.2025.06.12.08.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:03:39 -0700 (PDT)
Message-ID: <ef0d4038-b665-4ef0-9e7b-7ad2ce154c50@baylibre.com>
Date: Thu, 12 Jun 2025 10:03:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dt-bindings: iio: adc: Add adi,ad4052
To: Jorge Marques <gastmaier@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20250610-iio-driver-ad4052-v3-0-cf1e44c516d4@analog.com>
 <20250610-iio-driver-ad4052-v3-2-cf1e44c516d4@analog.com>
 <20250611181818.14d147c7@jic23-huawei>
 <xqkr3rq6ikuiz5wcbxmto4gp7wnccmmogklf2ux2edauotufim@pcuhddxdzjxi>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <xqkr3rq6ikuiz5wcbxmto4gp7wnccmmogklf2ux2edauotufim@pcuhddxdzjxi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 5:11 AM, Jorge Marques wrote:
> On Wed, Jun 11, 2025 at 06:18:18PM +0100, Jonathan Cameron wrote:
>> On Tue, 10 Jun 2025 09:34:35 +0200
>> Jorge Marques <jorge.marques@analog.com> wrote:
>>

...

>>> +  trigger-sources:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    description:
>>> +      Describes the output pin and event associated.

trigger-sources would be an input pin connected to an external trigger.
For example, the CNV pin could be connected to a trigger-source
provider to trigger a conversion. But there aren't any other digital
inputs, so I don't know what the 2nd source would be here.

As an example, see [1]. We could potentially use the same gpio
trigger-source for the conversion pin here. There is already
a similar binding for pwm triggers, so we could drop the separate
pwms binding as well an just have a single trigger-sources
property for the CNV pin that works for both gpio and pwm.

[1]: https://lore.kernel.org/linux-iio/cover.1749569957.git.Jonathan.Santos@analog.com/

>>> +
>>> +  "#trigger-source-cells":
>>> +    const: 2
>>> +    description: |
>>> +      Output pins used as trigger source.
>>> +
>>> +      Cell 0 defines the event:
>>> +      * 0 = Data ready
>>> +      * 1 = Min threshold
>>> +      * 2 = Max threshold
>>> +      * 3 = Either threshold
>>> +      * 4 = CHOP control
>>> +      * 5 = Device enable
>>> +      * 6 = Device ready (only GP1)
>>
>> Hmm. I'm a bit dubious on why 'what the offload trigger is'
>> is a DT thing?  Is that because the IP needs to comprehend
>> this?  I guess only data ready is actually supported in
>> practice? 
> 
> A trigger can be connected to trigger something other than a spi
> offload, it is in the DT because it describes how the device is
> connected. When using spi offload, the trigger-source at the spi handle
> describes which gpio and event is routed to the offload trigger input.
> At the ADC node, trigger-source-cells describe the source gpio and event
> for the device driver.
> 
> In practice, in this series, one gpio is Data ready, triggering offload
> when buffer enabled, and raw reads, when disabled. And the other is
> Either threshold, propagated as an IIO event. Fancy logic can be added
> to the driver in future patches to allow other combinations.
> 
> It is also worth to mention that the trigger-source is duplicated for
> each node that uses it, as seen in the second dts example:
> 
>    &adc AD4052_TRIGGER_EVENT_DATA_READY AD4052_TRIGGER_PIN_GP1
> 
> Is repeated on both adc and spi node.

That sounds wrong. This would only make sense if an output of the
ADC was wired back to itself. 

> 
> One last thing, on the driver, for v3, I should handle -ENOENT:
> 
>   ret = of_parse_phandle_with_args(np, "trigger-sources",
>   				   "#trigger-source-cells", i,
>   				   &trigger_sources);
>   if (ret)
>   	return ret == -ENOENT ? 0 : ret;
> 
> To assert only when present, since the nodes are not required.
> Or, in the driver,
> require AD4052_TRIGGER_PIN_GP0 if irq_get_byname finds gp0, and
> require AD4052_TRIGGER_PIN_GP1 if irq_get_byname finds gp1?
> (I would go with the first option).
>>

,,,

>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/iio/adc/adi,ad4052.h>
>>> +
>>> +    spi {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        adc@0 {
>>> +            compatible = "adi,ad4052";
>>> +            reg = <0>;
>>> +            vdd-supply = <&vdd>;
>>> +            vio-supply = <&vio>;
>>> +            ref-supply = <&ref>;
>>> +            spi-max-frequency = <83333333>;
>>> +
>>> +            #trigger-source-cells = <2>;
>>> +            trigger-sources = <&adc AD4052_TRIGGER_EVENT_EITHER_THRESH
>>> +                                    AD4052_TRIGGER_PIN_GP0
>>> +                               &adc AD4052_TRIGGER_EVENT_DATA_READY
>>> +                                    AD4052_TRIGGER_PIN_GP1>;

This doesn't make sense for the reason given above. These outputs
aren't wired back to inputs on the ADC. They are wired to interrupts
on the MCU, which is already described below.

>>> +            interrupt-parent = <&gpio>;
>>> +            interrupts = <0 0 IRQ_TYPE_EDGE_RISING>,
>>> +                         <0 1 IRQ_TYPE_EDGE_FALLING>;
>>> +            interrupt-names = "gp0", "gp1";
>>> +            cnv-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
>>> +        };
>>> +    };
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/iio/adc/adi,ad4052.h>
>>> +
>>> +    rx_dma {
>>> +            #dma-cells = <1>;
>>> +    };
>>> +
>>> +    spi {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        dmas = <&rx_dma 0>;
>>> +        dma-names = "offload0-rx";

The dmas aren't related to the ADC, so can be left out of the example.

>>> +        trigger-sources = <&adc AD4052_TRIGGER_EVENT_DATA_READY
>>> +                                AD4052_TRIGGER_PIN_GP1>;
>>> +
>>> +        adc@0 {
>>> +            compatible = "adi,ad4052";
>>> +            reg = <0>;
>>> +            vdd-supply = <&vdd>;
>>> +            vio-supply = <&vio>;
>>> +            spi-max-frequency = <83333333>;
>>> +            pwms = <&adc_trigger 0 10000 0>;
>>> +
>>> +            #trigger-source-cells = <2>;
>>> +            trigger-sources = <&adc AD4052_TRIGGER_EVENT_EITHER_THRESH
>>> +                                    AD4052_TRIGGER_PIN_GP0
>>> +                               &adc AD4052_TRIGGER_EVENT_DATA_READY
>>> +                                    AD4052_TRIGGER_PIN_GP1>;

Same as above - the GP pins aren't wired back to the ADC itself.

>>> +            interrupt-parent = <&gpio>;
>>> +            interrupts = <0 0 IRQ_TYPE_EDGE_RISING>,
>>> +                         <0 1 IRQ_TYPE_EDGE_FALLING>;
>>> +            interrupt-names = "gp0", "gp1";
>>> +            cnv-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
>>> +        };
>>> +    };
