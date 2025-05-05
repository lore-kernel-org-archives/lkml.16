Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A319DF60;
	Mon,  5 May 2025 17:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467453; cv=none; b=ndW53PZLuH4Ihq+VXoKfYInNOACpz9Rg0fhlMBLj/8slLn3ySZefqKSDna8SnpQfa2edrVI1juNtsv3SRX7sh8rkrjkzF4kNETc9BwJw/bg8LEGcUGSqTDouFmcl9MjuspoA8r/Sy19Qjd7djI0pKACgs7lboDKM4EvP2TdGQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467453; c=relaxed/simple;
	bh=O3aCHavUvPQ34P/MbjVSyXDek1xOUjXgF1yQzrOLGv8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=gADjBLHPpmfPyRAvPkZxw/RJ+aKcCzya65LCaarnMzuN2IaIo9Cdse89wks5Z7ReCQpF1I+0mEZGVuqGFOUwRu50nzg1m7yzrEU91+H9K/zuZDQKg/Ey4gf7VC9kWrTLm1OISkktn0B3XcWfuwcDqXhT7y6qAJrn9Fvvpm4pmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK9mlt1d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK9mlt1d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3954C4CEE4;
	Mon,  5 May 2025 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746467452;
	bh=O3aCHavUvPQ34P/MbjVSyXDek1xOUjXgF1yQzrOLGv8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YK9mlt1dvWIMSdDtPD2B6Anmv/L87vyTU91z5vRrRvHUegqDD8jf7f855jZMZSJKG
	 stfBkplHvAdcZHldLV2mXsIW9lHheh43pqd8stO0fAKyztZmJCoNt4OBEMJteJVES/
	 1fdwtoX7yHD4fgFs5ecrBzkBjA2kuQElu/HEV1RbbMn96aquQpQNJ1HGxqFBaHTFZV
	 Njv6obxEt94x+1FEETYSA0qbKxDNF52cx02a2ovcJotMD7rsCK2L/tYOD9A9LP84GY
	 kl1qPG7ZuYnrZczUDkzBnd/M1P7rjSpnuXeZMyR9ccUUQPlxAtweHO+4IyvuLwd2lw
	 v0gIpJx1591kw==
Message-ID: <3ba53493700561923c4ea9ab53a1a272@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de> <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: add TI CDCE6214 binding
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, Sascha Hauer <s.hauer@pengutronix.de>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 May 2025 10:50:49 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Sascha Hauer (2025-04-30 02:01:35)
> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/D=
ocumentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> index 0000000000000..d4a3a3df9ceb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> @@ -0,0 +1,155 @@
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
> +description: >
> +  Ultra-Low Power Clock Generator With One PLL, Four Differential Output=
s,
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
> +      optional child node that can be used to specify input pin paramete=
rs. The reg
> +      properties match the CDCE6214_CLK_* defines.

Presumably the EEPROM is typically used to configure all this stuff? Do
you actually need to program this from the kernel, or are you
implementing all this for development purposes?

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
> +        enum: [ lvcmos, xtal, differential ]
> +        description:
> +          Clock input format.
> +
> +      ti,xo-cload-femtofarads:
> +        description:
> +          Selects load cap for XO in femto Farad (fF). Up to 9000fF
> +        minimum: 3000
> +        maximum: 9000
> +
> +      ti,xo-bias-current-microamp:
> +        description:
> +          Bias current setting of the XO.
> +        minimum: 0
> +        maximum: 1758
> +
> +  '^clk@[2-9]$':
> +    type: object
> +    description:
> +      optional child node that can be used to specify output pin paramet=
ers.  The reg
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
> +        enum: [ cmos, lvds, lp-hcsl ]
> +        description:
> +          Clock input format.

Is it "Clock output format"?

> +
> +      ti,cmosn-mode:
> +        enum: [ disabled, high, low ]
> +        description:
> +          CMOSN output mode.
> +
> +      ti,cmosp-mode:
> +        enum: [ disabled, high, low ]
> +        description:
> +          CMOSP output mode.

Would 'disabled' be the absence of the property? I think we could just
have ti,cmosn-mode =3D <0> or <1> for low or high.

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
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        clock-generator@67 {
> +            compatible =3D "ti,cdce6214";
> +            reg =3D <0x67>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            #clock-cells =3D <1>;
> +            clocks =3D <&clock_ref25m>;
> +            clock-names =3D "secref";
> +
> +            clk@1 {
> +                reg =3D <1>; // CDCE6214_CLK_SECREF
> +                ti,clkin-fmt =3D "xtal";
> +                ti,xo-cload-femtofarads =3D <4400>;
> +                ti,xo-bias-current-microamp =3D <295>;
> +            };
> +
> +            clk@3 {
> +                reg =3D <3>; // CDCE6214_CLK_OUT1
> +                ti,clkout-fmt =3D "cmos";
> +                ti,cmosp-mode =3D "high";
> +                ti,cmosn-mode =3D "low";
> +            };
> +
> +            clk@4 {
> +                reg =3D <4>; // CDCE6214_CLK_OUT2
> +                ti,clkout-fmt =3D "lvds";
> +            };
> +
> +            clk@6 {
> +                reg =3D <6>; // CDCE6214_CLK_OUT4

Can you use the defines instead of numbers so we know they're the same?

> +                ti,clkout-fmt =3D "lp-hcsl";
> +            };
> +        };
> +    };
