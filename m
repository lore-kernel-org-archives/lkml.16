Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F67717BCE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743232653; cv=none; b=nXLyM75EIxpo2owCcyHtBnwxkRZx0WwcgggefUX4xk3rHoED42tAMxXMjOHmjqlEy9XCh8+Wv5c8TGTT7Weh6U1bZ6hOg+QoteAN/aZ19RHRBuijdJYGiKVT4KDTNpLIB8AD363iqR1bMYkUEAxsLMTBBcgSy8NhEbjgGoADLFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743232653; c=relaxed/simple;
	bh=pHDcwcdCWlIaqEp6nV5lzO1/FwWwxhbSB6iAmIHdiEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMj73D3A7TMAmdwliGYOJAQpSyxbC/cs9bFXlm3819V2i38eULvR/KKvPp1lW84WIRl2YAr80Pc95B1Uzvogi91fZDhJbiQ2Fcrtfa/PfL6prchDM6WxmasVMCSxP7Km+f6zVPAJiTuad+yCiUN6ltwFjsaFDyBVFkt4efkYVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EoRjfBmd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EoRjfBmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pHDc
	wcdCWlIaqEp6nV5lzO1/FwWwxhbSB6iAmIHdiEI=; b=EoRjfBmdS7ql0y3A619X
	LJMMTIS+rz0wXS7ZthG/A/a/TAJuyeFRQttuj+KHvHzSnRmPdXfHgOTeu8A1i1k9
	bnw5J45SVhRH4p1rf9tUHZ0YSzTDtFsiuWwohQeSms/LSp+0nTH52rzs8ZkyAQUg
	W8X9M9tlVF4EW0/GdQO3IQnq5wDLQcR2WwwaAlg/kSGjoNI6zzjuoCP4SjOpt3KF
	RwTyyT2Oo2SSEBUdwi4mFK71q3cErmUYmcNCL4GRHAinZIQ2hQYXTur8F4NVZON2
	qKigHEzsM4YtH28agmjy7iv1uXtXi/W2R9maExr/Ufc2tHfuICCmIi+EuhlGw0Zm
	ww==
Received: (qmail 500837 invoked from network); 29 Mar 2025 08:17:26 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 08:17:26 +0100
X-UD-Smtp-Session: l3s3148p1@rM6i+nUxyMsgAwD6PzqDAV8182DI+BaV
Date: Sat, 29 Mar 2025 08:17:28 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Message-ID: <Z-eeiMFsQQNMt2nn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
References: <202503290554.zASQT70Q-lkp@intel.com>
 <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iguF7BL6pGUKVrQt"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--iguF7BL6pGUKVrQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> CONFIG_REGULATOR is not enabled in arm-randconfig-r111-20250328 that is l=
eading
> to this build issue.
>=20
> I will send a fix by "select REGULATOR" in config MMC_SDHI

What about using MMC_SDHI_INTERNAL_DMAC? So we leave out at least older
SDHI instances. Ideally, we would say "select ... if <family>" but this
will easily be missed in updates. Maybe the above is a fair compromise.
Those systems will likely have regulators enabled anyhow.


--iguF7BL6pGUKVrQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnnoUACgkQFA3kzBSg
KbaB9g//XEUO1e5q/im9ObdoEmywHib/gPvFmaeOnde2turoyYZG0XR08isFt61Q
4Ui28oqxljCkI2DU6eydBVQGilNAFcpSq+GSPjMJCckGDP8cZDpijXA8SwX5RmdL
vIZgWptz5BPqK+OLbou/1Xp4nb7DPND5H/6wExtFXpddrPkQ6AGk1/Wu+RiiKE8c
KkrVaRhW70xB0dTbLba9nScbSv6ddUVkWBIZCua6nTbUWxyyJrLNv8BUJRYXbslj
G9MJ9/mHuPKqnRHrlVA2HBxIuYmXkrBUcYNqlNulEuAa7UILq30EIMq0byI/Em1+
LPh6wkoquswz40aNh7Dp6f1XRlxZ+EUVX6wUVY3iXTquN98i+9cUMXTVpnn2xONi
mcBmzILODNAQEgnVpJtUE1or6FbFJ0ZdwOB1KGcmcQeRTIRx02JKOZAXSE6NhUD8
ZZVkV0gaL5txQ2EXaIRZsykdci4i3EL6zAffzLLpzrU/+w0K7YlJgYtgwIRligp/
EzN2N7zLDOg9IgYVFK9QlHxKPkpBzMRINCwGiCpC4syaHiNGP9u5EqCjMUdBcCJh
VCSLDs4TjdX2z9T4ohIHFwxEF+xDbK7yh+Us/oxuxDx+sUNVxiNWcyLEq0lVUACO
KxY1uDJtrddMBnxXhD6Yki0YOOB82u/XsdQ80CqdcucinOfWfRY=
=0b6W
-----END PGP SIGNATURE-----

--iguF7BL6pGUKVrQt--
