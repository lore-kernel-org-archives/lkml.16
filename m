Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2A28000A;
	Mon, 19 May 2025 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672685; cv=none; b=NgFEG9y9vRmK6DeU0R02obsALBxEAO0xk52ppln1+XCcYCMYUr3BSlOyOXU9asBJx5jH+lihe45/pvlNN36j2PZpjdUTTBy/E6AIzcDKff3BO2+A08/30ya4R93FcdXOyBIeGWSxhiWYGY6dbkGj47J0z0AFPVERJKy8rlIChbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672685; c=relaxed/simple;
	bh=4nscKGafJjANsyfv4e8j2buaBvPf8d5uXFvC22t7z7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia3bWRekv9V7ozbqx77EWR2vg/X74xHtdtuxzpxC1OaSGYZqP+thOMAWPRGfnNCPTX9KitNAgBij2Av+1CQzjWf8dS5oKBPDuEuPBikt0U7eo49o5rkzhTcOmnxDV/Xq0NNy6q7HnElJE1W5RUqEdt9+z2KSeLEiEbXpY7Ha5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewHyLRWf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewHyLRWf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9668DC4CEE4;
	Mon, 19 May 2025 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747672685;
	bh=4nscKGafJjANsyfv4e8j2buaBvPf8d5uXFvC22t7z7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewHyLRWfb9BdfGZEbZVvq5W7sx3mvcjbOn93KoXnO1hplgglb65695VmlenIipn5r
	 m1AJ/k2cJj6TNTxtguVEbLUQnmxi1zEAYhfCbw0wPfs/elWCE8TcI4HUt8fu9Mg4ff
	 IGI1I20g2SAnxxAEYv2O0MKlmbSRIhNFztif/dzDVhpc7zXM2XoSk1ZyWPRdYpQdyD
	 rENaZeO893bEqE/nqlxEsK7+QngNx/WM0QRVPgPQyRTMqN97GHK7FBTge6CAQgisaP
	 +1BXhpnyAlPBbCSnnN/GiQXC2oWGqIDdAYnb20vipEjO1Mpu5ULvjmbM62AZA0NU4I
	 fBXXPqO1hbeSg==
Date: Mon, 19 May 2025 17:38:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Sukrut Heroorkar <hsukrut3@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/devicetree: Fixing a typo in
 usuage-model.rst
Message-ID: <20250519-suitably-hunger-a61c9d405379@spud>
References: <20250517144020.870706-1-hsukrut3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rk2XH4z6NOvxoS6j"
Content-Disposition: inline
In-Reply-To: <20250517144020.870706-1-hsukrut3@gmail.com>


--rk2XH4z6NOvxoS6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 04:40:20PM +0200, Sukrut Heroorkar wrote:
> Fixes a minor spelling issue by correcting "busses" to the correct plural=
 form "buses".

I think those are maybe valid us-english spellings of the word, and your
subject has a typo.

>=20
> Signed-off-by: Sukurt Heroorkar <hsukrut3@gmail.com>
> ---
>  Documentation/devicetree/usage-model.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/dev=
icetree/usage-model.rst
> index 0717426856b2..6f9a2c0a380a 100644
> --- a/Documentation/devicetree/usage-model.rst
> +++ b/Documentation/devicetree/usage-model.rst
> @@ -27,7 +27,7 @@ links from one node to another outside of the natural t=
ree structure.
> =20
>  Conceptually, a common set of usage conventions, called 'bindings',
>  is defined for how data should appear in the tree to describe typical
> -hardware characteristics including data busses, interrupt lines, GPIO
> +hardware characteristics including data buses, interrupt lines, GPIO
>  connections, and peripheral devices.
> =20
>  As much as possible, hardware is described using existing bindings to
> @@ -36,7 +36,7 @@ names are simply text strings, it is easy to extend exi=
sting bindings
>  or create new ones by defining new nodes and properties.  Be wary,
>  however, of creating a new binding without first doing some homework
>  about what already exists.  There are currently two different,
> -incompatible, bindings for i2c busses that came about because the new
> +incompatible, bindings for i2c buses that came about because the new
>  binding was created without first investigating how i2c devices were
>  already being enumerated in existing systems.
> =20
> --=20
> 2.43.0
>=20

--rk2XH4z6NOvxoS6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCteaQAKCRB4tDGHoIJi
0v4ZAPoCqM+MKPy//A+tJjZdkA7q2nY4CyzSlZvUy+CcYiFZ9gD6AwwVD6JCd8La
ZfogcFmQep7zoWKA08X9jV4pCIZfiQY=
=nOHn
-----END PGP SIGNATURE-----

--rk2XH4z6NOvxoS6j--
