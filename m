Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF538632B;
	Sun,  1 Jun 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748795621; cv=pass; b=qg9fk8f6ygyVnhM9UVRQcWV2XeO8fr7/Rs04+f0xOzt9btuq8eGC3uWYkzheQeuiAnjFjslVsZjKSDCkOJ6FYxaTS8vou5euewLPiOU/CrhA8yg4SqOKE+ii3bTF7XcG/1gaeTM256p4FV15uBcqediYA2BpofwvKqpYPlAs6BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748795621; c=relaxed/simple;
	bh=hyX0oe0pG6Vsq3PLDtnCTJ8sMK2SyCeS6nNXBrsTcr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNemXixRzW2SguU6XO9PTe3C8JcNLYllxskwT+tobcx2rwEebHp2uyVxaeyIMJvPFfDevLeQ2kGuJ66lBgLrvD95HKGfUEj2MUTn22vvvXZ+2yXBahsjz0404wVjBfwPzhcSKWJ4qp+42hQ0ICIFMo5i7bTZtzLMawO4Ltj7qo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=aPuIVTZ1; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="aPuIVTZ1"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-k6s3.prod.antispam.mailspamprotection.com; s=arckey; t=1748795618;
	 b=WkAthlr3AWJDoPxSPJzIeMHcSMzYNDOt1vVF63vezU6BENyWubMpi19z1A1amv2cRvzQSwDa5Y
	  nll3jhl7MmsF2oC1Zf6dw76n+ZBeNxs3chBqohT0pnlSvtfDn+TxmLbk5lT2xNvxDPQ4JIgvDE
	  /XovxJ5Vf8rqT3jih2HAh6djPOuXyCz23AEZf1BBZ9p1eTGpjz9jwwY+Jm0DSGjRnFE+WvOdQ9
	  hGQ5jpq8uljZs+oozE0GYr7B3XlDsaN2iA6AX++xNuYSOae91Ht5dTkjX1m2E3TZqSk2bpezLa
	  lHMETnyTMFYx9RMciVAbPsA8nJS20yIS+uYgx/WJCCkkEw==;
ARC-Authentication-Results: i=1; instance-europe-west4-k6s3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-k6s3.prod.antispam.mailspamprotection.com; s=arckey; t=1748795618;
	bh=hyX0oe0pG6Vsq3PLDtnCTJ8sMK2SyCeS6nNXBrsTcr0=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=KT21k880olsjz4XoBxXsoIJOg1jQUtIT+SwQv1rUCI8U2oEP77+NWmAMIEe5/L2ohp7utDzFjt
	  Hg3dk8qtw5Ta9gDyyxQJTeZ8Vlt2lkxFhNXhWn7RjzzsEkh+5ivVHYR49AZ8tKp3+ZsV2J/mbS
	  N74cjBIezHrXhFXgkIQuhc8GggqOvFE1yvjo/CuXwYwmERm4482hG9QJIUf5wZi1AoqZKBiOEy
	  CdrOn1ZTo/clOfAmD2bZZZZCDOWfhU9Syhacaw7lE9LVxbzndVmf0lvrUVRUniMk1BnZw5zZBW
	  dJiXUEoej/v1Jci7/dGEHUioiDaLMipxUz+775byDBy/QQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-k6s3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uLj1R-000000003vK-2UPH;
	Sun, 01 Jun 2025 13:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=U79QuXFFktSAvezW8CQRQoUYu94MbH3LzV8ewvquYpk=; b=aPuIVTZ1OI6f/CVtO4WFOQCb7E
	zuW2E9UOFfIFVIQ+Ma9okJi2/D2wlFOqt+jMOBCQrwDqvHu9lxB/thsR4cPCeUjZSKlQU8ulwoSIm
	ZtuPnkInh4W8qfB0BWErLl7IB3GNP5FM0H29Lmb4MlSRbSZzAEBhnShI9iTH38MYAaqE=;
Received: from [79.25.253.201] (port=63262 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uLj1L-00000000Fzz-2rgi;
	Sun, 01 Jun 2025 13:46:39 +0000
From: Francesco Valla <francesco@valla.it>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v2 2/2] arm64: dts: freescale: add support for NXP i.MX93 FRDM
Date: Sun, 01 Jun 2025 15:46:38 +0200
Message-ID: <7210383.9J7NaK4W3v@fedora.fritz.box>
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
References:
 <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de>
 <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b6492df848140ffdac70862e96cd70b8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-k6s3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Fabian,

