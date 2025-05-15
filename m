Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06820A5D8;
	Thu, 15 May 2025 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321650; cv=none; b=VsHHRJwCgzjS0xwAqAFK5wTMob1iYs2jdtAGQrZhmLM4J5QXMeOIdJsIP+BtMiT9/gWtMv6DuzW4H3ai4Ud1zMDpy1E2JAguz2+FznThm13U2/Ay0S8JcABtsmFLbzVpRh6e4lemt2oLfoV7ijsXJ3gUIDCiEU11Yz/SH5SzSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321650; c=relaxed/simple;
	bh=NVnU3EXlKhcA1buxaPfe5O18xcLQiBuKx4mM07IagEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPXc8nn+2vEDPpSjr58jo6nRuiAdAPQhLnwWHl6w28p+eX1jxm6WVqsvqqjKlbbZTwmpbnin7+fPPAzhYK+3KAV5EiCa+2GNwYlw0bHs7ISxm5wd7/PQ/GKSykDH4BVkPMSug1rgv/oJKGXuP+IseLa/Hh4jkhP3JnGh2A/Nfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxiXMnls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxiXMnls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC609C4CEE7;
	Thu, 15 May 2025 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321649;
	bh=NVnU3EXlKhcA1buxaPfe5O18xcLQiBuKx4mM07IagEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxiXMnlsIBdlJpTna4XVl4yd+LIHBATurggzh1gAwCvCiEltU8DzI/Npq3OdlKRKZ
	 GKZiKlUI18UwxeyRKxIAdkxLSPr8krEUTkXzgMEItGQKXCRWjw6qFGqImPKtWJhA9a
	 iNQ/USp2IYiv9tYezwSsca83juoSQqrZZeuEWYJOQ1YFUULVHZEButC68OLzVG0sxv
	 hJOmtcI0HPAh3G9VLQm4Wkprc3hlcPByga66I/CQ33bgULosMJ9XbDtZsaY6ekkSH4
	 IFrtvwA4hik9gsdQtkpLtTJ7cKOxppxpc7kbsQOPDqWKYBJFLHQ+0ooqT4Wceqfh9v
	 qMiPRpi/rqpKw==
Date: Thu, 15 May 2025 16:07:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: rename spi-cs-setup-ns property to
 spi-cs-setup-delay-ns
Message-ID: <20250515-laptop-unfixable-85dca20d1b57@spud>
References: <20250515103251.210468-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YNVVBp6SZFwNB2lg"
Content-Disposition: inline
In-Reply-To: <20250515103251.210468-1-manikandan.m@microchip.com>


--YNVVBp6SZFwNB2lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 04:02:51PM +0530, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns to keep
> that consistent.

"to keep that consistent" sounds like some nice cleanup, but these
properties appear nowhere in kernel code and therefore just do not work?
I think the wording should reflect that and there should be a Fixes tag
to the broken commit.

>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts        | 2 +-
>  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi   | 2 +-
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
>  arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/bo=
ot/dts/microchip/at91-sam9x60ek.dts
> index cdc56b53299d..c1ff3248bd8f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> @@ -609,7 +609,7 @@ flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <104000000>;
> -		spi-cs-setup-ns =3D <7>;
> +		spi-cs-setup-delay-ns =3D <7>;
>  		spi-tx-bus-width =3D <4>;
>  		spi-rx-bus-width =3D <4>;
>  		m25p,fast-read;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/a=
rm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> index 8ac85dac5a96..13c28e92b17e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> @@ -44,7 +44,7 @@ flash@0 {
>  					compatible =3D "jedec,spi-nor";
>  					reg =3D <0>;
>  					spi-max-frequency =3D <104000000>;
> -					spi-cs-setup-ns =3D <7>;
> +					spi-cs-setup-delay-ns =3D <7>;
>  					spi-tx-bus-width =3D <4>;
>  					spi-rx-bus-width =3D <4>;
>  					m25p,fast-read;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch=
/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index ef11606a82b3..9543214adc9f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -234,7 +234,7 @@ qspi1_flash: flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <104000000>;
> -		spi-cs-setup-ns =3D <7>;
> +		spi-cs-setup-delay-ns =3D <7>;
>  		spi-rx-bus-width =3D <4>;
>  		spi-tx-bus-width =3D <4>;
>  		m25p,fast-read;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/=
boot/dts/microchip/at91-sama5d2_icp.dts
> index 9fa6f1395aa6..fbae6a9af6c3 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> @@ -714,7 +714,7 @@ flash@0 {
>  		compatible =3D "jedec,spi-nor";
>  		reg =3D <0>;
>  		spi-max-frequency =3D <104000000>;
> -		spi-cs-setup-ns =3D <7>;
> +		spi-cs-setup-delay-ns =3D <7>;
>  		spi-tx-bus-width =3D <4>;
>  		spi-rx-bus-width =3D <4>;
>  		m25p,fast-read;
> --=20
> 2.25.1
>=20

--YNVVBp6SZFwNB2lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYDLQAKCRB4tDGHoIJi
0uu/AQCsh2Rrf0aLS5+M+Dn41EcWua9fjg/EU6tZYdeV5+YuvwD/cSVJLXH4dMCp
Yo8NyZ3cszL9S8dlEsdTv2vQ6t1V3AU=
=AvJj
-----END PGP SIGNATURE-----

--YNVVBp6SZFwNB2lg--
