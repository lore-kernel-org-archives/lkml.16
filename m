Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49457290BA0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794714; cv=none; b=aBERCRiOdFrPTKuRvGp4znWCGHDW4r9jOE3h2vQUJQknbKCRG+8Ir2PUflm8w2m732RLQFd1WPAB7QC8gf4rpEO1O10gXA9jxYX5dDIW1dXN+i2fwojmHv5bZIQAoJFMU0AcArPGgZ3lryQQQk5CWzf6Jogl/KiS2gabUQ7Myyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794714; c=relaxed/simple;
	bh=5hWc92BIAJybu8SJz53/NZw6BpLdce7GUubnVuWwujw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZNB0Q0zdZcz12VM3GITtYHRpsVHwznzNOr7eeU/8E0cxvxenz70gdqCyUMn9xBtMi/ZsTzngZwIw1XStMhxSqQ8kTmzxCJcspQkUNDTQqUe5Rd5UYEH/zPYyobZ5GUXqO9PLEtLzh0EHEeGgPSDwHdOt4z9LKTy3rwC1QpYBOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=ImuD8IbR; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="ImuD8IbR"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746794706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KW4KBcGtJSrAqFPHP5H5PG7TlnbU9UpApL0n436QVo4=;
	b=ImuD8IbRIqKE/CNpdy4WPO3H6jwtC1fJZQatK6NXOjntc5zPYY0Hini8qWMmbczkWJBfkA
	ngxt4TAajwKHgWWQVXc+p0IYLaaWurIOD87JeLM1V0R/fYqCuKcGKVAEi7lw758doECP/l
	UPVVsgeGriocqzrprVLErqTCAq65AlolVSZo77ifnvUka01goaVwjItz+4WU1pBiimJoI0
	X5wTj02NhPFroV0UJohtv/paQRC4NbD08j7/roreBlL0GN+VlIVwAgx4q2Qq3Zw6HL1MXY
	f9AXHD9tgg4nzE5F+EE3opvXO2Rn0ULldCSPleRIbDnmgSH8eCVqYgOLFcRyIg==
Content-Type: multipart/signed;
 boundary=a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 14:44:57 +0200
Message-Id: <D9RN1HZAXH1M.3H228KWQJ9CR0@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include
 file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Heiko Stuebner"
 <heiko@sntech.de>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
X-Migadu-Flow: FLOW_OUT

--a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
> Radxa released some more boards, which are based on the original
> Rock 5B. Move its board description into an include file to avoid
> unnecessary duplication.

Aren't you moving it *out of* an/the include file?
If so, the patch Subject and the above line should be updated so that
they correctly reflect what is changed in this patch.

The above text is correct (and the same ...) as patch 1, but in this
patch you move things out of the dtsi which are unique per board.

> NOTE: this should be merged with the previous commit to ensure
> bisectability. The rename happens in a separete commit during
> development because git does not properly detect the rename when
> the original filename is reused in the same commit. This means
>
> 1. it's a lot harder to review the changes
> 2. it's a lot harder to rebase the patch series

Or did I fall prey to the exact thing you described here?

Cheers,
  Diederik

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 40 ------------------
>  2 files changed, 52 insertions(+), 40 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64=
/boot/dts/rockchip/rk3588-rock-5b.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..9407a7c9910ada1f6c803d2e1=
5785a9cbd9bd655
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588-rock-5b.dtsi"
> +
> +/ {
> +	model =3D "Radxa ROCK 5B";
> +	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> +};
> +
> +&sdio {
> +	max-frequency =3D <200000000>;
> +	no-sd;
> +	no-mmc;
> +	non-removable;
> +	bus-width =3D <4>;
> +	cap-sdio-irq;
> +	disable-wp;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> +	vqmmc-supply =3D <&vcc_1v8_s3>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdiom0_pins>;
> +	status =3D "okay";
> +};
> +
> +&uart6 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	usb {
> +		vcc5v0_host_en: vcc5v0-host-en {
> +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&vcc5v0_host {
> +	enable-active-high;
> +	gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&vcc5v0_host_en>;
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588-rock-5b.dtsi
> index 17f4fd054cd3d1c4e23ccfe014a9c4b9d7ad1a06..6052787d2560978d2bae6cfbe=
ea5fc1d419d583a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> @@ -8,9 +8,6 @@
>  #include "rk3588.dtsi"
> =20
>  / {
> -	model =3D "Radxa ROCK 5B";
> -	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> -
>  	aliases {
>  		mmc0 =3D &sdhci;
>  		mmc1 =3D &sdmmc;
> @@ -139,10 +136,6 @@ vcc5v0_host: regulator-vcc5v0-host {
>  		regulator-always-on;
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		enable-active-high;
> -		gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&vcc5v0_host_en>;
>  		vin-supply =3D <&vcc5v0_sys>;
>  	};
> =20
> @@ -488,12 +481,6 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
>  			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> -
> -	usb {
> -		vcc5v0_host_en: vcc5v0-host-en {
> -			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
>  };
> =20
>  &pwm1 {
> @@ -530,27 +517,6 @@ &sdmmc {
>  	status =3D "okay";
>  };
> =20
> -&sdio {
> -	max-frequency =3D <200000000>;
> -	no-sd;
> -	no-mmc;
> -	non-removable;
> -	bus-width =3D <4>;
> -	cap-sdio-irq;
> -	disable-wp;
> -	keep-power-in-suspend;
> -	wakeup-source;
> -	sd-uhs-sdr12;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-sdr104;
> -	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> -	vqmmc-supply =3D <&vcc_1v8_s3>;
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&sdiom0_pins>;
> -	status =3D "okay";
> -};
> -
>  &sfc {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&fspim2_pins>;
> @@ -566,12 +532,6 @@ flash@0 {
>  	};
>  };
> =20
> -&uart6 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> -	status =3D "okay";
> -};
> -
>  &spi2 {
>  	status =3D "okay";
>  	assigned-clocks =3D <&cru CLK_SPI2>;


--a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB34zAAKCRDXblvOeH7b
bspkAQDgrjd4oJNZSgatYk5e0hVQKf7yl7XI/rQr2kM9asNPSAEAlw0l4olpMeDx
eBT79vJHA5+VVMCa7wErGOK6rQi7+gc=
=5PU0
-----END PGP SIGNATURE-----

--a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0--
