Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D191E1A3F;
	Tue,  8 Apr 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124840; cv=none; b=T4uClrl/aoXIbcMRKFzIZ5TypHi7USPJfhE+snP+cW0qT5qGqrt7tKny3aHlj3NUmRRlsOnNyp2rVU07I+83ANTIg0sS0P4penY+l9hyWIV2nSIIrMlcU2EEdqh/WTWJhzxM5li3de8WfZhcUbhTssW6qVQfQH0gRXJXVxIpGYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124840; c=relaxed/simple;
	bh=wMg5XAYS5Ue9LFWXjx2IR5jI6P/jMDyVcMX8CkFKn/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4QHwIQ1CGGZma5YcMcywzV0wIDfYe5GwNcqfrR6gZo7OvbRxK6BH/ns/KN8X0xdwkqCn2pEbGYyEm+TndOR4jm5+a7Om58wZZgOvQb8Iv6ZGpZbULtUooxb9XQEAyGqXFd60bCSJ0mxpPzF2E7u/BqW0A9quqZZNstwa8lfUdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuHTRlSN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuHTRlSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD87C4CEE7;
	Tue,  8 Apr 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124839;
	bh=wMg5XAYS5Ue9LFWXjx2IR5jI6P/jMDyVcMX8CkFKn/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cuHTRlSN6xWgk6zhuOcrznR0t1juLwh4KFsmFKqJNCRWIhGCtIVt2wtzyn9V2WLwA
	 vQ6DNiQqJYxN1tbi15Qw21rOFirEjWZjizTYEPVIw2HuTNRg36z5n50TgawaH5CiCf
	 /VSmkSv4a6DCKip0flaC0H1Ir3dFZuFQIjHAluX8xLQkCRtSPxXIDky4Zm1UFoF0mS
	 Hjjnn1DFn4tV2Sm1Yv5aiU6Fhw4CrGrpv+I1U4K4HzsXZ0AD48m34uMj26PVZ8MbJc
	 woPax5R2w9iZkSgaQwF+/4fysPatAYAt4j8LuNjHQZjoJN/VX06qGAhLXplsjsQmiA
	 Zq6gyNfrSuqyA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so950363066b.0;
        Tue, 08 Apr 2025 08:07:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHT/8aScvdFKhl1EqWovacpQTbaf6afiqND5IGF/on1UIhF2XdFNEbXfK5JNlFfDgUewJRudbHTzz2CByg@vger.kernel.org, AJvYcCXQ4Gc8v1skb+lwsWwCvio9s7s+hauotbvGtZIxk6Uqm3f3eK+4U573Qm6OYF5rHJlRgt340iuy5CDY@vger.kernel.org
X-Gm-Message-State: AOJu0YwIws3G7+PnPkbUizbsrFF2pRGhoAOJcYDNVmcV/fJ36S7ea/OK
	co+ew1leCGb93ltpdwpY3ELxatg0/CRmt078K89rFU1665DUjCcZx8BbSw5LWOmyyL3CjxI4pr1
	pSyqWfuC/Y9Om0TFH9QdmxH0J+g==
X-Google-Smtp-Source: AGHT+IEP7ABpPIQdO8H8RyEHYVU63Q3MwoK0hM8KHlStNGC654Orad7UQLkeqSUYIZscq2kvCFu1vgulPjVcVGos0p0=
X-Received: by 2002:a17:907:9301:b0:ac1:ea29:4e63 with SMTP id
 a640c23a62f3a-ac7d6d53ea2mr1330958966b.26.1744124838155; Tue, 08 Apr 2025
 08:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org> <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Apr 2025 10:07:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLQTOae6pdUXdqT=agoXMs4Z83Fintk=DxMRmTET_UTgA@mail.gmail.com>
X-Gm-Features: ATxdqUHwbIr_Bw5wOIyAJag6mOXehANay1M-UBTXmZKzJ6qjc51ZdtClpSFWu98
Message-ID: <CAL_JsqLQTOae6pdUXdqT=agoXMs4Z83Fintk=DxMRmTET_UTgA@mail.gmail.com>
Subject: Re: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5 DT bindings
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 5:50=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>

No need to say DT bindings twice in the subject line. Follow the
subsystem conventions.

dt-bindings: interrupt-controller: Add Arm GICv5

