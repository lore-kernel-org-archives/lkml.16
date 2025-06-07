Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA272192FB;
	Sat,  7 Jun 2025 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331568; cv=none; b=rgHq3pLZjROoFK7ccplDzAFLVPZLHRdicb+JEZIAhuUcJ8Vws8gualHJr07L79Ry6TLeJ+yFwwCQRQpHZ2H6osc0/iT5da328m3/riStc7pHVnTPF7StBU6ZHy/+aJzMFjJtWSDJwqKj0iC7IhNImZOpPEvOZVErQMOG5r+ydl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331568; c=relaxed/simple;
	bh=u29uebHU4LzMIDnLy+ZN3RITbyjTQBcHBeYH6wky+rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lbK0ue+yNNmxu3l+q2SLh2Uu8l0ewY1p4r/6WzB0RQnnnM18t+OJSmeBpCjU6d9VEUHdTWC0wP4AkttoTyKazSmeE5WYSLRPZ55uUzKLcsbNYPh/LQe05q26VhmRZhN9nasKcm0JmD+BIH8DTNbEArjK8RhR5eTpxkn9B0WTtFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJEJf9BB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJEJf9BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586D9C4CEE4;
	Sat,  7 Jun 2025 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331567;
	bh=u29uebHU4LzMIDnLy+ZN3RITbyjTQBcHBeYH6wky+rw=;
	h=From:To:Cc:Subject:Date:From;
	b=JJEJf9BBK5oh8ErN7gZok+kvWfMbAorazW/b1HZsY72qeOq4ibHud/5JQhPESRC8+
	 3+D+jjIyb9/RxjUm4zKWxkajBP8+0/u7IxhL+uj4JTyOsbh3xSxDDFX34DdxTHBCjb
	 JVaJJkYM4aVWD0uErPUHM3qtdJjc/wJKBeyDwUgVXehDhFEgA3Rj1YsYlZnGnka+hH
	 FK/OENXe3qc2+0xf5bRyo0h/0bte5da6Ewj2bcNX/Y+m+dxe9p6Yjh4b4X9czwA2GJ
	 jwlrDHT3lszZsKcXP5EklpaDVGJVVc6bsVl/8iCKmdCnZv0msWnEhfAOJiuGaXigAF
	 vrYHGjGWb1DxQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert marvell,comphy-cp110 to DT schema
Date: Sat,  7 Jun 2025 16:26:03 -0500
Message-ID: <20250607212605.743176-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell CP110 combo PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/marvell,comphy-cp110.yaml    | 154 ++++++++++++++++++
 .../bindings/phy/phy-mvebu-comphy.txt         |  94 -----------
 MAINTAINERS                                   |   2 +-
 3 files changed, 155 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt

