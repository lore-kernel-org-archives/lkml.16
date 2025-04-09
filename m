Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD431E5718;
	Wed,  9 Apr 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186823; cv=none; b=FcrbLNLZVxcX581XWW2bPMi0J05Ox22d3ZwnzeelDzRlQPbAHAmqBXXMNOkS2WrwpbugMHySLaqbtUzRL7PeEHnWMwGncPEfsUwoIUv8fUFoZ6Rho0Hnz8WPeIktAAc+5LmHYWGQqbag7W/yXrxCXUIMH5Jo5gCOsbpXi+ywbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186823; c=relaxed/simple;
	bh=U1RXx4pUanf+hdWFHer2TpFo/5Hj9TMxsWIAO27cO+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHhiyzmntFtEXQx3pPJQk+Vh4U4srhPzGWeWCJp7zDRt2vIHhZV+3D3pF1swrpYDQiHzJLvP0SMv8EwBXVtqOygeCAoWALjx+xpPu033rWfBGwipD/GuDu1DILyZqZt1VxPErpZLFlAQrMwhUZBbzHVFGmXhU4RaVCg5M5ha4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlB1683s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlB1683s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4017C4CEEA;
	Wed,  9 Apr 2025 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744186822;
	bh=U1RXx4pUanf+hdWFHer2TpFo/5Hj9TMxsWIAO27cO+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlB1683s4ito8DObewsReJ6Q8F5eAITIec76vlDaTFtt9ymUHZ4vKxw7tYMbHtHhx
	 jw+5rOziEqMFE/UvrwkkhliZNUtr5eYANJGevMhndmx/xr8f9dm4x87rQIGpkcdmdW
	 E7KVPIxCusq2M4jhfeQOy/VzBPnXV+18iArs7PojvEg+tz5UIp7J6S/groSGJiMT0K
	 dKKMeaqTGKobnI+tHvyN8lQj8xsZVrcZjbISWwIO3sX7iwScRuSnFhj1ZmwmxA5grB
	 7yRGi4Og89JX0cAInZimXTcAeBynLxvYWSmG7hp14wm+sLMhKnVhxzVIF8T5gwG6uj
	 iCgWHGpQGG6bw==
Date: Wed, 9 Apr 2025 10:20:15 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5 DT
 bindings
Message-ID: <Z/Ytv8aWmdWdeCPw@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
 <CAL_JsqLQTOae6pdUXdqT=agoXMs4Z83Fintk=DxMRmTET_UTgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLQTOae6pdUXdqT=agoXMs4Z83Fintk=DxMRmTET_UTgA@mail.gmail.com>

On Tue, Apr 08, 2025 at 10:07:06AM -0500, Rob Herring wrote:
> On Tue, Apr 8, 2025 at 5:50 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> 
> No need to say DT bindings twice in the subject line. Follow the
> subsystem conventions.
> 
> dt-bindings: interrupt-controller: Add Arm GICv5

Will do.

> > The GICv5 interrupt controller architecture is composed of:
> >
> > - one or more Interrupt Routing Service (IRS)
> > - zero or more Interrupt Translation Service (ITS)
> > - zero or more Interrupt Wire Bridge (IWB)
> >
> > Describe a GICv5 implementation by specifying a top level node
> > corresponding to the GICv5 system component.
> >
> > IRS nodes are added as GICv5 system component children.
> >
> > An ITS is associated with an IRS so ITS nodes are described
> > as IRS children - use the hierarchy explicitly in the device
> > tree to define the association.
> >
> > IWB nodes are described as GICv5 system component children - to make it
> > explicit that are part of the GICv5 system component; an IWB is
> > connected to a single ITS but the connection is made explicit through
> > the msi-parent property and therefore is not required to be explicit
> > through a parent-child relationship in the device tree.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 275 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..5c78375c298a0115c55872f439eb04d4171c4381
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> > @@ -0,0 +1,268 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Generic Interrupt Controller, version 5
> > +
> > +maintainers:
> > +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> > +  - Marc Zyngier <maz@kernel.org>
> > +
> > +description: |
> > +  The GICv5 architecture defines the guidelines to implement GICv5
> > +  compliant interrupt controllers for AArch64 systems.
> > +
> > +  The GICv5 specification can be found at
> > +  https://developer.arm.com/documentation/aes0070
> > +
> > +  The GICv5 architecture is composed of multiple components:
> > +    - one or more IRS (Interrupt Routing Service)
> > +    - zero or more ITS (Interrupt Translation Service)
> > +    - zero or more IWB (Interrupt Wire Bridge)
> > +
> > +  The architecture defines:
> > +    - PE-Private Peripheral Interrupts (PPI)
> > +    - Shared Peripheral Interrupts (SPI)
> > +    - Logical Peripheral Interrupts (LPI)
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,gic-v5
> > +
> > +  interrupt-controller: true
> > +
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> 
> blank line
> 
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  ranges: true
> > +
> > +  "#interrupt-cells":
> > +    description: |
> > +      Specifies the number of cells needed to encode an interrupt source.
> > +      Must be a single cell with a value 3.
> 
> Drop this paragraph. The first sentence is just describing a common
> property. The 2nd is expressed as schema already.

