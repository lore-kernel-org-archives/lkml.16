Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858D2C1A2;
	Wed, 25 Jun 2025 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866608; cv=none; b=U0oijvQ1c4XtbROd+Oy9ZiWyd6TYdldgQh54/untuA7SFgoPcdSnQZUC7mXXKNG+nW0dDWyKmv2YCjQF3T4CgMrgX3CMYkmR8+FWQWyJ2ujBCtyodS0bqLz2fvgBRMEWgPol1xoRU1zo/mkicNgWhzCpybZydKuWwWff3zTUOYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866608; c=relaxed/simple;
	bh=Ikf1eFPSR3XrPLb5x/K+vYHAnLYeiM6FKIqk0udcbtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjXVSkyI+v3Ah232xH9THtaWHNsge76QhdHuXA2gy76h7DAAriDWv+E9oN+ja5PRp+6Ek98HGYUsklCsPJuT1D5Jl5VvtaKxtOdpGQDG016WeeIc8MXGAG7FQWIl4wvt4xVVJMD23jSMz3OHsR7ZyPOXGO21stiaQzqrbq4oqL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtIVAZau; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtIVAZau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E806BC4CEEB;
	Wed, 25 Jun 2025 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750866608;
	bh=Ikf1eFPSR3XrPLb5x/K+vYHAnLYeiM6FKIqk0udcbtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtIVAZauBqbEd5GWyvnZRNeQl3H6C176E1r7tRYFZFIW4SPAg0sQhb8cDSSM5Cqt0
	 AyUl2Pyh91tEfw3ZmF2baKJzGWXHjZteahiL0bVheUEhChUraFDAEBhgMdDbMRnGlO
	 IREv+IcsUfawLUnMDueEjgXqxVdio3BZdY7P58SQiqGHpDafnzFg61pfawQCQZ3S6V
	 SnI9Tayw35cwDEx6ZjsFTdlsYf1e3dDNEQEfXg+sqIere1bQVLbUy2luTPDUlypcWM
	 tDgqnqbF/oR3YKfD4Lr1J4U2qIX/+wjPGXAz/kqTk2BvLzNKZ34ynmSffPX23l2Smx
	 DPKs5MNB+HqzA==
Date: Wed, 25 Jun 2025 10:50:07 -0500
From: Rob Herring <robh@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
Message-ID: <20250625155007.GA1489062-robh@kernel.org>
References: <20250625073417.2395037-1-jammy_huang@aspeedtech.com>
 <20250625073417.2395037-2-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625073417.2395037-2-jammy_huang@aspeedtech.com>

On Wed, Jun 25, 2025 at 03:34:16PM +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

You didn't add Krzysztof's Reviewed-by...

> ---
>  .../mailbox/aspeed,ast2700-mailbox.yaml       | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> new file mode 100644
> index 000000000000..0a5f43de5f28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 mailbox controller
> +
> +maintainers:
> +  - Jammy Huang <jammy_huang@aspeedtech.com>
> +
> +description:

You need '>' to preserve paragraphs.

> +  ASPEED AST2700 has multiple processors that need to communicate with each
> +  other. The mailbox controller provides a way for these processors to send
> +  messages to each other. It is a hardware-based inter-processor communication
> +  mechanism that allows processors to send and receive messages through
> +  dedicated channels.

And a blank line between paragraphs.

> +  The mailbox's tx/rx are independent, meaning that one processor can send a
> +  message while another processor is receiving a message simultaneously.
> +  There are 4 channels available for both tx and rx operations. Each channel
> +  has a FIFO buffer that can hold messages of a fixed size (32 bytes in this
> +  case).

And here.

> +  The mailbox controller also supports interrupt generation, allowing
> +  processors to notify each other when a message is available or when an event
> +  occurs.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-mailbox
> +
> +  reg:
> +    maxItems: 2
> +    description:
> +      Contains the base addresses and sizes of the mailbox controller. 1st one
> +      is for TX control register; 2nd one is for RX control register.

Instead, just:

items:
  - description: TX control register
  - description: RX control register

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mailbox@12c1c200 {
> +        compatible = "aspeed,ast2700-mailbox";
> +        reg = <0x12c1c200 0x100>, <0x12c1c300 0x100>;
> +        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.25.1
> 
