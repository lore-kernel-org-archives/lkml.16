Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC487FBA1;
	Fri, 20 Jun 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429036; cv=none; b=br0LOQkKqog5LobzDliOOtKlu3cUP4nzxGi2oxDhh68jII2rrmg4eku8memjmgxZlPS4dqZeySUYkt+cPrWWmu/VBdWyMGNMWMhjHnP3ROJHMgC60+elRNRJfK4NnwFcHob42a+9pNdPjw01hhvWhMof6EEDuld5pNz+Kmht7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429036; c=relaxed/simple;
	bh=WXG/AivZAenzGBIGKaECDIg+iGpwiWQE1Xvg8g0ytx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4+qdMD5/PCiGIHbWjEA2miF4VXa5umr1pksk86yFoKiJrxDUk2c8ZnrqJefCDiuMT0jv85OlfmfjWpHtzMB1LaVA36wNosuwykP1sUgg1Dlafxi6tmUBpour+8Jt7QGf+iOx8usTd+hTOR/5UnP4pwQB/jWY05JFUJo/DO1Jro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBc35g6I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBc35g6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58825C4CEE3;
	Fri, 20 Jun 2025 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750429035;
	bh=WXG/AivZAenzGBIGKaECDIg+iGpwiWQE1Xvg8g0ytx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBc35g6I659KGOTPfykwRzlur/3XShBZTklwpr7pxPucow48iGbOlYnDOAe95hMT/
	 huU4Ovm/Lml3dHTwSjFs5JpQ9Y2XjEtyZuF3OxFIVi3bE2jEzZnq6GUmGKhVUZCYY8
	 W0bZDKtNep0j/a+iKZaoW2iBWBUxkb2jH0tuCx1ZoPlkI3TU1z8EwVIBNxcvngWEbI
	 BmAr+4A7REMFv0CrppUd61dATPzut/2e3bO2OCXfz/oauZaS9StolVHLSI6T45uJ8E
	 ERs2Y1GVo/uSXZKcYCdFM6Rzr6+kCk6l1sdA6GVZcBNUx25kiW1RZk9fjVX+a76zrs
	 pDnYrasLCgnYg==
Date: Fri, 20 Jun 2025 15:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A
 board
Message-ID: <20250620-bronco-stir-e1ecbea744b5@spud>
References: <20250619173007.3367034-1-wens@kernel.org>
 <20250619173007.3367034-2-wens@kernel.org>
 <20250620145422.26fdd14a@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2OXM8q8Pau5maNhk"
Content-Disposition: inline
In-Reply-To: <20250620145422.26fdd14a@donnerap.manchester.arm.com>


--2OXM8q8Pau5maNhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 02:54:22PM +0100, Andre Przywara wrote:
> On Fri, 20 Jun 2025 01:30:03 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>=20
> Hi Chen-Yu,
>=20
> thanks for sending those patches!
>=20
> > From: Chen-Yu Tsai <wens@csie.org>
> >=20
> > The OrangePi 4A is a typical Raspberry Pi model B sized development
> > board from Xunlong designed around an Allwinner T527 SoC.
> >=20
> > Add its compatible name to the list of valid ones.
> >=20
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2OXM8q8Pau5maNhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVtZwAKCRB4tDGHoIJi
0suKAQDd6jGsqSTRe+mxpECzaPvfrzFdj6AgjB6HGbdTMP0WbQD/YOGeSVE8pFbP
w/bDsvdNud0cRV2TPv76oa5kfAob8AA=
=9v/4
-----END PGP SIGNATURE-----

--2OXM8q8Pau5maNhk--
