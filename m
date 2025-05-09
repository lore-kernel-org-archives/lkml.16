Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454B29188C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796701; cv=none; b=QOYdKPEXSaXGc3DiOjNBlzVxRJCR53PcTApyZ4JEtGb/b622vRtiwldlvNp6GHVnIbyas3A2h4jR8bQq7OWwGIN6IbDxDzaFaPLcU628RaLKOlgB+OLdWawXu8Ay3GQCjs37SmApHOo4KYlkVfaYyR9IjihkBRLSBuVcUMoPq7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796701; c=relaxed/simple;
	bh=8OquTIt/vmD6K9arovO7DOyoUElUpbG67nqKF7oIvnw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=BWVDoZZ5c9B1qfWsA6Wu8KEZ7j5DmPl8maimrXv5lq14DsY+ACVErwTenxS+nuajsX3aNuScjVLQqwk+T16FD376oQ+gBmZh5h4xVC87KfivfMSNM32avwUpV6SZKTHikD+eI3e6Cjt3GevxJJHj+XAFROgaT7nd60m+MHYd+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Evi6SeZG; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Evi6SeZG"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746796686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nVdoRmzHdJIDzHX5mXnwcwEn0rBmpBpiL6BVXHOZ+ps=;
	b=Evi6SeZGpNRULGqJy6DsClZaUaVxL+vZt/e/PDbDKVn3OV5tm3qwkxMpY5ZOVL6S04fICi
	XVauFECRsbn3Jiy1FYHzyur1/SWCc4XNgvBZAH8s5/lpGPmJmASFBZ3rcOvQ/8PgUDncfa
	uQnV3mXFbn2XijbZmq5IXjipzQ/8ObVcBfdgwHHkGvrGjOl9BaYJBMkt0MHrtEr8aIDjqU
	jFv3e7xsRKmPuYP55cJAsfcO7J9a+QmkfuK07n72QOuaaPy/oE1pg0X+gXGjj6Le3yjLad
	sifi7XLlwBhfxS+cRHPHNmZU94m2xGYU6aq6uplgFiNdQYFHuf+MGIQVId081Q==
Content-Type: multipart/signed;
 boundary=33bca27b73304a4270d6ea8fbc04c0d790682b0e0c2dc71e4f7c11e0ec14;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 15:18:04 +0200
Message-Id: <D9RNQUO6IKFU.9BYJLSAQV9WT@cknow.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: add USB-C support for ROCK
 5B+
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Heiko Stuebner"
 <heiko@sntech.de>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-5-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-5-677033cc1ac2@kernel.org>
X-Migadu-Flow: FLOW_OUT

