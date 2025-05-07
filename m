Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9C221D80
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605130; cv=none; b=uaSfHsvE2iaDXDdFxwfsoKiEvZ80Vmu3pjh9tbJIKaPtlaD1xK+W2FndP9D02ieBh/pPoUylusjwNluF5lOa8vtunmcnu2iXJTzKZkGarDCseutm3WE0BrpCWNE7Tp74mlMIh61GISHgamf0LXJl9j4z3NdJpVOsCaDvQ0YzzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605130; c=relaxed/simple;
	bh=nuE10YXTP2AEEebcF9P03Yz7YE72bjtBs/GDG5t5Z+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wy2Rk3OGSlEKOu6O78ObhQB8Le/HViaMVV1tmZ3+ysolw1t4vX1SfD0rOK0u2PWHE+Bcq2wKVt2HparBPzTOuUH6WqgogTWag2sCvz08s4yrmj5yUgs0vKbWS5e+aP+c2Vzw4CYCL+bozZmGBFWp+IAxW2VuvdiE7Q48EK6wN9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uCZmD-0006r1-RL; Wed, 07 May 2025 10:05:13 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uCZmD-001WaU-1R;
	Wed, 07 May 2025 10:05:13 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uCZmD-008QHT-0y;
	Wed, 07 May 2025 10:05:13 +0200
Date: Wed, 7 May 2025 10:05:13 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	Alvin =?iso-8859-15?Q?=A6ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <aBsUObKHmJkBFN04@pengutronix.de>
References: <20250430-clk-cdce6214-v4-0-9f15e7126ac6@pengutronix.de>
 <20250430-clk-cdce6214-v4-2-9f15e7126ac6@pengutronix.de>
 <3ba53493700561923c4ea9ab53a1a272@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ba53493700561923c4ea9ab53a1a272@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mon, May 05, 2025 at 10:50:49AM -0700, Stephen Boyd wrote:
> Quoting Sascha Hauer (2025-04-30 02:01:35)
> > diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > new file mode 100644
> > index 0000000000000..d4a3a3df9ceb9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> > @@ -0,0 +1,155 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI CDCE6214 programmable clock generator with PLL
> > +
> > +maintainers:
> > +  - Sascha Hauer <s.hauer@pengutronix.de>
> > +
> > +description: >
> > +  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
> > +  Two Inputs, and Internal EEPROM
> > +
> > +  https://www.ti.com/product/CDCE6214
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,cdce6214
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 1
> > +    items:
> > +      enum: [ priref, secref ]
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +patternProperties:
> > +  '^clk@[0-1]$':
> > +    type: object
> > +    description:
> > +      optional child node that can be used to specify input pin parameters. The reg
> > +      properties match the CDCE6214_CLK_* defines.
> 
> Presumably the EEPROM is typically used to configure all this stuff? Do
> you actually need to program this from the kernel, or are you
> implementing all this for development purposes?

The EEPROM could be used to configure this. I don't know if the final
product will have the EEPROM programmed, but even if it is, should we
make this mandatory?

Speaking of the EEPROM I think we should make sure that the pin
configuration in the device tree is optional so that we do not overwrite
settings from the EEPROM if it contains valid values.

> > +        enum: [ cmos, lvds, lp-hcsl ]
> > +        description:
> > +          Clock input format.
> 
> Is it "Clock output format"?

Yes.

> 
> > +
> > +      ti,cmosn-mode:
> > +        enum: [ disabled, high, low ]
> > +        description:
> > +          CMOSN output mode.
> > +
> > +      ti,cmosp-mode:
> > +        enum: [ disabled, high, low ]
> > +        description:
> > +          CMOSP output mode.
> 
> Would 'disabled' be the absence of the property? I think we could just
> have ti,cmosn-mode = <0> or <1> for low or high.

Yes. I think we can do that.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        clock-generator@67 {
> > +            compatible = "ti,cdce6214";
> > +            reg = <0x67>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            #clock-cells = <1>;
> > +            clocks = <&clock_ref25m>;
> > +            clock-names = "secref";
> > +
> > +            clk@1 {
> > +                reg = <1>; // CDCE6214_CLK_SECREF
> > +                ti,clkin-fmt = "xtal";
> > +                ti,xo-cload-femtofarads = <4400>;
> > +                ti,xo-bias-current-microamp = <295>;
> > +            };
> > +
> > +            clk@3 {
> > +                reg = <3>; // CDCE6214_CLK_OUT1
> > +                ti,clkout-fmt = "cmos";
> > +                ti,cmosp-mode = "high";
> > +                ti,cmosn-mode = "low";
> > +            };
> > +
> > +            clk@4 {
> > +                reg = <4>; // CDCE6214_CLK_OUT2
> > +                ti,clkout-fmt = "lvds";
> > +            };
> > +
> > +            clk@6 {
> > +                reg = <6>; // CDCE6214_CLK_OUT4
> 
> Can you use the defines instead of numbers so we know they're the same?

Yes, I could and have done that, but Krzysztof objected to it here:
https://lore.kernel.org/all/5766d152-51e7-42f5-864f-5cb1798606a3@kernel.org/

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
