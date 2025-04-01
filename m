Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8463E1D79B8;
	Tue,  1 Apr 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546017; cv=none; b=KFntvNL3ErplwcGi4EBtaaGaF6XjYlpceiOvJgHcKyZXOnp/yue6sxAcDskRZWngY0QoUlrMPyrV9y3XBTaEvyL0u89XglyYSKOsOmaCQoVjOCSnF5uUhgsdIFjw80/J7c/7yskknn/Rkgi3jNt4PNr8Vm9IVs5VoJIdtYG7Mb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546017; c=relaxed/simple;
	bh=PCe4XJj1618IPiPDCpzKGLt3nFoVFS3rRpXBluX4gWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw9yo2lLLiSvg5zd1txGyYSVAxrhRNqDt5rVDZ9BrKanlbzVhg7nXdh7qyTgGhtmbehKE5FA8/lHOqHUdxJyFao8CywmAK8xMQcvUfDpFucUd+1K0qjJJgwgMdlkQANWUPfJ9WQUcaPSzSSKyYHpMCtWcd9lbqV9sOb0nifRXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeT8KluB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeT8KluB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6A3C4CEE4;
	Tue,  1 Apr 2025 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743546017;
	bh=PCe4XJj1618IPiPDCpzKGLt3nFoVFS3rRpXBluX4gWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeT8KluBovLtL9LKQKukpkY6vRCKRuNBCDXFtrGnD3zYPHmD/NmDqezNOa+tNZfB7
	 vuBEy6y4lXK7NdyZmG/nTgrmX3sOVJUy+pyASbOxWMYi7kHqLRP804r0q+fYNTFfBx
	 XvFWshkGNd/q1lZNnZc6/jdXdunYQHX6Ry50cdwTmoXdsrZJjFgxDXiLpJGhByE/cH
	 POZAE1ZodOHMPK1Kv8tsxqOs2YOHJmtNXToH3qghUagoEmKVYQJuWdTMdK11uX1TDj
	 mMHiMGLNWLXu8cM0tSoxpKyF2svEJ7SOGnGiQMn6AgaVinm+nbsRCOd74n0aKepW7D
	 HfTWwQx6scfrA==
Date: Tue, 1 Apr 2025 17:20:15 -0500
From: Rob Herring <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <20250401222015.GA4071342-robh@kernel.org>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
 <20250401-upstream_ospi_v6-v7-2-0ef28513ed81@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-upstream_ospi_v6-v7-2-0ef28513ed81@foss.st.com>

On Tue, Apr 01, 2025 at 02:21:46PM +0200, Patrice Chotard wrote:
> Add bindings for STM32 Octo Memory Manager (OMM) controller.
> 
> OMM manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 227 +++++++++++++++++++++
>  1 file changed, 227 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c028bc5341f5072afbed1e435b43245952e50300
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
> @@ -0,0 +1,227 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Octo Memory Manager (OMM)
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@foss.st.com>
> +
> +description: |
> +  The STM32 Octo Memory Manager is a low-level interface that enables an
> +  efficient OCTOSPI pin assignment with a full I/O matrix (before alternate
> +  function map) and multiplex of single/dual/quad/octal SPI interfaces over
> +  the same bus. It Supports up to:
> +    - Two single/dual/quad/octal SPI interfaces
> +    - Two ports for pin assignment
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-omm
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    description: |
> +      Reflects the memory layout per OSPI instance.
> +      Format:
> +      <chip-select> 0 <registers base address> <size>
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg:
> +    items:
> +      - description: OMM registers
> +      - description: OMM memory map area
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: memory_map
> +
> +  memory-region:
> +    description:
> +      Memory region shared between the 2 OCTOSPI instance.
> +      One or two phandle to a node describing a memory mapped region
> +      depending of child number.
> +    minItems: 1
> +    maxItems: 2
> +
> +  memory-region-names:
> +    description:
> +      Identify to which OSPI instance the memory region belongs to.
> +    items:
> +      enum: [ospi1, ospi2]
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3

Just maxItems is enough.

> +
> +  clock-names:
> +    items:
> +      - const: omm
> +      - const: ospi1
> +      - const: ospi2
> +
> +  resets:
> +    minItems: 3
> +    maxItems: 3

Same here.

> +
> +  reset-names:
> +    items:
> +      - const: omm
> +      - const: ospi1
> +      - const: ospi2
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  st,syscfg-amcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
> +      memory map area shared between the 2 OSPI instance. The Octo Memory
> +      Manager sets the AMCR depending of the memory-region configuration.
> +      The memory split bitmask description is:
> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
> +    items:
> +      - description: phandle to syscfg
> +      - description: register offset within syscfg
> +      - description: register bitmask for memory split

