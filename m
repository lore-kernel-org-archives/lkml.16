Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF91DE3CA;
	Wed, 14 May 2025 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237745; cv=none; b=Bi9g2fyG1thpRUk6xVoLItdBTuONTitD+/xNUzyUAQfZH7jF0aedpj4HTifiHE28A8yUkWB5CvuI7aaQK7CJIgXzc8aKZl3dMClBgB/CcecPrfogMsmP3eI84C2ZgBVPdCDlqs/B1z4tsIWvvxUPXZnbvqU2H6geG52U22bWtKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237745; c=relaxed/simple;
	bh=SKmt1mAVtkHxv4u0VHCdD95wFq6S1wRh+vDolEBNZFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JELLfNp+zXbymVFML7y/0vTJXypaEptJd8V/Dv7ELi2o9RIeVy0POoTgbucYi834cWS5J4YqgpTlGqlgqPoLGA8Hj4gq55BeIz9vDsCxKztGT5XlpdUVF5EiXJChLeaTdnihgAlw5D11vR5QoNmbwqMRe1xwwc36V9gcDBixdKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNrZ6LtO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNrZ6LtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C868AC4CEE3;
	Wed, 14 May 2025 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237745;
	bh=SKmt1mAVtkHxv4u0VHCdD95wFq6S1wRh+vDolEBNZFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNrZ6LtO/ScYKrzGDvkWK25EBLAAhKDoAwebupsEAcWapNw4gzvoUyWGhjnu5ydG3
	 zhdiP3wgGdtzdZf3Oonrm+VUqmBniaJJ/IFGN+LiLm3Jl155CIwWGFFTpaT4ao5dux
	 BhUFFVYrmWqchN3SIhZXvLiiN4FEhtZszJSfKquL9aCe5xvzpblcshl6FGgwyI1uwJ
	 zjnDIqZon0btZOIBrqTR1gFV0hlaD0XjzDTeduY5947WezxbwzEjjUXcAJHMa7y++7
	 y1ePKoiHqKbNDNhEY3ozrVkx2K5lKWNzXIUzmJYXT1X/MP+I77kpbW5ZlzHFVw2gl5
	 bb1du5UUdPvPQ==
Date: Wed, 14 May 2025 16:49:01 +0100
From: Conor Dooley <conor@kernel.org>
To: alejandroe1@geotab.com
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <20250514-saggy-shifter-e4ac7152f823@spud>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="goZOyUDMUt08Zz71"
Content-Disposition: inline
In-Reply-To: <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>


--goZOyUDMUt08Zz71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 Relay wr=
ote:
> From: Alejandro Enrique <alejandroe1@geotab.com>
>=20
> Add compatible for u-blox NEO-9M GPS module.
>=20
> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> ---
>  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/=
Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8156a=
72170965929bb7e 100644
> --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> @@ -22,6 +22,7 @@ properties:
>        - u-blox,neo-6m
>        - u-blox,neo-8
>        - u-blox,neo-m8
> +      - u-blox,neo-m9

No match data in the driver, why is a fallback not sufficient?

> =20
>    reg:
>      description: >
>=20
> --=20
> 2.34.1
>=20
>=20

--goZOyUDMUt08Zz71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS7bQAKCRB4tDGHoIJi
0p1zAPY30m1WH+2JdjY1OGSDatx8EC3zsr3vbXw3fb61z0k0AP9GqvaLCQEJ31jd
uS2k7jiaVxz+CxWXRxmbq2ubfK4UAQ==
=H2EF
-----END PGP SIGNATURE-----

--goZOyUDMUt08Zz71--
