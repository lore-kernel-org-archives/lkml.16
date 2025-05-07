Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DAB1F8AC5;
	Wed,  7 May 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606045; cv=none; b=bxNHPMWXc957e7pKvfOBhRSxicDb2hemE+j6MPvvgkD+E0n/fta7Rb9g3XClSuc8U2JJ4d07pIipyADDOTXVtkRpNF1PYITzki/0I7SijxVR7sqaFpMuOOUXR4MwjxJ2c5wplhemkpdJJEgG35tdGR5Euhba3SCv/8LWXCIpotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606045; c=relaxed/simple;
	bh=OlyUclVXR6hk2oSEV8KIpXSo5oHLoJfFfFjwlpim1Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lhcp6D6uFQcfgp7Dk1OR7AvL+gBuMCyFi1jI5q6AY6d9Nh4fAoqzbwpDm6YXFv/nVoqwT+MPNanRJJC1TRkqpW88yEWnQF12ofKheBBHd5/uQZUjjdCdm82SbhiGXE1MhFTqc/3C8bnqnCUXQ+/2l9FosdBFmh+xRpchECwFEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w1/Nf1UI; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w1/Nf1UI"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5478KIxO756425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 03:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746606018;
	bh=dlQASdhbOgM7Ty1+g6FVadE+Ok2Wx4Q/VcJ+AXEeFm4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w1/Nf1UIMqKsI4mrIWhvls8Ww7lJsHfvs4TWwFU+ZHd7fIZDoWn4gaE1PxN8XhuTA
	 RbVMlIEhtxKuaP7lcnn7PZiAe2j5uID7TpqdfcyswRdxd78mxKKSRvae4rYL4sHhV1
	 Q18++KC7T4+DRulYOZd8hI6E/oBbR/vgNGbKm4fM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5478KIcm012894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 03:20:18 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 03:20:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 03:20:17 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5478KD7n011099;
	Wed, 7 May 2025 03:20:14 -0500
Message-ID: <a6329e9d-409e-4f62-b26d-c4d0e49d772c@ti.com>
Date: Wed, 7 May 2025 13:50:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI
 OV5640
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250505115700.500979-1-y-abhilashchandra@ti.com>
 <20250505115700.500979-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250505115700.500979-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Vaishnav/Abhilash

Thanks for patch

On 5/5/2025 5:27 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
>
> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> for quad TEVI OV5640 modules on J722S EVM.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>   .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
>   2 files changed, 362 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 829a3b028466..76b750e4b8a8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -123,6 +123,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> [..]
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> new file mode 100644
> index 000000000000..537224ea60e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
> + *
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	clk_ov5640_fixed: clock-24000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +

Please check once , this is clock is 25M or 24M .

As I see CDC6CE025000ADLXT/U28 is marked as 25M OSC

> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};

Sorry but on connector QSH-020-01-L-D-DP-A-K/J27, I see only 3v3 available.

May be I am missing something here but how you are getting 1v8 and 2v8 
supply


> +};
> +
> +
> +&main_pmx0 {
> +	cam0_reset_pins_default: cam0-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x03c, PIN_OUTPUT, 7)
> +		>;
> +	};
> +

Please mark GPIO you are using for this in comment

example

J722S_IOPAD(0x1dc, PIN_INPUT, 0) /* (C22) MCAN0_RX */


> +	cam1_reset_pins_default: cam1-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x044, PIN_OUTPUT, 7)
> +		>;
> +	};
> +
> +	cam2_reset_pins_default: cam2-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x04c, PIN_OUTPUT, 7)
> +		>;
> +	};
> +
> +	cam3_reset_pins_default: cam3-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x054, PIN_OUTPUT, 7)
> +		>;
> +	};
> +};
> +
> +&exp1 {
> +	p06-hog{
> +		/* P06 - CSI01_MUX_SEL_2 */
> +		gpio-hog;
> +		gpios = <6 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI01_MUX_SEL_2";

As per table on page 29

CSI01_MUX_SEL_2 as low means, INPUT<-- A Port [CSI2 Connector]

Please check, if you want to drive this line high or low

> +	};
> +
> +	p07-hog{
> +		/* P01 - CSI23_MUX_SEL_2 */
> +		gpio-hog;
> +		gpios = <7 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI23_MUX_SEL_2";
> +	};

Same as for CSI01_MUX_SEL_2, table on page-30


> +};
> +
> +&main_gpio0 {
> +	p15-hog {
> +		/* P15 - CSI2_CAMERA_GPIO1 */
> +		gpio-hog;
> +		gpios = <15 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO1";
> +	};
> +
> +	p17-hog {
> +		/* P17 - CSI2_CAMERA_GPIO2 */
> +		gpio-hog;
> +		gpios = <17 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO2";
> +	};
> +
> +	p19-hog {
> +		/* P19 - CSI2_CAMERA_GPIO3 */
> +		gpio-hog;
> +		gpios = <19 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO3";
> +	};
> +
> +	p21-hog {
> +		/* P21 - CSI2_CAMERA_GPIO4 */
> +		gpio-hog;
> +		gpios = <21 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO4";
> +	};

Please check once if P21 and rest above are pin number of SOC ?


> +};
> +
> +&pca9543_0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	i2c@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +
> +		ov5640_0: camera@3c {
> +			compatible = "ovti,ov5640";
> +			reg = <0x3c>;
> +			clocks = <&clk_ov5640_fixed>;
> +			clock-names = "xclk";
> +
> +			AVDD-supply = <&reg_2p8v>;
> +			DOVDD-supply = <&reg_1p8v>;
> +			DVDD-supply = <&reg_3p3v>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cam0_reset_pins_default>;

do you think, you should have reset-gpios as property for this ov5640 
and other nodes too ?


> +
> [..]
