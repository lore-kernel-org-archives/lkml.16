Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAB139CE3;
	Mon, 28 Apr 2025 20:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871524; cv=none; b=Y0mA1Ed55Kh8849k6upwPAWaUqnBEHIILWjCo9qL5kHO3CLVbRPPywpGOQFZcC6i8p1gMGuEoQ4oxn4p5V5KN6xbddN3gGvRtfCOJn/caEMOCqbjuDeT+t6bmMp6wwjndj7jUJAPB0bKf1/0d9I3yNkARiNomj86oXW4aT0RXPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871524; c=relaxed/simple;
	bh=CJgeyPII8sNl4n2PbVSLEfScrAbVVGyzU+VjTIGFjJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2zfRPk0pffpSWa+I5OUkIfnSKf0Lz1OQWjjxh+qGWgRqJEp/hkr2PH7227VYpFhWiqDLYzScpKUPXcVXMc8YSy0749hL4u9MEONDG/smI9hwPEDi+J1Gta44jQAXcN+XsTcPCu0nQq8Ocjsyo0ImDTABApNxf6nwtR0c2+9Ovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=X2sswUxg; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="X2sswUxg"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6B5881C00B2; Mon, 28 Apr 2025 22:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745871518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pL7e0c02mbv/0vwsIMwslL/GXK+LDR2a6ftGA055ovQ=;
	b=X2sswUxgS8rseE954SAultNrk/gSe6kFPYI/ahGW0v6GaxxwGRyoJwzni0/XGns+i6V6Gu
	wegTZ0i5B0iAYmvz1ToPZrRese1ZzshF30N4j3q1qa/QuQ/siLpRc8Vsihus/YUYqiTfh9
	CO/zM40LI8WPDX4dyrAoj25hoelcEOw=
Date: Mon, 28 Apr 2025 22:18:37 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nam Tran <trannamatk@gmail.com>
Cc: geert@linux-m68k.org, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aA/ineUBAM5IU79J@duo.ucw.cz>
References: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
 <20250428172917.25405-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MN9BK62TjYm6fNeb"
Content-Disposition: inline
In-Reply-To: <20250428172917.25405-1-trannamatk@gmail.com>


--MN9BK62TjYm6fNeb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thank you, Pavel, for the confirmation.
> Thank you, Geert, for the review and the question.
>=20
> I would like to make it clearer.
>=20
> On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
>=20

> > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > >   and update the title and $id to match new path.
> > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > - Update commit messages and patch titles to reflect the move.
> > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.4=
6839-1-trannamatk@gmail.com/
> > > >
> > > > Out of sudden without discussing with auxdisplay maintainers/review=
ers?
> > > > Thanks, no.
> > > > Please, put into the cover letter the meaningful summary of what's
> > > > going on and why this becomes an auxdisplay issue. Brief review of =
the
> > > > bindings sounds more likely like LEDS or PWM subsystems.
> > >
> > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > but...
> >=20
> > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > wiring detail, and should it be exposed as 12 individual LEDs instead?
>=20
> The 4=C3=973 matrix is a real and fundamental aspect of the LP5812=E2=80=
=99s operation.
> It is not just an internal wiring detail.
> The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 outp=
ut
> pins control 12 LED dots individually through scanning. Each pin includes
> both high-side and low-side drive circuits, meaning matrix multiplexing is
> required for proper operation =E2=80=94 it cannot be treated as 12 comple=
tely
> independent LEDs.

Scanning is really a detail.

If this is used as rectangular 4x3 display, then it goes to auxdisplay.

If this is used as a power LED, SD activity LED, capslock and numlock
=2E.. placed randomly all around the device, then it goes LED subsystem.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--MN9BK62TjYm6fNeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA/inQAKCRAw5/Bqldv6
8uIbAJ9b7Wxw9w0XNXTWOjMbMpolG2mURwCfZJERufyKV1fAXGFzbOZeb+pFo7g=
=PiIm
-----END PGP SIGNATURE-----

--MN9BK62TjYm6fNeb--
