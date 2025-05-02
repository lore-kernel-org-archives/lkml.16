Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99F17A2FC;
	Fri,  2 May 2025 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746216464; cv=none; b=ji/6l83rZn27laumzHJKNEN3CEm9oikGTTahc8hdNcEXdAovBQquZaUl0+1gtvP+wYjlj5XWP6qtz9F8PEYppcoB7/pO9ZSACV9B4gqB0pCka+TbiQdAacndzBPgTKGmKYcC06cMirs3N6105RoL4sPh7S4Q0F4dfZcMwXj3a14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746216464; c=relaxed/simple;
	bh=8SkWIe9P5Lgw+LPr1uiRXt5x+9SpwyzwztacaieB6IA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7UpbvR7PU54cJ595BIBbjqJWb4CdU9+GabsqB7I6imKuT8PgWUhRJLQgHMYDswzWCYkA2zW1GgtKIoPM+vSz3wjmRFSVAkxcgJ2P4ZqBObtd61zBPff1R/k5iBi57lPuR0kTRG0DtV5MTc6bibf+yq28cnA0zBJfYDJ4CbuXUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WuSNUape; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WuSNUape"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542K7TJC3944091
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 15:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746216449;
	bh=tyjhtgVOZtOjrEte1Pcmb6EGFQGA8Fd7SNOyYBtBn9g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WuSNUapePKmA8JcVYFZZsMuvCxZN+qL/HpFE5H/eP83085WKCDqsM1AooMejmjVKx
	 Lkdf2/VPf0Dwhqmk1l8sqU3t0yQ2/e2A5gx9U9NOabn0FF6ydud2hBmle1TI/VpzdI
	 I5tGgNklaz3oVGe445apDLcSqYqz6F+itT+mlSv4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542K7TPJ008789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 15:07:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 15:07:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 15:07:28 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542K7SFd016646;
	Fri, 2 May 2025 15:07:28 -0500
