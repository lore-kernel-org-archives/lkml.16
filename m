Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858651D0E2B;
	Mon,  7 Apr 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035539; cv=none; b=eHSR2CXo4HsF+/xyrCW5QDvnKd78gA1qLMnJMPPSxsZi1TR+nGttL6UUNGqYt0AD+aXKPrzvChM2P/vWnvhWkx/vZv8oGvri1n7JU9ZaUfW7cLPeDoTljvjduMsMohRa82G4ucI6DFB/NBU8jIejgZtIzUUfZt5fHRqvYEfq4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035539; c=relaxed/simple;
	bh=GolMPkoFdH8ez2BCh2rarCfeNX23XY2yQI7bA6iqZKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGTswYXA7qiKjsoMYUQfUP+6rv6C2e3PyRWFbb7wa6hKhfIYnKaEbSDkHVesKFIXqfaVQyuYVX9gpNGskwWo2+DEWrehjIOhFDdxLyRhLc9jZVW1VBQzPe6ZWxfiJFTGj1tDE2zxIAQ8XqPg45+WDuOZH1oCOVpQgsQEqPTfIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmKPTvNK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmKPTvNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2DDC4CEE7;
	Mon,  7 Apr 2025 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035536;
	bh=GolMPkoFdH8ez2BCh2rarCfeNX23XY2yQI7bA6iqZKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmKPTvNKo7GH841Ti6r12nXy0r591k3cCRhCheNVDeGjMLe7DE1T7RrIltDkwUISM
	 HmSPJhvd8shdr77+OT3M9ObmjOznvTxdAv973uZ8R4yWn235nHN1dUbEUUJrNzMz3c
	 /1HL3yjjEUHKMig9/ZJ85XPBjT7Wsxel76i7thVSJFr8loqm+QLyelvtQ72d5IyR73
	 c6oee/XjjzuFiAv1ECR3WewFHG90oPEE5TLQn0/f6nlc9REetB6OUEAaHG3g4mgZin
	 HuBH3d4uVxRdzfgATFW6uifZg8EW8MeVbzV/gpqljNoriCd4oThWx5TI1FaiiVY1Li
	 v+N0KNmU9xIbg==
Date: Mon, 7 Apr 2025 09:18:54 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	daniel.lezcano@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	tim609@andestech.com
Subject: Re: [PATCH 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <20250407141854.GA2277442-robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-6-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-6-ben717@andestech.com>

On Mon, Apr 07, 2025 at 06:49:33PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine timer.
> 
> The RISC-V architecture defines a machine timer that provides a real-time
> counter and generates timer interrupts. Andes machiner timer (PLMT0) is
> the implementation of the machine timer, and it contains memory-mapped
> registers (mtime and mtimecmp). This device supports up to 32 cores.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/timer/andestech,plmt0.yaml       | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/andestech,plmt0.yaml b/Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> new file mode 100644
> index 000000000000..e0ea3ce86b76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/andestech,plmt0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes machine timer
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - andestech,qilai-aclint-mtimer
> +      - const: andestech,plmt0

Drop the fallback.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 32

Here and in the plicsw, it would be good to describe what determines how 
many interrupts there are and what's the mapping (index 0 is ???, index 
1 is ???).

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
> +    interrupt-controller@100000 {
> +      compatible = "andestech,qilai-aclint-mtimer", "andestech,plmt0";
> +      reg = <0x100000 0x100000>;
> +      interrupts-extended = <&cpu0intc 7>,
> +                            <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 645d7137cb07..d1e1b98dfe7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20730,6 +20730,7 @@ M:	Ben Zong-You Xie <ben717@andestech.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
>  F:	Documentation/devicetree/bindings/riscv/andes.yaml
> +F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
>  
>  RISC-V ARCHITECTURE
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
> -- 
> 2.34.1
> 
