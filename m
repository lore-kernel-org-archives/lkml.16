Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059CC2367A8;
	Wed, 11 Jun 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635781; cv=none; b=HkpI4VWOZJDR/ybPiI6axk4mvdl4rnHjmFMzqY2kINs3EZiYjD5M5NbWzoEzCnamnax4iANVE/qNdbf114voFA0eZrY+IhLlbR/WNA2xfjyc/lUvegO8i15FXviOHW4Sc5mpVUriCCb01TFqANxkMHUJI6UY6aaZFxaRI9vxjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635781; c=relaxed/simple;
	bh=VJhRawm0ZMhdfYQQ/eGmBdyPVGGDw4tsOSyhMbYYtoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbWZ1DkYXSMLaFYQljFWYPbolVFe3a3dcp7OJsk2Enf3fI7lIfWEPScRLN0W4Pno49f0pTfvqhACKMd/St2y33N608oF1URdYbJFpJqr8+AvgYzyO7zTA7tqcmdlhirYkBPoPW8u61V9l93STkrM5vP9rQ1rKkXmrIKgGpVzq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DrIjFjqS; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DrIjFjqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/ADxDhEqnNMjWcfjfUe+wYu6P11ZOgeXzQIIIWBM9gs=;
	b=DrIjFjqSg4kFzEqvmSxXGJiSlKm8CilkBqOM2ZRERzXoj57wX9RiioD76DS+NV
	uxur7rDVszE0lTv8P2Pt5AZVnG8OBQIoU81O6cPQSlHEWzaT4rwbHe5ftASgWrAr
	bh7xqkWh7y4BFrzD61eU7gV47c/uPRBUlNKsZc16FLlJA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjlF0UkloyylqAA--.31015S3;
	Wed, 11 Jun 2025 17:55:02 +0800 (CST)
Date: Wed, 11 Jun 2025 17:55:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, upstream@lists.phytec.de,
	Benjamin Hahn <b.hahn@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: add imx95-libra-rdk-fpsc board
Message-ID: <aElSdJay7mI5JSL/@dragon>
References: <20250509-wip-y-moog-phytec-de-imx95-libra-v2-0-b241a915f2be@phytec.de>
 <20250509-wip-y-moog-phytec-de-imx95-libra-v2-2-b241a915f2be@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-wip-y-moog-phytec-de-imx95-libra-v2-2-b241a915f2be@phytec.de>
X-CM-TRANSID:Mc8vCgBnjlF0UkloyylqAA--.31015S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfuF43uFyfJFyxGw4DAw4ktFb_yoW5Aw1fAo
	WYvFs5u3y5Kr1UGr15Gr17tanrZr4kKF45Ka90yrW3JanIv39FyryDXw4jqr18tr40gFyD
	Z3yfta4rAa9rt395n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7vtCDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBsfhGhJUnshWAAA3F

On Fri, May 09, 2025 at 02:15:51PM +0200, Yannic Moog wrote:
> Add device tree for the Libra-i.MX 95 FPSC board. The Libra is a
> pure development board and has hardware to support FPSC-24-A.0 set of
> features. The phyCORE-i.MX 95 FPSC [1] SoM uses only a subset of
> the hardware features of the Libra board. The phyCORE-i.MX 95 FPSC
> itself is a System on Module designed around the i.MX 95 SoC.
> The SoM and board utilize the Future Proof Solder Core [2] BGA standard
> to connect to each other.
> 
> To be able to easily map FPSC interface names to SoC interfaces, the
> FPSC interface names are added as inline comments. Example:
> 
> &lpi2c5 { /* I2C2 */
> 	pinctrl-0 = <&pinctrl_lpi2c5>;
> 	[...]
> };
> 
> Here, I2C2 is the FPSC interface name. The lpi2c5 instance of the i.MX 95
> SoC is used to fulfill the i2c functionality and its signals are routed
> to the FPSC I2C2 signal pins:
> 
> pinctrl_lpi2c5: lpi2c5grp {
> 	fsl,pins = <
> 		IMX95_PAD_GPIO_IO22__LPI2C5_SDA	0x40000b9e	/* I2C2_SDA */
> 		IMX95_PAD_GPIO_IO23__LPI2C5_SCL 0x40000b9e	/* I2C2_SCL */
> 	>;
> };
> 
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-95-fpsc/
> [2] https://www.phytec.eu/en/produkte/system-on-modules/fpsc/
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 327 ++++++++++
>  .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++

