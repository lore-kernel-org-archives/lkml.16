Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33B1D5CD4;
	Mon,  3 Feb 2025 22:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623527; cv=none; b=E5egnUoB+xa+gFvov6+6N6K8Oto3OjNM8yQhjz4qds3yCHrAncaqGXLiYbfYdGp/4pgWbLlic1Hh3GW3uxZTX7BjWueyjS/U97ji5XqyMYsln4IjFVofsmufOGd4kxTyEwW4DIu1YGA2D7PausFxplu8juVaADNl2dM2JFUK4EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623527; c=relaxed/simple;
	bh=Y2i2DGPHFIdPzHIKRjI2VaiGai6KPkZD5HD5AgVbUAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI27CmyOJ7FpbTS1b/FdxQa+JyUmlNu0ubGACRWupbermQ8l2Xjrf967sXAwLUrHB1uU+TuOvxDHDCcPyqBgZL1V8ezQabgy4D9WZgBOxtmG/kCMB5/MxtvkEyaru4+qRxp9dI3RaRi81YaYuc7wNQdalzCRhuffeWCUy1DVe1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bu/ttkAB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bu/ttkAB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD641C4CEE0;
	Mon,  3 Feb 2025 22:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623526;
	bh=Y2i2DGPHFIdPzHIKRjI2VaiGai6KPkZD5HD5AgVbUAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bu/ttkABWOv8ImptMUZPmLd6yVlBnvEYryrcUuO5mpAzi0G13tf/REo+nUP7NMCMa
	 8/M3cwu9sLZ7iC0tV+LjpnwiKNLBtZYqw9NL6ueVHfD+mnuFhKA01xtgCvsvL1Jya/
	 92t5ubXCT1EUx5iONeES2CLkvwUWQN1S158wEwT7sy66GEoxM+vFYw60JtUQ9pfuAN
	 DNzck0fTmUivSqiPLNf37XOLZBX8kaKrAV1tVj8HVVURN3+w9HEq00Aui//abRIhDI
	 +9GRMkisd0AHgEDK89ysExyuMVCJFfQhVp/BIsAAxBIAEAj3BasW62kcKWuihaTUxX
	 HrM3/YdU4k82Q==
Date: Mon, 3 Feb 2025 16:58:45 -0600
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
Subject: Re: [RFC PATCH v2 10/17] dt-bindings: interrupt-controller: Add
 bindings for RISC-V RPMI system MSI
Message-ID: <20250203225845.GA491419-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-11-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-11-apatel@ventanamicro.com>

On Mon, Feb 03, 2025 at 02:18:59PM +0530, Anup Patel wrote:
> Add device tree bindings for the system MSI service group based interrupt
> controller defined by the RISC-V platform management interface (RPMI)
> specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../riscv,rpmi-system-msi.yaml                | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> new file mode 100644
> index 000000000000..e6c297e66c99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-system-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI system MSI service group based interrupt controller
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
> +  The RPMI specification [1] defines system MSI service group which
> +  allow application processors to receive MSIs upon system events
> +  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
> +  event, memory hotplug event, etc from the platform microcontroller.

I'm confused by this description and what the binding has. This "device" 
is receiving interrupts and generating MSIs based on those interrupts? 

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
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Intended for use by the SBI implementation in machine mode or
> +          software in supervisor mode.
> +        const: riscv,rpmi-system-msi
> +
> +      - description:
> +          Intended for use by the SBI implementation in machine mode.
> +        const: riscv,rpmi-mpxy-system-msi
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
> +      riscv,rpmi-mpxy-system-msi compatible string.
> +
> +  msi-parent: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - msi-parent
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mpxy_mbox: sbi-mpxy-mbox {

mailbox {

Though generally we don't show providers for a consumer schema.

> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;
> +    };
> +    rpmi_sysmsi_intc: interrupt-controller {
> +        compatible = "riscv,rpmi-system-msi";
> +        mboxes = <&mpxy_mbox 0x2000 0x0>;
> +        msi-parent = <&imsic_slevel>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };
> +...
> -- 
> 2.43.0
> 
