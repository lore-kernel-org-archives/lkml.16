Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13E0DF59;
	Fri, 25 Apr 2025 00:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745542744; cv=none; b=uWjGTlD0w2YmWYXheVrRflLYaokmIILTe5vA6jzvUBhlDvN/AHFX41cJmQlmjDYZpnRQM39tGoYF7jxflCV5w7tnvhbA4Djmz3H8GiI9Fp+81vChaZjSMD5Vf9V7CN6gsaA7idShi4ubP1u3lKJuU47pRt0o7bktAAi+sgdwm0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745542744; c=relaxed/simple;
	bh=sBERpZhAQml139/CZsvnXxtrxHndkUh6BomSJBq1i0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A1niI30/EqL41PbSgWNe4K701XEmRKZj3WVYZa2qFSwE98xp3mXIK6IUanTdsAddG+tVKR9fHeGY5x4QA8kLYcd3FfrcIWaLJp0b1j+SGzo+3BspvDSc40Hl2f3xqoNBw3MHLpBrDvGz4qvT8P1AjCsI34xcS5R7XhhoMsL+7ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA98E1007;
	Thu, 24 Apr 2025 17:58:56 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 708973F59E;
	Thu, 24 Apr 2025 17:59:00 -0700 (PDT)
Date: Fri, 25 Apr 2025 01:57:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <20250425015758.60f83f2b@minigeek.lan>
In-Reply-To: <20250413134318.66681-3-jernej.skrabec@gmail.com>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
	<20250413134318.66681-3-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Apr 2025 15:42:57 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> OrangePi 3 LTS is quite similar to original OrangePi 3, but it has a lot
> small changes that makes DT sharing unpractical with it.
>=20
> OrangePi 3 LTS has following features:
> - Allwinner H6 quad-core 64-bit ARM Cortex-A53
> - GPU Mali-T720
> - 2 GB LPDDR3 RAM
> - AXP805 PMIC
> - AW859A Wifi/BT 5.0
> - 2x USB 2.0 host port (A)
> - USB 3.0 Host
> - Gigabit Ethernet (Motorcomm YT8531C phy)
> - HDMI 2.0 port
> - soldered 8 GB eMMC
> - 2x LED
> - microphone
> - audio jack
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

I guess you tried to use a common orangepi-3.dtsi, but that didn't
work out well?

> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun50i-h6-orangepi-3-lts.dts    | 351 ++++++++++++++++++
>  2 files changed, 352 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lt=
s.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 00bed412ee31..72c43bd0e2ab 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-p=
lus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> new file mode 100644
> index 000000000000..c8830d5c2f09
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> @@ -0,0 +1,351 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> +// Based on sun50i-h6-orangepi-3.dts, which is:
> +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> +
> +/dts-v1/;
> +
> +#include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
> +#include "sun50i-h6-gpu-opp.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model =3D "OrangePi 3 LTS";
> +	compatible =3D "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
> +
> +	aliases {
> +		ethernet0 =3D &emac;
> +		ethernet1 =3D &aw859a;
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		ddc-en-gpios =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	ext_osc32k: ext_osc32k_clk {

Shouldn't the node name contain dashes instead of underscores?

> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <32768>;
> +		clock-output-names =3D "ext_osc32k";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			function =3D LED_FUNCTION_POWER;
> +			color =3D <LED_COLOR_ID_RED>;
> +			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> +			default-state =3D "on";
> +		};
> +
> +		led-1 {
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
> +		};
> +	};
> +
> +	reg_gmac_3v3: gmac-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "gmac-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <150000>;
> +		enable-active-high;
> +		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> +	};
> +
> +	reg_vcc5v: vcc5v {
> +		/* board wide 5V supply directly from the DC jack */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-5v";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_wifi_3v3: wifi-3v3 {
> +		/* 3.3V regulator for WiFi and BT */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wifi-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		enable-active-high;
> +		gpio =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		clocks =3D <&rtc 1>;

Shouldn't that be <&rtc CLK_OSC32K_FANOUT>?

Cheers,
Andre

> +		clock-names =3D "ext_clock";
> +		reset-gpios =3D <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> +		post-power-on-delay-ms =3D <200>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdca>;
> +};
> +
> +&de {
> +	status =3D "okay";
> +};
> +
> +&dwc3 {
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci3 {
> +	status =3D "okay";
> +};
> +
> +&emac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ext_rgmii_pins>;
> +	phy-mode =3D "rgmii-rxid";
> +	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-supply =3D <&reg_gmac_3v3>;
> +	allwinner,rx-delay-ps =3D <0>;
> +	allwinner,tx-delay-ps =3D <700>;
> +	status =3D "okay";
> +};
> +
> +&gpu {
> +	mali-supply =3D <&reg_dcdcc>;
> +	status =3D "okay";
> +};
> +
> +&hdmi {
> +	hvcc-supply =3D <&reg_bldo2>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
> +&mdio {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +
> +		motorcomm,clk-out-frequency-hz =3D <125000000>;
> +
> +		reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> +		reset-assert-us =3D <15000>;
> +		reset-deassert-us =3D <100000>;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_cldo1>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> +	disable-wp;
> +	bus-width =3D <4>;
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	vmmc-supply =3D <&reg_wifi_3v3>;
> +	vqmmc-supply =3D <&reg_bldo3>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	aw859a: wifi@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +&mmc2 {
> +	vmmc-supply =3D <&reg_cldo1>;
> +	vqmmc-supply =3D <&reg_bldo2>;
> +	cap-mmc-hw-reset;
> +	non-removable;
> +	bus-width =3D <8>;
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci3 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	vcc-pc-supply =3D <&reg_bldo2>;
> +	vcc-pd-supply =3D <&reg_cldo1>;
> +	vcc-pg-supply =3D <&reg_bldo3>;
> +};
> +
> +&r_ir {
> +	status =3D "okay";
> +};
> +
> +&r_i2c {
> +	status =3D "okay";
> +
> +	axp805: pmic@36 {
> +		compatible =3D "x-powers,axp805", "x-powers,axp806";
> +		reg =3D <0x36>;
> +		interrupt-parent =3D <&r_intc>;
> +		interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +		x-powers,self-working-mode;
> +		vina-supply =3D <&reg_vcc5v>;
> +		vinb-supply =3D <&reg_vcc5v>;
> +		vinc-supply =3D <&reg_vcc5v>;
> +		vind-supply =3D <&reg_vcc5v>;
> +		vine-supply =3D <&reg_vcc5v>;
> +		aldoin-supply =3D <&reg_vcc5v>;
> +		bldoin-supply =3D <&reg_vcc5v>;
> +		cldoin-supply =3D <&reg_vcc5v>;
> +
> +		regulators {
> +			reg_aldo1: aldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc-pl-led-ir";
> +			};
> +
> +			reg_aldo2: aldo2 {
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc33-audio-tv-ephy-mac";
> +			};
> +
> +			/* ALDO3 is shorted to CLDO1 */
> +			reg_aldo3: aldo3 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc33-io-pd-emmc-sd-usb-uart-1";
> +			};
> +
> +			reg_bldo1: bldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc18-dram-bias-pll";
> +			};
> +
> +			reg_bldo2: bldo2 {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc-efuse-pcie-hdmi-pc";
> +			};
> +
> +			reg_bldo3: bldo3 {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc-pm-pg-dcxoio-wifi";
> +			};
> +
> +			bldo4 {
> +				/* unused */
> +			};
> +
> +			reg_cldo1: cldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc33-io-pd-emmc-sd-usb-uart-2";
> +			};
> +
> +			cldo2 {
> +				/* unused */
> +			};
> +
> +			cldo3 {
> +				/* unused */
> +			};
> +
> +			reg_dcdca: dcdca {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <1160000>;
> +				regulator-ramp-delay =3D <2500>;
> +				regulator-name =3D "vdd-cpu";
> +			};
> +
> +			reg_dcdcc: dcdcc {
> +				regulator-enable-ramp-delay =3D <32000>;
> +				regulator-min-microvolt =3D <810000>;
> +				regulator-max-microvolt =3D <1080000>;
> +				regulator-ramp-delay =3D <2500>;
> +				regulator-name =3D "vdd-gpu";
> +			};
> +
> +			reg_dcdcd: dcdcd {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <960000>;
> +				regulator-max-microvolt =3D <960000>;
> +				regulator-name =3D "vdd-sys";
> +			};
> +
> +			reg_dcdce: dcdce {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <1200000>;
> +				regulator-max-microvolt =3D <1200000>;
> +				regulator-name =3D "vcc-dram";
> +			};
> +
> +			sw {
> +				/* unused */
> +			};
> +		};
> +	};
> +};
> +
> +&rtc {
> +	clocks =3D <&ext_osc32k>;
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_ph_pins>;
> +	status =3D "okay";
> +};
> +
> +&usb2otg {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&usb2phy {
> +	usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
> +	usb0_vbus-supply =3D <&reg_vcc5v>;
> +	usb3_vbus-supply =3D <&reg_vcc5v>;
> +	status =3D "okay";
> +};
> +
> +&usb3phy {
> +	status =3D "okay";
> +};

