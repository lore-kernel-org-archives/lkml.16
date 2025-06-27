Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6292F2F1FCB;
	Fri, 27 Jun 2025 02:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992394; cv=none; b=ruOBtuju1hAaqXrCf+rCOr11ljj6nV5tzg2jlC4BYVmzt+b/unTmEGp5s+a+tWvacvod5PQtWaOstCFwO/GO6YqNpjwZVT/fYfIhXEghppkRXx+Jw957kpOYtS2PNse9A7NxULfbAPwBSQjsL7a915ccy0x1a+2gfdCRlMmKlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992394; c=relaxed/simple;
	bh=LQms1tNsqpQ+nXQaH2KYlSJYLllazDGuxMMHkBk5CDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqVL5kHcAWinNgK/daDirLarsxyhIOMLwyAhTIQSkheHjH4BjDW3dwljZIY4P62K7u9fq5IuN9ZOVQSIfBv3m5IArEezi+6LHwRdH9z+4wKcKPlEGx0+XmaOG6bSnpALJ5qXKLmC0cZnuzSbQPeOBtlAlgPpM18UUpfRAMlkLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUmEdZKy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUmEdZKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF0CC4CEEE;
	Fri, 27 Jun 2025 02:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992394;
	bh=LQms1tNsqpQ+nXQaH2KYlSJYLllazDGuxMMHkBk5CDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUmEdZKy5Pt85iIZINjlu6Rlw+WTOVjloMjWfOUMo1LHk6H53Te0c1wsyd8N4vhTL
	 53kUWt5yc9a3iKDuavEg64TN6Q43K99IAq3pPC9PcKgpI2GIS6qBzQuYO1on5nVrYR
	 s/RG/HdAzJaAfI7nPRGHfihNXYmCSy6JFzq/V+1VKJVbAVezkkf5RpbZ9e37qV1vuL
	 2x0VbbiTZXMQQOMyud6dJRU217TdKsz5QbnJHwoljbfbZAha6cxt4d2MdAbgZaAfB2
	 vYXACkfMBqv7cZhM2n833mbduEvSFugpShoskJ6/RhxH1RGxrtHdftTa4CBFseiqjV
	 XaffibLNkkX2A==
Date: Thu, 26 Jun 2025 21:46:33 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <20250627024633.GA1656962-robh@kernel.org>
References: <20250617155231.2023977-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617155231.2023977-1-Frank.Li@nxp.com>

On Tue, Jun 17, 2025 at 11:52:30AM -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual call it as system reset controller(SRC), but it is not
> module as linux reset controller, which used to reset individual device.
> SRC work as reboot controller, which reboot whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> new file mode 100644
> index 0000000000000..cb8aa510a21f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#

Double '/'

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale vf610 System Reset Controller (SRC)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |

Don't need '|'

> +  IC reference manual call it as SRC, but it is not module as linux reset
> +  controller, which used to reset individual device. SRC work as reboot
> +  controller, which reboot whole system. It provide a syscon interface to
> +  syscon-reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,vf610-src
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    syscon@4006e000 {
> +        compatible = "fsl,vf610-src", "syscon";
> +        reg = <0x4006e000 0x1000>;
> +        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> -- 
> 2.34.1
> 
