Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B726A0E0;
	Wed, 28 May 2025 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439586; cv=none; b=R4CAcwUVZhwcltaY74KloXtOTZYHas3jitYKS/NG1r17IeyWyLSXmAYBnhG1CN7aacM65EotwoKvj+GM09gciNzriqmcTE/GtK65mS3lSEJWaco2BcWfVjjpvYBDFeBCk2xevUC6Xbs52YMpBSXgIxm3MAGu/HKBaql4AxunYKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439586; c=relaxed/simple;
	bh=ZDCkiWTSUutPpidL4yxIxvrpNX9oGUvaRD1iiumCPrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Slar2TcWOufQSKt+J+NvqNb2/msMeKlplVG6kPa6+iG2qpbx/RsVVkRsjJPIYZOaDxpB3ZiQy70BUa6ZcnmXEU4IwQeXvLqwS0y3rXIbxBmb5jAxdIrQxj4wwuHozza8rrRM+QHXTwM+a7rgiBMtwzIlmGThOwtByBF15mcKCNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhgsVX/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhgsVX/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C48C4CEE7;
	Wed, 28 May 2025 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439585;
	bh=ZDCkiWTSUutPpidL4yxIxvrpNX9oGUvaRD1iiumCPrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhgsVX/VgZv4mWKaIDhGq6Sy6mSnktVxPrbhwjX02DgsKX8s2yF6syckTB/0CYKZB
	 L3fwJ81DTGtaHSvdmzeXNEfxapzoddam2d1YuhPC1fkKX4tT5XoY3MbiShhzzhN2At
	 QT24NHe9A2T3A+ag5RRG4uef7m2cPbg83mMCJcq66IXft15D4+Rxe+M7hrogLlfTEo
	 o9LJ0fawVDictOX7WVHoIeHeIRGJqUj44RnxedcsPjjpcmqc4W5eIBsqM3LlCEe410
	 PGgUd1o9b/L3ELyMpPz8CtS1x54zijcL1yS+w/5+YqjVWX/Um0+mofy0ZwQ1ArElJ7
	 vscuhtbAGfH1g==
Date: Wed, 28 May 2025 14:39:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: convert mxs-lradc bindings to
 json-schema
Message-ID: <20250528-kitchen-snowy-e9a97843419f@spud>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hItL2TUlX6LkKJfG"
Content-Disposition: inline
In-Reply-To: <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>


--hItL2TUlX6LkKJfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:11:38PM +0200, Dario Binacchi wrote:
> Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
> binding documentation to json-schema.
>=20
> The clocks and #io-channel-cells properties have also been added; They
> are present in the respective SoC DTSI files but were missing from the
> old mxs-lradc.txt file.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--hItL2TUlX6LkKJfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcSGwAKCRB4tDGHoIJi
0soAAP9SfwHOSL1Ms8FpK7wxpbph1w25Kea+OlBcRLmP/UiQRAEAsqbLvfI5diEw
y90b4EL9sNqb/XkTmdiiZmLczzii1gU=
=5qe/
-----END PGP SIGNATURE-----

--hItL2TUlX6LkKJfG--