diff --git a/Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml b/Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml
new file mode 100644
index 000000000000..d9501df42886
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MVEBU COMPHY Controller
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: >
+  COMPHY controllers can be found on the following Marvell MVEBU SoCs:
+
+    * Armada 7k/8k (on the CP110)
+    * Armada 3700
+
+  It provides a number of shared PHYs used by various interfaces (network, SATA,
+  USB, PCIe...).
+
+properties:
+  compatible:
+    enum:
+      - marvell,comphy-cp110
+      - marvell,comphy-a3700
+
+  reg:
+    minItems: 1
+    items:
+      - description: Generic COMPHY registers
+      - description: Lane 1 (PCIe/GbE) registers (Armada 3700)
+      - description: Lane 0 (USB3/GbE) registers (Armada 3700)
+      - description: Lane 2 (SATA/USB3) registers (Armada 3700)
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: comphy
+      - const: lane1_pcie_gbe
+      - const: lane0_usb3_gbe
+      - const: lane2_sata_usb3
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  clocks:
+    maxItems: 3
+    description: Reference clocks for CP110; MG clock, MG Core clock, AXI clock
+
+  clock-names:
+    items:
+      - const: mg_clk
+      - const: mg_core_clk
+      - const: axi_clk
+
+  marvell,system-controller:
+    description: Phandle to the Marvell system controller (CP110 only)
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+patternProperties:
+  '^phy@[0-2]$':
+    description: A COMPHY lane child node
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        description: COMPHY lane number
+
+      '#phy-cells':
+        const: 1
+
+    required:
+      - reg
+      - '#phy-cells'
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: marvell,comphy-a3700
+
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+      required:
+        - reg-names
+
+    else:
+      required:
+        - marvell,system-controller
+
+examples:
+  - |
+    phy@120000 {
+        compatible = "marvell,comphy-cp110";
+        reg = <0x120000 0x6000>;
+        clocks = <&clk 1 5>, <&clk 1 6>, <&clk 1 18>;
+        clock-names = "mg_clk", "mg_core_clk", "axi_clk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        marvell,system-controller = <&syscon0>;
+
+        phy@0 {
+            reg = <0>;
+            #phy-cells = <1>;
+        };
+
+        phy@1 {
+            reg = <1>;
+            #phy-cells = <1>;
+        };
+    };
+
+  - |
+    phy@18300 {
+        compatible = "marvell,comphy-a3700";
+        reg = <0x18300 0x300>,
+              <0x1F000 0x400>,
+              <0x5C000 0x400>,
+              <0xe0178 0x8>;
+        reg-names = "comphy",
+                    "lane1_pcie_gbe",
+                    "lane0_usb3_gbe",
+                    "lane2_sata_usb3";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        comphy0: phy@0 {
+            reg = <0>;
+            #phy-cells = <1>;
+        };
+
+        comphy1: phy@1 {
+            reg = <1>;
+            #phy-cells = <1>;
+        };
+
+        comphy2: phy@2 {
+            reg = <2>;
+            #phy-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt b/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
deleted file mode 100644
index 5ffd0f55d010..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-MVEBU comphy drivers
---------------------
-
-COMPHY controllers can be found on the following Marvell MVEBU SoCs:
-* Armada 7k/8k (on the CP110)
-* Armada 3700
-It provides a number of shared PHYs used by various interfaces (network, SATA,
-USB, PCIe...).
-
-Required properties:
-
-- compatible: should be one of:
-  * "marvell,comphy-cp110" for Armada 7k/8k
-  * "marvell,comphy-a3700" for Armada 3700
-- reg: should contain the COMPHY register(s) location(s) and length(s).
-  * 1 entry for Armada 7k/8k
-  * 4 entries for Armada 3700 along with the corresponding reg-names
-    properties, memory areas are:
-    * Generic COMPHY registers
-    * Lane 1 (PCIe/GbE)
-    * Lane 0 (USB3/GbE)
-    * Lane 2 (SATA/USB3)
-- marvell,system-controller: should contain a phandle to the system
-			     controller node (only for Armada 7k/8k)
-- #address-cells: should be 1.
-- #size-cells: should be 0.
-
-Optional properlties:
-
-- clocks: pointers to the reference clocks for this device (CP110 only),
-          consequently: MG clock, MG Core clock, AXI clock.
-- clock-names: names of used clocks for CP110 only, must be :
-               "mg_clk", "mg_core_clk" and "axi_clk".
-
-A sub-node is required for each comphy lane provided by the comphy.
-
-Required properties (child nodes):
-
-- reg: COMPHY lane number.
-- #phy-cells : from the generic PHY bindings, must be 1. Defines the
-               input port to use for a given comphy lane.
-
-Examples:
-
-	CP11X_LABEL(comphy): phy@120000 {
-		compatible = "marvell,comphy-cp110";
-		reg = <0x120000 0x6000>;
-		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
-		clocks = <&CP11X_LABEL(clk) 1 5>, <&CP11X_LABEL(clk) 1 6>,
-			 <&CP11X_LABEL(clk) 1 18>;
-		clock-names = "mg_clk", "mg_core_clk", "axi_clk";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		CP11X_LABEL(comphy0): phy@0 {
-			reg = <0>;
-			#phy-cells = <1>;
-		};
-
-		CP11X_LABEL(comphy1): phy@1 {
-			reg = <1>;
-			#phy-cells = <1>;
-		};
-	};
-
-	comphy: phy@18300 {
-		compatible = "marvell,comphy-a3700";
-		reg = <0x18300 0x300>,
-		<0x1F000 0x400>,
-		<0x5C000 0x400>,
-		<0xe0178 0x8>;
-		reg-names = "comphy",
-		"lane1_pcie_gbe",
-		"lane0_usb3_gbe",
-		"lane2_sata_usb3";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-
-		comphy0: phy@0 {
-			reg = <0>;
-			#phy-cells = <1>;
-		};
-
-		comphy1: phy@1 {
-			reg = <1>;
-			#phy-cells = <1>;
-		};
-
-		comphy2: phy@2 {
-			reg = <2>;
-			#phy-cells = <1>;
-		};
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 5defb941c141..8fc2f21de224 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14495,7 +14495,7 @@ MARVELL ARMADA 3700 PHY DRIVERS
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml
-F:	Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
+F:	Documentation/devicetree/bindings/phy/marvell,comphy-cp110.yaml
 F:	drivers/phy/marvell/phy-mvebu-a3700-comphy.c
 F:	drivers/phy/marvell/phy-mvebu-a3700-utmi.c
 
-- 
2.47.2

