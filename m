Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270FD2777FF;
	Wed,  9 Apr 2025 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223865; cv=none; b=YRGatI+yzYEtVKVnCE8bVm0P/maQUu7JttsWYz1q1+GVBC/6IbRJE2bOPGv/fegmcplC36qzeOoN9Ka8NSkArQKPKbyVCnLsiid1YCmBIxKa5jVfWG7mznMhLuKp7dQti7/4+sna69jU0akvEU/3MTOWt6TL/F6vXAP1j1XIsE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223865; c=relaxed/simple;
	bh=sJtmuoGD0MZFs1oY7q1y3JjVMHbGPe+8qp4R8ghisuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ozog4l8Sm17Ohcx54hq85Q9KZMilqwZVvQosk/CZwSyYwKckg4YD/XyRFaSxHgN3q4tvc+htQcr9jcC8sdcew3F5dvWbA7tQAidY278kRX2CIRKf+NNHQ0PI20gb7R9JevgR9WGbp7TSM/XXp1PHiatUVJYWlUx+rFy6f5aCUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UzR0ULD4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UzR0ULD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744223861;
	bh=sJtmuoGD0MZFs1oY7q1y3JjVMHbGPe+8qp4R8ghisuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UzR0ULD4JDUbSZBBmRHyuudeAyKi14OGtbThieD0kaVHuiHBphSQejlVSp4DBVb8+
	 C1tUS+wNosgGuNhzQNBJN1pmYjeg8ujef5hGVFhojGeJ0h+Z9GdOw2zYaRK1FyHUpm
	 kOCx7M8+UX+R3PPuAwrHIQJfJ3xFFBrO0zv/+lX6n9DgcGF/aMyhBygZJtSZ1pC9Wo
	 dKLtB05DUZRkOB5r/dZqoZ9jtDnmR3C6q3BMd6OENSynWOBBX8+yQoqdx1xsfTlonW
	 z3XmAFkeWqnw8Vv9R7kPRyJyK6MsKAw4OFrjVc3rCMnNMBaG0fs5P9AnH9mtzTQUZa
	 QPGXpKF6C3PGQ==
Received: from pan.localdomain (unknown [IPv6:2a00:23c6:c338:be00:61ad:9488:9583:2010])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE8DB17E09E7;
	Wed,  9 Apr 2025 20:37:40 +0200 (CEST)
From: Martyn Welch <martyn.welch@collabora.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com,
	Martyn Welch <martyn.welch@collabora.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus ENC Carrier Board
Date: Wed,  9 Apr 2025 19:37:27 +0100
Message-ID: <20250409183730.1972967-2-martyn.welch@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409183730.1972967-1-martyn.welch@collabora.com>
References: <20250409183730.1972967-1-martyn.welch@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Boundary Devices/Ezurio Nitrogen8M Plus ENC Carrier
Board and it's SOM. Supported interfaces:

 - Serial Console
 - EQoS Ethernet
 - USB
 - eMMC
 - HDMI

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---

Changes in v2:
 - Add missing entries to binding documents.

Changes in v3:
 - Separating binding documentation in separate patch.
 - Removing spurious properties.
 - Correct ordering of nodes and properties.
 - Correct spacing.
 - Fixing USB.

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../imx8mp-nitrogen-enc-carrier-board.dts     | 452 ++++++++++++++++++
 .../dts/freescale/imx8mp-nitrogen-som.dtsi    | 410 ++++++++++++++++
 3 files changed, 863 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 42e6482a31cb..58b33708e4ee 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