This needs to be:

items:
  - items:
      - description: ...
      - description: ...
      - description: ...

'phandle-array' name was poorly chosen and is really a matrix of 
phandle plus arg cell entries.

> +
> +  st,omm-req2ack-ns:
> +    description:
> +      In multiplexed mode (MUXEN = 1), this field defines the time in
> +      nanoseconds between two transactions.
> +    default: 0
> +
> +  st,omm-cssel-ovr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Configure the chip select selector override for the 2 OCTOSPIs.
> +      - 0: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS1
> +      - 1: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS1
> +      - 2: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS2
> +      - 3: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS2
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +
> +  st,omm-mux:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Configure the muxing between the 2 OCTOSPIs busses and the 2 output ports.
> +      - 0: direct mode
> +      - 1: mux OCTOSPI1 and OCTOSPI2 to port 1
> +      - 2: swapped mode
> +      - 3: mux OCTOSPI1 and OCTOSPI2 to port 2
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +
> +  power-domains:
> +    maxItems: 1

Standard properties go before vendor specific properties.

> +
> +patternProperties:
> +  ^spi@[0-9]:
> +    type: object
> +    $ref: /schemas/spi/st,stm32mp25-ospi.yaml#
> +    description: Required spi child node
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - st,syscfg-amcr
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +    ommanager@40500000 {
> +      compatible = "st,stm32mp25-omm";
> +      reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
> +      reg-names = "regs", "memory_map";
> +      ranges = <0 0 0x40430000 0x400>,
> +               <1 0 0x40440000 0x400>;
> +      memory-region = <&mm_ospi1>, <&mm_ospi2>;
> +      memory-region-names = "ospi1", "ospi2";
> +      pinctrl-0 = <&ospi_port1_clk_pins_a
> +                   &ospi_port1_io03_pins_a
> +                   &ospi_port1_cs0_pins_a>;
> +      pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
> +                   &ospi_port1_io03_sleep_pins_a
> +                   &ospi_port1_cs0_sleep_pins_a>;
> +      pinctrl-names = "default", "sleep";
> +      clocks = <&rcc CK_BUS_OSPIIOM>,
> +               <&scmi_clk CK_SCMI_OSPI1>,
> +               <&scmi_clk CK_SCMI_OSPI2>;
> +      clock-names = "omm", "ospi1", "ospi2";
> +      resets = <&rcc OSPIIOM_R>,
> +               <&scmi_reset RST_SCMI_OSPI1>,
> +               <&scmi_reset RST_SCMI_OSPI2>;
> +      reset-names = "omm", "ospi1", "ospi2";
> +      access-controllers = <&rifsc 111>;
> +      power-domains = <&CLUSTER_PD>;
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
> +      st,omm-req2ack-ns = <0>;
> +      st,omm-mux = <0>;
> +      st,omm-cssel-ovr = <0>;
> +
> +      spi@0 {
> +        compatible = "st,stm32mp25-ospi";
> +        reg = <0 0 0x400>;
> +        memory-region = <&mm_ospi1>;
> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
> +               <&hpdma 2 0x42 0x00003112 0x0>;
> +        dma-names = "tx", "rx";
> +        clocks = <&scmi_clk CK_SCMI_OSPI1>;
> +        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;

Looks like you are duplicating properties in the parent and child nodes. 
Maybe that accurately models the h/w, but if it is just so the drivers 
can get the resources from "the driver's node", you can always just look 
in the child nodes for the resources (as probably you want to drop the 
per instance resources from the parent).

> +        access-controllers = <&rifsc 74>;
> +        power-domains = <&CLUSTER_PD>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        st,syscfg-dlyb = <&syscfg 0x1000>;
> +      };
> +
> +      spi@1 {
> +        compatible = "st,stm32mp25-ospi";
> +        reg = <1 0 0x400>;
> +        memory-region = <&mm_ospi1>;
> +        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&hpdma 3 0x62 0x00003121 0x0>,
> +               <&hpdma 3 0x42 0x00003112 0x0>;
> +        dma-names = "tx", "rx";
> +        clocks = <&scmi_clk CK_KER_OSPI2>;
> +        resets = <&scmi_reset RST_SCMI_OSPI2>, <&scmi_reset RST_SCMI_OSPI1DLL>;
> +        access-controllers = <&rifsc 75>;
> +        power-domains = <&CLUSTER_PD>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        st,syscfg-dlyb = <&syscfg 0x1000>;
> +      };
> +    };
> 
> -- 
> 2.25.1
> 