--33bca27b73304a4270d6ea8fbc04c0d790682b0e0c2dc71e4f7c11e0ec14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
> Add hardware description for the USB-C port in the Radxa ROCK 5 Model B+
> This describes the OHCI, EHCI and XHCI USB parts, but not yet the Display=
Port
> AltMode, since the bindings for that are not yet upstream.
>
> Support for the ROCK 5B is prepared, but not exposed at the moment,
> since it results in unreliable boot behavior due to hard resets killing
> the supply voltage. Some further investigation and fixes in the kernel's
> Type-C Port Manager (TCPM) state machine is needed before exposing the
> port. The ROCK 5B+ has a dedicated port for powering the board and thus
> is not affected.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  16 +++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  23 ++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 137 +++++++++++++++=
++++++
>  3 files changed, 176 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arch/=
arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
> index 74c7b6502e4dda4b774f43c704ebaee350703c0d..4096cd853f9a909e4233d2c61=
a1fe5ee83904c4c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
> @@ -99,12 +99,28 @@ pcie3x2_rst: pcie3x2-rst {
>  	};
> =20
>  	usb {
> +		usbc_sbu_dc: usbc-sbu-dc {
> +			rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
> +					<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>  		vcc5v0_host_en: vcc5v0-host-en {
>  			rockchip,pins =3D <1 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
>  };
> =20
> +&usbc0 {
> +	status =3D "okay";
> +};
> +
> +&usbdp_phy0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usbc_sbu_dc>;
> +	sbu1-dc-gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
> +};
> +
>  &vcc5v0_host {
>  	enable-active-high;
>  	gpio =3D <&gpio1 RK_PA1 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64=
/boot/dts/rockchip/rk3588-rock-5b.dts
> index 9407a7c9910ada1f6c803d2e15785a9cbd9bd655..ab0c572ea9234f373af4a47db=
93fc1786f0e6fbf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -36,8 +36,20 @@ &uart6 {
>  	status =3D "okay";
>  };
> =20
> +&usbdp_phy0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usbc_sbu_dc>;
> +	sbu1-dc-gpios =3D <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> +};
> +
>  &pinctrl {
>  	usb {
> +		usbc_sbu_dc: usbc-sbu-dc {
> +			rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
> +					<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;

Shouldn't these be <4 RK_PA6 ...> and <4 RK_PA7 ...> ?

In the rock5bp_v1.2 schematic they're (IIUC) GPIO0_C4 and _C5, but in
rock_5b_v1450 schematic TYPEC0_SBU1_DC and TYPEC0_SBU2_DC are on
GPIO4_A6 and GPIO4_A7.

And in rock_5b_v1450 GPIO0_C4 and _C5 are connected to WIFI_REG_ON_H and
BT_W AKE_HOST_H respectively.

Cheers,
  Diederik

> +		};
> +
>  		vcc5v0_host_en: vcc5v0-host-en {
>  			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
> @@ -50,3 +62,14 @@ &vcc5v0_host {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&vcc5v0_host_en>;
>  };
> +
> +/*
> + * Do not yet offer USB-C support on the Rock 5B. The current U-Boot
> + * Linux setup is quite unstable and for many power-supplies needs multi=
ple
> + * hard resets to boot to userspace. Let's enable this once the issues
> + * in the TCPM kernel code have been solved. Without this any automated
> + * boot tests will run into problems.
> + */
> +/delete-node/ &usbc0;
> +/delete-node/ &usb_host0_xhci;
> +/delete-node/ &usbdp_phy0;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588-rock-5b.dtsi
> index 6052787d2560978d2bae6cfbeea5fc1d419d583a..314fdc0c1c20b25b0fdc5254f=
3b090586c169a00 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> @@ -5,6 +5,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "rk3588.dtsi"
> =20
>  / {
> @@ -92,6 +93,15 @@ rfkill-bt {
>  		shutdown-gpios =3D <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> +	vcc12v_dcin: regulator-vcc12v-dcin {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +	};
> +
>  	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
>  		compatible =3D "regulator-fixed";
>  		enable-active-high;
> @@ -146,6 +156,19 @@ vcc5v0_sys: regulator-vcc5v0-sys {
>  		regulator-boot-on;
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
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
>  	};
> =20
>  	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> @@ -309,6 +332,67 @@ regulator-state-mem {
>  	};
>  };
> =20
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
>  &i2c6 {
>  	status =3D "okay";
> =20
> @@ -481,6 +565,16 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
>  			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
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
>  };
> =20
>  &pwm1 {
> @@ -866,6 +960,14 @@ &uart2 {
>  	status =3D "okay";
>  };
> =20
> +&u2phy0 {
> +	status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +	status =3D "okay";
> +};
> +
>  &u2phy1 {
>  	status =3D "okay";
>  };
> @@ -893,6 +995,27 @@ &u2phy3_host {
>  	status =3D "okay";
>  };
> =20
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
>  &usbdp_phy1 {
>  	status =3D "okay";
>  };
> @@ -905,6 +1028,20 @@ &usb_host0_ohci {
>  	status =3D "okay";
>  };
> =20
> +&usb_host0_xhci {
> +	usb-role-switch;
> +	status =3D "okay";
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		dwc3_0_role_switch: endpoint {
> +			remote-endpoint =3D <&usbc0_role_sw>;
> +		};
> +	};
> +};
> +
>  &usb_host1_ehci {
>  	status =3D "okay";
>  };


--33bca27b73304a4270d6ea8fbc04c0d790682b0e0c2dc71e4f7c11e0ec14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB4AjgAKCRDXblvOeH7b
bt6iAP4kthtjrbYmyarcnjN/1gVMWFkZhBOQ9q75f2+QZUWYKQD/WnNV8qywAzPX
7WOOlBtd2T/Qhse1vAlbhjcj/yu05Qo=
=RLtz
-----END PGP SIGNATURE-----

--33bca27b73304a4270d6ea8fbc04c0d790682b0e0c2dc71e4f7c11e0ec14--
