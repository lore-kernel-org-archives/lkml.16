Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F759B71;
	Mon, 28 Apr 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836628; cv=none; b=A3ku3Wt3MRHLPghPdMncDxzUtJMSZkMeSQJmxdHz3HwPWHk21i2MA5UDaTNldNC0Y9UfoxmgcFMLohTWW7CC9la9uCIX06MNqywyFnsVI8mf2uZg0BZlG+bsV35ziG8+E/MoowTga0yw2d8TgMmVuMP1R1ux69GelJ+4Kp3r/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836628; c=relaxed/simple;
	bh=B1dGRmjcRNXpAFe31TZaoEINK1Ne+EtdvjeT/ksZONI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok7ybup9DdSIZIV9IbiF+/UikwDbdmFhCFvMftdT7NK2VdO3LEMDmKZXq9WJ43iaSc/WoyMxZmwYhJ7raOJXtnDWoPScn1k3f2E6hhDuwrF+yBBcXGA74HQ6tY1LdUZ0BQKzwp9uTDmrlYktwP0sxwU7rxHfD3EhkKmlUfW94mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=NovZaOQr; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="NovZaOQr"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 803651C00B2; Mon, 28 Apr 2025 12:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745836622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sK1vyzZ1/+Jz3BVDrNB5HsQaiId/G9OE1+QZi7+pUo4=;
	b=NovZaOQrOnYyuz4h8MTpMapCl+bGF0gUM27+yMWiDTxs4K56P/UTaF4wfkDUFWS+kjPZil
	7fPVRr+WvxX++Xxt/1j0WMsCDMdJcvb6Za5AiE6qz4VPlng+0vsZFR2nWCw8ljivMhaGKO
	1RYtOP22T4/eItT4cLkXKQJw1grdt+0=
Date: Mon, 28 Apr 2025 12:37:02 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aA9aTjhXHb3gddd9@duo.ucw.cz>
References: <20250427082447.138359-1-trannamatk@gmail.com>
 <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ag0ctD1RJcTfntuY"
Content-Disposition: inline
In-Reply-To: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>


--Ag0ctD1RJcTfntuY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This patch series adds support for the TI/National Semiconductor LP5812
> > 4x3 matrix RGB LED driver. The driver supports features such as autonom=
ous
> > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> >
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> > Changes in v8:
> > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> >   and update the title and $id to match new path.
> > - No functional changes to the binding itself (keep Reviewed-by).
> > - Update commit messages and patch titles to reflect the move.
> > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1=
-trannamatk@gmail.com/
>=20
> Out of sudden without discussing with auxdisplay maintainers/reviewers?
> Thanks, no.
> Please, put into the cover letter the meaningful summary of what's
> going on and why this becomes an auxdisplay issue. Brief review of the
> bindings sounds more likely like LEDS or PWM subsystems.

It is 4x3 matrix. That means it is not suitable for LEDs. I don't
believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
but...

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--Ag0ctD1RJcTfntuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA9aTgAKCRAw5/Bqldv6
8u5oAKCw7eoZkIX/nBIa7XNYs4+P55FOvwCfaRsaqwJ7S1BjMxnZd5ElzqJ4liY=
=6Zmi
-----END PGP SIGNATURE-----

--Ag0ctD1RJcTfntuY--
