Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09F1E9B39;
	Tue, 11 Feb 2025 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260224; cv=none; b=riBDfpzkhepwHwAxJ2svaYYnrM/iR6CSKmMQQ967x3B6SZ8Uh4cg0FALfn4tQnRqvDJg0sSyjMxb1TuqCdBKvaxSqUUUHe3SrdPdk46WApF0aqiHyca2jLynpnRkTk0wIHzt1uEKVoOq0M4TLLScYJVc7W5brbGPYRGNbDc2rLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260224; c=relaxed/simple;
	bh=EF1TKhjntnzy3W5RYekoNWTXsY1QRykYaRxSzp7OJ94=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qEVhUn/WwnW86HbMHitYTH23OXkuXvHovsxCSk3k2I2LbZAZSuwys2v1AssYFCtLSHjEvdQUnGZEPV0JjSbpwH0iI+3B8TUltQP4k0xu/63BcP3M1pDe6gC5B1fOKYg2PC2OYHvpmnv4oPJOgq22rQJehWVglWd78c12NtJs05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB87xESB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB87xESB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F0CC4CEDD;
	Tue, 11 Feb 2025 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739260224;
	bh=EF1TKhjntnzy3W5RYekoNWTXsY1QRykYaRxSzp7OJ94=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gB87xESBUQtg3OTfLiVUbAOJY3GWxWeQYzco4QfapW38Yq6WPIM9S+znxkRFd+pdp
	 DXZ8C2ggw04AB16w8oJ9R1whXfgcd1/CY5yT/fbGKGJWu87iYjtOZ2DjJiQMIPq9yt
	 ayVbtwHnvufaofEV31KO7t4JQ+FdxQgLVhZUdN5WVouDw4Ws3mkwx/uOqF5k11y0ZV
	 QKkh56aG8mowoWklhYCLD41PdT9Qpbo4W7oNqbS/HByhmFpUXEYb48tdE+bBD4GOff
	 eEgTVoc4L6HaRqeFJsl1lmTdHhNOmCDSgMFLBcDM8VsBaVKWiB0mn3/6U0VQ2fgMO4
	 yonNaC5271QQg==
Message-ID: <7fa40597-ebc8-495e-885f-ff2c6b80d5e7@kernel.org>
Date: Tue, 11 Feb 2025 08:50:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-9-ada@thorsis.com>
 <8e9562c8-5c01-4b5c-b2b0-4dad3d16e7a8@kernel.org>
 <20250211-primer-epic-d07bc3752569@thorsis.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250211-primer-epic-d07bc3752569@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/02/2025 08:05, Alexander Dahl wrote:
> Hello Krzysztof,
> 
> Am Mon, Feb 10, 2025 at 05:59:52PM +0100 schrieb Krzysztof Kozlowski:
>> On 10/02/2025 17:44, Alexander Dahl wrote:
>>> The OTPC requires both the peripheral clock through PMC and the main RC
>>> oscillator.  Seemed to work without explicitly enabling those clocks on
>>> sama7g5 before, but did not on sam9x60.
>>>
>>> Older datasheets were not clear and explicit about this, but recent are,
>>> e.g. SAMA7G5 series datasheet (DS60001765B),
>>> section 30.4.1 Power Management:
>>>
>>>> The OTPC is clocked through the Power Management Controller (PMC).
>>>> The user must power on the main RC oscillator and enable the
>>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>>> memory.
>>>
>>> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>     v2:
>>>     - new patch, not present in v1
>>>
>>>  .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>>> index 9a7aaf64eef32..1fa40610888f3 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>>> @@ -29,6 +29,16 @@ properties:
>>>    reg:
>>>      maxItems: 1
>>>  
>>> +  clocks:
>>> +    items:
>>> +      - description: main rc oscillator
>>> +      - description: otpc peripheral clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: main_rc_osc
>>
>> osc
> 
> On at91 SoCs main oscillator and main RC oscillator are two different
> things, and those are different clocks in Linux as well.  This clock
> is named "main_rc_osc" in the clock driver.  In

It does not matter, you could have 5 oscillators. This device takes one.
What is this clock from the point of view of device?

> drivers/clk/at91/sam9x60.c this clock is added like this:
> 
>     hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000, 50000000);
> 
> The datasheet makes it explicit, it's exactly the main rc oscillator
> clock required for the OTPC to work, no other clock.

You speak about source clock but this has to be the clock here, in the
device context.

> 
> So why name this "osc" only then?  This is confusing at best.
> 
>>
>>> +      - const: otpc_clk
>>
>> otpc or bus or whatever logically this is
> 
> Okay the "_clk" suffix is redundant.  Since the peripheral clock for
> the OTPC is required here, I would go with "otpc" only then.
> 
>>
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -37,6 +47,8 @@ unevaluatedProperties: false
>>>  
>>>  examples:
>>>    - |
>>> +    #include <dt-bindings/clock/at91.h>
>>> +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
>>>      #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
>>>  
>>>      otpc: efuse@e8c00000 {
>>> @@ -44,10 +56,26 @@ examples:
>>>          reg = <0xe8c00000 0xec>;
>>>          #address-cells = <1>;
>>>          #size-cells = <1>;
>>> +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
>>> +        clock-names = "main_rc_osc", "otpc_clk";
>>>  
>>>          temperature_calib: calib@1 {
>>>              reg = <OTP_PKT(1) 76>;
>>>          };
>>>      };
>>>  
>>> +  - |
>>> +    #include <dt-bindings/clock/at91.h>
>>> +    #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
>>> +    #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
>>> +
>>> +    efuse@eff00000 {
>>> +        compatible = "microchip,sam9x60-otpc", "syscon";
>>> +        reg = <0xeff00000 0xec>;
>>
>> No need for new example with difference in what exactly? Even compatible
>> was not added here...
> 
> Different compatible, different clocks, no sub nodes, different
> peripheral clock id …  From a human doc readers I'd like another

Clocks are the same. Their actual value does not matter.



Best regards,
Krzysztof
