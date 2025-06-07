Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1074219A95;
	Sat,  7 Jun 2025 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331530; cv=none; b=uXUCLD9+rvwXdCt9Z4MQYUpieI4zro5cDOr+iiGViAH4k7I4nBBmp3mtEsSxVX3CDuhhiYf2NL5HKt6XSB21CcPq3+pNruvQSOLe2/x1gYoHOPzE2RUuoR6UD23U7V3Va6AX8xae3AJxTkhQYqgEeats58WneYVo0o+xAXf/pQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331530; c=relaxed/simple;
	bh=hQVYCNQ5OrWUucTQkw09cPQ8jCF3PdFQNCpwjyOGrNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArGJPCeSleOpEksSHdV24O95VNMLAd1DbC+qXo0E52/Ze7CXitOo1LVh6bXKwmLsLy7cgiUWgwLpl8mKbgAQ1za1p9ziUUhowIS3Ri+R+nR0H6ICKI6BPgUgb+IyZujDeHOI4dQURdWNxzd5MNGZrJ1UeXT05NZQymGONrCFJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iE+1idd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iE+1idd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282CCC4CEE4;
	Sat,  7 Jun 2025 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331530;
	bh=hQVYCNQ5OrWUucTQkw09cPQ8jCF3PdFQNCpwjyOGrNs=;
	h=From:To:Cc:Subject:Date:From;
	b=iE+1idd8X5+sCs+qGdLsfhZYXYNxXzWOOz/H2p+VUSBbQfPfOTXFTrjgOEgDqA5xe
	 qy8cI+wbsrvM9lkl8WCjuriEi5cE3FQEb+weUyYO3hhG+uXIshwVeQiLqaY2rqlfK9
	 +M6w78KE/PgVWq3R4B6/94MyuK6kqDTAeTPrJrIQvxrcerVvbhKh99X4EIOAk8Ithq
	 FD5Z1xUq8zWOfMFSJwLUTJCloU6+tO1RFxIZDzeTFyj5w7DP0UXgpnzE736MhQFUx3
	 omoDFQ5cNgwOynL7tmggGW1YwS0m9o//Gm9KpjFhIyzSMkSKI07q532gdJ+O6SAQ19
	 UhxPWtOIfyx2Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengcheng Li <lpc.li@hisilicon.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert hisilicon,inno-usb2-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:26 -0500
Message-ID: <20250607212527.741915-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the HiSilicon INNO USB2 PHY binding to DT schema format. It's a
straight forward conversion.

Add the undocumented "hisilicon,hi3798mv100-usb2-phy" compatible.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/hisilicon,inno-usb2-phy.yaml | 93 +++++++++++++++++++
 .../bindings/phy/phy-hisi-inno-usb2.txt       | 71 --------------
 2 files changed, 93 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/hisilicon,inno-usb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt

diff --git a/Documentation/devicetree/bindings/phy/hisilicon,inno-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/hisilicon,inno-usb2-phy.yaml
new file mode 100644
index 000000000000..51ea0e54ce35
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/hisilicon,inno-usb2-phy.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/hisilicon,inno-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon INNO USB2 PHY
+
+maintainers:
+  - Pengcheng Li <lpc.li@hisilicon.com>
+
+description:
+  The INNO USB2 PHY device should be a child node of peripheral controller that
+  contains the PHY configuration register, and each device supports up to 2 PHY
+  ports which are represented as child nodes of INNO USB2 PHY device.
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hi3798cv200-usb2-phy
+      - hisilicon,hi3798mv100-usb2-phy
+      - hisilicon,inno-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^phy@[0-1]$":
+    description: PHY port subnode
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+
+      "#phy-cells":
+        const: 0
+
+      resets:
+        maxItems: 1
+
+    required:
+      - reg
+      - "#phy-cells"
+      - resets
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/histb-clock.h>
+
+    usb2-phy@120 {
+        compatible = "hisilicon,hi3798cv200-usb2-phy";
+        reg = <0x120 0x4>;
+        clocks = <&crg HISTB_USB2_PHY1_REF_CLK>;
+        resets = <&crg 0xbc 4>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phy@0 {
+            reg = <0>;
+            #phy-cells = <0>;
+            resets = <&crg 0xbc 8>;
+        };
+
+        phy@1 {
+            reg = <1>;
+            #phy-cells = <0>;
+            resets = <&crg 0xbc 9>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
deleted file mode 100644
index 104953e849e7..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-Device tree bindings for HiSilicon INNO USB2 PHY
-
-Required properties:
-- compatible: Should be one of the following strings:
-	"hisilicon,inno-usb2-phy",
-	"hisilicon,hi3798cv200-usb2-phy".
-- reg: Should be the address space for PHY configuration register in peripheral
-  controller, e.g. PERI_USB0 for USB 2.0 PHY01 on Hi3798CV200 SoC.
-- clocks: The phandle and clock specifier pair for INNO USB2 PHY device
-  reference clock.
-- resets: The phandle and reset specifier pair for INNO USB2 PHY device reset
-  signal.
-- #address-cells: Must be 1.
-- #size-cells: Must be 0.
-
-The INNO USB2 PHY device should be a child node of peripheral controller that
-contains the PHY configuration register, and each device supports up to 2 PHY
-ports which are represented as child nodes of INNO USB2 PHY device.
-
-Required properties for PHY port node:
-- reg: The PHY port instance number.
-- #phy-cells: Defined by generic PHY bindings.  Must be 0.
-- resets: The phandle and reset specifier pair for PHY port reset signal.
-
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Example:
-
-perictrl: peripheral-controller@8a20000 {
-	compatible = "hisilicon,hi3798cv200-perictrl", "simple-mfd";
-	reg = <0x8a20000 0x1000>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0x0 0x8a20000 0x1000>;
-
-	usb2_phy1: usb2-phy@120 {
-		compatible = "hisilicon,hi3798cv200-usb2-phy";
-		reg = <0x120 0x4>;
-		clocks = <&crg HISTB_USB2_PHY1_REF_CLK>;
-		resets = <&crg 0xbc 4>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usb2_phy1_port0: phy@0 {
-			reg = <0>;
-			#phy-cells = <0>;
-			resets = <&crg 0xbc 8>;
-		};
-
-		usb2_phy1_port1: phy@1 {
-			reg = <1>;
-			#phy-cells = <0>;
-			resets = <&crg 0xbc 9>;
-		};
-	};
-
-	usb2_phy2: usb2-phy@124 {
-		compatible = "hisilicon,hi3798cv200-usb2-phy";
-		reg = <0x124 0x4>;
-		clocks = <&crg HISTB_USB2_PHY2_REF_CLK>;
-		resets = <&crg 0xbc 6>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usb2_phy2_port0: phy@0 {
-			reg = <0>;
-			#phy-cells = <0>;
-			resets = <&crg 0xbc 10>;
-		};
-	};
-};
-- 
2.47.2

