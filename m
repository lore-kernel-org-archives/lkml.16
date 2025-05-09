Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14D2918F2;
	Fri,  9 May 2025 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796420; cv=pass; b=plP36eOg8THwl3P9/WtqPSKJlMzA1q8yDM/NjqT9ToMVNiMPzFjEBkRJ7+V0u9LBNkZv0SMhg8tYhQIPd5Gxe5eCGZ6LgzDwJ8h87AD5p+WKMWwjHl3VfmJDzTDVXJ1ff51pk0dVtzJ3Kvr4Ok8fnnfWsSTvO7eEBZnYzn6WWQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796420; c=relaxed/simple;
	bh=Uww500A9jATcsuCqFaK6WwQ/uH78XwAJr8iRUkh+fIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGILwBhikXLfDtnVQybz/HEblYwLQZLQVjAZAMKxMR1y4hd6PbsCgmR2QtcYHo1M62EFUwxT8LTvwD85rFBZC9Q4BJhb/TICEw3VtTebn/3u0vYLk2/Rzj6fb9zJogrXZz7dZV009j0C2mMTly8DpXyxbbTFuTRXTK6cCQ6EM7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=iO2X4pEh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="iO2X4pEh"
ARC-Seal: i=1; a=rsa-sha256; t=1746796397; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MluYAyVM3N1oK26MrzBqqZA9iawrUT3bo7ONSok8YbBRM7XdKYfTo/HmyVU7VQamp/XgGJ1jkWEcLvxBjLGS4zuRfXMPirKgLFxsVKH2H1yBxR+PcpZMOcO1IZOfziFezoiNrQS6Hdg4pvcmmVOZOvblXFoo1w+qTHq0+yJOrm0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746796397; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6lFHHRnrqJvB3VlGOvtpr0F9FCMLBLSJdcofsotVBeA=; 
	b=MZ7B4aIN3vD2F9BDMXTzDunIZxs7CkVWMaGr53kti7XsJeaH9hXnbJGmafUnI8WkXeDx5M3Xqerk8RRBuMiYJsfMHhMkQGThJIE37WstOenoZrzBBPKqlPe15VAF+3l6Dmy1NuV4VvUQ9Ei8I+2i5WojYbnglAKtElZGINUDwDI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746796397;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=6lFHHRnrqJvB3VlGOvtpr0F9FCMLBLSJdcofsotVBeA=;
	b=iO2X4pEh/0C9eCKoL8xr0Oi8xOLFcw1fKl0cyTgTqprwIm7jXxozlbjrGzzVTg97
	8Yrx073u6tyS2lhuc3qfJnP5xL8PrFKJebqb+fgoxlsZIhIYs6BBAfmmb+4NQ7NXfN+
	v3S+pcSpDYSbXmV7ZfIt6qFrsRRvKYjeUXaQTsTA=
Received: by mx.zohomail.com with SMTPS id 1746796394929344.4965152975143;
	Fri, 9 May 2025 06:13:14 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 4CC4D18072E; Fri, 09 May 2025 15:13:11 +0200 (CEST)
Date: Fri, 9 May 2025 15:13:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: reorganise common rock5* nodes
Message-ID: <7icoh2ook6jhqy2biofzjxazitxlsiiimkjbvaxzwmfi7d4r4k@uekmvmqvatek>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
 <20250509-add-rock5t-v1-2-cff1de74eced@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2afqxde2ye2gytr2"
Content-Disposition: inline
In-Reply-To: <20250509-add-rock5t-v1-2-cff1de74eced@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/246.775.77
X-ZohoMailClient: External


--2afqxde2ye2gytr2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: reorganise common rock5* nodes
MIME-Version: 1.0

Hi,

On Fri, May 09, 2025 at 02:31:42PM +0200, Nicolas Frattaroli wrote:
> In preparation for the addition of a device tree for ROCK 5T, reorganise
> the already existing ROCK 5B and ROCK 5B+ device trees. All
> functionality shared between just 5B and 5B+ is moved into the shared
> rk3588-rock-5b.dtsi, whereas all nodes that will be shared with the ROCK
> 5T as well are now present in rk3588-rock-5b-5bp-5t.dtsi, which the
> former includes.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 1012 ++++++++++++++=
++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1012 +-------------=
------
>  2 files changed, 1020 insertions(+), 1004 deletions(-)

This is why I send the first two patches separately in my ROCK 5B+
series and asked for them to be squashed. It's a pain to review it
the way you send it out :)

The good thing in your case is, that we are just moving things from
dtsi without involving a dts, so you can split it up in a bisectable
way:

patch 1:
 - rename rk3588-rock-5b.dtsi to rk3588-rock-5b-5bp-5t.dtsi (no changes)
 - change any include of rk3588-rock-5b.dtsi to rk3588-rock-5b-5bp-5t.dtsi

patch 2:
 - create rk3588-rock-5b.dtsi and move over the relevant stuff from rk3588-=
rock-5b-5bp-5t.dtsi
 - change back any include of rk3588-rock-5b-5bp-5t.dtsi to rk3588-rock-5b.=
dtsi

This is fully bisectable and will give you easy to review patches :)

Greetings,

-- Sebastian

