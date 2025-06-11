Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C23523099C;
	Wed, 11 Jun 2025 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632791; cv=none; b=Iwz5q9X1fepKmJ2B8vUu9PTQV2LwzVTK6TjlQce+9uG3aeKEo8IExDOYp6/ZLDMWXafYETLuCYVORE6/ABu0zUgVgBIEp+LMssmKpkNaQl3eiZk3VEhk48X1+JBAgcqnxJ6M5ab8phkgWSXx7hHe9JegI/+XJda9oHn97DwkkCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632791; c=relaxed/simple;
	bh=ILdLKI2m2Lpj+vngzG3hW+QrwaRDZjlb+wBI9RV283k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3Pv18KTRn7VuvxuYh88tl1/IQxdgBwDAtXuJsGWFLNDZOYO0K0mTF9cH3VCpLY072N8BBwL4dEqifkIythzsZmiihfoIzIbyOIFhUZ5hQdJDX0iSFu3kJwJMxQMlv48OYf9srfhr9YLOjPrX7VFxIQOCEyzqbFsz1sAGRXOCpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=B/dq6jNI; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="B/dq6jNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sSuWTJW5AO5PPyIDz5eBG5iOJG/lVglqsG2HwaWm5RA=;
	b=B/dq6jNIlicoCug8bep35cBJw6Z6grPioclccKShwtIGGDAiSbovtrcRVM3c/i
	DjxncVlmxJa6dm2ZYSNa9FqmMevKWKz67qPUchJPhVYqnPMSvATOjo1gGWGPuEka
	yXlle5wLavForjoxDNc2IVV6UpPKlP/n8zfK5L4hIn2Zg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDH7zrbRklok3lnAA--.5090S3;
	Wed, 11 Jun 2025 17:05:32 +0800 (CST)
Date: Wed, 11 Jun 2025 17:05:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Max Merchel <Max.Merchel@tq-group.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ls1012a: add DTS for TQMLS1012al
 module with MBLS1012AL board
Message-ID: <aElG2j8OlA/X6CrV@dragon>
References: <20250430120605.2068102-1-alexander.stein@ew.tq-group.com>
 <20250430120605.2068102-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430120605.2068102-2-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgDH7zrbRklok3lnAA--.5090S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3Zw1xWrWkuFyfAw4rGFW8Xrb_yoW8JFyrZo
	WayF4q9ayrW3y7Zwnrtry2gF1jyr4kXw45Kay7XF4fWa1YvrWqy34jvw4IvFWDur43Kryk
	Wa43Xa48Ca1Yv3s5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8YFADUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx1pZWhJDc-lQQAAsd

On Wed, Apr 30, 2025 at 02:06:01PM +0200, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> Add initial support for TQMLS1012AL module mounted on MBLS1012AL.
> It supports UART1 for console, PCIe, I2C, USB, µSD card (default), SATA
> and QSPI.
> There is an alternative ordering option which provides an eMMC instead of
> an SD card. This uses a different DT instead.
> Due missing Packet Forwarding Engine (PFE) driver support, there is no
> support for Ethernet so far.
> 
> Signed-off-by: Max Merchel <Max.Merchel@tq-group.com>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Be a bit more specific with lm75 compatible
> * Remove m25p,fast-read from spi-nor flash
> 
>  arch/arm64/boot/dts/freescale/Makefile        |   2 +
>  ...sl-ls1012a-tqmls1012al-mbls1012al-emmc.dts |  21 ++
>  .../fsl-ls1012a-tqmls1012al-mbls1012al.dts    | 346 ++++++++++++++++++
>  .../freescale/fsl-ls1012a-tqmls1012al.dtsi    |  73 ++++
>  4 files changed, 442 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index bf575395d7d5b..f6b8686ed3cfe 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -5,6 +5,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-frwy.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-oxalis.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-rdb.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-tqmls1012al-mbls1012al.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-kbox-a-230-ls.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var1.dtb
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
> new file mode 100644
> index 0000000000000..82dc0a7c7d535
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Matthias Schiffer
> + * Author: Max Merchel
> + */
> +
> +#include "fsl-ls1012a-tqmls1012al-mbls1012al.dts"
> +
> +&esdhc0 {
> +	vqmmc-supply = <&reg_1p8v>;
> +	/delete-property/ no-mmc;
> +	disable-wp;

disable-wp is already present in esdhc0 of mbls1012al.dts?

> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	no-sdio;

no-sdio too?

> +	no-sd;
> +	voltage-ranges = <1800 1800>;
> +	non-removable;
> +};

