Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0651DED4A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251151; cv=none; b=oBXE6GRFn1utm1Z2UDaRJXqHktpMFYWq5s5oKeo4nTPrZn/HHYAA1BMO8zvxITEyLDCLzA4HN322s3wW2mYrZVW+GAWXARGjZZsIV3dxyhD+88b/L00YFwowWSEJMuQavJvkt8bqVyZyn7FxnD99qF+SKftPV7lX+r8PNxhtSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251151; c=relaxed/simple;
	bh=H2oDc2BAPhOVfLc7NGNX95Ad/OxI6HM89N5f+htCNsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6VLV56mQm2qriDOLBLnB31CiCqw5E7F1kWEyehBGsft721xXW9Z5AVn72XuVU3NvOAB5lCWjTbmmbAwxA3bqSCC4Yh5SXd9ESL/GwBBWo6icNki21/R74qZCh/ppJ9XrTHDlGoaglg/KHacUO5Am6rr+7kldBIsHNid0WRD0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uJTyj-0005AD-Dn; Mon, 26 May 2025 11:18:41 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uJTyj-000E19-0B;
	Mon, 26 May 2025 11:18:41 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 94A2C419BBC;
	Mon, 26 May 2025 09:18:40 +0000 (UTC)
Date: Mon, 26 May 2025 11:18:40 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
Message-ID: <20250526-dandelion-rooster-of-bliss-41d420-mkl@pengutronix.de>
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de>
 <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7u3iuswslneeov4k"
Content-Disposition: inline
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org


--7u3iuswslneeov4k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
MIME-Version: 1.0

On 23.05.2025 20:16:48, Fabian Pflug wrote:
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
>=20
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
>=20
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
>=20
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 630 +++++++++++++++=
++++++
>  2 files changed, 631 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index b6d3fe26d621234ab84353165d20af9d2536f839..c703fce2ebfd8074bd0c6ee76=
f3c6f9bbd9cf179 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -295,6 +295,7 @@ imx93-9x9-qsb-i3c-dtbs +=3D imx93-9x9-qsb.dtb imx93-9=
x9-qsb-i3c.dtbo
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb-i3c.dtb
> =20
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx93-11x11-frdm.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1422946f7eb5799a9cc21fc9=
3f75fc3a45ebcf5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -0,0 +1,630 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx93.dtsi"
> +
> +/ {
> +	model =3D "NXP i.MX93 11X11 FRDM board";
> +	compatible =3D "fsl,imx93-11x11-frdm", "fsl,imx93";
> +
> +	chosen {
> +		stdout-path =3D &lpuart1;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			alloc-ranges =3D <0 0x80000000 0 0x30000000>;
> +			size =3D <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +
> +		vdev0vring0: vdev0vring0@a4000000 {
> +			reg =3D <0 0xa4000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@a4008000 {
> +			reg =3D <0 0xa4008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@a4010000 {
> +			reg =3D <0 0xa4010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@a4018000 {
> +			reg =3D <0 0xa4018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@2021e000 {
> +			reg =3D <0 0x2021e000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@a4020000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0xa4020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +	};
> +
> +	reg_vdd_12v: regulator-vdd-12v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "reg_vdd_12v";
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		gpio =3D <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vref_1v8";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +	};
> +
> +	reg_can2_standby: regulator-can2-stby {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "can2-stby";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pcal6524 23 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		off-on-delay-us =3D <12000>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "WLAN_EN";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us =3D <20000>;
> +		enable-active-high;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply =3D <&reg_vref_1v8>;
> +	status =3D "okay";
> +};
> +
> +&cm33 {
> +	mbox-names =3D "tx", "rx", "rxdb";
> +	mboxes =3D <&mu1 0 1>,
> +		 <&mu1 1 1>,
> +		 <&mu1 3 1>;
> +	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	status =3D "okay";
> +};
> +
> +&eqos {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&pinctrl_eqos>;
> +	pinctrl-1 =3D <&pinctrl_eqos_sleep>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy1>;
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		clock-frequency =3D <5000000>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			reg =3D <1>;
> +			reset-gpios =3D <&pcal6524 15 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <80000>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&pinctrl_fec>;
> +	pinctrl-1 =3D <&pinctrl_fec_sleep>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy2>;
> +	fsl,magic-packet;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		clock-frequency =3D <5000000>;
> +
> +		ethphy2: ethernet-phy@2 {
> +			reg =3D <2>;
> +			eee-broken-1000t;
> +			reset-gpios =3D <&pcal6524 16 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <80000>;
> +		};
> +	};
> +};
> +
> +&flexcan2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> +	xceiver-supply =3D <&reg_can2_standby>;
> +	status =3D "okay";
> +};

Since d80bfde3c57a ("can: flexcan: add transceiver capabilities"), which
got mainline with v6.15-rc1 there is proper PHY support in the flexcan
driver. So from my point of view, there's no need to stick to regulator
hack.

See 87d60c4663b6 ("arm64: dts: ti: k3-j721e-common-proc-board: Add
support for mcu and main mcan nodes") for an example.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--7u3iuswslneeov4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmg0MewACgkQDHRl3/mQ
kZz50wgAn9Wh9mX7RSnF8dqGdbOYTvM19I/6oNQXlmkMuhckfC5yYnyAaefDkYnP
bPlGWMo+NBPUox47M0HVeVJF5TNIgJ/wob5cV813+GXi4RZOuDPQspAkwlCR+lQ1
b/fYoz/b6z9zk23bODHSSlzIaAtgjGjQhKv5CF0vG4au121B4hMfWOMw4ZrzVq9j
9rCBPgtm7eRlLz1CZavGwsFbwIjabD/SN2PZmmONgeAOOoq4RgugfNzX7rAU3WOa
CfswrKfatWytTXq7hXBQoJ0NWj8W1bFwMW1v0YvwPkrW1tmrHYyf3ZH9MgYBdbOA
ib0r84yfp/5y8ugNGPn2am88ii5lSA==
=GSEO
-----END PGP SIGNATURE-----

--7u3iuswslneeov4k--
