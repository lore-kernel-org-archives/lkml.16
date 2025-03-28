Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62171B4257;
	Fri, 28 Mar 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175289; cv=none; b=VIXolLYF45Kv6XXQRBtDJia9l91SC6eIaG8hkBCdtppUBVLiZ8H+eY26mdxFAh9ZOqXC2KEc1hIs8MGIPfWVmvNeo005AyEjDjLVlZMp2yywJMwyUFxyztrzL9qKo7TVOes+XSj7BxO7XVHpez8xDcv6ap0HsLIOgFaYaPjE4YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175289; c=relaxed/simple;
	bh=VhPm2s6F8u50aVYbaCa6/EYrQ2WdUIRZwvMuwy2pwbE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXwr8A3c7mXDV9Vu4mZQH+eVpCirGTV2nDsX5pp9RAZimq+YTYBMV11CgdXK41fqiYZMe81KNfJfaLoDWJUYVeknQ7GmU7k6eAeTl4PxXmzE516FZO4hd5r/KbMfT5SUu+7F5YCUkwb3jaN4ou1YZ690zImv+fIb/x9QX5UHUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HR0T81It; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HR0T81It"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SFLCsP2195666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 10:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743175272;
	bh=Lu7OQHrwsF2ia/OLiHFgjNKQ6t/ACm/lnjgCvTJD/OM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HR0T81ItniugJhjhJ0zhVxuByYwLpIJ8maACasCnOVMH5I+EJUY/wHDu2F5ZHOOSm
	 2cArtAf2cjQD74gW8B4/i4wzE8DhNLLEmcZ5IjFrrzjdcn/0bmH5M0GnkIA0Yf5d2S
	 /fFLmwR5NquI+UMeVv6XOrc/wJ5MN0kBbp/wYbPw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SFLCBQ097515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 10:21:12 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 10:21:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 10:21:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SFLChf124302;
	Fri, 28 Mar 2025 10:21:12 -0500
Date: Fri, 28 Mar 2025 10:21:12 -0500
From: Nishanth Menon <nm@ti.com>
To: Wadim Egorov <w.egorov@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am62x-phyboard-lyra: Add boot
 phase tags