>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..f086f0ff9f65b514ba89f04f4=
614a6c0c6abefff
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588.dtsi"
> +
> +/ {
> +	aliases {
> +		mmc0 =3D &sdhci;
> +		mmc1 =3D &sdmmc;
> +		mmc2 =3D &sdio;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial2:1500000n8";
> +	};
> +
> +	hdmi0-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi0_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi0_out_con>;
> +			};
> +		};
> +	};
> +
> +	hdmi1-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi1_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi1_out_con>;
> +			};
> +		};
> +	};
> +
> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		cooling-levels =3D <0 120 150 180 210 240 255>;
> +		fan-supply =3D <&vcc5v0_sys>;
> +		pwms =3D <&pwm1 0 50000 0>;
> +		#cooling-cells =3D <2>;
> +	};
> +
> +	rfkill-bt {
> +		compatible =3D "rfkill-gpio";
> +		label =3D "rfkill-m2-bt";
> +		radio-type =3D "bluetooth";
> +		shutdown-gpios =3D <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vcc12v_dcin: regulator-vcc12v-dcin {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +	};
> +
> +	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		regulator-name =3D "vcc3v3_pcie2x1l0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <50000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +		status =3D "disabled";
> +	};
> +
> +	vcc3v3_pcie2x1l2: regulator-vcc3v3-pcie2x1l2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3_pcie2x1l2";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <5000>;
> +		vin-supply =3D <&vcc_3v3_s3>;
> +	};
> +
> +	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpios =3D <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pcie3_vcc3v3_en>;
> +		regulator-name =3D "vcc3v3_pcie30";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <5000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc5v0_sys: regulator-vcc5v0-sys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc12v_dcin>;
> +	};
> +
> +	vbus5v0_typec: vbus5v0-typec {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vbus5v0_typec_en>;
> +		regulator-name =3D "vbus5v0_typec";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_1v1_nldo_s3";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1100000>;
> +		regulator-max-microvolt =3D <1100000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +};
> +
> +&combphy0_ps {
> +	status =3D "okay";
> +};
> +
> +&combphy1_ps {
> +	status =3D "okay";
> +};
> +
> +&combphy2_psu {
> +	status =3D "okay";
> +};
> +
> +&cpu_b0 {
> +	cpu-supply =3D <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply =3D <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply =3D <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply =3D <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_l0 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&gpu {
> +	mali-supply =3D <&vdd_gpu_s0>;
> +	status =3D "okay";
> +};
> +
> +&hdmi0 {
> +	status =3D "okay";
> +};
> +
> +&hdmi0_in {
> +	hdmi0_in_vp0: endpoint {
> +		remote-endpoint =3D <&vp0_out_hdmi0>;
> +	};
> +};
> +
> +&hdmi0_out {
> +	hdmi0_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi0_con_in>;
> +	};
> +};
> +
> +&hdmi0_sound {
> +	status =3D "okay";
> +};
> +
> +&hdmi1 {
> +	pinctrl-0 =3D <&hdmim0_tx1_cec &hdmim0_tx1_hpd
> +	&hdmim1_tx1_scl &hdmim1_tx1_sda>;
> +	status =3D "okay";
> +};
> +
> +&hdmi1_in {
> +	hdmi1_in_vp1: endpoint {
> +		remote-endpoint =3D <&vp1_out_hdmi1>;
> +	};
> +};
> +
> +&hdmi1_out {
> +	hdmi1_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi1_con_in>;
> +	};
> +};
> +
> +&hdmi1_sound {
> +	status =3D "okay";
> +};
> +
> +&hdmi_receiver_cma {
> +	status =3D "okay";
> +};
> +
> +&hdmi_receiver {
> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_r=
x_sda &hdmirx_hpd>;
> +	pinctrl-names =3D "default";
> +};
> +
> +&hdptxphy0 {
> +	status =3D "okay";
> +};
> +
> +&hdptxphy1 {
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0m2_xfer>;
> +	status =3D "okay";
> +
> +	vdd_cpu_big0_s0: regulator@42 {
> +		compatible =3D "rockchip,rk8602";
> +		reg =3D <0x42>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		regulator-name =3D "vdd_cpu_big0_s0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <550000>;
> +		regulator-max-microvolt =3D <1050000>;
> +		regulator-ramp-delay =3D <2300>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vdd_cpu_big1_s0: regulator@43 {
> +		compatible =3D "rockchip,rk8603", "rockchip,rk8602";
> +		reg =3D <0x43>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		regulator-name =3D "vdd_cpu_big1_s0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <550000>;
> +		regulator-max-microvolt =3D <1050000>;
> +		regulator-ramp-delay =3D <2300>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c4m1_xfer>;
> +	status =3D "okay";
> +
> +	usbc0: usb-typec@22 {
> +		compatible =3D "fcs,fusb302";
> +		reg =3D <0x22>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usbc0_int>;
> +		vbus-supply =3D <&vbus5v0_typec>;
> +		/*
> +		 * When the board is starting to send power-delivery messages
> +		 * too late (5 seconds according to the specification), the
> +		 * power-supply reacts with a hard-reset. That removes the
> +		 * power from VBUS for some time, which resets te whole board.
> +		 */
> +		status =3D "fail";
> +
> +		usb_con: connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB-C";
> +			data-role =3D "dual";
> +			power-role =3D "sink";
> +			try-power-role =3D "sink";
> +			op-sink-microwatt =3D <1000000>;
> +			sink-pdos =3D
> +				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>,
> +				<PDO_VAR(5000, 20000, 5000)>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +					usbc0_role_sw: endpoint {
> +						remote-endpoint =3D <&dwc3_0_role_switch>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +					usbc0_orien_sw: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_orientation_switch>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +					dp_altmode_mux: endpoint {
> +						remote-endpoint =3D <&usbdp_phy0_dp_altmode_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	status =3D "okay";
> +
> +	hym8563: rtc@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "hym8563";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hym8563_int>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +
> +	es8316: audio-codec@11 {
> +		compatible =3D "everest,es8316";
> +		reg =3D <0x11>;
> +		clocks =3D <&cru I2S0_8CH_MCLKOUT>;
> +		clock-names =3D "mclk";
> +		assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT>;
> +		assigned-clock-rates =3D <12288000>;
> +		#sound-dai-cells =3D <0>;
> +
> +		port {
> +			es8316_p0_0: endpoint {
> +				remote-endpoint =3D <&i2s0_8ch_p0_0>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2s0_8ch {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2s0_lrck
> +		     &i2s0_mclk
> +		     &i2s0_sclk
> +		     &i2s0_sdi0
> +		     &i2s0_sdo0>;
> +	status =3D "okay";
> +
> +	i2s0_8ch_p0: port {
> +		i2s0_8ch_p0_0: endpoint {
> +			dai-format =3D "i2s";
> +			mclk-fs =3D <256>;
> +			remote-endpoint =3D <&es8316_p0_0>;
> +		};
> +	};
> +};
> +
> +&i2s5_8ch {
> +	status =3D "okay";
> +};
> +
> +&i2s6_8ch {
> +	status =3D "okay";
> +};
> +
> +&package_thermal {
> +	polling-delay =3D <1000>;
> +
> +	trips {
> +		package_fan0: package-fan0 {
> +			temperature =3D <55000>;
> +			hysteresis =3D <2000>;
> +			type =3D "active";
> +		};
> +
> +		package_fan1: package-fan1 {
> +			temperature =3D <65000>;
> +			hysteresis =3D <2000>;
> +			type =3D "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map0 {
> +			trip =3D <&package_fan0>;
> +			cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> +		};
> +
> +		map1 {
> +			trip =3D <&package_fan1>;
> +			cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> +
> +&pcie2x1l0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_0_rst>;
> +	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l0>;
> +	status =3D "okay";
> +};
> +
> +&pcie2x1l2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_2_rst>;
> +	reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
> +	status =3D "okay";
> +};
> +
> +&pcie30phy {
> +	status =3D "okay";
> +};
> +
> +&pcie3x4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie3_rst>;
> +	reset-gpios =3D <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie30>;
> +	status =3D "okay";
> +};
> +
> +&pd_gpu {
> +	domain-supply =3D <&vdd_gpu_s0>;
> +};
> +
> +&pinctrl {
> +	hym8563 {
> +		hym8563_int: hym8563-int {
> +			rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie2 {
> +		pcie2_0_rst: pcie2-0-rst {
> +			rockchip,pins =3D <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		pcie2_2_rst: pcie2-2-rst {
> +			rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie3 {
> +		pcie3_rst: pcie3-rst {
> +			rockchip,pins =3D <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> +			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {
> +		usbc0_int: usbc0-int {
> +			rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		vbus5v0_typec_en: vbus5v0-typec-en {
> +			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&pwm1 {
> +	status =3D "okay";
> +};
> +
> +&saradc {
> +	vref-supply =3D <&avcc_1v8_s0>;
> +	status =3D "okay";
> +};
> +
> +&sdhci {
> +	bus-width =3D <8>;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	status =3D "okay";
> +};
> +
> +&sdmmc {
> +	max-frequency =3D <200000000>;
> +	no-sdio;
> +	no-mmc;
> +	bus-width =3D <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	cd-gpios =3D <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc_3v3_s3>;
> +	vqmmc-supply =3D <&vccio_sd_s0>;
> +	status =3D "okay";
> +};
> +
> +&sfc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&fspim2_pins>;
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <104000000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <1>;
> +		vcc-supply =3D <&vcc_3v3_s3>;
> +	};
> +};
> +
> +&spi2 {
> +	status =3D "okay";
> +	assigned-clocks =3D <&cru CLK_SPI2>;
> +	assigned-clock-rates =3D <200000000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi2m2_cs0 &spi2m2_pins>;
> +	num-cs =3D <1>;
> +
> +	pmic@0 {
> +		compatible =3D "rockchip,rk806";
> +		spi-max-frequency =3D <1000000>;
> +		reg =3D <0x0>;
> +
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pmic_pins>, <&rk806_dvs1_null>,
> +			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +
> +		system-power-controller;
> +
> +		vcc1-supply =3D <&vcc5v0_sys>;
> +		vcc2-supply =3D <&vcc5v0_sys>;
> +		vcc3-supply =3D <&vcc5v0_sys>;
> +		vcc4-supply =3D <&vcc5v0_sys>;
> +		vcc5-supply =3D <&vcc5v0_sys>;
> +		vcc6-supply =3D <&vcc5v0_sys>;
> +		vcc7-supply =3D <&vcc5v0_sys>;
> +		vcc8-supply =3D <&vcc5v0_sys>;
> +		vcc9-supply =3D <&vcc5v0_sys>;
> +		vcc10-supply =3D <&vcc5v0_sys>;
> +		vcc11-supply =3D <&vcc_2v0_pldo_s3>;
> +		vcc12-supply =3D <&vcc5v0_sys>;
> +		vcc13-supply =3D <&vcc_1v1_nldo_s3>;
> +		vcc14-supply =3D <&vcc_1v1_nldo_s3>;
> +		vcca-supply =3D <&vcc5v0_sys>;
> +
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		rk806_dvs1_null: dvs1-null-pins {
> +			pins =3D "gpio_pwrctrl1";
> +			function =3D "pin_fun0";
> +		};
> +
> +		rk806_dvs2_null: dvs2-null-pins {
> +			pins =3D "gpio_pwrctrl2";
> +			function =3D "pin_fun0";
> +		};
> +
> +		rk806_dvs3_null: dvs3-null-pins {
> +			pins =3D "gpio_pwrctrl3";
> +			function =3D "pin_fun0";
> +		};
> +
> +		regulators {
> +			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_gpu_s0";
> +				regulator-enable-ramp-delay =3D <400>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_cpu_lit_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_log_s0: dcdc-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <675000>;
> +				regulator-max-microvolt =3D <750000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_log_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;
> +				};
> +			};
> +
> +			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_vdenc_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_ddr_s0: dcdc-reg5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <675000>;
> +				regulator-max-microvolt =3D <900000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_ddr_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <850000>;
> +				};
> +			};
> +
> +			vdd2_ddr_s3: dcdc-reg6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name =3D "vdd2_ddr_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_2v0_pldo_s3: dcdc-reg7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <2000000>;
> +				regulator-max-microvolt =3D <2000000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_2v0_pldo_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt =3D <2000000>;
> +				};
> +			};
> +
> +			vcc_3v3_s3: dcdc-reg8 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc_3v3_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt =3D <3300000>;
> +				};
> +			};
> +
> +			vddq_ddr_s0: dcdc-reg9 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name =3D "vddq_ddr_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8_s3: dcdc-reg10 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc_1v8_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt =3D <1800000>;
> +				};
> +			};
> +
> +			avcc_1v8_s0: pldo-reg1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "avcc_1v8_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8_s0: pldo-reg2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc_1v8_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <1800000>;
> +				};
> +			};
> +
> +			avdd_1v2_s0: pldo-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1200000>;
> +				regulator-max-microvolt =3D <1200000>;
> +				regulator-name =3D "avdd_1v2_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3_s0: pldo-reg4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vcc_3v3_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vccio_sd_s0: pldo-reg5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vccio_sd_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			pldo6_s3: pldo-reg6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "pldo6_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt =3D <1800000>;
> +				};
> +			};
> +
> +			vdd_0v75_s3: nldo-reg1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <750000>;
> +				regulator-max-microvolt =3D <750000>;
> +				regulator-name =3D "vdd_0v75_s3";
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;
> +				};
> +			};
> +
> +			vdd_ddr_pll_s0: nldo-reg2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <850000>;
> +				regulator-max-microvolt =3D <850000>;
> +				regulator-name =3D "vdd_ddr_pll_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <850000>;
> +				};
> +			};
> +
> +			avdd_0v75_s0: nldo-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <750000>;
> +				regulator-max-microvolt =3D <750000>;
> +				regulator-name =3D "avdd_0v75_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_0v85_s0: nldo-reg4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <850000>;
> +				regulator-max-microvolt =3D <850000>;
> +				regulator-name =3D "vdd_0v85_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_0v75_s0: nldo-reg5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <750000>;
> +				regulator-max-microvolt =3D <750000>;
> +				regulator-name =3D "vdd_0v75_s0";
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&tsadc {
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-0 =3D <&uart2m0_xfer>;
> +	status =3D "okay";
> +};
> +
> +&u2phy0 {
> +	status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +	status =3D "okay";
> +};
> +
> +&u2phy1 {
> +	status =3D "okay";
> +};
> +
> +&u2phy1_otg {
> +	status =3D "okay";
> +};
> +
> +&u2phy2 {
> +	status =3D "okay";
> +};
> +
> +&u2phy2_host {
> +	/* connected to USB hub, which is powered by vcc5v0_sys */
> +	phy-supply =3D <&vcc5v0_sys>;
> +	status =3D "okay";
> +};
> +
> +&u2phy3 {
> +	status =3D "okay";
> +};
> +
> +&u2phy3_host {
> +	phy-supply =3D <&vcc5v0_host>;
> +	status =3D "okay";
> +};
> +
> +&usbdp_phy0 {
> +	mode-switch;
> +	orientation-switch;
> +	status =3D "okay";
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		usbdp_phy0_orientation_switch: endpoint@0 {
> +			reg =3D <0>;
> +			remote-endpoint =3D <&usbc0_orien_sw>;
> +		};
> +
> +		usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +			reg =3D <1>;
> +			remote-endpoint =3D <&dp_altmode_mux>;
> +		};
> +	};
> +};
> +
> +&usbdp_phy1 {
> +	status =3D "okay";
> +};
> +
> +&usb_host0_ehci {
> +	status =3D "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status =3D "okay";
> +};
> +
> +&usb_host0_xhci {
> +	usb-role-switch;
> +	status =3D "okay";
> +
> +	port {
> +		dwc3_0_role_switch: endpoint {
> +			remote-endpoint =3D <&usbc0_role_sw>;
> +		};
> +	};
> +};
> +
> +&usb_host1_ehci {
> +	status =3D "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status =3D "okay";
> +};
> +
> +&usb_host1_xhci {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&vop {
> +	status =3D "okay";
> +};
> +
> +&vop_mmu {
> +	status =3D "okay";
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +		reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> +		remote-endpoint =3D <&hdmi0_in_vp0>;
> +	};
> +};
> +
> +&vp1 {
> +	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
> +		reg =3D <ROCKCHIP_VOP2_EP_HDMI1>;
> +		remote-endpoint =3D <&hdmi1_in_vp1>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588-rock-5b.dtsi
> index 314fdc0c1c20b25b0fdc5254f3b090586c169a00..e5c474e4d02a6582efc3bd704=
d95df95bf9fb0ee 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> @@ -2,23 +2,9 @@
> =20
>  /dts-v1/;
> =20
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/soc/rockchip,vop2.h>
> -#include <dt-bindings/usb/pd.h>
> -#include "rk3588.dtsi"
> +#include "rk3588-rock-5b-5bp-5t.dtsi"
> =20
>  / {
> -	aliases {
> -		mmc0 =3D &sdhci;
> -		mmc1 =3D &sdmmc;
> -		mmc2 =3D &sdio;
> -	};
> -
> -	chosen {
> -		stdout-path =3D "serial2:1500000n8";
> -	};
> -
>  	analog-sound {
>  		compatible =3D "audio-graph-card";
>  		label =3D "rk3588-es8316";
> @@ -36,28 +22,6 @@ analog-sound {
>  		pinctrl-0 =3D <&hp_detect>;
>  	};
> =20
> -	hdmi0-con {
> -		compatible =3D "hdmi-connector";
> -		type =3D "a";
> -
> -		port {
> -			hdmi0_con_in: endpoint {
> -				remote-endpoint =3D <&hdmi0_out_con>;
> -			};
> -		};
> -	};
> -
> -	hdmi1-con {
> -		compatible =3D "hdmi-connector";
> -		type =3D "a";
> -
> -		port {
> -			hdmi1_con_in: endpoint {
> -				remote-endpoint =3D <&hdmi1_out_con>;
> -			};
> -		};
> -	};
> -
>  	leds {
>  		compatible =3D "gpio-leds";
>  		pinctrl-names =3D "default";
> @@ -71,452 +35,19 @@ led_rgb_b {
>  		};
>  	};
> =20
> -	fan: pwm-fan {
> -		compatible =3D "pwm-fan";
> -		cooling-levels =3D <0 120 150 180 210 240 255>;
> -		fan-supply =3D <&vcc5v0_sys>;
> -		pwms =3D <&pwm1 0 50000 0>;
> -		#cooling-cells =3D <2>;
> -	};
> -
>  	rfkill {
>  		compatible =3D "rfkill-gpio";
>  		label =3D "rfkill-m2-wlan";
>  		radio-type =3D "wlan";
>  		shutdown-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
>  	};
> -
> -	rfkill-bt {
> -		compatible =3D "rfkill-gpio";
> -		label =3D "rfkill-m2-bt";
> -		radio-type =3D "bluetooth";
> -		shutdown-gpios =3D <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	vcc12v_dcin: regulator-vcc12v-dcin {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vcc12v_dcin";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt =3D <12000000>;
> -		regulator-max-microvolt =3D <12000000>;
> -	};
> -
> -	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
> -		compatible =3D "regulator-fixed";
> -		enable-active-high;
> -		gpios =3D <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&pcie2_0_vcc3v3_en>;
> -		regulator-name =3D "vcc3v3_pcie2x1l0";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt =3D <3300000>;
> -		regulator-max-microvolt =3D <3300000>;
> -		startup-delay-us =3D <50000>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -	};
> -
> -	vcc3v3_pcie2x1l2: regulator-vcc3v3-pcie2x1l2 {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vcc3v3_pcie2x1l2";
> -		regulator-min-microvolt =3D <3300000>;
> -		regulator-max-microvolt =3D <3300000>;
> -		startup-delay-us =3D <5000>;
> -		vin-supply =3D <&vcc_3v3_s3>;
> -	};
> -
> -	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
> -		compatible =3D "regulator-fixed";
> -		enable-active-high;
> -		gpios =3D <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&pcie3_vcc3v3_en>;
> -		regulator-name =3D "vcc3v3_pcie30";
> -		regulator-min-microvolt =3D <3300000>;
> -		regulator-max-microvolt =3D <3300000>;
> -		startup-delay-us =3D <5000>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -	};
> -
> -	vcc5v0_host: regulator-vcc5v0-host {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vcc5v0_host";
> -		regulator-boot-on;
> -		regulator-always-on;
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -	};
> -
> -	vcc5v0_sys: regulator-vcc5v0-sys {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vcc5v0_sys";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&vcc12v_dcin>;
> -	};
> -
> -	vbus5v0_typec: vbus5v0-typec {
> -		compatible =3D "regulator-fixed";
> -		enable-active-high;
> -		gpio =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&vbus5v0_typec_en>;
> -		regulator-name =3D "vbus5v0_typec";
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -	};
> -
> -	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vcc_1v1_nldo_s3";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt =3D <1100000>;
> -		regulator-max-microvolt =3D <1100000>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -	};
> -};
> -
> -&combphy0_ps {
> -	status =3D "okay";
> -};
> -
> -&combphy1_ps {
> -	status =3D "okay";
> -};
> -
> -&combphy2_psu {
> -	status =3D "okay";
> -};
> -
> -&cpu_b0 {
> -	cpu-supply =3D <&vdd_cpu_big0_s0>;
> -};
> -
> -&cpu_b1 {
> -	cpu-supply =3D <&vdd_cpu_big0_s0>;
> -};
> -
> -&cpu_b2 {
> -	cpu-supply =3D <&vdd_cpu_big1_s0>;
> -};
> -
> -&cpu_b3 {
> -	cpu-supply =3D <&vdd_cpu_big1_s0>;
> -};
> -
> -&cpu_l0 {
> -	cpu-supply =3D <&vdd_cpu_lit_s0>;
> -};
> -
> -&cpu_l1 {
> -	cpu-supply =3D <&vdd_cpu_lit_s0>;
> -};
> -
> -&cpu_l2 {
> -	cpu-supply =3D <&vdd_cpu_lit_s0>;
> -};
> -
> -&cpu_l3 {
> -	cpu-supply =3D <&vdd_cpu_lit_s0>;
> -};
> -
> -&gpu {
> -	mali-supply =3D <&vdd_gpu_s0>;
> -	status =3D "okay";
> -};
> -
> -&hdmi0 {
> -	status =3D "okay";
> -};
> -
> -&hdmi0_in {
> -	hdmi0_in_vp0: endpoint {
> -		remote-endpoint =3D <&vp0_out_hdmi0>;
> -	};
> -};
> -
> -&hdmi0_out {
> -	hdmi0_out_con: endpoint {
> -		remote-endpoint =3D <&hdmi0_con_in>;
> -	};
> -};
> -
> -&hdmi0_sound {
> -	status =3D "okay";
> -};
> -
> -&hdmi1 {
> -	pinctrl-0 =3D <&hdmim0_tx1_cec &hdmim0_tx1_hpd
> -		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
> -	status =3D "okay";
> -};
> -
> -&hdmi1_in {
> -	hdmi1_in_vp1: endpoint {
> -		remote-endpoint =3D <&vp1_out_hdmi1>;
> -	};
> -};
> -
> -&hdmi1_out {
> -	hdmi1_out_con: endpoint {
> -		remote-endpoint =3D <&hdmi1_con_in>;
> -	};
> -};
> -
> -&hdmi1_sound {
> -	status =3D "okay";
> -};
> -
> -&hdmi_receiver_cma {
> -	status =3D "okay";
>  };
> =20
>  &hdmi_receiver {
>  	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> -	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_r=
x_sda &hdmirx_hpd>;
> -	pinctrl-names =3D "default";
> -	status =3D "okay";
> -};
> -
> -&hdptxphy0 {
> -	status =3D "okay";
> -};
> -
> -&hdptxphy1 {
> -	status =3D "okay";
> -};
> -
> -&i2c0 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&i2c0m2_xfer>;
> -	status =3D "okay";
> -
> -	vdd_cpu_big0_s0: regulator@42 {
> -		compatible =3D "rockchip,rk8602";
> -		reg =3D <0x42>;
> -		fcs,suspend-voltage-selector =3D <1>;
> -		regulator-name =3D "vdd_cpu_big0_s0";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt =3D <550000>;
> -		regulator-max-microvolt =3D <1050000>;
> -		regulator-ramp-delay =3D <2300>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -
> -		regulator-state-mem {
> -			regulator-off-in-suspend;
> -		};
> -	};
> -
> -	vdd_cpu_big1_s0: regulator@43 {
> -		compatible =3D "rockchip,rk8603", "rockchip,rk8602";
> -		reg =3D <0x43>;
> -		fcs,suspend-voltage-selector =3D <1>;
> -		regulator-name =3D "vdd_cpu_big1_s0";
> -		regulator-always-on;
> -		regulator-boot-on;
> -		regulator-min-microvolt =3D <550000>;
> -		regulator-max-microvolt =3D <1050000>;
> -		regulator-ramp-delay =3D <2300>;
> -		vin-supply =3D <&vcc5v0_sys>;
> -
> -		regulator-state-mem {
> -			regulator-off-in-suspend;
> -		};
> -	};
> -};
> -
> -&i2c4 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&i2c4m1_xfer>;
> -	status =3D "okay";
> -
> -	usbc0: usb-typec@22 {
> -		compatible =3D "fcs,fusb302";
> -		reg =3D <0x22>;
> -		interrupt-parent =3D <&gpio3>;
> -		interrupts =3D <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&usbc0_int>;
> -		vbus-supply =3D <&vbus5v0_typec>;
> -		/*
> -		 * When the board is starting to send power-delivery messages
> -		 * too late (5 seconds according to the specification), the
> -		 * power-supply reacts with a hard-reset. That removes the
> -		 * power from VBUS for some time, which resets te whole board.
> -		 */
> -		status =3D "fail";
> -
> -		usb_con: connector {
> -			compatible =3D "usb-c-connector";
> -			label =3D "USB-C";
> -			data-role =3D "dual";
> -			power-role =3D "sink";
> -			try-power-role =3D "sink";
> -			op-sink-microwatt =3D <1000000>;
> -			sink-pdos =3D
> -				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>,
> -				<PDO_VAR(5000, 20000, 5000)>;
> -
> -			ports {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -
> -				port@0 {
> -					reg =3D <0>;
> -					usbc0_role_sw: endpoint {
> -						remote-endpoint =3D <&dwc3_0_role_switch>;
> -					};
> -				};
> -
> -				port@1 {
> -					reg =3D <1>;
> -					usbc0_orien_sw: endpoint {
> -						remote-endpoint =3D <&usbdp_phy0_orientation_switch>;
> -					};
> -				};
> -
> -				port@2 {
> -					reg =3D <2>;
> -					dp_altmode_mux: endpoint {
> -						remote-endpoint =3D <&usbdp_phy0_dp_altmode_mux>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -&i2c6 {
> -	status =3D "okay";
> -
> -	hym8563: rtc@51 {
> -		compatible =3D "haoyu,hym8563";
> -		reg =3D <0x51>;
> -		#clock-cells =3D <0>;
> -		clock-output-names =3D "hym8563";
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&hym8563_int>;
> -		interrupt-parent =3D <&gpio0>;
> -		interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> -		wakeup-source;
> -	};
> -};
> -
> -&i2c7 {
> -	status =3D "okay";
> -
> -	es8316: audio-codec@11 {
> -		compatible =3D "everest,es8316";
> -		reg =3D <0x11>;
> -		clocks =3D <&cru I2S0_8CH_MCLKOUT>;
> -		clock-names =3D "mclk";
> -		assigned-clocks =3D <&cru I2S0_8CH_MCLKOUT>;
> -		assigned-clock-rates =3D <12288000>;
> -		#sound-dai-cells =3D <0>;
> -
> -		port {
> -			es8316_p0_0: endpoint {
> -				remote-endpoint =3D <&i2s0_8ch_p0_0>;
> -			};
> -		};
> -	};
> -};
> -
> -&i2s0_8ch {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&i2s0_lrck
> -		     &i2s0_mclk
> -		     &i2s0_sclk
> -		     &i2s0_sdi0
> -		     &i2s0_sdo0>;
> -	status =3D "okay";
> -
> -	i2s0_8ch_p0: port {
> -		i2s0_8ch_p0_0: endpoint {
> -			dai-format =3D "i2s";
> -			mclk-fs =3D <256>;
> -			remote-endpoint =3D <&es8316_p0_0>;
> -		};
> -	};
> -};
> -
> -&i2s5_8ch {
> -	status =3D "okay";
> -};
> -
> -&i2s6_8ch {
> -	status =3D "okay";
> -};
> -
> -&package_thermal {
> -	polling-delay =3D <1000>;
> -
> -	trips {
> -		package_fan0: package-fan0 {
> -			temperature =3D <55000>;
> -			hysteresis =3D <2000>;
> -			type =3D "active";
> -		};
> -
> -		package_fan1: package-fan1 {
> -			temperature =3D <65000>;
> -			hysteresis =3D <2000>;
> -			type =3D "active";
> -		};
> -	};
> -
> -	cooling-maps {
> -		map0 {
> -			trip =3D <&package_fan0>;
> -			cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> -		};
> -
> -		map1 {
> -			trip =3D <&package_fan1>;
> -			cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> -		};
> -	};
> -};
> -
> -&pcie2x1l0 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pcie2_0_rst>;
> -	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> -	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l0>;
> -	status =3D "okay";
> -};
> -
> -&pcie2x1l2 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pcie2_2_rst>;
> -	reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> -	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
> -	status =3D "okay";
> -};
> -
> -&pcie30phy {
>  	status =3D "okay";
>  };
> =20
> -&pcie3x4 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pcie3_rst>;
> -	reset-gpios =3D <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> -	vpcie3v3-supply =3D <&vcc3v3_pcie30>;
> -	status =3D "okay";
> -};
> -
> -&pd_gpu {
> -	domain-supply =3D <&vdd_gpu_s0>;
> -};
> -
>  &pinctrl {
>  	hdmirx {
>  		hdmirx_hpd: hdmirx-5v-detection {
> @@ -524,559 +55,32 @@ hdmirx_hpd: hdmirx-5v-detection {
>  		};
>  	};
> =20
> -	hym8563 {
> -		hym8563_int: hym8563-int {
> -			rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
> -
>  	leds {
>  		led_rgb_b: led-rgb-b {
>  			rockchip,pins =3D <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> =20
> -	sound {
> -		hp_detect: hp-detect {
> -			rockchip,pins =3D <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
> -
>  	pcie2 {
> -		pcie2_0_rst: pcie2-0-rst {
> -			rockchip,pins =3D <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -
>  		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
>  			rockchip,pins =3D <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
> -
> -		pcie2_2_rst: pcie2-2-rst {
> -			rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
>  	};
> =20
> -	pcie3 {
> -		pcie3_rst: pcie3-rst {
> -			rockchip,pins =3D <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -
> -		pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> -			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
> -
> -	usb {
> -		usbc0_int: usbc0-int {
> -			rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -
> -		vbus5v0_typec_en: vbus5v0-typec-en {
> -			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
> -};
> -
> -&pwm1 {
> -	status =3D "okay";
> -};
> -
> -&saradc {
> -	vref-supply =3D <&avcc_1v8_s0>;
> -	status =3D "okay";
> -};
> -
> -&sdhci {
> -	bus-width =3D <8>;
> -	no-sdio;
> -	no-sd;
> -	non-removable;
> -	mmc-hs400-1_8v;
> -	mmc-hs400-enhanced-strobe;
> -	status =3D "okay";
> -};
> -
> -&sdmmc {
> -	max-frequency =3D <200000000>;
> -	no-sdio;
> -	no-mmc;
> -	bus-width =3D <4>;
> -	cap-mmc-highspeed;
> -	cap-sd-highspeed;
> -	cd-gpios =3D <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> -	disable-wp;
> -	sd-uhs-sdr104;
> -	vmmc-supply =3D <&vcc_3v3_s3>;
> -	vqmmc-supply =3D <&vccio_sd_s0>;
> -	status =3D "okay";
> -};
> -
> -&sfc {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&fspim2_pins>;
> -	status =3D "okay";
> -
> -	flash@0 {
> -		compatible =3D "jedec,spi-nor";
> -		reg =3D <0>;
> -		spi-max-frequency =3D <104000000>;
> -		spi-rx-bus-width =3D <4>;
> -		spi-tx-bus-width =3D <1>;
> -		vcc-supply =3D <&vcc_3v3_s3>;
> -	};
> -};
> -
> -&spi2 {
> -	status =3D "okay";
> -	assigned-clocks =3D <&cru CLK_SPI2>;
> -	assigned-clock-rates =3D <200000000>;
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&spi2m2_cs0 &spi2m2_pins>;
> -	num-cs =3D <1>;
> -
> -	pmic@0 {
> -		compatible =3D "rockchip,rk806";
> -		spi-max-frequency =3D <1000000>;
> -		reg =3D <0x0>;
> -
> -		interrupt-parent =3D <&gpio0>;
> -		interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> -
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&pmic_pins>, <&rk806_dvs1_null>,
> -			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> -
> -		system-power-controller;
> -
> -		vcc1-supply =3D <&vcc5v0_sys>;
> -		vcc2-supply =3D <&vcc5v0_sys>;
> -		vcc3-supply =3D <&vcc5v0_sys>;
> -		vcc4-supply =3D <&vcc5v0_sys>;
> -		vcc5-supply =3D <&vcc5v0_sys>;
> -		vcc6-supply =3D <&vcc5v0_sys>;
> -		vcc7-supply =3D <&vcc5v0_sys>;
> -		vcc8-supply =3D <&vcc5v0_sys>;
> -		vcc9-supply =3D <&vcc5v0_sys>;
> -		vcc10-supply =3D <&vcc5v0_sys>;
> -		vcc11-supply =3D <&vcc_2v0_pldo_s3>;
> -		vcc12-supply =3D <&vcc5v0_sys>;
> -		vcc13-supply =3D <&vcc_1v1_nldo_s3>;
> -		vcc14-supply =3D <&vcc_1v1_nldo_s3>;
> -		vcca-supply =3D <&vcc5v0_sys>;
> -
> -		gpio-controller;
> -		#gpio-cells =3D <2>;
> -
> -		rk806_dvs1_null: dvs1-null-pins {
> -			pins =3D "gpio_pwrctrl1";
> -			function =3D "pin_fun0";
> -		};
> -
> -		rk806_dvs2_null: dvs2-null-pins {
> -			pins =3D "gpio_pwrctrl2";
> -			function =3D "pin_fun0";
> -		};
> -
> -		rk806_dvs3_null: dvs3-null-pins {
> -			pins =3D "gpio_pwrctrl3";
> -			function =3D "pin_fun0";
> -		};
> -
> -		regulators {
> -			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <550000>;
> -				regulator-max-microvolt =3D <950000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vdd_gpu_s0";
> -				regulator-enable-ramp-delay =3D <400>;
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <550000>;
> -				regulator-max-microvolt =3D <950000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vdd_cpu_lit_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vdd_log_s0: dcdc-reg3 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <675000>;
> -				regulator-max-microvolt =3D <750000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vdd_log_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -					regulator-suspend-microvolt =3D <750000>;
> -				};
> -			};
> -
> -			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <550000>;
> -				regulator-max-microvolt =3D <950000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vdd_vdenc_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vdd_ddr_s0: dcdc-reg5 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <675000>;
> -				regulator-max-microvolt =3D <900000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vdd_ddr_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -					regulator-suspend-microvolt =3D <850000>;
> -				};
> -			};
> -
> -			vdd2_ddr_s3: dcdc-reg6 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-name =3D "vdd2_ddr_s3";
> -
> -				regulator-state-mem {
> -					regulator-on-in-suspend;
> -				};
> -			};
> -
> -			vcc_2v0_pldo_s3: dcdc-reg7 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <2000000>;
> -				regulator-max-microvolt =3D <2000000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vdd_2v0_pldo_s3";
> -
> -				regulator-state-mem {
> -					regulator-on-in-suspend;
> -					regulator-suspend-microvolt =3D <2000000>;
> -				};
> -			};
> -
> -			vcc_3v3_s3: dcdc-reg8 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <3300000>;
> -				regulator-max-microvolt =3D <3300000>;
> -				regulator-name =3D "vcc_3v3_s3";
> -
> -				regulator-state-mem {
> -					regulator-on-in-suspend;
> -					regulator-suspend-microvolt =3D <3300000>;
> -				};
> -			};
> -
> -			vddq_ddr_s0: dcdc-reg9 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-name =3D "vddq_ddr_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vcc_1v8_s3: dcdc-reg10 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> -				regulator-name =3D "vcc_1v8_s3";
> -
> -				regulator-state-mem {
> -					regulator-on-in-suspend;
> -					regulator-suspend-microvolt =3D <1800000>;
> -				};
> -			};
> -
> -			avcc_1v8_s0: pldo-reg1 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> -				regulator-name =3D "avcc_1v8_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vcc_1v8_s0: pldo-reg2 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> -				regulator-name =3D "vcc_1v8_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -					regulator-suspend-microvolt =3D <1800000>;
> -				};
> -			};
> -
> -			avdd_1v2_s0: pldo-reg3 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <1200000>;
> -				regulator-max-microvolt =3D <1200000>;
> -				regulator-name =3D "avdd_1v2_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vcc_3v3_s0: pldo-reg4 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <3300000>;
> -				regulator-max-microvolt =3D <3300000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vcc_3v3_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vccio_sd_s0: pldo-reg5 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <3300000>;
> -				regulator-ramp-delay =3D <12500>;
> -				regulator-name =3D "vccio_sd_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			pldo6_s3: pldo-reg6 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> -				regulator-name =3D "pldo6_s3";
> -
> -				regulator-state-mem {
> -					regulator-on-in-suspend;
> -					regulator-suspend-microvolt =3D <1800000>;
> -				};
> -			};
> -
> -			vdd_0v75_s3: nldo-reg1 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <750000>;
> -				regulator-max-microvolt =3D <750000>;
> -				regulator-name =3D "vdd_0v75_s3";
> -
> -				regulator-state-mem {
> -					regulator-on-in-suspend;
> -					regulator-suspend-microvolt =3D <750000>;
> -				};
> -			};
> -
> -			vdd_ddr_pll_s0: nldo-reg2 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <850000>;
> -				regulator-max-microvolt =3D <850000>;
> -				regulator-name =3D "vdd_ddr_pll_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -					regulator-suspend-microvolt =3D <850000>;
> -				};
> -			};
> -
> -			avdd_0v75_s0: nldo-reg3 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <750000>;
> -				regulator-max-microvolt =3D <750000>;
> -				regulator-name =3D "avdd_0v75_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vdd_0v85_s0: nldo-reg4 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <850000>;
> -				regulator-max-microvolt =3D <850000>;
> -				regulator-name =3D "vdd_0v85_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -
> -			vdd_0v75_s0: nldo-reg5 {
> -				regulator-always-on;
> -				regulator-boot-on;
> -				regulator-min-microvolt =3D <750000>;
> -				regulator-max-microvolt =3D <750000>;
> -				regulator-name =3D "vdd_0v75_s0";
> -
> -				regulator-state-mem {
> -					regulator-off-in-suspend;
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -&tsadc {
> -	status =3D "okay";
> -};
> -
> -&uart2 {
> -	pinctrl-0 =3D <&uart2m0_xfer>;
> -	status =3D "okay";
> -};
> -
> -&u2phy0 {
> -	status =3D "okay";
> -};
> -
> -&u2phy0_otg {
> -	status =3D "okay";
> -};
> -
> -&u2phy1 {
> -	status =3D "okay";
> -};
> -
> -&u2phy1_otg {
> -	status =3D "okay";
> -};
> -
> -&u2phy2 {
> -	status =3D "okay";
> -};
> -
> -&u2phy2_host {
> -	/* connected to USB hub, which is powered by vcc5v0_sys */
> -	phy-supply =3D <&vcc5v0_sys>;
> -	status =3D "okay";
> -};
> -
> -&u2phy3 {
> -	status =3D "okay";
> -};
> -
> -&u2phy3_host {
> -	phy-supply =3D <&vcc5v0_host>;
> -	status =3D "okay";
> -};
> -
> -&usbdp_phy0 {
> -	mode-switch;
> -	orientation-switch;
> -	status =3D "okay";
> -
> -	port {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		usbdp_phy0_orientation_switch: endpoint@0 {
> -			reg =3D <0>;
> -			remote-endpoint =3D <&usbc0_orien_sw>;
> -		};
> -
> -		usbdp_phy0_dp_altmode_mux: endpoint@1 {
> -			reg =3D <1>;
> -			remote-endpoint =3D <&dp_altmode_mux>;
> -		};
> -	};
> -};
> -
> -&usbdp_phy1 {
> -	status =3D "okay";
> -};
> -
> -&usb_host0_ehci {
> -	status =3D "okay";
> -};
> -
> -&usb_host0_ohci {
> -	status =3D "okay";
> -};
> -
> -&usb_host0_xhci {
> -	usb-role-switch;
> -	status =3D "okay";
> -
> -	port {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		dwc3_0_role_switch: endpoint {
> -			remote-endpoint =3D <&usbc0_role_sw>;
> +	sound {
> +		hp_detect: hp-detect {
> +			rockchip,pins =3D <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
>  };
> =20
> -&usb_host1_ehci {
> -	status =3D "okay";
> -};
> -
> -&usb_host1_ohci {
> -	status =3D "okay";
> -};
> -
> -&usb_host1_xhci {
> -	dr_mode =3D "host";
> -	status =3D "okay";
> -};
> -
>  &usb_host2_xhci {
>  	status =3D "okay";
>  };
> =20
> -&vop {
> -	status =3D "okay";
> -};
> -
> -&vop_mmu {
> +&vcc3v3_pcie2x1l0 {
> +	gpios =3D <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_0_vcc3v3_en>;
>  	status =3D "okay";
>  };
> -
> -&vp0 {
> -	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> -		reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> -		remote-endpoint =3D <&hdmi0_in_vp0>;
> -	};
> -};
> -
> -&vp1 {
> -	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
> -		reg =3D <ROCKCHIP_VOP2_EP_HDMI1>;
> -		remote-endpoint =3D <&hdmi1_in_vp1>;
> -	};
> -};
>=20
> --=20
> 2.49.0
>=20

--2afqxde2ye2gytr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgd/2YACgkQ2O7X88g7
+prfJxAAgmrQudbbjq0Dyblhg1n5G9pdEqFxzZsAhnUCK7q+gqhKLtXsPKKtON3d
L7nPq78gTm0DqKgGrCPtYjcK3SvB3y4MiUqd9gOrzy7OJMvdYFC25+TuoLv1Oc0h
vQ3eZNIQaoK5R/TZnlFLntcBlWNl7iPm3Zp76kIZ3DOHv3RXKvGx2Z8Yp7fCNVz8
JetoMklBomblpcNd5tP6C+Zpv7NzKriEeO/wV/RA2DNP+xqpC3OgJ8ak6BlNm1yx
GpXdy8UyT6Beevlz6AXeRfypel53GJukzRtssjE9iFR4iaR8/cVmOZzDPlrn4lBK
JY34McPDYz23lkOuQ5rTi17bgJ8giu5EF9mnMb3JQIiCDHvKjzC5bkNljffTOA+A
EjK+XJIUs2ifHEKRnPdF1BLd/w2JSsBZXSXZha1yRc8asGVA7lFTWwOPPST3zCsE
8lASBbVs4aqIg7+yphOdLRisDRoULzPCzKxpBFHDM4jo2sxBvJuO5Hjdz7r+kjKO
uSgdxPNkZf/L3LYI3u98qcWxAbJHg26BbFNfiSosNSqH2WwyX9sD3eZJtDvjusqw
8k6cmzJqhZS4Dt1WnbmDC9IsO2VUgO0CuVl0h8MkOUiqwnPWAmgApE+0hhegmsHd
NBcnG/TFhs9OAx0LGf4tPI6hV/x8DUIMOvB69xJfloAgoot0cHI=
=cqws
-----END PGP SIGNATURE-----

--2afqxde2ye2gytr2--
