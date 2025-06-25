Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D19271A9A;
	Wed, 25 Jun 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840533; cv=none; b=OzjV9nGheicNOtnQmAGCQpLVI1HTnfI8hxseI1A5fDy6hUnEdumhetPqAwXB/4/NAX2YONkRYLCDagtl+k4XZkTCgZc6QRg+KeJNsLVYfaMDAwDWoVywtsX06XdiNx0ZDLSnVP/8dfjWn4XY825GhWTJ1SNL9eLqtwaRFXn2Mm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840533; c=relaxed/simple;
	bh=ASrITMP/6f0gfIsNfvcsAiCPafZTrPR6wOt9JZi1Ia0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0R4lFOgaazEK38NNlZdRg6PXj3aNggHMwpdK6osj6TbMI1OliibaVe6z/rYfB1lzeUaPHRvRXdWAMgjNdyg+fMbvaoJTlgO57FDERyAyVkHMpnDfArqGW9/phKDwEHj9FuuHT9FGwOunphWZnZJ4heQQzGjCG1slLmk24Mc3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 981A31F00036;
	Wed, 25 Jun 2025 08:35:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 857E4AC7A3B; Wed, 25 Jun 2025 08:35:20 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4EC5EAC7A2F;
	Wed, 25 Jun 2025 08:35:18 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:35:16 +0200
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
Subject: Re: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Message-ID: <aFu0xIHURuDttwJn@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lE79oaprNLAlqRlL"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>


--lE79oaprNLAlqRlL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your work!

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
>=20
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.

=46rom what I understand of section 5.1.4.2 LVDS Mode Configuration Process
there's two LVDS outputs:
- LVDS0, driven by the combo-phy
- LVDS1, driven by the usual TCON0 LVDS PHY

As far as I understand the LVDS_IF register still has to be configured for
LVDS0. The D1 manual mentions a LVDS1_IF register at offset 0x244 (which I =
don't
see in the T113-S3 manual, but is probably also there), which is liekely us=
ed to
configure LVDS1. Then we find our LVDS_ANA0/ANA1 registers that are likely =
just
used for LVDS1.

While this series adds support for LVDS0 only, it would be good to also be =
able
to support LVDS1, including dual-link modes. So eventually we'd need a way =
to
actually support both cases.

It would be great if you could include these details somewhere so they don'=
t get
lost. And this seems to be the exact same situation as the A133 by the way.

All the best,

Paul

> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.
>=20
> Kuba Szczodrzy=C5=84ski (5):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>=20
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 10 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 40 ++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 65 ++++++++++++++++++-
>  4 files changed, 119 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--lE79oaprNLAlqRlL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbtMQACgkQhP3B6o/u
lQy1gA/+Iu8VPy90JA8o66lrxeIiIPWu6Xc+0rbfnad0J7/iNziGmCOxQ3XaZbd7
W5L9p+yX9ByxxHM5Ijwujnq47fMWfOSXRCtwxN7BR2rlpp9F6RmnI7qxRnv14n74
ygKt4UEbPCsvtLj6X7w76NQK1qotvnQYwwdkoRKM0zKKvah2N49FFgSmue/AI3QZ
rDbK/WWXOdxuEIv8kp6L3zlWLsm9Rdc9NprRjlXzTESyHfFlE7be8hiKs1OLwoh2
jy9PFCzCSSbWx6ePb6pjPq07gVmjQxr4IQys0EHgxWvNeq4d/AdLzzijuiWR9sbM
FfzTvWtV/eSrg1cedRGejZqY9K+rHC1naCmaJaxXppqBcTveO/coAb3Gt3HJh6PL
NU+LWe1mFgKS1iU+PZX8Kz2eRmeqYBxPHNIpgLsqGlnqeHG1yNODCgj84PJF5nN6
1vnELm6+dBfMhg7LYv/N0Z1kaYHAyFPU7F0Cq3L+NHRiqBCZK2nSRnb7DhqNt4Nn
jcQbee+prBnM+tMoH5qtJLQ8vZ37XNZwbmHKOP/f5mzS04YUsWI2cvdSvXReMgLZ
TfJjvNYmIZdarxMFsA6+E0TeZp7l7zLuxMFAO/v83VpxtmRnx5w+kYc4VJG7vAe3
cMlHuxed0U8beaagiB+SYqTPx4VFjBLAw2SY8RYS4HuovYh4v5o=
=RNKR
-----END PGP SIGNATURE-----

--lE79oaprNLAlqRlL--
