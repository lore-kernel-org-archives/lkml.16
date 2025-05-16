Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C556611E;
	Fri, 16 May 2025 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404099; cv=none; b=sIeJxQvOdvLqizk6k9WRx4SVnmK0ECzTynjoxrXejAuizRsFyuP1rbSCz32Ehu9JEJHBE3FiQEeXXkzPQFc1QQ35teQuXqzlAcm8MHmaMnBYPsApXzoZp1JIpX9Mye+020sUHrAXbvg176Vk1aDkYP2VgRRst6fak2N8p5JhrKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404099; c=relaxed/simple;
	bh=f/ez5+ZlzlIHnsW5duY84m4TJ3zpnI8DqQZmPZ44+lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgIq41K98Ouw2ozvOAF5WQfcR0EjJECwJjV6i1A7TFb68O/bVKlJKiE1AAodHkZ5kqNB3mD5E0b4Y7JNlMm6UH9GqTSvfR4D9r24SksUlZHRct1zSu1lfHasMEzOK8wSvLao8i63WONQKaSzVmv8k5+oYM9bdyFHAptzkUxgyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ejfhhv0P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ejfhhv0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF1AC4CEE4;
	Fri, 16 May 2025 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404098;
	bh=f/ez5+ZlzlIHnsW5duY84m4TJ3zpnI8DqQZmPZ44+lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ejfhhv0PvBi+SYE4nZFyhMPQxoZT58IYXUs7Uavx8zK4VbTGbh9wBe+AAdDssxgch
	 LfrHgH0AfjDnEx1At23KQdOwVHaAef5k0//vM9oHxk2Bpc/liZMtui/P40LS1cbPPu
	 ffpACuH2zLJJNhU2n5o/pxICbMDUw1vJWVPzdX2lWHdRvBvSalH+4zbLK8gH5qpRbJ
	 PKzCrp+NsDS0FGsgF6gOGt6MJkaE4VdLHqxVw9r5JGe3LWpDYtuBIgYuwJeFzXiRwd
	 cnEPQeBzZxkYOVDfLtQY8joUBmlw46JCDKLUh5+Pde9cGNodhimfM8GVmoTf4l0hm5
	 B9YClHzNq4AKA==
Date: Fri, 16 May 2025 15:01:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <20250516-unfasten-submersed-e854fc9a0142@spud>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud>
 <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
 <20250515-varying-swan-31ca63615b43@spud>
 <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="igPO54Zv7iTQt/LL"
Content-Disposition: inline
In-Reply-To: <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>


--igPO54Zv7iTQt/LL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:23:35PM +0200, Alejandro Enrique wrote:
> On Thu, May 15, 2025 at 5:02=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, May 14, 2025 at 06:53:25PM +0200, Alejandro Enrique wrote:
> > > On Wed, May 14, 2025 at 5:49=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > >
> > > > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 =
Relay
> > > > wrote:
> > > > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > > > >
> > > > > Add compatible for u-blox NEO-9M GPS module.
> > > > >
> > > > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m=
=2Eyaml
> > > > b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > index
> > > > 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8156a=
72170965929bb7e
> > > > 100644
> > > > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > @@ -22,6 +22,7 @@ properties:
> > > > >        - u-blox,neo-6m
> > > > >        - u-blox,neo-8
> > > > >        - u-blox,neo-m8
> > > > > +      - u-blox,neo-m9
> > > >
> > > > No match data in the driver, why is a fallback not sufficient?
> > > >
> > >
> > > I added the match data in the driver in the PATCH 2/2 of this series
> > > in the same fashion as previously supported modules.
> >
> > Did you? When I looked, there was just a compatible and no match data.
>=20
> You are right. I just added a compatible string, no match data. Sorry,
> I was not following.
> I just added the neo-m9 compatible the same way the neo-6m was previously
> added.
>=20
> What do you mean by using a fallback? Using one of the existent
> compatibles (none have match data) or adding a new fallback
> compatible, something like just "u-blox,neo"?

Falling back to one of the existing ones, like neo-m8.

--igPO54Zv7iTQt/LL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCdFPgAKCRB4tDGHoIJi
0ocGAQDHwFYrWtOhkM7bBrSaY1o6vT9VhtALmzyAvFmHMp5xxgD+JEp+ke3NWLEX
J/kjxRcrW9CCIDlDo8vL9Kjc4unbngU=
=hpUU
-----END PGP SIGNATURE-----

--igPO54Zv7iTQt/LL--
