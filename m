Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E22836A7;
	Tue, 22 Apr 2025 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328239; cv=none; b=dzkt5gJt6oeG52/09LK8pynoT9Po7mvXtRe5YHjJimZ1zPwaQLFsdCh5wmm4EiI0gTRQC5MOj7fudAUVEbgcl4rYgX2tedQqxtctrnaQq4nNp8+Xfx40vd0WEbcAWP6XIIw4Ndrqvt/C6f35IkvzXTB0B17bwIUUuB85mm2bZ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328239; c=relaxed/simple;
	bh=7jvbXJf9/t+v414lZ3iwh9ep3plTmpzsJ3he4aIzZkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWHOHD+bS/BS3pJVThhHIztCK4l5jxFWKLiOwQito21csnSXJkYpLBukZ6m/tcvSrh5ziPw5kmtk6c47iEfch0JjRVYV5hcmMncULET+WiWVyfKGFQzoSxcksYomsYG6NxutUbdnNQL0TU0o0jHd+AzqYWMx2sww3KlNBolFO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aF6uwfNx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aF6uwfNx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E81C4CEE9;
	Tue, 22 Apr 2025 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745328238;
	bh=7jvbXJf9/t+v414lZ3iwh9ep3plTmpzsJ3he4aIzZkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aF6uwfNxGWQDz6B8QbEoAER2/1sdnU8HZ5zDVzkfOiEqd40uoKaWO1Su9RC9CNCcR
	 RG83EWy1CRk1O944lIq0ILzvjeSSBl17q4nTvm4ig7jiCeVuCRVkDC9gqHk/Nl8jK2
	 SwQpX/C6+/LLjze4+wthk5FgKtHU1PUZPzr+q0Gqnrnq1xG5Apg19SC8IL4jAZRk4M
	 42tCreRu1IDJnp2EW9DelM07SGtCKjy/shUjiHhVUftv9YHGfCOzPDh62XYj+6O+M/
	 WSAA+nbPTRdqDP6SkFhanwbsEW9ED8dHH16rP5IWY0ter3PMGzHJjjCXwMyvfGES9F
	 xjWIAtjm3/RBQ==
Date: Tue, 22 Apr 2025 08:23:56 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	dinguyen@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: socfpga: convert to yaml
Message-ID: <20250422132356.GA1020502-robh@kernel.org>
References: <20250417160616.47558-1-matthew.gerlach@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417160616.47558-1-matthew.gerlach@altera.com>

On Thu, Apr 17, 2025 at 09:06:16AM -0700, Matthew Gerlach wrote:
> Convert the clock device tree bindings to yaml for the Altera SoCFPGA
> Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
> subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
> socfpga-clk-manager.yaml.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  .../arm/altera/socfpga-clk-manager.yaml       | 118 +++++++++++++++++-
>  .../bindings/clock/altr_socfpga.txt           |  30 -----
>  2 files changed, 117 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> index 572381306681..4cda13259530 100644
> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
> @@ -9,17 +9,133 @@ title: Altera SOCFPGA Clock Manager
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
> +      "^[a-z0-9,_]+[clk,pll,clk_gate,clk_divided](@[a-f0-9]+)?$":

This regex doesn't do what you think it does. You want:

"^[a-z0-9,_]+(clk|pll|clk_gate|clk_divided)(@[a-f0-9]+)?$"

However, I don't see clk_gate or clk_divided used anywhere, so I would 
simplify to:

"(clk|pll)(@[a-f0-9]+)?$"


> +        type: object
> +        additionalProperties: false
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
> +          clocks:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array

clocks already has a type.

> +            description: one or more phandles to input clock

I assume there is some max, so make this constraints:

minItems: 1
maxItems: ?

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
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            items:
> +              - description: gating register offset
> +              - description: bit index
> +
> +          div-reg:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            items:
> +              - description: divider register offset
> +              - description: bit shift
> +              - description: bit width
> +
> +          fixed-divider:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          reg:
> +            maxItems: 1
> +
> +        patternProperties:
> +          "^[a-z0-9,_]+[clk,pll](@[a-f0-9]+)?$":

Similar issues here.

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
> +              "#clock-cells":
> +                const: 0
> +
> +              clocks:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array
> +                description: one or more phandles to input clock
> +
> +              clk-gate:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                items:
> +                  - description: gating register offset
> +                  - description: bit index
> +
> +              div-reg:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                items:
> +                  - description: divider register offset
> +                  - description: bit shift
> +                  - description: bit width
> +
> +              fixed-divider:
> +                $ref: /schemas/types.yaml#/definitions/uint32

As these properties are all just repeated, put them all under '$defs' 
and reference that in both places.

> +
> +              reg:
> +                maxItems: 1

'reg' goes after compatible.

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