> The GICv5 interrupt controller architecture is composed of:
>
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
>
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
>
> IRS nodes are added as GICv5 system component children.
>
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
>
> IWB nodes are described as GICv5 system component children - to make it
> explicit that are part of the GICv5 system component; an IWB is
> connected to a single ITS but the connection is made explicit through
> the msi-parent property and therefore is not required to be explicit
> through a parent-child relationship in the device tree.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 275 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,g=
ic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic=
-v5.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5c78375c298a0115c55872f43=
9eb04d4171c4381
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.y=
aml
> @@ -0,0 +1,268 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Generic Interrupt Controller, version 5
> +
> +maintainers:
> +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> +  - Marc Zyngier <maz@kernel.org>
> +
> +description: |
> +  The GICv5 architecture defines the guidelines to implement GICv5
> +  compliant interrupt controllers for AArch64 systems.
> +
> +  The GICv5 specification can be found at
> +  https://developer.arm.com/documentation/aes0070
> +
> +  The GICv5 architecture is composed of multiple components:
> +    - one or more IRS (Interrupt Routing Service)
> +    - zero or more ITS (Interrupt Translation Service)
> +    - zero or more IWB (Interrupt Wire Bridge)
> +
> +  The architecture defines:
> +    - PE-Private Peripheral Interrupts (PPI)
> +    - Shared Peripheral Interrupts (SPI)
> +    - Logical Peripheral Interrupts (LPI)
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: arm,gic-v5
> +
> +  interrupt-controller: true
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]

blank line

> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  "#interrupt-cells":
> +    description: |
> +      Specifies the number of cells needed to encode an interrupt source=
.
> +      Must be a single cell with a value 3.

Drop this paragraph. The first sentence is just describing a common
property. The 2nd is expressed as schema already.

> +
> +      The 1st cell corresponds to the INTID.Type field in the INTID; 1 f=
or PPI,
> +      3 for SPI. LPI interrupts must not be described in the bindings si=
nce
> +      they are allocated dynamically by the software component managing =
them.
> +
> +      The 2nd cell contains the interrupt INTID.ID field.
> +
> +      The 3rd cell is the flags, encoded as follows:
> +      bits[3:0] trigger type and level flags.
> +
> +        1 =3D low-to-high edge triggered
> +        2 =3D high-to-low edge triggered
> +        4 =3D active high level-sensitive
> +        8 =3D active low level-sensitive
> +
> +      Cells 4 and beyond are reserved for future use and must have a val=
ue
> +      of 0 if present.

Drop. You can't have 4 or more cells because only 3 is allowed:

> +    const: 3
> +
> +  interrupts:
> +    description:
> +      Interrupt source of the VGIC maintenance interrupt.

Drop "Interrupt source of ".

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^irs@[0-9a-f]+$":
> +    type: object
> +    description:
> +      GICv5 has one or more Interrupt Routing Services (IRS) that are
> +      responsible for handling IRQ state and routing.
> +
> +    additionalProperties: false

blank line

> +    properties:
> +      compatible:
> +        const: arm,gic-v5-irs
> +
> +      "#address-cells":
> +        enum: [ 1, 2 ]

blank line

> +      "#size-cells":
> +        enum: [ 1, 2 ]
> +
> +      ranges: true
> +
> +      dma-noncoherent:
> +        description:
> +          Present if the GIC IRS permits programming shareability and
> +          cacheability attributes but is connected to a non-coherent
> +          downstream interconnect.
> +
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: IRS control frame
> +          - description: IRS setlpi frame
> +
> +      cpus:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type, drop.

> +        description:
> +          Should be a list of phandles to CPU nodes (as described in
> +          Documentation/devicetree/bindings/arm/cpus.yaml) corresponding=
 to
> +          CPUs managed by the IRS.

The actual cpu binding is outside the scope of this binding. Just
'CPUs managed by the IRS.' is enough.

Is there a maximum number of CPUs?

> +
> +      arm,iaffids:
> +        $ref: /schemas/types.yaml#/definitions/uint16-array
> +        description:
> +          Should be a list of u16 values representing IAFFID IDs associa=
ted

The type says it is 'a list of u16 values', so don't repeat that here.
IAFFID needs to be defined somewhere. Is the 2nd 'ID' redundant?

> +          with the CPU whose CPU node phandle is at the same index in th=
e
> +          cpus array.
> +
> +    patternProperties:
> +      "^msi-controller@[0-9a-f]+$":
> +        type: object
> +        description:
> +          GICv5 has zero or more Interrupt Translation Services (ITS) th=
at are
> +          used to route Message Signalled Interrupts (MSI) to the CPUs. =
Each
> +          ITS is connected to an IRS.
> +        additionalProperties: false

