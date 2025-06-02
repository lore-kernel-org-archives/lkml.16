Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60952C325A;
	Mon,  2 Jun 2025 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849039; cv=none; b=kTV8TtYTdObnx6v1nhvsCTz4afNBmBpKn1FBbomLzFMxd91Op9SDKC/gClZZrlnM1Wv4sr2qE9XA8GuP5oM9JB6Q5A/WQCDjWfpcIdlUa1GqtNgT3nRRchsZGbZZZzG0RwhboyY4FxQvHbtanPRwo8Xn0P1L7z5B3Y0iz/LY1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849039; c=relaxed/simple;
	bh=s9xNx+NS3r0HHm3PTq5Rn39oisNfhLK0A1fU5X4LW0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6zsRWIBL1XTxjJ63mFlxkdcNyrqvDwkpkCUSHWhCL9JMbMsALNDb+9zQY+YhhMx6Kj67oHg4YvaVwZ2mZUBrqyF/CYdF6lJ27jDMZCHm0kaQKUvWXkD/48HEsgedjdzhscnVeKpCHd3Q6C8uwzIcyl54QRj6iESPGJ2EVps6NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUcjO8bI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUcjO8bI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3190C4CEEB;
	Mon,  2 Jun 2025 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748849039;
	bh=s9xNx+NS3r0HHm3PTq5Rn39oisNfhLK0A1fU5X4LW0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OUcjO8bIwiyhtM98VJyCsdJ8wRM2aLytNR913o4tMLk9IKSwacD8Ru41v07BekA5X
	 FLq8Zso71U/nWHXyk2ZFkAyi9Szp1r4ZmOpyKJD/IeOyXnd7LlZaZokxANsQvlQJJP
	 mpuE10SumP3o3em4dAF335q4AoYg2NOJcTRoXkuwGkJwvCr7zrep7efStyXYiJwpxm
	 Ap0Q5jGUQ8hGbwnIFsMmuGF7Yc+/k0+pAv45sI1i7JawJki0MuRpaOWZ6SEtcBfdJZ
	 aq1JRNGwylRfPkZ5VJOu0EKzdIAlypbB3owL40gwcwl2GjU7zYHBnnX99nQ3QZjWCy
	 k4KYesLwJIp9Q==
Message-ID: <3825dcb6-00b1-4e03-ab1a-258bcd3265ba@kernel.org>
Date: Mon, 2 Jun 2025 09:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: mtd: atmel-nand: add legacy nand
 controllers
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-4-balamanikandan.gunasundar@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250602053507.25864-4-balamanikandan.gunasundar@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2025 07:35, Balamanikandan Gunasundar wrote:
> Add support for atmel legacy nand controllers. These bindings should not be

No new support for legacy bindings. Both your commit msg and subject do
not describe what you do here. I see you convert EXISTING bindings
instead of adding support. But if you insist on adding, that would be
NAKed because why would we want to accept new stuff which is already
deprecated?

> used with the new device trees.
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt    | 116 ------------
>  .../devicetree/bindings/mtd/atmel-nand.yaml   | 167 ++++++++++++++++++

Filename matching compatible. Also look at your 4/4 patch and compare
what is here and there.

>  2 files changed, 167 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.yaml
> 


...

> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.yaml b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
> new file mode 100644
> index 000000000000..a437d40a523f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/atmel-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel NAND flash controller
> +
> +maintainers:
> +  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> +
> +description:
> +  Atmel nand flash controller. These are legacy bindings and
> +  deprecated. Find the latest in microchip,nand-controller.yaml
> +

Missing allOf/ref to nand-controller

> +properties:
> +  $nodename:
> +    pattern: "^nand(@.*)?"

Drop

