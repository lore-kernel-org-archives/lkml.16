Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045BB1A725A;
	Wed, 11 Jun 2025 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658876; cv=none; b=K6YfSpDXF+K5YV3q0HIwiNpQ8tUsVjTTIaDvE8hgq0tudMYZO8ahIunxH59u/gkJpvNsqYiCsE9tRNvZo4tdljRLkcVdIXG51PuOvGvZFk4z277aIMWErqtOqH1IuP7YthWACx8Yh1wEDn52m+9Jd6xxCCLN9p5vA8qPjTETmhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658876; c=relaxed/simple;
	bh=/L2dGUpW09AvMNpTRzGqIRxdazsuqBgLkgcIZOJe1Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wse5HPG5jPV7eSCuGcswn4d2lKVvdBpyVh3lyJmZHpxR2WJ6BvP4FrxYhgVO1hCRqs3RZV79bTDFEg8HB6JVYJyGqi/c3h87toXx/B7ZTdNw0PLBwIZ1oRQ/Pbr05IXdXuHIkfIkWeim7mEgdxljSUhReiK8nWbfXHmIVxh0JUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/PnBta6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/PnBta6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966A5C4CEE3;
	Wed, 11 Jun 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658874;
	bh=/L2dGUpW09AvMNpTRzGqIRxdazsuqBgLkgcIZOJe1Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/PnBta6Iy+ClZux3wRoK4yrCk9t4MPLyyuTpRp0Y7qcVus/mxM+svP3md8SSnjL2
	 UCUr+Yl1neMOpEOYjBzjPUM+w2ZEFqfEamafnyotP3BEwv7F21nMnigZV3N1lwf7AW
	 5uahA+KLvgZRw2OfVrjzHyoMQ6Q/OezymhXceo/wopr4TPMNj4nrj/RN7jvKYlQhOR
	 dpAbJPIo0qgyMpmtA5o4DsbFFZGyQyyF+bTf1WsTwZaThKXLv5Tp2wpPGuJr8SKWeJ
	 wucpMB5FOLCy5qEGH/mQ6IIAApOzyB9f1euBcw58K9DeTl1bIVr+FGmw1VIqfCdIP7
	 f/VhO2cbEF5pA==
Date: Wed, 11 Jun 2025 17:21:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit
 DMA addresses
Message-ID: <e9baeb61-9cb1-4b58-b957-fe753e629f12@sirena.org.uk>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9PAPZhOpllzoEdZ4"
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-8-wenst@chromium.org>
X-Cookie: Metermaids eat their young.


--9PAPZhOpllzoEdZ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:25:01PM +0800, Chen-Yu Tsai wrote:
> The AFE DMA hardware supports up to 34 bits for DMA addresses. This is
> missing from the driver and prevents reserved memory regions from
> working properly when the allocated region is above the 4GB line.
>=20
> Fill in the related register offsets for each DAI, and also set the
> DMA mask. Also fill in the LSB end register offsets for completeness.

This doesn't apply against current code, please check and resend.

--9PAPZhOpllzoEdZ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJrPMACgkQJNaLcl1U
h9BXaAf8Cp0/Qk9S9BCu/1WQ9b7h9uIwroAKxXnge/cWjZAaw3lpUGDxTZlGp4uf
yIxD1RWhQNL2YeHVH+6Wq9x142AZ5jCCme/GswQGThwVPxau9mVVCV1nJzSMbnlf
kUfAQcRN9S4a1FpsRqcfHXIwww8LT7Kog75DmLv9weUHy5biFlThiQkqcaR5nOm7
9cbzIK8FzYHgpgP5E2nEpSbP2z/czOjR0SVGql2pwalRa0lGYoZ9/3a38cipDbc5
bCEIXr9b48FLg4ZKOPO2qRb/pXvOQ0abFlye4lOjd5OhRkFXtZEEX7u6IZSej66s
Tmv8ID9+Oy7Ej3ybPmH24gNdTcpCuA==
=W2oV
-----END PGP SIGNATURE-----

--9PAPZhOpllzoEdZ4--