>  fitImage                                           | Bin 0 -> 14928380 bytes
>  fitImage.its                                       |   1 +

What are these?

>  5 files changed, 985 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 90652292a911..6d018d046009 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -325,6 +325,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
>  imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
>  imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
>  
>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
> new file mode 100644
> index 000000000000..adaa7429681f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 PHYTEC Messtechnik GmbH
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/leds-pca9532.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +#include "imx95-phycore-fpsc.dtsi"
> +
> +/ {
> +	compatible = "phytec,imx95-libra-rdk-fpsc",
> +		"phytec,imx95-phycore-fpsc", "fsl,imx95";
> +	model = "PHYTEC Libra i.MX95 RDK FPSC";
> +
> +	aliases {
> +		ethernet0 = &enetc_port0;
> +		serial0 = &lpuart7;
> +		serial1 = &lpuart8;
> +		can1 = &flexcan2;
> +		can2 = &flexcan1;

Can we sort them alphabetically?

> +	};
> +
> +	backlight_lvds0: backlight0 {
> +		compatible = "pwm-backlight";
> +		pinctrl-0 = <&pinctrl_lvds0>;
> +		power-supply = <&reg_vdd_12v0>;
> +		status = "disabled";
> +	};
> +
> +	transceiver1: can-phy {
> +		compatible = "ti,tcan1043";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +		enable-gpios = <&gpio_expander 10 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	transceiver2: can-phy {
> +		compatible = "ti,tcan1043";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +		enable-gpios = <&gpio_expander 9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart7;
> +	};

We usually put this generic node before devices.

> +
> +	panel0_lvds: panel-lvds0 {
> +		backlight = <&backlight_lvds0>;
> +		power-supply = <&reg_vdd_3v3>;
> +		status = "disabled";
> +

Unneeded newline.

> +	};
> +
> +	reg_vdd_12v0: regulator-vdd-12v0 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-name = "VDD_12V0";
> +	};
> +
> +	reg_vdd_1v8: regulator-vdd-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "VDD_1V8";
> +	};
> +
> +	reg_vdd_3v3: regulator-vdd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VDD_3V3";
> +	};
> +
> +	reg_vdd_5v0: regulator-vdd-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "VDD_5V0";
> +	};
> +};
> +
> +&enetc_port0 {
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +};
> +
> +&enetc_port2 {
> +	managed = "in-band-status";
> +	phy-handle = <&ethphy2>;
> +	phy-mode = "10gbase-r";
> +};
> +
> +/* CAN FD */
> +&flexcan1 {
> +	phys = <&transceiver1>;
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	phys = <&transceiver2>;
> +	status = "okay";
> +};
> +
> +/* SPI-NOR */
> +&flexspi1 {
> +	pinctrl-0 = <&pinctrl_flexspi>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	spi_nor: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <166000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		vcc-supply = <&reg_vdd_1v8>;
> +	};
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "RGMII2_nINT", "GPIO4", "RTC_INT", "",
> +			  "LVDS1_BL_EN";
> +};
> +
> +&lpi2c1 {
> +	temperature-sensor@4f {
> +		compatible = "nxp,p3t1755";
> +		reg = <0x4f>;
> +		vs-supply = <&reg_vdd_1v8>;
> +	};
> +};
> +
> +&lpi2c3 {
> +	status = "okay";
> +
> +	leds@62 {
> +		compatible = "nxp,pca9533";
> +		reg = <0x62>;
> +
> +		led-1 {
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +
> +		led-2 {
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +
> +		led-3 {
> +			type = <PCA9532_TYPE_LED>;
> +		};
> +	};
> +};
> +
> +&lpi2c4 {
> +	status = "okay";
> +
> +	gpio_expander: gpio@20 {
> +		compatible = "ti,tca6416";
> +		reg = <0x20>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-line-names = "CSI1_CTRL1", "CSI1_CTRL2", "CSI1_CTRL3",
> +				  "CSI1_CTRL4", "CSI2_CTRL1", "CSI2_CTRL2",
> +				  "CSI2_CTRL3", "CSI2_CTRL4", "CLK_EN_AV",
> +				  "nCAN2_EN", "nCAN1_EN", "PCIE1_nWAKE",
> +				  "PCIE2_nWAKE", "PCIE2_nALERT_3V3",
> +				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
> +		vcc-supply = <&reg_vdd_1v8>;
> +
> +		uart1_bt_rs_sel: bt-rs-hog {
> +			gpios = <14 GPIO_ACTIVE_HIGH>;
> +			gpio-hog;
> +			line-name = "UART1_BT_RS_SEL";
> +			output-low;
> +		};
> +
> +		uart1_rs232_485_sel: rs232-485-hog {
> +			gpios = <15 GPIO_ACTIVE_HIGH>;
> +			gpio-hog;
> +			line-name = "UART1_RS232_485_SEL";
> +			output-low;
> +		};
> +	};
> +};
> +
> +&lpi2c5 {
> +	status = "okay";
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c02";
> +		reg = <0x51>;
> +		pagesize = <16>;
> +		vcc-supply = <&reg_vdd_1v8>;
> +	};
> +

Unneeded newline.

> +};
> +
> +/* Used for M33 debug */
> +&lpuart2 {
> +	pinctrl-0 = <&pinctrl_lpuart2>;
> +	pinctrl-names = "default";
> +};
> +
> +/* A-55 debug UART */
> +&lpuart7 {
> +	status = "okay";
> +};
> +
> +/* RS232/RS485/BT */
> +&lpuart8 {
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&netc_emdio { /* RGMII2 */
> +	ethphy0: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +		enet-phy-lane-no-swap;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +	};
> +
> +	ethphy2: ethernet-phy@8 {
> +		compatible = "ethernet-phy-ieee802.3-c45";
> +		reg = <0x8>;
> +		max-speed = <10000>; /* 10Gbit/s */
> +		status = "disabled";
> +	};
> +};
> +
> +&pcie0 {
> +	reset-gpio = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_vdd_3v3>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	reset-gpio = <&gpio1 14 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_vdd_3v3>;
> +	status = "okay";
> +};
> +
> +&rv3028 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rtc>;
> +	interrupt-parent = <&gpio2>;
> +	interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> +	aux-voltage-chargeable = <1>;
> +	wakeup-source;
> +	trickle-resistor-ohms = <3000>;
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_lpuart2: lpuart2grp { /* FPSC proprietary */
> +		fsl,pins = <
> +			IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e
> +			IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e
> +		>;
> +	};
> +
> +	pinctrl_lvds0: lvds0grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO20__GPIO2_IO_BIT20	0x31e
> +		>;
> +	};
> +
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO18__GPIO2_IO_BIT18	0x31e
> +		>;
> +	};
> +
> +	pinctrl_tpm4: tpm4grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO21__TPM4_CH1	0x51e
> +		>;
> +	};
> +};
> +
> +&tpm4 {
> +	pinctrl-0 = <&pinctrl_tpm4>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb3 {
> +	fsl,over-current-active-low;
> +	fsl,power-active-low;
> +	status = "okay";
> +};
> +
> +&usb3_phy {
> +	vbus-supply = <&reg_vdd_5v0>;
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {

In order of alphabet, usb3_dwc3 should go before usb3_phy, right?

> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +/* uSD Card */
> +&usdhc2 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
> new file mode 100644
> index 000000000000..0e3727d93df0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
> @@ -0,0 +1,656 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 PHYTEC Messtechnik GmbH
> + */
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "imx95.dtsi"
> +
> +/ {
> +	model = "PHYTEC phyCORE-i.MX95 FPSC";
> +	compatible = "phytec,imx95-phycore-fpsc", "fsl,imx95";
> +
> +	aliases {
> +		ethernet1 = &enetc_port1;
> +		rtc0 = &rv3028;
> +		rtc1 = &scmi_bbm;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c5;
> +		i2c3 = &lpi2c3;
> +		i2c4 = &lpi2c4;
> +		i2c5 = &lpi2c1;

Sort them please.

> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x80000000 0x00000001 0x00000000>;
> +	};
> +
> +	reg_nvcc_aon: regulator-nvcc-aon {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "VDD_IO";
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		off-on-delay-us = <12000>;
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "VDDSW_SD2";
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x7f000000>;
> +			reusable;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&enetc_port0 { /* FPSC RGMII2 */
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	pinctrl-names = "default";
> +};
> +
> +&enetc_port1 {
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_enetc1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&flexcan1 { /* FPSC CAN1 */
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	pinctrl-names = "default";
> +};
> +
> +&flexcan2 { /* FPSC CAN2 */
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-names = "default";
> +};
> +
> +&flexspi1 { /* FPSC QSPI */
> +	pinctrl-0 = <&pinctrl_flexspi>;
> +	pinctrl-names = "default";
> +};
> +
> +&gpio1 { /* FPSC GPIO */
> +	gpio-line-names = "", "", "", "", "GPIO2",
> +			  "GPIO1", "", "", "", "",
> +			  "PCIE1_nPERST", "USB1_PWR_EN", "GPIO3", "USB2_PWR_EN", "PCIE2_nPERST";
> +	pinctrl-0 = <&pinctrl_gpio1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&gpio2 { /* FPSC GPIO */
> +	gpio-line-names = "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "RGMII2_nINT", "GPIO4";
> +	pinctrl-0 = <&pinctrl_gpio2>;
> +	pinctrl-names = "default";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "", "", "", "", "",
> +			  "", "", "SD2_RESET_B";
> +};
> +
> +&gpio4 {
> +	gpio-line-names = "ENET2_nINT";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "", "", "USB1_OC", "USB2_OC";
> +};
> +
> +&lpi2c1 { /* FPSC I2C5 */
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	/* User EEPROM */
> +	eeprom@50 {
> +		compatible = "st,24c32", "atmel,24c32";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_nvcc_aon>;
> +	};
> +
> +	/* Factory EEPROM */
> +	eeprom@51 {
> +		compatible = "st,24c32", "atmel,24c32";
> +		reg = <0x51>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_nvcc_aon>;
> +	};
> +
> +	/* User EEPROM ID page */
> +	eeprom@58 {
> +		compatible = "st,24c32", "atmel,24c32";
> +		reg = <0x58>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_nvcc_aon>;
> +	};
> +
> +	rv3028: rtc@52 {

We usually sort I2C devices in order of slave address.

Shawn

> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
> +	};
> +
> +	dram_sense: temperature-sensor@48 {
> +		compatible = "ti,tmp102";
> +		reg = <0x48>;
> +		#thermal-sensor-cells = <1>;
> +	};
> +
> +	emmc_sense: temperature-sensor@49 {
> +		compatible = "ti,tmp102";
> +		reg = <0x49>;
> +		#thermal-sensor-cells = <1>;
> +	};
> +
> +	ethphy_sense: temperature-sensor@4a {
> +		compatible = "ti,tmp102";
> +		reg = <0x4a>;
> +		#thermal-sensor-cells = <1>;
> +	};
> +
> +	pmic_sense: temperature-sensor@4b {
> +		compatible = "ti,tmp102";
> +		reg = <0x4b>;
> +		#thermal-sensor-cells = <1>;
> +	};
> +};
> +
> +&lpi2c2 { /* FPSC I2C1 */
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpi2c3 { /* FPSC I2C3 */
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpi2c4 { /* FPSC I2C4 */
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c4>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpi2c5 { /* FPSC I2C2 */
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c5>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpspi3 { /* FPSC SPI2 */
> +	pinctrl-0 = <&pinctrl_lpspi3>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpspi4 { /* FPSC SPI3 */
> +	pinctrl-0 = <&pinctrl_lpspi4>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpspi7 { /* FPSC SPI1 */
> +	pinctrl-0 = <&pinctrl_lpspi7>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpuart5 { /* FPSC UART2 */
> +	pinctrl-0 = <&pinctrl_lpuart5>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpuart7 { /* FPSC UART3 */
> +	pinctrl-0 = <&pinctrl_lpuart7>;
> +	pinctrl-names = "default";
> +};
> +
> +&lpuart8 { /* FPSC UART1 */
> +	pinctrl-0 = <&pinctrl_lpuart8>;
> +	pinctrl-names = "default";
> +};
> +
> +&netc_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_emdio { /* FPSC RGMII2 */
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x0>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		enet-phy-lane-no-swap;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +	};
> +};
> +
> +&netcmix_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&pcie0 { /* FPSC PCIE1 */
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +};
> +
> +&pcie1 { /* FPSC PCIE2 */
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +};
> +
> +&sai5 {	/* FPSC SAI1 */
> +	pinctrl-0 = <&pinctrl_sai5>;
> +	pintrc-names = "default";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO	0x97e	/* RGMII2_MDIO */
> +			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC	0x502	/* RGMII2_MDC */
> +		>;
> +	};
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO16__GPIO2_IO_BIT16			0x31e	/* RGMII2_nINT */
> +			IMX95_PAD_CCM_CLKO3__NETCMIX_TOP_NETC_TMR_1588_TRIG2	0x31e	/* RGMII2_EVENT_IN */
> +			IMX95_PAD_CCM_CLKO4__NETCMIX_TOP_NETC_TMR_1588_PP2	0x31e	/* RGMII2_EVENT_OUT */
> +
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e	/* RGMII2_TX_3 */
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e	/* RGMII2_TX_2 */
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e	/* RGMII2_TX_1 */
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e	/* RGMII2_TX_0 */
> +			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e	/* RGMII2_TX_CTL */
> +			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e	/* RGMII2_TXC */
> +			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e	/* RGMII2_RX_3 */
> +			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e	/* RGMII2_RX_2 */
> +			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e	/* RGMII2_RX_1 */
> +			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e	/* RGMII2_RX_0 */
> +			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e	/* RGMII2_RX_CTL */
> +			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e	/* RGMII2_RXC */
> +		>;
> +	};
> +
> +	pinctrl_enetc1: enetc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_MDC__GPIO4_IO_BIT0			0x31e
> +			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e
> +			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e
> +			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x57e
> +			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x57e
> +			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
> +			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
> +			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
> +			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
> +			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
> +			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
> +			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
> +			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX		0x51e	/* CAN1_TX */
> +			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX	0x51e	/* CAN1_RX */
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO25__CAN2_TX	0x51e	/* CAN2_TX */
> +			IMX95_PAD_GPIO_IO27__CAN2_RX	0x51e	/* CAN2_RX */
> +		>;
> +	};
> +
> +	pinctrl_flexspi: flexspigrp {
> +		fsl,pins = <
> +			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B		0x3fe	/* QSPI_CE */
> +			IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK		0x3fe	/* QSPI_CLK */
> +			IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x3fe	/* QSPI_DATA_0 */
> +			IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x3fe	/* QSPI_DATA_1 */
> +			IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x3fe	/* QSPI_DATA_2 */
> +			IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x3fe	/* QSPI_DATA_3 */
> +			IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS		0x3fe	/* QSPI_DQS */
> +		>;
> +	};
> +
> +	pinctrl_gpio1: gpio1grp {
> +		fsl,pins = <
> +			IMX95_PAD_UART1_TXD__AONMIX_TOP_GPIO1_IO_BIT5	0x31e	/* GPIO1 */
> +			IMX95_PAD_UART1_RXD__AONMIX_TOP_GPIO1_IO_BIT4	0x31e	/* GPIO2 */
> +			IMX95_PAD_SAI1_TXC__AONMIX_TOP_GPIO1_IO_BIT12	0x31e	/* GPIO3 */
> +		>;
> +	};
> +
> +	pinctrl_gpio2: gpio2grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO17__GPIO2_IO_BIT17	0x31e	/* GPIO4 */
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL	0x40000b9e	/* I2C5_SCL */
> +			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA	0x40000b9e	/* I2C5_SDA */
> +		>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x40000b9e	/* I2C1_SDA_DNU */
> +			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x40000b9e	/* I2C1_SCL_DNU */
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO28__LPI2C3_SDA 0x40000b9e	/* I2C3_SDA */
> +			IMX95_PAD_GPIO_IO29__LPI2C3_SCL 0x40000b9e	/* I2C3_SCL */
> +		>;
> +	};
> +
> +	pinctrl_lpi2c4: lpi2c4grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO30__LPI2C4_SDA 0x40000b9e	/* I2C4_SDA */
> +			IMX95_PAD_GPIO_IO31__LPI2C4_SCL 0x40000b9e	/* I2C4_SDL */
> +		>;
> +	};
> +
> +	pinctrl_lpi2c5: lpi2c5grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO22__LPI2C5_SDA	0x40000b9e	/* I2C2_SDA */
> +			IMX95_PAD_GPIO_IO23__LPI2C5_SCL 0x40000b9e	/* I2C2_SCL */
> +		>;
> +	};
> +
> +	pinctrl_lpspi3: lpspi3grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO11__LPSPI3_SCK		0x51e	/* SPI2_SCLK */
> +			IMX95_PAD_GPIO_IO10__LPSPI3_SOUT	0x51e	/* SPI2_MOSI */
> +			IMX95_PAD_GPIO_IO09__LPSPI3_SIN		0x51e	/* SPI2_MISO */
> +			IMX95_PAD_GPIO_IO08__LPSPI3_PCS0	0x51e	/* SPI2_CS */
> +		>;
> +	};
> +
> +	pinctrl_lpspi4: lpspi4grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO21__LPSPI4_SCK		0x51e	/* SPI3_SCLK */
> +			IMX95_PAD_GPIO_IO20__LPSPI4_SOUT	0x51e	/* SPI3_MOSI */
> +			IMX95_PAD_GPIO_IO19__LPSPI4_SIN		0x51e	/* SPI3_MISO */
> +			IMX95_PAD_GPIO_IO18__LPSPI4_PCS0	0x51e	/* SPI3_CS */
> +		>;
> +	};
> +
> +	pinctrl_lpspi7: lpspi7grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO07__LPSPI7_SCK		0x51e	/* SPI1_SCLK */
> +			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT	0x51e	/* SPI1_MOSI */
> +			IMX95_PAD_GPIO_IO05__LPSPI7_SIN		0x51e	/* SPI1_MISO */
> +			IMX95_PAD_GPIO_IO04__LPSPI7_PCS0	0x51e	/* SPI1_CS */
> +		>;
> +	};
> +
> +	pinctrl_lpuart5: lpuart5grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO01__LPUART5_RX		0x51e	/* UART2_RXD */
> +			IMX95_PAD_GPIO_IO00__LPUART5_TX		0x51e	/* UART2_TXD */
> +			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B	0x51e	/* UART2_RTS */
> +			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B	0x51e	/* UART2_CTS */
> +		>;
> +	};
> +
> +	pinctrl_lpuart7: lpuart7grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO37__LPUART7_RX	0x31e	/* UART3_RXD */
> +			IMX95_PAD_GPIO_IO36__LPUART7_TX	0x31e	/* UART3_TXD */
> +		>;
> +	};
> +
> +	pinctrl_lpuart8: lpuart8grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO13__LPUART8_RX		0x51e	/* UART1_RXD */
> +			IMX95_PAD_GPIO_IO12__LPUART8_TX		0x51e	/* UART1_TXD */
> +			IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x51e	/* UART1_RTS */
> +			IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x51e	/* UART1_CTS */
> +		>;
> +	};
> +
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x31e	/* PCIE1_nCLKREQ */
> +			IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x31e	/* PCIE1_nPERST */
> +		>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B	0x31e	/* PCIE2_nCLKREQ */
> +			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_GPIO1_IO_BIT14	0x31e	/* PCIE2_nPERST */
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7	0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai5: sai5grp {
> +		fsl,pins = <
> +			IMX95_PAD_XSPI1_DQS__SAI5_RX_SYNC		0x51e	/* SAI1_RX_SYNC */
> +			IMX95_PAD_XSPI1_SS1_B__SAI5_RX_BCLK		0x51e	/* SAI1_RX_BCLK */
> +			IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0	0x51e	/* SAI1_RX_DATA */
> +			IMX95_PAD_XSPI1_DATA5__SAI5_TX_SYNC		0x51e	/* SAI1_TX_SYNC */
> +			IMX95_PAD_XSPI1_DATA6__SAI5_TX_BCLK		0x51e	/* SAI1_TX_BCLK */
> +			IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0	0x51e	/* SAI1_TX_DATA */
> +		>;
> +	};
> +
> +	pinctrl_tpm3: tpm3grp {
> +	      fsl,pins = <
> +		      IMX95_PAD_GPIO_IO24__TPM3_CH3	0x51e	/* PWM1 */
> +	      >;
> +	};
> +
> +	pinctrl_tpm5: tpm5grp {
> +	      fsl,pins = <
> +		      IMX95_PAD_GPIO_IO26__TPM5_CH3	0x51e	/* PWM2 */
> +	      >;
> +	};
> +
> +	pinctrl_usbc: usbcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_BIT11	0x51e	/* USB1_PWR_EN */
> +			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13		0x51e	/* USB1_OC */
> +		>;
> +	};
> +
> +	pinctrl_usb2: usb2grp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_BIT13	0x51e	/* USB2_PWR_EN */
> +			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14		0x51e	/* USB2_OC */
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x13fe
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x13fe
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x13fe
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x13fe
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x13fe
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x13fe
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x13fe
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x13fe
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x15fe	/* CLK */
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x13fe	/* CMD */
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe	/* DATA0 */
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe	/* DATA1 */
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe	/* DATA2 */
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe	/* DATA3 */
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x158e	/* SDIO_CLK */
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x138e	/* SDIO_CMD */
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x138e	/* SDIO_DATA0 */
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x138e	/* SDIO_DATA1 */
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x138e	/* SDIO_DATA2 */
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x138e	/* SDIO_DATA3 */
> +		>;
> +	};
> +};
> +
> +&tpm3 { /* FPSC PWM1 */
> +	pinctrl-0 = <&pinctrl_tpm3>;
> +	pinctrl-names = "default";
> +};
> +
> +&tpm5 {	/* FPSC PWM2 */
> +	pinctrl-0 = <&pinctrl_tpm5>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb3 { /* FPSC USB1 */
> +	pinctrl-0 = <&pinctrl_usbc>;
> +	pinctrl-names = "default";
> +};
> +
> +&usdhc1 {
> +	bus-width = <8>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc1>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	status = "okay";
> +};
> +
> +&usdhc2 { /* FPSC SDCARD */
> +	bus-width = <4>;
> +	disable-wp;
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc2>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +};
> +
> +&usdhc3 { /* FPSC SDIO */
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-names = "default";
> +};
> diff --git a/fitImage b/fitImage
> new file mode 100644
> index 000000000000..6d3ad7dab154
> Binary files /dev/null and b/fitImage differ
> diff --git a/fitImage.its b/fitImage.its
> new file mode 120000
> index 000000000000..393e3dcae552
> --- /dev/null
> +++ b/fitImage.its
> @@ -0,0 +1 @@
> +/home/moog/share/augenblix2/Yocto.scarthgap/build/deploy-ampliphy-vendor/images//imx95-libra-fpsc-1/fitImage-its*.its
> \ No newline at end of file
> 
> -- 
> 2.25.1
> 

