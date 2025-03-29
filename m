Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5117BCE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233284; cv=none; b=r+qrf7g8WsXpd/Fa8BgTDgQeDsaEvDJzbd1mtuPuScbuVh7mSml6aw4fwHpGC04FgHEMu8dsxP7FfSqLIrK0AQlkgirLtJU4/qzJu89E08gCxnLNGpCaAzUL+xN3jCUf9hHynGp2BEBma20WxpIhNQzycv+jP1f010qxGdAdLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233284; c=relaxed/simple;
	bh=k38HmKsHGBUJixcW1fB2JC7zfA7gYvLbiKF4tiKdzDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld8sDSOsyr7uzPnB420iL07fRM76BIG8kTxVsfkDkvMdVydTWeOmQgt7cAQBD4jERDKWZdh8+IshQ4vtAXitoqBZT8ZnlkLYT6J3oFFK9ArS00e0WSKIKOCIG0CoDtmlCmLolZTRnWmnOpKAmGYa00TeMwKKnm6fmxqXIDrVZPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NAILybhL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NAILybhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k38H
	mKsHGBUJixcW1fB2JC7zfA7gYvLbiKF4tiKdzDU=; b=NAILybhLuMW6YKzY2a+e
	wrsST5Ml4frqU/0QKmTwxpPEcEm5xzBW35RgW9kmu+0eFRZuu0RuCRGoET2rLfcM
	gkrrdwyJkYIT5KP0g7JOfHKL3+I0VEOh22olPCoYTr7u+xKDreSnsvZdIfulpOWt
	+br35VsPB4JwUV86xNF6dEwIhdCIAGfJFt7YrLoCSHR6G/Q93CmVbqO0MJX46m/N
	t8mGpUIdprNN0ghSMbE8AWzoVoAxHVD5lpH6dbVX89KNyEJinp46QFwqEwetELC6
	XYOBG/dogI9rcjP19ghEDHb7p8pK1VwewtAdouxzvC/uzSbsh3V63dXuneXchpX0
	4w==
Received: (qmail 503911 invoked from network); 29 Mar 2025 08:28:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 08:28:00 +0100
X-UD-Smtp-Session: l3s3148p1@Z3RjIHYxJx1tKjJV
Date: Sat, 29 Mar 2025 08:28:00 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Message-ID: <Z-ehAHFRK_WaGVJp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
References: <202503290554.zASQT70Q-lkp@intel.com>
 <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-eeiMFsQQNMt2nn@shikoro>
 <TY3PR01MB11346D7FE2EC7FA3631C48A0C86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SSjaWliVp9hX0p5C"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346D7FE2EC7FA3631C48A0C86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--SSjaWliVp9hX0p5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The changes were done in SDHI core (renesas_sdhi_core.c).
>=20
> Like this, if a random config in that architecture has CONFIG_REGULATOR u=
ndefined
> will lead to the same error.

True :( Not happy, but I don't want to over-complicate things. Most
systems will have regulators enabled anyhow...


--SSjaWliVp9hX0p5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnoQAACgkQFA3kzBSg
KbaLyA//e+TibE5R1T06Gmo5hvWR5RS/M0j+vgZRoe7K/Zbgpd5pTDLNGpmv0m1z
N81nvx2B74/+Hh0dS2mY36ZOghDs5D1vyCZ0JKU2pY76WMza/XMZVDY8VYTaeSfA
a17bySHBKkkmO+NsSluRA8x9mImjrmjFH/K9RyCH7zEUKkrhrL+Ikb0V/+uogA5c
3wnXw0ItmIevENH8j2B7wp3iDvaYcWesV8grcjwwga2hJ98OmoXejrRt57oxC3sx
m+DpzgU3p3m2Zl+yrWU7XGIeRI16O4hyVp0hjJWbAjEqqCCynSIy5SCtiWO3sI9M
Md/y0EsVvM3U8TgZdtY0p3xAiPUOWZIgi+//AazeF6SuiR7IW5qwcCjXLNAt6Rtp
G/luN7XodMxlXw/SnrujagPbq2wgKTcu8YXId8VmyDihKC14lJGRJyjh4fUtJsDc
nkcnADdJoy6i7E5h0yjInSBr/mIcDAeFGwIQmond2Zn83a5bk+yK6MKV0CmsZe2i
Hoj4lSqT4t4rye3ICwS2HmfkPm8RrxCAMgG4cgSEwGpWOZ4XC0T09lfIaqyT1EQ7
Ez8idFj0T1N978my1RnGFwoNTHp/V82lnsHMfsG7GC5lOZDZ+YAQbBXRwYnLMHjZ
0jNZdjsc1ncuZic3noHTJgE2W82Alubv2IppnhMgJFAj5vQ/JxQ=
=Y1/S
-----END PGP SIGNATURE-----

--SSjaWliVp9hX0p5C--
