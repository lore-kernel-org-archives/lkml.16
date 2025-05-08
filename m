Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714201581E0;
	Thu,  8 May 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716290; cv=none; b=ZRpikn7eWbmOzdVHr2x3F3S9EsgyQQwfail8rvBJRz99VcZRFeXg4WqfI4ZaViy9XofVcxB+rQqF6BJFBRt3MlsfJr8AKZWwY2sQYwZtWYNNKKi5vqysKZ4xVUD1+4Au9BpS2fvqbSpXW0k/EF8sXpUJ44b3oevWbNfkkazTisc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716290; c=relaxed/simple;
	bh=2gQcav+TDe4DHa8UjsaDcHXzpSYYdWIU9InpqKfC1+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyMz+tVhoeV2N6bjufrWIlhUqUsOe2mnqBR0+pwta1WbgKXoVPoMwNyCDbrcouSFEaN9/87RfM9PfUqutKwUPZKcCSu2O7dKyXOeGS1QJRvBuL2nFka6d5/jy3m4MGvPwFjQxIzJyfsUxFJ7FPzC0YqhJ/C94W+l2rMsukg5ESA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owIkK/QB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owIkK/QB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1D4C4CEE7;
	Thu,  8 May 2025 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716289;
	bh=2gQcav+TDe4DHa8UjsaDcHXzpSYYdWIU9InpqKfC1+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owIkK/QBGYZgWx9bh+VKbw5vWsNUHRjIrO8u3i35g7gmYmXF1D8j/DBulSUnoI3tc
	 4i4hiUJY18XmcFnMjkF8yyxKrdZPyWOpn3IstzqFvzRGdIRAglwyFlds82Z1jE6jzG
	 MsAd96NjpBf8CcPnnYHxDDwXE5ykqVVx3qY4fB2J3VEuZpS5npaT2xrBewN1rgaI1L
	 27e1M8Lu4MlpOpPt13emMBSMlY00rKs5fQdgaDGjUBzl2ipkfR88vKa/jD0NSqDTSs
	 zyKkU7TyNG+yWg1JlgzVtMLTB6OopjffTk1XYV3CEqUA3KoJj0qqG9W+210G4Qsf83
	 q33I/jLA21V7Q==
Date: Thu, 8 May 2025 15:58:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-usb@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,usb8041: Add binding for TI
 USB8044 hub controller
Message-ID: <20250508-prewashed-jawline-37f53c0f9429@spud>
References: <20250507131143.2243079-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3e03400f-766d-4690-8f43-cbea2cac93d8@emailsignatures365.codetwo.com>
 <20250507131143.2243079-2-mike.looijmans@topic.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3CJWpGckFSe2JlaA"
Content-Disposition: inline
In-Reply-To: <20250507131143.2243079-2-mike.looijmans@topic.nl>


--3CJWpGckFSe2JlaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 03:11:43PM +0200, Mike Looijmans wrote:
> The TI USB8044 is similar to the USB8041.

Similar how? Why's a fallback not suitable?

>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>=20
>  Documentation/devicetree/bindings/usb/ti,usb8041.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Docu=
mentation/devicetree/bindings/usb/ti,usb8041.yaml
> index c2e29bd61e11..fd6b35a40a5b 100644
> --- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: TI USB8041 USB 3.0 hub controller
> +title: TI USB8041 and USB8044 USB 3.0 hub controllers
> =20
>  maintainers:
>    - Alexander Stein <alexander.stein@ew.tq-group.com>
> @@ -17,6 +17,8 @@ properties:
>      enum:
>        - usb451,8140
>        - usb451,8142
> +      - usb451,8440
> +      - usb451,8442
> =20
>    reg: true
> =20
> --=20
> 2.34.1
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
>=20
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>=20
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl
> W: www.topic.nl
>=20
> Please consider the environment before printing this e-mail

--3CJWpGckFSe2JlaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGfQAKCRB4tDGHoIJi
0ma7AQCYXSv4S/1olF9XH6ulUTdmcc5JJK/AU8jFkpD5MnJERgD9Ep63wcJybfZW
LOsqIAeJ2CY5b8szOkBSmSwHapFXdAw=
=qHIW
-----END PGP SIGNATURE-----

--3CJWpGckFSe2JlaA--
