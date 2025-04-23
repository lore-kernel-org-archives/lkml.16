Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C902690D4;
	Wed, 23 Apr 2025 20:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438852; cv=none; b=cjoqJhu4/tDKxY8Fc9zD7s25TnfNMXnrLgK2eYajTrBtT/I75kBzOj6WF+F4WAvR0yHkx/QRhrKv7AlGy1rKAQf4TTckFEmQm0Yk0/QMuWE24Qvkxpg49ELdx08E7HtaFkdbvdNWWqOiKekXIrea3w4ejJaxLl1uMO2BjVKPug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438852; c=relaxed/simple;
	bh=YoVn7nDZ5+wXUEYeIen7MDDYqYkq/JetAQBw8G9pR9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVPR5LY/zt6zN2CW5Cg7XR1vMTb2QlZs85TwSSqexYOKyqtuZ9ciPHNTsKEdd4HNgJHqaM+VRedOKhOVkNyWTg4/C+4eiCP8AaxYJuR4nEuvzhno/zs6x0Bkxq1MWjsXKize+26df7/kTxhebkuo/ZRsIPulAJFAAnmSH4M5iTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjxqHEXk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjxqHEXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBFDC4CEE2;
	Wed, 23 Apr 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745438850;
	bh=YoVn7nDZ5+wXUEYeIen7MDDYqYkq/JetAQBw8G9pR9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjxqHEXk4S4owqnj1iFNY+lvsQtnw+rHojPk8ouhHChhnEka9pHh59TPree+yV5xC
	 AOCpGlIGZJ+R+5n9qdgnB+/V8AeQ0qPne2fFn0l272spOWdCR/rs31FO/I3JB6N/H7
	 JLf3Of0z8i3YX9ClyxUVRqNK8Msov4wAZlGlOoPv//zjEcneyTnncJ2qXD2E/tLrPw
	 fAL6AhbGcSmLMwRay8sSTRBkipDPv7kFG8pQljGf0qUt2kwgkOtkE2ZV1fbjpdyD8I
	 5ppss9kSTHS7PPSERgKctrMKsLq+4wuF+1wqlpcUyQIU9TKUiCyhWaOf46FHCfnHtk
	 kyiF+wLR5eFmw==
Date: Wed, 23 Apr 2025 15:07:28 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, dinguyen@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: socfpga: convert to yaml
Message-ID: <20250423200728.GA954453-robh@kernel.org>
References: <20250423150318.27101-1-matthew.gerlach@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423150318.27101-1-matthew.gerlach@altera.com>

On Wed, Apr 23, 2025 at 08:03:18AM -0700, Matthew Gerlach wrote:
> Convert the clock device tree bindings to yaml for the Altera SoCFPGA
> Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
> subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
> socfpga-clk-manager.yaml.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
> v2:
>  - Fix node name regexs.
>  - Remove redundant type for clocks.
>  - Put repeated properties under '$defs'.
>  - Move reg property after compatible.
> ---
>  .../arm/altera/socfpga-clk-manager.yaml       | 129 +++++++++++++++++-
>  .../bindings/clock/altr_socfpga.txt           |  30 ----
>  2 files changed, 128 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> index 572381306681..6f09458f22a4 100644
> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> @@ -9,20 +9,147 @@ title: Altera SOCFPGA Clock Manager
>  maintainers:
>    - Dinh Nguyen <dinguyen@kernel.org>
>  
> -description: test
> +description:
> +  This binding describes the Altera SOCFGPA Clock Manager and its associated
> +  tree of clocks, pll's, and clock gates for the Cyclone5, Arria5 and Arria10
> +  chip families.
>  
>  properties:
>    compatible:
>      items:
>        - const: altr,clk-mgr
> +
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^osc[0-9]$":
> +        type: object
> +
> +      "^[a-z0-9,_]+(clk|pll|clk_gate|clk_divided)(@[a-f0-9]+)?$":
> +        type: object
> +        additionalProperties: false

Add another level to $defs and move the reference here:

           $ref: '#/$defs/clock-props'
           unevaluatedProperties: false

You can also move 'reg' and '#clock-cells' into $defs/clock-props.

> +
> +        properties:
> +
> +          compatible:
> +            enum:
> +              - altr,socfpga-pll-clock
> +              - altr,socfpga-perip-clk
> +              - altr,socfpga-gate-clk
> +              - altr,socfpga-a10-pll-clock
> +              - altr,socfpga-a10-perip-clk
> +              - altr,socfpga-a10-gate-clk
> +              - fixed-clock
> +
> +          reg:
> +            maxItems: 1
> +
> +          clocks:
> +            description: one or more phandles to input clock
> +            minItems: 1
> +            maxItems: 5
> +
> +          "#address-cells":
> +            const: 1
> +
> +          "#clock-cells":
> +            const: 0
> +
> +          "#size-cells":
> +            const: 0
> +

> +          clk-gate:
> +            $ref: '#/$defs/clk-gate'
> +            unevaluatedProperties: false
> +
> +          div-reg:
> +            $ref: '#/$defs/div-reg'
> +            unevaluatedProperties: false
> +
> +          fixed-divider:
> +            $ref: '#/$defs/fixed-divider'
> +            unevaluatedProperties: false

And then drop all these. Same in the child node below.

> +
> +        patternProperties:
> +          "^[a-z0-9,_]+(clk|pll)(@[a-f0-9]+)?$":
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              compatible:
> +                enum:
> +                  - altr,socfpga-perip-clk
> +                  - altr,socfpga-gate-clk
> +                  - altr,socfpga-a10-perip-clk
> +                  - altr,socfpga-a10-gate-clk
> +
> +              reg:
> +                maxItems: 1
> +
> +              "#clock-cells":
> +                const: 0
> +
> +              clocks:
> +                description: one or more phandles to input clock
> +                minItems: 1
> +                maxItems: 4
> +
> +              clk-gate:
> +                $ref: '#/$defs/clk-gate'
> +                unevaluatedProperties: false
> +
> +              div-reg:
> +                $ref: '#/$defs/div-reg'
> +                unevaluatedProperties: false
> +
> +              fixed-divider:
> +                $ref: '#/$defs/fixed-divider'
> +                unevaluatedProperties: false
> +
> +            required:
> +              - compatible
> +              - clocks
> +              - "#clock-cells"
> +
> +        required:
> +          - compatible
> +          - "#clock-cells"
> +
>  required:
>    - compatible
> +  - reg
>  
>  additionalProperties: false
>  
> +$defs:
> +  clk-gate:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - description: gating register offset
> +      - description: bit index
> +
> +  div-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - description: divider register offset
> +      - description: bit shift
> +      - description: bit width
> +
> +  fixed-divider:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>  examples:
>    - |
>      clkmgr@ffd04000 {
