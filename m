Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA465D8F0;
	Fri, 23 May 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995450; cv=none; b=RjHwVvgv/VfkWGlgxo81IEh7DWSmblq7s1A/zbgzV6Cdu5zuLeFlBqsrI0DxKMb0ywDgJ+IwJ1ojukUCwNAUctVeBTMWU3BzHsYrE9IoSXAa1LhsCG4j8puP1X3irWUQpYuxaaHlyaWDG2dnZjVmWQHalLmDFN9keE1UyO6KiVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995450; c=relaxed/simple;
	bh=ztALaUqi+Ute0FanMr5lOM16SonCrRr0jnP1n/lAZFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENNUgknUBlFVsoGOagDTcjgXYZbiAEqfs09W7lWOfxfkj8LdpzZCUfuJiOzYmBcXDN10XDHIk84A5iCLxH0CFx5qoj2QRY9NCmOV+1ReeQrzNhSJi7nM8gtXJWew7p7I3Ss0ym70v0DXnUPM1asL9D/R+YILBeAu+U9wCEFkgk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hx1TUst9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hx1TUst9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7571DC4CEE9;
	Fri, 23 May 2025 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747995450;
	bh=ztALaUqi+Ute0FanMr5lOM16SonCrRr0jnP1n/lAZFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hx1TUst9pMuepA4btg4R2JoimdsmvmjFGdwU4xJPzesLO4bDR/yzqm4yAZyUpfy94
	 lpdeqTho2F6dTShdrSmRLpt+g56viZu6HxX4IvjvqeD32djb9h41A2GntLYhMxqCxn
	 TBj3UEbHdZNyE2PgBSVsqrB49L5boWH4HH8Z2KTs0m+ob3HbsPPeHfvVoN2rTZl4r2
	 7/w31CGiQjNnNGl0855gqSoKwIv8+nkfTfsKdBl/Yb/owRJl24ucgF4R1TG7rm7nkH
	 gV/VP8IZ9zjPT5SDNeuZXOEyshwVNrUo5znvkkeoahZ20GgwdziU/LxOAtzQluhkox
	 3DC2AU9vCMmPw==
Date: Fri, 23 May 2025 11:17:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-ID: <aDBLNV6JBdtFOgh9@finisterre.sirena.org.uk>
References: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SOIDFvsjrlPJIDST"
Content-Disposition: inline
In-Reply-To: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
X-Cookie: Well begun is half done.


--SOIDFvsjrlPJIDST
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 22, 2025 at 09:23:22PM +0200, Martijn de Gouw wrote:
> The PCA9450 has support for forced PWM mode on the buck controllers.
> Add support to control this mode.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--SOIDFvsjrlPJIDST
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgwSzQACgkQJNaLcl1U
h9CBeQgAgaLXlRxxWDfDTkWqXSEGlrOgh+l7SPyjmDynLHphWOUxBITxhxkCSfU2
wt31djnCFZdqzB15QthXSa7nnw0B9JVO2PDjHg+GCG9uqJ/qcUUDa50zZ9RwgXkz
JZNaDj0V0yCqs5ythWlT25Apz9e/hClm29AMv6iBpPhLD3MDkfnco+zFGDI3KGE6
aac255fiKtau6KWEGtJyI9yVN/g+0VL6hi16HFue+rhPVD1Iv02Dab1908LkMy1D
mWd9Kbe0DZNiJFTGQguuGVBm2JhztRfvRu8QKkgSr1SFiWT3L91eOc1iX4eG2DkP
IGR5lMifJWkKr5nflllLItxmSE6UNw==
=9C2f
-----END PGP SIGNATURE-----

--SOIDFvsjrlPJIDST--
