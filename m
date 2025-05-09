Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694B924418E;
	Fri,  9 May 2025 02:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757381; cv=none; b=iN9h8Kx/DpX14S1lxIgstuOT+1mDpxCl4YzdbqrDRczrsPDwf7F2hrISBvWZWYfG8jBPgK24BP053af6aospKRi5NFs854cgX/a/RR9KBGQK7N1ilMbbpEV6aF7q79NC59uiWdNcEjSbNpx7Eqmk6XsJA0VAQS0T/r5/TggCOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757381; c=relaxed/simple;
	bh=ZKYweIfZRDSsVY52UxgJMfHnSirWTStA+X1lIT12Xtc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiT7H7uzlnDXYhr7I6XXyAaF6auG7MancwX2zYpHlVaXi00QL+pjjJK5lsEDzO4KtbtvFXV3T5U2qqORy+3cR4nM3eZKjl/OkHYiJCygxb/AKXhY/S9aFXt9ZwiBvORTaVMO6xaVdQEUqXTunq7/S/JsojkaPMQqHS95jf4amgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d1Pzj3K5; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d1Pzj3K5"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5492Mjul1818134
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 21:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746757365;
	bh=RTdsDw764SPk1SUnJqLCIhsWniwI5+pgo1yIF5z3JSY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=d1Pzj3K5BEMxHCUya+RHixZxzRZG7bU0mo47ZFF91mhHJH++NTVrCbfje0YK85OrZ
	 2mGlmmhmpz+s79DQbiFFZ9YKIISET+hSD/axbV3zDmjR+iHuEeDtZ1c6lhRrn9O/KZ
	 XzFh+zt+RjzE0NsEeqytkm20I8gnzFgDjbZdjsdQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5492Mjs4016259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 21:22:45 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 21:22:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 21:22:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5492Miv1113142;
	Thu, 8 May 2025 21:22:44 -0500
Date: Thu, 8 May 2025 21:22:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-j722s-evm: Add overlay for
 quad IMX219
Message-ID: <20250509022244.pwdcwy3hra7ybmvu@scouts>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250508155134.2026300-4-y-abhilashchandra@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 21:21-20250508, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> RPi v2 Camera (IMX219) is an 8MP camera that can be used with J722S EVM
> through the 22-pin CSI-RX connector. Add a reference overlay for quad
> IMX219 RPI camera v2 modules on J722S EVM
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   5 +
>  ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 329 ++++++++++++++++++
>  2 files changed, 334 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 3c3aa09a94b6..b317eaff64cc 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>  # Boards with J722s SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>  
>  # Boards with J784s4 SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> @@ -227,6 +228,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtbo
>  k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
>  	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
> +k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
> +	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo

I should have caught this earlier.. but anyway.. i missed.. but:

Here and..
>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
> @@ -264,6 +267,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
>  	k3-j742s2-evm-usb0-type-a.dtb \
> +	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
Here..
We have kept this alpha sorted so far. Please stick with the
convention - keeps us all sane.


>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>  	k3-j784s4-evm-usb0-type-a.dtb \
> @@ -288,5 +292,6 @@ DTC_FLAGS_k3-j721e-common-proc-board += -@
>  DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
>  DTC_FLAGS_k3-j721e-sk += -@
>  DTC_FLAGS_k3-j721s2-common-proc-board += -@
> +DTC_FLAGS_k3-j722s-evm += -@

I think you got this one fine.

>  DTC_FLAGS_k3-j784s4-evm += -@
>  DTC_FLAGS_k3-j742s2-evm += -@

I know this is an aberration.. but anyways.. just one off..

> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
> new file mode 100644
> index 000000000000..5e5f08dd2ba9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * DT Overlay for RPi Camera V2.1 on J722S-EVM board.
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + *
> + * Schematics: https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&main_pmx0 {
> +	cam0_reset_pins_default: cam0-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x03c, PIN_OUTPUT, 7) /* (R22) GPIO0_15 */
> +		>;
> +	};
> +
> +	cam1_reset_pins_default: cam1-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x044, PIN_OUTPUT, 7) /* (R26) GPIO0_17 */
> +		>;
> +	};
> +
> +	cam2_reset_pins_default: cam2-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x04c, PIN_OUTPUT, 7) /* (T25) GPIO0_19 */
> +		>;
> +	};
> +
> +	cam3_reset_pins_default: cam3-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x054, PIN_OUTPUT, 7) /* (T21) GPIO0_21 */
> +		>;
> +	};
> +};
> +
> +&{/} {
> +	clk_imx219_fixed: clock-24000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_exp>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3_exp>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc_3v3_exp>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&csi01_mux {
> +	idle-state = <1>;
> +};
> +
> +&csi23_mux {
> +	idle-state = <1>;
> +};
> +
> +&pca9543_0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* CAM0 I2C */
> +	i2c@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +
> +		imx219_0: sensor@10 {
> +			compatible = "sony,imx219";
> +			reg = <0x10>;
> +
> +			clocks = <&clk_imx219_fixed>;
> +
> +			VANA-supply = <&reg_2p8v>;
> +			VDIG-supply = <&reg_1p8v>;
> +			VDDL-supply = <&reg_1p2v>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cam0_reset_pins_default>;
> +
> +			reset-gpios = <&main_gpio0 15 GPIO_ACTIVE_HIGH>;
> +
> +			port {
> +				csi2_cam0: endpoint {
> +					remote-endpoint = <&csi2rx0_in_sensor>;
> +					link-frequencies = /bits/ 64 <456000000>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	/* CAM1 I2C */
> +	i2c@1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <1>;
> +
> +		imx219_1: sensor@10 {
> +			compatible = "sony,imx219";
> +			reg = <0x10>;
> +
> +			clocks = <&clk_imx219_fixed>;
> +
> +			VANA-supply = <&reg_2p8v>;
> +			VDIG-supply = <&reg_1p8v>;
> +			VDDL-supply = <&reg_1p2v>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cam1_reset_pins_default>;
> +
> +			reset-gpios = <&main_gpio0 17 GPIO_ACTIVE_HIGH>;
> +
> +			port {
> +				csi2_cam1: endpoint {
> +					remote-endpoint = <&csi2rx1_in_sensor>;
> +					link-frequencies = /bits/ 64 <456000000>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pca9543_1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* CAM0 I2C */
> +	i2c@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +
> +		imx219_2: sensor@10 {
> +			compatible = "sony,imx219";
> +			reg = <0x10>;
> +
> +			clocks = <&clk_imx219_fixed>;
> +
> +			VANA-supply = <&reg_2p8v>;
> +			VDIG-supply = <&reg_1p8v>;
> +			VDDL-supply = <&reg_1p2v>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cam2_reset_pins_default>;
> +
> +			reset-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
> +
> +			port {
> +				csi2_cam2: endpoint {
> +					remote-endpoint = <&csi2rx2_in_sensor>;
> +					link-frequencies = /bits/ 64 <456000000>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	/* CAM1 I2C */
> +	i2c@1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <1>;
> +
> +		imx219_3: sensor@10 {
> +			compatible = "sony,imx219";
> +			reg = <0x10>;
> +
> +			clocks = <&clk_imx219_fixed>;
> +
> +			VANA-supply = <&reg_2p8v>;
> +			VDIG-supply = <&reg_1p8v>;
> +			VDDL-supply = <&reg_1p2v>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cam3_reset_pins_default>;
> +
> +			reset-gpios = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
> +
> +			port {
> +				csi2_cam3: endpoint {
> +					remote-endpoint = <&csi2rx3_in_sensor>;
> +					link-frequencies = /bits/ 64 <456000000>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&cdns_csi2rx0 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		csi0_port0: port@0 {
> +			reg = <0>;
> +			status = "okay";
> +
> +			csi2rx0_in_sensor: endpoint {
> +				remote-endpoint = <&csi2_cam0>;
> +				bus-type = <4>; /* CSI2 DPHY */
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&cdns_csi2rx1 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		csi1_port0: port@0 {
> +			reg = <0>;
> +			status = "okay";
> +
> +			csi2rx1_in_sensor: endpoint {
> +				remote-endpoint = <&csi2_cam1>;
> +				bus-type = <4>; /* CSI2 DPHY */
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&cdns_csi2rx2 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		csi2_port0: port@0 {
> +			reg = <0>;
> +			status = "okay";
> +
> +			csi2rx2_in_sensor: endpoint {
> +				remote-endpoint = <&csi2_cam2>;
> +				bus-type = <4>; /* CSI2 DPHY */
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&cdns_csi2rx3 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		csi3_port0: port@0 {
> +			reg = <0>;
> +			status = "okay";
> +
> +			csi2rx3_in_sensor: endpoint {
> +				remote-endpoint = <&csi2_cam3>;
> +				bus-type = <4>; /* CSI2 DPHY */
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
> +&ti_csi2rx0 {
> +	status = "okay";
> +};
> +
> +&dphy0 {
> +	status = "okay";
> +};
> +
> +&ti_csi2rx1 {
> +	status = "okay";
> +};
> +
> +&dphy1 {
> +	status = "okay";
> +};
> +
> +&ti_csi2rx2 {
> +	status = "okay";
> +};
> +
> +&dphy2 {
> +	status = "okay";
> +};
> +
> +&ti_csi2rx3 {
> +	status = "okay";
> +};
> +
> +&dphy3 {
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
