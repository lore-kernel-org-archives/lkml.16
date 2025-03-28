Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B579CF;
	Fri, 28 Mar 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147086; cv=none; b=baPMoD88mvfjJRetlDVciuoyVZGy97imHGI6nC3QCS3Vaqe/89Sunk9PSC2e4TV+B+f0qGTYBUNeWe6lIrNuJUeN8v7bBFkchWKw001L0BMOFo0d/iBUNuMPJYBZ0lvYRarVvxA3m7fheVsE83AehVLtIBbFmxxI/cKNem3yNeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147086; c=relaxed/simple;
	bh=X385fMj17leBB04sD/T6QrP7VnyZAU3eu/xkGSimC8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jbfr2IO/GHNBc6v1y2GsK1bYcCUH7xi43plISvDs+yu2UtLCoeyAnkJLqv1S1+6E1CfghWXS+owq0GxL+k6yuK1/0ry/aOpO9N7cum8z3RVVecMtZoxgCWXLgbvPYuKN7UtfpOz+tgrUPZ1rZaoOPPRgr2I+RR7n5lMjuMMOZYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2YaOSpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2YaOSpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E64C4CEE4;
	Fri, 28 Mar 2025 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743147085;
	bh=X385fMj17leBB04sD/T6QrP7VnyZAU3eu/xkGSimC8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l2YaOSpNeVJk9GfLyIfbGP9VpC/ZYppwpfUVnOGCmsXyq7/3NWJpIcBClr8/vjcNF
	 rsp9BQW6l86KevHIp179YB6zSFVulmpO76Fz714vQxtW/2fahd4TRBp2JXUZObQyL9
	 zKnYSAK96nzQOC1IxaK+qiYQnrtZXPcEZB7xYj3uZIiZglGQeEpXVPTvrBz98AXQZO
	 m2VVi5V3SdbVMDA0bD9sbqQDc49LroZ3woiEXzNz0BfuewGaGd39hzK1wSEVAgVInx
	 rIEH8SSvhHBAvQFg23Ja/biqWAC2mJ7IHT0fLdUBO/ds6uN7LYVES8AjOGT5CUj8EK
	 gprMnk31Gq+BQ==
Message-ID: <e7f51014-10b2-4f9c-9929-f2a4f32b023c@kernel.org>
Date: Fri, 28 Mar 2025 08:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: Add devicetree binding for
 bcm74110 mbox
To: justin.chen@broadcom.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jassisinghbrar@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
References: <20250327221628.651042-1-justin.chen@broadcom.com>
 <20250327221628.651042-3-justin.chen@broadcom.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250327221628.651042-3-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 23:16, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> Add devicetree YAML binding for brcmstb bcm74110 mailbox used
> for communicating with a co-processor.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Bindings are before users, see DT submitting patches.

> ---
>  .../bindings/mailbox/brcm,bcm74110-mbox.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
> new file mode 100644
> index 000000000000..139728a35303
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/brcm,bcm74110-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM74110 Mailbox Driver

Driver as Linux driver? Drop, bindings describe hardware.

> +
> +maintainers:
> +  - Justin Chen <justin.chen@broadcom.com>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +
> +description: Broadcom mailbox driver first introduced with 74110

Same comments.

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
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is channel type and second cell is shared memory slot
> +
> +  brcm,mbox_tx:

No underscores. See DTS coding style.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Mailbox transmit doorbell

Why is this needed in DT? How many instances do you have in one SoC?
Where is the SoC DTS?

> +
> +  brcm,mbox_rx:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Mailbox receive doorbell
> +
> +  brcm,mbox_shmem:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 2
> +    description: Mailbox shared memory region and size

No, use existing properties, e.g. memory region.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +  - brcm,mbox_tx
> +  - brcm,mbox_rx
> +  - brcm,mbox_shmem
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +        brcm_pmc_mailbox: brcm_pmc_mailbox@a552000 {

Use indentation we expect. See writing schema, example-schema.

> +                #mbox-cells = <2>;
> +                compatible = "brcm,bcm74110-mbox";

Fix order, see DTS coding style.



Best regards,
Krzysztof
