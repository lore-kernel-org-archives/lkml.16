Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB900259493;
	Mon,  7 Apr 2025 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053418; cv=none; b=BkEQFFu0z3vgvCOu2eFX2bTZ7NAVd5ZxzO2Yo9kVoKHeYqgeZpaQ42+F+tKKvtz5cN02Yympf0SZWzqugkDYSPGOMOUVrrpA6luR+49lL6wvMYe+KMIqdBjGazXijs7VBUyVa+NlNCRJdRxkG4RRNtr93erkBT3/fORKiaD7uhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053418; c=relaxed/simple;
	bh=rv8X1gPdQ7lb4jaTlaQ6KlnCBc5UlfICmuEX229Y5i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDdJ38zgcDchXrBs0FS0OcCS3nCS3djKxXf7osxMoMay347ydyrqoUcG+NSSl1/CJd8+qW9SpxUaOJd8UUFzTLTnUgnMQKTqoiVx2AbFQsEnzNSalkFEw/0cKrxO13+cynwLuF3RbY09AR0TltYE/3nq/sz59nDcKcccs2dnXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adTSAr1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adTSAr1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62526C4CEEA;
	Mon,  7 Apr 2025 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744053417;
	bh=rv8X1gPdQ7lb4jaTlaQ6KlnCBc5UlfICmuEX229Y5i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adTSAr1K466nZFvUIStAzyFT5sqnHHF2F1HIbqU8H+gTCF07fBAVsoHSpnTPTwja9
	 Mm2yjaMXBZqB8msyHIDkxz4MHt9Vg2IaBoNP92RzBT/Rubg2j245YtRp2D1fh7Smcz
	 JZ4jYV9q9Iy1JSgDJDIbKJqFBA7+XWnjpEJ29lOGf/ij0PztqcEfCKxepqJnxL5JSN
	 LD7LjVFFRJnf7Lx0feDIzpRW/fq4UO0+8wa6KPwX32cWXr2lu/GEfYZG1f0An3siRu
	 CY76bJkhGr0+KtgksiCV5fpMvZ8M89o19NK+BDMjSACBwZY7aR5w1zA5SW5MKND6nj
	 HYChVs++xrMrA==
Date: Mon, 7 Apr 2025 20:16:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
Message-ID: <c1043fc8-40e3-4ff9-bade-bedfe7a19a18@sirena.org.uk>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6EcKy2r+XS9cdx6n"
Content-Disposition: inline
In-Reply-To: <20250407151842.143393-3-sbinding@opensource.cirrus.com>
X-Cookie: Meester, do you vant to buy a duck?


--6EcKy2r+XS9cdx6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2025 at 04:16:41PM +0100, Stefan Binding wrote:

> Firmware based registers may be different addresses across different
> device ids and revision ids. Create a structure to store and access
> these addresses.

This is fine but note that this is the use case that the regmap_field_
APIs were created for, that also helps deal with things if anyone is
clever and resizes fields or shifts within registers.  It's purely a
question of taste if you want to use that.

--6EcKy2r+XS9cdx6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0JKQACgkQJNaLcl1U
h9Bg0wf9Hxf/3VkQ1uTaaZWit74C665nE4apcyA7DDizkmAJQZYFyf0tLAO70XH4
zaeGQDSEeUY4ce4eQO3/dHKMHedj/phGZhyo/5lzMBDm1P6F6Bl999lawqaZe3uC
nlyYF9xilvY0EeIva0Qg6kAomiNvrJm5x6/8Q5h0UuqqIsxG+/x/8BeGIdzf9Ybn
wXz1Mvh8X/m7ac2BB8PyovDmWRBKCesUtyP1mvWaWGxSpqMxiP0SGemuobk0ibsd
hwMiwWKm3DKR5KTAzA7bXPWKzVHiIJ+Ul7iDniiaAHldoaEY6QYOuO/Gr/YFSfpx
EA4EbV0it8npooaZMs9Vv2yRW19xmw==
=i7+G
-----END PGP SIGNATURE-----

--6EcKy2r+XS9cdx6n--
