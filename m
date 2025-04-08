Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A9267F4F;
	Tue,  8 Apr 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109454; cv=none; b=BUW+Q7KqtjoW63MKrf4t76g1PGEb3uUHpPkdlETvDJzZWATobSwNhyYo5DcQmoX733P5EG1wy13VYAQbNTNPurAfYAOHREklEbHgXVTpiCO82Utzz59gLWXfmqQMH+XRN24d+E/u7bwge2bgjSMrYfluSaLFLv82vEYiYQIHxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109454; c=relaxed/simple;
	bh=Vrm1y9HqogqdHdZx/otTpwpDwGxKKMfsXeVRsPHkIPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0MjMg/D999SzXwd0WMRE6rgX2SBs3cVQ5JjDNykdngn5cGn6yb8kc7ccW78gNIf5EpIJM3ZxBTsgzCS+OZcEr1le5tfkd+JDCI/iTdeZoZegdVCcJCu6iLYhTuBJypcTbfzGdPMJk39MmAJe8QLImd+NTzxD+Ll90jiE6dLpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzLcawWQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzLcawWQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A611C4CEE7;
	Tue,  8 Apr 2025 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109454;
	bh=Vrm1y9HqogqdHdZx/otTpwpDwGxKKMfsXeVRsPHkIPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tzLcawWQATZ8Pi02Ek0c2w0JiKTdVzqmJ54DWu0iKI0Gl5Brf3ZBf3fX11s+6QPTd
	 OGJwxrcYaz+q92XkrM/e8SeVbHC9J0/65GJoXDYDoZfuUWUA+kkj6lAQosjUgHNoef
	 OsfH114c8EbIXYH5wSyqemtTcPK5i48qBTQauMsw6SO/rLDao6U1obS29zNl1uY2Tn
	 unxasP/FOsML1WcMa0R6+QvvhntPOc5zL6jib6GS5pEolEXEMTB8tJPHYeJy906PGt
	 qOmq89+/xT9P0JBU7s+dMPTfowqpQp47v1vMM1Br1srI7DCkbEpO5QEPl46qfWhN8i
	 +qGogvLi8gDcA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:00 +0200
Subject: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5 DT
 bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

The GICv5 interrupt controller architecture is composed of:

- one or more Interrupt Routing Service (IRS)
- zero or more Interrupt Translation Service (ITS)
- zero or more Interrupt Wire Bridge (IWB)

Describe a GICv5 implementation by specifying a top level node
corresponding to the GICv5 system component.

IRS nodes are added as GICv5 system component children.

An ITS is associated with an IRS so ITS nodes are described
as IRS children - use the hierarchy explicitly in the device
tree to define the association.