Message-ID: <20250328152112.lh7i3rgkkmhzekzi@kimono>
References: <20250305085537.3976579-1-w.egorov@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250305085537.3976579-1-w.egorov@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 09:55-20250305, Wadim Egorov wrote:
> The bootph-all and bootph-pre-ram tags were introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across different
> boot phases.
> 
> Add boot phase tags to all required nodes to ensure boot support from
> all sources, including UART, USB (DFU), Ethernet, uSD card, eMMC, and
> OSPI NOR Flash.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
> v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2025-February/1006239.html
> v2:
>   - Add bootph-all to cpsw_port1 and main_pktma 
>   - Remove bootph-all from cpsw3g
> ---
>  arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi   | 15 +++++++++++++++
>  .../arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi |  9 +++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> index 2ef4cbaec789..effab2f810c2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> @@ -29,6 +29,7 @@ aliases {
>  	memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> +		bootph-all;
>  	};
>  
>  	reserved_memory: reserved-memory {
> @@ -131,6 +132,7 @@ main_i2c0_pins_default: main-i2c0-default-pins {
>  			AM62X_IOPAD(0x1e0, PIN_INPUT_PULLUP, 0) /* (B16) I2C0_SCL */
>  			AM62X_IOPAD(0x1e4, PIN_INPUT_PULLUP, 0) /* (A16) I2C0_SDA */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_mdio1_pins_default: main-mdio1-default-pins {
> @@ -138,6 +140,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
>  			AM62X_IOPAD(0x160, PIN_OUTPUT, 0) /* (AD24) MDIO0_MDC */
>  			AM62X_IOPAD(0x15c, PIN_INPUT, 0) /* (AB22) MDIO0_MDIO */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_mmc0_pins_default: main-mmc0-default-pins {
> @@ -153,6 +156,7 @@ AM62X_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (AC1) MMC0_DAT5 */
>  			AM62X_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (AD2) MMC0_DAT6 */
>  			AM62X_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_rgmii1_pins_default: main-rgmii1-default-pins {
> @@ -170,6 +174,7 @@ AM62X_IOPAD(0x140, PIN_OUTPUT, 0) /* (AD18) RGMII1_TD3 */
>  			AM62X_IOPAD(0x130, PIN_OUTPUT, 0) /* (AE19) RGMII1_TXC */
>  			AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19) RGMII1_TX_CTL */
>  		>;
> +		bootph-all;
>  	};
>  
>  	ospi0_pins_default: ospi0-default-pins {
> @@ -186,6 +191,7 @@ AM62X_IOPAD(0x024, PIN_INPUT, 0) /* (H25) OSPI0_D6 */
>  			AM62X_IOPAD(0x028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
>  			AM62X_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
>  		>;
> +		bootph-all;
>  	};
>  
>  	pmic_irq_pins_default: pmic-irq-default-pins {
> @@ -210,6 +216,7 @@ &cpsw3g {
>  &cpsw_port1 {
>  	phy-mode = "rgmii-rxid";
>  	phy-handle = <&cpsw3g_phy1>;
> +	bootph-all;
>  };
>  
>  &cpsw3g_mdio {
> @@ -220,6 +227,7 @@ &cpsw3g_mdio {
>  	cpsw3g_phy1: ethernet-phy@1 {
>  		compatible = "ethernet-phy-id2000.a231", "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> +		bootph-all;
>  		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>  		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>  	};
> @@ -232,10 +240,15 @@ mbox_m4_0: mbox-m4-0 {
>  	};
>  };
>  
> +&main_pktdma {
> +	bootph-all;
> +};
> +
>  &main_i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_i2c0_pins_default>;
>  	clock-frequency = <400000>;
> +	bootph-all;

please review closer the series to ensure that no parent node has a
bootph property if the child node has it.

>  	status = "okay";
>  
>  	pmic@30 {
> @@ -355,6 +368,7 @@ serial_flash: flash@0 {
>  		cdns,tchsh-ns = <60>;
>  		cdns,tslch-ns = <60>;
>  		cdns,read-delay = <0>;
> +		bootph-all;
>  	};
>  };
>  
> @@ -363,5 +377,6 @@ &sdhci0 {
>  	pinctrl-0 = <&main_mmc0_pins_default>;
>  	disable-wp;
>  	non-removable;
> +	bootph-all;
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
> index 922cad14c9f8..aab74d6019b0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
> @@ -138,6 +138,7 @@ vcc_3v3_mmc: regulator-vcc-3v3-mmc {
>  		regulator-max-microvolt = <3300000>;
>  		regulator-always-on;
>  		regulator-boot-on;
> +		bootph-all;
>  	};
>  
>  	vcc_3v3_sw: regulator-vcc-3v3-sw {
> @@ -233,6 +234,7 @@ AM62X_IOPAD(0x228, PIN_INPUT_PULLUP, 0) /* (C21) MMC1_DAT2 */
>  			AM62X_IOPAD(0x224, PIN_INPUT_PULLUP, 0) /* (D22) MMC1_DAT3 */
>  			AM62X_IOPAD(0x240, PIN_INPUT_PULLUP, 0) /* (D17) MMC1_SDCD */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_rgmii2_pins_default: main-rgmii2-default-pins {
> @@ -257,6 +259,7 @@ main_uart0_pins_default: main-uart0-default-pins {
>  			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14) UART0_RXD */
>  			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14) UART0_TXD */
>  		>;
> +		bootph-all;
>  	};
>  
>  	main_uart1_pins_default: main-uart1-default-pins {
> @@ -266,6 +269,7 @@ AM62X_IOPAD(0x198, PIN_OUTPUT, 2) /* (A19) MCASP0_AXR2.UART1_RTSn */
>  			AM62X_IOPAD(0x1ac, PIN_INPUT, 2) /* (E19) MCASP0_AFSR.UART1_RXD */
>  			AM62X_IOPAD(0x1b0, PIN_OUTPUT, 2) /* (A20) MCASP0_ACLKR.UART1_TXD */
>  		>;
> +		bootph-pre-ram;
>  	};
>  
>  	main_usb1_pins_default: main-usb1-default-pins {
> @@ -430,12 +434,14 @@ &main_mcan0 {
>  &main_uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_uart0_pins_default>;
> +	bootph-all;
>  	status = "okay";
>  };
>  
>  &main_uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_uart1_pins_default>;
> +	bootph-pre-ram;
>  	/* Main UART1 may be used by TIFS firmware */
>  	status = "okay";
>  };
> @@ -467,11 +473,13 @@ &sdhci1 {
>  	pinctrl-0 = <&main_mmc1_pins_default>;
>  	disable-wp;
>  	no-1-8-v;
> +	bootph-all;
>  	status = "okay";
>  };
>  
>  &usbss0 {
>  	ti,vbus-divider;
> +	bootph-all;
>  	status = "okay";
>  };
>  
> @@ -482,6 +490,7 @@ &usbss1 {
>  
>  &usb0 {
>  	usb-role-switch;
> +	bootph-all;
>  
>  	port {
>  		typec_hs: endpoint {
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
