Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC9E571;
	Tue, 15 Apr 2025 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733428; cv=none; b=Mka9YIT3q9zsjsvBhhCUp/jk4DIht77kpyodm7+tliEY+cpY+5X17X7o278P/zD4YCEUZf6NV7dlYKacO8ZxNZlOOWa+UM3uFrKzj/FoT0zctRu2lIaoduKW05JWdd/25s7PlxNCf1WZQWRSxWVDjXeY2WddIemmM3rZjheFniw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733428; c=relaxed/simple;
	bh=DWScL87oSbaROaqP0r2Mnx0JFl+WWSfAwu3JhjgVITA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N42pknBUaJmHQXj+++hcMk8mdgygLMlLzjWxgaWidOSvD9E1+Rp1pTngjA8XWV+eRFFVA2ptb5jQaahJ09mvCgGI/vJlWUYoJkbjW7Jv9vhOqp5HjOxf8i4C8IlZkgbfJtIqeZ2tG5rLzRI2n6Lrvrs7Iv5AO5BZbh2hxulKQWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDUO2OfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDUO2OfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D85C4CEEB;
	Tue, 15 Apr 2025 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744733427;
	bh=DWScL87oSbaROaqP0r2Mnx0JFl+WWSfAwu3JhjgVITA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDUO2OfM54X8t0zCgKesLTSab/rlpOm5RNER8WzgLP9wT3bmd7lizZoZjt8q7DJEe
	 r4nQKELgqWHziQ3JNKZYRE40PRLn3QfoOu/J47BzAeE24q5p0iSfIqgs6lVCanFUAY
	 nM87l4GZ7BSsTX2mTjrgtx6sTIpA8epdI+xTbTwgMCeRxNq+8qftDFe5tXRb5wb7ee
	 B2Uz484E9EkKSgFaC/wHHAvim77A86BPrJAr5wnzAhHlLkK3q8RQrv2i7Bzgr97+ox
	 6QSvqkPoUiAOexmcWlO5lwjgjooXM1h7aeMXhHqtAiyKR8nWuV5ZYnyBNNUl1eGTPC
	 3j4CCyoi95b/g==
Date: Tue, 15 Apr 2025 17:10:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for
 TQMa93xxCA/LA SOM
Message-ID: <20250415-vacancy-magnesium-9a56984c4bdc@spud>
References: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HWWKzsLMAyfTe0PA"
Content-Disposition: inline
In-Reply-To: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>


--HWWKzsLMAyfTe0PA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 02:59:44PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>=20
> Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
> parallel display evaluation.
>=20
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HWWKzsLMAyfTe0PA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/6E7gAKCRB4tDGHoIJi
0i83AQC96FoHk045P5XAidRz9D8+rNym2nWrxLT/TR+37l91gwD9E+cqusUmLC0k
SnMu8z0jL3L+no+u1iPagJkqfW17Fgo=
=7xr2
-----END PGP SIGNATURE-----

--HWWKzsLMAyfTe0PA--
