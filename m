Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43B27FB16;
	Thu, 15 May 2025 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298601; cv=none; b=p0qB3bLMs6dp7xc9eSHaQig+s2eqvlypLjoDVrUHvDpHgk/LmgBGxyyT4PNyWSRZogDhSbFW+Cv1741c6R4XXOfrAnmHVV2lE9FcV6qqdfYhLat+8mb2rJPeyJ90JxEx9uLJWydLay9XhwbT0kyl9N4u1txbBXajvmmd5Pl+gG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298601; c=relaxed/simple;
	bh=RpaXVrQbnvYUQk3Hnump1P4stXQ7wnDT+auZbBi9P3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CVsmn5LzgEj6BGy5YEPUlkMhkTj86EgzLRtmURw6WJVzlsMu3alKNFHg1HNRwk6LhdKdVTGM80gvqufCOxAVV7Yuk+670GHZrcx6WlY7Q+N+weJicnbFWWjruZW9tVlRKywp2xswGaZTxt1+uge/uFVZ5MWoehnjtJsVR44nbUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pSNuqexB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pSNuqexB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=T0GxpaCjXWr2g+O57YadYwZFJK7Y/BlqdjhClDZbjhc=; b=pSNuqexBq/FXf2OxGgcHCOFraQ
	6VyRXdhiDXRY30HfbBt+g9lcAcUtVeX/tqBMfOZa0yrXnADiuOlVXIKlfuZXhXyaoy/lnKF7W1eC8
	/ZNyhoTT6JvY3cu4UnHep2a2ixZL0Dreyb/RySUI4+1KpEb3+Q9TGGCzpW38hGX/jx9jlAyLGXIgn
	m9N3mVwcRPN5cCTrxYR74ahxBk0J3oz1STLPzlteDCvhjHaa3dS/NxdJ5M1m4mi58tOb1mgEetkXi
	eYxGcBDPJvugNR6k2B4kghTRMB5EvTMAiaMT+ViVAjsz2ZndSoTrrPB81cC0WUMHUS86Gjo/LNbNt
	KfdJbzyA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFUBM-0000Do-EH; Thu, 15 May 2025 10:43:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>
Subject: Re: [RFC PATCH 1/1] arm64: dts: rockchip: add Radxa CM5 and IO board
Date: Thu, 15 May 2025 10:43:11 +0200
Message-ID: <9103406.VV5PYv0bhD@diego>
In-Reply-To: <20250514173856.3677454-1-joseph.kogut@gmail.com>
References: <20250514173856.3677454-1-joseph.kogut@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Joseph,

Am Mittwoch, 14. Mai 2025, 19:38:56 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Joseph Kogut:
> Add initial support for the Radxa CM5 and the accompanying IO board,
> including ethernet, USB 2.0/3.0, PCIe 2.0, HDMI output, UART2 console,
> SD/eMMC, PMIC.
>=20
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>

please don't add "offline" reviews to initial patch submissions.

Review should happen in public, so I'd expect an actual mail from Steve
as a reply to this patch, stating his Reviewed-by tag.

After that, you'd add it to a possible v2.

> ---
> This is my first attempt at submitting a new device tree upstream.
> Feedback is welcome on DT conventions, naming, or anything I may have
> missed.
>=20
> This is largely reversed from the Radxa kernel sources as a reference.
>=20
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 448 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-radxa-cm5.dtsi  | 151 ++++++

You'll need a 2nd patch to add the board compatible to the binding in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/arm/rockchip.yaml

You can take a look at the CM3-variant for how to do system-on-module
plus baseboard variants.


>  3 files changed, 600 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 3e8771ef69ba..6bbd506808a3 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -175,6 +175,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-khadas-edge2=
=2Edtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb

please sort alphabetically

>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-rock-5a.dtb

[...]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> new file mode 100644
> index 000000000000..e3c2e00d0fa6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;

some authorship / copyright thingy here maybe?

> +&i2c6 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c6m3_xfer>;

status as last property - aka here


> +&pinctrl {
> +	fusb302 {
> +		vbus5v0_typec_en: vbus5v0-typec-en {
> +			rockchip,pins =3D <0 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		usbc0_int: usbc0-int {
> +			rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	usb {
> +		vcc5v0_host_en: vcc5v0-host-en {
> +			rockchip,pins =3D <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +

double empty line

> +&sdhci {
> +	status =3D "okay";
> +};
> +
> +&u2phy0 {
> +	status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +	rockchip,typec-vbus-det;

I don't think this property exists in mainline ;-) .

Please run something like=20
  make ARCH=3Darm64 CHECK_DTBS=3Dy rockchip/rk3588s-radxa-cm5-io.dtb
to make sure


> +	status =3D "okay";
> +};
> +
> +&u2phy2 {
> +	status =3D "okay";
> +};
> +
> +&u2phy2_host {
> +	status =3D "okay";
> +};
> +
> +&u2phy3 {
> +	status =3D "okay";
> +};
> +
> +&u2phy3_host {
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2m0_xfer>;

status here please

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
> +	dr_mode =3D "otg";
> +	usb-role-switch;
> +	status =3D "okay";
> +
> +	port {
> +		usb_host0_xhci_role_switch: endpoint {
> +			remote-endpoint =3D <&usbc0_role_switch>;
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
> +&usbdp_phy0 {
> +	status =3D "okay";
> +	mode-switch;
> +	orientation-switch;
> +	sbu1-dc-gpios =3D <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		usbdp_phy0_orientation_switch: endpoint@0 {
> +			reg =3D <0>;
> +			remote-endpoint =3D <&usbc0_orientation_switch>;
> +		};
> +
> +		usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +			reg =3D <1>;
> +			remote-endpoint =3D <&usbc0_dp_altmode_mux>;
> +		};
> +	};
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
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> new file mode 100644
> index 000000000000..ca208fa42347
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

again copyright/authorship thingy?

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +
> +/ {
> +	compatible =3D "radxa,cm5", "rockchip,rk3588s";
> +
> +	aliases {
> +		mmc0 =3D &sdmmc;
> +		mmc1 =3D &sdhci;
> +		mmc2 =3D &sdio;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +
> +		led_sys: led-0 {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			default-state =3D "on";
> +			function =3D LED_FUNCTION_HEARTBEAT;
> +			gpios =3D <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};
> +

> +
> +&gmac1 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy1>;
> +	phy-mode =3D "rgmii-id";
> +	phy-supply =3D <&vcc_3v3_s0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &gmac1_clkinout>;
> +	tx_delay =3D <0x41>;
> +	rx_delay =3D <0x3a>;

doing rgmii-id should not need those delays

> +	status =3D "okay";
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


Heiko


