Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E122083;
	Wed, 25 Jun 2025 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838810; cv=none; b=V/6sXW9VXkeHfVNla9HApOamam01oH8lfNPGf1KuE0l8TxK2Uuae/+4irYA3uHEw9ikbBY1ssSiZ/ukpNmbAW1+LuhiwzZAGl0AEdBEaJ54Ha/qt//Xn6gi7r0Cw7paN67lmGSHS8D8yDqEmuTNMCw/zkuN5MRm5By4irUNkUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838810; c=relaxed/simple;
	bh=SUQMaFhUsjhVyG2G9qQt9mhfmHW9G7AFOmwCMv9clcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEgIZVlpg0TOqyk+pxVBpGc/QIOuy7ZDzD3iVpOiB1aB6pyoA+CDSw5itPISbJNLMqsXVpeDIHW/550hlHNQ0Yk/Zzrjv37rV1SQUBUbUkqq6CtKUvZomu+Ydv9ndUKfmPOFaYGfrtkkjwRjNYjpvFuzkLHUtY71gVh+AGfnjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 922901F00047;
	Wed, 25 Jun 2025 08:06:40 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 07F15AC79F8; Wed, 25 Jun 2025 08:06:38 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C2E29AC79F3;
	Wed, 25 Jun 2025 08:06:36 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:06:19 +0200
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
Subject: Re: [PATCH 3/5] drm/sun4i: Enable LVDS output on sun20i D1s/T113
Message-ID: <aFut-yuJS2lfWaE8@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-4-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zc2DNXh9m8XgbscL"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-4-kuba@szczodrzynski.pl>


--Zc2DNXh9m8XgbscL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Some comments below.

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> The Allwinner D1s/T113 needs to use the combo D-PHY to enable LVDS
> output.
>=20
> Enable LVDS support in the TCON and configure it using the PHY.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index ccf335a61..58230a552 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -171,6 +171,30 @@ static void sun6i_tcon_setup_lvds_phy(struct sun4i_t=
con *tcon,
>  			  SUN6I_TCON0_LVDS_ANA0_EN_DRVD(val));
>  }
> =20
> +static void sun20i_tcon_setup_lvds_dphy(struct sun4i_tcon *tcon,
> +					const struct drm_encoder *encoder)
> +{
> +	union phy_configure_opts opts =3D { };
> +
> +	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
> +		return;
> +
> +	phy_init(tcon->dphy);
> +	phy_set_mode(tcon->dphy, PHY_MODE_LVDS);
> +	phy_configure(tcon->dphy, &opts);
> +	phy_power_on(tcon->dphy);

While the callback doesn't have any return code (and it probably should, fe=
el
free to fix that), the return codes for the phy_ calls should be checked and
the function aborted early in case of error.

> +}
> +
> +static void sun20i_tcon_disable_lvds_dphy(struct sun4i_tcon *tcon,
> +					  const struct drm_encoder *encoder)
> +{
> +	if (!tcon->quirks->has_combo_dphy || !tcon->dphy)
> +		return;
> +
> +	phy_power_off(tcon->dphy);
> +	phy_exit(tcon->dphy);

Same comment here.

> +}
> +
>  static void sun4i_tcon_lvds_set_status(struct sun4i_tcon *tcon,
>  				       const struct drm_encoder *encoder,
>  				       bool enabled)
> @@ -1550,8 +1574,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tc=
on_tv_quirks =3D {
> =20
>  static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks =3D {
>  	.has_channel_0		=3D true,
> +	.has_combo_dphy		=3D true,
> +	.supports_lvds		=3D true,
>  	.dclk_min_div		=3D 1,
>  	.set_mux		=3D sun8i_r40_tcon_tv_set_mux,
> +	.setup_lvds_phy		=3D sun20i_tcon_setup_lvds_dphy,
> +	.disable_lvds_phy	=3D sun20i_tcon_disable_lvds_dphy,
>  };
> =20
>  /* sun4i_drv uses this list to check if a device node is a TCON */
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Zc2DNXh9m8XgbscL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbrfsACgkQhP3B6o/u
lQwpAQ//ejWbFNBH4z9VJ16EP4vlDwIeCKa/jCLxdPV14o7aRNZfyfLW+MU5LoZb
583jqZAEAzyLgyElFfWOmpTVzZgoPzfZArozcWQKfzfTpvcn2y0/DSVXrh8XWVRW
v9xC8/hIeMXflvorPgeJKJw2UagKbgwHTipQ1dq49by/uIz0UpidtfyfUI5Gc5Qz
+wxS9jIEyYX2Hq5hmQhDsVYjnL2MrCC6ITlCeE1Sq+ifiBA+bZ1UqQQKswh2IO2O
BVzOseWscsfG1BazmVGLPOba0PyS/qRMuesCE1hDTmFMvvLKN6TDYw/fYAC4gE64
xJm72Ou4GtoIz+7YSKZNDeVkap1ulDNxim4FpOFgTwssha1vNIM2YK1HoFAo5YhD
H9mDqrpol1+ti4L4R9UjDtt7RAg97hxwXfvWhQzt6gMRDWsfkiMqAz2gB9Tn4SDP
DzQZJYhL+k1AkxxIoQtw89+eQ6Ipcss4EBHu5LjB340x4CruXUrFXNXRPdDQyFUi
qV6cV9fvMev1lDvQAmH8z2U45ezhLm0kdkgzXyHXGfXfV24UmuST3TcbBIhdrBcL
2L0SJqcj87i4YLrrmp05O/oen1QseIlxyn6Y3l2HWq/35Q8iSA63iOnw+NySZnb6
RUqGYYj48OX2EZHaCLWaiDRUh41yCSwbWQmyXPEfmgfu6K+YKGQ=
=1Zjq
-----END PGP SIGNATURE-----

--Zc2DNXh9m8XgbscL--
