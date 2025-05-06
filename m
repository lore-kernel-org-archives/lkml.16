Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C80927FD64;
	Tue,  6 May 2025 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534245; cv=none; b=oJc/EcgBz5lf0RVISAT7cS/JT9mXJwvgI708BmmVmD2yss64SQmLd/tf/S8dHbOmVqM7hkSXsT0A6lMqNyAUJu7e/OU4P3vlMnBpauDFD1B9q+/9QjkZE2eTprA3z4+RQkPpKfif91ioVnYExRmAwSdXhWLeMA0i5njWninyTA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534245; c=relaxed/simple;
	bh=+ir0wgSpyLEltTxsgeyExf7czD5n9dwiKNdzfgzbSho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZVbXncE2n5invCihhPYww6COxPsysSD4bvrtVdvaMEuvaqP/ps+e/5EEQAVCNLK95Xv3xEEqmsMcKwyQQNnGkRNL0VV88nB52k1NzuSa3KWHg+PxEsbGsECcuhJcZcLCLHnZaXOCFVrCQdfc7G3edxGvSvkYsvbad39K18YffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKLZw+go; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKLZw+go"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8ADC4CEED;
	Tue,  6 May 2025 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534244;
	bh=+ir0wgSpyLEltTxsgeyExf7czD5n9dwiKNdzfgzbSho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cKLZw+gogY1SgXrmBE3tbNgqRvt55B+jasAmQ7bBAWP9e4vehmjWr3wfR6JBz86ro
	 wasmzWNYPT4ybP9cp356+hLK6SGfzkmBse15vixgyUEIxoIRFN8H8o7lSsPcJeQ9u9
	 2A5d7jwuqwfQl1GyNlVqhfhwkHCAbXIl9UtmbgAJVmj9ZDzOermD8OqrYe9QMdbUhk
	 Y7nERa34E2lbMRvmILmt1FDKyGLMg6B6SHgk6JcMhBofh7gHrtaxv00RRjrWuHFj2Q
	 bZO44vnHP8P6HFsFcQypU/rHP9dEais+dL0ruMmim2u212Aln/GaXkRUMzu7Q2Wnfz
	 1ZZz7O8YjzsZA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:30 +0200
Subject: [PATCH v3 01/25] dt-bindings: interrupt-controller: Add Arm GICv5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-1-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..1902291c3cccc06d27c5f79123e67774cf9a0e43 100644
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

