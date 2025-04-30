Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C6248F4E;
	Wed, 30 Apr 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008918; cv=none; b=DVz2O6CDIsXFiNZx+RprVidDWqCujHFOtW7FQRjAXoAGuav+X4JpLe6BVk6qK1WH4c5T71XFOQ9MbhLvdx0o4RNYBeO6ANKVYdzgFLc1ZVy/Y1qmdBD/nJYZfVrUkcZD2rKNBmRnIn4IKmvCqLybjRBD7HWS+Q/gRz3LXVXeU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008918; c=relaxed/simple;
	bh=R+/ibCOxuLphne8QZARkgWBaaAzunN01rVZ69a4RmnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tzo3dwI9I3vdRtSqSTEPjEtNROKac9N6U+1rQs3BCS9ld9PU4cPhUHUMTsGi50/iggnC/H62NL7ime17cUuhkRZrpArqQFQzzRPZRfgC4jQAD114q6IwpekiDsBXCMccVRR9tirHyIbe1qP2nFp08qX7aDtPG3q8K/C/LRSVHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QnyzpV8e; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QnyzpV8e"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D2A171FB71;
	Wed, 30 Apr 2025 12:28:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008914;
	bh=Rdv0LBU02EoftOrBe7uf7elErw6t1f1HpcgfJmCHKm0=; h=From:To:Subject;
	b=QnyzpV8e/QRVQok1rZnNH2OarGlOEpiDwlyXvFcDYu3ibhqf8Bw2ajOaqxZZVwmEg
	 4GiYrC46NeSlcAp/a5yO1XWt6NEryrUJHBW05m08kCtxVSDQE8mJ0kgvV0WiS+OkrB
	 HrQEDILt/y7PgaRbvbrMRzclnuuAaoMc5HF/dM076625Hz5hgWc3h+BNZ+OOGiudul
	 uK/dGpxOqF+p046KlYoqzk+hwv2uXVJ2KbW2WyxWyUvbQlR2umZ5nLqWNibHbeEx9h
	 IubSTXkbpm5vRwLZhrPFGm1BVZ94v9hlyDhB3+IZ8g44Q4E9POKgnLlDz+V/m3WHCl
	 DnByLCcs2HksQ==
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
Subject: [PATCH v1 6/6] arm64: dts: ti: am62p-verdin: add ivy
Date: Wed, 30 Apr 2025 12:28:15 +0200
Message-Id: <20250430102815.149162-7-francesco@dolcini.it>
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

