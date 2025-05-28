Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12A28641B;
	Wed, 28 May 2025 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439436; cv=none; b=eeDRetGCGdCJ0Is4DijWiHY55lUWt3+NXmxeqVa0mXFiFWHiK63GHf37PSYsFndzv/W5zrJqeAXl+pM2jnU+pb4SO0KDlyxZFQDBP3cswzkOT+JZLjaDZtXG17dzree5koebMEP4WnG8CNYR01jdN6pbDBAd/9ZyQpkVQD922hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439436; c=relaxed/simple;
	bh=nWFmuHlsVICUVjcmX3HASFKYD2geEtzh77n0smErV5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHDCDYfMMS+8SK5L4aRZ4g2GU+LP5HP3Gan8YgdeubbcvXUqhzFuYyZGgIie0/xooUpcYVqB9ram7PFtK1nLa2WCC2Y3xmNkzHHMJdH3K+MehW08ZqtDlOtDypYw82awCaIwN4qHJkJNstFDmJKn/mD1akRwNoXt8yFS+OgLuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfhkTfGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfhkTfGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09365C4CEE7;
	Wed, 28 May 2025 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439436;
	bh=nWFmuHlsVICUVjcmX3HASFKYD2geEtzh77n0smErV5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfhkTfGAGj8CW86+wX4vgwR36+FSjwtbRaQmfW3e/KE7u96dkxxYjsZNCilBYOLfP
	 YxSs5o4KgUFCX4SBmkCEQtIEkEtcRSj0cj5o0J435qnnBBw8Hf9XBYcGJsWeg6JiKb
	 B+B5+BBMF7k8103mzMvcN243sqa4xsdxrzl9eEuIkG/HdhMkkRvuw3yzuaSN2o1JyM
	 /Y5YWldpSOSdi71Hu54Hmt8IBJODH7mllMjHWBUGLijUQSCDDR1KLZ5A+D2yv5f8h2
	 3GVoVUkwNsN5Zsb/CiaYqsHqQKDV6STUlRQpbpCHdJ94zQQuYCeq4pf2N43uT+MB3I
	 TzPK2g5xiTHzQ==
Date: Wed, 28 May 2025 14:37:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: fsl: add i.MX28 Amarula rmm
 board
Message-ID: <20250528-viewless-consumer-ec85e353582f@spud>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4EGpcGhWdCTivEIc"
Content-Disposition: inline
In-Reply-To: <20250528121306.1464830-4-dario.binacchi@amarulasolutions.com>


--4EGpcGhWdCTivEIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:11:40PM +0200, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 128 Mbytes DRAM DDR2
>  - CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--4EGpcGhWdCTivEIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcRhQAKCRB4tDGHoIJi
0l8SAP0XQPahB24PbgqJBY1MivzfYl77mDTy4+oOIaLKmuQlzgD/QExr6pC/YZMk
vcDtr9EgoxGgshea76kDK5vhCJKg5Q8=
=AHuM
-----END PGP SIGNATURE-----

--4EGpcGhWdCTivEIc--
