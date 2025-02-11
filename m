Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F01C5D40;
	Tue, 11 Feb 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292276; cv=none; b=K+EO9qtPySRevDF8imKtapcOG6oFFIHJuschu4PqxC960TAaGY8XicvVLqtOKsWAtYgcf8TpfYgawJxEnFnusf70W0aQrsqLDEz+IbNEHVLh4tRZUVjn8gUVsZn3PhbVvbm3Z11mAfJQ8Tzd9FSvaQNGS2LWJlWCfuD5AB3rCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292276; c=relaxed/simple;
	bh=MWC2sqCzdtOxyOSZrayDgn1fSQvC8+RdPBb7kzpW+JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=id0rSwWbnEJVVsRiila9bgNFjlzwVMf9fMIjTDHW0fohSGXOTSjCIUTuxQv8xFqJA5O+X0RSISLTAsUEYiR+4FLVhQVmnQ10PBnA0mBTJKSE5oYTKS7e1wtNEjtEJo94ML2rZPL9IPKNiCYvwHrS7c1HPea3CacEjyoCaqA4hRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIXwq7p9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIXwq7p9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B85C4CEDD;
	Tue, 11 Feb 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739292275;
	bh=MWC2sqCzdtOxyOSZrayDgn1fSQvC8+RdPBb7kzpW+JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIXwq7p9I+WhQd0YnPUQ1PT1vUHYsXPL0yr/c2Cq2nfpAO3XoGY6T8O6LxSlCdwXQ
	 cUudJ6weSiJth705z8Vr5zdpOMzOoMX65hc/0LdoylvOZW1wnOu7KJFJCd7oThu7GR
	 /aQD4/OuLADLp+NXLIGDA667sY7mndanXg5A+DlsP5RB7WDG95wtG7r7yM7YHCc/k2
	 c1Yz4uE9uC9np9v4IEtN4ohF+vnUm2v4CY/ymFOvuixIJTOi2kENOuKFyZUrezE1Kv
	 KUjA7e6HoumHUIAq/S+Ompb0TNRu1aBWyac8IDWjH9anIbxRJKx5YkFseQcrGjFnok
	 clXBWHPmuRd5g==
Date: Tue, 11 Feb 2025 16:44:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, festevam@gmail.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH next 2/3] dt-bindings: usb: microchip,usb2514: add
 support for USB2512/USB2513
Message-ID: <20250211-endorphin-harmony-f8d7c8ac9953@spud>
References: <20250211105839.3328105-1-catalin.popescu@leica-geosystems.com>
 <20250211105839.3328105-2-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="55pKOAfZbqfGyc/T"
Content-Disposition: inline
In-Reply-To: <20250211105839.3328105-2-catalin.popescu@leica-geosystems.com>


--55pKOAfZbqfGyc/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:58:38AM +0100, Catalin Popescu wrote:
> Extend support to Microchip hubs USB2512 & USB2513 which are identical
> to USB2514 but offer less downstream ports (i.e. respectively 2 and 3
> ports).
>=20
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---
>  .../bindings/usb/microchip,usb2514.yaml         | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml=
 b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> index 743f7a22f13d..d159cde04c84 100644
> --- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> +++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> @@ -14,11 +14,18 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - usb424,2412
> -      - usb424,2417
> -      - usb424,2514
> -      - usb424,2517
> +    oneOf:
> +      - items:

This items isn't doing anything, as it only has one entry (the enum).

> +          - enum:
> +              - usb424,2412
> +              - usb424,2417
> +              - usb424,2514
> +              - usb424,2517
> +      - items:
> +          - enum:
> +              - usb424,2512
> +              - usb424,2513
> +          - const: usb424,2514
> =20
>    reg: true
> =20
> --=20
> 2.34.1
>=20

--55pKOAfZbqfGyc/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t+bgAKCRB4tDGHoIJi
0rIAAP9SdgwVVZTK+9CSJsn/PWCjaAHa5skZ1+j9nPTmH5R/6AD9HIadPJKgY9HB
p154AOsgXp8OW2nxak/WVM4i/VQHaQE=
=ERMl
-----END PGP SIGNATURE-----

--55pKOAfZbqfGyc/T--
