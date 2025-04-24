Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221C236A88;
	Thu, 24 Apr 2025 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490349; cv=none; b=cg07AobY7RzBuHOA5nseZxD5sgzi+JTJgg41DCSCLSjoo9TOFe1vj+2AjVgrq8pWgBA519Fc3uvgAEZYGc+ncnTeCD+S+CyiOJaJi0xyuXdduZNDFusOmpprFTxzEtIBBNItPTR/pe4Evo8rh+Sc44vLGAAjemkduNLabr5BYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490349; c=relaxed/simple;
	bh=KrpKnZNnP5S3kNqOj3SU9Sk96zavEOtbkPyDMRv2nfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YujizF3ugKXV1yPryan4qFXGgmCpksEdGe3UPks1Sp1xkmUVXckui9brnnUIygJCy46hU7E67xJmGM8SUl9AI1uvhsUDfk3UPzGMdvygT3Cs+36QIvI4UZzDhd+VBoGpc5P2KHOtPlomlzppyZ61+H+k+sIny3awIRk6fOHAaGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkKOKn/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkKOKn/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288BFC4CEEB;
	Thu, 24 Apr 2025 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490348;
	bh=KrpKnZNnP5S3kNqOj3SU9Sk96zavEOtbkPyDMRv2nfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nkKOKn/0avpacY5wwrq6VzMcSwrsoupqdHxV/qbsO2pR/SgHQE5vZzpXu/QMjZn7o
	 sd/i9Kpalz6LO32pI34x/pn1u+uAx3tza5CY4Jf+SFLvTH8QpSQKtXwWQ9UYVqDjMj
	 erPFl8jnxFUVCBUlXhYfJSUj3V2V3E50VegBvvsp2+0qB6hwXUiHEB6uQcr+uFBBaP
	 0WpO/mTzXChVOasiUuVEAkI9o5XR0GXcz9JX/hkVZY/4aI49R2XCfHJT6EL6tUs3Q6
	 VoOKVaWKqa9/uNbrHv5pAo8fDSKxkQkCMMQVXamjxDM6u0AnlXd397nEAMsngQqFWq
	 cBsFlac01JQVA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:12 +0200
Subject: [PATCH v2 01/22] dt-bindings: interrupt-controller: Add Arm GICv5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-1-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
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

IWB nodes are described as a separate schema.

An IWB is connected to a single ITS, the connection is made explicit
through the msi-parent property and therefore is not required to be
explicit through a parent-child relationship in the device tree.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 .../interrupt-controller/arm,gic-v5-iwb.yaml       |  76 ++++++++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  | 196 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 3 files changed, 279 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b3eb89567b3457e91b93588d7db1cef69b6b9813
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5-iwb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Generic Interrupt Controller, version 5 Interrupt Wire Bridge (IWB)
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
+  GICv5 has zero or more Interrupt Wire Bridges (IWB) that are responsible
+  for translating wire signals into interrupt messages to the GICv5 ITS.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: arm,gic-v5-iwb
+
+  interrupt-controller: true
+
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    description: |
+      The 1st cell corresponds to the IWB wire.
+
+      The 2nd cell is the flags, encoded as follows:
+      bits[3:0] trigger type and level flags.
+
+      1 = low-to-high edge triggered
+      2 = high-to-low edge triggered
+      4 = active high level-sensitive
+      8 = active low level-sensitive
+
+    const: 2
+
+  reg:
+    items:
+      - description: IWB control frame
+
+  msi-parent:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@2f000000 {
+      compatible = "arm,gic-v5-iwb";
+      #address-cells = <0>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      reg = <0x2f000000 0x10000>;
+
+      msi-parent = <&its0 64>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1ba0a2088e6d15bacae22c9fc9eebc4ce5c51b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -0,0 +1,196 @@
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
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  "#interrupt-cells":
+    description: |
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
+    const: 3
+
+  interrupts:
+    description:
+      The VGIC maintenance interrupt.
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
+
+    properties:
+      compatible:
+        const: arm,gic-v5-irs
+
+      "#address-cells":
+        enum: [ 1, 2 ]
+
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
+        description:
+          CPUs managed by the IRS.
+
+      arm,iaffids:
+        $ref: /schemas/types.yaml#/definitions/uint16-array
+        description:
+          Interrupt AFFinity ID (IAFFID) associated with the CPU whose
+          CPU node phandle is at the same index in the cpus array.
+
+    patternProperties:
+      "^msi-controller@[0-9a-f]+$":
+        type: object
+        description:
+          GICv5 has zero or more Interrupt Translation Services (ITS) that are
+          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
+          ITS is connected to an IRS.
+        additionalProperties: false
+
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
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+      compatible = "arm,gic-v5";
+      #interrupt-cells = <3>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      interrupt-controller;
+
+      interrupts = <1 25 4>;
+
+      irs@2f1a0000 {
+        compatible = "arm,gic-v5-irs";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        reg = <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
+
+        arm,iaffids = /bits/ 16 <0 1 2 3 4 5 6 7>;
+        cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+
+        msi-controller@2f120000 {
+          compatible = "arm,gic-v5-its";
+
+          msi-controller;
+          #msi-cells = <1>;
+
+          reg = <0x2f120000 0x10000    // ITS_CONFIG_FRAME for NS
+                 0x2f130000 0x10000>;  // ITS_TRANSLATE_FRAME
+        };
+      };
+    };
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

