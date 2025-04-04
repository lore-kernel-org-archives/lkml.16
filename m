Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D230A3D6F;
	Fri,  4 Apr 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779944; cv=none; b=hwbWD8Ri6WMOVm2RzxN3iZIdJVBYFOmEA6hC2Zp25fAWrH73wb2mE5RVcEcerH65EQKtutqzxg+XPQTQKkfH4+a6hEmEs+KU7STtEi94x0DvhbmU+ijqJQQeFHCHr6F+A89cCsklJIAa8DbSZdQnVtwCSbbj06lrw2K8zpnTh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779944; c=relaxed/simple;
	bh=EVLGz+q4eHgiZJTmh6liMRUu1PEh0/5UBRB7uM4oz9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuUnh+86E9MIoxLtroDOyjbkObKJxq8+TvNzwoGQ/BQWM4ubpreOL3MsHTPBFVZ7ckrvs1CB2+HENRJ5iCS32BJ3zIxV/Zjw/mTi9l0h2Q7Oq5sG+cQCa2DiS8ZyDTkowsIVlspsBt4Y27JAEutddFLfuDZyKTTuAAJU4DYwhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpRIytWN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpRIytWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1575C4CEDD;
	Fri,  4 Apr 2025 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743779944;
	bh=EVLGz+q4eHgiZJTmh6liMRUu1PEh0/5UBRB7uM4oz9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZpRIytWNGh6xPU4sOx6hAWTom1hqbV5uX++DNde2vD6oYf4O57B8N4WQJdyXQUYVh
	 CMRngFfHBGK/dNj8YlHPQMDFX807gVo2IUlbgZ1nDbGkubQSR8Zwzej/iy9/jJaOam
	 UkhPdGX7i8TZ0jBElK6byNxoN9oYamwf3kTQWr0Cammv2gBJ4+Kak7/79RWw/7eLGd
	 dLhJBqs3/8OdQefF+8o1N263dkx10qK03cqlrXExc+6IoRj1RhrjG0vl9gwytDdVu2
	 0/gqzN6B0olfmSlQBoapfHfQa2JyiR9YGf5HAOlk1bW8NBip67S7fBZiQxKcKJs483
	 RrSajqF/Tt91g==
Date: Fri, 4 Apr 2025 10:19:02 -0500
From: Rob Herring <robh@kernel.org>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <20250404151902.GA1400262-robh@kernel.org>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-2-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404014500.2789830-2-sbellary@baylibre.com>

On Thu, Apr 03, 2025 at 06:44:57PM -0700, Sukrut Bellary wrote:
> Covert TI autoidle clock txt binding to yaml.

Convert

2 patches in the series have the exact same subject. Really, nothing in 
all of the git history should ever repeat a subject. After all, you 
can't make the same change twice.

> 
> AutoIdle clock is not an individual clock; it is always a
> derivate of some basic clock like a gate, divider, or fixed-factor.
> This binding will be referred in ti,divider-clock.yaml, and
> ti,fixed-factor-clock.yaml.
> 
> As all clocks don't support the autoidle feature e.g.,
> in DRA77xx/AM57xx[1], dpll_abe_x2* and dpll_per_x2 don't have
> autoidle, remove required properties from the binding.
> Clean up the example to meet the current standards.
> 
> Add the creator of the original binding as a maintainer.
> 
> [1] https://www.ti.com/lit/ug/spruhz6l/spruhz6l.pdf
> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../devicetree/bindings/clock/ti/autoidle.txt | 37 --------------
>  .../bindings/clock/ti/ti,autoidle.yaml        | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/autoidle.txt b/Documentation/devicetree/bindings/clock/ti/autoidle.txt
> deleted file mode 100644
> index 05645a10a9e3..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/autoidle.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Binding for Texas Instruments autoidle clock.
> -
> -This binding uses the common clock binding[1]. It assumes a register mapped
> -clock which can be put to idle automatically by hardware based on the usage
> -and a configuration bit setting. Autoidle clock is never an individual
> -clock, it is always a derivative of some basic clock like a gate, divider,
> -or fixed-factor.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Required properties:
> -- reg : offset for the register controlling the autoidle
> -- ti,autoidle-shift : bit shift of the autoidle enable bit
> -- ti,invert-autoidle-bit : autoidle is enabled by setting the bit to 0
> -
> -Examples:
> -	dpll_core_m4_ck: dpll_core_m4_ck {
> -		#clock-cells = <0>;
> -		compatible = "ti,divider-clock";
> -		clocks = <&dpll_core_x2_ck>;
> -		ti,max-div = <31>;
> -		ti,autoidle-shift = <8>;
> -		reg = <0x2d38>;
> -		ti,index-starts-at-one;
> -		ti,invert-autoidle-bit;
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
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml b/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
> new file mode 100644
> index 000000000000..c995dae65cd6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,autoidle.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI autoidle clock
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +  - Sukrut Bellary <sbellary@baylibre.com>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  In TI SoC, some of the clocks support autoidle feature.
> +  It assumes a register mapped clock which can be put to idle automatically
> +  by hardware based on the usage and a configuration bit setting.
> +  Autoidle clock is never an individual clock, it is always a derivative
> +  of some basic clock like a gate, divider or fixed-factor.

Is this 3 1 sentence paragraphs or 1 paragraph with odd line wrapping? 
Blank line between paragraphs or re-wrap at 80 char. I prefer the latter 
as 1 sentence paragraphs doesn't make much sense.

> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  ti,autoidle-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      bit shift of the autoidle enable bit for the clock
> +    maximum: 31
> +    default: 0
> +
> +  ti,invert-autoidle-bit:
> +    type: boolean
> +    description:
> +      autoidle is enabled by setting the bit to 0
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock@1b4 {
> +        reg = <0x01b4>;
> +        ti,autoidle-shift = <8>;
> +        ti,invert-autoidle-bit;
> +      };
> +    };
> -- 
> 2.34.1
> 
