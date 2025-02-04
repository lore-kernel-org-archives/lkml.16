Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A312054F9;
	Tue,  4 Feb 2025 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698063; cv=none; b=AMbrHl7HwLkqbtdrP5XwiBh8KuM7U86L63ZcClCeAM8IO12K8AUYxZ7vR7pdm1cwFX0YeVT8y6GpkmJWGXVoFUXOQp1FQl9cGvudem1oSczuKDHppUwnYlXMgFrEG2RGGMSa4Z3IXYDc0JmKt7q9OB2knjDVES2srJ1i2HUarI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698063; c=relaxed/simple;
	bh=JsbdS+VSX2zerX1EGa50DMfTtA6lRcOiTssSk+CZwtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcWziXUTaJBQAW8j7Hj8yf6S4/o5ibDaENeiEKtpUddcd6TKR8l582eiFippVQY3IntxJclgpsiBTMnCagnAvV03CMwD2acWAXpH/AdlaNbBXW7WdB08ZDOWACbEQSTcbQ9JTqn13gSJCgs6n4H5aYOz7YlPN6rMFMwt5loj+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLk5XcgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLk5XcgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D36C4CEDF;
	Tue,  4 Feb 2025 19:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738698062;
	bh=JsbdS+VSX2zerX1EGa50DMfTtA6lRcOiTssSk+CZwtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLk5XcgTS8zIYGhlOdpqvLx4nMj4veKaBYppmoKrbHGYIAvuUyOZOriXpu6u7jcp6
	 Qq0HI9kRBtRc4Wazlq2oZzCd4xUmbqdToz1Xt3YhI9/ldRRKuAhGCKMuNAbrnAZi+J
	 ydyRWaUDz+WW0sejDhltNYpgyEdzMl1RMhXuM4Nh4auUW8iviBusUT5afIZP/8PVpT
	 pmrYnrSkIeQOWaiSGooPp4abObgc3ENmBLEwEqhWMiBPhdRZxrBfUWIQrcbNvSF57W
	 23hj1qMA3ZA4tEQWPHURkDUc1Hn2g3eeVP9wi2GmmEU75igeGeDqEfNHPHGuL82EHv
	 xZlyudll+yfUg==
Date: Tue, 4 Feb 2025 19:40:58 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are
 defined
Message-ID: <20250204-craftsman-sandbag-9fa200d77398@spud>
References: <20250203213036.9816-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KnjCQsogAgVBMdmo"
Content-Disposition: inline
In-Reply-To: <20250203213036.9816-1-robh@kernel.org>


--KnjCQsogAgVBMdmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:30:35PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add the missing 'ranges'
> property, and fix this constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Doc=
umentation/devicetree/bindings/mtd/mtd-physmap.yaml
> index 18f6733408b4..1b375dee83b0 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> @@ -122,6 +122,8 @@ properties:
>    '#size-cells':
>      const: 1
> =20
> +  ranges: true
> +
>    big-endian: true
>    little-endian: true
> =20
> @@ -143,8 +145,7 @@ then:
>    required:
>      - syscon
> =20
> -# FIXME: A parent bus may define timing properties
> -additionalProperties: true
> +unevaluatedProperties: false

I dunno what that comment has to do with anything? If a parent bus
defined properties, wouldn't they be in the parent bus?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--KnjCQsogAgVBMdmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JtSgAKCRB4tDGHoIJi
0u+EAPwLj8afRS9DROXhuBoSq8kHCpjNNFQq0nFa1KEOjQdxXwEAl20Xpr5iCHJo
iVXHQHmfO7DLyTkbo9WTdRnmtgORsQY=
=9cHz
-----END PGP SIGNATURE-----

--KnjCQsogAgVBMdmo--