Date: Fri, 2 May 2025 15:07:28 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250502200728.s6zyx2lgchftacno@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-4-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502153915.734932-4-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On May  2, 2025 thus sayeth Paresh Bhagat:
> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> designed for TI’s AM62D2 SoC. It supports the following interfaces:
> 
> * 4 GB LPDDR4 RAM
> * x2 Gigabit Ethernet expansion connectors
> * x4 3.5mm TRS Audio Jack Line In
> * x4 3.5mm TRS Audio Jack Line Out
> * x2 Audio expansion connectors
> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> * x1 UHS-1 capable µSD card slot
> * 32 GB eMMC Flash
> * 512 Mb OSPI NOR flash
> * x4 UARTs via USB 2.0-B
> * XDS110 for onboard JTAG debug using USB
> * Temperature sensors, user push buttons and LEDs
> 
> Add basic support for AM62D2-EVM.
> 
> Schematics Link - https://www.ti.com/lit/zip/sprcal5
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile          |   3 +
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 445 +++++++++++++++++++++++
>  2 files changed, 448 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index a48e7608de8b..1971f30879c9 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -33,6 +33,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-pocketbeagle2.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
>  
> +# Boards with AM62Dx SoC
> +dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
> +
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> new file mode 100644
> index 000000000000..03c13b065143
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -0,0 +1,445 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * AM62D2 EVM: https://www.ti.com/lit/zip/sprcal5
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "k3-am62a7.dtsi"
> +
> +/ {
> +	compatible = "ti,am62d2-evm", "ti,am62d2";
> +	model = "Texas Instruments AM62D2 EVM";
> +
> +	aliases {
> +		serial0 = &wkup_uart0;
> +		serial1 = &mcu_uart0;
> +		serial2 = &main_uart0;
> +		mmc1 = &sdhci1;
> +		rtc0 = &wkup_rtc0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* 4G RAM */
> +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
> +		      <0x00000008 0x80000000 0x00000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* global cma region */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x00 0x2000000>;
> +			alloc-ranges = <0x00 0xc0000000 0x00 0x2000000>;
> +			linux,cma-default;
> +		};
> +
> +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		c7x_0_memory_region: c7x-memory@99900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		secure_tfa_ddr: tfa@9e780000 {
> +			reg = <0x00 0x9e780000 0x00 0x80000>;

I don't think this is where TF-A actually is.

> +			alignment = <0x1000>;
> +			no-map;
> +		};
> +
> +		secure_ddr: optee@9e800000 {
> +			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> +			alignment = <0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	opp-table {
> +		/* Requires VDD_CORE at 0v85 */
> +		opp-1400000000 {
> +			opp-hz = /bits/ 64 <1400000000>;
> +			opp-supported-hw = <0x01 0x0004>;
> +			clock-latency-ns = <6000000>;
> +		};
> +	};
> +
> +	vout_pd: regulator-1 {
> +		/* TPS65988 PD CONTROLLER OUTPUT */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vout_pd";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vmain_pd: load-switch {
> +		/* Output of TPS22811 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vmain_pd";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vout_pd>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_5v0: regulator-2 {
> +		/* Output of TPS630702RNMR */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vmain_pd>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_mmc1: regulator-3 {
> +		/* TPS22918DBVR */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_mmc1";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vddshv_sdio: regulator-4 {
> +		compatible = "regulator-gpio";
> +		regulator-name = "vddshv_sdio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vddshv_sdio_pins_default>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		gpios = <&main_gpio1 31 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 0x0>,
> +			 <3300000 0x1>;
> +	};
> +};
> +
> +&mcu_pmx0 {
> +	wkup_uart0_pins_default: wkup-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_MCU_IOPAD(0x0024, PIN_INPUT, 0) /* (C9) WKUP_UART0_RXD */
> +			AM62DX_MCU_IOPAD(0x0028, PIN_OUTPUT, 0) /* (E9) WKUP_UART0_TXD */
> +			AM62DX_MCU_IOPAD(0x002c, PIN_INPUT, 0) /* (C10) WKUP_UART0_CTSn */
> +			AM62DX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
> +		>;
> +	};
> +};
> +
> +/* WKUP UART0 is used for DM firmware logs */
> +&wkup_uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_uart0_pins_default>;
> +	status = "reserved";
> +};
> +
> +&main_pmx0 {
> +	main_uart0_pins_default: main-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01c8, PIN_INPUT, 0) /* (E14) UART0_RXD */
> +			AM62DX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
> +		>;
> +	};
> +
> +	main_i2c0_pins_default: main-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
> +			AM62DX_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (E16) I2C0_SDA */
> +		>;
> +	};
> +
> +	main_i2c1_pins_default: main-i2c1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C17) I2C1_SCL */
> +			AM62DX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (E17) I2C1_SDA */
> +		>;
> +	};
> +
> +	main_i2c2_pins_default: main-i2c2-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (M22) GPMC0_CSn2.I2C2_SCL */
> +			AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
> +		>;
> +	};
> +
> +	main_mmc1_pins_default: main-mmc1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
> +			AM62DX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (E22) MMC1_CLK */
> +			AM62DX_IOPAD(0x0230, PIN_INPUT, 0) /* (B22) MMC1_DAT0 */
> +			AM62DX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (D21) MMC1_DAT1 */
> +			AM62DX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (C22) MMC1_DAT2 */
> +			AM62DX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (D22) MMC1_DAT3 */
> +			AM62DX_IOPAD(0x0240, PIN_INPUT, 0) /* (E18) MMC1_SDCD */
> +			AM62DX_IOPAD(0x0244, PIN_INPUT, 0) /* (D18) MMC1_SDWP */
> +		>;
> +	};
> +
> +	main_mdio1_pins_default: main-mdio1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x160, PIN_OUTPUT, 0) /* (V12) MDIO0_MDC */
> +			AM62DX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
> +		>;
> +	};
> +
> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
> +		>;
> +	};
> +
> +	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_IOPAD(0x1F4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */
> +		>;
> +	};
> +};
> +
> +&mcu_pmx0 {
> +	status = "okay";
> +
> +	pmic_irq_pins_default: pmic-irq-default-pins {
> +		pinctrl-single,pins = <
> +			AM62DX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
> +		>;
> +	};
> +};
> +
> +&mcu_gpio0 {
> +	status = "okay";
> +};
> +
> +&main_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +
> +	typec_pd0: usb-power-controller@3f {
> +		compatible = "ti,tps6598x";
> +		reg = <0x3f>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			self-powered;
> +			data-role = "dual";
> +			power-role = "sink";
> +			port {
> +				usb_con_hs: endpoint {
> +					remote-endpoint = <&usb0_hs_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	exp1: gpio@22 {
> +		compatible = "ti,tca6424";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio1>;
> +		interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
> +
> +		gpio-line-names = "GPIO_CPSW2_RST", "GPIO_CPSW1_RST",
> +			"MMC1_SD_EN", "VPP_EN",
> +			"GPIO_DIX_RST", "IO_EXP_OPT_EN",
> +			"DIX_INT", "GPIO_eMMC_RSTn",
> +			"CPLD2_DONE", "CPLD2_INTN",
> +			"CPLD1_DONE", "CPLD1_INTN",
> +			"USB_TYPEA_OC_INDICATION", "PCM1_INT",
> +			"PCM2_INT", "GPIO_PCM1_RST",
> +			"TEST_GPIO2", "GPIO_PCM2_RST",
> +			"IO_MCAN0_STB", "IO_MCAN1_STB",
> +			"PD_I2C_IRQ", "IO_EXP_TEST_LED";
> +	};
> +
> +	exp2: gpio@23 {
> +		compatible = "ti,tca6424";
> +		reg = <0x23>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names = "", "DAC_LAT_CTRL",
> +			"CPLD1_JTAGENB", "CPLD1_PROGRAMN",
> +			"CPLD2_JTAGENB", "CPLD2_PROGRAMN",
> +			"", "",
> +			"", "",
> +			"", "",
> +			"", "",
> +			"", "",
> +			"", "",
> +			"SoC_I2C0_SCL", "SoC_I2C0_SDA";
> +	};
> +};
> +
> +&main_i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c1_pins_default>;
> +	clock-frequency = <100000>;
> +	bootph-all;

I'm not seeing other any other boot phase flags? What are you using to 
boot this board?

~Bryan

> +};
> +
> +&main_i2c2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c2_pins_default>;
> +	clock-frequency = <400000>;
> +};
> +
> +&sdhci1 {
> +	/* SD/MMC */
> +	status = "okay";
> +	vmmc-supply = <&vdd_mmc1>;
> +	vqmmc-supply = <&vddshv_sdio>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mmc1_pins_default>;
> +	disable-wp;
> +};
> +
> +&main_gpio0 {
> +	status = "okay";
> +};
> +
> +&main_gpio1 {
> +	status = "okay";
> +};
> +
> +&main_gpio_intr {
> +	status = "okay";
> +};
> +
> +&main_uart0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_uart0_pins_default>;
> +};
> +
> +&usb0 {
> +	usb-role-switch;
> +
> +	port {
> +		usb0_hs_ep: endpoint {
> +			remote-endpoint = <&usb_con_hs>;
> +		};
> +	};
> +};
> +
> +&mailbox0_cluster0 {
> +	status = "okay";
> +
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster1 {
> +	status = "okay";
> +
> +	mbox_c7x_0: mbox-c7x-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster2 {
> +	status = "okay";
> +
> +	mbox_mcu_r5_0: mbox-mcu-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
> +&c7x_0 {
> +	status = "okay";
> +
> +	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
> +	memory-region = <&c7x_0_dma_memory_region>,
> +			<&c7x_0_memory_region>;
> +};
> +
> +/* main_rti4 is used by C7x DSP */
> +&main_rti4 {
> +	status = "reserved";
> +};
> +
> +/* main_timer2 is used by C7x DSP */
> +&main_timer2 {
> +	status = "reserved";
> +};
> -- 
> 2.34.1
> 
