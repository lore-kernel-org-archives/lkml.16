Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868EC1EB197;
	Wed, 30 Apr 2025 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008916; cv=none; b=f6cnTObLo0ceYuMWwD32fRwqrIADDylkx/IhDeSF6nqIGsqQIAWbntgOVsSnlulEBNiM5UV4n9lYxlCByPFppA9u5MRkALxRkdbw1e0eOvvP+lI9+zPybST+H8b+52VNaBzl/Z3osYaJpSks9tOpqNW2cGKbaGm1edPHVVP/lP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008916; c=relaxed/simple;
	bh=PFnhFB0RKPVsw2NGjdVYCGvJCShES85iNGeOvrhimPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYZiHfCP3PiB8LQulzYe4mULtB+we55iczw2YLzOfptQ8IzIG+9eien1uNnsq9Dne6EC1oEbugZZXGLHGFNbqLpwuMDW+p+aL9Gp7jnf2W26tCAkjx4rGAGIhRKumkt/WVqzhb+ZZmZFATUmJkczyQTPRkk22O0fFf8Hexm7RyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=B+249I5n; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="B+249I5n"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 575431FB3E;
	Wed, 30 Apr 2025 12:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008912;
	bh=utg45fWEPH9y6nYcY9VwBk3hgFFznK0+WTZ5lx0VptQ=; h=From:To:Subject;
	b=B+249I5nJhqRRsmMKiZ6m1nqv80B3yX6APUqgn/mbP6YQ6gYNtXo05sUGFFe+7yER
	 ixTOwhaZkrhLszE03OtTIpVkFEKhClKvHOiXi2Qzztn+fS8WZ275k7S7roK28V1Rru
	 OBecU5DTfejIH3WXr6RXL2Cbz+OePNB1Hx6l0h3LNxT1aHT0WB0ZbEkmUawpv0wuRx
	 paji2iqx/d+GrtdYXKz1hYp2tZY937cjL1XP7oIFM8KEeu9V1YEXCzMW2SWAU63olC
	 suWadg4TfSjaezklPZjJczZrx2q1FCdW09vhXbZbY+7xueIvn4Cfbx9B4Rt7u7My+K
	 RO8yeY8ZWN7Fw==
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
Subject: [PATCH v1 3/6] arm64: dts: ti: am62p-verdin: add dahlia
Date: Wed, 30 Apr 2025 12:28:12 +0200
Message-Id: <20250430102815.149162-4-francesco@dolcini.it>
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

Add support for Verdin AM62P mated with Verdin Dahlia carrier board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   2 +
 .../boot/dts/ti/k3-am62p-verdin-dahlia.dtsi   | 228 ++++++++++++++++++
 .../ti/k3-am62p5-verdin-nonwifi-dahlia.dts    |  22 ++
 .../dts/ti/k3-am62p5-verdin-wifi-dahlia.dts   |  22 ++
 4 files changed, 274 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 0902fcd5d731..436f71f22ade 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -35,7 +35,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 
 # Common overlays for SK-AM62* family of boards
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
new file mode 100644
index 000000000000..ee3feac6ea5d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * Common dtsi for Verdin AM62P SoM on Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	reg_1v8_sw: regulator-1v8-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "On-carrier +V1.8_SW";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "verdin-wm8904";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_1a>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
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
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s1_mclk>;
+		clocks = <&audio_refclk0>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_1v8_sw>;
+		CPVDD-supply = <&reg_1v8_sw>;
+		DBVDD-supply = <&reg_1v8_sw>;
+		DCVDD-supply = <&reg_1v8_sw>;
+		MICVDD-supply = <&reg_1v8_sw>;
+	};
+
+	/* Current measurement into module VCC */
+	hwmon@40 {
+		compatible = "ti,ina219";
+		reg = <0x40>;
+		shunt-resistor = <10000>;
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
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
+	status = "okay";
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
+/* Verdin I2S_1 */
+&mcasp0 {
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
+/* Verdin QSPI_1 */
+&ospi0 {
+	status = "okay";
+};
+
+/* We support turning off sleep moci on Dahlia */
+&reg_force_sleep_moci {
+	status = "disabled";
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
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts
new file mode 100644
index 000000000000..1790e572eaa0
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-nonwifi.dtsi"
+#include "k3-am62p-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P on Dahlia Board";
+	compatible = "toradex,verdin-am62p-nonwifi-dahlia",
+		     "toradex,verdin-am62p-nonwifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts
new file mode 100644
index 000000000000..12b57985f38e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-wifi.dtsi"
+#include "k3-am62p-verdin-dahlia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P WB on Dahlia Board";
+	compatible = "toradex,verdin-am62p-wifi-dahlia",
+		     "toradex,verdin-am62p-wifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
-- 
2.39.5

