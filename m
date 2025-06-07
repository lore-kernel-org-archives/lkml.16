Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D82192F3;
	Sat,  7 Jun 2025 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331600; cv=none; b=IbSmDyixQoMdtYRrkHxk7e3bUfqzIL7+Sh9NHzalDo3kt5C3kPKeUj67scEJ9xy2J6YuiTlkRDgRY8Hv1a6tgVf/oS0HElla6gHnxIOkFbl/kKv+XBly2Y8iH4U0dXK9eJWWiuXlup2lfO6gIgviJVxjc8Y1Z+Gjt9x9YfxBC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331600; c=relaxed/simple;
	bh=qJ4YfuHAzk3f8J8PRLBdnsEu5c8/+vHM8mi4nty4J4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+2qWho3mC46VWb7nfHGqqUbCXI2WT8vhW5AZVVyJM3S4JIS9Z3i3PZ4AQmJ5UdAnO0KgTs6ebC+89SMn3IvNWMW/Hl3M2vVCga59lzDwVaYQnxy46P0ryyy6gk87q1ZN4cLWLgRdfCDCZ9DzwKv0X/vgvf5zsFjf+wm3oLk5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9A/BqRH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9A/BqRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B502C4CEE4;
	Sat,  7 Jun 2025 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331599;
	bh=qJ4YfuHAzk3f8J8PRLBdnsEu5c8/+vHM8mi4nty4J4A=;
	h=From:To:Cc:Subject:Date:From;
	b=O9A/BqRHEkFde+toPSxzkzZoYQPXif2/zQKYbuvY6Z1qUIUEEx/yXWJ7Po0p23j8+
	 CC7Ri8TGGsGvqml61+0+7sPWptlERC+VUTnkgSWyVjiT+fl+YrrT2Ki+ahoF57qFlb
	 ULTmuUfRZ494fBFx7KkPbvUtFGLj/MeTOdPr7ACVuSeNJO6if8fnhmBFkjLlrMR3BU
	 Z7PA2Op82T9YXnqKV6JrLblKT08acuCy1C8MLlmljGrYwhoK+CcBsrS75cd662OE89
	 TJD4YJEjxHEXpP6s5Zg1ynQXa4S4QSOah6hlAdFIZ+sAnzs32yKiTESDUZSccZmSTW
	 xiP5YIxPyY8VA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <david@lechnology.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert ti,da830-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:26:36 -0500
Message-ID: <20250607212638.744524-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI DA830 USB PHY binding to DT schema format. Add "clocks"
and "clock-names" which are already in use.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/phy-da8xx-usb.txt | 40 ---------------
 .../bindings/phy/ti,da830-usb-phy.yaml        | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 40 deletions(-)
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
index 000000000000..e18746f80982
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,da830-usb-phy.yaml
@@ -0,0 +1,49 @@
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
+  controllers on DA8xx SoCs. Consumers of this device should use index 0 for
+  the USB 2.0 phy device and index 1 for the USB 1.1 phy device.
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

