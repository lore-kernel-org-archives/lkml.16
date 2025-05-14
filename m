Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F133083A14;
	Wed, 14 May 2025 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208423; cv=none; b=HoFHkW81RJK4fExAex3LcfblZTKj0vc2Sr4Vwl3U7O0LZ3yovtUBPRYwLbhdbSOl7oNSCgOcZZxjq4Zz2vVIN0ue04dUhmfqVimp8S6/SgE0q+4sTBc1gfoqDB03ZP/o5YGe0NJcACVKDOOgM3vmlC/Z9MpE4zkWgrdSTe1qHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208423; c=relaxed/simple;
	bh=ERMC4dPxGycIcEE9rGB97eewpbETVPgrMfssjzsXSBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOD0ZwknmP6PDTTSVc47R0SToY3XY5QQeummqYqZA6V+wf1IwWICjo5VahP0vE5cNXqTwrgpiq1OYl8KuALbnPpKD7A0LpU/BpamAF0SODaSh//ose1fdJ6prkvb8YXbjPGhDW/qFAM77sqlLUJ1UOXt73iudCExqes8d1nypdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdW5wKPM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdW5wKPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1529FC4CEE9;
	Wed, 14 May 2025 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747208422;
	bh=ERMC4dPxGycIcEE9rGB97eewpbETVPgrMfssjzsXSBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdW5wKPMDwfaZlMR7yNjlGih2W1I17nAndjygm6mB3Y6BoNGXKD/zLz101VfkD5RP
	 ac6AvdsquerJMYu7Q/QbHINx+jKZ7BDhJkc79F6tn7sQg73bL3Wf0Lx4NbQTZb44W/
	 lGyoDHBsDvTkzRrthI5aNP9c+UGPRCBd2rQxLclf75Skgbv0ysetfsAKGsLjT20YGB
	 L8nITFFKMQCTBauENOPTylevkanEi0BPPx5dyzV7KFYDpaqRd/OZMa5uGJaWhuYsK8
	 AowAoclQ7M1TYsqwlOmJLrqHJKU2q8OYuuUTzCADMFQ+DvIAtkHTtHeJtAnkfx/lSV
	 J91fVxPo1vbpA==
Date: Wed, 14 May 2025 09:40:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
Subject: Re: [RESEND v7 0/2] ASoC: codecs: add support for ES8389
Message-ID: <aCRI388TLMziFO7s@finisterre.sirena.org.uk>
References: <20250514033327.32641-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="afRPr92TOyUFcfFa"
Content-Disposition: inline
In-Reply-To: <20250514033327.32641-1-zhangyi@everest-semi.com>
X-Cookie: Well begun is half done.


--afRPr92TOyUFcfFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 11:33:25AM +0800, Zhang Yi wrote:
> The driver is for codec ES8389 of everest-semi.

This doesn't apply:

Applying: ASoC: codecs: add support for ES8389
error: sha1 information is lacking or useless (sound/soc/codecs/Kconfig).
error: could not build fake ancestor
Patch failed at 0001 ASoC: codecs: add support for ES8389
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
broonie@finisterre:~/git/apply$ git am --abort

--afRPr92TOyUFcfFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkSNwACgkQJNaLcl1U
h9AF6wf/e6cYb+JR4UZTxoZfmK8eaIEOgNLPJbfuN86rCPjotaWe8ZlT5ydCxbKH
xZ8xO1xvGS/8H/GBins3F2fLDYF5f8B7ilsZxoOuS//FFNYmLYFzDpRlxLD43LEo
CmagHU4m+c7pZIOrhTpHAowTzwmjjsjdxMyQNZpcwlC16XERy8ycWZWNSUwXv9cH
t2amHjE+w7WrB/kDAIXVad1EcPY5gmgzmkwrQKAAukLPd5g5sDT74kO2tpp9JIRf
1prJ8/SvcNYOhzsmdLL7kTMJrti8fyPAbqfFJUx5n/743oSZKaWyvQViDE2uo6oq
5YH4lz5czmxGxgifZzhgElukQY0uzQ==
=2JOi
-----END PGP SIGNATURE-----

--afRPr92TOyUFcfFa--
