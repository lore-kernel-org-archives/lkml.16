Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BA820B7FC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106473; cv=none; b=pJE9RVaNyb3nx6WF3fy5X03qgv91OtbT3qa7Xe8xoo2BH3kRcjv7vUNZRbD0GV03qVIbi8kN9SrIZ8VuMXfCLteu4sjcFyHdZeAG8tMC8Mka0xWGh8qja5ZXEgsI1loIp7nTV3M/CQ9VxCloXWy6fiffE39dDWWhkxI4+Lfr/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106473; c=relaxed/simple;
	bh=I1ADj1YYA/0P9VYww4mRdxVOFiO6OjCF4bRvlcPDmRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LT0oqUmqXwlllU614kFfheiEgjXcKTkod5XY7rokmx7Si/RttL1g7d7cgRLLujARH7XxBvLYrGc4aUJ/xqWSAsomxgXy7fOA04b1kv4vBLOaO3zWtndDI1BfXr1Ab8cnLxRGwxtio9rLHQmP+4p0uO1oqun1QgY3ieYoYjRBkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XuHMbROX; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XuHMbROX"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-735a53ef4feso3033241a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750106470; x=1750711270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=im5kNIHpg71oIpCldz19fuuBQyresJi1tem3UV0h1IQ=;
        b=XuHMbROXNaoCbeHPU9sw/Q84sLVt+xnwqOWM+u0WpJLZOyLBHz8Ka+3nl+JTxssMLG
         pmRCwu2PKecsy0rFNc2Jc28ZFQV5+Qia1uGB7to4uRzev/rykrj7ruQzpPwAJw5dsrB9
         av5eemvB8fzUtIk6R1+P8Y2sZMEAhSF8ZGpgjDvGZt5c02ey/YUBOdlKwG7sU2Xl6TWn
         yq2ALoVYhpDWYONEzjrkUO9Tbql9d40V8sFzXKs7yAaFtK4cw1mMG6npFhII1WORQbd7
         ZqIq6jkxNEWa0zfLrKGFWSGz3lHB/2ztudXKJ6STpQS47CJhl0UN1Z6U0EbDr6hnMi6q
         oAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750106470; x=1750711270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=im5kNIHpg71oIpCldz19fuuBQyresJi1tem3UV0h1IQ=;
        b=Zx0aWE/fiyB9Pfs14QWyrVUj65Rr8ZkCvOaNWXwprYGE2kK/1HdpKuyomqy/XDsnoB
         QwKYAibVesNy7ocKWbE8p3lqPKwyH/rZiAN7Atfq5LksXGbwulSEvYNj2eDNvNpbSSNH
         dPymUqmo1xCD66W5Y0ykGN2ogRq2spwFkq4yYftjDRucFoRfC6CS/1jJSZ4yqW8uEhpY
         3UrCq5rqaSaivW3iWk7+V4lm0RoTwIgwiC0A6mcJdg6x/f3ZyPF7zwlNPMXAcWOMiAM0
         rLOEzXRT+fw1pbxYqccP6ETzRsrdxj/7oHMFITfWZdytTaQ4dxlfPAysmdVl6vDLi0BR
         Meew==
X-Forwarded-Encrypted: i=1; AJvYcCWJJba9rKqbU9n/ghk1cT/T0F8reMZkbN5bkp5aq9d4vAnC8M0LwXiMWbo96E3uB5D5B5WgXsN6gtmlnZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVCKX1+0DeVn73ttP5UEtqh21zxTapTX3F8/Xm6hMeCBH/YJF
	HS1Nm5vt6LI2Kbd2butQr4RrXxRVfF1XZAhaoV1xG9E1y27wZy9ougPObT7OoW6yA7o=
X-Gm-Gg: ASbGncvPK5AwSTlXCKg8EZ3PYjY9UZeH4iSNItzxCmxs2eM4Tl0GaqcCrwb2PjMZL/A
	ziEv4hVt3qsR33BzCcih1awSx+cD0G+pDpSvki2LySmYDBKpQWc7plC5E3gXlCNo2xtldKbM9CW
	0A67YsQwWzt6RnxRcc8XoTCTA/K4v+kSxqrTzMgt7gOSt3IzCCg0NxjDVBeDtrkhklrg+4AQfeM
	BG1cAR3UnZ4zXWKWTgJZ0It+9LAdoZcTx+gK3yc+Xpxuv6JbZKccCRsY9HXBipkaHbL0c8PhcZg
	SrktbLCXJ/l2rt/j2JbEUzb/UDtZbXWj1jfA9ozVWeMhRejLHQg7jLXPdPFWrYv0rbUtWcqKKDD
	tCPkHXnH6HmdhJCPKdwWozdDx6HFMTX73alfrE5d8JK9aqXc1mw==
X-Google-Smtp-Source: AGHT+IEsH+GjWx5DBPXhNJpG9GJzxKD3U06ehvPiNJ6zYbwHj4bcCVL5kJnMon+0twMR1UaMdanrvA==
X-Received: by 2002:a05:6830:2c06:b0:72c:320c:d898 with SMTP id 46e09a7af769-73a363f5a90mr6912233a34.22.1750106470433;
        Mon, 16 Jun 2025 13:41:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28402beesm1275336a34.19.2025.06.16.13.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:41:10 -0700 (PDT)
Message-ID: <eeb66815-3f7d-41fc-9d32-c28a3dda7749@baylibre.com>
Date: Mon, 16 Jun 2025 15:41:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] dt-bindings: iio: adc: Add AD4170
To: Conor Dooley <conor@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com
References: <cover.1749582679.git.marcelo.schmitt@analog.com>
 <4df9d4d0de83090300b6870afc8ae7b22279cd22.1749582679.git.marcelo.schmitt@analog.com>
 <20250616-neurology-explicit-ec2a829bd718@spud>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616-neurology-explicit-ec2a829bd718@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 10:41 AM, Conor Dooley wrote:
