Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91681624C3;
	Thu, 15 May 2025 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321327; cv=none; b=ZfmK5pXHRR1y7AGUauB32LrIAackRSMB+UkihXaeQPvwJzUxkPcUMEqMx4/BVuSkp+II44aTEriGwbahqJ07+S5IzfyOxqAiQWoDPsI15D7FlCqdnsyXMGGQgp5+99+Ng0SK+I/ByXLpSyJDIUOB6H5e091eoxD4NZBzadhnuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321327; c=relaxed/simple;
	bh=SZnCydp1A31hBatr3Nonpw18aHRM7c7uibePd61W98A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op9YLeU/vaS5kLYoO6BtB0S2p0+hRpysop1fIrTbuJBNF+0MJcdjkK1Xt3cKDwWA4Cc+hPgvekaTFrW1rdBRbcc5wPwbyQVufL8+Wvp2s22s9Yi4BxF8xCRr4tVzW0j+MPmLLZpsT3rySP4XSuT/SVOjv+ZDFSppZN1rgYuO7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+v3vbtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+v3vbtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D3EC4CEEF;
	Thu, 15 May 2025 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321327;
	bh=SZnCydp1A31hBatr3Nonpw18aHRM7c7uibePd61W98A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+v3vbtCiHJ9v8HsFsJ5TmBJo9cKGOzsl4Z/I9skCj6oRDGVpRnlQkQuduIW701hW
	 Ce2riw7Di48VwpWs+Pfw5aH5+hUI82QxQCYOVPZwfuy6gFvb8HHgP3Psa7qjaEIKdG
	 H/QPdAjbn5awK/cwwzb0GheJODGIXbRwlQ5+Fi8VB4n5z4MLQw8/S7Op/qk4su+rpd
	 CLx46VleJ3QMQdccxzQIymoqUNP82pj80/s7QubTVgzwqZhfraEQrF6njet6AMFVMw
	 FKn+BnBV2qlIn9eTIpUX6Hzfa6Use4mKSnBcOA7xPqRlNOxafFJ7glgr1oCzdZ+7f6
	 KlNo73RAjqwWg==
Date: Thu, 15 May 2025 16:02:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <20250515-varying-swan-31ca63615b43@spud>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud>
 <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ADqPJoTY7rgGJ5s6"
Content-Disposition: inline
In-Reply-To: <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>


--ADqPJoTY7rgGJ5s6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 06:53:25PM +0200, Alejandro Enrique wrote:
> On Wed, May 14, 2025 at 5:49=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 Relay
> > wrote:
> > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > >
> > > Add compatible for u-blox NEO-9M GPS module.
> > >
> > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > ---
> > >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > index
> > 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8156a7217=
0965929bb7e
> > 100644
> > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > @@ -22,6 +22,7 @@ properties:
> > >        - u-blox,neo-6m
> > >        - u-blox,neo-8
> > >        - u-blox,neo-m8
> > > +      - u-blox,neo-m9
> >
> > No match data in the driver, why is a fallback not sufficient?
> >
>=20
> I added the match data in the driver in the PATCH 2/2 of this series
> in the same fashion as previously supported modules.

Did you? When I looked, there was just a compatible and no match data.

--ADqPJoTY7rgGJ5s6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYB6wAKCRB4tDGHoIJi
0ht3AP4i1y7a4jdKMYHckQoYqhAkkIguUPpT4ySpEmIWTQksiwD9EQqjURjQVnIn
rdJwfldmxQJhtSAPgz24ifGAHsJ37wg=
=GNA8
-----END PGP SIGNATURE-----

--ADqPJoTY7rgGJ5s6--
