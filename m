Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D768BE8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750513737; cv=none; b=M4UxfSPxYK69+B8Q/N3rQivaCr6k7b5gRRSNQsNfjGNckpRfVzP3jwE7aJLVhZZS6kL1iIAl8X8h0CuI7WphtbiACcDUi4ilpoehUHmjqmUmnYdKLAnwRKUjnAl6b9IAd0ZPLMMwxqpkq0+fEuu4+40j8TxvsYHwqxxbnnQYVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750513737; c=relaxed/simple;
	bh=Itwekdm02x/VU6zFUaCqPJNXtFekcpIWMuuse+NI+L4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=SVvn1H+ZTwzCp6fyo4LxNGRTiLkXTNAfTwKzZzLqka+sS/Ftb7GMcw1hUUhkYtF57BDSza5O/gkVE3bHyHvNCPsIu4xd3TA4xwkoyaGgCR3fC67Zc29ItZQtinUcBuuTM1B/86nhs0bE5tmndNPv5S68BFRBPx5nLk5t2Cpc+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=txwV3ryb; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="txwV3ryb"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750513731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RO7ZzOnW5tGbwIVTGEHap9/Y/hEeQ7sIYbB3EaEE/oI=;
	b=txwV3ryb3VOYwXPFs6VXRQ9Bt+V5Ll4FbRnLvMyjiQis2QxpikLPRg/tmPar3a/jiZbSK7
	zbBoqRLJqakIUeo0D49tlyAmixVj3Vrvg7NEziZM/uwQUGmH3o0O2eP4kVPV886HLAam/K
	1GKAXqG+B8LbxwhiZNLI0My/fjQCUtPdD+HeQf72jrafgqJH03KdFoxyQhx3G/3beVoHct
	B2M0HhZ/ONm8Goor/wlFezrQNltKDNyPFgmI4v6UBOM4DFdPhEa4GFIRWfa84IbQPhJlq2
	FAJOVczgfmehpUdSTX6RsURuGRznYCel//H4x3V4hfchZsJWTlLZdiFbWVJ1GA==
Content-Type: multipart/signed;
 boundary=b456fdadb7b5189a1ec65fb7a88ecee08943b9944ab920e072c252ec90b7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 21 Jun 2025 15:48:42 +0200
Message-Id: <DAS9BQ77MMNE.26Z2XFDOQDRBQ@cknow.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5
 support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "John Clark" <inindev@gmail.com>, <heiko@sntech.de>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250621124900.214098-1-inindev@gmail.com>
 <20250621124900.214098-3-inindev@gmail.com>
In-Reply-To: <20250621124900.214098-3-inindev@gmail.com>
X-Migadu-Flow: FLOW_OUT

--b456fdadb7b5189a1ec65fb7a88ecee08943b9944ab920e072c252ec90b7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Jun 21, 2025 at 2:49 PM CEST, John Clark wrote:
> Add device tree for FriendlyElec NanoPi M5 with Rockchip RK3576 SoC
> (4x Cortex-A72, 4x Cortex-A53, Mali-G52 MC3 GPU, 6 TOPS NPU). Enables
> basic booting and connectivity.
> ...
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm=
64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> new file mode 100644
> index 000000000000..c63be9060651
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
> ...
> +&pcie0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie_m2_reset>;
> +	reset-gpios =3D <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply =3D <&vcc_3v3_m2_keym>;
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	gpio-key {
> +		key1_pin: key1-pin {
> +			rockchip,pins =3D <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	gpio-leds {
> +		sys_led_pin: sys-led-pin {
> +			rockchip,pins =3D <2 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		lan_led_pin: lan-led-pin {
> +			rockchip,pins =3D <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		wan_led_pin: wan-led-pin {
> +			rockchip,pins =3D <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	gmac {
> +		gmac0_int: gmac0-int {
> +			rockchip,pins =3D <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +		gmac0_rst: gmac0-rst {
> +			rockchip,pins =3D <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		gmac1_int: gmac1-int {
> +			rockchip,pins =3D <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +		gmac1_rst: gmac1-rst {
> +			rockchip,pins =3D <3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	hdmi {
> +		hdmi_con_en: hdmi-con-en {
> +			rockchip,pins =3D <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	headphone {
> +		hp_det: hp-det {
> +			rockchip,pins =3D <2 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	hym8563 {
> +		hym8563_int: hym8563-int {
> +			rockchip,pins =3D <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie_m2_pwren: pcie-m2-pwren {
> +			rockchip,pins =3D <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		pcie_m2_reset: pcie-m2-reset {
> +			rockchip,pins =3D <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	sdmmc {
> +		sd_s0_pwren: sd-s0-pwren {
> +			rockchip,pins =3D <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	usb {
> +		usb_host_pwren: usb-host-pwren {
> +			rockchip,pins =3D <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		usb_otg0_pwren: usb-otg0-pwren {
> +			rockchip,pins =3D <0 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};

Consider using names/label which are (consistently) close to the labels
as used in the schematics.

ref: https://lore.kernel.org/linux-rockchip/5461462.0VBMTVartN@phil/

Cheers,
  Diederik

--b456fdadb7b5189a1ec65fb7a88ecee08943b9944ab920e072c252ec90b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFa4PAAKCRDXblvOeH7b
bitVAP9VoY6HqgaGbD4l4DP27kYhbdmdYojGhlAFrJ19gTel/QEAoBlM1yOncKkz
3tqay+6BjvkcB2WilhslVAadgOJQIwI=
=d0Ef
-----END PGP SIGNATURE-----

--b456fdadb7b5189a1ec65fb7a88ecee08943b9944ab920e072c252ec90b7--