Will do.

> > +
> > +      The 1st cell corresponds to the INTID.Type field in the INTID; 1 for PPI,
> > +      3 for SPI. LPI interrupts must not be described in the bindings since
> > +      they are allocated dynamically by the software component managing them.
> > +
> > +      The 2nd cell contains the interrupt INTID.ID field.
> > +
> > +      The 3rd cell is the flags, encoded as follows:
> > +      bits[3:0] trigger type and level flags.
> > +
> > +        1 = low-to-high edge triggered
> > +        2 = high-to-low edge triggered
> > +        4 = active high level-sensitive
> > +        8 = active low level-sensitive
> > +
> > +      Cells 4 and beyond are reserved for future use and must have a value
> > +      of 0 if present.
> 
> Drop. You can't have 4 or more cells because only 3 is allowed:

Nothing planned but what if this needs to be extended later ?

> > +    const: 3
> > +
> > +  interrupts:
> > +    description:
> > +      Interrupt source of the VGIC maintenance interrupt.
> 
> Drop "Interrupt source of ".
> 
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +
> > +patternProperties:
> > +  "^irs@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      GICv5 has one or more Interrupt Routing Services (IRS) that are
> > +      responsible for handling IRQ state and routing.
> > +
> > +    additionalProperties: false
> 
> blank line
> 
> > +    properties:
> > +      compatible:
> > +        const: arm,gic-v5-irs
> > +
> > +      "#address-cells":
> > +        enum: [ 1, 2 ]
> 
> blank line
> 
> > +      "#size-cells":
> > +        enum: [ 1, 2 ]
> > +
> > +      ranges: true
> > +
> > +      dma-noncoherent:
> > +        description:
> > +          Present if the GIC IRS permits programming shareability and
> > +          cacheability attributes but is connected to a non-coherent
> > +          downstream interconnect.
> > +
> > +      reg:
> > +        minItems: 1
> > +        items:
> > +          - description: IRS control frame

On this, is there a way to specify that this has a fixed size ?

> > +          - description: IRS setlpi frame
> > +
> > +      cpus:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Already has a type, drop.
> 
> > +        description:
> > +          Should be a list of phandles to CPU nodes (as described in
> > +          Documentation/devicetree/bindings/arm/cpus.yaml) corresponding to
> > +          CPUs managed by the IRS.
> 
> The actual cpu binding is outside the scope of this binding. Just
> 'CPUs managed by the IRS.' is enough.
> 
> Is there a maximum number of CPUs?

Yes it is reported in the IRS_IDR1 configuration frame register IAFFID_BITS
field.

Should I add anything to the bindings related to this ?

> > +
> > +      arm,iaffids:
> > +        $ref: /schemas/types.yaml#/definitions/uint16-array
> > +        description:
> > +          Should be a list of u16 values representing IAFFID IDs associated
> 
> The type says it is 'a list of u16 values', so don't repeat that here.
> IAFFID needs to be defined somewhere. Is the 2nd 'ID' redundant?

I will add an IAFFID description (here ? or in the binding description
above ?)