> On Tue, Jun 10, 2025 at 05:31:04PM -0300, Marcelo Schmitt wrote:
>> Add device tree documentation for AD4170 and similar sigma-delta ADCs.
>> The AD4170 is a 24-bit, multichannel, sigma-delta ADC.
>>
>> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
>> ---
>> Change log v4 -> v5
>> - Dropped interrupt maxItems constraint.
>> - Spelled out RC acronym in reference-buffer description.
>> - Require to specify interrupt-names when using interrupts.
>> - Added interrupt-names to the examples.
>> - Made adi,excitation-pin properties identical to adi,ad4130.
>> - Removed interrupt-parent props from the examples.
>>
>> Proposing new types and ways of describing hardware for weigh scale load cells
>> and related sensors external to ADCs can lead to potential better description of
>> how those components connect to the ADC. However, we must use what already
>> exists for properties documenting features that are the same across different
>> devices. 
>>
>> Maybe, we could use generic defs to define adi,excitation-current-n-microamp and
>> adi,excitation-pin and avoid repetition with those. Though, that triggers a
>> dt_binding_check warning. Also, having mixed notation (some prop declarations
>> using defines and others not) seems to not be desirable.
>>
>> It looks like the only option left is making adi,excitation-pin properties
>> identical to adi,ad4130.
>>
>> On one hand, dropping adi,excitation-pin defs and making those properties
>> identical to adi,ad4130 preserves their syntax and semantics accross
>> dt-bindings. OTOH, we end up with more text repetition in the doc.
>>
>>
>>  .../bindings/iio/adc/adi,ad4170.yaml          | 564 ++++++++++++++++++
>>  MAINTAINERS                                   |   7 +
>>  2 files changed, 571 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad4170.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4170.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4170.yaml
>> new file mode 100644
>> index 000000000000..e3249ec56a14
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4170.yaml
>> @@ -0,0 +1,564 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/adi,ad4170.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices AD4170 and similar Analog to Digital Converters
>> +
>> +maintainers:
>> +  - Marcelo Schmitt <marcelo.schmitt@analog.com>
>> +
>> +description: |
>> +  Analog Devices AD4170 series of Sigma-delta Analog to Digital Converters.
>> +  Specifications can be found at:
>> +    https://www.analog.com/media/en/technical-documentation/data-sheets/ad4170-4.pdf
>> +    https://www.analog.com/media/en/technical-documentation/data-sheets/ad4190-4.pdf
>> +    https://www.analog.com/media/en/technical-documentation/data-sheets/ad4195-4.pdf
>> +
>> +$ref: /schemas/spi/spi-peripheral-props.yaml#
>> +
>> +$defs:
>> +  reference-buffer:
>> +    description: |
>> +      Enable precharge buffer, full buffer, or skip reference buffering of
>> +      the positive/negative voltage reference. Because the output impedance
>> +      of the source driving the voltage reference inputs may be dynamic,
>> +      resistive/capacitive combinations of those inputs can cause DC gain
>> +      errors if the reference inputs go unbuffered into the ADC. Enable
>> +      reference buffering if the provided reference source has dynamic high
>> +      impedance output. Note the absolute voltage allowed on REFINn+ and REFINn-
>> +      inputs is from AVSS - 50 mV to AVDD + 50 mV when the reference buffers are
>> +      disabled but narrows to AVSS to AVDD when reference buffering is enabled
>> +      or in precharge mode. The valid options for this property are:
>> +      0: Reference precharge buffer.
>> +      1: Full reference buffering.
>> +      2: Bypass reference buffers (buffering disabled).
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2]
>> +    default: 1
> 
> Why make this property a uint32, rather than a string where you can use
> something like "precharge", "full" and "bypass" (or "disabled")? The
> next similar device could use something slightly different then the
> binding becomes pretty clunky.
> Can you explain why this is a dt property rather than something
> adjustable at runtime?
> 
> Otherwise, what you have here looks sane enough to me - but I'd like to
> see some comments from Jonathan or David etc about your approach to the
> excitation properties.

This looks like something that should be in the devicetree to me. For example
if the external reference supply is high impedance, buffering is pretty
much required. And using precharge is an application design choice to
reduce THD at the expense of other limitations.


> 
> Cheers,
> Conor.
> 
>> +
>> +properties:

...

>> +allOf:
>> +  # Some devices don't have integrated DAC
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - adi,ad4190
>> +              - adi,ad4195
>> +    then:
>> +      properties:
>> +        ldac-gpios: false
>> +
>> +  # Require to specify the interrupt pin when using interrupts
>> +  - if:
>> +      required:
>> +        - interrupts
>> +    then:
>> +      required:
>> +        - interrupt-names
>> +
>> +  # If an external clock is set, the internal clock cannot go out and vice versa
>> +  - oneOf:
>> +      - required: [clocks]
>> +        properties:
>> +          '#clock-cells': false
>> +      - required: ['#clock-cells']
>> +        properties:
>> +          clocks: false
>> +
>> +patternProperties:

...

>> +required:
>> +  - compatible
>> +  - reg
>> +  - avdd-supply
>> +  - iovdd-supply
>> +  - spi-cpol
>> +  - spi-cpha
>> +
>> +unevaluatedProperties: false
>> +

It would be more logical to place these before patternProperties (actually
really before allOf) so that they are close to the properties that they are
referencing.
