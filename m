Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5923F404
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638566; cv=none; b=Xymt2MetjBDynLlqyyvtsSxISCxjCepJgU0Y/1dwVwPQnoaNx3Ro37vaQT+ZT3ksVLzRJDsF8SWs2d5KcYMqxxuf7bYYpE/BTDFFw+svTfthy+0aKbgxtsfPAnSiQJiU5QDBCUJv6KoDECWwOahddEwrdumZtM+i0DArADIrBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638566; c=relaxed/simple;
	bh=BG+3U5BRPpeHUwsh0/ocvZgnQ7tc/uL3Yz4RKkw6EVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL1vaqJgE8S3xxnZIvwX14eBs8j480wNapkMShEmLFwmW+Jf9pqsb2v/KfVYr9JiyhngpVTUjoYUJZc+oHdyJhSt/rVlboskKslamSprHWqb6kSBBvbpAqcySyUdAmh9hn7/CLBsIdwAtIYaR5fV+YAeTBgDKa8AcRVPCdc82Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i5n00Hwl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i5n00Hwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BG+3
	U5BRPpeHUwsh0/ocvZgnQ7tc/uL3Yz4RKkw6EVE=; b=i5n00Hwl8dqpPVt/J0fO
	PkOZBd5xvSMmRJW7bV4Ka/U8mig3uO3zZrZfLEK40B6chQFRtq8XV2dCqyfLzO1O
	7MenZS67jN0tl4YKNEMnPexvQ6tXFSrJBJgYsZeuGpLRAREnYjLkpk3Fnk5/1JZD
	pAprRbx7OKokDe3pL8U0GsQrUHBmfFZ2/lBd8bQzO7eFIYpojU9RoqmAZoeUZLUU
	A+NkQGC+vvjaZI6fzWa6Lo+wztdy9ne/L1w5WcaCozY5RJOXK+fcoRip+qJU2PzJ
	+xQeK+Ao9OBTr2U8MVLVb2+PV5NH2HNfsLWgJGIa9TuVSrl5nSRWDJsF+ecCVcEc
	8w==
Received: (qmail 3207697 invoked from network); 11 Jun 2025 12:42:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 12:42:41 +0200
X-UD-Smtp-Session: l3s3148p1@3CXveEk3nqwujnuC
Date: Wed, 11 Jun 2025 12:42:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: rza2: use new GPIO line value setter
 callbacks
Message-ID: <aEldoce04-SzpXOf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
 <20250611-gpiochip-set-rv-pinctrl-renesas-v1-5-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DliDSL4lLimpm+A9"
Content-Disposition: inline
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-5-ad169a794ef0@linaro.org>


--DliDSL4lLimpm+A9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 09:27:56AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--DliDSL4lLimpm+A9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJXaEACgkQFA3kzBSg
KbYdNA//echg8AAoDSgs/eOpx7brqKhgGd3f/IY/Z7mCtmsJqAIyzgDg7eYr3s6z
RdidMdXkr95sdBoitW4R1h8+fC/raJF3PJpgzMejZtZSH1d8SMjyggVZNCHjEzS+
qwowzXdyKH5r0ZPchx8pbewQpkIm1ctehbxL2r0ChtMV4h5JiXPteEIvlUIkkGvu
g150W4YWk5ja6Tr09tfH2Ka60RtYNpsVjcP+3QFJKhUg+XZniyJQhPHM6KMg0v2w
wKijOPTcTLBo1ArYk/IBONT0SikXIMRqhRaMjOK4J2Z05icQ1XLQOI4haAWWFqin
xb0Pf9ZYwH3YJqEiGVIj8XMjhpHgJuc1T38hBrdufs+eSnQ5wQ2f+AQ5LrPi1XLu
WELO2GfoP2nm+uEaB2j72tRRUTrwawwRj006Ufo4mDNApg14dPASzc3dREb55I78
3DiQaK3oXI7QgO+6sqvC+EPth7fEWLas/kYJyiVm0NNlpegcb47/jZtP/wjgsWLA
Id4P6U8nnWS9GNbW37OMeVtktr4MW1gQEfhWI9W0qAa7H5Waot0hnJTvDEtQrdBi
/i8JYH2H02aBkTX8Jqja7TH0GOsaaWg6lBia3f2dP/PAaBkms0AlIRrobNL2PnCw
ArMxW0tKne5QHZFCJg7TvTmpO8I/gmBD1Pufw/3VHXFsuaqOBbQ=
=C3Vi
-----END PGP SIGNATURE-----

--DliDSL4lLimpm+A9--
