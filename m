Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018825D55B;
	Tue, 11 Feb 2025 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292343; cv=none; b=go9Hmw86zO+EgfhmGpppW6S4QpneUdRh/VYytPp0y/n1DNhs+/r54Meuw6/EpGff+sun9zGampl76h7SmiBaemrEeZjqQfrU6BB7AHWguysKcScVYZ+DL3vbec1QA+rjK9i4NLrypuSbIx0nn9HbC3zr2IQo+pFrrzlOPW2vm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292343; c=relaxed/simple;
	bh=k0W3jG2Wwaoli89U/w1YDC1rG47h91jxtzee0WnBEOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JridyQF4uYnR3ItqzNAR1mDkpHxBcw8Fm20MFgxGPIv5KWaDcQQrbb29enyczc542+Gk2uCKYFhjKOjcvUlNo6cF+l9bYWXzTE/dqNOMrZgsFzg1ZZ+EZ3OzfjXyBkKR1nPBBYYGFA6W5QMFFC7M4DcD3VluuAPE/GL2nX4bUGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/F2DKIB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/F2DKIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B629C4CEDD;
	Tue, 11 Feb 2025 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739292342;
	bh=k0W3jG2Wwaoli89U/w1YDC1rG47h91jxtzee0WnBEOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/F2DKIBRHT8IcGPzZ5xWm2GH94+3/17kMPyfBqfQSom1ZuZQ7ZRuV5/m52nL1w7R
	 7sTPkpQDw+9RB6qbCJNpyDNjC2IbFf4jQ5Gxlay0/BqcxmS5P8mfSXnWoWzvT86kRb
	 gV1Cr2yzf2aKnIy6vUh6LaBJuNLRuHOZuQH6jjp82hDR8pH9chqiltlqpJ6ZkpMPxO
	 Ud3mYQ9mvQ/nblbGOUJZNy+WI7BQ/vbhIgdSlGRvE/NR2T71jizyWYpGlNa1dj7o1k
	 edh/l3Q3MRjwBeazCIVHk+ARsV26PiM7LYoqZGvANW+PlR6bwYDjRUi41GXwo8S6Ga
	 ZmsdqEfwX+aKw==
Date: Tue, 11 Feb 2025 16:45:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, festevam@gmail.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH next 1/3] dt-bindings: usb: microchip,usb2514: add
 support for vdda
Message-ID: <20250211-walnut-march-2e24b2f10045@spud>
References: <20250211105839.3328105-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XAPwhO+arktM53PA"
Content-Disposition: inline
In-Reply-To: <20250211105839.3328105-1-catalin.popescu@leica-geosystems.com>


--XAPwhO+arktM53PA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:58:37AM +0100, Catalin Popescu wrote:
> Microchip hub USB2514 has one 3V3 digital power supply and one 3V3
> analog power supply. Add support for analog power supply vdda.
>=20
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---
>  .../bindings/usb/microchip,usb2514.yaml           | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml=
 b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> index b14e6f37b298..743f7a22f13d 100644
> --- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> +++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> @@ -28,6 +28,9 @@ properties:
>    vdd-supply:
>      description: 3.3V power supply.
> =20
> +  vdda-supply:
> +    description: 3.3V analog power supply.
> +
>    clocks:
>      description: External 24MHz clock connected to the CLKIN pin.
>      maxItems: 1
> @@ -36,6 +39,18 @@ required:
>    - compatible
>    - reg
> =20
> +if:

This should be merged with the existing allOf, which should be moved
down to after the patternProperties section.

Cheers,
Conor.

> +  properties:
> +    compatible:
> +      contains:
> +        const: usb424,2514
> +then:
> +  properties:
> +    vdda-supply: true
> +else:
> +  properties:
> +    vdda-supply: false
> +
>  patternProperties:
>    "^.*@[0-9a-f]{1,2}$":
>      description: The hard wired USB devices
>=20
> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --=20
> 2.34.1
>=20

--XAPwhO+arktM53PA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t+sgAKCRB4tDGHoIJi
0jMWAP0Y6AsOlEvIryGkyO7NuxNAWFOOTsKUQ6ug5sLzWdM89AD/QuBmYwXES4ot
9dNaWpU697aCxPujYjRHOsbq/TfB/Ag=
=lHnO
-----END PGP SIGNATURE-----

--XAPwhO+arktM53PA--
