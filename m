Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2728D1FAC4E;
	Mon,  9 Jun 2025 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487658; cv=none; b=pL+Lhh7EKM24glg14S3cTxvcDWifOfCx1GX59IllT3jhl8bnbEMl7q4kbL+nD5k8TRTs9EiBqzlgf0g37qPgRUD+QpriaETurUQZQ848jpV7wReQNP3lViD+lLNxusrBV5HmvbafjlCp4E6gWO6Pgr+yXcqzOilOBlzc2Crcrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487658; c=relaxed/simple;
	bh=brqI4qiR+wCevhDKcs0mL9H7XbhbuMjBnh+7fVUn6uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdcfUgKmbvbdO2aRJvu1u32Y4A5Y1kJga+exCNA/7/5G+qXpkn9kf25W+zzt6GiMn4h9g30c+auhMWyE3enI1mO/xQzqaURC6jPBZdY1C6eqagZd1nNHI6NlgGgwRsTh4hyqhox/DXaP3XjRl+UGwa+qIYExqEJxxP3AqQ+8Cu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv/n0ykS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv/n0ykS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E645C4CEEB;
	Mon,  9 Jun 2025 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487657;
	bh=brqI4qiR+wCevhDKcs0mL9H7XbhbuMjBnh+7fVUn6uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nv/n0ykS03/pqPoCmyO+3N5i7gvwUTEmgJZvxcapZnAOh9p59JHu6MhLZQ5rMOCEl
	 eJJxg9lxB+UcIGJARKSKwRHlH5eee8VcdQknhl8FWRfIqESEONLrn1FFyChT8E0ChV
	 vOCpzTqo63xmZLbaxb5OLZiR2Ot2cZoWkoHhmwYt6ebOKxc/vHdTv+6/s/27LRqEbc
	 dlg6oQVuD7fjPfoMlL20t7eW5DrBNhcYZqhd6Nd8T0ti0KF48fiigSp3zZmrJl7Eg5
	 odR0B0CW7bC+AVsQO2J3fuODvgsLs6MgWPcs9eCIAmpfdRh/3CEbrhBRHC1TZR0F5J
	 lYgfmQKCv36kA==
Date: Mon, 9 Jun 2025 17:47:32 +0100
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
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: arm: fsl: support Engicam MicroGEA
 GTW board
Message-ID: <20250609-monotone-banana-1cc75bff7c54@spud>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-9-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2zxs91jUhHVNHOte"
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-9-dario.binacchi@amarulasolutions.com>


--2zxs91jUhHVNHOte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 07, 2025 at 11:33:20AM +0200, Dario Binacchi wrote:
> Add devicetree bindings for Engicam MicroGEA GTW board based on the
> Engicam MicroGEA SoM (System-on-Module).
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2zxs91jUhHVNHOte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcQJAAKCRB4tDGHoIJi
0kpBAP4t5kRt+wc2Ra8ejv1eCzt6RfJm9Ag9nNhrphLVPGlGaQD/cmL+gvLgksHN
+PCSYXjw+CvALY+l2KvwLi5DW9tkGAc=
=gd4v
-----END PGP SIGNATURE-----

--2zxs91jUhHVNHOte--