What about the following sd properties?  We don't need them for eMMC
device, do we?

	sd-uhs-sdr104;
	sd-uhs-sdr50;
	sd-uhs-sdr25;
	sd-uhs-sdr12;

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
> new file mode 100644
> index 0000000000000..147c7ca130c44
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Matthias Schiffer
> + * Author: Max Merchel
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "fsl-ls1012a-tqmls1012al.dtsi"
> +
> +/ {
> +	model = "TQ-Systems TQMLS1012AL on MBLS1012AL";
> +	compatible = "tq,ls1012a-tqmls1012al-mbls1012al", "tq,ls1012a-tqmls1012al", "fsl,ls1012a";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &duart0;

Can we sort it alphabetically?

> +		/* use MAC from U-Boot environment */
> +		/* TODO: PFE */
> +		ethernet2 = &swport0;
> +		ethernet3 = &swport1;
> +		ethernet4 = &swport2;
> +		ethernet5 = &swport3;
> +		spi0 = &qspi;
> +	};
> +
> +	chosen {
> +		stdout-path = &duart0;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		switch-1 {
> +			label = "S2";
> +			linux,code = <BTN_0>;
> +			gpios = <&gpio_exp_3p3v 13 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		switch-2 {
> +			label = "X15";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpio_exp_1p8v 5 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		switch-3 {
> +			label = "X16";
> +			linux,code = <BTN_2>;
> +			gpios = <&gpio_exp_1p8v 4 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio_exp_3p3v 14 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_exp_3p3v 15 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "default-on";
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			/* 64 MiB */
> +			size = <0 0x04000000>;
> +			/*  512 - 128 MiB, our minimum RAM config will be 512 MiB */
> +			alloc-ranges = <0 0x80000000 0 0x98000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	reg_1p5v: regulator-1p5v {

It doesn't seem to be used.

> +		compatible = "regulator-fixed";
> +		regulator-name = "1P5V";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&duart0 {
> +	status = "okay";
> +};
> +
> +&esdhc0 {
> +	vmmc-supply = <&reg_3p3v>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr12;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	lm75_48: temperature-sensor@48 {
> +		compatible = "national,lm75a";
> +		reg = <0x48>;
> +		vs-supply = <&reg_3p3v>;
> +	};
> +
> +	gpio_exp_3p3v: gpio-expander@20 {

Please sort I2C devices in order of slave address.

Shawn

> +		compatible = "nxp,pca9555";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		vcc-supply = <&reg_3p3v>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		gpio-line-names = "", "", "GPIO_3V3_3", "",
> +				  "", "", "", "",
> +				  "", "GPIO_3V3_1", "GPIO_3V3_2", "",
> +				  "", "", "", "";
> +
> +		wlan-disable-hog {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "WLAN_DISABLE#";
> +		};
> +
> +		vcc-pcie-en-3v3-hog {
> +			gpio-hog;
> +			gpios = <1 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "VCC_PCIE_EN_3V3";
> +		};
> +
> +		vcc-wlan-en-3v3-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "VCC_WLAN_EN_3V3";
> +		};
> +
> +		pcie-rst-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "PCIE_RST#";
> +		};
> +
> +		wlan-rst-hog {
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "WLAN_RST#";
> +		};
> +
> +		pcie-dis-hog {
> +			gpio-hog;
> +			gpios = <11 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "PCIE_DIS#";
> +		};
> +
> +		pcie-wake-hog {
> +			gpio-hog;
> +			gpios = <12 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "PCIE_WAKE#";
> +		};
> +	};
> +
> +	gpio_exp_1p8v: gpio-expander@70 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x70>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		vcc-supply = <&reg_1p8v>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		gpio-line-names = "PCIE_CLK_PD#", "PMIC_INT#", "ETH_SW_INT#", "",
> +				  "", "", "", "",
> +				  "", "GPIO_3V3_1", "GPIO_3V3_2", "",
> +				  "", "", "", "";
> +
> +		/* do not change PCIE_CLK_PD */
> +		pcie-clk-pd-hog {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "PCIE_CLK_PD#";
> +		};
> +
> +		pmic-int-hog {
> +			gpio-hog;
> +			gpios = <1 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "PMIC_INT#";
> +		};
> +
> +		eth-sw-int-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "ETH_SW_INT#";
> +		};
> +
> +		eth-link-pwrdwn-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "ETH_LINK_PWRDWN#";
> +		};
> +
> +		vcc-wlan-en-1v5-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "VCC_WLAN_EN_1V5";
> +		};
> +
> +		vcc-pcie-en-1v5-hog {
> +			gpio-hog;
> +			gpios = <7 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "VCC_PCIE_EN_1V5";
> +		};
> +	};
> +
> +	switch@5f {
> +		compatible = "microchip,ksz9897";
> +		reg = <0x5f>;
> +		reset-gpios = <&gpio_exp_3p3v 7 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			swport0: port@0 {
> +				reg = <0>;
> +				label = "swp0";
> +				phy-mode = "internal";
> +			};
> +
> +			swport1: port@1 {
> +				reg = <1>;
> +				label = "swp1";
> +				phy-mode = "internal";
> +			};
> +
> +			swport2: port@2 {
> +				reg = <2>;
> +				label = "swp2";
> +				phy-mode = "internal";
> +			};
> +
> +			swport3: port@3 {
> +				reg = <3>;
> +				label = "swp3";
> +				phy-mode = "internal";
> +			};
> +
> +			port@6 {
> +				reg = <6>;
> +				label = "cpu";
> +				/* TODO: PFE */
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <1500>;
> +				tx-internal-delay-ps = <1500>;
> +
> +				fixed-link {
> +					speed = <1000>;
> +					full-duplex;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +/* TODO: PFE */
> +
> +&sata {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb451,8142";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio_exp_3p3v 6 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_vcc_3v3>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb451,8140";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&gpio_exp_3p3v 6 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_vcc_3v3>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
> new file mode 100644
> index 0000000000000..5f6ee8fd4094b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Matthias Schiffer
> + * Author: Max Merchel
> + */
> +
> +#include "fsl-ls1012a.dtsi"
> +
> +/ {
> +	compatible = "tq,ls1012a-tqmls1012al", "fsl,ls1012a";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/*  our minimum RAM config will be 512 MiB */
> +		reg = <0x00000000 0x80000000 0 0x20000000>;
> +	};
> +
> +	reg_vcc_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	jc42_19: temperature-sensor@19 {
> +		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg = <0x19>;
> +	};
> +
> +	m24c64_50: eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_vcc_3v3>;
> +	};
> +
> +	m24c02_51: eeprom@51 {
> +		compatible = "nxp,se97b", "atmel,24c02";
> +		reg = <0x51>;
> +		pagesize = <16>;
> +		read-only;
> +		vcc-supply = <&reg_vcc_3v3>;
> +	};
> +
> +	rtc1: rtc@68 {
> +		compatible = "dallas,ds1339";
> +		reg = <0x68>;
> +	};
> +};
> +
> +&qspi {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <39000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> -- 
> 2.43.0
> 