new file mode 100644
index 000000000000..1df9488aaeb2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 Boundary Devices
+ * Copyright 2025 Collabora Ltd.
+ */
+
+/dts-v1/;
+
+#include "imx8mp-nitrogen-som.dtsi"
+
+/ {
+	model = "Boundary Devices Nitrogen8M Plus ENC Carrier Board";
+	compatible = "boundary,imx8mp-nitrogen-enc-carrier-board",
+			"boundary,imx8mp-nitrogen-som", "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	connector {
+		compatible = "usb-c-connector";
+		data-role = "dual";
+		label = "USB-C";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hs_ep: endpoint {
+					remote-endpoint = <&usb3_hs_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	reg_usb_vbus: regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usb_vbus>;
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&ecspi2 {
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio1 {
+	usb-hub-reset-hog {
+		gpio-hog;
+		gpios = <6 GPIO_ACTIVE_LOW>;
+		line-name = "usb-hub-reset";
+		output-low;
+	};
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-0 = <&pinctrl_hdmi>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c2 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = <&pinctrl_i2c2_pca9546>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <100000>;
+
+			rtc@52 {
+				compatible = "microcrystal,rv3028";
+				reg = <0x52>;
+				interrupts-extended = <&gpio1 4 IRQ_TYPE_LEVEL_LOW>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_rv3028>;
+				wakeup-source;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	usb-mux@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupts-extended = <&gpio1 8 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_hd3ss3220>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb3_role_switch>;
+				};
+			};
+		};
+	};
+};
+
+&isp_0 {
+	status = "okay";
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	status = "okay";
+};
+
+&uart4 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usb3_0 {
+	fsl,over-current-active-low;
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb3_0>;
+	usb-role-switch;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb3_hs_ep: endpoint {
+				remote-endpoint = <&hs_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <4>;
+	cd-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x143
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x40000019
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000019
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x100
+			MX8MP_IOMUXC_NAND_DATA01__GPIO3_IO07		0x119
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x1c4
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06		0x41
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07		0x41
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08		0x41
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x41
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05		0x41
+			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04		0x41
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03		0x41
+		>;
+	};
+
+	pinctrl_i2c2_pca9546: i2c2-pca9546grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x100
+		>;
+	};
+
+	pinctrl_i2c4_hd3ss3220: i2c4-hd3ss3220grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x16
+			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x03
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT		0x100
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT		0xd6
+			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT		0xd6
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+		MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT			0x116
+		>;
+	};
+
+	pinctrl_reg_usb_vbus: reg-usb-vbusgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x100
+		>;
+	};
+
+	pinctrl_rv3028: rv3028grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0x1c0
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_usb3_0: usb3-0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__USDHC1_VSELECT		0x116
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d6
+		>;
+	};
+
+	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11		0x1c4
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
new file mode 100644
index 000000000000..7f80d1a51964
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 Boundary Devices
+ * Copyright 2025 Collabora Ltd.
+ */
+
+#include "imx8mp.dtsi"
+
+/ {
+	model = "Boundary Devices Nitrogen8M Plus Som";
+	compatible = "boundary,imx8mp-nitrogen-som", "fsl,imx8mp";
+
+	rfkill-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-bluetooth";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rfkill_bt>;
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
+	};
+
+	rfkill-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-wlan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rfkill_wlan>;
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio2 19 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&eqos {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			eee-broken-1000t;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 GPIO_OPEN_DRAIN>;
+	sda-gpios = <&gpio5 15 GPIO_OPEN_DRAIN>;
+	status = "okay";
+
+	pmic: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_pmic>;
+
+		regulators {
+
+			buck1: BUCK1 {
+				regulator-name = "VDD_SOC (BUCK1)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "VDD_ARM (BUCK2)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "VDD_3P3V (BUCK4)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "VDD_1P8V (BUCK5)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "NVCC_DRAM_1P1V (BUCK6)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "NVCC_SNVS_1V8 (LDO1)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+			};
+
+			ldo3: LDO3 {
+				regulator-name = "VDDA_1V8 (LDO3)";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "NVCC_SD1 (LDO5)";
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio5 16 GPIO_OPEN_DRAIN>;
+	sda-gpios = <&gpio5 17 GPIO_OPEN_DRAIN>;
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 GPIO_OPEN_DRAIN>;
+	sda-gpios = <&gpio5 19 GPIO_OPEN_DRAIN>;
+	status = "okay";
+};
+
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 GPIO_OPEN_DRAIN>;
+	sda-gpios = <&gpio5 21 GPIO_OPEN_DRAIN>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	status = "okay";
+};
+
+&usdhc3 {
+	bus-width = <8>;
+	non-removable;
+	no-mmc-hs400;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x20
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0xa0
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x91
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x91
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x91
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x91
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x91
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x1f
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x1f
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x1f
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x1f
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x1f
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
+
+			MX8MP_IOMUXC_NAND_CE1_B__GPIO3_IO02				0x10
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16				0x100
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14	0x1c3
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15	0x1c3
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16	0x1c3
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1c3
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18	0x1c3
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19	0x1c3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20	0x1c3
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_pmic: pmicirqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00	0x41
+		>;
+	};
+
+	pinctrl_rfkill_bt: rfkill-btgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09	0x119
+		>;
+	};
+
+	pinctrl_rfkill_wlan: rfkill-wlangrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x16
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x10
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x150
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x150
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x150
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x150
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x150
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x150
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x150
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x150
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x150
+			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x140
+
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x14
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x154
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x154
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x154
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x154
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x154
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x154
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x154
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x154
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x154
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x12
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x152
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x152
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x152
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x152
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x152
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x152
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x152
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x152
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x152
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
+};
+
-- 
2.47.2

