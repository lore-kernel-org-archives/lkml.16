Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256A1D5CD4;
	Mon,  3 Feb 2025 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623102; cv=none; b=B5leSLFVaXOp4ubEef2NLk3dWEcIMkxtCDZ7ju29nK7FIjO+tblfXmealg6iBAAen5CcmnGaLbUfodG8o3KHY8BqiVnZw+rDtmz5ejwMgu/0fSA+8NNQsRCd0+F+DTfFWSGvUrTbV8JNETAg/YeBsm9GTW6Wo2b/1uLFXE1V1U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623102; c=relaxed/simple;
	bh=iYGhuwkNNXZEPUxNZb0JxEm0OoeaCNKV9fe+AsGA27o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnQulLj+cHhrCPbvShwycER847R1EBVGIc5/es6cjgDLR/e4N7q5cBtBhl2Hli/X+3ZFSPCazb7Zqz2lCrWVHmVLEQxg0eWhdW8qG35KJzWi+hnH9xKDD5XESHDrNQOxUw02LLvEC2bkywa5EXrKuasliDbop07EiZClUlqivI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7YMIw/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7YMIw/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540E4C4CEE0;
	Mon,  3 Feb 2025 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623101;
	bh=iYGhuwkNNXZEPUxNZb0JxEm0OoeaCNKV9fe+AsGA27o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7YMIw/NSk6lI7jrB6tw2ZC1zNUsQafp0f5SoMz7IzGaa08BT4HSR2sOCcCL3JBd4
	 wqhu/lxxL7nsJlTzIReAsfosNZ8feBne3/PjPKTIIVpX1pCvcyWxEzAxKCw4f63wGv
	 skaGSOXSow5S9tFhdHVQgPNTxi79Vst1Z/VT5tK5yYKUBp186mFpPvwNGm5866nUL5
	 c+OydER8px3twwe3ZrmKT0TloQrL+f3YTpsmzzD+CEnirr4BSTvGV+UGZ+7ca7jgMQ
	 pYSfjT6yhITMASwBLI2vphmNbcBLFXt7+iTmUo/KOKKuC3reDGGEPWBkWqFMGkQ5np
	 ZvX4Fa9mGWSgg==
Date: Mon, 3 Feb 2025 16:51:40 -0600
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
Subject: Re: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V
 RPMI clock service group
Message-ID: <20250203225140.GA483650-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-9-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-9-apatel@ventanamicro.com>

On Mon, Feb 03, 2025 at 02:18:57PM +0530, Anup Patel wrote:
> Add device tree bindings for the clock service group defined by the
> RISC-V platform management interface (RPMI) specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/clock/riscv,rpmi-clock.yaml      | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> new file mode 100644
> index 000000000000..c08491c04926
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI clock service group based clock controller
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines clock service group for accessing
> +  system clocks managed by a platform microcontroller.
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Intended for use by the SBI implementation in machine mode or
> +          software in supervisor mode.
> +        const: riscv,rpmi-clock
> +
> +      - description:
> +          Intended for use by the SBI implementation in machine mode.
> +        const: riscv,rpmi-mpxy-clock
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message proxy.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software. This property is mandatory when using
> +      riscv,rpmi-mpxy-clock compatible string.

That constraint can be expressed as:

dependentSchemas:
  riscv,sbi-mpxy-channel-id:
    properties:
      compatible:
        const: riscv,rpmi-mpxy-clock

Please double check that works.

> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      This property is mandatory when using riscv,rpmi-clock compatible string.

Similar constraint here.

Though the only thing the 2 compatibles have in common is 'mboxes'. I 
think it would be better to just split this into 2 docs.

> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mpxy_mbox: sbi-mpxy-mbox {

mailbox {

> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;
> +    };
> +    rpmi-clk {

clock-controller {

> +        compatible = "riscv,rpmi-clock";
> +        mboxes = <&mpxy_mbox 0x1000 0x0>;
> +        #clock-cells = <1>;
> +    };
> +...
> -- 
> 2.43.0
> 
