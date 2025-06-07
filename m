Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72AC21A434;
	Sat,  7 Jun 2025 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331579; cv=none; b=vA5xkk3N9QnD2DhoeURaMh7qiEei5LfyKWKFRxGF2vFRNmm2G7nXUjK7A5WHDuCllD8oczN+1PAJT7zLQR7kqLBZVBVUrcu23VvUrRCM7zgwFhw0pnXOzudH7riPtBQSHuuz1dhPi0BJKkO+WLBbfHJ48oHkU38Q+jfLAMJz3lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331579; c=relaxed/simple;
	bh=riGBJKNEXXOJxez01Kr2XlCx/B+HZH1yrpRkVzIDIPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+VPidPQ9l/SonqF28TxVEAXzX018WL8yPdpsGthKm9ztNLQQVPkR/6+zr2usw4URV6K1K+O0hX4tKnzhQ5OqSX3rEw95tFHd/mi/z1QNEg7+6wzvbs4Bxpn/4OfTMQvDmTaV5YACprjclZPihlBggccF5A4zfVSK8bQWdKBiYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLaarE1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLaarE1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96803C4CEE4;
	Sat,  7 Jun 2025 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331579;
	bh=riGBJKNEXXOJxez01Kr2XlCx/B+HZH1yrpRkVzIDIPY=;
	h=From:To:Cc:Subject:Date:From;
	b=rLaarE1CzBtBaHSt1HQWqAAvk7eelpgWFRpVqU4VhMR8GsBkpS2J3qLhNF0OOxlpM
	 Mgevp5wjtWBWM6AZyyG9Gwm+757B3XJ6USigOw1FrL6Atu8NfNLYPkDdvxX40hrMXn
	 cauPKArk9FuUHwZQq8Oke6CtoKBa1px/uETYCeZHh2jI+uUDqrfABx+h6Ev8EqmA0f
	 5yqaz1MTcv1OLilgl8L+hzSEomrUHDVDT95D/NqUTmw6nSd1WJPgxedJr3Z8Z7RTl1
	 fK/DzN9xewWmq0AnvX8k3JliaAwXbZMcElga4L7lxuLMEtJJcseMPwwr9k7fc4bW7A
	 D/qtbG96bUI2g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH] dt-bindings: phy: Convert motorola,cpcap-usb-phy to DT schema
Date: Sat,  7 Jun 2025 16:26:15 -0500
Message-ID: <20250607212616.743674-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Motorola CPCAP PMIC USB PHY binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/motorola-cpcap.txt           |   2 +-
 .../bindings/phy/motorola,cpcap-usb-phy.yaml  | 107 ++++++++++++++++++
 .../devicetree/bindings/phy/phy-cpcap-usb.txt |  40 -------
 3 files changed, 108 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt

diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
index f00827c9b67f..18c3fc26ca93 100644
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
@@ -19,7 +19,7 @@ which are described in the following files:
 - Documentation/devicetree/bindings/power/supply/cpcap-battery.yaml
 - Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
 - Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
-- Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt
+- Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
 - Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 - Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 - Documentation/devicetree/bindings/leds/leds-cpcap.txt
diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
new file mode 100644
index 000000000000..0febd04a61f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/motorola,cpcap-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC USB PHY
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-usb-phy
+      - motorola,mapphone-cpcap-usb-phy
+
+  '#phy-cells':
+    const: 0
+
+  interrupts:
+    description: CPCAP PMIC interrupts used by the USB PHY
+    items:
+      - description: id_ground interrupt
+      - description: id_float interrupt
+      - description: se0conn interrupt
+      - description: vbusvld interrupt
+      - description: sessvld interrupt
+      - description: sessend interrupt
+      - description: se1 interrupt
+      - description: dm interrupt
+      - description: dp interrupt
+
+  interrupt-names:
+    description: Interrupt names
+    items:
+      - const: id_ground
+      - const: id_float
+      - const: se0conn
+      - const: vbusvld
+      - const: sessvld
+      - const: sessend
+      - const: se1
+      - const: dm
+      - const: dp
+
+  io-channels:
+    description: IIO ADC channels used by the USB PHY
+    items:
+      - description: vbus channel
+      - description: id channel
+
+  io-channel-names:
+    items:
+      - const: vbus
+      - const: id
+
+  vusb-supply: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: ulpi
+      - const: utmi
+      - const: uart
+
+  mode-gpios:
+    description: Optional GPIOs for configuring alternate modes
+    items:
+      - description: "mode selection GPIO #0"
+      - description: "mode selection GPIO #1"
+
+required:
+  - compatible
+  - '#phy-cells'
+  - interrupts-extended
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+  - vusb-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    phy {
+        compatible = "motorola,mapphone-cpcap-usb-phy";
+        #phy-cells = <0>;
+        interrupts-extended = <
+            &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
+            &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
+            &cpcap 48 1
+        >;
+        interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
+                          "sessvld", "sessend", "se1", "dm", "dp";
+        io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
+        io-channel-names = "vbus", "id";
+        vusb-supply = <&vusb>;
+        pinctrl-0 = <&usb_gpio_mux_sel1 &usb_gpio_mux_sel2>;
+        pinctrl-1 = <&usb_ulpi_pins>;
+        pinctrl-2 = <&usb_utmi_pins>;
+        pinctrl-3 = <&uart3_pins>;
+        pinctrl-names = "default", "ulpi", "utmi", "uart";
+        mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>, <&gpio1 0 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt b/Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt
deleted file mode 100644
index 2eb9b2b69037..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Motorola CPCAP PMIC USB PHY binding
-
-Required properties:
-compatible: Shall be either "motorola,cpcap-usb-phy" or
-	    "motorola,mapphone-cpcap-usb-phy"
-#phy-cells: Shall be 0
-interrupts: CPCAP PMIC interrupts used by the USB PHY
-interrupt-names: Interrupt names
-io-channels: IIO ADC channels used by the USB PHY
-io-channel-names: IIO ADC channel names
-vusb-supply: Regulator for the PHY
-
-Optional properties:
-pinctrl: Optional alternate pin modes for the PHY
-pinctrl-names: Names for optional pin modes
-mode-gpios: Optional GPIOs for configuring alternate modes
-
-Example:
-cpcap_usb2_phy: phy {
-	compatible = "motorola,mapphone-cpcap-usb-phy";
-	pinctrl-0 = <&usb_gpio_mux_sel1 &usb_gpio_mux_sel2>;
-	pinctrl-1 = <&usb_ulpi_pins>;
-	pinctrl-2 = <&usb_utmi_pins>;
-	pinctrl-3 = <&uart3_pins>;
-	pinctrl-names = "default", "ulpi", "utmi", "uart";
-	#phy-cells = <0>;
-	interrupts-extended = <
-		&cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
-		&cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-		&cpcap 48 1
-	>;
-	interrupt-names =
-		"id_ground", "id_float", "se0conn", "vbusvld",
-		"sessvld", "sessend", "se1", "dm", "dp";
-	mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH
-		      &gpio1 0 GPIO_ACTIVE_HIGH>;
-	io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-	io-channel-names = "vbus", "id";
-	vusb-supply = <&vusb>;
-};
-- 
2.47.2

