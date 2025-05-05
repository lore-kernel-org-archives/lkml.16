Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705F2641C3;
	Mon,  5 May 2025 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456492; cv=none; b=d+7Uimo5kth1fUE9HKXwLqjVgBNuZKx5VsSe3G8dd1RnX3m88yc6g+YII8w2DIAKzph+Jz/lNAr5hmPM33i5/gRDYgPmaRgZcbGLXwwnwepb4wek9Bs0ZUWySTLID0ELmFcKBWViK04X5776cZaOVX2nhravPAuukvg1j6onkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456492; c=relaxed/simple;
	bh=fySWCkl4qC2223UvwdAPk60K3a3+JMBFaKMwj26FmyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uuljNr+fu05I//oel122znWzsuPt6iRo5by90NXrGIwKYnxDmP+iDOmazxj5tadYbCHSCVaBZdIr3vGISgiNKNuB0cUTCrQ2FD10OmFRdfdImkKVU8lOYJTE/SNFfGszLbjit48UTufpcyHkV2GKfpD9pZyCBSqmRoDZmgsMS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EizQJSgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EizQJSgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A3CC4CEE4;
	Mon,  5 May 2025 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456492;
	bh=fySWCkl4qC2223UvwdAPk60K3a3+JMBFaKMwj26FmyA=;
	h=From:To:Cc:Subject:Date:From;
	b=EizQJSgvWoOhvO7Zbc5vtL6PQpDD23NnE4owEJ+C5rXjnMKGhYksHPyiokFScOXh+
	 zyWCg91rVC1NPNzPwtAtitYcwAL8+0GiMc4eAMGo0E4IhQPvYNw+h+h5bvN/msL201
	 PTCp/buVmCPLeD6havtig+LeaDRGHhGrTJe9th3eCX/b1NeqgSotCr1U1wgu56Z67h
	 VJvrHusAczJtV8Ikl1iTPQJnEjS6nKt118g/w3x9v1+tuIdJ8UvQe7ZB9lQnkpb0t8
	 p+b+jDZ1bkw0tLFpl2drmjBySqdK4CGO6lX2jhYyPKCD4aNIE76QieRU/pKFNoNQDe
	 GQGa24X05vJeA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema
Date: Mon,  5 May 2025 09:48:08 -0500
Message-ID: <20250505144809.1291619-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Open PIC interrupt controller binding to schema format.

While the Linux kernel supports the "open-pic" compatible, that's not
used in any upstream .dts file. It used for "device_type" though. Add
"fsl,mpic" compatible which was not documented.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/chrp,open-pic.yaml   | 63 ++++++++++++
 .../interrupt-controller/open-pic.txt         | 97 -------------------
 2 files changed, 63 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/open-pic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
new file mode 100644
index 000000000000..f0d9bbd7d510
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open PIC Interrupt Controller
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description:
+  This binding specifies what properties must be available in the device tree
+  representation of an Open PIC compliant interrupt controller.  This binding is
+  based on the binding defined for Open PIC in [1] and is a superset of that
+  binding.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: fsl,mpic
+          - const: chrp,open-pic
+      - const: chrp,open-pic
+
+  device_type:
+    const: open-pci
+    deprecated: true
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 2
+
+  pic-no-reset:
+    description: Indicates the PIC shall not be reset during runtime initialization.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@40000 {
+        compatible = "chrp,open-pic";
+        reg = <0x40000 0x40000>;
+        interrupt-controller;
+        #address-cells = <0>;
+        #interrupt-cells = <2>;
+        pic-no-reset;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/open-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/open-pic.txt
deleted file mode 100644
index ccbbfdc53c72..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/open-pic.txt
+++ /dev/null
@@ -1,97 +0,0 @@
-* Open PIC Binding
-
-This binding specifies what properties must be available in the device tree
-representation of an Open PIC compliant interrupt controller.  This binding is
-based on the binding defined for Open PIC in [1] and is a superset of that
-binding.
-
-Required properties:
-
-  NOTE: Many of these descriptions were paraphrased here from [1] to aid
-        readability.
-
-    - compatible: Specifies the compatibility list for the PIC.  The type
-      shall be <string> and the value shall include "open-pic".
-
-    - reg: Specifies the base physical address(s) and size(s) of this
-      PIC's addressable register space.  The type shall be <prop-encoded-array>.
-
-    - interrupt-controller: The presence of this property identifies the node
-      as an Open PIC.  No property value shall be defined.
-
-    - #interrupt-cells: Specifies the number of cells needed to encode an
-      interrupt source.  The type shall be a <u32> and the value shall be 2.
-
-    - #address-cells: Specifies the number of cells needed to encode an
-      address.  The type shall be <u32> and the value shall be 0.  As such,
-      'interrupt-map' nodes do not have to specify a parent unit address.
-
-Optional properties:
-
-    - pic-no-reset: The presence of this property indicates that the PIC
-      shall not be reset during runtime initialization.  No property value shall
-      be defined.  The presence of this property also mandates that any
-      initialization related to interrupt sources shall be limited to sources
-      explicitly referenced in the device tree.
-
-* Interrupt Specifier Definition
-
-  Interrupt specifiers consists of 2 cells encoded as
-  follows:
-
-    - <1st-cell>: The interrupt-number that identifies the interrupt source.
-
-    - <2nd-cell>: The level-sense information, encoded as follows:
-                    0 = low-to-high edge triggered
-                    1 = active low level-sensitive
-                    2 = active high level-sensitive
-                    3 = high-to-low edge triggered
-
-* Examples
-
-Example 1:
-
-	/*
-	 * An Open PIC interrupt controller
-	 */
-	mpic: pic@40000 {
-		// This is an interrupt controller node.
-		interrupt-controller;
-
-		// No address cells so that 'interrupt-map' nodes which reference
-		// this Open PIC node do not need a parent address specifier.
-		#address-cells = <0>;
-
-		// Two cells to encode interrupt sources.
-		#interrupt-cells = <2>;
-
-		// Offset address of 0x40000 and size of 0x40000.
-		reg = <0x40000 0x40000>;
-
-		// Compatible with Open PIC.
-		compatible = "open-pic";
-
-		// The PIC shall not be reset.
-		pic-no-reset;
-	};
-
-Example 2:
-
-	/*
-	 * An interrupt generating device that is wired to an Open PIC.
-	 */
-	serial0: serial@4500 {
-		// Interrupt source '42' that is active high level-sensitive.
-		// Note that there are only two cells as specified in the interrupt
-		// parent's '#interrupt-cells' property.
-		interrupts = <42 2>;
-
-		// The interrupt controller that this device is wired to.
-		interrupt-parent = <&mpic>;
-	};
-
-* References
-
-[1] Devicetree Specification
-    (https://www.devicetree.org/specifications/)
-
-- 
2.47.2

