Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B5B67F;
	Mon,  9 Jun 2025 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487612; cv=none; b=sjP0cG7KKV32roxkUpqY5p8jd3cpEo12X2CLuKR9NjN7u2EM60nAfrLgrWFhM0C/M7qBV0IKcKZbXpiak1WyONbU6VSDdZCyjvvqoT6h4Znts6t8VHNW3+bOwqh/DioXEIVOZC5Gh0oHCSUbtB0hApaQNPGIJVsEH4OyxdChLyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487612; c=relaxed/simple;
	bh=TK6tGbJcUMuZu75QjQxKe05bUU/syp0jxs7xDI9V27g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LExSXIpEiZHGd+aR/tgegmAsWpl+qwwnByfKRjEtgj0H6wFuEuZc6gF7ybeOTJCOxwy9Hr/IicAjiejQ2wfTPZEGfZye3qxxRr3sIlHqjimXtT3y8Wyjd83Ea7ztVCyHuvV8tQ+6vz57bSvWMmtLpg1wnA+0ojRRWK1pnq/chAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1LbqluM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1LbqluM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E2CC4CEEB;
	Mon,  9 Jun 2025 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487611;
	bh=TK6tGbJcUMuZu75QjQxKe05bUU/syp0jxs7xDI9V27g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1LbqluMiEaiO2h6exrz79zNV8Pch3vDTrZ3DvnLKqavS25HpeHkFZuKPoCH5tMI8
	 rPU1KasRwZk6DL4s6TpA4ZYR0w0RgxM/qzQ70wh6SuUXNRCd8JN/9iSYkkkI6jMKXq
	 H/qLY/24Bg9vypzDOZlTd5JC7AvoG7nBlC0A2KAYtSlCavoMWtPxHh1nHXo4/Mk9rJ
	 4FlQM3vEtFSPJ8vr/z8E5vLt09o7u4oy/SThJ7bwhAPTAWFyG2j5CCEDQ2KS7muHat
	 fPcnKa+xXdUA4wSERV/guP6RhDuQiogKRISgdbnVGiZGPF2NWi3NmSnX0g7MA+yki3
	 pWGd6lQubSPnQ==
Date: Mon, 9 Jun 2025 17:46:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: arm: fsl: support Engicam MicroGEA
 BMM board
Message-ID: <20250609-lustrous-transform-63168641988e@spud>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Egw77kuvcxTAEcOm"
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-2-dario.binacchi@amarulasolutions.com>


--Egw77kuvcxTAEcOm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 07, 2025 at 11:33:13AM +0200, Dario Binacchi wrote:
> Add devicetree bindings for Engicam MicroGEA BMM board based on the
> Engicam MicroGEA SoM (System-on-Module).
>=20
> The use of an enum for a single element is justified by the future
> addition of other boards based on the same SoM.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Egw77kuvcxTAEcOm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcP9QAKCRB4tDGHoIJi
0tgDAP97XyYMeqfOZjZ2d+V+75gF4yNRVxGLkFEvL9XvQZ2lVwD/S6RVXm5m88NK
xL1WUA1nFP0eWC6zMNsW8O3iP7KX9Ac=
=3koq
-----END PGP SIGNATURE-----

--Egw77kuvcxTAEcOm--