blank line

> +        properties:
> +          compatible:
> +            const: arm,gic-v5-its
> +
> +          dma-noncoherent:
> +            description:
> +              Present if the GIC ITS permits programming shareability an=
d
> +              cacheability attributes but is connected to a non-coherent
> +              downstream interconnect.
> +
> +          msi-controller: true
> +
> +          "#msi-cells":
> +            description:
> +              The single msi-cell is the DeviceID of the device which wi=
ll
> +              generate the MSI.
> +            const: 1
> +
> +          reg:
> +            items:
> +              - description: ITS control frame
> +              - description: ITS translate frame
> +
> +        required:
> +          - compatible
> +          - msi-controller
> +          - "#msi-cells"
> +          - reg
> +
> +    required:
> +      - compatible
> +      - reg
> +      - cpus
> +      - arm,iaffids
> +
> +  "^interrupt-controller@[0-9a-f]+$":
> +    type: object
> +    description:
> +      GICv5 has zero or more Interrupt Wire Bridges (IWB) that are respo=
nsible
> +      for translating wire signals into interrupt messages to the ITS.

I wonder if this should be a separate schema and not a child of the
GIC? Seems like these would be implemented standalone (even if the
arch doesn't define that) at arbitrary addresses that aren't within
the GIC's address range. To put it another way, there's nothing here
it is getting from the parent node.

> +
> +    additionalProperties: false
> +    properties:
> +      compatible:
> +        const: arm,gic-v5-iwb
> +
> +      interrupt-controller: true
> +
> +      "#address-cells":
> +        const: 0
> +
> +      "#interrupt-cells":
> +        description: |
> +          Specifies the number of cells needed to encode an interrupt so=
urce.
> +          Must be a single cell with a value 2.

Drop

> +
> +          The 1st cell corresponds to the IWB wire.
> +
> +          The 2nd cell is the flags, encoded as follows:
> +          bits[3:0] trigger type and level flags.
> +
> +          1 =3D low-to-high edge triggered
> +          2 =3D high-to-low edge triggered
> +          4 =3D active high level-sensitive
> +          8 =3D active low level-sensitive
> +
> +          Cells 3 and beyond are reserved for future use and must have a=
 value
> +          of 0 if present.

Drop

> +        const: 2
> +
> +      reg:
> +        items:
> +          - description: IWB control frame
> +
> +      msi-parent: true

maxItems: 1

Because the common definition allows any number of parents.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - msi-parent
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +      compatible =3D "arm,gic-v5";
> +      #interrupt-cells =3D <3>;
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +      ranges;
> +
> +      interrupt-controller;
> +
> +      interrupts =3D <1 25 4>;
> +
> +      irs@2f1a0000 {
> +        compatible =3D "arm,gic-v5-irs";
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        ranges;
> +
> +        reg =3D <0x0 0x2f1a0000 0x0 0x10000>;  // IRS_CONFIG_FRAME for N=
S
> +
> +        arm,iaffids =3D /bits 16 <0 1 2 3 4 5 6 7>;
> +        cpus =3D <&{/cpus/cpu@0}>, <&{/cpus/cpu@100}>, <&{/cpus/cpu@200}=
>,
> +               <&{/cpus/cpu@300}>, <&{/cpus/cpu@10000}>, <&{/cpus/cpu@10=
100}>,
> +               <&{/cpus/cpu@10200}>, <&{/cpus/cpu@10300}>;

Use labels instead of paths.

> +
> +        msi-controller@2f120000 {
> +          compatible =3D "arm,gic-v5-its";
> +
> +          msi-controller;
> +          #msi-cells =3D <1>;
> +
> +          reg =3D <0x0 0x2f120000 0x0 0x10000    // ITS_CONFIG_FRAME for=
 NS
> +                 0x0 0x2f130000 0x0 0x10000>;  // ITS_TRANSLATE_FRAME
> +        };
> +      };
> +
> +      interrupt-controller@2f000000 {
> +        compatible =3D "arm,gic-v5-iwb";
> +        #address-cells =3D <0>;
> +
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +
> +        reg =3D <0x0 0x2f000000 0x0 0x10000>;
> +
> +        msi-parent =3D <&its0 64>;
> +      };
> +    };
> +
> +    device@0 {

Drop. We don't put consumers in provider examples and vice-versa.

> +      reg =3D <0 4>;
> +      interrupts =3D <3 115 4>;
> +    };
> +
> +...
