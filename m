Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE0256C75;
	Thu, 10 Apr 2025 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277403; cv=none; b=BCCbhPqT9ZK+A0MiGLLQNUWC4ndrToiiT7eWc/Gib4Skp/hXR0Pw2hwFC8jdWx8EOwgu2j1DQVeM7N0kF5rSYKrUovdFsIBNDLGDsRXJKQqR1Yb9ol9/OobDa0PN7ABlbLfcSl3Tr9pnr/dxhXskrmf3cttUhnhHKQGWT5tgzhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277403; c=relaxed/simple;
	bh=SLijVwXfYfmIUHFmCJPMR/VOD7ku8Ye9If9UJUrGIVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cy48cq0scYFvjqsPCUwszdtekR8+gFhOQSYFRXvVlcBZaT+rX4+4Fh6qEWQX/mk7XJReRSKJ4Svz9biT/0611Q7fkmu1pRLxYhgmCSlY6uton5DA/n8LIEaDpZeVFymmMtdvX+lMilWdMVJWhLQ33Mg69LZkDrWhuQ4ez55oBEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DVqv1cyB; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DVqv1cyB"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A6W6Eb017829;
	Thu, 10 Apr 2025 11:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cTp27Yks+IscoBmQevrAOG5V7SS9oSMITLUbLj1Q/Zw=; b=DVqv1cyBN7bFrwab
	XtksEUPrCBIAcViMXuOTN695wWg4nFtkImzU/a4eZv/kNVmieArU9RYUpLCVHNTb
	xQPRLfl+4KorwhgE5fN4on0j+lgN6aebIFQHYyO/YF5kYw2+dy+jzwJIhe44XKtL
	KlPoZYy3wVFZkfYzuUF/tdxDIn62Llm+/926XwOy8JHY1t1gl/uXVJ0qwudysoZo
	uuRl1+hVGMQp97S6U27pqL0WtF4Sz6N5S7FWXBj6nun9epSMYha+9s0at6OODnhk
	LYY1iAsODc97z9glT2LK3lMICP9v4lCrU8Uwo2rcCQgM30kw82X3g7s7n2WHNLRD
	YaWMcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6epsvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:29:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2883340045;
	Thu, 10 Apr 2025 11:28:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C08559A69F7;
	Thu, 10 Apr 2025 11:27:49 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 11:27:49 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Apr 2025 11:27:42 +0200
Subject: [PATCH v9 1/3] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
In-Reply-To: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01

Add bindings for STM32 Octo Memory Manager (OMM) controller.

OMM manages:
  - the muxing between 2 OSPI busses and 2 output ports.
    There are 4 possible muxing configurations:
      - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
        output is on port 2
      - OSPI1 and OSPI2 are multiplexed over the same output port 1
      - swapped mode (no multiplexing), OSPI1 output is on port 2,
        OSPI2 output is on port 1
      - OSPI1 and OSPI2 are multiplexed over the same output port 2
  - the split of the memory area shared between the 2 OSPI instances.
  - chip select selection override.
  - the time between 2 transactions in multiplexed mode.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../memory-controllers/st,stm32mp25-omm.yaml       | 226 +++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..344878db88188f5df5f9ee426335bed38a8fac5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
