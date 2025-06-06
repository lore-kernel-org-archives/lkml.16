Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4E1FC0EA;
	Fri,  6 Jun 2025 22:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250783; cv=none; b=PaFb8uuzfxgg69EzYKF8RmKlJjSly1wY+wpE/Zou3FjADh385SZGeUl9zWs/t9XMi3mpEo0JwOv3VnSuebLs/mQcF0wN85XXJjD4QXkmm6ozpS8VCl3O/DbG7/n2GWYFrsosvMuqCbbiGI1oELcRYReZOseHsLsMYpjKWAEMKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250783; c=relaxed/simple;
	bh=Cw+crYerPWYJW2N2ikNlghBYSqfPUoxfZKZ2b2TgZ9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpCJW61JeebMCZfiDeqbULKKOMplpO6Pi+hDJ50bu91rJTRhFVEohxDZEbdd5SaTviE0j77L/PEEPHvPxWeRjmkwvdGXSc5l6G9EPGxUmIk48xTLRrAx4bHalQ7n2+PeQWUdMlNK07r6HZ6p3bfNC9Rr7hUzGwwnRDw4g9PhSsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=crxR5hkS; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="crxR5hkS"
Message-ID: <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749250768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RomQS92hBA9eqkdzWe6rSqjDgfbgT2iRuNEC7vRw7I=;
	b=crxR5hkSHPAgjkpSnkO2hc8eEWkclBTknO2F7yBROybPqI5nKCjHgKwa0V02tyc5LGBXzL
	atH+6hcgCQr7eVoQgYmiOj60nzwcJVjzGOYkkdTdz0l3tJ3Nv1pJ+BkxoQQAAdDK2rriO0
	3s00piolPkq0+wq/zV8s6TI/FqnwTLM=
Date: Fri, 6 Jun 2025 15:59:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy
 bindings
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak
 <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-12-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250525084710.1665648-12-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/25/25 1:46 AM, Anup Patel wrote:
> Add device tree bindings for the RPMI system MSI service group
> based message proxy implemented by the SBI implementation (machine
> mode firmware or hypervisor).
>
> The RPMI system MSI service group is defined by the RISC-V
> platform management interface (RPMI) specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
> new file mode 100644
> index 000000000000..26dd13731350
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI system MSI service group based message proxy
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
> +  The SBI implementation machine mode firmware or hypervisor) can
nit:
The SBI implementation in machine mode
> +  implement an SBI MPXY channel to allow RPMI system MSI service
> +  group access to the supervisor software.
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
nit: Refer the latest frozen version of the spec ?
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the SBI implementation.
> +    const: riscv,rpmi-mpxy-system-msi
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - riscv,sbi-mpxy-channel-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "riscv,rpmi-mpxy-system-msi";
> +        mboxes = <&rpmi_shmem_mbox 0x2>;
> +        riscv,sbi-mpxy-channel-id = <0x2000>;
> +    };
> +...

Otherwise, lgtm.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

