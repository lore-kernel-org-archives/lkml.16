Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B169293732;
	Fri,  9 May 2025 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796494; cv=none; b=RRppFYtrqSHF+6mUgkUKu4nLPGRKY9091udT5D3+sGp3/9idHccJYfnHnIhfYGwm0skmEJbQBtdMEpVfH/xLq4/qbuLc0lk1GTddMfZ7SaEtIql9sWktaLbnCtiPZb1R8rNDUhC/WI0rqLN75ijdx8NM20hc+J36YPQduEW/jXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796494; c=relaxed/simple;
	bh=N9zytOPNIvQxno7Kw6VbqKpx4a7jKPlguadF9cZ3xWM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o2GWLFXRwbF42rl0Wq/SZ4smR6R1Krg6BmpApnRogWf35oHEyogKRkkOgR2l1U7ezFskSB+Zs/19uE6m7YKJWI3+lIBOJ2viPR7I5SEdUJ4fijQ4t5RJJHDaRVMltEisstK9Lj8WIHIKpaSaPbU9we9p3o+FeA12+vcBIM6Ne3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=mDeG47eJ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="mDeG47eJ"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746796490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5axwq5ukixnZASkqSTZMmJAzeb3lPrAspoP9HlhWjSw=;
	b=mDeG47eJZKpstpn0HYUuRIY91JnYd5NZlJsQdZU8dfctwKLiqcdr1UBqGKUi/8MKZ6TH6i
	HC7cPnMlBRYNcejsm5W7v6RQAjDnPvVGdMg8rzgAYIL9s0evaEgaySXv2reXFhdgv7AjBB
	odwBm9ZrQ+OQBwOnCtRgXKjZydn2zFW7HbT2G/f7pfyQtLc/Qik2J6QeXpRSdMU1vyk6Gw
	qJHQ/2dvYh2SSrEZXRmJG3mhf/ypiDAHfB6aRsrbf/KvS0129LJMqhXMbWO3doGZ5CzJvf
	csT4PkppY88Y6LhsP5xz0mij8XoGukg4vAK3JL86bQEwf1pIIukusDDAtukryA==
Content-Type: multipart/signed;
 boundary=6655860ab50d87daa0204e489dd2504ca4fc9154ff9510bb077e41da56ae;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 15:14:31 +0200
Message-Id: <D9RNO4O3YN4X.1G09DC9I8JGJF@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include
 file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
 <D9RN1HZAXH1M.3H228KWQJ9CR0@cknow.org> <2653568.Lt9SDvczpP@diego>
 <dbwzgqfzc4ax6skthp4bkyhhixcm4fohzbcr4px3ugbx7ntmwx@ipncpit75fau>
In-Reply-To: <dbwzgqfzc4ax6skthp4bkyhhixcm4fohzbcr4px3ugbx7ntmwx@ipncpit75fau>
X-Migadu-Flow: FLOW_OUT

--6655860ab50d87daa0204e489dd2504ca4fc9154ff9510bb077e41da56ae
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri May 9, 2025 at 3:08 PM CEST, Sebastian Reichel wrote:
> On Fri, May 09, 2025 at 02:54:00PM +0200, Heiko St=C3=BCbner wrote:
>> Am Freitag, 9. Mai 2025, 14:44:57 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Diederik de Haas:
>> > On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
>> > > Radxa released some more boards, which are based on the original
>> > > Rock 5B. Move its board description into an include file to avoid
>> > > unnecessary duplication.
>> >=20
>> > Aren't you moving it *out of* an/the include file?
>> > If so, the patch Subject and the above line should be updated so that
>> > they correctly reflect what is changed in this patch.
>> >=20
>> > The above text is correct (and the same ...) as patch 1, but in this
>> > patch you move things out of the dtsi which are unique per board.
>> >=20
>> > > NOTE: this should be merged with the previous commit to ensure
>> > > bisectability. The rename happens in a separete commit during
>> > > development because git does not properly detect the rename when
>> > > the original filename is reused in the same commit. This means
>> > >
>> > > 1. it's a lot harder to review the changes
>> > > 2. it's a lot harder to rebase the patch series
>> >=20
>> > Or did I fall prey to the exact thing you described here?
>>=20
>> I think Sebastian's idea  is, that I squash both patches when applying.
>> This split makes it easy(er) to review because patch1 is just a rename.
>>=20
>> And merging them when applying then makes it again not break bisectabili=
ty.
>
> Correct. This is a lot easier to review than what git generates when
> having these two patches squashed together, which is a huge diff of
> all 1000+ lines in the file (I tried really hard to convince it that
> this is mostly a rename with --find-renames and --find-copies). You
> can see this kind of mess in patch 2 of the ROCK 5T series that
> Nicolas just send (I will comment on that and suggest to do the same
> thing I did to ease review. In his case it should even be possible
> to do it in a bisectable way without needing a squash :)).

Thank you both for the clarification :-)

Cheers,
  Diederik

>> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> > > ---
>> > >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 +++++++++++++=
+++++++++++
>> > >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 40 -------------=
-----
>> > >  2 files changed, 52 insertions(+), 40 deletions(-)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/=
arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>> > > new file mode 100644
>> > > index 0000000000000000000000000000000000000000..9407a7c9910ada1f6c80=
3d2e15785a9cbd9bd655
>> > > --- /dev/null
>> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
>> > > @@ -0,0 +1,52 @@
>> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> > > +
>> > > +/dts-v1/;
>> > > +
>> > > +#include "rk3588-rock-5b.dtsi"
>> > > +
>> > > +/ {
>> > > +	model =3D "Radxa ROCK 5B";
>> > > +	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
>> > > +};
>> > > +
>> > > +&sdio {
>> > > +	max-frequency =3D <200000000>;
>> > > +	no-sd;
>> > > +	no-mmc;
>> > > +	non-removable;
>> > > +	bus-width =3D <4>;
>> > > +	cap-sdio-irq;
>> > > +	disable-wp;
>> > > +	keep-power-in-suspend;
>> > > +	wakeup-source;
>> > > +	sd-uhs-sdr12;
>> > > +	sd-uhs-sdr25;
>> > > +	sd-uhs-sdr50;
>> > > +	sd-uhs-sdr104;
>> > > +	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
>> > > +	vqmmc-supply =3D <&vcc_1v8_s3>;
>> > > +	pinctrl-names =3D "default";
>> > > +	pinctrl-0 =3D <&sdiom0_pins>;
>> > > +	status =3D "okay";
>> > > +};
>> > > +
>> > > +&uart6 {
>> > > +	pinctrl-names =3D "default";
>> > > +	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
>> > > +	status =3D "okay";
>> > > +};
>> > > +
>> > > +&pinctrl {
>> > > +	usb {
>> > > +		vcc5v0_host_en: vcc5v0-host-en {
>> > > +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>> > > +		};
>> > > +	};
>> > > +};
>> > > +
>> > > +&vcc5v0_host {
>> > > +	enable-active-high;
>> > > +	gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
>> > > +	pinctrl-names =3D "default";
>> > > +	pinctrl-0 =3D <&vcc5v0_host_en>;
>> > > +};
>> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
>> > > index 17f4fd054cd3d1c4e23ccfe014a9c4b9d7ad1a06..6052787d2560978d2bae=
6cfbeea5fc1d419d583a 100644
>> > > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
>> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
>> > > @@ -8,9 +8,6 @@
>> > >  #include "rk3588.dtsi"
>> > > =20
>> > >  / {
>> > > -	model =3D "Radxa ROCK 5B";
>> > > -	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
>> > > -
>> > >  	aliases {
>> > >  		mmc0 =3D &sdhci;
>> > >  		mmc1 =3D &sdmmc;
>> > > @@ -139,10 +136,6 @@ vcc5v0_host: regulator-vcc5v0-host {
>> > >  		regulator-always-on;
>> > >  		regulator-min-microvolt =3D <5000000>;
>> > >  		regulator-max-microvolt =3D <5000000>;
>> > > -		enable-active-high;
>> > > -		gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
>> > > -		pinctrl-names =3D "default";
>> > > -		pinctrl-0 =3D <&vcc5v0_host_en>;
>> > >  		vin-supply =3D <&vcc5v0_sys>;
>> > >  	};
>> > > =20
>> > > @@ -488,12 +481,6 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
>> > >  			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
>> > >  		};
>> > >  	};
>> > > -
>> > > -	usb {
>> > > -		vcc5v0_host_en: vcc5v0-host-en {
>> > > -			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>> > > -		};
>> > > -	};
>> > >  };
>> > > =20
>> > >  &pwm1 {
>> > > @@ -530,27 +517,6 @@ &sdmmc {
>> > >  	status =3D "okay";
>> > >  };
>> > > =20
>> > > -&sdio {
>> > > -	max-frequency =3D <200000000>;
>> > > -	no-sd;
>> > > -	no-mmc;
>> > > -	non-removable;
>> > > -	bus-width =3D <4>;
>> > > -	cap-sdio-irq;
>> > > -	disable-wp;
>> > > -	keep-power-in-suspend;
>> > > -	wakeup-source;
>> > > -	sd-uhs-sdr12;
>> > > -	sd-uhs-sdr25;
>> > > -	sd-uhs-sdr50;
>> > > -	sd-uhs-sdr104;
>> > > -	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
>> > > -	vqmmc-supply =3D <&vcc_1v8_s3>;
>> > > -	pinctrl-names =3D "default";
>> > > -	pinctrl-0 =3D <&sdiom0_pins>;
>> > > -	status =3D "okay";
>> > > -};
>> > > -
>> > >  &sfc {
>> > >  	pinctrl-names =3D "default";
>> > >  	pinctrl-0 =3D <&fspim2_pins>;
>> > > @@ -566,12 +532,6 @@ flash@0 {
>> > >  	};
>> > >  };
>> > > =20
>> > > -&uart6 {
>> > > -	pinctrl-names =3D "default";
>> > > -	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
>> > > -	status =3D "okay";
>> > > -};
>> > > -
>> > >  &spi2 {
>> > >  	status =3D "okay";
>> > >  	assigned-clocks =3D <&cru CLK_SPI2>;
>> >=20
>> >=20
>>=20
>>=20
>>=20
>>=20


--6655860ab50d87daa0204e489dd2504ca4fc9154ff9510bb077e41da56ae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB3/wwAKCRDXblvOeH7b
biJWAPwP5+nFvMYlxo+Uf4SxONp4EbIR9ujXYtqplfzzKyENUAD/R5g1zPNEXBx4
wQAeV1eNLGfh/kvi5dsnxCAolMKa5Qs=
=Gk0H
-----END PGP SIGNATURE-----

--6655860ab50d87daa0204e489dd2504ca4fc9154ff9510bb077e41da56ae--
