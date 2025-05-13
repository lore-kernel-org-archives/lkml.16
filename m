Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933A32BF96B;
	Tue, 13 May 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158511; cv=none; b=DtSr7wOJFOuAI/vTiGzC5NH/04pH7KtDNmaxcIlw0ZMydd5XwzeE3ITj7SfmRr3X55tW4SfDwrDMrUxwcS1B0GSYG96Q+b3Y5SPLp7ebScRckOZ5ftzCs2GlmcBlvvjUugw05HpNG9mSxl3eTRYhWjKv+b/oHkwpKzuyU4KOJmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158511; c=relaxed/simple;
	bh=lTySYHqYeAPtC3TkVMRfMrNBAANpANdouGv/ixAlhcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJyVnSOMglVzpIKY7eiq9mKlNeFoiBRzWlhUqvurPkOJ5nK18MRXxPW3WEMmFJAa5q6B5fc7vBvX5brAYY2LIXbAHlCWK2eSuIYh2gLzWDai6+qf47nLG6c//vDbPrxthakJlDrGowDh7T5DbdkNBZHis/4L0miO7MzjnIKJok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRCD5+/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRCD5+/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B40C4CEF3;
	Tue, 13 May 2025 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158511;
	bh=lTySYHqYeAPtC3TkVMRfMrNBAANpANdouGv/ixAlhcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cRCD5+/tjrEBwhS5J2o1xIvkEwSJjVJ2MEVZdf4axNXbBMp9/LlQVXshwrCDFMQBd
	 RQPTUKHkkqP2WFM+rBv+v3o6tivRsRR2z2phCF4Ssh3/sB670lwOFBT+HlBTF/Ze9v
	 4Xf6c2YXgJ61Tmc83huvLY9JX7hgcUz2uYGRxF9B+EShBlfCefzXAwZ5ix5kygl8+r
	 hn4w9mAfD8Y9zWhW3RHOtZhpfPY3DOiGioAOu1iblWdQD+rO7fIBax837ruYPM44JC
	 8G0r0JKXPSU/c7+Nf96Oll1Fgtp4Tm//sWGIjjd7iBe6I+HA3OYa7+dXtXDt4ISorm
	 arzgOfIyto/Yg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:54 +0200
Subject: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
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
 .../interrupt-controller/arm,gic-v5-iwb.yaml       |  78 ++++++++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  | 202 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 3 files changed, 287 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..99a266a62385a35421b5468045152414196bf42d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
@@ -0,0 +1,78 @@
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
+  reg:
+    items:
+      - description: IWB control frame
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
+  interrupt-controller: true
+
+  msi-parent:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@2f000000 {
+      compatible = "arm,gic-v5-iwb";
+      reg = <0x2f000000 0x10000>;
+
+      #address-cells = <0>;
+
+      #interrupt-cells = <2>;
+      interrupt-controller;
+
+      msi-parent = <&its0 64>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c8d124c3aa63fd1ec24acb40de72ac2164adeebd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -0,0 +1,202 @@
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
+  interrupt-controller: true
+
+  interrupts:
+    description:
+      The VGIC maintenance interrupt.
+    maxItems: 1
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - "#interrupt-cells"
+  - interrupt-controller
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
+      reg:
+        minItems: 1
+        items:
+          - description: IRS control frame
+          - description: IRS setlpi frame
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
+          reg:
+            items:
+              - description: ITS control frame
+              - description: ITS translate frame
+
+          dma-noncoherent:
+            description:
+              Present if the GIC ITS permits programming shareability and
+              cacheability attributes but is connected to a non-coherent
+              downstream interconnect.
+
+          "#msi-cells":
+            description:
+              The single msi-cell is the DeviceID of the device which will
+              generate the MSI.
+            const: 1
+
+          msi-controller: true
+
+        required:
+          - compatible
+          - reg
+          - "#msi-cells"
+          - msi-controller
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
+
+      #interrupt-cells = <3>;
+      interrupt-controller;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      interrupts = <1 25 4>;
+
+      irs@2f1a0000 {
+        compatible = "arm,gic-v5-irs";
+        reg = <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+        arm,iaffids = /bits/ 16 <0 1 2 3 4 5 6 7>;
+
+        msi-controller@2f120000 {
+          compatible = "arm,gic-v5-its";
+          reg = <0x2f120000 0x10000>,   // ITS_CONFIG_FRAME for NS
+                <0x2f130000 0x10000>;   // ITS_TRANSLATE_FRAME
+
+          #msi-cells = <1>;
+          msi-controller;
+
+        };
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76fb7090a2a550f4c59a7daf188493..d51efac8f9aa21629a0486977fdc76a2eaf5c52f 100644
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
+F:	Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5*.yaml
+
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported

-- 
2.48.0

