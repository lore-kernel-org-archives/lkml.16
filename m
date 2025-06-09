Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088FB8F40;
	Mon,  9 Jun 2025 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502214; cv=none; b=MMdzFtd+lqrEfEf2QprrPtAAKRCgEkHdTE+BwSqYuh1nXICjhjotjO0H4IguGZHi20HklzmLqsIVgUqXSGtXrf0U4oS75TY91lYA/wqiu6hIGrdb3YdHES6+jKI9DYxIkC9QGVx900tpaf9JIufkOv7kaOYF3QO8vE0IOZML5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502214; c=relaxed/simple;
	bh=czj8XlBd8BGP8dnx691nvVAvffUO2lfVp4IK2xACIc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgmrXatHwqjyKJ8Ou0t/3iUz05Nm+e0PygKkmx33MwMr2zZ1XQz7k2/xG4EOWqZ5lAzGTVGqoek8ZunM2d8eE/oz26pJeyhT0ZiNbDFUuntDPREiPqk+Ufaw9oQ7sIGlgVSNsBoTvMAaVz1HrzhKEOtdMZ1qLZE9vOv3HEKclq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcWNN0t+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcWNN0t+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC322C4CEEB;
	Mon,  9 Jun 2025 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502213;
	bh=czj8XlBd8BGP8dnx691nvVAvffUO2lfVp4IK2xACIc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcWNN0t+THEU96bQpoUx943YDNPZojBBESB36TN+5fcySVIv/orje5oDASiVlrfoD
	 Cf2Nd3r2JZ8EYd6Yat2JsHhQ0n0x89mEOJKEn13e9aUvquTGzzVEr1L/FzqJvaEaV7
	 1ttg3S6PgExOokmA8BU2Ef6rtv714Jj93FRWOdJcu3IxBYX2MP0WT5ZjUJw3gcsl5O
	 f3/IyB/hNIyLlwwZpKgNGuxIPyIaWaEhM5ZWCYBVsgxqdbbC3yCkRQ74CT6MwKRLMD
	 TEkjVnLjWe3HPodQCRXN8iumyPC7hJQ47/02fB2nHIlzvH4xj4WNnj00etWQirY6DU
	 txScfQWqfnPaA==
Date: Mon, 9 Jun 2025 21:50:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jens.glathe@oldschoolsolutions.biz, konrad.dybcio@oss.qualcomm.com
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
Message-ID: <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
 <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2n2I1qDF5MuPK56M"
Content-Disposition: inline
In-Reply-To: <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
X-Cookie: Restaurant package, not for resale.


--2n2I1qDF5MuPK56M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2025 at 10:32:38PM +0200, Aleksandrs Vinarskis wrote:

> Thanks for your feedback. Yes, you are right, they _can_ have DT
> bindings for them. And typically that's the way to go for _embedded_
> devices that are eg. soldered on the motherboard. In this case of the
> webcam on Lenovo Thinbook 16 [1] the proposed option was to utilize
> the existing "onboard USB" driver, since it already has bindings and
> can be used for that [2]. The issue with this approach is that being a
> USB UVC device it is plug & play by definition, it does not need a
> dedicated driver, yet we want to bind it to a vreg to avoid having it
> always on. Thus, adding VID/PID to a driver just for controlling the
> regulator is not very scalable.

I don't see why not, and this can also be approached from the controller
side - it's providing a USB bus which includes power as part of the
specification.  That's just a question of where the binding happens
though.

I'm also not clear what the relevance is here?  If we have a dummy
consumer we're still going to need to work out how to instantiate it -
that's the same problem no matter what's getting instantiated.  A dummy
consumer is a userspace interface, not a firmware interface.

> Having to add VID/PID for every device that does not in fact need a
> dedicated driver has another issue - it was just confirmed that Lenovo
> Ideapad 5 uses a similar setup with USB UVC webcam, but of course
> VID/PID are different. That would require yet another driver change.

We already need relatively large sets of quirks because laptops have
firmwares built for Windows which is happy to enumerate things based on
DMI information even when there is a perfectly good enumerable interface
that could describe things directly, never mind the bits that aren't
enumerable.  This doesn't seem particularly different.

--2n2I1qDF5MuPK56M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhHSQAACgkQJNaLcl1U
h9D/Xwf+IzuxzRyyXQ2qDMvaIo+/sQolGnz0vKNuHpQFXDgVWso98OSfQMY0Fe1Y
Ubbviziy/OxB1zktvHqf2WDmVcQbQeKJFi2sXsZ5XKcD5HzbBYdkXL/MyJbv0NM3
CXuN+TA9nbPn9g3Gpo10AnRU9FxpPGNbDMwS8Uf/SFcsOXQYSoeMHRBdknudx10J
ibfveWt0TiK7OfldNMy2Pjco4xq71fyHjzHjGGlYBNbSOUihBfOcTVhEQtVWqVLp
6RmOfNWWbZRrL1eEIeJ/fGll8ROTWwn7D5hkUpdNw5HVOiI8enWz8oLsxyui159c
huUJrg0Xn310pF5q1t8GdW2B70K7gQ==
=yv+h
-----END PGP SIGNATURE-----

--2n2I1qDF5MuPK56M--
