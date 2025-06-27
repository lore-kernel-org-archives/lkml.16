Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDDE28C02B;
	Fri, 27 Jun 2025 22:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751061671; cv=none; b=JJx4iUXy3NP48IogSvWfu49ZLI/mbCfJJdSUxtC8Vc5nVbnQ1WK1SLsY70k1LAPFrHOfZxrHepiK0KtCNUcCwYeMfbk1rsFUGqpQBqH00PTeYdFuf5UL6IxiS34Ed57jtGgEbPFd8USCUJVZC8oOvnxHDjNtPUIjEC0jONZqYIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751061671; c=relaxed/simple;
	bh=BBDMuacztTBtEROA79o/9jfSg7I2yx27X8lo9p2vjMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBzvrjaSClaJ2i3bKkpLBhqO2lQzFeUnjxtHwXAfi1ojeVJ6+5TtLppW755a/wFrh7er3wEdiUX6NvrEUUqIWRzqibQIKsgm/rOp99VQTKgdJ3K51J5bsNTnReJo/+fQM6LwL+TU6mTul1upF4z/fHExajpaSOc01J5DYdNcJIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQhqkObn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQhqkObn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA5AC4CEE3;
	Fri, 27 Jun 2025 22:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751061671;
	bh=BBDMuacztTBtEROA79o/9jfSg7I2yx27X8lo9p2vjMI=;
	h=From:To:Cc:Subject:Date:From;
	b=dQhqkObnkc688nkTHLB1YNw+nkGpECLKTrcGZicJVv8dZnR8PU8BemzkPgj2ZD12N
	 N7PX7/OyDQtenL2S4MiJcoaTi9jiRQB8K3Y8GL3l1K6x+OdcLT8eYAxzAC+Qd4VYbG
	 9Q74EfVF/dtBENO2yEq6IFHBVJGy/C/qx6k1H8MpI4sDPLJksnIkSz+DoT8Q2AKFjR
	 OMEBJVwgtSSOHMXAPOLQgiXPmMWkF/xe3WNynjC+xcecG3ICmSMObRUwJnsrXPfEH0
	 FezZ8HAVdeaxXruSwoboLyaoBA1p6hmc8eRqRrO6s+zMX3iFk13pFp6zk91OkL1l7t
	 MevjIQnyY4OSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <david@lechnology.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: phy: Convert ti,da830-usb-phy to DT schema
Date: Fri, 27 Jun 2025 17:01:06 -0500
Message-ID: <20250627220107.214162-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI DA830 USB PHY binding to DT schema format. Add "clocks"
and "clock-names" which are already in use. As they are always present,
make them required as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Move some description to #phy-cells
 - Make clocks/clock-names required
---
 .../devicetree/bindings/phy/phy-da8xx-usb.txt | 40 --------------
 .../bindings/phy/ti,da830-usb-phy.yaml        | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
 create mode 100644 Documentation/devicetree/bindings/phy/ti,da830-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
deleted file mode 100644
index c26478be391b..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-TI DA8xx/OMAP-L1xx/AM18xx USB PHY
-
-Required properties:
- - compatible: must be "ti,da830-usb-phy".
- - #phy-cells: must be 1.
-
-This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
-controllers on DA8xx SoCs. Consumers of this device should use index 0 for
-the USB 2.0 phy device and index 1 for the USB 1.1 phy device.
-
-It also requires a "syscon" node with compatible = "ti,da830-cfgchip", "syscon"
-to access the CFGCHIP2 register.
-
-Example:
-
-	cfgchip: cfgchip@1417c {
-		compatible = "ti,da830-cfgchip", "syscon";
-		reg = <0x1417c 0x14>;
-	};
-
-	usb_phy: usb-phy {
-		compatible = "ti,da830-usb-phy";
-		#phy-cells = <1>;
-	};
-
-	usb20: usb@200000 {
-		compatible = "ti,da830-musb";
-		reg = <0x200000 0x1000>;
-		interrupts = <58>;
-		phys = <&usb_phy 0>;
-		phy-names = "usb-phy";
-	};
-
-	usb11: usb@225000 {
-		compatible = "ti,da830-ohci";
-		reg = <0x225000 0x1000>;
-		interrupts = <59>;
-		phys = <&usb_phy 1>;
-		phy-names = "usb-phy";
-	};
diff --git a/Documentation/devicetree/bindings/phy/ti,da830-usb-phy.yaml b/Documentation/devicetree/bindings/phy/ti,da830-usb-phy.yaml
new file mode 100644
index 000000000000..1d6f30b5a159
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,da830-usb-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,da830-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DA8xx/OMAP-L1xx/AM18xx USB PHY
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description: >
+  This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
+  controllers on DA8xx SoCs.
+  
+  It also requires a "syscon" node with compatible = "ti,da830-cfgchip", "syscon"
+  to access the CFGCHIP2 register.
+
+properties:
+  compatible:
+    items:
+      - const: ti,da830-usb-phy
+
+  '#phy-cells':
+    const: 1
+    description:
+      Consumers of this device should use index 0 for the USB 2.0 phy device and
+      index 1 for the USB 1.1 phy device.
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: usb0_clk48
+      - const: usb1_clk48
+
+required:
+  - compatible
+  - '#phy-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy {
+        compatible = "ti,da830-usb-phy";
+        #phy-cells = <1>;
+        clocks = <&usb_phy_clk 0>, <&usb_phy_clk 1>;
+        clock-names = "usb0_clk48", "usb1_clk48";
+    };
-- 
2.47.2

