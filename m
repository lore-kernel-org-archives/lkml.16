Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB021283FF5;
	Mon, 19 May 2025 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667533; cv=none; b=jAvjDw6IqAfnj95e0Ce5yORPZHEIfNLJRkvUbJsFxpH0iW7ui6xYxZ4w3ILSj31Xv9uMtR1GUR7Ca2/5V6O1Dw5D/irEe8siBJjAYRBcKjNF5M/K7CUcCFHBx1UenJnF8pPLxyCZKYPJjmmtzOmVmRLWC1bH8QAijvXdd5JWk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667533; c=relaxed/simple;
	bh=F7YRmMOFq//Zj41lhbRzIgfQ1q5NYGjjYemIjKH9oPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4GqNQ0/OVSKzApvMTao0lvlbyt71H+grhBo2H6axPUosgmYvD7jX+5sRuuqNxqQoeGVHJ4EYabeO1TbimAZmyBovdqEqJ8fWfGlSxv/6WpXXDV5gmJuVxNozMENz77W4ABpVRHqYrYztshZjb4PDe4B5PuzTTRqPZbB1yPLAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJhAWvhY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJhAWvhY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756A8C4CEF3;
	Mon, 19 May 2025 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667532;
	bh=F7YRmMOFq//Zj41lhbRzIgfQ1q5NYGjjYemIjKH9oPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJhAWvhYeNnDaX6OlAQhwfM0q49rZXYRgLUKkd3scQg1etEX1Cg1Ijhy4Njgu5rTK
	 275EXj0kx1Q3kgbfY0oqHxrNVIUCMdpNvcjYxlUWFY/2MwQilPpj4rPkNQPk9v78+p
	 X+pwkzyjxh7kC46+Lfvkc6tstGNz8OsyRLBf5gZECUT/QOHVYOQ/VHfMYNdt3QCdGl
	 Ho20FH6PVNwmvog65sqObf2yMYh0GButWioZI7+38TWGOrdb0Aa1xRCyEJU6FPbgUa
	 vCDmxpGbI7gQ0yIYmfuKUu5AtAGJ7zDfbZdvVCQsmCTgbUDgpV3sBv6/RfyK9uvxP9
	 0STf88wfQkxMg==
Date: Mon, 19 May 2025 16:12:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: alejandroe1@geotab.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <20250519-confess-movable-7b2ef1e9d7bd@spud>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud>
 <aCssur0WxPbFs2HQ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rvOod/oI/TMBwwzV"
Content-Disposition: inline
In-Reply-To: <aCssur0WxPbFs2HQ@hovoldconsulting.com>


--rvOod/oI/TMBwwzV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 03:06:02PM +0200, Johan Hovold wrote:
> On Wed, May 14, 2025 at 04:49:01PM +0100, Conor Dooley wrote:
> > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 Rela=
y wrote:
> > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > >=20
> > > Add compatible for u-blox NEO-9M GPS module.
>=20
> > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > @@ -22,6 +22,7 @@ properties:
> > >        - u-blox,neo-6m
> > >        - u-blox,neo-8
> > >        - u-blox,neo-m8
> > > +      - u-blox,neo-m9
> >=20
> > No match data in the driver, why is a fallback not sufficient?
>=20
> By the way, what happened with the Subject in your reply here, Conor?

I dunno, I think it is possibly a bug in mutt. Not the first time I have
seen it. All I ever do is "g enter enter enter", I never paste into the
field and I would expect that pasting into the field would append.

--rvOod/oI/TMBwwzV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtKRAAKCRB4tDGHoIJi
0q72AP9NoLZnB1p2P6k5kAfvq8dGNzqXIimrG7I27Bix4zysoQEAlUykWA2rdrA2
gH9skoF5s7VWB3pVpht/uT+Sa3HfcQE=
=hAbg
-----END PGP SIGNATURE-----

--rvOod/oI/TMBwwzV--