IWB nodes are described as GICv5 system component children - to make it
explicit that are part of the GICv5 system component; an IWB is
connected to a single ITS but the connection is made explicit through
the msi-parent property and therefore is not required to be explicit
through a parent-child relationship in the device tree.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 275 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5c78375c298a0115c55872f439eb04d4171c4381
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -0,0 +1,268 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Generic Interrupt Controller, version 5
+
+maintainers:
+  - Lorenzo Pieralisi <lpieralisi@kernel.org>
+  - Marc Zyngier <maz@kernel.org>
+
+description: |
+  The GICv5 architecture defines the guidelines to implement GICv5
+  compliant interrupt controllers for AArch64 systems.
+
+  The GICv5 specification can be found at
+  https://developer.arm.com/documentation/aes0070
+
+  The GICv5 architecture is composed of multiple components:
+    - one or more IRS (Interrupt Routing Service)
+    - zero or more ITS (Interrupt Translation Service)
+    - zero or more IWB (Interrupt Wire Bridge)
+
+  The architecture defines:
+    - PE-Private Peripheral Interrupts (PPI)
+    - Shared Peripheral Interrupts (SPI)
+    - Logical Peripheral Interrupts (LPI)
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: arm,gic-v5
+
+  interrupt-controller: true
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  "#interrupt-cells":
+    description: |
+      Specifies the number of cells needed to encode an interrupt source.
+      Must be a single cell with a value 3.
+
+      The 1st cell corresponds to the INTID.Type field in the INTID; 1 for PPI,
+      3 for SPI. LPI interrupts must not be described in the bindings since
+      they are allocated dynamically by the software component managing them.
+
+      The 2nd cell contains the interrupt INTID.ID field.
+
+      The 3rd cell is the flags, encoded as follows:
+      bits[3:0] trigger type and level flags.
+
+        1 = low-to-high edge triggered
+        2 = high-to-low edge triggered
+        4 = active high level-sensitive
+        8 = active low level-sensitive
+
+      Cells 4 and beyond are reserved for future use and must have a value
+      of 0 if present.
+    const: 3
+
+  interrupts:
+    description:
+      Interrupt source of the VGIC maintenance interrupt.
+    maxItems: 1
+
+required:
+  - compatible
+
+patternProperties:
+  "^irs@[0-9a-f]+$":
+    type: object
+    description:
+      GICv5 has one or more Interrupt Routing Services (IRS) that are
+      responsible for handling IRQ state and routing.
+
+    additionalProperties: false
+    properties:
+      compatible:
+        const: arm,gic-v5-irs
+
+      "#address-cells":
+        enum: [ 1, 2 ]
+      "#size-cells":
+        enum: [ 1, 2 ]
+
+      ranges: true
+
+      dma-noncoherent:
+        description:
+          Present if the GIC IRS permits programming shareability and
+          cacheability attributes but is connected to a non-coherent
+          downstream interconnect.
+
+      reg:
+        minItems: 1
+        items:
+          - description: IRS control frame
+          - description: IRS setlpi frame
+
+      cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Should be a list of phandles to CPU nodes (as described in
+          Documentation/devicetree/bindings/arm/cpus.yaml) corresponding to
+          CPUs managed by the IRS.
+
+      arm,iaffids:
+        $ref: /schemas/types.yaml#/definitions/uint16-array
+        description:
+          Should be a list of u16 values representing IAFFID IDs associated
+          with the CPU whose CPU node phandle is at the same index in the
+          cpus array.
+
+    patternProperties:
+      "^msi-controller@[0-9a-f]+$":
+        type: object
+        description:
+          GICv5 has zero or more Interrupt Translation Services (ITS) that are
+          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
+          ITS is connected to an IRS.
+        additionalProperties: false
+        properties:
+          compatible:
+            const: arm,gic-v5-its
+
+          dma-noncoherent:
+            description:
+              Present if the GIC ITS permits programming shareability and
+              cacheability attributes but is connected to a non-coherent
+              downstream interconnect.
+
+          msi-controller: true
+
+          "#msi-cells":
+            description:
+              The single msi-cell is the DeviceID of the device which will
+              generate the MSI.
+            const: 1
+
+          reg:
+            items:
+              - description: ITS control frame
+              - description: ITS translate frame
+
+        required:
+          - compatible
+          - msi-controller
+          - "#msi-cells"
+          - reg
+
+    required:
+      - compatible
+      - reg
+      - cpus
+      - arm,iaffids
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description:
+      GICv5 has zero or more Interrupt Wire Bridges (IWB) that are responsible
+      for translating wire signals into interrupt messages to the ITS.
+
+    additionalProperties: false
+    properties:
+      compatible:
+        const: arm,gic-v5-iwb
+
+      interrupt-controller: true
+
+      "#address-cells":
+        const: 0
+
+      "#interrupt-cells":
+        description: |
+          Specifies the number of cells needed to encode an interrupt source.
+          Must be a single cell with a value 2.
+
+          The 1st cell corresponds to the IWB wire.
+
+          The 2nd cell is the flags, encoded as follows:
+          bits[3:0] trigger type and level flags.
+
+          1 = low-to-high edge triggered
+          2 = high-to-low edge triggered
+          4 = active high level-sensitive
+          8 = active low level-sensitive
+
+          Cells 3 and beyond are reserved for future use and must have a value
+          of 0 if present.
+        const: 2
+
+      reg:
+        items:
+          - description: IWB control frame
+
+      msi-parent: true
+
+    required:
+      - compatible
+      - reg
+      - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+      compatible = "arm,gic-v5";
+      #interrupt-cells = <3>;
+      #address-cells = <2>;
+      #size-cells = <2>;
+      ranges;
+
+      interrupt-controller;
+
+      interrupts = <1 25 4>;
+
+      irs@2f1a0000 {
+        compatible = "arm,gic-v5-irs";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        reg = <0x0 0x2f1a0000 0x0 0x10000>;  // IRS_CONFIG_FRAME for NS
+
+        arm,iaffids = /bits 16 <0 1 2 3 4 5 6 7>;
+        cpus = <&{/cpus/cpu@0}>, <&{/cpus/cpu@100}>, <&{/cpus/cpu@200}>,
+               <&{/cpus/cpu@300}>, <&{/cpus/cpu@10000}>, <&{/cpus/cpu@10100}>,
+               <&{/cpus/cpu@10200}>, <&{/cpus/cpu@10300}>;
+
+        msi-controller@2f120000 {
+          compatible = "arm,gic-v5-its";
+
+          msi-controller;
+          #msi-cells = <1>;
+
+          reg = <0x0 0x2f120000 0x0 0x10000    // ITS_CONFIG_FRAME for NS
+                 0x0 0x2f130000 0x0 0x10000>;  // ITS_TRANSLATE_FRAME
+        };
+      };
+
+      interrupt-controller@2f000000 {
+        compatible = "arm,gic-v5-iwb";
+        #address-cells = <0>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        reg = <0x0 0x2f000000 0x0 0x10000>;
+
+        msi-parent = <&its0 64>;
+      };
+    };
+
+    device@0 {
+      reg = <0 4>;
+      interrupts = <3 115 4>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..f3ed84466da19906953b5396a5f4b50e878c376e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1901,6 +1901,13 @@ F:	drivers/irqchip/irq-gic*.[ch]
 F:	include/linux/irqchip/arm-gic*.h
 F:	include/linux/irqchip/arm-vgic-info.h
 
+ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
+M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
+M:	Marc Zyngier <maz@kernel.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported

-- 
2.48.0

