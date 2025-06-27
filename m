Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824582E1C78
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036249; cv=none; b=jk0g05CHb6uE2l0qkFHbgvwLqSMRR7Mgq4vRb1lOayd663Af1b+4mxMsTOG4NUJwLcIvvBTVuG77qKqTMb7gQKF06F8y65+VEyUTfgkJOwz+p19qzxxSiPLiMHYV0i6xt7PRgre3zYcfMQsLIXo02u/DrK7NEO8NEuv7+3FoD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036249; c=relaxed/simple;
	bh=fUupSfT3llRaqZn5R7PTTRILfrLicM0UWaPOmi21zMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZsvkwNb9M36tb2u9rFZH/uPF7aTpSwNQnjP8+WrY05N7EoMmgFEi2Zai7u/FUPRs6MGM/EXUwstVCXL94XRpHzjuF5ouPC/1fJ7+GF8N49sUvpglbZjl2cQND2hV9FGKLMCtH6X81lTt/mdIWYFdu12PuVyM9wSKARDSSE3Dgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=G8hfnwYl; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="G8hfnwYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1751036240;
 bh=nJ/FPY+QdkELtcT4uFn7qwPNg2TeQH5DDYK7yoUgPwQ=;
 b=G8hfnwYlxMgxjWgpTtMrw1uZzXujJ9VRXJ0QCxbfcsPnWpNmcVZNCZjTmldznpJFxjJChf9nU
 yKQbWPYKku8kyUFRZTZI31yUFXW8D/t5Vy/BRHSENRukUwLbohpwJwds/uLvbacDvMl9rz3slEY
 kUXSNOOz4DuR8wQ+e0P4FxF5giyT30/um9whY38+bPmTf6ObSHTQsiF7ICsCqTZIKqPGkKcpTQj
 Gng9awbCh8TBjjysG1GyC1gQ/wLkvLT0BYunhw3ZefWkoMznaUIlc1dIafjjN9D4rqNdbkQkV8J
 3gXJ731lbTv9TriRV0tz979DO84YXSJQ/3tYsed1cCOA==
X-Forward-Email-ID: 685eb14d9ff32aeea657f55e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <37488805-5b95-45db-bd29-eb183fc7ce7f@kwiboo.se>
Date: Fri, 27 Jun 2025 16:57:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5
 support
To: John Clark <inindev@gmail.com>, "heiko@sntech.de" <heiko@sntech.de>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250626054728.4882-1-inindev@gmail.com>
 <20250626054728.4882-3-inindev@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250626054728.4882-3-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi John,

On 2025-06-26 07:47, John Clark wrote:
> Add device tree for FriendlyElec NanoPi M5 with Rockchip RK3576 SoC
> (4x Cortex-A72, 4x Cortex-A53, Mali-G52 MC3 GPU, 6 TOPS NPU). Enables
> basic booting and connectivity.
> 
> Supported features:
> - RK3576 SoC
> - 4GB/8GB/16GB LPDDR4X/LPDDR5 RAM
> - 16MB SPI Nor Flash
> - 2x 1Gbps Ethernet
> - 2x USB 3.2 Gen 1 Type-A ports
> - microSD UHS-I
> - M.2 M-Key PCIe 2.1 x1 NVMe support
> - HDMI 1.4/2.0 (up to 4096x2304@60Hz)
> - 30-pin GPIO (2x SPI, 4x UART, 3x I2C, 5x PWM, 20x GPIO)
> - Debug UART
> - RTC with HYM8563TS
> - Power via USB-C (PD, 6V~20V)
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 999 ++++++++++++++++++
>  2 files changed, 1000 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index e43565c53c56..099520962ffb 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -148,6 +148,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> new file mode 100644
> index 000000000000..4b9c1ac44919
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> @@ -0,0 +1,999 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 FriendlyElec Computer Tech. Co., Ltd.
> + * Copyright (c) 2025 John Clark <inindev@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +	model = "FriendlyElec NanoPi M5";
> +	compatible = "friendlyarm,nanopi-m5", "rockchip,rk3576";
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;

