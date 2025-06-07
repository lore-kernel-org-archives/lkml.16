Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7922153CE;
	Sat,  7 Jun 2025 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331507; cv=none; b=Y8oOZFm9dGSjEF/1pWCHcBQE8cmkjZTH7MNewGO8p67LqbRCm+yguKcPLo6q6rqD6S7xSAz7r2JM3N9gnMkSl8I2C8tF2fu8ATmJ2gJVSHqjGI1/YB6q07ToMLtIEWK1TuIbQuiyx5vRxlOQP9GTp3Yo6rBgvoX9FAPeNMtzEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331507; c=relaxed/simple;
	bh=r8l2B+sq5zJq9kjyJ/SwpIdD6MXgJ5moKqvpI2Iv3ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BkxNmQ9xdaTEw2O4MjM+pHRZHvSwXNx3M/wZDq/sVjji5bR3IE7Zl2GIne9nHQZjU/sIQgbxZ6yojKZ9xhUrb6a618bwxlvmQpRHPxE07KGp6HzO1kde/5C1O6Qb8gfzE1vTrTDPZeqczdh+8078C54rs8yMO6dnlRGFUUtduHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OimRilvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OimRilvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF12C4CEF2;
	Sat,  7 Jun 2025 21:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331507;
	bh=r8l2B+sq5zJq9kjyJ/SwpIdD6MXgJ5moKqvpI2Iv3ys=;
	h=From:To:Cc:Subject:Date:From;
	b=OimRilvvQlHBauX0GxAHKRZFr+/AM3M8GlVRXmuLiqnMlvAXrt2WMN5FvJtNkUo5y
	 48E2Oa6xgfiLIR2BxCaWeM7J4a4HE4rUuzU8ngn9CTSZzumI8vIG3xCEq+qq+pmaH5
	 DJ66W/ygxNAxcCi4V6IbcpCgGY5XbTHFit685UjREFq4Fx63a1sVP4oMN/TkzqXSP8
	 lDdzBAlP7Gi4BvCUAUgP3fwuk69EaNnjvwXOttk0DuD35pi179K1oYTBFFiRtLDfF4
	 A3qVvGebkHsTeiy3F9Vftn7GpLZO/m4/nmKh0x+nyBEKKfDb3Xah1aucuWJIj1wWtj
	 ppJTMipWXNbWg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert brcm,ns2-drd-phy to DT schema
Date: Sat,  7 Jun 2025 16:24:48 -0500
Message-ID: <20250607212456.740697-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Broadcom NS2 USB2 PHY binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/brcm,ns2-drd-phy.txt         | 30 ---------
 .../bindings/phy/brcm,ns2-drd-phy.yaml        | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
deleted file mode 100644
index 04f063aa7883..000000000000
--- a/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-BROADCOM NORTHSTAR2 USB2 (DUAL ROLE DEVICE) PHY
-
-Required properties:
- - compatible: brcm,ns2-drd-phy
- - reg: offset and length of the NS2 PHY related registers.
- - reg-names
-   The below registers must be provided.
-   icfg - for DRD ICFG configurations
-   rst-ctrl - for DRD IDM reset
-   crmu-ctrl - for CRMU core vdd, PHY and PHY PLL reset
-   usb2-strap - for port over current polarity reversal
- - #phy-cells: Must be 0. No args required.
- - vbus-gpios: vbus gpio binding
- - id-gpios: id gpio binding
-
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Example:
-	usbdrd_phy: phy@66000960 {
-			#phy-cells = <0>;
-			compatible = "brcm,ns2-drd-phy";
-			reg = <0x66000960 0x24>,
-			      <0x67012800 0x4>,
-			      <0x6501d148 0x4>,
-			      <0x664d0700 0x4>;
-			reg-names = "icfg", "rst-ctrl",
-				    "crmu-ctrl", "usb2-strap";
-			id-gpios = <&gpio_g 30 0>;
-			vbus-gpios = <&gpio_g 31 0>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml
new file mode 100644
index 000000000000..1fab97de5c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/brcm,ns2-drd-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar2 USB2 Dual Role Device PHY
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Hauke Mehrtens <hauke@hauke-m.de>
+  - Rafał Miłecki <zajec5@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,ns2-drd-phy
+
+  reg:
+    items:
+      - description: DRD ICFG configurations
+      - description: DRD IDM reset
+      - description: CRMU core vdd, PHY and PHY PLL reset
+      - description: Port over current polarity reversal
+
+  reg-names:
+    items:
+      - const: icfg
+      - const: rst-ctrl
+      - const: crmu-ctrl
+      - const: usb2-strap
+
+  '#phy-cells':
+    const: 0
+
+  id-gpios:
+    maxItems: 1
+    description: ID GPIO line
+
+  vbus-gpios:
+    maxItems: 1
+    description: VBUS GPIO line
+
+required:
+  - '#phy-cells'
+  - compatible
+  - reg
+  - reg-names
+  - id-gpios
+  - vbus-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@66000960 {
+        #phy-cells = <0>;
+        compatible = "brcm,ns2-drd-phy";
+        reg = <0x66000960 0x24>, <0x67012800 0x4>, <0x6501d148 0x4>, <0x664d0700 0x4>;
+        reg-names = "icfg", "rst-ctrl", "crmu-ctrl", "usb2-strap";
+        id-gpios = <&gpio_g 30 0>;
+        vbus-gpios = <&gpio_g 31 0>;
+    };
-- 
2.47.2

