Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F722616E;
	Thu,  6 Feb 2025 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834062; cv=none; b=ikrqB6ckMoTq0go2mJRmlq+dKb9HpjDjKq0bCdQqlV7TqXuHPNva+VMKuUJBA5d0sxcdNGizMjNbN43zbxnbAKSXk0FkVJ0lhgMLyxQO5Avlgu2MbVq+MVAvQRff2sJd4YgYJvDu4uSLimWjZvkYJmtygwbjcT/ulDtWKgeyxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834062; c=relaxed/simple;
	bh=LyHTHcOuwcsQP4J2Dc2/lsHvwt01hgkVgyl/XaItmlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVUtahQxvrE0Dr3nkNldMpKqOh+WOjeg8FkdO3LPfxSMCqbjWBlmMoJoKLkt8Lv4swOxQF5hFSY/foNMIU/CBKeZquSMkuTzl48GrIIkm8zAzscR4V9LVo36FF7tXoOQGfXV7J2bsjasbaZ7mQ2uTNLP3UpNBCUlo3lAgTfUvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=LA6Zp/2w; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="LA6Zp/2w"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AD4C1047DC13;
	Thu,  6 Feb 2025 10:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1738834057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ow4+Kx+b/6PJn34QrN71STh7wSAG6yBiFGS8UWpuncE=;
	b=LA6Zp/2wo0P6VbALjmsjed/MQvy4GAM2ttsACe/SkwUdMLQ4cBNr47XeRMu6ictuUbX+5J
	bdOZpqyq7HrfqkTBr4tEa0YOfHCxIGYJB4+mBwh7HPpRe9pVNy6TqwdWVry0Uim34Mqh63
	Y60/yPNOReKEzLRssWD3xJNAPVp/IGtB9cLaLLrIBZUOsVKmj/PWOEeUR5uzuKPuV1bBTR
	MlDabpRtRZiLOnNo3/NIs1QKW1QacvXlEmcmL0O4iYFsuosGBKLQGY683eXfDc7UF1Ov87
	SlhFqFs5ko0xJndF8IfMsLMNvSH3H5ZDeuk6H0/xfC8+iYcUqMzWZNHRqDqQyg==
Date: Thu, 6 Feb 2025 10:27:32 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287
 based btt3-[012] devices
Message-ID: <20250206102732.0b44ba8f@wsk>
In-Reply-To: <Z1aucR3ueKIxOjSX@dragon>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241107085705.490940-3-lukma@denx.de>
	<20241119165236.69438f75@wsk>
	<Z1aucR3ueKIxOjSX@dragon>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TNnnD=tRVbWvJPPGyD3z5Li";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/TNnnD=tRVbWvJPPGyD3z5Li
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

> On Tue, Nov 19, 2024 at 04:52:36PM +0100, Lukasz Majewski wrote:
> > Dear Community,
> >  =20
> > > The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are
> > > to some extend similar to already upstreamed XEA devices, hence
> > > are using common imx28-lwe.dtsi file.
> > >=20
> > > New, imx28-btt3.dtsi has been added to embrace common DTS
> > > properties for different HW revisions for this device.
> > >=20
> > > As a result - changes introduced in imx28-btt3-[012].dts are
> > > minimal.
> > >  =20
> >=20
> > Are there any more comments / suggestions for this patch set? =20
>=20
> Patch #2 and #3 look good to me.  That said, I'm waiting #1 to be
> applied first.
>=20

Patch #1 has just been applied by Rob :-)

Could you apply #2 and #3 then?

Thanks in advance.

> Shawn
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/TNnnD=tRVbWvJPPGyD3z5Li
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmekgIQACgkQAR8vZIA0
zr18oQgAl2stI3tobRyfonZpyXccZ+rabZN9WyDq8lTK8qDfu7Y7T8HBPad3M+un
2ObYgvwKl6lA9Z7l02V0xfFq8pflb2xEAK8kNWuyi5164VgCGcU6ZQyqW/Yk6YhV
92YjrbR6J7S5CUXYQ0mfxbrBX9Tkow7Gr0HA8iCUqrkVDky4VICbdOF60KD+S2Yg
AaVfDqtsDaxGpvrcGCvXNM5at0y/GNfiKvmq7O4CSN1gGV0/LDKx2rY8qYuMsJ+U
E44EJoiDnqA2n2s2qgkfdKiJKgubCkvWjkyEAZQrij3pPQU7yT8iDn7GoqkxZsi1
SxSHsjD5W6AMZQwY9ncUmrvrECfKZQ==
=YTKp
-----END PGP SIGNATURE-----

--Sig_/TNnnD=tRVbWvJPPGyD3z5Li--
