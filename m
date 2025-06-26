Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73C02C1587
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930510; cv=none; b=Nqm6XlN0TSzHZfU5WvZkG96ninZohlK9W9/Q1BFmnJZxQNEHyM1gAeehZat6MmbUY0EupesWThOOPUSF2HJRoe5LYubJYVtRVGMZ36VDFPn/4UiAtvpM/eGsAZ4lubGONjgSNckUjGDmgVDwjNHxIVBB9AKKU+03YnUhfEUB+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930510; c=relaxed/simple;
	bh=2sN1yEIElyJRVwP2ytC72t/B2mc4BkWeXtljziFBEX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDsFaGF5fwFytdxfAK8Sbkz2B14Q89deCqzgMklZlwUyxjRRVX0cVRNqWCZjHQNREb5mW1fVPQRycc/BRo+5hJl5XielRS3ym+FAyrZtoSR90JzhyykI0+uxPGYei86yyrILjw1TuBO1BewJZFz3vW7ORLk3eQYYy5iqSm3Fb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjEXNgAN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjEXNgAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B52CC4CEEB;
	Thu, 26 Jun 2025 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750930510;
	bh=2sN1yEIElyJRVwP2ytC72t/B2mc4BkWeXtljziFBEX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjEXNgANAzyoCRukXcJEJ+Tm+E+qHbPR0KoIiSb365RNwbENAgp0XKyCMUgoYuOmy
	 jI88DFLEU4o1IBqqli5mXiNflwz2jykE/FJFQoIHnLF7LdUc2V/hzFwbWUTS2Ke6jg
	 G/VUdF3lR9nr3OTVMrHeWKJ5oJ9QDqHMLH0G6zySGCBXJxRE/X6CBrSbpc+VASPYrU
	 +RpgcHvipvudDG32YFN+7l9MMa3mmBlerCvFMOSSOHPHLlrBtjcw/VdDZ6iDrQc3lG
	 AVvtaRvnT+wa9GIAGNqcuLzUiPhP7r3g+rdVjMKsUmBeTXqJ96o66wCufhspcR374L
	 2UhuaA8n1J2jw==
Date: Thu, 26 Jun 2025 11:35:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <20250626-ambrosial-soft-puma-c5bfeb@houat>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
 <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lmvuubkw5aeltv6t"
Content-Disposition: inline
In-Reply-To: <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>


--lmvuubkw5aeltv6t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
MIME-Version: 1.0

Hi Francesco,

On Thu, Jun 26, 2025 at 11:25:24AM +0200, Francesco Dolcini wrote:
> Hello Maxime,
> thanks for the patch
>=20
> On Wed, Jun 25, 2025 at 08:48:37AM +0200, Maxime Ripard wrote:
> > Here's a series fixing (hopefully) the panel-simple regression for
> > panels with a panel-dpi compatible.
> >=20
> > It's only build tested, so if you could give that series a try
> > Francesco, I'd really appreciate it.
>=20
> It does not build for me, applied on top of commit ee88bddf7f2f ("Merge t=
ag
> 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")
>=20
>   SYNC    include/config/auto.conf.cmd
>   CALL    scripts/checksyscalls.sh
>   CC      drivers/gpu/drm/drm_of.o
>   CC [M]  drivers/gpu/drm/panel/panel-simple.o
>   AR      drivers/gpu/drm/built-in.a
>   AR      drivers/gpu/built-in.a
>   AR      drivers/built-in.a
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   OBJCOPY modules.builtin.modinfo
>   GEN     modules.builtin
>   GEN     .vmlinux.objs
>   MODPOST Module.symvers
> ERROR: modpost: "mipi_dsi_bus_type" [drivers/gpu/drm/panel/panel-simple.k=
o] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/francesco/Toradex/sources/linux/Makefile:1953: modpos=
t] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> [Exit 2]

Thanks for giving it a try. Can you share the defconfig you've been using?

Maxime

--lmvuubkw5aeltv6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaF0USwAKCRAnX84Zoj2+
dnvpAYDFrmYhzUUqUF4EPdFqcb+lS+cnbaRIQ4HUMurToFT8A+jlxyQVdpbWkOeT
ntYMPB4Bf0CLmffBbROjqxBYa9uqdLKgp8XgoBVlxFcQ/lRxH56TbzBKVQCf+kAf
vDHHaLfH8Q==
=SaFn
-----END PGP SIGNATURE-----

--lmvuubkw5aeltv6t--
