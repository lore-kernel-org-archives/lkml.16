Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A728001E;
	Tue,  6 May 2025 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549028; cv=none; b=MZthvFwF8uQLY6j60tHoG0ljF7yhDnh5jVUU5iCgL4vNjc5zokhjjFNi4Y8DyqdvUBcl/TY8TO+WOhrNWtoREzxrt4QhS86t01Ss0Rpnm3Lt8Vo/F4dgWe+PJjkb7BPrhN8NT5qVY0crcEaXU7bAUVJ734+T0pFFkXe1GJe1OJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549028; c=relaxed/simple;
	bh=yk89LHTXO3jss8gNOPcfJRUOju19BFvggSyJM9Digqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDCJJieYeCdL1KYNeJ6mIpm9Dnu2si6sfLp8EbkPjfLEJFx+0jC4Lg2VXaMWVjH909GePP0eCc0N2FtODZYe5JdIMqyrBAWUclL4oMj9WASLN1GOKi0bOTG/+kBVz7+JkaHQGQlbXnc9Io35GphjxIGMkdeLVzDcOxnJwlDMArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3FdGlF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3FdGlF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0129C4CEE4;
	Tue,  6 May 2025 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549027;
	bh=yk89LHTXO3jss8gNOPcfJRUOju19BFvggSyJM9Digqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3FdGlF9r/zuuI40wyqxOzGvxDbf+SqGdyaiMBUoxowwEunFPrve3bRz6pb6552t/
	 8FjCXrOBQ74tQ+RoKpFLwzTUyrMAVFx6Bvw/iQMYUltrNV9dY4T8/MMvkp42Mk5rXF
	 ZxQuIWb1pxu7GYi4ObbFdg8EqUhg8c0rMLM1VzWR+WLqdwUaxfz+wnWhFXDVxvylgt
	 WyY0dVl8Th4ieB14eCz59E/yzC1DzZlE4Tag+Hob7lUG2AKCv3PSkIWJcaG7xUVGAf
	 OO7tUayKKhf4yr5NL8ZObm3CfyeOaZjVVYk3XoJJDhIWamkHUUohSiJYi9q3+WOkyq
	 suD7hzhxBnK6A==
Date: Tue, 6 May 2025 17:30:22 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
Message-ID: <20250506-safeguard-brisket-96da510a99d3@spud>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PZUhCmeqes3xNKnX"
Content-Disposition: inline
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>


--PZUhCmeqes3xNKnX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 12:43:21PM -0400, N=EDcolas F. R. A. Prado wrote:
> The register space described by DT node of compatible
> mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
> including registers for controlling bus protection on the MT8365 SoC,
> which is used by the power domain controller through a syscon.
>=20
> Add this compatible to the syscon binding.
>=20
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PZUhCmeqes3xNKnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo5HgAKCRB4tDGHoIJi
0o6IAQDuQXjMuejZZPZgecYQRVBoKrB/iTH2vnh1+sSpGOzoXwEA159pOsyZy5CJ
3GifqtsxDfIlIV5zxXmOb+gRCw9eOg0=
=ziAH
-----END PGP SIGNATURE-----

--PZUhCmeqes3xNKnX--
