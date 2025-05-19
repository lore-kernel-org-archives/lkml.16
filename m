Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550B126D4E3;
	Mon, 19 May 2025 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658243; cv=none; b=NqnRsxuPBhoPKsiqPL4if+HYw4ePtA315gpgh1ezWzVfWZ089v2CG85j384tYPnvPxtiZtskYSZVD+d+WbMGWXfU/7/73OhQ+VS1cz495lapfsX2fVc4IQFh/xqEBlsjpWi3jkJp/hig+IpyoLkAsAOsC4Fj64qGzS2UI9ZYKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658243; c=relaxed/simple;
	bh=OPb24WSHEv+e9i6+TiE/kgAU14z58rgNG8YvtfGAmNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Twvzz3RrcEXHh2EJQUCMcpLNiATOqDimN6QGRmS1PKh3JcXR3xVCrrYXU713VCRbjO1zaEOudUx8aWESvwcEx6xZEWIpNKsxpQKMI7RQemFL+p3MEHnaTtyc8PV+d0tZMPDmuGUbIIGdqh2xlyO2LGYNsdUR6RcgtyW+2l6iUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU7+x1Mi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU7+x1Mi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966CEC4CEF0;
	Mon, 19 May 2025 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747658243;
	bh=OPb24WSHEv+e9i6+TiE/kgAU14z58rgNG8YvtfGAmNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nU7+x1MiVYMZ4adC2o5Djg/3jXiEFeTCWeX7Rn+txQz+GbF5B/UN/7zSXdV5R6gva
	 jAriXBxj66W3nHTbhU2o5gpl4AjgznmNecIOy736OR52dlBfTScUwbeLPNu3LGfDgB
	 Q3fjLLbSGh1z6hvOItfvN9ToITZkokb5cFpHyBrrOLF4+bAAUChcnqubGYJMnd1G6I
	 kh2xODkRFCWkKWhF9WznwH8/POJu+QcxKXDAI6GLiFq2DG4pWkxJJ6WodUe9f2jsN9
	 SR1v3HQEMnZGDh+CpEJ8Q6mLB25PjIrmFDzmAj9HeJYjmbVmOZhwrVrOZzNLAG4uVz
	 XqWGPPE8DoBmg==
Date: Mon, 19 May 2025 13:37:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <20250519-dining-tumbling-ff005fcdae03@spud>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud>
 <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
 <20250515-varying-swan-31ca63615b43@spud>
 <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>
 <20250516-unfasten-submersed-e854fc9a0142@spud>
 <CAN=L63phSnssXs1p2HXhf08HMaHCE80EgMZQR0vPqhME2tknBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1sJ959amROs/zspS"
Content-Disposition: inline
In-Reply-To: <CAN=L63phSnssXs1p2HXhf08HMaHCE80EgMZQR0vPqhME2tknBQ@mail.gmail.com>


--1sJ959amROs/zspS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 05:00:50PM +0200, Alejandro Enrique wrote:
> On Fri, May 16, 2025 at 4:01=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Fri, May 16, 2025 at 12:23:35PM +0200, Alejandro Enrique wrote:
> > > On Thu, May 15, 2025 at 5:02=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Wed, May 14, 2025 at 06:53:25PM +0200, Alejandro Enrique wrote:
> > > > > On Wed, May 14, 2025 at 5:49=E2=80=AFPM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > >
> > > > > > On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via=
 B4 Relay
> > > > > > wrote:
> > > > > > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > > >
> > > > > > > Add compatible for u-blox NEO-9M GPS module.
> > > > > > >
> > > > > > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | =
1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/gnss/u-blox,ne=
o-6m.yaml
> > > > > > b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > > > > > > index
> > > > > > 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8=
156a72170965929bb7e
> > > > > > 100644
> > > > > > > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.ya=
ml
> > > > > > > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.ya=
ml
> > > > > > > @@ -22,6 +22,7 @@ properties:
> > > > > > >        - u-blox,neo-6m
> > > > > > >        - u-blox,neo-8
> > > > > > >        - u-blox,neo-m8
> > > > > > > +      - u-blox,neo-m9
> > > > > >
> > > > > > No match data in the driver, why is a fallback not sufficient?
> > > > > >
> > > > >
> > > > > I added the match data in the driver in the PATCH 2/2 of this ser=
ies
> > > > > in the same fashion as previously supported modules.
> > > >
> > > > Did you? When I looked, there was just a compatible and no match da=
ta.
> > >
> > > You are right. I just added a compatible string, no match data. Sorry,
> > > I was not following.
> > > I just added the neo-m9 compatible the same way the neo-6m was previo=
usly
> > > added.
> > >
> > > What do you mean by using a fallback? Using one of the existent
> > > compatibles (none have match data) or adding a new fallback
> > > compatible, something like just "u-blox,neo"?
> >
> > Falling back to one of the existing ones, like neo-m8.
>=20
> That is perfectly possible. I added the new compatible string based
> on what was previously done for the neo-6m one.
> https://lore.kernel.org/lkml/20190401115616.21337-5-megous@megous.com/
>=20
> If that is not a good approach I think this series can be discarded alrea=
dy.

If you did use a fallback, you still need to modify the binding to
permit it, so there'd be a different v2 rather than throwing it away.

--1sJ959amROs/zspS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCsl/wAKCRB4tDGHoIJi
0nhvAP4mRo7x0fJA+I3lYEavYP/JBhtUg/TLe3db/kEtTqrw8AEA7OVlgKjS0Zid
urR1jOv2BUN9YCgHf5y9WSQJp4CNKgU=
=jT3w
-----END PGP SIGNATURE-----

--1sJ959amROs/zspS--
