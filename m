Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4854217BA3;
	Sat, 26 Apr 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679273; cv=none; b=u9kVhDurmv+1eG6z8fz86juS8CrYXPYqwwXcHR2oNqbSbn2gs38FNmvQqlmOqjzZwYGSJ95HIO8B2Tz9GkUIFJH7SqgfmSW708ElFAa6CiySNiLwobRdh+LdBDjiGKEb6E6oCWcAxUSEd1R/mhAS09wD+q+9NT3pE+Qiu13MU+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679273; c=relaxed/simple;
	bh=jr3XRJfORT4XwYRsSfCCGcYkWr9+PGGChSVSgni5WAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StCiHeiM6JRJgykGDx4lT5IIhN5EW2YIB6pQxjP/KU3mZ+pJ9U0gsfiAwgCc4RLTCuD0xfOqHshHUf6LNEGKz9l/3FWPv1u3VhksPSGup0EUIpRRRO9cgxN+HeHhcsP4ItbBAZlRW+jhHMxhwUkAfltIk8aOEnCMLPEhY8kaH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QshoRKIM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QshoRKIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79621C4CEE2;
	Sat, 26 Apr 2025 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745679272;
	bh=jr3XRJfORT4XwYRsSfCCGcYkWr9+PGGChSVSgni5WAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QshoRKIMj7lXu+pq5SP5kVW/YAWsq8+LODBex/ZUGL31ib3dtUavavNoYyj3Mu/bl
	 vqtoJt+lHLzsaGDvF5x0ndA+Mrb/AKxwu9Tlz/+mxXnEajx1tVIRgdlp/7fjL2/PaC
	 mn1g4fcsrHO/R6JBq3y2BsanLzlLutGRmrsfE0VJXneDPucIuQOC8dW8ulNWiJUYy0
	 zvuLWq3eagjRiV5lvsR+CvGUcxcIVSnJVCL0f6rViV6H0/JyGu6LUvpQKypbXqMMFh
	 6F9WEobmhWC46oJlK+AigeksFTCzBk6omScCeTiUXZYtPzPC2zPmRXEeznZZhyzBiY
	 JnLuGXHQHJVgg==
Date: Sat, 26 Apr 2025 22:38:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: riscv: Add SiFive HiFive Premier
 P550 board
Message-ID: <aAzvy7ZJqPv6jW3p@xhacker>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>

On Thu, Apr 10, 2025 at 08:55:13PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add DT binding documentation for the ESWIN EIC7700 SoC and
> HiFive Premier P550 Board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
> new file mode 100644
> index 000000000000..c603c45eef22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/eswin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN SoC-based boards
> +
> +maintainers:
> +  - Min Lin <linmin@eswincomputing.com>
> +  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +  - Pritesh Patel <pritesh.patel@einfochips.com>
> +
> +description:
> +  ESWIN SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,hifive-premier-p550
> +          - const: eswin,eic7700
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bfcdf2bced61..f90c940f286c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8768,6 +8768,13 @@ L:	linux-can@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/can/usb/esd_usb.c
>  
> +ESWIN DEVICETREES
> +M:	Min Lin <linmin@eswincomputing.com>

IMHO, this series isn's sent by this email, and I didn't find any
Min's commit history in the Linus tree, and even didn't find any
discussions or code reviews in the mailist, so is it suitable to add
to maintainers? I think maintainers doesn't work like this flow.

> +M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +M:	Pritesh Patel <pritesh.patel@einfochips.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/eswin.yaml
> +
>  ET131X NETWORK DRIVER
>  M:	Mark Einon <mark.einon@gmail.com>
>  S:	Odd Fixes
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
