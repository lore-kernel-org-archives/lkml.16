Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E8A25D1E9;
	Mon,  5 May 2025 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456333; cv=none; b=O8WfWm6dvI8oddntKsRMaLhSy8Pn2j5+gzREdaAr9//negfQGzbKK1QyIYaDNzIJaMN9Qp9litaXnO61rYVy0nXugvzIqsYnaVWxGJ+tslHt90DV3197F6p49iF+aWJ8MKq9TtOf8fq7lx6WcRT0PCGDaRbiJTwXqbZBBi2du9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456333; c=relaxed/simple;
	bh=t0v/i5Jc3hHJnt3i5u4/GJb+kOvcKszCfq5u3iUIeaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wk4wsKjlmkK33FaQQji41qp9GTFyRzrraNIAfoPSn7pTBstX1w/nCQl2tG92NFsrqJj05XabSO8CgYmU4u/POwiRN0dj9FvrPQWx+CnGSKwDVgyo/Iga/7k08DMIlvY/LVSyqF/TfzUNEgbuVA33JRuIhdpzyNox/WBAkYV/G9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBU1dXGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBU1dXGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C357CC4CEE4;
	Mon,  5 May 2025 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456333;
	bh=t0v/i5Jc3hHJnt3i5u4/GJb+kOvcKszCfq5u3iUIeaM=;
	h=From:To:Cc:Subject:Date:From;
	b=uBU1dXGcat6IcoBpr3VyFOGTAzGWG856zFOmLjU/aHDPOJkHphBV2gSAhtAfnoIJp
	 vYw/yNiBGDbArB7hhguRvbMe1L/V5cLgcpwRsqN7MCiwMsT0phPNdnjbNiLl6MCqeJ
	 PzJg4y0KTScw4AkIK0ceqIPzuoyIzQaOO1MuSCYB3AHmtrMWoJlXkJ1kQO1h2c9bu5
	 A1+Fq0WoRo1bTj/VY4AHq+p9MHGvn9reQxs0Ul1gP7RqLw/3N259lXnoAa+10QXG4i
	 UlQDTrZkuEmmCPt3FQJ8boK+YeqcVIUQCiMiRHJCIiKIHrJWuFc84Eqef6bWqNaR4B
	 qqxpOfzqVx0nw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert marvell,cp110-icu to DT schema
Date: Mon,  5 May 2025 09:45:23 -0500
Message-ID: <20250505144524.1285795-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell ICU interrupt controller to DT schema format.

Add the missing addressing properties to read and translate child node
addresses.

Drop the legacy binding description and example.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../marvell,cp110-icu.yaml                    |  98 +++++++++++++++
 .../interrupt-controller/marvell,icu.txt      | 112 ------------------
 2 files changed, 98 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
