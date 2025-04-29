Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C721A45B;
	Tue, 29 Apr 2025 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940768; cv=none; b=gbXJ2021j0MpSw4c6V3v5iHuvCvoaYfZbr+PHTUVBs+PMEDrxgd1FM/tAfwOnskok6ScZTys1E4/DHRoneXf7nVHES+8LJGSKBhrGzDw85+PvPOPWTamK8FG0erpNFtXfdB2GWYvvkmBGCmyvoUcQlrTWZ8gs/EhTIcdF1UEC7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940768; c=relaxed/simple;
	bh=VuwPJwz0q4SPBmnl1SlwtXvsX7YGknQGSBDFr0NlQ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpsSOhaYK12ksHoiXJIQK3qNj6BH87MaGYr2uYAi4oZXh371pcogd38n61e2hH5my+0RTWeT2bQrw0oPDb+chR+wgGdYaO+xUTQ3X4YBpwwZwTImFSi5HGEp1QKW+InhTAI3G2h+Jlda7ehhNR+YsE68awk1mvJC4LKBFl4/jOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4+OLkUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4+OLkUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA0C4CEE3;
	Tue, 29 Apr 2025 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745940767;
	bh=VuwPJwz0q4SPBmnl1SlwtXvsX7YGknQGSBDFr0NlQ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4+OLkUc+rPfi76rhNWT7wemeGn6mjA9XRHVpW3luOJsQkqBKgCxYunErmJBWmxww
	 Pz/MhsezMImTfGOVhc5evW2ALZWvxE6IPJp3Lm7r69sGumFC0WNB8avgQpgCitQV8r
	 OoB+wrj05m6mpKRnO8iYJ2hmFU4PWuIvgpfNk+V2QTZ39fMuZBpFdQKN06kI2u/7vg
	 p7hqC750wH81dqACGzWykNCvyLJ8SBjT9YnVKc94Kk73DJzp8yZ6fEZC71ybcfDNLl
	 IAuahVlhrLxvZ43OnowmtDkhpLjzWlPWzcxzxWLhEUVfrxlVFCObgrH7xcjC0GlLhd
	 JjHosA8omdIdQ==
Date: Tue, 29 Apr 2025 16:32:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Message-ID: <20250429-emotion-nuttiness-f80793625d8b@spud>
References: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8uGVDpvfYDRZlllJ"
Content-Disposition: inline
In-Reply-To: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>


--8uGVDpvfYDRZlllJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 08:40:53AM +0200, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>=20
> TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
> reference design.
>=20
> [1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqm=
ls1012al
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8uGVDpvfYDRZlllJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBDxGgAKCRB4tDGHoIJi
0lzkAP0Ti8bUfhCzvVLj12I+uMNG0YNOjgZR0b4b51vWJnOIgAEA346k4xWf38+2
vnU+ktHiSxURtSkmVR4YgndSEakaeQk=
=PQNx
-----END PGP SIGNATURE-----

--8uGVDpvfYDRZlllJ--
