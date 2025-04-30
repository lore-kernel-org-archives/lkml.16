Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CD1E98EB;
	Wed, 30 Apr 2025 07:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997320; cv=none; b=PfabmcDpVOG4am49wq4oU+V2q5+jhMqg4thaq5LZSCzoMVf7ru7QWDTrdW32Cx4GzuGargiApqWhs53yx9gD723VXFdniZgdCTLJdVatg9V7wNj5V0244IvhWUpuMY+GUhnhqlhYp9FGrQGTKvjJrLLoG0qJL8OxQX6thoOxkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997320; c=relaxed/simple;
	bh=PAsD7NS4YVFutLoWr6jqj6AC3UU/UXuFp0b49PB+QGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFw/Du8NCVt/gLnX9f7F8NFS6sNkvBu4xtmJkglnXwWN+JrojRLkWAy4fB0MHlGE+IHPBGm69lg3R2hAN1ngQdpxhJYv+edPwUGAyiO4J5I8DjkvpqEApHEgBBqS+mTklOgJiM/9VMP5GWcatM9Nr4ScEOfLUPWLgvf8O+Pckew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=e28nt/lV; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="e28nt/lV"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 52B511C01AA; Wed, 30 Apr 2025 09:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745997308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uWhUtB07fuy+20OaSmbXkXnv/vhP67L+RCQmHanEtY=;
	b=e28nt/lVW+XJbyWKMQHktS27mBX3qBE/5EeAl30/FlGEVNUc2OaCXyhF7sq4kn5mT435qz
	mAvgP9BJAL/CACX2+38yWS3M0okLMEpwve42TUFWG3jNK/B6/vwULbF1DxRtlHfz+omiWw
	eOmxtRcmWl1UOGZ3FqUoePo9R12vblc=
Date: Wed, 30 Apr 2025 09:15:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, geert@linux-m68k.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aBHN+395kaIdbBEm@duo.ucw.cz>
References: <aA/ineUBAM5IU79J@duo.ucw.cz>
 <20250429170220.8145-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y8wJvSsTAszRr9tX"
Content-Disposition: inline
In-Reply-To: <20250429170220.8145-1-trannamatk@gmail.com>


--Y8wJvSsTAszRr9tX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Is it intended to be used as a 4x3 matrix, or is this just an inter=
nal
> > > > wiring detail, and should it be exposed as 12 individual LEDs inste=
ad?
> > >=20
> > > The 4=C3=973 matrix is a real and fundamental aspect of the LP5812=E2=
=80=99s operation.
> > > It is not just an internal wiring detail.
> > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 =
output
> > > pins control 12 LED dots individually through scanning. Each pin incl=
udes
> > > both high-side and low-side drive circuits, meaning matrix multiplexi=
ng is
> > > required for proper operation =E2=80=94 it cannot be treated as 12 co=
mpletely
> > > independent LEDs.
> >=20
> > Scanning is really a detail.
> >=20
> > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> >=20
> > If this is used as a power LED, SD activity LED, capslock and numlock
> > ... placed randomly all around the device, then it goes LED subsystem.
>=20
> The LP5812 is used for LED status indication in devices like smart speake=
rs,
> wearables, and routers, not as a structured rectangular display.

Well, IIRC it also supports automated animations, and that does not
make sense on LED indicators. So... what device do _you_ have and how
exactly is it used there?

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--Y8wJvSsTAszRr9tX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaBHN+wAKCRAw5/Bqldv6
8vbsAJ4yWVOLyewaLjKCy5K42zX2pr7vhQCfRwpEm2TX7CnFns8+ygH5cB6Wa/I=
=tWxB
-----END PGP SIGNATURE-----

--Y8wJvSsTAszRr9tX--
