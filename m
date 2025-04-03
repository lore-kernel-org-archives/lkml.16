Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB753198E75;
	Thu,  3 Apr 2025 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663260; cv=none; b=mxjVktPY5H26GCNC6rxJPUoPBTk7BKWe7L14Qa7M5FMgtBVYCsoIfqO1NIf3s6ARHgROEYYwJR1Etggu2GR1CO4mtH4L7qZUuUwhDWoA5R59+4xur2pTIX5vOqGtbba+fFVrJrzjPqfDNsKD0gzOsOSC+58RCqRfyyUhjPrbKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663260; c=relaxed/simple;
	bh=KHk0LlW3CtH57DvJVXX8I9LqP93HSfda2BD9pDiyaFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdYbVlPoLOUdvB5hbP2lVB2AbTLUvf0YxnAgxAlypo0EyfQ21zZIybp5f7h6V1IQMdloFHAn3vP1mbot9teIKqQFncroprcjtiUNMTO8V5NP50/gbVZhOYoDGBU3w6V10UB5ZTXABqsDKSik9fwZ0tGS/+IwJNJZVl4C509Ux+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKTQZ4IA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKTQZ4IA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731C0C4CEE3;
	Thu,  3 Apr 2025 06:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743663260;
	bh=KHk0LlW3CtH57DvJVXX8I9LqP93HSfda2BD9pDiyaFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKTQZ4IA9Il4jTt8qh8w6B+f1SH04MfsUYWxKERU4Y1mk6rdjSC36kSeU4r2LXqBB
	 vspxyAxHnPMEkQPf2/Wf3XX9/ulGahuh2MXpZpuf+leOhuk68jhO6kwrwuG6XUvPJT
	 hLzmZ2A7bOb0UXvdAu6qByBD2y+dtd74wQCAGJ5fX1IPwTV4DryMvC5fpeSnRiWIb/
	 Hn2KdRZluYC+6RH0lr25X3fcMRCe0Nd26jFgcTes7uRFIynRzJZt7S+GUHWT441T7S
	 YjK2DXlz7AuGqzJEsM7I02GUtOxF2YazAbUaR6RQU+YSt2oxGPmwKnCGIUHikc0ZCl
	 92R2pnRZQoEKw==
Date: Thu, 3 Apr 2025 08:54:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	jassisinghbrar@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: Add devicetree binding for
 bcm74110 mbox
Message-ID: <20250403-misty-jovial-duck-8f1cd8@krzk-bin>
References: <20250402223619.358818-1-justin.chen@broadcom.com>
 <20250402223619.358818-2-justin.chen@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402223619.358818-2-justin.chen@broadcom.com>

On Wed, Apr 02, 2025 at 03:36:18PM -0700, Justin Chen wrote:
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
> new file mode 100644
> index 000000000000..8c3dfffa515f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/brcm,bcm74110-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM74110 Mailbox
> +

A nit, subject: drop second/last, redundant "devicetree binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +maintainers:
> +  - Justin Chen <justin.chen@broadcom.com>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +
> +description: Broadcom mailbox hardware first introduced with 74110
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm74110-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2

This changed... You need now list items instead.

> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is channel type and second cell is shared memory slot
> +
> +  brcm,tx:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Mailbox transmit doorbell
> +
> +  brcm,rx:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Mailbox receive doorbell
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +  - brcm,tx
> +  - brcm,rx
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>

... and where do you use it?

> +
> +    brcm_mailbox: brcm_mailbox@a552000 {

Only partially improved.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        #mbox-cells = <0x2>;
> +        brcm,rx = <0x7>;
> +        brcm,tx = <0x6>;
> +        compatible = "brcm,bcm74110-mbox";

Nothing improved. Didi you read the DTS coding style?

> +        reg = <0xa552000 0x1104>;
> +        interrupts = <0x0 0x67 0x4>, /* DQM 7 */
> +                     <0x0 0x66 0x4>; /* DQM 6 */

Looks like standard flags, so use proper defines.

> +    };
> +
> +    scmi {

Drop the node, not related.

Best regards,
Krzysztof

