Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860301C69D;
	Wed, 25 Jun 2025 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750812691; cv=none; b=SyhY5/LakgIaTE4Gsk6ZP5/JioklfxwNW1HcIrNvD1+BqfK+dWumnEpybkCB/g5Y/XqKvzAktnBuTzTKhl2UjxmOM/zgzbMSBeMzmBw6tGxUNNu0H4ZIBWcW9eBN1HizHTOWq0HWQuXFnYeU/k5B8RayyJ2QwPy0vcbgx2xUZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750812691; c=relaxed/simple;
	bh=rdyW583uKp4K8gHxquDp6eEZG0Zkfp097JbY8E5eFzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N28QzK+HsBWR79OU7zYD8DJONfxvUlrsgCjZrdYdYj1pLfbbB8WdZrw75vxtLQALphNu1Mlss9MKvoTgS7yW6vc81QzxbnD6wf0BqNmSkryXKOdD49I7MYgbT+ISfh87yY736Ta/6AtM9OsoFiKXHHuq9wYIyG3/jGqIrhnyAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeOt/Pz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeOt/Pz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0696FC4CEE3;
	Wed, 25 Jun 2025 00:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750812691;
	bh=rdyW583uKp4K8gHxquDp6eEZG0Zkfp097JbY8E5eFzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeOt/Pz+GybkKWK2kmcAbCiazoM8877vyJM6SUCcAislZ47f7V1+fbHBTWYDBzQPz
	 Zd7xi+UX/cbmwB9N1I8clWHo5byqh8ECa/iVW8Y+m8MFqGPf7mLGf4MR1nl6bXZ5M4
	 rBOHQlBME4j45JBp8KxbstPmit9Hvl0XK0vixC79x27tWCxVry83Zljkhg+oFw5tcn
	 tUM4GWxa+7ylJ0Kk9Vw3XRZG/tfvpCo8rejuXFv6aGftAuV64wnMk+9bG0gcITr3Pj
	 xzPrC/1n6dtTtV/4uiFuURBJ4UV1kS4B0YCUDv8EpkhorsXQnHUX1U1YPug8W/RR6b
	 oBJy7Z6wq5SDA==
Date: Tue, 24 Jun 2025 19:51:30 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
Message-ID: <20250625005130.GA2106374-robh@kernel.org>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>

On Mon, Jun 23, 2025 at 02:00:37PM +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> new file mode 100644
> index 000000000000..2ce57e659d12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 series SPMI PMICs multi-function device
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  Some MediaTek Power Management ICs (PMICs) found in board designs with
> +  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
> +  the chip via the System Power Management Interface (SPMI) bus.
> +
> +  These PMICs are multi-function devices with various sub modules.
> +  For example, those may include one, or more of the following:
> +  - Auxiliary ADC Controller
> +  - Clock Controller
> +  - eFuses
> +  - GPIO Controller
> +  - Interrupt Controller
> +  - Keys
> +  - LEDs Controller
> +  - Regulators
> +  - RTC
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6363
> +          - mediatek,mt6373
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 0
> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 3
> +
> +  adc:
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> +    unevaluatedProperties: false
> +
> +  regulators:
> +    type: object
> +    oneOf:
> +      - $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
> +      - $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#

This causes the schemas to be applied 4 times (2 each). Better if you 
do:

properties:
  compatible:
    contains:
      enum: [ the compatibles in those schemas ]


> +    additionalProperties: true
> +
> +  keys:
> +    type: object
> +    $ref: /schemas/input/mediatek,pmic-keys.yaml
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi {
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +
> +      pmic@4 {
> +        compatible = "mediatek,mt6363";
> +        reg = <0x4 SPMI_USID>;
> +        interrupts = <4 64 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #address-cells = <0>;
> +        #interrupt-cells = <3>;
> +
> +        regulators {
> +            compatible = "mediatek,mt6363-regulator";
> +        };

Make the example complete. with adc and keys nodes.

> +      };
> +    };
> -- 
> 2.49.0
> 
