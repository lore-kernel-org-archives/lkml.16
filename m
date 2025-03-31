Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687C198E76
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403346; cv=none; b=kCgZ4Zz3OCrKehYCzOqfXIpsrSygUZN60RKrxRRCeTjkiAT/RkMhRuArFnCgcPcQS+Jb/dCAD3GgzKkuOOY9gopKriTPgByohs1J4HBTL9mdF+njMeU4uqfPsy6L/6mynsdglZXeQB0moiZknFXAWpMatgAlne9bHwtOAvCf5c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403346; c=relaxed/simple;
	bh=0OwZaHWomvpAnIL+9eaYPpyuKhZ4WM7AghXgIC29O4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuB+pYp5hTFzfkoojzzelpFSNS3tlC1IJGcueYQlfyayr70IpsQChtxM0z3iQQbLjbKq0RAocaLh2irwbuEQvr5UimWeCFwJiifXi5IAxbjwRiYY1PKbEvE7hZXJjIXEL09u1wGei1FGBMsJZFqCsxoh7TN3GRBx1o2PCZ9WVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tz8qH-0007t0-Bo; Mon, 31 Mar 2025 08:41:53 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tz8qG-002Y6D-0Y;
	Mon, 31 Mar 2025 08:41:52 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tz8qG-00996M-06;
	Mon, 31 Mar 2025 08:41:52 +0200
Date: Mon, 31 Mar 2025 08:41:52 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
 <20250325032303.GA1624882-robh@kernel.org>
 <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-03-28, Mihalcea Laurentiu wrote:
> 
> On 25.03.2025 05:23, Rob Herring wrote:
> > On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> Add documentation for IMX AIPSTZ bridge.
> >>
> >> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> ---
> >>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
> >>  1 file changed, 107 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> >> new file mode 100644
> >> index 000000000000..c0427dfcdaca
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> >> @@ -0,0 +1,107 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
> >> +
> >> +description:
> >> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
> >> +  issuing transactions to IP Slave peripherals. Additionally, this module
> >> +  offers access control configurations meant to restrict which peripherals
> >> +  a master can access.
> > Wrap at 80 chars.
> 
> 
> fix in v4, thx
> 
> >> +maintainers:
> >> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx8mp-aipstz
> >> +
> >> +  reg:
> >> +    maxItems: 2
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: bus
> >> +      - const: ac
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 1
> >> +
> >> +  "#access-controller-cells":
> >> +    const: 0
> > With 0 cells, how do you identify which device it is?
> 
> we don't atm. We're relying on the default configuration.

I think Rob is speaking from DT API pov. What the driver is doing with
additional information is up to the driver.

> we don't have any APIs for AC configuration so I left the
> cell number to 0 thinking that the cell number might depend
> on the API.
> 
> if need be, I can set it to the value I was initially thinking of in
> v4.

Which is?

According the TRM it's a bit tricky to define the API since you need to
describe two different types:
 - master configuration
 - peripheral configuration

One which came up in my mind is:

  <&phandle TYPE ID VALUE>;

e.g.

  <&aipstz AIPSTZ_MASTER 0 0xf>;
  <&aipstz AIPSTZ_PERI 0 0xf>;

One could use a defien for the magic value of 0xf of course.

> >> +  ranges: true
> >> +
> >> +# borrowed from simple-bus.yaml, no additional requirements for children
> >> +patternProperties:
> >> +  "@(0|[1-9a-f][0-9a-f]*)$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +    properties:
> >> +      reg:
> >> +        items:
> >> +          minItems: 2
> >> +          maxItems: 4
> >> +        minItems: 1
> >> +        maxItems: 1024
> >> +      ranges:
> >> +        oneOf:
> >> +          - items:
> >> +              minItems: 3
> >> +              maxItems: 7
> >> +            minItems: 1
> >> +            maxItems: 1024
> >> +          - $ref: /schemas/types.yaml#/definitions/flag
> >> +    anyOf:
> >> +      - required:
> >> +          - reg
> >> +      - required:
> >> +          - ranges
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reg-names
> >> +  - power-domains
> >> +  - "#address-cells"
> >> +  - "#size-cells"
> >> +  - "#access-controller-cells"
> >> +  - ranges
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8mp-clock.h>
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +
> >> +    bus@30c00000 {
> >> +        compatible = "fsl,imx8mp-aipstz";
> >> +        reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
> > It doesn't look like you have any registers in the 1st entry, but they 
> > are child devices? Then you should use ranges and drop it here:
> >
> > ranges = <0x0 0x30c00000 0x400000>;
> 
> 
> I guess this would mean switching from global addresses (current way) to
> bus-relative addresses for the child devices. This wasn't my intent.
> 
> I wonder if we could just switch to V2 in which we just use the bridge's AC
> configuration space and an empty 'ranges':
> 
> aips5: bus@30df0000 {
>     compatible = "fsl,imx8mp-aipstz";
>     reg = <0x30df0000 0x10000>;
>     /* some more properties here */
>     ranges;
> };
> 
> or as Marco just suggested use
> 
> ranges = <0x30c00000 0x30c00000 0x400000>;
> 
> instead of an empty 'ranges' to restrict the bus size.
> 
> Personally, I'm fine with both approaches but what's your opinion on
> this?

Switching from a global addressing to a local one is not favourable IMHO
since NXP i.MX8M SoC TRMs are mention documenting all IPs with the
global addressing scheme. So yes either your v2 scheme or the one with
the limiting site but keeping the 1:1 mapping. Sorry again for the
ping-pong, wasn't that clear to me until now.

Regards,
  Marco

> >> +        reg-names = "bus", "ac";
> >> +        power-domains = <&pgc_audio>;
> >> +        #address-cells = <1>;
> >> +        #size-cells = <1>;
> >> +        #access-controller-cells = <0>;
> >> +        ranges;
> >> +
> >> +        dma-controller@30e00000 {
> >> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> >> +            reg = <0x30e00000 0x10000>;
> >> +            #dma-cells = <3>;
> >> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> >> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
> >> +            clock-names = "ipg", "ahb";
> >> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> >> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> > No 'access-controllers' here?
> 
> 
> no need for that unless the child wants to request a specific AC
> configuration for itself.
> 
> 
> >
> >> +        };
> >> +    };
> >> -- 
> >> 2.34.1
> >>
> 
