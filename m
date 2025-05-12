Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3993246762;
	Mon, 12 May 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065754; cv=none; b=W30GkXZMcnpgKE93lAyAzFhQIx2VKJGVqbmQWQMwNgTK0n0avkXdQ3lqA5yg8t8a3QhPMD7HeC+XW7t4sSBJAsLR9QKcJsmBITZ+NNRfCLwDOiI3TDQWR8Ru/xPwKWiolRymLliqCoqu+pqnnn5vF9A7EcK4v4dK8RMJOTbNkiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065754; c=relaxed/simple;
	bh=TCE6Uw7LiVPLM8NbyISS0pYOwHNQf36YyFcNYjE50+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANhLX0vxBu7b4xq9YgfVAUlnPMU4pYZgyAyj2qyAkVTDl/jnZvE+ut6OAOwNlTsq1JKGfKfHhxpz76WKaoSD1YcHTl2HcJpKrPJPe6xp8eE7G8c7CuFyae93+EDt/o7H7uDb3U4X5dg6hvPpOfTLmT9GCF7AgT6x8mmdW0ZKym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2fAoPc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2fAoPc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78F8C4CEE7;
	Mon, 12 May 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747065754;
	bh=TCE6Uw7LiVPLM8NbyISS0pYOwHNQf36YyFcNYjE50+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2fAoPc3oOidpqW2oxA1Nde74ERkCSXCK24/ljWYm+Eo+1nRNRqalv9bNLoxASorO
	 hfGrJOfu78egh50rDYD5YArzBmCDAzs8O0R5lSnJKfUidw2OHNrRVrhbTHWcKgCooY
	 V1pwpvywTIJuEEPraQRqeXLTcc89FpM8trEfhReW4pJUUwNA23cx7ASD3wF4DoTzAc
	 Xr7fHguA5SL6YyPl9vRpEunmR9KGkIdhpdWEIUyzmFpiNxLBpM5WCHSQ3wNQzc8v8Y
	 TPU3SRRPw7+F3XsTT/ebKZ0yvaDYxwcCs/ArxU6IAHcXpea3+9ZlNe6dtB0B5A4JxS
	 X8oJGBnWh75qQ==
Date: Mon, 12 May 2025 17:02:29 +0100
From: Conor Dooley <conor@kernel.org>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings:
 arm: aspeed: add Meta Clemente board
Message-ID: <20250512-activism-dispute-e2549ab2b210@spud>
References: <20250512113026.264785-1-LeoWang>
 <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EEzvPtStEzaz9LSn"
Content-Disposition: inline
In-Reply-To: <6821dbfb.170a0220.3b15e.aba8@mx.google.com>


--EEzvPtStEzaz9LSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 07:30:26PM +0800, leo.jt.wang@gmail.com wrote:
> From: Leo Wang <leo.jt.wang@fii-foxconn.com>
>=20
> Document the new compatibles used on Meta Clemente.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please fix your subject lines for future submissions.
[dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings: arm: aspee=
d: add Meta Clemente board
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
None of this looks like standard output from git.
Take a look at what other patches and the kernel docs do.

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index a3736f134130..4416a40dcd86 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -81,6 +81,7 @@ properties:
>                - asus,x4tf-bmc
>                - facebook,bletchley-bmc
>                - facebook,catalina-bmc
> +              - facebook,clemente-bmc
>                - facebook,cloudripper-bmc
>                - facebook,elbert-bmc
>                - facebook,fuji-bmc
> --=20
> 2.43.0
>=20

--EEzvPtStEzaz9LSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIblQAKCRB4tDGHoIJi
0naYAP0YicZzkSoOLCHibdodAKfacK/bNJ38DYRNkT10N/l7XwD7B0kGA/gb7PRD
fZiB0rMbZNOPNyKk+FZszA5zj5HCpw4=
=t6md
-----END PGP SIGNATURE-----

--EEzvPtStEzaz9LSn--
