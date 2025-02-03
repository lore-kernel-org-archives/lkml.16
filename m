Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0E18B46E;
	Mon,  3 Feb 2025 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738621822; cv=none; b=lNXb6m1PZZSOWAHD+fLNVgsmCGaWqL3HRxdWWNY8hRroJzC5cQuiptncPQCi4PPYoTM6jZck/2J+SqMth/56TZKu2e8TJIJ9FB+Su2I/pq1sIq6Nm5Vrjr1TGifdSnrsbzvEgukpG6rFzd0AShhwP5FJbCrn3B02P195LRGovWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738621822; c=relaxed/simple;
	bh=nQVY1dDboaeGX4s/kBcCQBGi1C5MiXmG7BkFyi87hcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhHI4MerArmT4d4KjHktef337UHa/81RBqB4q2VQbARBSZTVXwu42WqWsZIeXc2CnamqabJHrjCfS6C/pOcBapykuPGTlR+IM5reE/Q4eYFPJjBAeo3SEydtpPS0dFMXN4/j70SgtXzAxYo9mXx5Z3qvwB1r+s1C99kQiEm59eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gg38RWDy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gg38RWDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F2DC4CED2;
	Mon,  3 Feb 2025 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738621821;
	bh=nQVY1dDboaeGX4s/kBcCQBGi1C5MiXmG7BkFyi87hcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gg38RWDyo4/DO/c18+GqHN9+P5Wj0kKkr03sEttx6ObUNrE30x4KSUURwsJdmro44
	 r1LafdcOekf3nL3YGCvs+3+yW00QdBSEe+8OyaWQLKifKsJ4fMJf4LDHz20+Moa8OQ
	 qvQKnaUDlTbuVIOTIsmOunydTlpH74XO4lmUqJc++rYDB2hvFYjn6RwK8RFSwel9w/
	 wHL56G7hOk8/eBS+lDJcg4XvbVAf2PVXLYqMeVh60gmDqF4mudpvg1YGdHMIAYUz+w
	 1v3HZICV3H8pjbLZHYHudE11xTWGwErGoW/5juK8WYRrXbFSA/61sXhQcB4IpEG5iK
	 XgapaV/Jv7wvg==
Date: Mon, 3 Feb 2025 16:30:20 -0600
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/17] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Message-ID: <20250203223020.GA277987-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-3-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-3-apatel@ventanamicro.com>

On Mon, Feb 03, 2025 at 02:18:51PM +0530, Anup Patel wrote:
> Add device tree bindings for the common RISC-V Platform Management
> Interface (RPMI) shared memory transport as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> new file mode 100644
> index 000000000000..c339df5d9e24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> @@ -0,0 +1,150 @@
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
> +          - const: doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: p2a-req
> +          - const: a2p-ack

These first 2 items lists can be combined with the addition of 
'minItems: 4'

> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +          - const: doorbell
> +      - items:
> +          - const: a2p-req
> +          - const: p2a-ack
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The RPMI shared memory transport supports wired interrupt specified by
> +      this property as the P2A doorbell.
> +
> +  msi-parent:
> +    description:
> +      The RPMI shared memory transport supports MSI as P2A doorbell and this
> +      property specifies the target MSI controller.
> +
> +  riscv,slot-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 64
> +    description:
> +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> +
> +  riscv,doorbell-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0xffffffff
> +    description:
> +      Update only the register bits of doorbell defined by the mask (32 bit).
> +
> +  riscv,doorbell-value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x1
> +    description:
> +      Value written to the doorbell register bits (32-bit access) specified
> +      by the riscv,db-mask property.

You mean riscv,doorbell-mask?

I'm confused why you would need both? If the value to write is fixed 
here, then why do you need a mask? You could just mask the value here.

I assume there's some dependency between these 2 properties. That needs 
to be captured with 'dependencies'.

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
> +              <0x10090000 0x10000>,
> +              <0x100a0000 0x4>;
> +        reg-names = "a2p-req", "p2a-ack", "doorbell";
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
> +        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "doorbell";
> +        msi-parent = <&imsic_mlevel>;
> +        riscv,slot-size = <64>;
> +        riscv,doorbell-mask = <0x00008000>;
> +        riscv,doorbell-value = <0x00008000>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.43.0
> 
