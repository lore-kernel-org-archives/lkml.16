Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17181DFDAB;
	Fri, 25 Apr 2025 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563277; cv=none; b=tnS0vUAeY1iOt7sNOjkYMXruuWtr5vXbqE2vozWAlLMXQGjQt91VfPN8kye6vOUvh/zTOL2J7Mf/0aY0oyXCTDOr9Lip+Wbsl0jUnmYTG8xkx712F1Nc7r3nhJve3dAhYQkuXqqWUi30v4B31T+Ns3+jUzP/MFeeCqnAmHmXXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563277; c=relaxed/simple;
	bh=Jj8JwEyjePL1mk2H0nmL8frWagBIPWufEv94NRtprEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KdNVgaHm45MUXw1Pht2FJldWwIoFghQ4kgC3X+4wbWoMMS6VHR3T29GiiIx/0m4WJDE9HcZJduXKVQ0NM24gpVHwAj6W/96/M4a/6cVa8FQeflrJExlJ6ID6Q/Nnng82ugZYiCZGiBtKGdvA6/LCAMCpYUXGZGxcEK35IHIrufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=D3s55mFj; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="D3s55mFj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qhO7gfPY8N+u8fqstYKFCu7lX1y6q1PoxvBNdW7nO2E=; b=D3s55mFjlE3TSdhakHBNFQ3AF0
	LV9elRCcbUUlo9vk8WknrqIkgdUC/hwkifSXLDBw36Y89ihS5S/RX4fgO16EiRPpV6eZdvoxupNg8
	PLKhRc1GAkQIxSM58mkWcLp3YIUgg+/7olti+tmGQj4PJJZgLpX7DgmyradZPsG+Iw9le6+q6et8t
	oDwt7EpmMgnAUnqJpvpd5Bb1NkyynaQ6bAfstPZuM5jyeagtSqpjdy7kgtZQ+jJIOrRZ9rONq/peH
	XYi/9KF4db3DPaQftNWFzVfajWuK8FhJGftR89jXekX80i8Mb4WGXqogf7vi5lpXFO0sR3kagAEVZ
	4ex12wtw==;
Received: from [89.212.21.243] (port=50196 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u8CkH-003PCA-1h;
	Fri, 25 Apr 2025 08:41:08 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] arm64: dts: freescale: Add PHYTEC phyBOARD-Nash-i.MX93 support
Date: Fri, 25 Apr 2025 08:41:07 +0200
Message-Id: <20250425064107.174548-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425064107.174548-1-primoz.fiser@norik.com>
References: <20250425064107.174548-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add initial support for PHYTEC phyBOARD-Nash-i.MX93 board [1] based on
the PHYTEC phyCORE-i.MX93 SoM (System-on-Module) [2].

Supported board features:
 * ADC
 * CAN
 * Ethernet 2x
 * EEPROM
 * eMMC
 * Heartbeat LED
 * RTC
 * RS-232/RS-485
 * SD-card
 * TPM 2.0
 * USB

For more details see the product pages for the development kit and the
SoM:

[1] https://www.phytec.eu/en/produkte/development-kits/phyboard-nash/
[2] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-91-93/

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-phyboard-nash.dts     | 317 ++++++++++++++++++
 2 files changed, 318 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621..58f5e7146ccc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -297,6 +297,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
new file mode 100644
index 000000000000..7e9d031a2f0e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Primoz Fiser <primoz.fiser@norik.com>
+ *
+ * Product homepage:
+ * https://www.phytec.eu/en/produkte/development-kits/phyboard-nash/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "imx93-phycore-som.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Nash-i.MX93";
+	compatible = "phytec,imx93-phyboard-nash", "phytec,imx93-phycore-som",
+		     "fsl,imx93";
+
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		rtc0 = &i2c_rtc;
+		rtc1 = &bbnsm_rtc;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	flexcan1_tc: can-phy0 {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flexcan1_tc>;
+		standby-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VCC_SD";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "VREF_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+/* ADC */
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+/* Ethernet */
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	status = "okay";
+};
+
+&mdio {
+	ethphy2: ethernet-phy@2 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_75_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* CAN */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan1_tc>;
+	status = "okay";
+};
+
+/* I2C2 */
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	/* RTC */
+	i2c_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		trickle-resistor-ohms = <3000>;
+		wakeup-source;
+	};
+
+	/* EEPROM */
+	eeprom@54 {
+		compatible = "atmel,24c32";
+		reg = <0x54>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vcc_1v8>;
+	};
+};
+
+/* SPI6 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>;
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* TPM */
+	tpm@0 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+/* Console */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+/* RS-232/RS-485 */
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
+/* USB */
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* SD-Card */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2_default>, <&pinctrl_usdhc2_cd>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_cd>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	disable-wp;
+	no-mmc;
+	no-sdio;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0	0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1	0x57e
+			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2	0x57e
+			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3	0x57e
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0	0x51e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1	0x51e
+			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2	0x50e
+			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3	0x50e
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x50e
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x1002
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+			MX93_PAD_PDM_CLK__CAN1_TX		0x1382
+		>;
+	};
+
+	pinctrl_flexcan1_tc: flexcan1tcgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
+			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi6: lpspi6grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__GPIO2_IO00		0x386
+			MX93_PAD_GPIO_IO01__LPSPI6_SIN		0x3fe
+			MX93_PAD_GPIO_IO02__LPSPI6_SOUT		0x386
+			MX93_PAD_GPIO_IO03__LPSPI6_SCK		0x386
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
+		>;
+	};
+
+	pinctrl_tpm: tpmgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO17__GPIO2_IO17		0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO08__LPUART7_TX		0x30e
+			MX93_PAD_GPIO_IO09__LPUART7_RX		0x31e
+			MX93_PAD_GPIO_IO10__LPUART7_CTS_B	0x31e
+			MX93_PAD_GPIO_IO11__LPUART7_RTS_B	0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_cd: usdhc2cdgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_default: usdhc2grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000178e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001386
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001386
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001386
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013be
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+};
-- 
2.34.1

