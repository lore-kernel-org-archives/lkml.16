Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14AC1E1E06;
	Mon, 31 Mar 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430516; cv=none; b=PPkP1AIcU91R9Oy83CxXFqc0z3TMXqw9h8rojbJR310ZZSkWeZ/YVOtYLtp0QU+pXQFt4PLYwRzTESEzVyp+nISHNQrM7oiZy0YZYVAVoNYn5eZr7RSOMf6LOjeXV5FZTzzCadiXEx4exMPsXG39Nz4nPfqHex23KrLLhDwfWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430516; c=relaxed/simple;
	bh=uEsdbJUqOkrFSbjOqdZnQjQQ9sHHKkcXorShOx3KN0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfSZtoumFnTi+nYDcU81TCeVNbaxIWDaxVWLzYAi4jKFLWpMWHdGaWdUFhB8zthZUdT/9zC3DUEDrHvJs/mxV40GkfNquuOnLj++YFf0f3zcYDMsDfR55aBTqaqqvx1rOasmPvqEqYUvk4bUGS10rYo7lqOiDVP3hpaeS/5mlFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjK6+MCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjK6+MCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE160C4CEE3;
	Mon, 31 Mar 2025 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430515;
	bh=uEsdbJUqOkrFSbjOqdZnQjQQ9sHHKkcXorShOx3KN0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjK6+MCLrmXzbGsvRCDsKmQmzOLxXC4QRdJFEljBPGIbNpT5oC3CSykSgvjqOHCIe
	 IgrsIDMdDZOfHVea30JUefM2UKuLWYYgipTCpApx8sKwTNYsYasv4n/SYX5bfl/WLs
	 VFzQZy8HiajT5BL+VS3W3idqRQoerbOF+6V4+LRm7+Csz9pkkSjtQn4vTCioFjstB/
	 EMAuSIHMtvI7QDA0U44PRnSafNXnHxBCcRT1Xz3hzSAVZeGaXhLKsP6gyn4p+YSd3X
	 wwbG6O6Ptps/tY1AqFwI/LvLQQsyCHEWK3+Er40iRmYw73cjzsbidJgMDyW8F9LdD/
	 rI8NCcbAc1v5Q==
Date: Mon, 31 Mar 2025 09:15:13 -0500
From: Rob Herring <robh@kernel.org>
To: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <20250331141513.GA2684092-robh@kernel.org>
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

On Fri, Mar 28, 2025 at 02:34:11PM +0200, Mihalcea Laurentiu wrote:
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
> 
> >
> >> +
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
> 
> we don't atm. We're relying on the default configuration.

Then you don't really need the property at all. However, if you ever 
need the non-default and configure it, adding it or changing it later is 
an ABI issue. So better to define it correctly sooner rather than later.

> 
> 
> we don't have any APIs for AC configuration so I left the
> 
> cell number to 0 thinking that the cell number might depend
> 
> on the API.
> 
> 
> if need be, I can set it to the value I was initially thinking of in v4.
> 
> 
> >
> >> +
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
> 
> bus-relative addresses for the child devices. This wasn't my intent.
> 
> 
> I wonder if we could just switch to V2 in which we just use the bridge's AC
> 
> configuration space and an empty 'ranges':
> 
> 
> aips5: bus@30df0000 {
> 
>     compatible = "fsl,imx8mp-aipstz";
> 
>     reg = <0x30df0000 0x10000>;
> 
>     /* some more properties here */
> 
>     ranges;
> 
> };
> 
> 
> or as Marco just suggested use
> 
> 
> ranges = <0x30c00000 0x30c00000 0x400000>;
> 
> 
> instead of an empty 'ranges' to restrict the bus size.
> 
> 
> Personally, I'm fine with both approaches but what's your opinion on this?

The latter restricting the size is my preference.

Rob
