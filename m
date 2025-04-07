Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF717AE11;
	Mon,  7 Apr 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035429; cv=none; b=my3sMWJY4oJLNS7AIKLfiPE+adGPL6XLuY4soU4IJ/P3oGhzh/asuLoF1h7H9D4tz4dcouuFaeigTMkhN3Ilc9OQp2cLtwkyAJ3wwJJzanyUlY2kas3vuJhGenOSjiUiKuRDAsi2KeSVtBLMf/rExLnzQb+60xac5z3/WkXpeZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035429; c=relaxed/simple;
	bh=Ou7KZNj8MSOzjom14ZDyBWFOBTkkVIoMAGHEMYI9KJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEalrnQBCpSzLf1e+z2dmcxVNLD3/tE2n0E0QnzbvOVo8t+uWIAJ3WdV+5WJoll+Al1nXtCnHDzYNE+hJtS6IDPVb7sZms13AXBmOs5wwhqC8vIi94wOpCEu3w5mAEZEVH3VVa70vhpSsS30AK1hzCY96hUM1wg637d8rM9wlz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbKPtiIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbKPtiIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B0BC4CEDD;
	Mon,  7 Apr 2025 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035429;
	bh=Ou7KZNj8MSOzjom14ZDyBWFOBTkkVIoMAGHEMYI9KJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbKPtiIzsOuPBHNzuq5ufz2iufQKkuB9EK+/OAL+g0p9lSxjdzqYL1rOeHmmf/KQ9
	 gHwcM6q5NYcSK1KMYu09RsHfmIzebugWAtJxh1bbCPvczaae8+wW+FLeStDjmEYxTJ
	 WelSfYDKcPX08Jdx9E7hOXRSDJWKbSy9b093oOU4ZX2QbnbaKLgxqt6UbVlHT8l3WR
	 w2eXNgqNI0gCR/QI/LyqYUOUzqmdtrzwkGwSk97ViL5gvw5xQvEGpGoGqzGDZgfGE8
	 tJtlDrv18RiNfOh+K5mzuv6oTsvOkBsjlPv20G+XrOknMSg6UbU0hUWJCcpDW5+mTk
	 KpvGBULMyd3sA==
Date: Mon, 7 Apr 2025 09:17:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	daniel.lezcano@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	tim609@andestech.com
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <20250407141708.GA2250717-robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-5-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-5-ben717@andestech.com>

On Mon, Apr 07, 2025 at 06:49:32PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine-level software
> interrupt controller.
> 
> In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> second time with all interrupt sources tied to zero as the software
> interrupt controller (PLICSW). PLICSW can generate machine-level software
> interrupts through programming its registers.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../andestech,plicsw.yaml                     | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> new file mode 100644
> index 000000000000..5432fcfd95ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/andestech,plicsw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes machine-level software interrupt controller
> +
> +description:
> +  In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> +  second time with all interrupt sources tied to zero as the software interrupt
> +  controller (PLIC_SW). PLIC_SW can generate machine-level software interrupts
> +  through programming its registers.
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - andestech,qilai-plicsw
> +      - const: andestech,plicsw

Drop the fallback. If you have another implementation that's compatible, 
then andestech,qilai-plicsw will be the fallback.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 15872
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    interrupt-controller@400000 {
> +      compatible = "andestech,qilai-plicsw", "andestech,plicsw";
> +      reg = <0x400000 0x400000>;
> +      interrupts-extended = <&cpu0intc 3>,
> +                            <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0ccac1cca29..645d7137cb07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20728,6 +20728,7 @@ F:	include/linux/irqchip/riscv-imsic.h
>  RISC-V ANDES SoC Support
>  M:	Ben Zong-You Xie <ben717@andestech.com>
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
>  F:	Documentation/devicetree/bindings/riscv/andes.yaml
>  
>  RISC-V ARCHITECTURE
> -- 
> 2.34.1
> 
