Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E84CA32;
	Mon, 26 May 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273207; cv=none; b=o9ZFIdmG3wbPond+C1iF2yvpe41Wcv/RLA/q+grUWmPOaj79U559KinJr8virtaTBf+/3GcyuctlAk7iFCeRNCTeKjGyI1YajNLmtpuEPLxlKgWHduRs/e/M8IZHfUcvpD2K5MTg51VtEUMm3TNea8p7V8F9vhwYVyQKlWof088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273207; c=relaxed/simple;
	bh=nsp/2HkOhD1k7gQWCbEYjx8EfuOvRgrKZ0WPvzuYLDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkcajXE5sXC+3Ns2XDwjTwgKY4Ma7tcR7Zj6YIDLusp0eHHh0gBMg6J8IWav8LURXmJJo6Lnu4DYZrQv2NT++X3rD9rRMnrmCRSeVq3g6bff/ZuwNxD1BG3vSrTjkM2qMoZX7IpzYGncahRoXLDLmYd77OKf4gmSkdjRm9j4NwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYfWPrzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYfWPrzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD3C4CEE7;
	Mon, 26 May 2025 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748273206;
	bh=nsp/2HkOhD1k7gQWCbEYjx8EfuOvRgrKZ0WPvzuYLDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYfWPrzAEVq2xlMExqWyM3762HiaUr83TQBQg81yAEJLxq5Y86EUZbp988F7R3PQ0
	 5eRwJWVAjhL8B9bY1rYS9RFpcCcay3JuXD7kfPb8HPMAloMKouQBVY6RssoGTiet6d
	 pHEW/ImgJTHBiyMr5c43GSQ7go26yT+emTVkFSYoIzUuVrqw3Ug+XeSTqzTVD2WVNq
	 4/iKQqMu5uV9lJWYYJ3kdn+h9QnboMlaXsvHl+EDMHXrSHzgdjKGTBBG5Y6oTHTuNK
	 qcSK2eQGFnsHbrkQ4xxo4R8qu+dT2ZlZdxuUjRtFODQ4O3XEPYFgYkJ0yrSW/VMrhK
	 MDRZin0taL5Pw==
Date: Mon, 26 May 2025 16:26:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: alexandre.torgue@foss.st.com, amelie.delaunay@foss.st.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	Marek Vasut <marex@denx.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>, David Jander <david@protonic.nl>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt-bindings: arm: stm32: add STM32MP157F-DK2
 board compatible
Message-ID: <20250526-stir-deluxe-2fc29f181bb8@spud>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tE7S4uh9hlKJ30MO"
Content-Disposition: inline
In-Reply-To: <20250524100319.22521-3-himanshu.bhavani@siliconsignals.io>


--tE7S4uh9hlKJ30MO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 03:33:14PM +0530, Himanshu Bhavani wrote:
> Add the "st,stm32mp157f-dk2" compatible string to the STM32 SoC
> bindings. The MP157F is functionally similar to the MP157C.
>=20
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tE7S4uh9hlKJ30MO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSIMQAKCRB4tDGHoIJi
0hJeAQCHD74bR48utkhB7BQ3xyfSTl6/ulsrIxAPzd5sJjeKIgEAk9+YdBSEx6Bb
OvoijXGcEuzW5XduZqSczl3UDYGgpgo=
=VjKO
-----END PGP SIGNATURE-----

--tE7S4uh9hlKJ30MO--
