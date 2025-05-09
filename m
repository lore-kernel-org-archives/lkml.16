Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227E17C208;
	Fri,  9 May 2025 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805463; cv=none; b=SLjhXN97laaR8BlbVHJD3WzjBDZ1KZYi9mFyTPJEH2yo5/RdlH1z1K/v++5AbvV8T92EDqk6PQ210w8GOkkOWcfeb/bvlincd819RPw8APbOdJfvXHmnguvU4fEbnjCt4KgN7Li97hKVoiFg/RjbaQcZMkdl5GvEdsKsg+D9YV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805463; c=relaxed/simple;
	bh=IMXhmQQ2lWO0KiQ0KnSj8yQCSD7P7FRsgDDD17Jfbs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtzqEhBj60d1d2dQVoW3py2YPIyUwqipFLx1L7JCvChDJXAOj2FprNrmMAMS1oOqN9h8ToMQVYx3pc/BYeAeIhTYPt8TWTJKX8OZRt9ctgcM9/Ma4rcVBC1N1AVJ73kDWj6p0vD8pie/l4hRxSIXd+q02+9jMQMrWkLHn8Qshg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPxU1U5h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPxU1U5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2098C4CEE4;
	Fri,  9 May 2025 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805462;
	bh=IMXhmQQ2lWO0KiQ0KnSj8yQCSD7P7FRsgDDD17Jfbs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPxU1U5hYKZ9lQxrZY4kxYVxUmRXrbi6StJM5Se5n7emSq6H4CCwSp1PvU+8lZBWu
	 HbfNfwQ8AcE3ZokS+TWPkwMsUIKc0x+56XDheqWT0qF8298RYe9A4q38mFWZ7Lk9ve
	 akBoJ0shcCVTV726rUnUs8VixrBSHZGpKtaQOca6w8+ck2exdtHEdpuuchiPDZfLAB
	 88C9cULAhL//1QOWsfNefOfDOT35BpoGmWBlTgM2FjHO4U4idlU9jfnih4UrpUoNO2
	 gI4DJN+4mUatc8d66IbD2/dmYNB7RaWDOD594gGKIlFi6yew1MO1+P+CFHYKfF2XYQ
	 UwDcwZiYYwNuQ==
Date: Fri, 9 May 2025 16:44:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Hu <richard.hu@technexion.com>, sascha.hauer@pengutronix.de,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	ray.chang@technexion.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS
 SoM on WB-EDM-G carrier board
Message-ID: <20250509-dripping-colonial-aa805906a189@spud>
References: <20250509071242.12098-1-richard.hu@technexion.com>
 <8173a798-b5d7-485c-8ce3-b46f4a097d83@kernel.org>
 <83401d0a-ca96-4cfd-9016-13a8604beb9c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OD4wdRO1911HDruQ"
Content-Disposition: inline
In-Reply-To: <83401d0a-ca96-4cfd-9016-13a8604beb9c@kernel.org>


--OD4wdRO1911HDruQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 03:58:32PM +0200, Krzysztof Kozlowski wrote:
> On 09/05/2025 15:21, Krzysztof Kozlowski wrote:
> >=20
> > No, that's not a spi controller.
> >=20
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devi=
cetree-basics.html#generic-names-recommendation
> >=20
> >=20
> >> +		compatible =3D "rohm,dh2228fv";
> >=20
> > I doubt that. Drop the node or fix the compatible.
>=20
> ... especially that dh2228fv does not exist. There is no such device
> from ROHM. If you claim otherwise, please share this imaginary device
> datasheet.

To be clear, the thing to do if you have some device without a kernel
driver and want to use spidev for it, is to add a binding for the
device and add the device specific compatible to spidev.c.
If it is a simple device with no unusual properties (maybe it has an
interrupt, that's fine) add it to trivial-devices.yaml instead of
writing a dedicated binding.

--OD4wdRO1911HDruQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4i0gAKCRB4tDGHoIJi
0rTIAQCvC0a5Fu0qeL8RJpXo9801tjpYBm1ES+9QEWTFRWEB4AEAuwO8YdFqpXuB
siGWDtLPid4o2efFJvy1i/+/LuJXeAA=
=VP1b
-----END PGP SIGNATURE-----

--OD4wdRO1911HDruQ--
