Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2731C28E7;
	Wed, 18 Jun 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261527; cv=none; b=UGtuzFVaOHD5qiDYIDvowwfD3kp0/ZGnAZX4zS7WwEPx38zF1kYD7D4j++SDQK5eYSYBE7/Iqrv77j23Wg7GQXXU+KBRN8B5DU5/yIDLX0iKS+eLud5pXmYe3tS/ERGAzok23bfwlQAFxe5wVl53b2mPzJHkCtDWc09Q49bCUTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261527; c=relaxed/simple;
	bh=5W7CTB6fN0Bk5b5TSH6OLzvxLTr6qVWZg8NY4tnVae8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy0/DbT76+HCvp23eTREpLdYx1S4QQe7g4DDX4dsZO2YBDEqZ/BW5eOgcZuO0k/+kHogq5dFgZXZtI/HZCoPVXOCBDx+ccDGiPxoyboboCnqdCZkpBJWYKS4TcCQtGiWaHHB4rtuZdsf7Qs3efN8+gT5MGTFuGRTzfxpyOaInkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNOme2Mw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNOme2Mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAE9C4CEF0;
	Wed, 18 Jun 2025 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261526;
	bh=5W7CTB6fN0Bk5b5TSH6OLzvxLTr6qVWZg8NY4tnVae8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GNOme2Mw/woOHUVItps8VOYvmDWCcced7eB0N2ojQfs80zt5Lo3WfwSVxzgDz2gtD
	 MUIQsU252WABQh9ha08jGfXNq6iWllajutlAFLyGZnZUTZUA7aiBuKXNxAJxno1t8Z
	 SYzX4c5iVyvTgdAlWQU+8iX1nJyF/gFHbU3asIWcndYZGDiuLX0OF1sHIPmh/gRjTK
	 mIxnVzpZg9jH99RfvB/ZLwWacQOKgsGhipMC946QlkQHaXLyEeGnfqosflB/ZblP9c
	 +Setsff35tektT2VuMowGRisz1VW9qTbL6lN4IsmApXx5areReyU3rvlHCU0Lpb8TD
	 u2YNbJKTEuABA==
Message-ID: <9260c217-9c63-4eec-854a-a7ec020d1e65@kernel.org>
Date: Wed, 18 Jun 2025 17:45:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
 <20250618-visionary-hawk-of-success-d4aab8@kuoka>
 <ymmn2jgpa4bia2wl4d32ccipybxt4nylz4hspdf2svivk5ao7s@vv7v3soq2e65>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ymmn2jgpa4bia2wl4d32ccipybxt4nylz4hspdf2svivk5ao7s@vv7v3soq2e65>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 14:15, Jorge Marques wrote:
>>>
>>> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
>>> ---
>>>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
>>>  MAINTAINERS                                        |  5 ++
>>>  2 files changed, 68 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
>>
>> Filename based on the compatible, so adi,i3c-master-1.00.a.yaml
>>
> I agree, but I ended up following the pattern for the other adi,
> bindings. I will move for v4. IMO the version suffix has no much use
> since IP updates are handled in the driver.

Filename is not related to whether given ABI works with every device.
Filename helps us to organize bindings and existing convention is that
we want it to follow the compatible.

>>> @@ -0,0 +1,63 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Analog Devices I3C Controller
>>> +
>>> +description: |
>>> +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
>>> +  implementing a subset of the I3C-basic specification.
>>> +
>>> +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
>>> +
>>> +maintainers:
>>> +  - Jorge Marques <jorge.marques@analog.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: adi,i3c-master-1.00.a
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>
>> Why?
>>
> The IP core requires a clock, and the second is optional.

OK

> minItems sets the minimum number of required clocks and the maxItems is
> inferred from the number of items.
> 
> On the IP core itself, one clock is required (axi), and if it is the
> only provided, it means that the same clock for the AXI bus is used
> also for the rest of the RTL logic.

Hm? What does it exactly mean - same clock? You mean one clock is routed
to two pins? That's still two clocks. Or you mean that IP core will
notice grounded clock input and do the routing inside?

> 
> If a second clock is provided, i3c, it means it drives the RTL logic and is
> asynchronous to the axi clock, which then just drives the register map logic.
> For i3c specified nominal speeds, the RTL logic should run with a speed of
> 100MHz. Some FPGAs, such as Altera CycloneV, have a default bus clock speed of
> 50MHz. Changing the bus speed is possible, but affects timing and it may not be
> possible from users to double the bus speed since it will affect timing of all
> IP cores using the bus clock.
>>> +    items:
>>> +      - description: The AXI interconnect clock.
>>> +      - description: The I3C controller clock.
> I will update the descriptions to:
> 
>         - description: The AXI interconnect clock, drives the register map.
>         - description: The I3C controller clock. AXI clock drives all logic if not provided.
> 
>>> +
>>> +  clock-names:
>>
>> Not synced with clocks.
>>
> I will add `minItems: 1`.
>>> +    items:
>>> +      - const: axi
>>> +      - const: i3c
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +
>>> +allOf:
>>> +  - $ref: i3c.yaml#
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i3c@44a00000 {
>>> +        compatible = "adi,i3c-master";
>>> +        reg = <0x44a00000 0x1000>;
>>> +        interrupts = <0 56 4>;
>>
>> Use proper defines.
>>
> The following can added:
> 
>   #include <dt-bindings/interrupt-controller/irq.h>
> 
>   interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
> 
> Is there any other to be replaced?

Usually 0 has a meaning as well. Where is this used DTS snippet used (on
which platform)?

Best regards,
Krzysztof
