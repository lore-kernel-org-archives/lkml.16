Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6FD2063E7;
	Wed,  7 May 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606923; cv=none; b=LEaUQZ4BEa+OnGPCF9DqLuPZAyliYNayplC1oc6c+JFu4zpXtJ31WUg7Jy7eWknvV9mxqAAlinV8/Nion7ZQdT+2ib0k9QGGvLt7Gkkm5YXqj18dXJ8LjRpPCwM+tNh6XuJ14AH4ZxTbYTlghcj/mOAliTZDukcYI2s8q/WFmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606923; c=relaxed/simple;
	bh=ezSMwP78jgvQr4kd01B2ANtpKsRsHw0sxOHPCFX5u8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9MUzKIuC+vO4zqjEhesrfuVlKA2vq73CPnc8uaCgoBjoscRcV3KvuAFZsycmgouFGlk+vNkp1kl3hvCWSgmsZl8UA/o2lODYMsX2gBJ60UG4Nc/hLS9EZ9WRPkB3NIttM+BpatePWet2yEdCG/g3ZkFFmRsPcMQYH7Imd5oIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he+WdVR0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he+WdVR0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14244C4CEEB;
	Wed,  7 May 2025 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606923;
	bh=ezSMwP78jgvQr4kd01B2ANtpKsRsHw0sxOHPCFX5u8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=he+WdVR0pGxJJ346lHYmUZEFHWPogbIs2RqMo1sHw7j7DmO4t8Dcbi6UAxxA4HQl2
	 wztsDP5NUNYyn/JCQIG6SEEWQZyBSsnP8Re7FnQ9oujO64AbYa0Q0XLpNNu20/miFM
	 7uhid14WFQ0yHEpT34p1VEc1+mT33t9I1HFrKsNvzyUIuyjwqRUaCRp98tiUklEUpw
	 julw9+PHGk1XITvJ8Fnan0v2CktlfhqRkvTsGjgUFLEH4QTF3DSHymTGvDXiEZWjkK
	 wkQ9Laz/ZGh9ppFTUqXOEXBwQCfeRDHZmqpiAGZ9AseLKUffj4EeLjvf8dBtdfnkSO
	 oKOF1JFRvh8FQ==
Date: Wed, 7 May 2025 10:35:16 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/25] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aBsbRLmjylZrzv9h@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-1-6edd5a92fd09@kernel.org>
 <CAL_JsqK1mTrj4tG_D3sjXdE_jbpHG_o79ReDpZNCH44wXiBj2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK1mTrj4tG_D3sjXdE_jbpHG_o79ReDpZNCH44wXiBj2g@mail.gmail.com>

On Tue, May 06, 2025 at 02:08:00PM -0500, Rob Herring wrote:
> On Tue, May 6, 2025 at 7:24 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
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
> > IWB nodes are described as a separate schema.
> >
> > An IWB is connected to a single ITS, the connection is made explicit
> > through the msi-parent property and therefore is not required to be
> > explicit through a parent-child relationship in the device tree.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  .../interrupt-controller/arm,gic-v5-iwb.yaml       |  76 ++++++++
> >  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 196 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  3 files changed, 279 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b3eb89567b3457e91b93588d7db1cef69b6b9813
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5-iwb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Generic Interrupt Controller, version 5 Interrupt Wire Bridge (IWB)
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
> > +  GICv5 has zero or more Interrupt Wire Bridges (IWB) that are responsible
> > +  for translating wire signals into interrupt messages to the GICv5 ITS.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,gic-v5-iwb
> > +
> > +  interrupt-controller: true
> 
> Move next to #interrupt-cells

