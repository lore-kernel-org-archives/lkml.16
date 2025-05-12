Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CA264614;
	Mon, 12 May 2025 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041930; cv=none; b=NT6or0rda4EWSO1ee5j6+430u/P31TmV01nJyfOkJz/6muak/K80J1cGtik6KUfc7PAgauzkhTxJO5rjg+YjWyPnO9okNwAm1bAqN76DPs69w0LzAuzOjQVDTJF268sTLH3Vbgh7sTGCA/ZttoJIvuQGiLh81lPJEezh16+MUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041930; c=relaxed/simple;
	bh=VeGFxthv7PYqrI06vu6pYTa8wWVH2rxaKIjcbEO/qxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RA4g+O0Kl70BiIncPFdzvW4iNWyAWdphLeD8MCjlrp81ySPmzlHKkueSy0bnVAHVeudmQY3quLls8ErEAbIX4bJPOTCm8Ai0QiTmVSnY8LXNXFy54IEyxBqqjK19ZU8yWB6b5CMZ+Z/JCXAUCHgTzIQScddOnmi06qty8ZkazM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLUm+jqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLUm+jqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A94C4CEE7;
	Mon, 12 May 2025 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747041929;
	bh=VeGFxthv7PYqrI06vu6pYTa8wWVH2rxaKIjcbEO/qxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLUm+jqxbtWq86ypa0XoBzPu4HEk5uslYonS1yB/ZBGc+js+JwiFqlmb4H+LWXXAW
	 b90v9LD9PruGgAdjKSB4vs3Vg5Ntz3OcylUUrEbuG8WFS8NVkHQ1XXKoJuS9UXozDK
	 GBUccOqaE4m+qiffJUQuXtgPcR+MZtETgEmu4IUNRu5SnbliuA4SQZx+g9OLw0U3s6
	 g3TMXzvPfN5/IMHGQjRbSGeAlHt4hgkeCp+rkt3fEOMtj6FLjDp+33it5OEg2o/caW
	 FSzjSWBml7EQZfovpHIGSCTROUn5w84u3qLmoLYO154FgVGjWxioH+0yXvACj+z9uY
	 o2NrfaT6csJZA==
Date: Mon, 12 May 2025 10:25:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: John Clark <inindev@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: vendor-prefixes: Add luckfox
 prefix
Message-ID: <20250512-unshaken-educated-12738a347257@spud>
References: <20250509122637.26674-1-inindev@gmail.com>
 <20250509122637.26674-2-inindev@gmail.com>
 <e3339dfd-7d79-4d86-b522-d6b31976cd2e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GU6PMH/TcwUywzE1"
Content-Disposition: inline
In-Reply-To: <e3339dfd-7d79-4d86-b522-d6b31976cd2e@cherry.de>


--GU6PMH/TcwUywzE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:12:24AM +0200, Quentin Schulz wrote:
> Hi John,
>=20
> On 5/9/25 2:26 PM, John Clark wrote:
> > Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
> > produces development boards like the Luckfox Omni3576.
> >=20
> > Signed-off-by: John Clark <inindev@gmail.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 86f6a19b28ae..9391e0c31bb8 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -892,6 +892,8 @@ patternProperties:
> >       description: Liebherr-Werk Nenzing GmbH
> >     "^lxa,.*":
> >       description: Linux Automation GmbH
> > +  "^luckfox,.*":
> > +    description: Shenzhen Luckfox Technology Co., Ltd.
>=20
> Looking at the file, I think we order the vendor prefixes alphanumericall=
y?
>=20
> So this would be the wrong location for this new vendor prefix and should
> rather be between lsi and lunzn?

Oh, I missed that. Yeah, alphanumeric ordering please.

--GU6PMH/TcwUywzE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCG+gAAKCRB4tDGHoIJi
0tsqAP4ixoSNyieeRkbazndj3nNkW+K7Q1diS68t1I/8BNuNcQD/SXduhZflon2y
JiZDzqW/LhScPYo34ESbXVbqz9G1AwY=
=cMJa
-----END PGP SIGNATURE-----

--GU6PMH/TcwUywzE1--
