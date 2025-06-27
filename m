Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA33A186294;
	Fri, 27 Jun 2025 02:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992777; cv=none; b=QHo7Yqo39rHxi3oA5xjcZM20goDRoXIrPVMj7cXXp6SZPgeJDBZxxs76OPltPJa4bV4hzd3/SKM/YMAChSYAmjDBlYKxcH8Y8MxAOuDB94kU+UVrKEOIysag2eOe0iMNM/5lMZh1ab4ORDW7MX/hazN7tSVcwEnJYjPayn+vnCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992777; c=relaxed/simple;
	bh=n9ICYMZZEqjM/08AhUJdBy+aTbCUdAw+Vo2BHUQcYKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtCbtNAcqu7rTwtnd3n85eUKv7jDiZdVrAPjUS+DkEVztxAQa7BzOCIRXFr/unsD2bIryGWw69nHiS214yl8X0VuVmtRJQfh41WGSmZRXRaYvqb2hkIX4eyrvYXzISnXGx3dXNOS/opjVwKhE+mMK22RxJmo/fvCTNMX1fYB+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lctIc5oh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lctIc5oh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAD7C4CEEB;
	Fri, 27 Jun 2025 02:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992777;
	bh=n9ICYMZZEqjM/08AhUJdBy+aTbCUdAw+Vo2BHUQcYKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lctIc5oh7aLEMBRpJFfnllpBTr+Q+D5TEqPXHgSO4DsSloPU8hb4hBJXbpoAI5Set
	 7b4Sqhs/aAHgkgd5mw5IuVdOS+P3d13SowC83oIvevMUC1Et9Qa7oc/3rX4VBWsoxN
	 3bzSpeM6JXNWaSoJNSBwW12bqYIprbDI3L6IDtZUrsjwerkxTfim3oay1wwbqjJ+cO
	 2pnGnwkRBh/UxR6/qRExKChw/qyVMmzjItNK1mAjQHOcOdCgV4RpyeL7yc1o7SZoP/
	 nv4S04uPzYcCA3dz0Hs6ah+aHy/irgVhPLWrvJdU+0smmRG3uyhDHzmsDtOLQXlzd/
	 otqUn8rNKuNPg==
Date: Thu, 26 Jun 2025 21:52:56 -0500
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
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert lpc32xx-mlc.txt to yaml
 format
Message-ID: <20250627025256.GA1663635-robh@kernel.org>
References: <20250623202643.2468759-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623202643.2468759-1-Frank.Li@nxp.com>

On Mon, Jun 23, 2025 at 04:26:42PM -0400, Frank Li wrote:
> Convert lpc32xx-mlc.txt to yaml format.
> 
> Additional changes:
> - add ref to nand-controller.yaml.
> - replace _ with - in property names.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mtd/lpc32xx-mlc.txt   | 50 ------------
>  .../bindings/mtd/nxp,lpc3220-mlc.yaml         | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
> deleted file mode 100644
> index 64c06aa05ac71..0000000000000
> --- a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -NXP LPC32xx SoC NAND MLC controller
> -
> -Required properties:
> -- compatible: "nxp,lpc3220-mlc"
> -- reg: Address and size of the controller
> -- interrupts: The NAND interrupt specification
> -- gpios: GPIO specification for NAND write protect
> -
> -The following required properties are very controller specific. See the LPC32xx
> -User Manual 7.5.14 MLC NAND Timing Register (the values here are specified in
> -Hz, to make them independent of actual clock speed and to provide for good
> -accuracy:)
> -- nxp,tcea_delay: TCEA_DELAY
> -- nxp,busy_delay: BUSY_DELAY
> -- nxp,nand_ta: NAND_TA
> -- nxp,rd_high: RD_HIGH
> -- nxp,rd_low: RD_LOW
> -- nxp,wr_high: WR_HIGH
> -- nxp,wr_low: WR_LOW
> -
> -Optional subnodes:
> -- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
> -
> -Example:
> -
> -	mlc: flash@200a8000 {
> -		compatible = "nxp,lpc3220-mlc";
> -		reg = <0x200A8000 0x11000>;
> -		interrupts = <11 0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		nxp,tcea-delay = <333333333>;
> -		nxp,busy-delay = <10000000>;
> -		nxp,nand-ta = <18181818>;
> -		nxp,rd-high = <31250000>;
> -		nxp,rd-low = <45454545>;
> -		nxp,wr-high = <40000000>;
> -		nxp,wr-low = <83333333>;
> -		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
> -
> -		mtd0@00000000 {
> -			label = "boot";
> -			reg = <0x00000000 0x00064000>;
> -			read-only;
> -		};
> -
> -		...
> -
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> new file mode 100644
> index 0000000000000..acc430db5244e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-mlc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC NAND MLC controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-mlc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpios:
> +    maxItems: 1
> +    description: GPIO specification for NAND write protect
> +
> +  nxp,tcea-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TCEA_DELAY in Hz
> +
> +  nxp,busy-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: BUSY_DELAY in Hz
> +
> +  nxp,nand-ta:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: NAND_TA in Hz
> +
> +  nxp,rd-high:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: RD_HIGH in Hz
> +
> +  nxp,rd-low:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: RD_LOW in Hz
> +
> +  nxp,wr-high:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: WR_HIGH in Hz
> +
> +  nxp,wr-low:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: WR_LOW in Hz
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - gpios
> +
> +allOf:
> +  - $ref: nand-controller.yaml

Do either of these use this? They don't define 'nand' chip nodes, do 
they?

No partitions on this one?

Rob