> +
> +  compatible:
> +    enum:
> +      - atmel,at91rm9200-nand
> +      - atmel,sama5d2-nand
> +      - atmel,sama5d4-nand
> +
> +  reg:
> +    description:
> +      The localbus address and size used for the chip, and hardware ECC
> +      controller if available. If the hardware ECC is PMECC, it should
> +      contain address and size for PMECC and PMECC Error Location
> +      controller. The PMECC lookup table address and size in ROM is
> +      optional. If not specified, driver will build it in runtime.
> +
> +  nand-on-flash-bbt:
> +    description:
> +      enable on flash bbt option if not present false
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  nand-ecc-mode:
> +    description:
> +      operation mode of the NAND ecc
> +    enum:
> +      [none, soft, hw, hw_syndrome, hw_oob_first, soft_bch]
> +    default: soft
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  nand-bus-width:
> +    description:
> +      nand bus width
> +    enum:
> +      [8, 16]
> +    default: 8
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1

You have several redundant properties. What's more, you are basically
re-definingn them. Drop and keep only constraints. Look at other
bindings and follow how they are doing this.

> +
> +  gpios:
> +    minItems: 2
> +    items:
> +      - description: Ready/Busy
> +      - description: Chip Enable
> +      - description: Optional Card detect GPIO; can be 0 if unused
> +
> +  atmel,nand-addr-offset:
> +    description:
> +      offset for the address latch.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +
> +  atmel,nand-cmd-offset:
> +    description:
> +      offset for the command latch.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +
> +  atmel,nand-has-dma:
> +    description:
> +      support dma transfer for nand read/write.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  atmel,has-pmecc:
> +    description:
> +      enable Programmable Multibit ECC hardware, capable of BCH encoding
> +      and decoding, on devices where it is present.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  atmel,pmecc-cap:
> +    description:
> +      error correct capability for Programmable Multibit ECC Controller.
> +    enum:
> +      [2, 4, 8, 12, 24, 32]
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  atmel,pmecc-sector-size:
> +    description:
> +      sector size for ECC computation.
> +    enum:
> +      [512, 1024]
> +    default: 512
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +

Just one blank line

> +  atmel,pmecc-lookup-table-offset:
> +    description:
> +      Two offsets of lookup table in ROM for different sector size. First
> +      one is for sector size 512, the next is for sector size 1024. If not
> +      specified, driver will build the table in runtime.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    default: 512
> +
> +required:
> +  - compatible
> +  - reg
> +  - atmel,nand-addr-offset
> +  - atmel,nand-cmd-offset
> +  - "#address-cells"
> +  - "#size-cells"

Use consistent quotes, either ' or "

> +
> +unevaluatedProperties: false

Without $ref this makes no sense, so it clearly points you to missing ref.

> +
> +examples:
> +  - |
> +    nand@40000000 {
> +        compatible = "atmel,at91rm9200-nand";
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Follow DTS coding style.

> +        reg = <0x40000000 0x10000000
> +               0xffffe800 0x200>;

These are two entries, not one.


> +        atmel,nand-addr-offset = <21>;	/* ale */
> +        atmel,nand-cmd-offset = <22>;	/* cle */
> +        nand-on-flash-bbt;
> +        nand-ecc-mode = "soft";
> +        gpios = <&pioC 13 0	/* rdy */
> +                 &pioC 14 0     /* nce */
> +                 0		/* cd */

All this is not following standard style. Two entries. Use proper
defines for GPIO flags.

> +                >;
> +    };
> +  - |
> +    /* for PMECC supported chips */
> +    nand@40000000 {
> +        compatible = "atmel,at91rm9200-nand";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0x40000000 0x10000000	/* bus addr & size */
> +               0xffffe000 0x00000600	/* PMECC addr & size */
> +               0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
> +               0x00100000 0x00100000>;	/* ROM addr & size */

Four entries, not one.

> +
> +        atmel,nand-addr-offset = <21>;	/* ale */
> +        atmel,nand-cmd-offset = <22>;	/* cle */
> +        nand-on-flash-bbt;
> +        nand-ecc-mode = "hw";
> +        atmel,has-pmecc;	/* enable PMECC */
> +        atmel,pmecc-cap = <2>;
> +        atmel,pmecc-sector-size = <512>;
> +        atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
> +        gpios = <&pioD 5 0	/* rdy */
> +                 &pioD 4 0	/* nce */
> +                 0		/* cd */
> +                >;
> +    };


Best regards,
Krzysztof