Do we need to add mmc0 alias here?

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:1500000n8";
> +	};
> +
> +	hdmi-con {
> +		compatible = "hdmi-connector";
> +		hdmi-pwr-supply = <&vcc_5v0_hdmi>;

Schematic names this vcc5v_hdmi_tx for the HDMI +5V Power pin.

> +		type = "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +
> +		button-user {
> +			debounce-interval = <50>;
> +			gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
> +			label = "User";
> +			linux,code = <BTN_1>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&button_user_pin>;

usr_button is used in schematics, maybe usr_button_pin?

> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		sys_led: led-0 {
> +			gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_HIGH>;
> +			label = "sys_led";

Please use color and function props, you can skip label or use SYS as
printed on the board.

> +			linux,default-trigger = "heartbeat";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sys_led_pin>;

Schematic use led_sys_h for this pin.

> +		};
> +
> +		lan_led: led-1 {
> +			gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_HIGH>;
> +			label = "lan_led";

Same as above, use color and function props, this is named LED2.

> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lan_led_pin>;

Schematic use led2_h for this pin.

> +		};
> +
> +		wan_led: led-2 {
> +			gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
> +			label = "wan_led";

Same as above, use color and function props, this is named LED1.

> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wan_led_pin>;

Schematic use led1_h for this pin.

> +		};
> +	};
> +
> +	vcc_12v_dcin: regulator-vcc-12v-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-name = "vcc_12v_dcin";

This is named 6~20v_dcin or vcc12v_dcin in schematics.

> +
> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};

Is all these regulator-state-mem nodes needed for regulator-fixed?

> +	};
> +
> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		regulator-name = "vcc_1v1_nldo_s3";
> +		vin-supply = <&vcc_5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <2000000>;
> +		regulator-max-microvolt = <2000000>;
> +		regulator-name = "vcc_2v0_pldo_s3";
> +		vin-supply = <&vcc_5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc_3v3_m2_keym: regulator-vcc-3v3-m2_keym {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie_m2_pwren>;

This is called pcie0_pwren_h in schematic.

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "vcc_3v3_m2_keym";

This is named vcc3v3_m2_keym in schematic.

> +		vin-supply = <&vcc_5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc_3v3_s0: regulator-vcc-3v3-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "vcc_3v3_s0";
> +		vin-supply = <&vcc_3v3_s3>;
> +
> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};
> +	};
> +
> +	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd_s0_pwren>;

This is called sdmmc0_pwren_h in schematic.

> +		regulator-boot-on;
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;

Should be 3.3v not 3.0v?

> +		regulator-name = "vcc_3v3_sd_s0";

This is called vcc3v3_sd_s0 in schematic.

> +		vin-supply = <&vcc_3v3_s3>;
> +
> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};
> +	};
> +
> +	vcc_5v0_device: regulator-vcc-5v0-device {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_device";

I cannot find this regulator in the schematic, only vcc5v0_sys_s5.

> +		vin-supply = <&vcc_12v_dcin>;
> +
> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};
> +	};
> +
> +	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;

This is used to switch between HDMI2.0(TMDS) and HDMI2.1(FRL) mode, and
should probably not be modeled as a regulator.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hdmi_con_en>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_hdmi";

Schematics use vcc5v_hdmi_tx for the HDMI +5V pin.

> +		vin-supply = <&vcc_5v0_sys>;

This should be vcc5v0_sys_s5.

> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc_5v0_host: regulator-vcc-5v0-host {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_pwren>;

This is called usb3_host_pwren_h in schematic.

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_host";

This is called usb3_port2_5v in schematic.

> +		vin-supply = <&vcc_5v0_device>;

This should be vcc5v0_sys_s5.

> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc_5v0_otg: regulator-vcc-5v0-otg {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PD1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_otg0_pwren>;

This is called usb_otg0_pwren_h in schematic.

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_otg";

This is called vcc5v0_usb_otg0 in the schematic.

> +		vin-supply = <&vcc_5v0_device>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc_5v0_sys: regulator-vcc-5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_sys";

This is called vcc5v0_sys_s5 in the schematic.

> +		vin-supply = <&vcc_12v_dcin>;
> +
> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hp_det>;

This is called hp_det_l in schematic.

> +
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,hp-det-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_LOW>;
> +		simple-audio-card,mclk-fs = <256>;
> +		simple-audio-card,name = "realtek,rt5616-codec";
> +
> +		simple-audio-card,routing =
> +			"Headphones", "HPOL",
> +			"Headphones", "HPOR",
> +			"IN1P", "Microphone Jack";
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphone Jack",
> +			"Microphone", "Microphone Jack";
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&rt5616>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&sai2>;
> +		};
> +	};
> +};
> +
> +&combphy0_ps {
> +	status = "okay";
> +};
> +
> +&combphy1_psu {
> +	status = "okay";
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&fspi1m1_pins {
> +	/* gpio1_d5, gpio1_c4-c7 (clk, d0-d4) are for spi nor flash */
> +	/* gpio1_d0-d4 muxed to sai2 audio functions */
> +	rockchip,pins =
> +		<1 RK_PD5 3 &pcfg_pull_none>,
> +		<1 RK_PC4 3 &pcfg_pull_none>,
> +		<1 RK_PC5 3 &pcfg_pull_none>,
> +		<1 RK_PC6 3 &pcfg_pull_none>,
> +		<1 RK_PC7 3 &pcfg_pull_none>;
> +};
> +
> +&gmac0 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy0>;
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&vcc_3v3_s3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth0m0_miim
> +		     &eth0m0_tx_bus2
> +		     &eth0m0_rx_bus2
> +		     &eth0m0_rgmii_clk
> +		     &eth0m0_rgmii_bus>;
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&vcc_3v3_s3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth1m0_miim
> +		     &eth1m0_tx_bus2
> +		     &eth1m0_rx_bus2
> +		     &eth1m0_rgmii_clk
> +		     &eth1m0_rgmii_bus>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_gpu_s0>;
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	status = "okay";
> +};
> +
> +&hdmi_in {
> +	hdmi_in_vp0: endpoint {
> +		remote-endpoint = <&vp0_out_hdmi>;
> +	};
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +};
> +
> +&hdptxphy {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	pmic@23 {
> +		compatible = "rockchip,rk806";
> +		reg = <0x23>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +		system-power-controller;
> +
> +		vcc1-supply = <&vcc_5v0_sys>;
> +		vcc2-supply = <&vcc_5v0_sys>;
> +		vcc3-supply = <&vcc_5v0_sys>;
> +		vcc4-supply = <&vcc_5v0_sys>;
> +		vcc5-supply = <&vcc_5v0_sys>;
> +		vcc6-supply = <&vcc_5v0_sys>;
> +		vcc7-supply = <&vcc_5v0_sys>;
> +		vcc8-supply = <&vcc_5v0_sys>;
> +		vcc9-supply = <&vcc_5v0_sys>;
> +		vcc10-supply = <&vcc_5v0_sys>;
> +		vcc11-supply = <&vcc_2v0_pldo_s3>;
> +		vcc12-supply = <&vcc_5v0_sys>;
> +		vcc13-supply = <&vcc_1v1_nldo_s3>;
> +		vcc14-supply = <&vcc_1v1_nldo_s3>;
> +		vcca-supply = <&vcc_5v0_sys>;
> +
> +		rk806_dvs1_null: dvs1-null-pins {
> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun0";
> +		};
> +
> +		rk806_dvs1_slp: dvs1-slp-pins {
> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun1";
> +		};
> +
> +		rk806_dvs1_pwrdn: dvs1-pwrdn-pins {
> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun2";
> +		};
> +
> +		rk806_dvs1_rst: dvs1-rst-pins {
> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun3";
> +		};
> +
> +		rk806_dvs2_null: dvs2-null-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun0";
> +		};
> +
> +		rk806_dvs2_slp: dvs2-slp-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun1";
> +		};
> +
> +		rk806_dvs2_pwrdn: dvs2-pwrdn-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun2";
> +		};
> +
> +		rk806_dvs2_rst: dvs2-rst-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun3";
> +		};
> +
> +		rk806_dvs2_dvs: dvs2-dvs-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun4";
> +		};
> +
> +		rk806_dvs2_gpio: dvs2-gpio-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun5";
> +		};
> +
> +		rk806_dvs3_null: dvs3-null-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun0";
> +		};
> +
> +		rk806_dvs3_slp: dvs3-slp-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun1";
> +		};
> +
> +		rk806_dvs3_pwrdn: dvs3-pwrdn-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun2";
> +		};
> +
> +		rk806_dvs3_rst: dvs3-rst-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun3";
> +		};
> +
> +		rk806_dvs3_dvs: dvs3-dvs-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun4";
> +		};
> +
> +		rk806_dvs3_gpio: dvs3-gpio-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun5";
> +		};
> +
> +		regulators {
> +			vdd_cpu_big_s0: dcdc-reg1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-enable-ramp-delay = <400>;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-name = "vdd_cpu_big_s0";
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_npu_s0: dcdc-reg2 {
> +				regulator-boot-on;
> +				regulator-enable-ramp-delay = <400>;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-name = "vdd_npu_s0";
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_cpu_lit_s0: dcdc-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-name = "vdd_cpu_lit_s0";
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <750000>;
> +				};
> +			};
> +
> +			vcc_3v3_s3: dcdc-reg4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc_3v3_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vdd_gpu_s0: dcdc-reg5 {
> +				regulator-boot-on;
> +				regulator-enable-ramp-delay = <400>;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-name = "vdd_gpu_s0";
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <850000>;
> +				};
> +			};
> +
> +			vddq_ddr_s0: dcdc-reg6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vddq_ddr_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_logic_s0: dcdc-reg7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <800000>;
> +				regulator-name = "vdd_logic_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8_s3: dcdc-reg8 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc_1v8_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vdd2_ddr_s3: dcdc-reg9 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vdd2_ddr_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vdd_ddr_s0: dcdc-reg10 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-name = "vdd_ddr_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcca_1v8_s0: pldo-reg1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcca_1v8_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcca1v8_pldo2_s0: pldo-reg2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcca1v8_pldo2_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda_1v2_s0: pldo-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-name = "vdda_1v2_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcca_3v3_s0: pldo-reg4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcca_3v3_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vccio_sd_s0: pldo-reg5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vccio_sd_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcca1v8_pldo6_s3: pldo-reg6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcca1v8_pldo6_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vdd_0v75_s3: nldo-reg1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <750000>;
> +				regulator-name = "vdd_0v75_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <750000>;
> +				};
> +			};
> +
> +			vdda_ddr_pll_s0: nldo-reg2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <850000>;
> +				regulator-name = "vdda_ddr_pll_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda0v75_hdmi_s0: nldo-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <837500>;
> +				regulator-max-microvolt = <837500>;
> +				regulator-name = "vdda0v75_hdmi_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda_0v85_s0: nldo-reg4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <850000>;
> +				regulator-name = "vdda_0v85_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdda_0v75_s0: nldo-reg5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <750000>;
> +				regulator-name = "vdda_0v75_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		clock-output-names = "hym8563";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hym8563_int>;
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c5 {
> +	clock-frequency = <200000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5m3_xfer>;
> +	status = "okay";
> +
> +	rt5616: audio-codec@1b {
> +		compatible = "realtek,rt5616";
> +		reg = <0x1b>;
> +		assigned-clocks = <&cru CLK_SAI2_MCLKOUT>;
> +		assigned-clock-rates = <12288000>;
> +		clocks = <&cru CLK_SAI2_MCLKOUT>;
> +		clock-names = "mclk";
> +		#sound-dai-cells = <0>;
> +	};
> +};
> +
> +&mdio0 {
> +	rgmii_phy0: phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac0_int>;

This is missing pinctrl for the reset-gpios pin.

> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_int>;

This is missing pinctrl for the reset-gpios pin.

> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&pcie0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_m2_reset>;

This is called pcie0_perstn in schematic.

> +	reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply = <&vcc_3v3_m2_keym>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	gmac {
> +		gmac0_int: gmac0-int {
> +			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +		gmac0_rst: gmac0-rst {
> +			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		gmac1_int: gmac1-int {
> +			rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +		gmac1_rst: gmac1-rst {
> +			rockchip,pins = <3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	hdmi {
> +		hdmi_con_en: hdmi-con-en {
> +			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	hym8563 {
> +		hym8563_int: hym8563-int {
> +			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	keys {
> +		button_user_pin: button-user-pin {
> +			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		sys_led_pin: sys-led-pin {
> +			rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		lan_led_pin: lan-led-pin {
> +			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		wan_led_pin: wan-led-pin {
> +			rockchip,pins = <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie_m2_pwren: pcie-m2-pwren {
> +			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		pcie_m2_reset: pcie-m2-reset {
> +			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	sdmmc {
> +		sd_s0_pwren: sd-s0-pwren {
> +			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	sound {
> +		hp_det: hp-det {
> +			rockchip,pins = <2 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {
> +		usb_host_pwren: usb-host-pwren {
> +			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		usb_otg0_pwren: usb-otg0-pwren {
> +			rockchip,pins = <0 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&rng {
> +	status = "okay";

This is default for the SoC so this can be dropped.

> +};
> +
> +&sai2 {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	vref-supply = <&vcca_1v8_s0>;
> +	status = "okay";
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	no-mmc;
> +	no-sdio;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4>;

Please use the <&sdmmc0_clk>, <&sdmmc0_cmd>, <&sdmmc0_det>,
<&sdmmc0_bus4> format, will include more schemantic information for
parsers.  

> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_3v3_sd_s0>;
> +	status = "okay";
> +};
> +
> +&sfc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&fspi1m1_csn0 &fspi1m1_pins>;

Same here.

> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		m25p,fast-read;
> +		spi-max-frequency = <20000000>;

For U-Boot I tested with 50 MHz, any reason why this is so low?
Please check datasheet for the SPI-flash module.

Regards,
Jonas

> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <1>;
> +		vcc-supply = <&vcc_1v8_s3>;
> +	};
> +};
> +
> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy0_otg {
> +	phy-supply = <&vcc_5v0_otg>;
> +	status = "okay";
> +};
> +
> +&u2phy1 {
> +	status = "okay";
> +};
> +
> +&u2phy1_otg {
> +	phy-supply = <&vcc_5v0_host>;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usbdp_phy {
> +	status = "okay";
> +};
> +
> +&usb_drd0_dwc3 {
> +	dr_mode = "otg";
> +	extcon = <&u2phy0>;
> +	status = "okay";
> +};
> +
> +&usb_drd1_dwc3 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&vop {
> +	status = "okay";
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
> +		remote-endpoint = <&hdmi_in_vp0>;
> +	};
> +};
> +
> +&wdt {
> +	status= "okay";
> +};

