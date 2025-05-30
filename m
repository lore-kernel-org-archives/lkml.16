Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE62288F7;
	Fri, 30 May 2025 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615877; cv=none; b=DiTooAhr+lwmIlPWe0HfOyEIOTQvdKhOJxv1Dnuw9weA4HoMI/B1aFTWC3oehrc7WlGAlcJYWKftS4lkB15x2xI/CHRK8pCq0B6gVDaSTUZMqQgMY41XNSl+rCNG51DDucB5X9DxVSuSZ9xsI4wnbbjcwhk7NTiECbYJYTiVzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615877; c=relaxed/simple;
	bh=DcExpfUxA2y7MtLpRIkfyTCIoZyjbCW7UxtG5yfs9T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQqjmZ4BuCYVsQjap6oj3hwPL6Xr9hBGDf79Ns64UbzFRrNDtPQUcw6rvv4MksGjdDTK4q1vxm+qis8hgEj3v4Kl/9oNMcSafVcylVv4ve39D68xVND1PfGuL8bimyrGVWn7dYvy8BMJ4A2nyYfWpNsEsX0JpN5xj/Op/LQ85MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSFMWDrj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSFMWDrj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F35CC4CEE9;
	Fri, 30 May 2025 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615877;
	bh=DcExpfUxA2y7MtLpRIkfyTCIoZyjbCW7UxtG5yfs9T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSFMWDrjZ2HR7LSMPSo57mUpYR2XxepzeXCA6iv+/09XCbAjBI3b4PHs9q8YbeOtu
	 9nEwLWShgt77KCAV6ghfrs+XVUg8U9MFDRofWNciTyzq2N4IxdLk/4d2/oZOZ1zYUe
	 a1Vxt0EWAtXOho32Iqoo1tFaBKPRsUC8eUCvmOPIvPaIeYRR4rybAdhfH0ceCTdut2
	 nvBshykW/gRXjqow72O/J4KHPhEZytRmkTOGxgi4kQ1ITAuxpPYQCEPvsMDK/01B/e
	 OTwJQ/OibnkIzMGd9H+cutIfjWGZqDGBLDLKXhnc7wbW63tiKTtsiTry6gEoiFj3w6
	 INxsPugdbtRZA==
Date: Fri, 30 May 2025 09:37:55 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/6] dt-bindings: mfd: convert mxs-lradc bindings to
 json-schema
Message-ID: <20250530143755.GA1750861-robh@kernel.org>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
 <20250529143544.2381031-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529143544.2381031-2-dario.binacchi@amarulasolutions.com>

