Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A515015A86B;
	Wed, 25 Jun 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839863; cv=none; b=ibfqHzK4RRS3uk5QQy1QSqcj7UhhXLed+Ikd+RUwwMyr0iCFdHLuaFGoJ+rA/ka/HRgpdKbL64GE8LoIRV3tnD6KYVlOGsAdBl0MXhxGZJL7wHjYvDDjNXrr24+OGrhwjV8sDh1InQZM8VMl4t18H3iavplTjbd0I80WVDk2hqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839863; c=relaxed/simple;
	bh=TX8PnO4qo6vWnYfA3fiqVkNx9f511pDFXl5ndMHza34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrZB84YsLbvKCVbQ+75ztcKrTFdwHm7anEehyeEVwu9VILp2KZhj4v7RgQ41MJUjLxnCe3bhG1ESMO/SV17Q1fT+ppVAqGsRqsc6EiU0/kgTapw0VZQYkkusc2svza2HG3KBSajCL93wV17yL0Wm9LcRh5h5HiS4JIcBl+G6MaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id DB8591F00055;
	Wed, 25 Jun 2025 08:24:13 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AFBE2AC7A1D; Wed, 25 Jun 2025 08:24:11 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id CF3E5AC7A0B;
	Wed, 25 Jun 2025 08:24:09 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:24:07 +0200
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
Subject: Re: [PATCH 5/5] riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
Message-ID: <aFuyJ6AqTX_aOr_b@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-6-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kGlgOBmJpN53EYeN"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-6-kuba@szczodrzynski.pl>


--kGlgOBmJpN53EYeN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> Add LVDS pins to the PIO since it's now supported on D1s/T113.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index d241ba306..174b6d8f9 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -78,6 +78,15 @@ dsi_4lane_pins: dsi-4lane-pins {
>  				function =3D "dsi";
>  			};
> =20
> +			/omit-if-no-ref/
> +			lvds0_pins: lvds0-pins {

This usually has a lcd_ prefix (see sun7i-a20.dtsi and sun8i-a83t.dtsi).
It should also be sorted alphabetically.

Thanks!

Paul

> +				pins =3D "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
> +				       "PD6", "PD7", "PD8", "PD9";
> +				function =3D "lvds0";
> +				drive-strength =3D <30>;
> +				bias-disable;
> +			};
> +
>  			/omit-if-no-ref/
>  			lcd_rgb666_pins: lcd-rgb666-pins {
>  				pins =3D "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--kGlgOBmJpN53EYeN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbsicACgkQhP3B6o/u
lQz4gA//XMSaMwlEF955t7sMD+r2G+0gnvduzRuZ8ICdmPh5+wc5fdr8o8F4SZ9T
lke1oY00cGYpQ8CbMd0kKJahUwHpFVZhrfBdWC/2o92/0SW9rYJk4fgrbupgOWkN
S70jFWJ1UcPVEbNwTImFWr5DlgsJPZbmsS4d3EkzN1nMEe7WGW0syw1paZEaW7IN
Usr7dtl5UVoFqzlKOy0foPf3pG/7Qv9UrnL6mJv4llPysXDeFHvK9X86j4ev3n6/
5py1bS/nTLtl9a4p4iIzuOPzYQXnQ3vUOZmYDWF+7vyMrgnNX16S/lgkyWhbJdHB
rHDelmgVbxUzPBVyLFgdKtCO6QRpUyS8cblkci/NwcSF8geQAM9Mr7N336jYDI7j
FdZ05N5CTtwvUAmFzX6v7cPE55b0qVVusc7/f5QPEcDDuGlQaRjyjUndlT11/qOh
wRePXbpOiaJQxrzvOMr6BSW9ir6RsF+rfvs3js2mMaiBYV3VzE2C2Blx8/ri6x90
FfYv5GzCVcZjWU7rctdgtc1xR5mQbLHhNVbTHPDgk7yiCVFQYDGKwbnOlCLrmYI1
JEjvbYHcQL7lV6HNzW91tTSgHrl2tiu/1v9aEirMwJDgxzNdXDXOlXEEHaPF0FTU
1elYSGp3JdKyEbFfhXPLysq8ryn9/9/pVvwm0NKv6i9gN3KemD8=
=S9I0
-----END PGP SIGNATURE-----

--kGlgOBmJpN53EYeN--
