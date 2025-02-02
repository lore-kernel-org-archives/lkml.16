Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13962746D;
	Sun,  2 Feb 2025 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738502825; cv=none; b=rriNVivC4jtAemFlROMbXDBEOBLJw7R9zoWKEps0n5IqbyCpfPzoQS6EbSGwzAEydetv1Fxp9eo6SSLXU4CLVSM5JWj+t8aqKIEMDzr6sTN2Yrz5mIe++87AoyT085nsMymz0FDCgG7Yk5RJU6B6C1oFZulqOoDjECrexewSywo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738502825; c=relaxed/simple;
	bh=Ly0MQ/oiG1mhwVya1AbIGxMfk/tm0PN6xmf0WV5EHdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8fIZ1SZlNzTLjzQPMIdZ2W7fX2qg5fN6Bwa3of4ycU/K2Z42Qv7HwJVJ3KvN1ZjFwxa7xSbbLm7YCCVAaTB75lUehfjCypY5htMjAR8JY+HY1Po90+TENKva3sQ4sD3pX7men7ED3oqvTR20YEI++Rr0hmBqWErJyBozEbk4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8fobs7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8fobs7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24D3C4CED1;
	Sun,  2 Feb 2025 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738502824;
	bh=Ly0MQ/oiG1mhwVya1AbIGxMfk/tm0PN6xmf0WV5EHdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8fobs7rkc1Aec+I/MI6q9ErflShzJJGvYx1vQB3edX61C06Ix2Jcm6EP+KhdiJLt
	 3pFYd5xjDLdvA1tf4luHeNU7ybFcVxGTQHxVndXy/lTSbS0sjSUrx0qwusCMJaO+fE
	 8eYUK0RMl0Fur7ZGqzVVs7JS2ThBGCLpXyfc/RcBXNCTmN4bR8lyR9vd3V7Jcs7c28
	 vkwNoIEl2EY+kredgYRes7fgJDAHltr1ngWov4lUgN3b6n7K0JhL2ik5Yq54LWWunA
	 wNRpEqo7bDBODv0IQ5LZYv5Vk/S9abVUzxPQ49go1/bTLExE0/m/CBFA9sIooFlJPD
	 A2dpWxhwyfPjg==
Date: Sun, 2 Feb 2025 14:27:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stanislav Jakubek <stano.jakubek@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Message-ID: <20250202-mindful-seahorse-of-action-ba6ee7@krzk-bin>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>

On Fri, Jan 31, 2025 at 07:13:49PM +0100, Artur Weber wrote:
> +$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM590xx Power Management IC
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm59056
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: Container node for regulators.
> +    $ref: ../regulator/brcm,bcm59056.yaml

Does this device have any other function? RTC? Charger? If not, maybe
just put everything in one binding in regulator dir.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: bcm59056@8 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "brcm,bcm59056";
> +            reg = <0x08>;
> +            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            regulators {
> +                rfldo_reg: rfldo {
> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <3300000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59056 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.
> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59056 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
> +#   vbus

patternProperties should define this. No need to repeat schema in
freeform text.

Best regards,
Krzysztof

