Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB52475CF;
	Wed, 30 Apr 2025 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008918; cv=none; b=shRdRtew3Qo6H+pRrYbfg1uc6GsWbLDmMaZm7/Xv0+jr+FiLAFODjPFlOjpjk7DSAPIrXvmbPVlgU+mdCt38Z1z0E/oQ0/RRFbzeudgJCtYjYdvErs19eIEuCaMyhU/ptEURn8vGwAeX/JTSx6H/YEwFjzjiyZB8Jo/Q5P4nE4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008918; c=relaxed/simple;
	bh=C5rvVeKqeUkRLGbNHfCFJIpJ42dQ4YDHmj7yGBP5ZVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtCAhSrvyX9a9NVo+9oSwzQGgHbqxckaJIKINwvqTS91mtGh0ESswYw/NFlCfxj2+TvnUXtjtv7oKE7N3b+Oy6qVl81e/2DpsoQpkyRQYkJbSIQzh6qu7aJpSpgW/WRZcA51DVN2V1IJNzapP5OA0VGvaGTOddWrJtk4hS/+SXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=sbBVgzvE; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="sbBVgzvE"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CFCC41FB3F;
	Wed, 30 Apr 2025 12:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008913;
	bh=wRV+emgq8zbpmBJoh7YAMSDAG/BYbb2ZG/S+7QhvtW0=; h=From:To:Subject;
	b=sbBVgzvE4cqa4m+MnevY7G41J6bhQlQ21zI8jWnblc04DKPLPD7zvmeEXCTfrMbuP
	 W/oZ9aWyuWEhpbP8ZROeaaOcL1KA7GLpFZCiyEgnv0wsxx/RFmV3dRvHMPTtP4xBvM
	 E5139NotIw8HHUIsIDGGzSZqbFDgPcHLqisjeciH2Sn51o1+noEzPK0ms1nQYbJyRd
	 8Azd8EAo9gXziWYKJKq/bZBhtZwLaY0Voy5aysMyvE6MDz8CQ9T5qA3TWCS+UQ5Mmh
	 ar+Sj7kkH6BtaGUTCFXXgJZRISF/NB6SVSIgynRgH3BGWKhRy8wyKLqayx9VeHp58I
	 d1pdjmpw1yYuA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] arm64: dts: ti: am62p-verdin: add mallow
Date: Wed, 30 Apr 2025 12:28:13 +0200
Message-Id: <20250430102815.149162-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430102815.149162-1-francesco@dolcini.it>
References: <20250430102815.149162-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for Verdin AM62P mated with Verdin Mallow carrier board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   2 +
 .../boot/dts/ti/k3-am62p-verdin-mallow.dtsi   | 213 ++++++++++++++++++
 .../ti/k3-am62p5-verdin-nonwifi-mallow.dts    |  22 ++
 .../dts/ti/k3-am62p5-verdin-wifi-mallow.dts   |  22 ++
 4 files changed, 259 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 436f71f22ade..52e24a31793a 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -37,8 +37,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-mallow.dtb
 
 # Common overlays for SK-AM62* family of boards
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-ov5640.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
new file mode 100644
index 000000000000..37c0b9da82da
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * Common dtsi for Verdin AM62P SoM on Mallow carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_clk_gpio>,
+			    <&pinctrl_qspi1_cs_gpio>,
+			    <&pinctrl_qspi1_io0_gpio>,
+			    <&pinctrl_qspi1_io1_gpio>;
+
+		/* SODIMM 52 - USER_LED_1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 54 - USER_LED_1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 56 - USER_LED_2_RED */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 58 - USER_LED_2_GREEN */
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 4 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* Verdin ETHs */
+&cpsw3g {
+	status = "okay";
+};
+
+/* MDIO, shared by Verdin ETH_1 (On-module PHY) and Verdin ETH_2_RGMII */
+&cpsw3g_mdio {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&cpsw_port1 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&epwm0 {
+	status = "okay";
+};
+
+/* Verdin PWM_1, PWM_2 */
+&epwm2 {
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_1_reset>,
+		    <&pinctrl_gpio_5>,
+		    <&pinctrl_gpio_6>,
+		    <&pinctrl_gpio_7>,
+		    <&pinctrl_gpio_8>;
+};
+
+/* Verdin I2C_1 */
+&main_i2c0 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c1 {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&main_i2c3 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&main_mcan0 {
+	status = "okay";
+};
+
+/* Verdin SPI_1 */
+&main_spi1 {
+	pinctrl-0 = <&pinctrl_main_spi1>,
+		    <&pinctrl_main_spi1_cs0>,
+		    <&pinctrl_qspi1_cs2_gpio>;
+	cs-gpios = <0>, <&main_gpio0 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_dqs_gpio>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <18500000>;
+	};
+};
+
+/* Verdin UART_3, used as the Linux console */
+&main_uart0 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&main_uart1 {
+	status = "okay";
+};
+
+&mcu_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>;
+};
+
+/* Verdin I2C_3_HDMI */
+&mcu_i2c0 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&mcu_mcan0 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&mcu_uart0 {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&sdhci1 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usbss0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usbss1 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};
+
+/* Verdin PCIE_1_RESET# */
+&verdin_pcie_1_reset_hog {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&wkup_uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts
new file mode 100644
index 000000000000..52823874eadc
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-nonwifi.dtsi"
+#include "k3-am62p-verdin-mallow.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P on Mallow Board";
+	compatible = "toradex,verdin-am62p-nonwifi-mallow",
+		     "toradex,verdin-am62p-nonwifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts
new file mode 100644
index 000000000000..e35851451cd4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/mallow-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-wifi.dtsi"
+#include "k3-am62p-verdin-mallow.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P WB on Mallow Board";
+	compatible = "toradex,verdin-am62p-wifi-mallow",
+		     "toradex,verdin-am62p-wifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
-- 
2.39.5

