Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06335215798;
	Sat,  7 Jun 2025 21:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331540; cv=none; b=nqOtUlhh/YBDMgWOK+k2frmsBleNm/Kz8xRqr3N08ENMddKhTrBvlbqUcBTM0zBeeuWKUKR+UOvM84220NAut4Y5uyNz8b67jEUpZMUCuadSEUUCquiPBwSbbeXBFuP71BKxjnWssslzQTJE02gZzqgjUXI4pbn9C+yOrM6cnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331540; c=relaxed/simple;
	bh=lDutR/OkZJ8kejemD+ev3cJGgma3EktDwsICk0qZi/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOaiejjdEN5rSyDfYKeNHY0kiGU24/sbwRpAvPpLBNpz+rkjeS6Nv953lbtYAnV3QS9TUQvkVH7rJYCbu6r8M08fc5C47IFPCiac+rIGlvnRTPSECYUjYp5VTED8EqT/ofOvGebOhFQVZhY64yYdU3fANeZE6jgXaEN3zNunoMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiVYTStC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiVYTStC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6770EC4CEF2;
	Sat,  7 Jun 2025 21:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331539;
	bh=lDutR/OkZJ8kejemD+ev3cJGgma3EktDwsICk0qZi/c=;
	h=From:To:Cc:Subject:Date:From;
	b=QiVYTStC0tCKCpWkxIXZjo51dquboWRkaSsp9XUW3T6nGrRTiI1b3gcFjshihMhkn
	 gc3j/YqolsyW8TRo24Y7YaZmkfOckgbgms1HEAmMDUyUQ6LUepPZBe4TM/6uoXE4cc
	 jQ4AWh/i9e25i624WS3WVuMctwJOSNgdUos0/l2+kTqDJRoybJHjDvD68eDjCH38cd
	 cQfdMHgQobnfJ6H0DqsWmYsl1CfGpMIeBJVHmeEuar5y7oh3b2hXQ1icvwdQdPkiMG
	 C1CThrSJ9UFWvJVKCrwD6CmQZ/yLKV2HjrQodtoxCEtgaCoR7fK6SG6eDAjVoKkWYC
	 9ao94dAP1hC5A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert lantiq,ase-usb2-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:36 -0500
Message-ID: <20250607212537.742287-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Lantiq XWAY USB PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/lantiq,ase-usb2-phy.yaml     | 71 +++++++++++++++++++
 .../bindings/phy/phy-lantiq-rcu-usb2.txt      | 40 -----------
 2 files changed, 71 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,ase-usb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt

diff --git a/Documentation/devicetree/bindings/phy/lantiq,ase-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,ase-usb2-phy.yaml
new file mode 100644
index 000000000000..99b5da705ca4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/lantiq,ase-usb2-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/lantiq,ase-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq XWAY SoC RCU USB 1.1/2.0 PHY
+
+maintainers:
+  - Hauke Mehrtens <hauke@hauke-m.de>
+
+description:
+  This node has to be a sub node of the Lantiq RCU block.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,ase-usb2-phy
+          - lantiq,danube-usb2-phy
+          - lantiq,xrx100-usb2-phy
+          - lantiq,xrx200-usb2-phy
+          - lantiq,xrx300-usb2-phy
+
+  reg:
+    items:
+      - description: Offset of the USB PHY configuration register
+      - description: Offset of the USB Analog configuration register
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: phy
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - enum: [ phy, ctrl ]
+      - const: ctrl
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    usb2-phy@18 {
+        compatible = "lantiq,xrx200-usb2-phy";
+        reg = <0x18 4>, <0x38 4>;
+        clocks = <&pmu 1>;
+        clock-names = "phy";
+        resets = <&reset1 4 4>, <&reset0 4 4>;
+        reset-names = "phy", "ctrl";
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt b/Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt
deleted file mode 100644
index 643948b6b576..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Lantiq XWAY SoC RCU USB 1.1/2.0 PHY binding
-===========================================
-
-This binding describes the USB PHY hardware provided by the RCU module on the
-Lantiq XWAY SoCs.
-
-This node has to be a sub node of the Lantiq RCU block.
-
--------------------------------------------------------------------------------
-Required properties (controller (parent) node):
-- compatible	: Should be one of
-			"lantiq,ase-usb2-phy"
-			"lantiq,danube-usb2-phy"
-			"lantiq,xrx100-usb2-phy"
-			"lantiq,xrx200-usb2-phy"
-			"lantiq,xrx300-usb2-phy"
-- reg		: Defines the following sets of registers in the parent
-		  syscon device
-			- Offset of the USB PHY configuration register
-			- Offset of the USB Analog configuration
-			  register (only for xrx200 and xrx200)
-- clocks	: References to the (PMU) "phy" clk gate.
-- clock-names	: Must be "phy"
-- resets	: References to the RCU USB configuration reset bits.
-- reset-names	: Must be one of the following:
-			"phy" (optional)
-			"ctrl" (shared)
-
--------------------------------------------------------------------------------
-Example for the USB PHYs on an xRX200 SoC:
-	usb_phy0: usb2-phy@18 {
-		compatible = "lantiq,xrx200-usb2-phy";
-		reg = <0x18 4>, <0x38 4>;
-
-		clocks = <&pmu PMU_GATE_USB0_PHY>;
-		clock-names = "phy";
-		resets = <&reset1 4 4>, <&reset0 4 4>;
-		reset-names = "phy", "ctrl";
-		#phy-cells = <0>;
-	};
-- 
2.47.2