On Monday, 26 May 2025 at 13:02:36 Fabian Pflug <f.pflug@pengutronix.de> wrote:
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
> 
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
> 
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
> 
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 613 +++++++++++++++++++++
>  2 files changed, 614 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index b6d3fe26d621234ab84353165d20af9d2536f839..c703fce2ebfd8074bd0c6ee76f3c6f9bbd9cf179 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -295,6 +295,7 @@ imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>  
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc6348858024d833a450a6b5d2e54e4fefe9e9cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -0,0 +1,613 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx93.dtsi"
> +
> +/ {
> +	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
> +	model = "NXP i.MX93 11X11 FRDM board";
> +
> +	aliases {
> +		mmc0 = &usdhc1; /* EMMC */
> +		mmc1 = &usdhc2; /* uSD */
> +		rtc0 = &pcf2131;
> +		serial0 = &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-name = "vref_1v8";
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		off-on-delay-us = <12000>;
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		pinctrl-names = "default";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "VSD_3V3";
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "WLAN_EN";
> +		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us = <20000>;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x30000000>;
> +			reusable;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +
> +		rsc_table: rsc-table@2021e000 {
> +			reg = <0 0x2021e000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0vring0: vdev0vring0@a4000000 {
> +			reg = <0 0xa4000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@a4008000 {
> +			reg = <0 0xa4008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@a4010000 {
> +			reg = <0 0xa4010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@a4018000 {
> +			reg = <0 0xa4018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@a4020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0xa4020000 0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +&cm33 {
> +	mboxes = <&mu1 0 1>,
> +		 <&mu1 1 1>,
> +		 <&mu1 3 1>;
> +	mbox-names = "tx", "rx", "rxdb";
> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	status = "okay";
> +};

Testing this on the actual hardware, I have a deferred probe for the cm33
remoteproc, and that's because mu1 is disabled on the parent dtsi.

I am seeing this error on startup:

[   19.076704] platform remoteproc-cm33: deferred probe pending: imx-rproc: failed to request tx mailbox channel

and then, every time a new device is registered (e.g., when connecting a
USB device):

[   68.473051] remoteproc remoteproc0: releasing imx-rproc


Please consider adding:

&mu1 {
	status = "okay";
};

> +
> +&eqos {
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			reg = <1>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	phy-handle = <&ethphy2>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy2: ethernet-phy@2 {
> +			reg = <2>;
> +			eee-broken-1000t;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&lpi2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pcal6524: gpio@22 {
> +		compatible = "nxp,pcal6524";
> +		reg = <0x22>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		pinctrl-0 = <&pinctrl_pcal6524>;
> +		pinctrl-names = "default";
> +	};
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9451a";
> +		reg = <0x25>;
> +		interrupt-parent = <&pcal6524>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +
> +		regulators {
> +
> +			buck1: BUCK1 {
> +				regulator-name = "BUCK1";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <650000>;
> +				regulator-max-microvolt = <2237500>;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-name = "BUCK2";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck4: BUCK4 {
> +				regulator-name = "BUCK4";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			buck5: BUCK5 {
> +				regulator-name = "BUCK5";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-name = "BUCK6";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +
> +			ldo4: LDO4 {
> +				regulator-name = "LDO4";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-name = "LDO5";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +			};
> +		};
> +	};
> +
> +	eeprom: eeprom@50 {
> +		compatible = "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +	};
> +};
> +
> +&lpi2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec1_con: connector {
> +			compatible = "usb-c-connector";
> +			data-role = "dual";
> +			label = "USB-C";
> +			op-sink-microwatt = <15000000>;
> +			power-role = "dual";
> +			self-powered;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec1_dr_sw: endpoint {
> +						remote-endpoint = <&usb1_drd_sw>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	pcf2131: rtc@53 {
> +		compatible = "nxp,pcf2131";
> +		reg = <0x53>;
> +		interrupt-parent = <&pcal6524>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&lpuart1 { /* console */
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	adp-disable;
> +	disable-over-current;
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +
> +	port {
> +
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	bus-width = <8>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
> +			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> +			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> +			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> +			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> +			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> +			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
> +			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> +			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> +			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
> +			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> +			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> +			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
> +			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqossleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
> +			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> +			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> +			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> +			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
> +			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
> +			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
> +			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
> +			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
> +			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
> +			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
> +			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
> +		>;
> +	};

You have a mixture of spaces and tabs in this block (probably inherited by
the vendor's DT).

> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
> +			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
> +			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
> +			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
> +			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
> +			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
> +			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
> +			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
> +			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
> +			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
> +			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
> +			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
> +			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
> +			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
> +		>;
> +	};
> +
> +	pinctrl_fec_sleep: fecsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
> +			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
> +			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
> +			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
> +			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
> +			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
> +			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> +			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
> +			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
> +			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
> +			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
> +			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
> +			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> +			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> +		>;
> +	};

Same here.

> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> +			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
> +			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_pcal6524: pcal6524grp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
> +			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e

And here.

> +			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> +			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> +			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> +			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> +			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> +			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> +		>;
> +	};
> +};
> 
> 

Thank you for your work!

Regards,
Francesco




