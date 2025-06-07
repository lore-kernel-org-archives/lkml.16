Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A921A94F;
	Sat,  7 Jun 2025 21:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331588; cv=none; b=HvwSqN74NqVyutHCV4wB6x06xmMsOo/t7Jp57NbhVY6yfK7wxIX6dVNGnyLAPs6+QJ1CdkfSQYbGvG6wSXFlpmVcAdIV+j6JYtn1I4R5LSvr6PVPdTHSp/D0Ixd0byWmjgj5z2OCyg6LpUtNn4Yh5M+mWSmiXRg5TE8TPggsloQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331588; c=relaxed/simple;
	bh=+ZPrWtmPPFCsURJUnqt37WxfXbcYTz4vDsTXFOIJitI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUwip9SsyfEYsC2bPjAxIeAYcEX5dis5G+gC+udHM0VAbXIg5kIuUb7inC16ccY8NIKSkDXdG/MXH6yq4DB12xqJ2Ynxoh6NdvY1ro8rPQJjItX6mY8FOKjwCOzInT4WIbMD9rqDqOCkpM6BUjuAMeYBkVl7Nato3qHWVnYWmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LITufkiN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LITufkiN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A530CC4CEE4;
	Sat,  7 Jun 2025 21:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331587;
	bh=+ZPrWtmPPFCsURJUnqt37WxfXbcYTz4vDsTXFOIJitI=;
	h=From:To:Cc:Subject:Date:From;
	b=LITufkiNBH4UVApXJPFG5pUAh5WYnAs5CTASMeKvkh4Kf8W3VwRzalToQ9rJPeQs3
	 7AXWdv/mmaZBP5arKy39A/XjyQNhUAq8ccP50bZ9BuXh0NfA7NYcbMmGZ6nIT2eBj2
	 nyQoykDdqCoGfWxVQWGxsFHI4QftoohvXwnfahobeE4rAogOAR93Y+9QCacZtxtLpj
	 F0G8+e0SS22AiFZHFMVQmSYO2+DtPQHQEgoIbT24XcESYHD7rJZbbrtGBOQ0eadhHO
	 AbWOdASwebRFNJsIRH3i+Q24eb6aWu4BD/S+QOY3BgfRJE58r4gswB8OZaF8BoCVeC
	 MMfG9ONKvGXOw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <albeu@free.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert qca,ar7100-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:26:23 -0500
Message-ID: <20250607212625.744008-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm-Atheros AR7100 USB PHY binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/phy-ath79-usb.txt | 18 -------
 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 49 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 50 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
 create mode 100644 Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
deleted file mode 100644
index c3a29c5feea3..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Atheros AR71XX/9XXX USB PHY
-
-Required properties:
-- compatible: "qca,ar7100-usb-phy"
-- #phys-cells: should be 0
-- reset-names: "phy"[, "suspend-override"]
-- resets: references to the reset controllers
-
-Example:
-
-	usb-phy {
-		compatible = "qca,ar7100-usb-phy";
-
-		reset-names = "phy", "suspend-override";
-		resets = <&rst 4>, <&rst 3>;
-
-		#phy-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
new file mode 100644
index 000000000000..029665530829
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qca,ar7100-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atheros AR71XX/9XXX USB PHY
+
+maintainers:
+  - Alban Bedel <albeu@free.fr>
+
+properties:
+  compatible:
+    items:
+      - const: qca,ar7100-usb-phy
+
+  reset-names:
+    description: Names of reset lines in order.
+    minItems: 1
+    items:
+      - const: phy
+      - const: suspend-override
+
+  resets:
+    description: References to the reset controllers.
+    minItems: 1
+    items:
+      - description: Reset controller for phy
+      - description: Reset controller for suspend-override
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reset-names
+  - resets
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy {
+        compatible = "qca,ar7100-usb-phy";
+        reset-names = "phy", "suspend-override";
+        resets = <&rst 4>, <&rst 3>;
+        #phy-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8fc2f21de224..c9457982b406 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3823,7 +3823,7 @@ M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
 W:	https://github.com/AlbanBedel/linux
 T:	git git://github.com/AlbanBedel/linux
-F:	Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
+F:	Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
 F:	drivers/phy/qualcomm/phy-ath79-usb.c
 
 ATHEROS ATH GENERIC UTILITIES
-- 
2.47.2

