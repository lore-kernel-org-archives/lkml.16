Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1FD1EF389;
	Mon, 19 May 2025 06:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635899; cv=none; b=GHo+psVxeIJy3bR/K8izMQKeHVlAuRDkUKjlwRSRkZz6bfUz3k8X1MlJIkzV7WAa4jaazou3XDdwEYmaHdMXbYIuJzXJ7yBlQ53rIhGLfagfjuH2YcBn3CC9whVj33TyNQ/FPzAKB0RPm9fsk4jpH2wXA3ay/ibC4+RaPZQbvqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635899; c=relaxed/simple;
	bh=qqdLigL4p1RFcpO1tnEeFm0b3IOvT7UbbxtCInaNiaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uezu3u+3d5iXVlsgqmsF/4QEYMu3OfBxWVnpxyLLhPco/pkqgrubU0mz9fBrafa9rD9RDbTi2BdcuQ1drI2dEFzUWz69Xw23BZqok6Gs0iQoHxC9UhWlQHZuYOcK1BSflp5pm4lTKMYdp0s87gp87LNw3piEJRq9SLJDeN0u5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqTwNfly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqTwNfly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D887C4CEE4;
	Mon, 19 May 2025 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747635898;
	bh=qqdLigL4p1RFcpO1tnEeFm0b3IOvT7UbbxtCInaNiaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqTwNflyqfIPyjbTuv8xyUa6p6YqrHHEYS5k/T0fEmZlAkKw98tip2UlPXiCX+Ibu
	 k3Oy5FBaJecUwK/L+WTg8PVvcUCbA5v8wSLHdCozqBiMVHFItYUMM1ysnZFHSQLV3X
	 b4Wn0KUzGaAqEcZJcgB8xdyXctnkdyXNutkbyKLaXgg33JLvEn+y6Eu+Ltndl3qH8N
	 DD+e2IR4xSreI+Ve52BCcWWIU8IvmCxG7s2X8mdGx0P8UdlSIq4omrhUQGmGdwqSQs
	 y/09pUrp/rL41tSqrIfnDwV2nQ7gGrQBjcdUQcM5q5E5YZfFYe24XoPDZl5vlfBmAI
	 9FCLgHkj6aUmg==
Date: Mon, 19 May 2025 08:24:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: zhangsenchuan@eswincomputing.com
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, yangwei1@eswincomputing.com
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Add Eswin EIC7700 Usb controller
Message-ID: <20250519-transparent-eggplant-beagle-3abb7c@kuoka>
References: <20250516095237.1516-1-zhangsenchuan@eswincomputing.com>
 <20250516095338.1467-1-zhangsenchuan@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516095338.1467-1-zhangsenchuan@eswincomputing.com>

On Fri, May 16, 2025 at 05:53:37PM GMT, zhangsenchuan@eswincomputing.com wrote:
> From: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
> 
> Add Device Tree binding documentation for the ESWIN EIC7700
> usb controller module.
> 
> Co-developed-by: Wei Yang <yangwei1@eswincomputing.com>
> Signed-off-by: Wei Yang <yangwei1@eswincomputing.com>
> Signed-off-by: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
> ---
>  .../bindings/usb/eswin,eic7700-usb.yaml       | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
> new file mode 100644
> index 000000000000..eb8260069b99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/eswin,eic7700-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin EIC7700 SoC Usb Controller
> +
> +maintainers:
> +  - Wei Yang <yangwei1@eswincomputing.com>
> +  - Senchuan Zhang <zhangsenchuan@eswincomputing.com>
> +
> +description: |
> +  The Usb controller on EIC7700 SoC.
> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-usb
> +
> +  reg:
> +    maxItems: 3
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: peripheral
> +
> +  clocks:
> +    maxItems: 3
> +    description: handles to clock for the usb controller.

Useless description, drop. Do not explain what DT syntax is.

> +
> +  clock-names:
> +    items:
> +      - const: suspend
> +      - const: aclk
> +      - const: cfg_clk
> +    description: the name of each clock.

Drop description.

> +
> +  resets:
> +    description: resets to be used by the controller.

Missing constraints.

> +
> +  reset-names:
> +    items:
> +      - const: vaux
> +    description: names of the resets listed in resets property in the same order.

Drop description.

> +
> +  eswin,hsp_sp_csr:

DTS coding style

> +    description: |

Drop |

> +      High-speed equipment control register.

For what purpose?

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Missing constraints.

> +
> +  ranges: true
> +
> +  dma-noncoherent: true
> +
> +  numa-node-id:
> +    maximum: 0

Huh? What is the point of this if this is fixed to 0?

There is no way this passes any tests. Please look at writing-schema
docs.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-parent
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - eswin,hsp_sp_csr
> +  - dma-noncoherent
> +  - ranges
> +  - numa-node-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usbdrd3_0: usb0{

usb, missing space, drop unused label

> +          compatible = "eswin,eic7700-dwc3";
> +          #address-cells = <2>;
> +          #size-cells = <2>;

Order properties according to DTS coding style

> +          clocks = <&clock 270>,
> +                   <&clock 545>,
> +                   <&clock 546>;
> +          clock-names = "suspend","aclk", "cfg_clk";
> +          eswin,hsp_sp_csr = <&hsp_sp_csr 0x800 0x808 0x83c 0x840>;
> +          resets = <&reset 0x07 (1 << 15)>;
> +          reset-names = "vaux";
> +          ranges;
> +          numa-node-id = <0>;
> +          status = "disabled";

No. You cannot make it disable and it makes no sense.

> +          usbdrd_dwc3_0: dwc3@50480000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Fold the child node into the parent.

Best regards,
Krzysztof

