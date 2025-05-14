Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E462220F24;
	Wed, 14 May 2025 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212756; cv=none; b=Zva4D9n6I3DAEViT6ZBMgCI5ksmSdWfXAcyHRG46B+yRhWN5mpdko3UvdICdFi+9Q5HfzKzg3EUa2Mx6t0RKiKMClSl68pRebvfl9PH42CJ+SKCP4ilfo4SjSQDDb6YkxHhPWpSHAfsj2fXgl4RvY9u/Jpo3AlRN+7Hi4qiFmeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212756; c=relaxed/simple;
	bh=dFrSsSDv6HrvySvJEPFuOaEYOApN+I+8GqE8ME7PSIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IL4tN7nJfmQs2KQt5DHGTnEBvHTgkvFvsU95IOQkvZ90zWM7dXg26zFBR0hpf57Gtlsfe62OGjjNMjCUOuptrZrfEQwtWzFKjmRQFtpBvZXf9WmgChBWPV7+S/ZLBu8OvCWiYa+5HqOd6M4bWQDEII0AucAWOJA4wryS0LaiWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQLWfLPI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQLWfLPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4064C4CEE9;
	Wed, 14 May 2025 08:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212755;
	bh=dFrSsSDv6HrvySvJEPFuOaEYOApN+I+8GqE8ME7PSIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQLWfLPIgAtN/UINC5qfLYZscirwfpKFmXpNlYP7OLGGeO1nsbs5mVonYezcTz8n/
	 15mSHUKRfo5nM76Ok2O6QGJA+CWEli8QdoEUGm7alBbMGpSrS3nC3G7AamHe863njJ
	 9drZ+71BFpEqI2cbAnT5IG+1q4Axbq52J5/TVG9Me9tzMWkJoK0XhHBhZ3UALB41kd
	 J4Euc7d62Y+sVWkxH0XO2EK1oYNK6VL6mKAj+XTKxJhk2hodNz423ypmUIYyHcDIPf
	 1ThHtUTOdr4u1dVYX5DIa3SIhSsqX/pPQEK6ew8+OFXVA9Lehcx2/EuZsfq9UW33Z7
	 4+FaY1vAH01RQ==
Date: Wed, 14 May 2025 10:52:31 +0200
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gq8+2GgzFjfqwkiK"
Content-Disposition: inline
In-Reply-To: <20250509140957.GD2492385@google.com>
X-Cookie: Well begun is half done.


--Gq8+2GgzFjfqwkiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 09, 2025 at 03:09:57PM +0100, Lee Jones wrote:
> On Wed, 30 Apr 2025, Artur Weber wrote:

> > ---
> >  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
> >  include/linux/mfd/bcm590xx.h |  7 +++++++
> >  2 files changed, 18 insertions(+), 1 deletion(-)

> I can't merge this until Mark has provided the Regulator Acks.

Could you be more explicit what you're looking for here, the diffstat is
entirely MFD?

--Gq8+2GgzFjfqwkiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWc4ACgkQJNaLcl1U
h9DoJgf9HRWiZlDu8zMbaXMf3cFnPAmtyMLpsYum8wbNl8UYDQPsaKNxBdsGvoEQ
EF4H43BjGG8lu8v/LBXIUcfCbIYPfMIsts0806x9W+fops51dqsS01kW38FW6KYB
6sYN74rPwEuUWFuLIe9GeFymNrFr57By7LbMOPYiiuJSk4AKolbu5lOqAAmr8n5O
f55jGKXEB9TEykCvjxWgM8df4Lo54DvGvGjxLDVi3iZDRzBh5l58/oHWg0imQFI4
VQcjXJmQXQkPSHUY7WBjvEWU1mFlwh9PLR9JX95A1XdVYfiN7kXDELZWtqOIIEeu
pJUbUA83LtHBigPKZOC5Jvl6ziMqSA==
=VFDd
-----END PGP SIGNATURE-----

--Gq8+2GgzFjfqwkiK--
