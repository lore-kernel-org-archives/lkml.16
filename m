Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8E21FF5F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326402; cv=none; b=q1a3g0TzmZK8tM/V7X8ReWKiNh1Pv8L8EJwq1EvOZoU621B43lvZgB/YLtiMpPQej3ZkgT7sC7/mUml0r0TJCDD0TIi04k5vgcQ6XsSmC8C0v5zepYRdM+N1f4BqAw4YW7x54DoJsZOEcp8kEXDeb1RWjhMgX0ktIitoQ/jV1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326402; c=relaxed/simple;
	bh=apG/keP/KLT8pvUXGpwz4q0QvABCBcwZ3u8hqT6KHKE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kCG6SXBKB88hPPIMz/6wSTFxRf4PxcnvfXN3YQT1dq6nXu0teBsgsDonNnAzcZaxMno+0JF0AdojVSrQhxQ/1ExdzpMSWl6dSJRU9fKpTCi4VWyzGGpSXXw16SgLGX9m7p7MEmd8IVgYz6XuTXMaX7iPQM2BleTlzJe3neY1guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=qBF6F/JF; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="qBF6F/JF"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750326388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95jwxwqOy3CE/suGZD6MlYCwgFQV2q5DD7APLcXDGSw=;
	b=qBF6F/JFB8Ga+29xGShrQ+nv00Iv5P6Zpb4T/dk3e6MAJbO+H6+doGGxnsJfJI/kx0fgba
	LpxYBlt/zc0ZxyJif1oMwDiMJa2RcXRGHRpLaLxrafWhFf3V0Vh+7RqAJQCUQwfRo8X7si
	X0xwcrsDc9qzk1RPCPGkhrof7KLlyWVLEkl51JD73B8iW4qmHKoFatW4WrpoRqGSvpAClR
	B9zyua4faYw4VV6P6C+tYUeI76n0bezZbhO9o7X0M0ecQ0TD9VFRS8HWMRmp7J4KWv1l/c
	b34pOS6eG0FPqmk+YATMaGS1RL7N9JrziEtqd09cNbkXTkZ/gEMg38ZC+GAEKA==
Content-Type: multipart/signed;
 boundary=a3a566baaebf2efb32d488967dad63a47cda141ad75c7e052b59f3fe5c0e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Jun 2025 11:46:15 +0200
Message-Id: <DAQEX04P5320.CQDU7SL7AV4A@cknow.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix the PinePhone Pro DTS'
 panel description
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Olivier Benjamin" <olivier.benjamin@bootlin.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
In-Reply-To: <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
X-Migadu-Flow: FLOW_OUT

--a3a566baaebf2efb32d488967dad63a47cda141ad75c7e052b59f3fe5c0e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

Thanks for working on upstreaming PPP things :-)

On Thu Jun 19, 2025 at 7:21 AM CEST, Olivier Benjamin wrote:
> Fix a few issues in the panel section of the PinePhone Pro DTS:
>   - add the second part of the Himax HX8394 LCD panel controller
>     compatible
>   - as proposed by Diederik de Haas, reuse the mipi_out and ports
>     definitions from rk3399-base.dtsi instead of redefining them
>   - add a pinctrl for the LCD_RST signal for LCD1, derived from
>     LCD1_RST, which is on GPIO4_D1, as documented on pages 11
>     and 16 of the PinePhone Pro schematic
>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
> Small fixes to the PinePhone Pro DTS to fit bindings and
> suppress warnings at build.
> ---
> Changes in v2:
> - Added the pinctrl definition for GPIO4_D1/LCD1_RST
> - Incorporated Diederik de Haas' suggestion for defining mipi_out
> - Squashed multiple patches into one
> - Link to v1: https://lore.kernel.org/r/20250618-dtb_fixes-v1-0-e54797ad2=
eba@bootlin.com
> ---
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 33 +++++++++++-----=
------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..98aba146749998dd5a798aabe=
d0fe844c474d1cf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -463,29 +463,18 @@ &io_domains {
>  };
> =20
>  &mipi_dsi {
> -	status =3D "okay";
>  	clock-master;
> -
> -	ports {
> -		mipi_out: port@1 {
> -			#address-cells =3D <0>;
> -			#size-cells =3D <0>;
> -			reg =3D <1>;
> -
> -			mipi_out_panel: endpoint {
> -				remote-endpoint =3D <&mipi_in_panel>;
> -			};
> -		};
> -	};
> +	status =3D "okay";
> =20
>  	panel@0 {
> -		compatible =3D "hannstar,hsd060bhw4";
> +		compatible =3D "hannstar,hsd060bhw4", "himax,hx8394";
>  		reg =3D <0>;
>  		backlight =3D <&backlight>;
> -		reset-gpios =3D <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
> -		vcc-supply =3D <&vcc2v8_lcd>;
>  		iovcc-supply =3D <&vcc1v8_lcd>;
>  		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&lcd_reset_pin>;
> +		reset-gpios =3D <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
> +		vcc-supply =3D <&vcc2v8_lcd>;
> =20
>  		port {
>  			mipi_in_panel: endpoint {
> @@ -495,6 +484,12 @@ mipi_in_panel: endpoint {
>  	};
>  };
> =20
> +&mipi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint =3D <&mipi_in_panel>;
> +	};
> +};
> +
>  &pmu_io_domains {
>  	pmu1830-supply =3D <&vcc_1v8>;
>  	status =3D "okay";
> @@ -507,6 +502,12 @@ pwrbtn_pin: pwrbtn-pin {
>  		};
>  	};
> =20
> +	lcd {
> +		lcd_reset_pin: reset-pin {

I don't know if there's a 'hard rule' for it, but I'd recommend to use
``lcd1_rst_pin: lcd1-rst-pin {`` as that would match the naming from
the schematics. I realize that some but not all (other) pinctrl nodes
follow that 'rule', but it helps with traceability.

> +			rockchip,pins =3D <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	leds {
>  		red_led_pin: red-led-pin {
>  			rockchip,pins =3D <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;

Otherwise,

Reviewed-by: Diederik de Haas <didi.debian@cknow.org>

Cheers,
  Diederik

--a3a566baaebf2efb32d488967dad63a47cda141ad75c7e052b59f3fe5c0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFPcbQAKCRDXblvOeH7b
boy+AQDbwzeOk3i0OYHIv6wu+lPogKc5TzKOKmCgkGkNRFumNwEAjC++J6IJV1V3
YclMmumArJ0L1UN/PjW9uBrL/NoamwQ=
=RIuv
-----END PGP SIGNATURE-----

--a3a566baaebf2efb32d488967dad63a47cda141ad75c7e052b59f3fe5c0e--
