Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D3219E8;
	Fri, 27 Jun 2025 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992661; cv=none; b=oFeVCKkmhM9U6r3kAQMUaLfyQumZ67BJKsXOJ/aLxdy425mAcABO+ODPLANdAff80IE2aMgL8Wk7rcqUwqLMCDtVO5N3RTnzUKrcEpyDW+JTSAzW9FHRyPecL8i2k8G/RfRo7tjiH8g5OLDARiatGEbEaU0oElNwfNYlzCYNZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992661; c=relaxed/simple;
	bh=QvL56MYYAxGslKpHG6OIwVOATz5SpWV3LVwYEEaG8xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtpZ8tFPC2m1/0Mt3n775Gy7ftiutxYrN7Qog4Jpqkq0HIncefZcOPt94GLgAxidFRMZ+4KuzLIz1HVZOW1UdBh0ex/moOCi/eXVXyWRezm2GWv8weJdOspCh89fOTGUrsTf/lTL1XBc0I0BJHU9j+GtngNQMftFbd1k+9wQxGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhs+l2IP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhs+l2IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520CCC4CEEB;
	Fri, 27 Jun 2025 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992661;
	bh=QvL56MYYAxGslKpHG6OIwVOATz5SpWV3LVwYEEaG8xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhs+l2IPzVEfSqz+ZyLpUKmHpLk+PhU9q2xsNAknS98isbvCVCfFmxIADKanLz5Qf
	 xMKqCWdx4/9ROhJLSPkuwWK3MRa69cPRfsdjLQjJTaythSoHdIGCkk0mhcwtX6iAog
	 fOt9Y/chU0SgC16HOEkwGdGT56tIWuflmpiEI3WxYeHQd6bZ66JyucvoMkH0cPQwYc
	 Ov6emP8jKEsKpt5OHQG3GExWi3qtf2j0OKWgxCe2ItI4t5RzlJiOECKpq9Qh3301nD
	 4qGz4ZZAMS0kFE/FDIh+bOBCZcc9d9r/wm0TF7ZGNzigVUQNt+d+/jBcvacxTaRT1J
	 d2rNGMru/jS3g==
Date: Thu, 26 Jun 2025 21:51:00 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to yaml
 format
Message-ID: <20250627025100.GA1661037-robh@kernel.org>
References: <20250623202325.2468483-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623202325.2468483-1-Frank.Li@nxp.com>

On Mon, Jun 23, 2025 at 04:23:24PM -0400, Frank Li wrote:
> Convert lpc32xx-slc.txt to yaml format.
> 
> Additional changes:
> - add ref to nand-controller.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mtd/lpc32xx-slc.txt   |  52 ---------
>  .../bindings/mtd/nxp,lpc3220-slc.yaml         | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
> deleted file mode 100644
> index 39f17630a3011..0000000000000
> --- a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -NXP LPC32xx SoC NAND SLC controller
> -
> -Required properties:
> -- compatible: "nxp,lpc3220-slc"
> -- reg: Address and size of the controller
> -- nand-on-flash-bbt: Use bad block table on flash
> -- gpios: GPIO specification for NAND write protect
> -
> -The following required properties are very controller specific. See the LPC32xx
> -User Manual:
> -- nxp,wdr-clks: Delay before Ready signal is tested on write (W_RDY)
> -- nxp,rdr-clks: Delay before Ready signal is tested on read (R_RDY)
> -(The following values are specified in Hz, to make them independent of actual
> -clock speed:)
> -- nxp,wwidth: Write pulse width (W_WIDTH)
> -- nxp,whold: Write hold time (W_HOLD)
> -- nxp,wsetup: Write setup time (W_SETUP)
> -- nxp,rwidth: Read pulse width (R_WIDTH)
> -- nxp,rhold: Read hold time (R_HOLD)
> -- nxp,rsetup: Read setup time (R_SETUP)
> -
> -Optional subnodes:
> -- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
> -
> -Example:
> -
> -	slc: flash@20020000 {
> -		compatible = "nxp,lpc3220-slc";
> -		reg = <0x20020000 0x1000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		nxp,wdr-clks = <14>;
> -		nxp,wwidth = <40000000>;
> -		nxp,whold = <100000000>;
> -		nxp,wsetup = <100000000>;
> -		nxp,rdr-clks = <14>;
> -		nxp,rwidth = <40000000>;
> -		nxp,rhold = <66666666>;
> -		nxp,rsetup = <100000000>;
> -		nand-on-flash-bbt;
> -		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
> -
> -		mtd0@00000000 {
> -			label = "phy3250-boot";
> -			reg = <0x00000000 0x00064000>;
> -			read-only;
> -		};
> -
> -		...
> -
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> new file mode 100644
> index 0000000000000..db9cf4efb2212
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-slc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC NAND SLC controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-slc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specification for NAND write protect
> +
> +  nand-on-flash-bbt: true
> +
> +  partitions:
> +    type: object
> +    $ref: partitions/partition.yaml

That's not right... You want partitions.yaml?

> +    unevaluatedProperties: false
> +
> +  nxp,wdr-clks:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay before Ready signal is tested on write (W_RDY)
> +
> +  nxp,rdr-clks:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay before Ready signal is tested on read (R_RDY)
> +
> +  nxp,wwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Write pulse width (W_WIDTH) in Hz
> +
> +  nxp,whold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Write hold time (W_HOLD) in Hz
> +
> +  nxp,wsetup:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Write setup time (W_SETUP) in Hz
> +
> +  nxp,rwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Read pulse width (R_WIDTH) in Hz
> +
> +  nxp,rhold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Read hold time (R_HOLD) in Hz
> +
> +  nxp,rsetup:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Read setup time (R_SETUP) in Hz
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpios
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@20020000 {
> +        compatible = "nxp,lpc3220-slc";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x20020000 0x1000>;
> +        nxp,wdr-clks = <14>;
> +        nxp,wwidth = <40000000>;
> +        nxp,whold = <100000000>;
> +        nxp,wsetup = <100000000>;
> +        nxp,rdr-clks = <14>;
> +        nxp,rwidth = <40000000>;
> +        nxp,rhold = <66666666>;
> +        nxp,rsetup = <100000000>;
> +        nand-on-flash-bbt;
> +        gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
> +    };
> -- 
> 2.34.1
> 