I will move it below #interrupt-cells (ie alphabetical order ignoring
'#'), is that OK (it is a bit counterintuitive, that's why I am asking) ?

Same goes for msi-controller after #msi-cells.

> > +
> > +  "#address-cells":
> > +    const: 0
> > +
> > +  "#interrupt-cells":
> > +    description: |
> > +      The 1st cell corresponds to the IWB wire.
> > +
> > +      The 2nd cell is the flags, encoded as follows:
> > +      bits[3:0] trigger type and level flags.
> > +
> > +      1 = low-to-high edge triggered
> > +      2 = high-to-low edge triggered
> > +      4 = active high level-sensitive
> > +      8 = active low level-sensitive
> > +
> > +    const: 2
> > +
> > +  reg:
> 
> Generally, the order is compatible, reg, common properties, vendor
> properties, child nodes. Related properties grouped together and
> alphabetical order (ignoring '#') within common and vendor properties.

Updated, noted.

> > +    items:
> > +      - description: IWB control frame
> > +
> > +  msi-parent:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - msi-parent
> 
> interrupt-controller and #interrupt-cells should be required

Done.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller@2f000000 {
> > +      compatible = "arm,gic-v5-iwb";
> > +      #address-cells = <0>;
> > +
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +
> > +      reg = <0x2f000000 0x10000>;
> 
> Use the same order as the schema.

Done.

> 
> > +
> > +      msi-parent = <&its0 64>;
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1ba0a2088e6d15bacae22c9fc9eebc4ce5c51b0b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> > @@ -0,0 +1,196 @@
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
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  ranges: true
> > +
> > +  "#interrupt-cells":
> > +    description: |
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
> > +    const: 3
> > +
> > +  interrupts:
> > +    description:
> > +      The VGIC maintenance interrupt.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> 
> If you always have an IRS which you say there is, then #address-cells,
> #size-cells, and ranges are required. And interrupt-controller and
> #interrupt-cells.

Right, done.

> > +
> > +patternProperties:
> > +  "^irs@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      GICv5 has one or more Interrupt Routing Services (IRS) that are
> > +      responsible for handling IRQ state and routing.
> > +
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: arm,gic-v5-irs
> > +
> > +      "#address-cells":
> > +        enum: [ 1, 2 ]
> > +
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
> 
> Move after compatible

Done.

> > +        minItems: 1
> > +        items:
> > +          - description: IRS control frame
> > +          - description: IRS setlpi frame
> > +
> > +      cpus:
> > +        description:
> > +          CPUs managed by the IRS.
> > +
> > +      arm,iaffids:
> > +        $ref: /schemas/types.yaml#/definitions/uint16-array
> > +        description:
> > +          Interrupt AFFinity ID (IAFFID) associated with the CPU whose
> > +          CPU node phandle is at the same index in the cpus array.
> > +
> > +    patternProperties:
> > +      "^msi-controller@[0-9a-f]+$":
> > +        type: object
> > +        description:
> > +          GICv5 has zero or more Interrupt Translation Services (ITS) that are
> > +          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
> > +          ITS is connected to an IRS.
> > +        additionalProperties: false
> > +
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
> 
> Move after compatible.

Done.

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
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller {
> > +      compatible = "arm,gic-v5";
> > +      #interrupt-cells = <3>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      ranges;
> > +
> > +      interrupt-controller;
> > +
> > +      interrupts = <1 25 4>;
> > +
> > +      irs@2f1a0000 {
> > +        compatible = "arm,gic-v5-irs";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        reg = <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
> > +
> > +        arm,iaffids = /bits/ 16 <0 1 2 3 4 5 6 7>;
> > +        cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +
> > +        msi-controller@2f120000 {
> > +          compatible = "arm,gic-v5-its";
> > +
> > +          msi-controller;
> > +          #msi-cells = <1>;
> > +
> > +          reg = <0x2f120000 0x10000    // ITS_CONFIG_FRAME for NS
> 
> Enclose each entry in <>'s.

Done.

Thanks a lot,
Lorenzo

> > +                 0x2f130000 0x10000>;  // ITS_TRANSLATE_FRAME
> > +        };
> > +      };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96b82704950184bd71623ff41fc4df31e4c7fe87..1902291c3cccc06d27c5f79123e67774cf9a0e43 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1901,6 +1901,13 @@ F:       drivers/irqchip/irq-gic*.[ch]
> >  F:     include/linux/irqchip/arm-gic*.h
> >  F:     include/linux/irqchip/arm-vgic-info.h
> >
> > +ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
> > +M:     Lorenzo Pieralisi <lpieralisi@kernel.org>
> > +M:     Marc Zyngier <maz@kernel.org>
> > +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5*.yaml
> > +
> >  ARM HDLCD DRM DRIVER
> >  M:     Liviu Dudau <liviu.dudau@arm.com>
> >  S:     Supported
> >
> > --
> > 2.48.0
> >