On Thu, May 29, 2025 at 04:35:08PM +0200, Dario Binacchi wrote:
> Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
> binding documentation to json-schema.
> 
> The clocks and #io-channel-cells properties have also been added; They
> are present in the respective SoC DTSI files but were missing from the
> old mxs-lradc.txt file.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---
> 
> Changes in v4:
> - Fix typo Low-Resoulution -> Low-Resolution'
> - Wrap lines at 80 char.
> - Drop '|' from the description
> - Describe what each interrupt is for.
> - Move touchscreen-wires constraint for imx28 to the top level
> 
> Changes in v3:
> - Add Reviewed-by tag of Conor Dooley
> 
>  .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ------
>  .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++++++++++++
>  2 files changed, 131 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
> deleted file mode 100644
> index 755cbef0647d..000000000000
> --- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -* Freescale MXS LRADC device driver
> -
> -Required properties:
> -- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
> -              for i.MX28 SoC
> -- reg: Address and length of the register set for the device
> -- interrupts: Should contain the LRADC interrupts
> -
> -Optional properties:
> -- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
> -                               to LRADC. Valid value is either 4 or 5. If this
> -                               property is not present, then the touchscreen is
> -                               disabled. 5 wires is valid for i.MX28 SoC only.
> -- fsl,ave-ctrl: number of samples per direction to calculate an average value.
> -                Allowed value is 1 ... 32, default is 4
> -- fsl,ave-delay: delay between consecutive samples. Allowed value is
> -                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
> -                 2 kHz and its default is 2 (= 1 ms)
> -- fsl,settling: delay between plate switch to next sample. Allowed value is
> -                1 ... 2047. It counts at 2 kHz and its default is
> -                10 (= 5 ms)
> -
> -Example for i.MX23 SoC:
> -
> -	lradc@80050000 {
> -		compatible = "fsl,imx23-lradc";
> -		reg = <0x80050000 0x2000>;
> -		interrupts = <36 37 38 39 40 41 42 43 44>;
> -		fsl,lradc-touchscreen-wires = <4>;
> -		fsl,ave-ctrl = <4>;
> -		fsl,ave-delay = <2>;
> -		fsl,settling = <10>;
> -	};
> -
> -Example for i.MX28 SoC:
> -
> -	lradc@80050000 {
> -		compatible = "fsl,imx28-lradc";
> -		reg = <0x80050000 0x2000>;
> -		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
> -		fsl,lradc-touchscreen-wires = <5>;
> -		fsl,ave-ctrl = <4>;
> -		fsl,ave-delay = <2>;
> -		fsl,settling = <10>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> new file mode 100644
> index 000000000000..f90fdfbb74a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS Low-Resolution ADC (LRADC)
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description:
> +  The LRADC provides 16 physical channels of 12-bit resolution for
> +  analog-to-digital conversion and includes an integrated 4-wire/5-wire
> +  touchscreen controller.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx23-lradc
> +          - fsl,imx28-lradc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  interrupts:
> +    minItems: 9
> +    maxItems: 13
> +
> +  fsl,lradc-touchscreen-wires:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [4, 5]
> +    description:
> +      Number of wires used to connect the touchscreen to LRADC.
> +      If this property is not present, then the touchscreen is disabled.

Is this 1 paragraph or 2? If 1, it is not wrapped properly.

If 2, then it should have a blank line in between paragraphs and use 
'>':

    description: >
      Number of wires used to connect the touchscreen to LRADC.

      If this property is not present, then the touchscreen is disabled.


See writing-schema.rst for more details.

> +
> +  fsl,ave-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 32
> +    default: 4
> +    description: |

Don't need '|'.

> +      Number of samples per direction to calculate an average value.
> +
> +  fsl,ave-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2
> +    maximum: 2048
> +    default: 2
> +    description:
> +      Delay between consecutive samples.
> +      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
> +      default value (i. e. 2) is 1 ms.

1 paragraph or 2?

> +
> +  fsl,settling:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 2047
> +    default: 10
> +    description:
> +      Delay between plate switch to next sample.
> +      It counts at 2 kHz and its default (i. e. 10) is 5 ms.

1 paragraph or 2?

> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - fsl,imx23-lradc
> +then:
> +  properties:
> +    interrupts:
> +      items:
> +        - description: channel 0
> +        - description: channel 1
> +        - description: channel 2
> +        - description: channel 3
> +        - description: channel 4
> +        - description: channel 5
> +        - description: touchscreen
> +        - description: channel 6
> +        - description: channel 7
> +    fsl,lradc-touchscreen-wires:
> +      const: 4
> +else:
> +  properties:
> +    interrupts:
> +      items:
> +        - description: threshold 0
> +        - description: threshold 1
> +        - description: channel 0
> +        - description: channel 1
> +        - description: channel 2
> +        - description: channel 3
> +        - description: channel 4
> +        - description: channel 5
> +        - description: button 0
> +        - description: button 1
> +        - description: touchscreen
> +        - description: channel 6
> +        - description: channel 7
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lradc@80050000 {
> +        compatible = "fsl,imx23-lradc";
> +        reg = <0x80050000 0x2000>;
> +        interrupts = <36>, <37>, <38>, <39>, <40>,
> +                     <41>, <42>, <43>, <44>;
> +        clocks = <&clks 26>;
> +        #io-channel-cells = <1>;
> +        fsl,lradc-touchscreen-wires = <4>;
> +        fsl,ave-ctrl = <4>;
> +        fsl,ave-delay = <2>;
> +        fsl,settling = <10>;
> +    };
> -- 
> 2.43.0
> 
