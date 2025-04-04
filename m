Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDCC22DFAF;
	Fri,  4 Apr 2025 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795648; cv=none; b=Vcw5KuzjRIpqRIA9qYwSxPWcoznJlrGmqNGo8FenMcs8wYyfg5SEH/TMW1oJvASDGjKEqhH2s3q44dz0UqfvIGeXBXaHKHV3WUB13uQOWmnFS0AATtl+ma5R8cLbr3mHqOomMS4rEYpxq4OzAAfNOPEhbwU3GggUaoUHvOUOdCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795648; c=relaxed/simple;
	bh=X60ncpChgW8F3t+APBZl1n9z8FKQTuNx+IytCXpYTTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u964A6hcYFXmfL5vHrv5ZjIr2DbaRVF2+/8MpNZy6FVCRinJvyxSG9o3XUh0PL8zyAtvxRPsRJwxHn4ltn3ZL6gPySgpyzgnmkmB333u6Ol5V/o5VXLvzIgE61FZqcVndrQA/sN3QXEkI2rwvQshD7FzkeDeQkSEA0ysDvFmGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXGaQw9e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXGaQw9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA12C4CEDD;
	Fri,  4 Apr 2025 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743795648;
	bh=X60ncpChgW8F3t+APBZl1n9z8FKQTuNx+IytCXpYTTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXGaQw9eGa9ezTPA5PgsIXdzB7oQMT71L0vuBTzpaaFdX5XE8QNRrqsYDdxgGDXT+
	 MJ+W9gUNQW0Dr2XYPE26I3Dqgij1Niueiqj/iUMSsk8mv2q3cpuMI3zIFi0Qm90VFc
	 QTWYgql2GrWle78Vu09/5d42P633QX9NQozLs0jmjVY+ASJwyRFEumzha4GdeegUgi
	 8iCSq9XSZnX4hXVf70v+juQwthGzv2fCxfJ5BTlVgtKkJYlBFvbCOGwwUDwYfntP9K
	 RqP6Ka/YYYRh/z+KEjcx9Nde7qv4F32TqbwNm5tJxMrSO3OD0NffBEqXbVSMu4i9bx
	 FMw9l2Fr/TiSw==
Date: Fri, 4 Apr 2025 14:40:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: ti: Convert fixed-factor-clock
 to yaml
Message-ID: <20250404194046.GA167370-robh@kernel.org>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-4-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404014500.2789830-4-sbellary@baylibre.com>

On Thu, Apr 03, 2025 at 06:44:59PM -0700, Sukrut Bellary wrote:
> Convert TI fixed-factor-clock binding to yaml.
> 
> This uses the ti,autoidle.yaml for clock autoidle support.
> Clean up the example to meet the current standards.
> 
> Add the creator of the original binding as a maintainer.
> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../bindings/clock/ti/fixed-factor-clock.txt  | 42 ----------
>  .../clock/ti/ti,fixed-factor-clock.yaml       | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt b/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
> deleted file mode 100644
> index dc69477b6e98..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Binding for TI fixed factor rate clock sources.
> -
> -This binding uses the common clock binding[1], and also uses the autoidle
> -support from TI autoidle clock [2].
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> -
> -Required properties:
> -- compatible : shall be "ti,fixed-factor-clock".
> -- #clock-cells : from common clock binding; shall be set to 0.
> -- ti,clock-div: fixed divider.
> -- ti,clock-mult: fixed multiplier.
> -- clocks: parent clock.
> -
> -Optional properties:
> -- clock-output-names : from common clock binding.
> -- ti,autoidle-shift: bit shift of the autoidle enable bit for the clock,
> -  see [2]
> -- reg: offset for the autoidle register of this clock, see [2]
> -- ti,invert-autoidle-bit: autoidle is enabled by setting the bit to 0, see [2]
> -- ti,set-rate-parent: clk_set_rate is propagated to parent
> -
> -Example:
> -	clock {
> -		compatible = "ti,fixed-factor-clock";
> -		clocks = <&parentclk>;
> -		#clock-cells = <0>;
> -		ti,clock-div = <2>;
> -		ti,clock-mult = <1>;
> -	};
> -
> -	dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck {
> -		#clock-cells = <0>;
> -		compatible = "ti,fixed-factor-clock";
> -		clocks = <&dpll_usb_ck>;
> -		ti,clock-div = <1>;
> -		ti,autoidle-shift = <8>;
> -		reg = <0x01b4>;
> -		ti,clock-mult = <1>;
> -		ti,invert-autoidle-bit;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
> new file mode 100644
> index 000000000000..f597aedbad05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,fixed-factor-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI fixed factor rate clock sources
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +  - Sukrut Bellary <sbellary@baylibre.com>
> +
> +description: |

Don't need '|'.

> +  This consists of a divider and a multiplier used to generate
> +  a fixed rate clock. This also uses the autoidle support from
> +  TI autoidle clock.
> +
> +allOf:
> +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#

You can drop '/schemas/clock/ti/'

> +
> +properties:
> +  compatible:
> +    const: ti,fixed-factor-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,clock-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Fixed divider

Constraints?

> +
> +  ti,clock-mult:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Fixed multiplier

Constraints?

> +
> +  clocks:

       maxItems: 1

> +    description:
> +      Link to phandle of parent clock.

Drop the description

> +
> +  clock-output-names:

       maxItems: 1

> +    description:
> +      From common clock binding

Drop

> +
> +  ti,set-rate-parent:
> +    description:
> +      Propagate to parent clock
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - clocks
> +  - "#clock-cells"
> +  - ti,clock-mult
> +  - ti,clock-div
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus{
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock@1b4 {
> +            compatible = "ti,fixed-factor-clock";
> +            reg = <0x1b4>;
> +            clocks = <&dpll_usb_ck>;
> +            #clock-cells = <0>;
> +            ti,clock-mult = <1>;
> +            ti,clock-div = <1>;
> +            ti,autoidle-shift = <8>;
> +            ti,invert-autoidle-bit;
> +        };
> +    };
> -- 
> 2.34.1
> 
