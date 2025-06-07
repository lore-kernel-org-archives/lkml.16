Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9621A434;
	Sat,  7 Jun 2025 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331583; cv=none; b=geo1emlKqLU7nnHdwgPXopBrkPQANGqb9gCy0g02zPLB9G5CzrbGr7cK1GX+ZBFOFK/YEWyurk1eHLbHFWM/LYk8NIpXemuSIiDZq3A2SIccr/I/ru8RPHlmWkBkj5AoosMLTzwRxeRPiGRRviMUUV9Cnj17a+Q1yE9Knf2ZTHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331583; c=relaxed/simple;
	bh=qPWaXK9VAayAy2Zn/upVRookXCud3+76+B7m5D2a/V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4RxIeni+rpm7b52eyv86PScwEORUZdsrM6/fUUYixEGBGoLJvuC30NqfywGsQZwcZjIQxVTzq4cHCdu8/0NdQeourVMO69bYM1zHeyqPUg5LgILxnYzqa0/MvPShKUsA7UUuDFGoyViGjHAtgwTz04RPUG47x5AJfVaBMyvP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6xeJSl0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6xeJSl0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD5BC4CEE4;
	Sat,  7 Jun 2025 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331583;
	bh=qPWaXK9VAayAy2Zn/upVRookXCud3+76+B7m5D2a/V4=;
	h=From:To:Cc:Subject:Date:From;
	b=N6xeJSl0Pt2c7+uplpIxh4Ygc8KkdWP2twNJ726W2rnRCpnPos0XGVRp+6mhJxmuF
	 OEPxu9br0i/VojMF436Xi0gtGS9TlaLqIgY4XzpwEvXTd6E9f3+js+3zBXq4MmZ+4S
	 8iTY8npvv12boqBW4A62PEdu8MnKWwGldov7FPnedVptPdPv1Sq/rvhPngtPAetaOt
	 XIfzn1BIksLxpwrn67NkrPDsLzflVDfgCCYCdsOUgOoXAj6BNq+z2S7J4httv1Y+7Z
	 ysUQq8M0gL3CNvPW+1/oG/TonSsObRtFxdd6VGK3xUVFqqBFql+5Si1ofQNl7/doYZ
	 lLJWVUnpGmZgA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: Convert motorola,mapphone-mdm6600 to DT schema
Date: Sat,  7 Jun 2025 16:26:20 -0500
Message-ID: <20250607212621.743859-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Motorola Mapphone MDM6600 USB PHY binding to DT schema
format. It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../phy/motorola,mapphone-mdm6600.yaml        | 81 +++++++++++++++++++
 .../bindings/phy/phy-mapphone-mdm6600.txt     | 29 -------
 2 files changed, 81 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt

diff --git a/Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml b/Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml
new file mode 100644
index 000000000000..cb6544b3478d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/motorola,mapphone-mdm6600.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/motorola,mapphone-mdm6600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola Mapphone MDM6600 USB PHY
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    items:
+      - const: motorola,mapphone-mdm6600
+
+  enable-gpios:
+    description: GPIO to enable the USB PHY
+    maxItems: 1
+
+  power-gpios:
+    description: GPIO to power on the device
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO to reset the device
+    maxItems: 1
+
+  motorola,mode-gpios:
+    description: Two GPIOs to configure MDM6600 USB start-up mode for normal mode versus USB flashing mode
+    items:
+      - description: normal mode select GPIO
+      - description: USB flashing mode select GPIO
+
+  motorola,cmd-gpios:
+    description: Three GPIOs to control the power state of the MDM6600
+    items:
+      - description: power state control GPIO 0
+      - description: power state control GPIO 1
+      - description: power state control GPIO 2
+
+  motorola,status-gpios:
+    description: Three GPIOs to read the power state of the MDM6600
+    items:
+      - description: power state read GPIO 0
+      - description: power state read GPIO 1
+      - description: power state read GPIO 2
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - enable-gpios
+  - power-gpios
+  - reset-gpios
+  - motorola,mode-gpios
+  - motorola,cmd-gpios
+  - motorola,status-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb-phy {
+        compatible = "motorola,mapphone-mdm6600";
+        enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+        power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+        motorola,mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,
+                              <&gpio5 21 GPIO_ACTIVE_HIGH>;
+        motorola,cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,
+                              <&gpio4 8 GPIO_ACTIVE_HIGH>,
+                              <&gpio5 14 GPIO_ACTIVE_HIGH>;
+        motorola,status-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>,
+                                <&gpio2 21 GPIO_ACTIVE_HIGH>,
+                                <&gpio2 23 GPIO_ACTIVE_HIGH>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt b/Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt
deleted file mode 100644
index 29427d4f047a..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Device tree binding documentation for Motorola Mapphone MDM6600 USB PHY
-
-Required properties:
-- compatible		Must be "motorola,mapphone-mdm6600"
-- enable-gpios		GPIO to enable the USB PHY
-- power-gpios		GPIO to power on the device
-- reset-gpios		GPIO to reset the device
-- motorola,mode-gpios	Two GPIOs to configure MDM6600 USB start-up mode for
-			normal mode versus USB flashing mode
-- motorola,cmd-gpios	Three GPIOs to control the power state of the MDM6600
-- motorola,status-gpios	Three GPIOs to read the power state of the MDM6600
-
-Example:
-
-usb-phy {
-	compatible = "motorola,mapphone-mdm6600";
-	enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
-	power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
-	reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
-	motorola,mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,
-			      <&gpio5 21 GPIO_ACTIVE_HIGH>;
-	motorola,cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,
-			     <&gpio4 8 GPIO_ACTIVE_HIGH>,
-			     <&gpio5 14 GPIO_ACTIVE_HIGH>;
-	motorola,status-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>,
-				<&gpio2 21 GPIO_ACTIVE_HIGH>,
-				<&gpio2 23 GPIO_ACTIVE_HIGH>;
-	#phy-cells = <0>;
-};
-- 
2.47.2