Add support for Verdin AM62P mated with Verdin Ivy carrier board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   2 +
 .../boot/dts/ti/k3-am62p-verdin-ivy.dtsi      | 629 ++++++++++++++++++
 .../dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts   |  22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts |  22 +
 4 files changed, 675 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index d719d5f57877..3c3aa09a94b6 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -37,10 +37,12 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-yavia.dtb
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
new file mode 100644
index 000000000000..317c8818f9ee
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * Common dtsi for Verdin AM62P SoM on Ivy carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/ivy-carrier-board
+ */
+
+#include <dt-bindings/mux/mux.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	/* AIN1 Voltage w/o AIN1_MODE gpio control */
+	ain1_voltage_unmanaged: voltage-divider-ain1 {
+		compatible = "voltage-divider";
+		#io-channel-cells = <1>;
+		io-channels = <&ivy_adc1 0>;
+		full-ohms = <19>;
+		output-ohms = <1>;
+	};
+
+	/* AIN1 Current w/o AIN1_MODE gpio control */
+	ain1_current_unmanaged: current-sense-shunt-ain1 {
+		compatible = "current-sense-shunt";
+		#io-channel-cells = <0>;
+		io-channels = <&ivy_adc1 1>;
+		shunt-resistor-micro-ohms = <100000000>;
+	};
+
+	/* AIN1_MODE - SODIMM 216 */
+	ain1_mode_mux_ctrl: mux-controller-0 {
+		compatible = "gpio-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_5>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&main_gpio0 49 GPIO_ACTIVE_HIGH>;
+	};
+
+	ain1-voltage {
+		compatible = "io-channel-mux";
+		channels = "ain1_voltage", "";
+		io-channels = <&ain1_voltage_unmanaged 0>;
+		io-channel-names = "parent";
+		mux-controls = <&ain1_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	ain1-current {
+		compatible = "io-channel-mux";
+		channels = "", "ain1_current";
+		io-channels = <&ain1_current_unmanaged>;
+		io-channel-names = "parent";
+		mux-controls = <&ain1_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	/* AIN2 Voltage w/o AIN2_MODE gpio control */
+	ain2_voltage_unmanaged: voltage-divider-ain2 {
+		compatible = "voltage-divider";
+		#io-channel-cells = <1>;
+		io-channels = <&ivy_adc2 0>;
+		full-ohms = <19>;
+		output-ohms = <1>;
+	};
+
+	/* AIN2 Current w/o AIN2_MODE gpio control */
+	ain2_current_unmanaged: current-sense-shunt-ain2 {
+		compatible = "current-sense-shunt";
+		#io-channel-cells = <0>;
+		io-channels = <&ivy_adc2 1>;
+		shunt-resistor-micro-ohms = <100000000>;
+	};
+
+	/* AIN2_MODE - SODIMM 218 */
+	ain2_mode_mux_ctrl: mux-controller-1 {
+		compatible = "gpio-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_6>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&main_gpio0 50 GPIO_ACTIVE_HIGH>;
+	};
+
+	ain2-voltage {
+		compatible = "io-channel-mux";
+		channels = "ain2_voltage", "";
+		io-channels = <&ain2_voltage_unmanaged 0>;
+		io-channel-names = "parent";
+		mux-controls = <&ain2_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	ain2-current {
+		compatible = "io-channel-mux";
+		channels = "", "ain2_current";
+		io-channels = <&ain2_current_unmanaged>;
+		io-channel-names = "parent";
+		mux-controls = <&ain2_mode_mux_ctrl>;
+		settle-time-us = <1000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ivy_leds>;
+
+		/* D7 Blue - SODIMM 30 - LEDs.GPIO1 */
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D7 Green - SODIMM 32 - LEDs.GPIO2 */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio1 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D7 Red - SODIMM 34 - LEDs.GPIO3 */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio1 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D8 Blue - SODIMM 36 - LEDs.GPIO4 */
+		led-3 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&main_gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D8 Green - SODIMM 54 - LEDs.GPIO5 */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D8 Red - SODIMM 44 - LEDs.GPIO6 */
+		led-5 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 37 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D9 Blue - SODIMM 46 - LEDs.GPIO7 */
+		led-6 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* D9 Red - SODIMM 48 - LEDs.GPIO8 */
+		led-7 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio0 33 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	reg_3v2_ain1: regulator-3v2-ain1 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3200000>;
+		regulator-min-microvolt = <3200000>;
+		regulator-name = "+3V2_AIN1";
+	};
+
+	reg_3v2_ain2: regulator-3v2-ain2 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3200000>;
+		regulator-min-microvolt = <3200000>;
+		regulator-name = "+3V2_AIN2";
+	};
+
+	/* Ivy Power Supply Input Voltage */
+	ivy-input-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_1 */
+		io-channels = <&som_adc 7>;
+		full-ohms = <204700>; /* 200K + 4.7K */
+		output-ohms = <4700>;
+	};
+
+	ivy-5v-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_2 */
+		io-channels = <&som_adc 6>;
+		full-ohms = <39000>; /* 27K + 12K */
+		output-ohms = <12000>;
+	};
+
+	ivy-3v3-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_3 */
+		io-channels = <&som_adc 5>;
+		full-ohms = <54000>; /* 27K + 27K */
+		output-ohms = <27000>;
+	};
+
+	ivy-1v8-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_4 */
+		io-channels = <&som_adc 4>;
+		full-ohms = <39000>; /* 12K + 27K */
+		output-ohms = <27000>;
+	};
+};
+
+&main_pmx0 {
+	pinctrl_ivy_leds: ivy-leds-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x019c, PIN_INPUT, 7) /* (E24)  MCASP0_AXR1.GPIO1_9    */ /* SODIMM 36 */
+			AM62PX_IOPAD(0x01a0, PIN_INPUT, 7) /* (F23)  MCASP0_AXR0.GPIO1_10   */ /* SODIMM 34 */
+			AM62PX_IOPAD(0x01a4, PIN_INPUT, 7) /* (F24)  MCASP0_ACLKX.GPIO1_11  */ /* SODIMM 30 */
+			AM62PX_IOPAD(0x01a8, PIN_INPUT, 7) /* (F25)  MCASP0_AFSX.GPIO1_12   */ /* SODIMM 32 */
+			AM62PX_IOPAD(0x0088, PIN_INPUT, 7) /* (R24)  GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+			AM62PX_IOPAD(0x0098, PIN_INPUT, 7) /* (AA24) GPMC0_WAIT0.GPIO0_37   */ /* SODIMM 44 */
+			AM62PX_IOPAD(0x008c, PIN_INPUT, 7) /* (T25)  GPMC0_WEn.GPIO0_34     */ /* SODIMM 46 */
+			AM62PX_IOPAD(0x002c, PIN_INPUT, 7) /* (M25)  OSPI0_CSn0.GPIO0_11    */ /* SODIMM 54 */
+		>;
+	};
+};
+
+/* Verdin ETHs */
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>, <&pinctrl_rgmii2>;
+	status = "okay";
+};
+
+/* MDIO, shared by Verdin ETH_1 (On-module PHY) and Verdin ETH_2_RGMII */
+&cpsw3g_mdio {
+	status = "okay";
+
+	carrier_eth_phy: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <42 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&cpsw_port1 {
+	status = "okay";
+};
+
+/* Verdin ETH_2_RGMII */
+&cpsw_port2 {
+	phy-handle = <&carrier_eth_phy>;
+	phy-mode = "rgmii-rxid";
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_1_reset>,
+		    <&pinctrl_qspi1_cs2_gpio>,
+		    <&pinctrl_qspi1_dqs_gpio>,
+		    <&pinctrl_qspi1_io0_gpio>,
+		    <&pinctrl_qspi1_io1_gpio>,
+		    <&pinctrl_qspi1_io2_gpio>,
+		    <&pinctrl_qspi1_io3_gpio>;
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"REL4",   /* SODIMM 66 */
+		"DIGI_1", /* SODIMM 56 */
+		"DIGI_2", /* SODIMM 58 */
+		"REL1",   /* SODIMM 60 */
+		"REL2",   /* SODIMM 62 */
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"REL3", /* SODIMM 64 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 40 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 50 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 60 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 70 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 80 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 90 */
+		"";
+};
+
+&main_gpio1 {
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 40 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 50 */
+		"";
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
+/* Verdin I2C_4_CSI */
+&main_i2c3 {
+	status = "okay";
+
+	ivy_adc1: adc@40 {
+		compatible = "ti,ads1119";
+		reg = <0x40>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_7>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <51 IRQ_TYPE_EDGE_FALLING>;
+		avdd-supply = <&reg_3v2_ain1>;
+		dvdd-supply = <&reg_3v2_ain1>;
+		vref-supply = <&reg_3v2_ain1>;
+		#address-cells = <1>;
+		#io-channel-cells = <1>;
+		#size-cells = <0>;
+
+		/* AIN1 0-33V Voltage Input */
+		channel@0 {
+			reg = <0>;
+			diff-channels = <0 1>;
+		};
+
+		/* AIN1 0-20mA Current Input */
+		channel@1 {
+			reg = <1>;
+			diff-channels = <2 3>;
+		};
+	};
+
+	ivy_adc2: adc@41 {
+		compatible = "ti,ads1119";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_8>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <52 IRQ_TYPE_EDGE_FALLING>;
+		avdd-supply = <&reg_3v2_ain2>;
+		dvdd-supply = <&reg_3v2_ain2>;
+		vref-supply = <&reg_3v2_ain2>;
+		#address-cells = <1>;
+		#io-channel-cells = <1>;
+		#size-cells = <0>;
+
+		/* AIN2 0-33V Voltage Input */
+		channel@0 {
+			reg = <0>;
+			diff-channels = <0 1>;
+		};
+
+		/* AIN2 0-20mA Current Input */
+		channel@1 {
+			reg = <1>;
+			diff-channels = <2 3>;
+		};
+	};
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
+		    <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_4>;
+	cs-gpios = <0>,
+		   <&mcu_gpio0 1 GPIO_ACTIVE_LOW>,
+		   <&mcu_gpio0 4 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		spi-max-frequency = <18500000>;
+	};
+
+	fram@2 {
+		compatible = "fujitsu,mb85rs256", "atmel,at25";
+		reg = <2>;
+		address-width = <16>;
+		size = <32768>;
+		spi-max-frequency = <33000000>;
+		pagesize = <1>;
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
+	pinctrl-0 = <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>;
+	gpio-line-names =
+		"",
+		"",
+		"GPIO2", /* Verdin GPIO_2 - SODIMM 208 */
+		"GPIO3", /* Verdin GPIO_3 - SODIMM 210 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"";
+};
+
+/* Verdin CAN_2 */
+&mcu_mcan0 {
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
+/* Verdin PCIE_1_RESET# */
+&verdin_pcie_1_reset_hog {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&wkup_uart0 {
+	rs485-rts-active-low;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts
new file mode 100644
index 000000000000..a777513f26ec
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/ivy-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-nonwifi.dtsi"
+#include "k3-am62p-verdin-ivy.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P on Ivy Board";
+	compatible = "toradex,verdin-am62p-nonwifi-ivy",
+		     "toradex,verdin-am62p-nonwifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts
new file mode 100644
index 000000000000..27467281bc3a
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/ivy-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-wifi.dtsi"
+#include "k3-am62p-verdin-ivy.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P WB on Ivy Board";
+	compatible = "toradex,verdin-am62p-wifi-ivy",
+		     "toradex,verdin-am62p-wifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
-- 
2.39.5