> > +          with the CPU whose CPU node phandle is at the same index in the
> > +          cpus array.
> > +
> > +    patternProperties:
> > +      "^msi-controller@[0-9a-f]+$":
> > +        type: object
> > +        description:
> > +          GICv5 has zero or more Interrupt Translation Services (ITS) that are
> > +          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
> > +          ITS is connected to an IRS.
> > +        additionalProperties: false
> 
> blank line
> 
> > +        properties:
> > +          compatible:
> > +            const: arm,gic-v5-its
> > +
> > +          dma-noncoherent:
> > +            description:
> > +              Present if the GIC ITS permits programming shareability and
> > +              cacheability attributes but is connected to a non-coherent
> > +              downstream interconnect.
> > +
> > +          msi-controller: true
> > +
> > +          "#msi-cells":
> > +            description:
> > +              The single msi-cell is the DeviceID of the device which will
> > +              generate the MSI.
> > +            const: 1
> > +
> > +          reg:
> > +            items:
> > +              - description: ITS control frame
> > +              - description: ITS translate frame
> > +
> > +        required:
> > +          - compatible
> > +          - msi-controller
> > +          - "#msi-cells"
> > +          - reg
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - cpus
> > +      - arm,iaffids
> > +
> > +  "^interrupt-controller@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      GICv5 has zero or more Interrupt Wire Bridges (IWB) that are responsible
> > +      for translating wire signals into interrupt messages to the ITS.
> 
> I wonder if this should be a separate schema and not a child of the
> GIC? Seems like these would be implemented standalone (even if the
> arch doesn't define that) at arbitrary addresses that aren't within
> the GIC's address range. To put it another way, there's nothing here
> it is getting from the parent node.

I could move it to a separate schema even though I can't help thinking
that, by being a GICv5 *only* component, it is clearer for it to live
in this schema, that was my thinking when I drafted the bindings.

I feel like moving it to a different schema could give the wrong
impression, namely that an IWB can be plugged to something else
than an ITS, which is not really possible.

> > +
> > +    additionalProperties: false
> > +    properties:
> > +      compatible:
> > +        const: arm,gic-v5-iwb
> > +
> > +      interrupt-controller: true
> > +
> > +      "#address-cells":
> > +        const: 0
> > +
> > +      "#interrupt-cells":
> > +        description: |
> > +          Specifies the number of cells needed to encode an interrupt source.
> > +          Must be a single cell with a value 2.
> 
> Drop
> 
> > +
> > +          The 1st cell corresponds to the IWB wire.
> > +
> > +          The 2nd cell is the flags, encoded as follows:
> > +          bits[3:0] trigger type and level flags.
> > +
> > +          1 = low-to-high edge triggered
> > +          2 = high-to-low edge triggered
> > +          4 = active high level-sensitive
> > +          8 = active low level-sensitive
> > +
> > +          Cells 3 and beyond are reserved for future use and must have a value
> > +          of 0 if present.
> 
> Drop
> 
> > +        const: 2
> > +
> > +      reg:
> > +        items:
> > +          - description: IWB control frame
> > +
> > +      msi-parent: true
> 
> maxItems: 1
> 
> Because the common definition allows any number of parents.

I will add it.

> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - msi-parent
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller {
> > +      compatible = "arm,gic-v5";
> > +      #interrupt-cells = <3>;
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +      ranges;
> > +
> > +      interrupt-controller;
> > +
> > +      interrupts = <1 25 4>;
> > +
> > +      irs@2f1a0000 {
> > +        compatible = "arm,gic-v5-irs";
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        ranges;
> > +
> > +        reg = <0x0 0x2f1a0000 0x0 0x10000>;  // IRS_CONFIG_FRAME for NS
> > +
> > +        arm,iaffids = /bits 16 <0 1 2 3 4 5 6 7>;

/bits/

> > +        cpus = <&{/cpus/cpu@0}>, <&{/cpus/cpu@100}>, <&{/cpus/cpu@200}>,
> > +               <&{/cpus/cpu@300}>, <&{/cpus/cpu@10000}>, <&{/cpus/cpu@10100}>,
> > +               <&{/cpus/cpu@10200}>, <&{/cpus/cpu@10300}>;
> 
> Use labels instead of paths.

Yep, noticed, fixed already.

> > +
> > +        msi-controller@2f120000 {
> > +          compatible = "arm,gic-v5-its";
> > +
> > +          msi-controller;
> > +          #msi-cells = <1>;
> > +
> > +          reg = <0x0 0x2f120000 0x0 0x10000    // ITS_CONFIG_FRAME for NS
> > +                 0x0 0x2f130000 0x0 0x10000>;  // ITS_TRANSLATE_FRAME
> > +        };
> > +      };
> > +
> > +      interrupt-controller@2f000000 {
> > +        compatible = "arm,gic-v5-iwb";
> > +        #address-cells = <0>;
> > +
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +
> > +        reg = <0x0 0x2f000000 0x0 0x10000>;
> > +
> > +        msi-parent = <&its0 64>;
> > +      };
> > +    };
> > +
> > +    device@0 {
> 
> Drop. We don't put consumers in provider examples and vice-versa.

I will drop it.

Thanks a lot Rob for reviewing it.

Lorenzo

> > +      reg = <0 4>;
> > +      interrupts = <3 115 4>;
> > +    };
> > +
> > +...
