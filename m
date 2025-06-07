Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1065218851;
	Sat,  7 Jun 2025 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331554; cv=none; b=H0vvLAktXLnA2QEV0IyyyDbeWoV42cieDIWDa4rLiff1Bpa1zV07MIHBVggaaUMqqgzb5V1wVAnOlEBWuPbQGVWSdnaLwXcIX/05rgqGChGOpJzYHV2Jwv4WVZa2uafpb+Vlwa4ylJtAqQwpumTYMuN7VxwaJrVl2GbEZ4v+iS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331554; c=relaxed/simple;
	bh=S5OJVr6BMTt9ny5ViUGSZwRUrV81HRHFty5+QI2xE3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgsDUs0HzOXYVYwHOT43C9nTbHW+4spbgy5h3VY1Dta3SK2g0R7x29DNUidKapvFAieiAB9VtTEfBUK7O7dNVY9UCVdKLfTm6RsUWvhIUu25jdKgvLGug9KRCyIpxXZXqe+EWYi51DkE+d3V4rf1D/oxnbTBB/ZRSbYi0LrafPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNfDf5j2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNfDf5j2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35897C4CEE4;
	Sat,  7 Jun 2025 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331553;
	bh=S5OJVr6BMTt9ny5ViUGSZwRUrV81HRHFty5+QI2xE3M=;
	h=From:To:Cc:Subject:Date:From;
	b=eNfDf5j2U6C3hZIIb7v+x4L0SasIJZyvKNacZ9zPkzCqLiQU/8HKFptHZ8b4RrMzL
	 MZ8IdxZ84E5WLezriHrav9zaHUMEEhrVM7ksEbLfnaHDM//vSqzkoQBMzJQOrEvzM6
	 y2ek2XC5LMDcBAtUrqM1W7mP29kx8nIgPNykQqTQtqGtwu/BFEo3OgB2SAI9Of7Eq/
	 2Mgwa3GSq5z0Xp/j2gM9+T5kZnogG/siHHdouuvKa+880elGji07IFTHdBmTiqy3tY
	 2gMqZwFAPEYyiux2COW6mQK3Hmadijbs7JUOWGP4uDDMQgKzT3dBpWtUKtkxUcR0e/
	 6uuwX3heMt+OQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert marvell,berlin2-sata-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:44 -0500
Message-ID: <20250607212545.742617-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Berlin2 SATA PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/berlin-sata-phy.txt          | 36 ---------
 .../phy/marvell,berlin2-sata-phy.yaml         | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/berlin-sata-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/marvell,berlin2-sata-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt b/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt
deleted file mode 100644
index c0155f842f62..000000000000
--- a/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Berlin SATA PHY
----------------
-
-Required properties:
-- compatible: should be one of
-    "marvell,berlin2-sata-phy"
-    "marvell,berlin2q-sata-phy"
-- address-cells: should be 1
-- size-cells: should be 0
-- phy-cells: from the generic PHY bindings, must be 1
-- reg: address and length of the register
-- clocks: reference to the clock entry
-
-Sub-nodes:
-Each PHY should be represented as a sub-node.
-
-Sub-nodes required properties:
-- reg: the PHY number
-
-Example:
-	sata_phy: phy@f7e900a0 {
-		compatible = "marvell,berlin2q-sata-phy";
-		reg = <0xf7e900a0 0x200>;
-		clocks = <&chip CLKID_SATA>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#phy-cells = <1>;
-
-		sata-phy@0 {
-			reg = <0>;
-		};
-
-		sata-phy@1 {
-			reg = <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/phy/marvell,berlin2-sata-phy.yaml b/Documentation/devicetree/bindings/phy/marvell,berlin2-sata-phy.yaml
new file mode 100644
index 000000000000..6fc9ff96e682
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/marvell,berlin2-sata-phy.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/marvell,berlin2-sata-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Berlin SATA PHY
+
+maintainers:
+  - Antoine Tenart <atenart@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - marvell,berlin2-sata-phy
+      - marvell,berlin2q-sata-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 1
+
+patternProperties:
+  '^sata-phy@[0-1]$':
+    description: A SATA PHY sub-node.
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+        description: PHY index number.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/berlin2q.h>
+
+    phy@f7e900a0 {
+        compatible = "marvell,berlin2q-sata-phy";
+        reg = <0xf7e900a0 0x200>;
+        clocks = <&chip CLKID_SATA>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #phy-cells = <1>;
+
+        sata-phy@0 {
+            reg = <0>;
+        };
+
+        sata-phy@1 {
+            reg = <1>;
+        };
+    };
-- 
2.47.2

