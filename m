Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228D2253E4;
	Wed,  9 Apr 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199707; cv=none; b=A2NpIRU8CcTRhQ8AyoBeCaUPVyt+fcnwetB0x2N8zgm+tXu++vqyLhHpN9ddFtrsQYREZJV3iWZbRJZN6fSSCr/KP9qbOc+a0zXiXxj9OTEriWVMVw9T1Lp1sBSy2SX3uKV52vv1NtZybzHtJjU+XgpZtYtNd0nyRSg79CIFTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199707; c=relaxed/simple;
	bh=U//h3f4QOY1rlXoPrBiMrxRuldRKyWDSs3J1rf1pRgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxcULpxkd4YFJe+4HdoK9kcJVYl9w07IlTwkgZnfDo80wvn7E0GiScR3mqEjUiH6nNIS5yGWRWk838epEHtxHgWjY5TWc+4qVG31+hCftjNRGOA0STJepH7SFdVHwJlTjL0COW7S4LbRYJJOjv0NxlkBUINnaahn55t/uv1yRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g49Oxm9R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g49Oxm9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC82C4CEE3;
	Wed,  9 Apr 2025 11:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744199706;
	bh=U//h3f4QOY1rlXoPrBiMrxRuldRKyWDSs3J1rf1pRgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g49Oxm9RBujcoGpZ8CaajqYxjE2qEzCotW7QNkZg61UfarvqbRY24OUEmfl6wYa+k
	 sbUskoulFKgxmeEUgnQON7xLrRYeP5ZbbbcKAYizXg0Ptou3Ch2SgXKm0bVsEfrLZG
	 j4zLWE1fuInWrquY+KSC8vQAVw4vtai6EksN8lKuhNjtPoVNTFfXCVLoocD/+9StLj
	 1uhXLOOI0aE75LvvgHg5CinNTcTMQt0nLF7PVBPyNxyw+J+yC+I95AQ3kXUMEJSNu8
	 Ac9rdFqXEORWZznKXqpWFxxUwW+rnoNNC7tYXMwa27PLOT02/w5DBwZOMiHJILGwku
	 HOqOKU/dWww3g==
Message-ID: <836ffc93-5df8-48fe-8b5a-8d9b0bfa2794@kernel.org>
Date: Wed, 9 Apr 2025 13:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add TI CDCE6214 binding
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
References: <20250409-clk-cdce6214-v2-0-40b25b722ecb@pengutronix.de>
 <20250409-clk-cdce6214-v2-2-40b25b722ecb@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250409-clk-cdce6214-v2-2-40b25b722ecb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 13:20, Sascha Hauer wrote:
> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
> the device tree binding for this chip.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 167 +++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
>  2 files changed, 191 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> index 0000000000000..957e40403100d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI CDCE6214 programmable clock generator with PLL
> +
> +maintainers:
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +
> +description:
> +  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
> +  Two Inputs, and Internal EEPROM
> +
> +  https://www.ti.com/product/CDCE6214
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,cdce6214
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 1
> +    items:
> +      enum: [ priref, secref ]
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#clock-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^clk@[0-1]$':
> +    type: object
> +    description:
> +      optional child node that can be used to specify input pin parameters. The reg
> +      properties match the CDCE6214_CLK_* defines.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          clock input identifier.
> +        minimum: 0
> +        maximum: 1
> +
> +      ti,clkin-fmt:
> +        description: |
> +          Clock input format. Available options are:
> +          0 LVCMOS
> +          1 XTAL
> +          2 Differential
> +        $ref: /schemas/types.yaml#/definitions/uint32

Drop, that's not string. Make it readable for DTS users.

> +        minimum: 0
> +        maximum: 2
> +
> +      ti,xo-cload-femtofarad:
> +        description:
> +          Selects load cap for XO in femto Farad (fF). Up to 9000fF
> +        $ref: /schemas/types.yaml#/definitions/uint32

Drop and use proper unit suffix from property-units in dtschema.


> +        minimum: 3000
> +        maximum: 9000
> +
> +      ti,xo-bias-current-microampere:
> +        description:
> +          Bias current setting of the XO.
> +        $ref: /schemas/types.yaml#/definitions/uint32

Ditto

> +        minimum: 0
> +        maximum: 1758
> +
> +  '^clk@[2-9]$':
> +    type: object
> +    description:
> +      optional child node that can be used to specify output pin parameters.  The reg
> +      properties match the CDCE6214_CLK_* defines.
> +
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          clock output identifier.
> +        minimum: 2
> +        maximum: 9
> +
> +      ti,clkout-fmt:
> +        description: |
> +          Clock input format. Available options are:
> +          0 CMOS
> +          1 LVDS
> +          2 LP-HCSL

Drop these three lines

> +        $ref: /schemas/types.yaml#/definitions/uint32

Drop, this is supposed to be string.
enum: [ cmos, lvds, lp-hcsl ]

> +        minimum: 0
> +        maximum: 2
> +
> +      ti,cmos-mode:
> +        description: |
> +          CMOS output mode. Available options are:
> +          0 disabled
> +          1 high polarity
> +          2 low polarity
> +          first array entry is for the CMOSP pin, second for the CMOSN pin
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 2
> +        maxItems: 2
> +        items:
> +          maximum: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-generator@67 {
> +            compatible = "ti,cdce6214";
> +            reg = <0x67>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #clock-cells = <1>;
> +            clocks = <&clock_ref25m>;
> +            clock-names = "secref";
> +
> +            clk@1 {
> +                reg = <1>; // CDCE6214_CLK_SECREF
> +                ti,clkin-fmt = <1>; // XTAL
> +            };
> +
> +            clk@3 {
> +                reg = <3>; // CDCE6214_CLK_OUT1
> +                ti,clkout-fmt = <0>; // CMOS
> +                ti,cmos-mode = <1 2>; // CMOSP = highpol, CMOSN = lowpol

Why do you need comments here? If you chosen magic numbers, it means
they are readable by themself. If you need comments, then it is a sign
they are not obvious and just go with the code I asked you - enum string.


Best regards,
Krzysztof
