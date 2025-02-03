Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F47D07D;
	Mon,  3 Feb 2025 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622679; cv=none; b=kLGIBUSUL+4o+sBG0zC3NJ2t0y3FpYWqUuRX9oSgMTvcHO5w7XvOXwb93ZvIGw02E3qlwnYQVQtyQg4I9OqD5NzmazwYsbKUkmDUVlIMwLYnT8X+6oQWsYBf1Nxp48Uu8A5I+93R/A6iw6yuSGNkVsd39S4LB89CcpwfEwYO1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622679; c=relaxed/simple;
	bh=xmSkXHE4yrh5WE9/qixdoYlepUyA6sUkXRP9MquXhMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeGVlk5t0O3U4ILknIMJeHmgvmzDayadm9E1ouDHFkLpHc+yI69mwdni7Wzgi/VBy7rz802tfT611/xM+lJ2NcBviqwEaPJgeb3p5K53K9wopX/B7XWoDxzsVru4uNe2I746o6uKhvg+tz+SpZ/svblCETVTs/vPRG3GhX2mgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDjWdEXq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDjWdEXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0094AC4CED2;
	Mon,  3 Feb 2025 22:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738622678;
	bh=xmSkXHE4yrh5WE9/qixdoYlepUyA6sUkXRP9MquXhMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDjWdEXqxxXWHowybWCOSGUTQQYvNaN0HJKdcy0XG+3P+6+Zyi7W+ZW6HL+FLXBmW
	 rjGNNk1bXv8y7Ng877xCBeGfFHT6d5cKoybz0QVzOwmjgdH2NqpKoh85lPRjGQlves
	 QIBhCyfsai8kXc4WqCdOU0ksZpBcokQNBqc5ndZgpfsS1vBewEmMRUqmqobiJzuHdw
	 6Jnw1YGcv8Gw7Jz+TeyYu9qDFonxzuEhuEJJCvifHzeasZLIcFJfUXTRe/hGqjnnfA
	 /FEv9Rq/vsGfJYe63aQN8CnvalH0XhQeU5c/CBOQ9uFSKC5UvHXF4Dc32Ydz4VRwNK
	 ZT1TtAny0D32g==
Date: Mon, 3 Feb 2025 16:44:36 -0600
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
Subject: Re: [RFC PATCH v2 03/17] dt-bindings: mailbox: Add bindings for
 RISC-V SBI MPXY extension
Message-ID: <20250203224436.GA363790-robh@kernel.org>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-4-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-4-apatel@ventanamicro.com>

On Mon, Feb 03, 2025 at 02:18:52PM +0530, Anup Patel wrote:
> Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
> extension as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> new file mode 100644
> index 000000000000..8a05e089b710
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
> +  software to send messages through the SBI implementation (M-mode
> +  firmware or HS-mode hypervisor). The underlying message protocol
> +  and message format used by the supervisor software could be some
> +  other standard protocol compatible with the SBI MPXY extension
> +  (such as RISC-V Platform Management Interface (RPMI) [2]).
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +  [2] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +properties:
> +  $nodename:
> +    const: sbi-mpxy-mbox

'mailbox' is the defined name for mailbox providers.

> +
> +  compatible:
> +    const: riscv,sbi-mpxy-mbox
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell specifies channel_id of the SBI MPXY channel,
> +      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
> +
> +required:
> +  - compatible
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sbi-mpxy-mbox {
> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;

Is there an SBI node? #mbox-cells could just be part of that along with 
anything else that SBI is a provider for. And we already have the PMU 
SBI binding. It's all one thing, so there should be one SBI node. Then 
we can debate about child nodes of it.

Rob