new file mode 100644
index 000000000000..9d4f06f45372
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/marvell,cp110-icu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+title: Marvell ICU Interrupt Controller
+
+description:
+  The Marvell ICU (Interrupt Consolidation Unit) controller is responsible for
+  collecting all wired-interrupt sources in the CP and communicating them to the
+  GIC in the AP. The unit translates interrupt requests on input wires to MSG
+  memory mapped transactions to the GIC. These messages access different GIC
+  memory areas depending on their type (NSR, SR, SEI, REI, etc).
+
+properties:
+  compatible:
+    const: marvell,cp110-icu
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^interrupt-controller@":
+    type: object
+    description: Interrupt group child nodes
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - marvell,cp110-icu-nsr
+          - marvell,cp110-icu-sr
+          - marvell,cp110-icu-sei
+          - marvell,cp110-icu-rei
+
+      reg:
+        maxItems: 1
+
+      '#interrupt-cells':
+        const: 2
+
+      interrupt-controller: true
+
+      msi-parent:
+        maxItems: 1
+        description: Phandle to the GICP controller
+
+    required:
+      - compatible
+      - reg
+      - '#interrupt-cells'
+      - interrupt-controller
+      - msi-parent
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1e0000 {
+        compatible = "marvell,cp110-icu";
+        reg = <0x1e0000 0x440>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@10 {
+                compatible = "marvell,cp110-icu-nsr";
+                reg = <0x10 0x20>;
+                #interrupt-cells = <2>;
+                interrupt-controller;
+                msi-parent = <&gicp>;
+        };
+
+        interrupt-controller@50 {
+                compatible = "marvell,cp110-icu-sei";
+                reg = <0x50 0x10>;
+                #interrupt-cells = <2>;
+                interrupt-controller;
+                msi-parent = <&sei>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
deleted file mode 100644
index 1c94a57a661e..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-Marvell ICU Interrupt Controller
---------------------------------
-
-The Marvell ICU (Interrupt Consolidation Unit) controller is
-responsible for collecting all wired-interrupt sources in the CP and
-communicating them to the GIC in the AP, the unit translates interrupt
-requests on input wires to MSG memory mapped transactions to the GIC.
-These messages will access a different GIC memory area depending on
-their type (NSR, SR, SEI, REI, etc).
-
-Required properties:
-
-- compatible: Should be "marvell,cp110-icu"
-
-- reg: Should contain ICU registers location and length.
-
-Subnodes: Each group of interrupt is declared as a subnode of the ICU,
-with their own compatible.
-
-Required properties for the icu_nsr/icu_sei subnodes:
-
-- compatible: Should be one of:
-              * "marvell,cp110-icu-nsr"
-	      * "marvell,cp110-icu-sr"
-	      * "marvell,cp110-icu-sei"
-	      * "marvell,cp110-icu-rei"
-
-- #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 2.
-
-  The 1st cell is the index of the interrupt in the ICU unit.
-
-  The 2nd cell is the type of the interrupt. See arm,gic.txt for
-  details.
-
-- interrupt-controller: Identifies the node as an interrupt
-  controller.
-
-- msi-parent: Should point to the GICP controller, the GIC extension
-  that allows to trigger interrupts using MSG memory mapped
-  transactions.
-
-Note: each 'interrupts' property referring to any 'icu_xxx' node shall
-      have a different number within [0:206].
-
-Example:
-
-icu: interrupt-controller@1e0000 {
-	compatible = "marvell,cp110-icu";
-	reg = <0x1e0000 0x440>;
-
-	CP110_LABEL(icu_nsr): interrupt-controller@10 {
-		compatible = "marvell,cp110-icu-nsr";
-		reg = <0x10 0x20>;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		msi-parent = <&gicp>;
-	};
-
-	CP110_LABEL(icu_sei): interrupt-controller@50 {
-		compatible = "marvell,cp110-icu-sei";
-		reg = <0x50 0x10>;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		msi-parent = <&sei>;
-	};
-};
-
-node1 {
-	interrupt-parent = <&icu_nsr>;
-	interrupts = <106 IRQ_TYPE_LEVEL_HIGH>;
-};
-
-node2 {
-	interrupt-parent = <&icu_sei>;
-	interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
-};
-
-/* Would not work with the above nodes */
-node3 {
-	interrupt-parent = <&icu_nsr>;
-	interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
-};
-
-The legacy bindings were different in this way:
-
-- #interrupt-cells: The value was 3.
-	The 1st cell was the group type of the ICU interrupt. Possible
-	group types were:
-	ICU_GRP_NSR (0x0) : Shared peripheral interrupt, non-secure
-	ICU_GRP_SR  (0x1) : Shared peripheral interrupt, secure
-	ICU_GRP_SEI (0x4) : System error interrupt
-	ICU_GRP_REI (0x5) : RAM error interrupt
-	The 2nd cell was the index of the interrupt in the ICU unit.
-	The 3rd cell was the type of the interrupt. See arm,gic.txt for
-	details.
-
-Example:
-
-icu: interrupt-controller@1e0000 {
-	compatible = "marvell,cp110-icu";
-	reg = <0x1e0000 0x440>;
-
-	#interrupt-cells = <3>;
-	interrupt-controller;
-	msi-parent = <&gicp>;
-};
-
-node1 {
-	interrupt-parent = <&icu>;
-	interrupts = <ICU_GRP_NSR 106 IRQ_TYPE_LEVEL_HIGH>;
-};
-- 
2.47.2

