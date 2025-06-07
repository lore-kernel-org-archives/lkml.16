Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7172165E9;
	Sat,  7 Jun 2025 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331544; cv=none; b=nc8C6wIjBMMBYSS7A1+FjNmM+JkcdbmQfCERzz6G7bsgkp2LZqhq4q021Mxv1ZI+CiXWzcMQ1zbu36i6b6AsC7S1XYprZrimE3ZU/AhFmUisYm6bBE+Zs+Js9f8Dfi6t0l+y3XXXTFEFsRDFROAyi0mRcVbxrtIRqPy2AX6YSk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331544; c=relaxed/simple;
	bh=j1/lkJgtqy4+16mK/gyMR0VMNIfeyeJnF3QBrtQixPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mRGsqYJ8lpQ0/UfL7gtEzFWif91xkTEEM+N6gqsstZ9Lqgp2H9d++gGEqzbqLR+RVaqiZXsfWP7b0uDa5M8RJk27vmVHABKVCChCPkegxAz5yFe3q0MiA+lEaWY1wJVRVJzyqSSEwpZCYzEXVjOK9h6dJ5k2yvuqcwf5OuIrwjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opIVyA5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opIVyA5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F96FC4CEE4;
	Sat,  7 Jun 2025 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331543;
	bh=j1/lkJgtqy4+16mK/gyMR0VMNIfeyeJnF3QBrtQixPs=;
	h=From:To:Cc:Subject:Date:From;
	b=opIVyA5/vgjtAQC0y8vRkUfTuiwiCbucZJ86OmP1L+apjv67v9wLw95EP/VfBLJnb
	 AAia9zkhxq7RVdLrdy1RM/ZNDuWkT+4ejWyhg0OXhNSjc+Nw4YCBWFe0ngxObN6U7K
	 hnE+q/qV5eAznRCKpFp0TaCS2Mg+v2NECUvyhmTJv8JsPFB9hDxDJdZkDCngebWcbF
	 6p8p7FpGyHxKPOudNm0oJ89uDh5OQRjkmzU5itfU+W/e2ElzBoWy6fmua1UsnJtZN/
	 ZaJ0UylnbnaeHyvqS5hUqkoB9ET/a5KfyFZX2we/T4URF3wSNa7SXnnWtafG7lERe4
	 eBwR3pO6fdOIg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert marvell,armada-380-comphy to DT schema
Date: Sat,  7 Jun 2025 16:25:40 -0500
Message-ID: <20250607212541.742427-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada 38x combo PHY binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../phy/marvell,armada-380-comphy.yaml        | 83 +++++++++++++++++++
 .../bindings/phy/phy-armada38x-comphy.txt     | 48 -----------
 2 files changed, 83 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt

diff --git a/Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml b/Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml
new file mode 100644
index 000000000000..dcb4c0007832
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,armada-380-comphy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 38x COMPHY controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+description:
+  This comphy controller can be found on Marvell Armada 38x. It provides a
+  number of shared PHYs used by various interfaces (network, sata, usb,
+  PCIe...).
+
+properties:
+  compatible:
+    items:
+      - const: marvell,armada-380-comphy
+
+  reg:
+    items:
+      - description: COMPHY register location and length
+      - description: Configuration register location and length
+
+  reg-names:
+    items:
+      - const: comphy
+      - const: conf
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^phy@[0-5]$':
+    description: A COMPHY lane
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+
+      '#phy-cells':
+        description: Input port index for the PHY lane
+        const: 1
+
+    required:
+      - reg
+      - '#phy-cells'
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    comphy: phy@18300 {
+        compatible = "marvell,armada-380-comphy";
+        reg = <0x18300 0x100>, <0x18460 4>;
+        reg-names = "comphy", "conf";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpm_comphy0: phy@0 {
+            reg = <0>;
+            #phy-cells = <1>;
+        };
+
+        cpm_comphy1: phy@1 {
+            reg = <1>;
+            #phy-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt b/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
deleted file mode 100644
index 8b5a7a28a35b..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-armada38x-comphy.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-mvebu armada 38x comphy driver
-------------------------------
-
-This comphy controller can be found on Marvell Armada 38x. It provides a
-number of shared PHYs used by various interfaces (network, sata, usb,
-PCIe...).
-
-Required properties:
-
-- compatible: should be "marvell,armada-380-comphy"
-- reg: should contain the comphy register location and length.
-- #address-cells: should be 1.
-- #size-cells: should be 0.
-
-Optional properties:
-
-- reg-names: must be "comphy" as the first name, and "conf".
-- reg: must contain the comphy register location and length as the first
-    pair, followed by an optional configuration register address and
-    length pair.
-
-A sub-node is required for each comphy lane provided by the comphy.
-
-Required properties (child nodes):
-
-- reg: comphy lane number.
-- #phy-cells : from the generic phy bindings, must be 1. Defines the
-               input port to use for a given comphy lane.
-
-Example:
-
-	comphy: phy@18300 {
-		compatible = "marvell,armada-380-comphy";
-		reg-names = "comphy", "conf";
-		reg = <0x18300 0x100>, <0x18460 4>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpm_comphy0: phy@0 {
-			reg = <0>;
-			#phy-cells = <1>;
-		};
-
-		cpm_comphy1: phy@1 {
-			reg = <1>;
-			#phy-cells = <1>;
-		};
-	};
-- 
2.47.2

