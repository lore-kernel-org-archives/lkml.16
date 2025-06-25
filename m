Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79EB3074AD;
	Wed, 25 Jun 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838972; cv=none; b=lfHr0Zk2+kEgggob74nCnv/XYO9+vjXNFzYNhGzoE0g+X+7N2RZqF9oqev+qLcxv8FC7N33VuXPXGc18M+SYCFSOodE79kdNPz6vo9WCkSl8/cSPktKdVR8v402ZqRI+D9AZ/TPekF3TC70wFjMfPJ8vCqMs5LqInRSuPGGsTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838972; c=relaxed/simple;
	bh=ilhyZvA6BRCD5gISnlqFJ3xUsdlqaHhGlkwq3ALrQJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9QRtYEyDyKrUlt/BqzfyhDZAfTj8u2J9IgCDfL6eHmdim5OYbRMEYYXmdR1j+8oOruQZHeh+HQEr4sWeOTKHR3OLs1ppP6NvSNRWkmkdyVyCzF79Y1wbp6iHVnVIYweMEFuJ2vB2wvnAihirH5Rz++Rap5MCHib2zf6dKqz9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C9DEA1F00055;
	Wed, 25 Jun 2025 08:09:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5B38EAC7A02; Wed, 25 Jun 2025 08:09:21 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 37E5AAC7A00;
	Wed, 25 Jun 2025 08:09:19 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:09:16 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/5] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON
 LCD0
Message-ID: <aFuurDqkJ3yaMqRS@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-5-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="id1qkDeCEtzLoxTA"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-5-kuba@szczodrzynski.pl>


--id1qkDeCEtzLoxTA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> The sun4i TCON needs a reference to the D-PHY in order to support LVDS
> on Allwinner D1s/T113.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb0..d241ba306 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -828,6 +828,8 @@ tcon_lcd0: lcd-controller@5461000 {
>  			resets =3D <&ccu RST_BUS_TCON_LCD0>,
>  				 <&ccu RST_BUS_LVDS0>;
>  			reset-names =3D "lcd", "lvds";
> +			phys =3D <&dphy>;
> +			phy-names =3D "dphy";

Like I mentionned in the other patch, I don't think the name "dphy" makes s=
ense.
"combo-phy" probably makes a lot more sense here.

Also the dt binding should be updated to reflect the introduction of the
property.

Paul

>  			#clock-cells =3D <0>;
> =20
>  			ports {
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--id1qkDeCEtzLoxTA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbrqwACgkQhP3B6o/u
lQw7sg//WLoQpyAqStd6AsRVh1QrfKNATtlAD2vpTMd1iAFGZif40Xf/eIUFKSHc
SzaFwDnYhc5d/1hJbOJ4gs866AaSGCTexQtq4wAOHuPQE+Kk3NqJ49L26Td3MtCk
aRmQ9brdHzvAK2DyMxWxro6Xrc5D3A7wtt0FM8Jwo5CpKJgOsC3OcAgmIx/eVkYr
pwHh3ajrnCvcPDOLvQRaALp6OOrgL1DiAs+Y61v7nDdU7U7wWNNPXd1fh4dtQbjC
lqsM2zbhxY8+pBU6Ec6XEKPC7yvwBYxmoah6D5ophlnyQoGJbah4nzZcJwILdlJl
6Ptb2oaRIA5D7u+2SgPKNj4ZQbhX4hdWPXn9yRMeAnf2LGziJU4BQ/AegTPWT4Zc
N7W1TsD/4SJ9fqsZYCu8FuKUHEWUfSLl36yROAoVOWLk6hVtEfMae/f2P3gUOUle
XXCVmn7In8LRK8THK/40O076jqSiytSnnHl2Do5wNnb95g+Rh06BVPf3OL6Z4O8i
hJaV4vdNSSR7ta+IenShS1fZcl15dIt1vjNFGoPUflEJUY+OVfL8zTwVRgi2KGSb
DRFue9mLKEvEtyGkGvZKscxaLVZtqfCkDg9D6w3WZG4OOigyI+N8jVTuaoVjzcWC
ohQ6sFkD+3w4n6uDKid8NSxD1p34DxSWphNP1vsz6OftJO/xFLM=
=LCaF
-----END PGP SIGNATURE-----

--id1qkDeCEtzLoxTA--
