Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D927C15C;
	Wed, 25 Jun 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840600; cv=none; b=mHxujKopVyWREexParCcqYy9xAHfT3yZe94yzFVrWvUjHWUCwt2Aear04h7W06YOXRBqREjsqOzFKqUVWDJcY7HCcvnFYbzXOaQb5unuWixsOBaOc5HCKpZ9Xgqwo3A4rI7aX6kaDzBzyXwxaqtwlBALnWTFzeRVduRi5tXD2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840600; c=relaxed/simple;
	bh=qCNgTNRRzKT+qYd/55FmcZR0Rrpdw8ahO3hzjmRU+/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTkIwDpQnoAtPgIE1Lt8nNyVFjenPHRDejPASCKA0LYSnDsq3j6G5AKq/0CotGKR8FHUgkggHeaddOEZV5DAZ5mTFXVfhBi5s8Lw300Sf2Jtdiu9Z9z6Nxd24R1hqt5MbELB6gwo7xoYY0+Rlwa8PVLMPrqp18y8Ou+Dk+D/6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5BAF81F00055;
	Wed, 25 Jun 2025 08:36:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D4FEAAC7A37; Wed, 25 Jun 2025 08:36:31 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 0CA55AC7A32;
	Wed, 25 Jun 2025 08:36:30 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:36:28 +0200
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
Subject: Re: [PATCH 2/5] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Message-ID: <aFu1DC4eGtYmAuSf@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-3-kuba@szczodrzynski.pl>
 <aFutWCScsMNgXUAu@shepard>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mMddwFhTjlnTEsAi"
Content-Disposition: inline
In-Reply-To: <aFutWCScsMNgXUAu@shepard>


--mMddwFhTjlnTEsAi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 25 Jun 25, 10:03, Paul Kocialkowski wrote:
> On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> > @@ -183,6 +184,8 @@ static void sun4i_tcon_lvds_set_status(struct sun4i=
_tcon *tcon,
> >  	} else {
> >  		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
> >  				   SUN4I_TCON0_LVDS_IF_EN, 0);
>=20
> Does the T113-S3/D1 also have LVDS support in TCON regsiters?
> My understanding is that it only has the combo-phy, so this register write
> should not take place.
>=20
> I think it would be easier to just move this to a common callback for use=
rs of
> the tcon0 lvds phy and always call=20

Nevermind this comment, the LVDS_IF writes are actually necessary and
independent from the LVDS PHY configuration.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--mMddwFhTjlnTEsAi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbtQwACgkQhP3B6o/u
lQxNJQ/+NRLOuDtviPYOloG5xp+nX3B4qO2FXp19IWGBOrz/SEL34AfiP1Bb30fu
7uwvYvURCKtY9J68zna5ovG4mex4pLo5sA81xZVc/1Cs5+7pMV2F2ixnPkAWHP6i
um3pIEKP5amDFP9DCAVAchAAQdZHD5D4+FZlu9Mw5CCWt0XToXkUpmfcExA07kzD
KnlpKPJhc1DPgXku5izWrAkrgAC0k8uMlENVclI0djMw67aO7vOyqIJpABp5ZOe4
oHIsanTWy3/2PWx2RyrXdvrXwUaZRcJUmbezq+VOxyqtVY+IytVWHj13l2CzL+eu
dyKm538s55HpwBvEbo9vYiFvLMRaMct637GGK9Z3TG2khO6LJHtBZ8nvfEHCBVmu
vUxTCl6/Mm7HEm6Wkg2wOzeBc94OsYYib2WDnPJ2TnmB2vWua9Nk96t5TQ48qOQT
J/N1sRyvy3iBX2U+gYCS9bb2SmQ+yVDSoIulX25hTqypn5peaJgQh9miq4UtC21M
4F73RP0zjS6Dn/1Hw7lE3l/M7Pd169b5ymguuxorKg+rGDpz62TMsClNQr/tPg9M
NPUZK7YW4s+O3VOXjkAy/aj+iQ8gTVvifRn14lB+lYQFPcnb82l2Ra+x6YnRTo//
6VzXsjUgV9sGRYKxcau8DQPfRDfKrZNpruYazhAOToyO96tvKiY=
=o01Z
-----END PGP SIGNATURE-----

--mMddwFhTjlnTEsAi--