@@ -0,0 +1,226 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Octo Memory Manager (OMM)
+
+maintainers:
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+description: |
+  The STM32 Octo Memory Manager is a low-level interface that enables an
+  efficient OCTOSPI pin assignment with a full I/O matrix (before alternate
+  function map) and multiplex of single/dual/quad/octal SPI interfaces over
+  the same bus. It Supports up to:
+    - Two single/dual/quad/octal SPI interfaces
+    - Two ports for pin assignment
+
+properties:
+  compatible:
+    const: st,stm32mp25-omm
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    description: |
+      Reflects the memory layout per OSPI instance.
+      Format:
+      <chip-select> 0 <registers base address> <size>
+    minItems: 2
+    maxItems: 2
+
+  reg:
+    items:
+      - description: OMM registers
+      - description: OMM memory map area
+
+  reg-names:
+    items:
+      - const: regs
+      - const: memory_map
+
+  memory-region:
+    description:
+      Memory region shared between the 2 OCTOSPI instance.
+      One or two phandle to a node describing a memory mapped region
+      depending of child number.
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    description:
+      Identify to which OSPI instance the memory region belongs to.
+    items:
+      enum: [ospi1, ospi2]
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: omm
+      - const: ospi1
+      - const: ospi2
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: omm
+      - const: ospi1
+      - const: ospi2
+
+  access-controllers:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  st,syscfg-amcr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The Address Mapping Control Register (AMCR) is used to split the 256MB
+      memory map area shared between the 2 OSPI instance. The Octo Memory
+      Manager sets the AMCR depending of the memory-region configuration.
+      The memory split bitmask description is:
+        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
+        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
+        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
+        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
+        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: register offset within syscfg
+          - description: register bitmask for memory split
+
+  st,omm-req2ack-ns:
+    description:
+      In multiplexed mode (MUXEN = 1), this field defines the time in
+      nanoseconds between two transactions.
+    default: 0
+
+  st,omm-cssel-ovr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Configure the chip select selector override for the 2 OCTOSPIs.
+      - 0: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS1
+      - 1: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS1
+      - 2: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS2
+      - 3: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS2
+    minimum: 0
+    maximum: 3
+    default: 0
+
+  st,omm-mux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Configure the muxing between the 2 OCTOSPIs busses and the 2 output ports.
+      - 0: direct mode
+      - 1: mux OCTOSPI1 and OCTOSPI2 to port 1
+      - 2: swapped mode
+      - 3: mux OCTOSPI1 and OCTOSPI2 to port 2
+    minimum: 0
+    maximum: 3
+    default: 0
+
+patternProperties:
+  ^spi@[0-9]:
+    type: object
+    $ref: /schemas/spi/st,stm32mp25-ospi.yaml#
+    description: Required spi child node
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - st,syscfg-amcr
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+    ommanager@40500000 {
+      compatible = "st,stm32mp25-omm";
+      reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+      reg-names = "regs", "memory_map";
+      ranges = <0 0 0x40430000 0x400>,
+               <1 0 0x40440000 0x400>;
+      memory-region = <&mm_ospi1>, <&mm_ospi2>;
+      memory-region-names = "ospi1", "ospi2";
+      pinctrl-0 = <&ospi_port1_clk_pins_a
+                   &ospi_port1_io03_pins_a
+                   &ospi_port1_cs0_pins_a>;
+      pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+                   &ospi_port1_io03_sleep_pins_a
+                   &ospi_port1_cs0_sleep_pins_a>;
+      pinctrl-names = "default", "sleep";
+      clocks = <&rcc CK_BUS_OSPIIOM>,
+               <&scmi_clk CK_SCMI_OSPI1>,
+               <&scmi_clk CK_SCMI_OSPI2>;
+      clock-names = "omm", "ospi1", "ospi2";
+      resets = <&rcc OSPIIOM_R>,
+               <&scmi_reset RST_SCMI_OSPI1>,
+               <&scmi_reset RST_SCMI_OSPI2>;
+      reset-names = "omm", "ospi1", "ospi2";
+      access-controllers = <&rifsc 111>;
+      power-domains = <&CLUSTER_PD>;
+      #address-cells = <2>;
+      #size-cells = <1>;
+      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+      st,omm-req2ack-ns = <0>;
+      st,omm-mux = <0>;
+      st,omm-cssel-ovr = <0>;
+
+      spi@0 {
+        compatible = "st,stm32mp25-ospi";
+        reg = <0 0 0x400>;
+        memory-region = <&mm_ospi1>;
+        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
+               <&hpdma 2 0x42 0x00003112 0x0>;
+        dma-names = "tx", "rx";
+        clocks = <&scmi_clk CK_SCMI_OSPI1>;
+        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
+        access-controllers = <&rifsc 74>;
+        power-domains = <&CLUSTER_PD>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        st,syscfg-dlyb = <&syscfg 0x1000>;
+      };
+
+      spi@1 {
+        compatible = "st,stm32mp25-ospi";
+        reg = <1 0 0x400>;
+        memory-region = <&mm_ospi1>;
+        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&hpdma 3 0x62 0x00003121 0x0>,
+               <&hpdma 3 0x42 0x00003112 0x0>;
+        dma-names = "tx", "rx";
+        clocks = <&scmi_clk CK_KER_OSPI2>;
+        resets = <&scmi_reset RST_SCMI_OSPI2>, <&scmi_reset RST_SCMI_OSPI1DLL>;
+        access-controllers = <&rifsc 75>;
+        power-domains = <&CLUSTER_PD>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        st,syscfg-dlyb = <&syscfg 0x1000>;
+      };
+    };

-- 
2.25.1

