Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487E02620DE;
	Thu,  8 May 2025 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693512; cv=none; b=oyZaHNws0FeSRhSncKXvy98pvp6C81qhBmBBnrj3mJuv/in0e1uCrAD+voYHgkCHMz/qCq/T51iUUQKwE61SIX4e6I+DmNg8PF9kuDCKyDKmhn3oXpW6pGbq4naqQIH0cioLlMApJF+iioIlJW5Acdhcxw47IHCu6937fMCtDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693512; c=relaxed/simple;
	bh=k2Zp0OCJhicYzRUQR/Kgk6rk1liK2EZ01nmsvcrs+gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tW257IWPZRhxcxBoQtjIwXrFu9JmFLM5262uSXpAQUr1pr0h+KVPZMTUw6IzyCu3yhQzcVVTsig5C/bjAouG6h2vcEgq79GheYtVW4fbVAzxCDkku4ll54rld2MXL1dKLQ/QXhTnOEyJ+FpWI2X+SKOsfePuU237XlGFPgW6e9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=PrNROnZx; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="PrNROnZx"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 119011C00AB; Thu,  8 May 2025 10:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1746693506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckLCaz9JTwf1JWFkvqfAI949tTAoo5JbgEelAt8RQvk=;
	b=PrNROnZxCeea0Jho3SCM2w2/XQ838ikowGDgqD5QtqDpcbs2e38VTtLBxxZMMMgBH106hN
	ElEgO86ZtWA95vGDx4pxSfOv1o9I+6k7QtMEG7l7O3C1NTem1cc1t5S4b7wJXNH5bXaSdM
	eWoeYLiJhf2uUsYUbdE6G4bbk2b6sMs=
Date: Thu, 8 May 2025 10:38:25 +0200
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
Message-ID: <aBxtgZw6+BM36Rru@duo.ucw.cz>
References: <aA/ineUBAM5IU79J@duo.ucw.cz>
 <20250429170220.8145-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DXdxuze0uvDm4WRw"
Content-Disposition: inline
In-Reply-To: <20250429170220.8145-1-trannamatk@gmail.com>


--DXdxuze0uvDm4WRw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Thank you, Pavel, for the confirmation.
> > > Thank you, Geert, for the review and the question.
> > >=20
> > > I would like to make it clearer.
> > >=20
> > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > >=20
> >=20
> > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > >   and update the title and $id to match new path.
> > > > > > > - No functional changes to the binding itself (keep Reviewed-=
by).
> > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/202504221901=
21.46839-1-trannamatk@gmail.com/
> > > > > >
> > > > > > Out of sudden without discussing with auxdisplay maintainers/re=
viewers?
> > > > > > Thanks, no.
> > > > > > Please, put into the cover letter the meaningful summary of wha=
t's
> > > > > > going on and why this becomes an auxdisplay issue. Brief review=
 of the
> > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > >
> > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outpu=
ts,
> > > > > but...
> > > >=20
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

Show us one device where it is used, photo would be best. I suspect
that the router use might indeed qualify for LED subsystem.

You described is at 4x3 display, but it is really used as 4xRGB?

> Given that, it seems to match the LED subsystem better than auxdisplay, d=
oesn't it?

Seems so, yes. From description, I assumed it was 4x3xRGB, not 4xRGB.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--DXdxuze0uvDm4WRw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaBxtgQAKCRAw5/Bqldv6
8mN6AJwN7zf8tTTp+bxWAqTTF1AoTBaggQCbBSUYvVJF5PV+ahfMfUjtZcxAwkw=
=EZPf
-----END PGP SIGNATURE-----

--DXdxuze0uvDm4WRw--
