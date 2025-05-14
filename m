Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9A1E04BD;
	Wed, 14 May 2025 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213939; cv=none; b=tstAbT6uV/W7sycMSj2yHnAH9PfhveFn7pV6XWgi8vYb1Cv3m+1rv0UJh2/CvBSQKtJtUgTAOywge2tX7Vg/V5Z7y0G+2SHzXMk9mxAQC7vhk8/R5GTKolI01srwOJ9vUiH4zLt6rH2AErXmR3yRPLlUgdMWbAlzT+daebB9rJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213939; c=relaxed/simple;
	bh=hU2OlZFgidacH6mqtYbQqCg+lm4nvVeVYSGqJE5uNSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+yCFbbFMFFSbIF89GEBkAwPd9qmaMzLIgUzuob249qitY90ACQdbrUtiTnXKOcV5OD/sFe+vOgM1nGlyuQkEZhDCk7/HgsbqMzUcHuFT6mcIpmFDVTKaT3yB+4P6wBAt+u2xT9fAOLsZlfrwYBqORG2eoyvBfsLDHZpTXZFhSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtqkZjSl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtqkZjSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B2AC4CEEB;
	Wed, 14 May 2025 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747213939;
	bh=hU2OlZFgidacH6mqtYbQqCg+lm4nvVeVYSGqJE5uNSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtqkZjSlnrz/6Sl0DZD8iGpy2ooUOZrc+aYsOM4cD4fwuLHLOAehLL5uSNAN4VCrA
	 4iNcPMX67bYdH3Ih9hVIbi9VJo+2Ujd30f8m8D0VP82q2tkwfXoNDChXHrEk3wgWPr
	 TRLaqjZsIdQeHc77MmAY1pu4uExjccOUleZJ2ByVHEQwwn8r5pnUbklsRI1zgD86Xs
	 VQi76r/xX2wnTKt/jYOD4QNYixDwhOIluHqVT8YGeXy+8a/GLJ/jS0hfjUSpuVwqOd
	 k5MSomCZyWPif0s9/ybVZD45nHgm4anMUq/N5NJstN1ebmuYNasCIJDbejrnvciUEX
	 Gkbfckhqo11UQ==
Date: Wed, 14 May 2025 11:12:14 +0200
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
Subject: Re: [RESEND v7 0/2] ASoC: codecs: add support for ES8389
Message-ID: <aCRebl_L2db3ZJsj@finisterre.sirena.org.uk>
References: <20250514090257.34585-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="waxfeb911tkDjUUl"
Content-Disposition: inline
In-Reply-To: <20250514090257.34585-1-zhangyi@everest-semi.com>
X-Cookie: Well begun is half done.


--waxfeb911tkDjUUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 05:02:57PM +0800, Zhang Yi wrote:

> > Applying: ASoC: codecs: add support for ES8389
> > error: sha1 information is lacking or useless (sound/soc/codecs/Kconfig).
> > error: could not build fake ancestor
> > Patch failed at 0001 ASoC: codecs: add support for ES8389

> I'm confused as to why this happened.
> I made the patch based on the following branch
> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/?h=next-20250513

That's not my tree, that's linux-next.  MAINTAINERS shows:

SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
M:      Liam Girdwood <lgirdwood@gmail.com>
M:      Mark Brown <broonie@kernel.org>
L:      linux-sound@vger.kernel.org
S:      Supported
W:      http://alsa-project.org/main/index.php/ASoC
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

and note that above git is saying it's not got a useful SHA1 in your
patch so either there's a formatting issue or it's not quite -next (the
repo I apply to has -next so would see -next commits).  For things
targetting 6.16 you want for-6.16.

--waxfeb911tkDjUUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkXm0ACgkQJNaLcl1U
h9BMMAf6A6b2CHOuIDWn53GFuWNZsPvP4hNSexS8K/i2/GjQTRwc4fAkxzdhMOgY
qAuYJqxMqTh4OUzDn+Z7RILcoZfHvUYi4rrEJ8EaZqabT1el6a1uPMaKbY/tn40h
z46NRr/gbOv3yg98BjGYjvhgOuGW1nIdU5ZFk2rPqU67+6OpJmcuFGVRlHo0q3JE
Ujj6k8HNQMtPuqPkU7HC6aGseXCd73TNilYiKB85gln/rbznhksFmOp9YgYfFxL3
DDvMTZhgbvT0wsfhFw8aidC+F0uNWHiEGp+Jy/W54b2nlVqqjuPfSeWaZP0qxU/7
Ks4A5PSvkYXCXDcUqad5eCRxLnFXtg==
=nIwU
-----END PGP SIGNATURE-----

--waxfeb911tkDjUUl--
