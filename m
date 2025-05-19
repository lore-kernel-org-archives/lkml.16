Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7220928369F;
	Mon, 19 May 2025 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675610; cv=none; b=vGL5LwpwQka5dKBV05TZiJoZ+Om0odin13JO/zS6hC7ETE6yDogn6hGlaxWHVnED/WSs6wJhkTulTx2Mid2HhMN5V7VX0u7nNQ09dWWEI+a13aY8h4cUaMmY+2Oy6Wt7oKkFRn/IsXS3FPB0aXfoXCl0KCesso66zDmvrimhtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675610; c=relaxed/simple;
	bh=h7V5zlLLmpxyamsNWnoGoWuIKl2M4zypQlTV2IRSXhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Py5CnSd/ILWrqvkhzqeLEsXexHktptpn3gFu9gw7HUtoQk58W52HOkUeQLAVvH3oVsGp/L4rZZfvzQ7ms8Jxvumkgu8EsLua38pSlSC6DTArlw5xx5yrJAYqDIh5V31fDwYWFW2SMHQr+vQHXLkt9+jq4w538nDpSks9EuXKr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA3kVei6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA3kVei6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27DFC4CEE4;
	Mon, 19 May 2025 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747675609;
	bh=h7V5zlLLmpxyamsNWnoGoWuIKl2M4zypQlTV2IRSXhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lA3kVei6l88TJII9OoHBPTluRg6LW+Q+SitMeZ+aXKahz0zDQ2Da62QX9vCBDk9Um
	 FuTTtKSyVALSwLI9XiYkPnxhE280IY4F3/6MTvVlX1lGtL8eZrzG43HiPoKylvPaMR
	 3eYKw0xaJlYcm9sDKwMhTShnPLQP/vxW9J91V3EJZFtUOp5+JuTiSL9dy5ew09t9dw
	 8lfbfWVET5sf9X40mZWXe5BRij7BUX+nykYmqYzKgZ1mO/+UUO6knyW9wxM++JijRC
	 YPWjdEqt3zRscodXo/FnBTQ8ffs+lmq0qJLZzBLxof7BU7lYQL/Tjn6e/voHXLeLZ1
	 RfKjSXpanrxtA==
Date: Mon, 19 May 2025 12:26:47 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/23] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Message-ID: <20250519172647.GA2603742-robh@kernel.org>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-3-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-3-apatel@ventanamicro.com>

On Sun, May 11, 2025 at 07:09:18PM +0530, Anup Patel wrote:
> Add device tree bindings for the common RISC-V Platform Management
> Interface (RPMI) shared memory transport as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> new file mode 100644
> index 000000000000..3194c066d952
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a common shared
> +  memory based RPMI transport. This RPMI shared memory transport integrates as
> +  mailbox controller in the SBI implementation or supervisor software whereas
> +  each RPMI service group is mailbox client in the SBI implementation and
> +  supervisor software.
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-shmem-mbox
> +
> +  reg:
> +    oneOf:
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +          - description: P2A request queue base address
> +          - description: A2P acknowledgment queue base address
> +          - description: A2P doorbell address
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +          - description: P2A request queue base address
> +          - description: A2P acknowledgment queue base address
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +          - description: A2P doorbell address
> +      - items:
> +          - description: A2P request queue base address
> +          - description: P2A acknowledgment queue base address
> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: p2a-req
> +          - const: a2p-ack
> +          - const: a2p-doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: p2a-req
> +          - const: a2p-ack
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: a2p-doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack

This can all be just:

minItems: 2
items:
  - const: a2p-req
  - const: p2a-ack
  - enum: [ p2a-req, a2p-doorbell ]
  - const: a2p-ack
  - const: a2p-doorbell


> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The RPMI shared memory transport supports wired interrupt specified by
> +      this property as the P2A doorbell.

"The RPMI shared memory transport P2A doorbell"


> +
> +  msi-parent:
> +    description:
> +      The RPMI shared memory transport supports P2A doorbell as a system MSI
> +      and this property specifies the target MSI controller.
> +
> +  riscv,slot-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 64
> +    description:
> +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> +
> +  riscv,a2p-doorbell-value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x1
> +    description:
> +      Value written to the 32-bit A2P doorbell register.
> +
> +  riscv,p2a-doorbell-sysmsi-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The RPMI shared memory transport supports P2A doorbell as a system MSI
> +      and this property specifies system MSI index to be used for configuring
> +      the P2A doorbell MSI.
> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      The first cell specifies RPMI service group ID.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - riscv,slot-size
> +  - "#mbox-cells"
> +
> +anyOf:
> +  - required:
> +      - interrupts
> +  - required:
> +      - msi-parent
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (RPMI shared memory with only 2 queues):
> +    mailbox@10080000 {
> +        compatible = "riscv,rpmi-shmem-mbox";
> +        reg = <0x10080000 0x10000>,
> +              <0x10090000 0x10000>;
> +        reg-names = "a2p-req", "p2a-ack";
> +        msi-parent = <&imsic_mlevel>;
> +        riscv,slot-size = <64>;
> +        #mbox-cells = <1>;
> +    };
> +  - |
> +    // Example 2 (RPMI shared memory with only 4 queues):
> +    mailbox@10001000 {
> +        compatible = "riscv,rpmi-shmem-mbox";
> +        reg = <0x10001000 0x800>,
> +              <0x10001800 0x800>,
> +              <0x10002000 0x800>,
> +              <0x10002800 0x800>,
> +              <0x10003000 0x4>;
> +        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell";
> +        msi-parent = <&imsic_mlevel>;
> +        riscv,slot-size = <64>;
> +        riscv,a2p-doorbell-value = <0x00008000>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.43.0
> 
