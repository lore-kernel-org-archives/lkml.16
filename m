Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F1770838;
	Wed, 14 May 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212860; cv=none; b=tlV+kpIVI7lVaK2GtmJOih7vpYqCs7gyT3PnNpAlHE8qW8JKiO6SEj054inVhB+aRxgoAXCZeevdFjv/fJW+npxq/uJC+D1SxKmovCv/TNIiRaN9h/8EzxV5MKxOydD8eSKTc5GGn73Y8Jbo9O2hfqIPedpHfBrdezQIbNPkwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212860; c=relaxed/simple;
	bh=VQBOK2idp1nxsNCCEs74fOX/cJ4nuhcieBGWeFG1D/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOTYaBHGKnqJGhgXXTHU4iDu/qEmAoz+n+jZwSsaxIiPHjiUXiGpMueQM9v9mo7bLPB5BfnhXu1DuTwRkGXIojANgHDRx8OqTY4EjbssCFl++wq0/AzqGPzYFyCsttLY+ctGNElyPtKcuzmhXp+BGXCIay+4RVdzIzTf+5v+w9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Du1CDjSy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Du1CDjSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E610C4CEE9;
	Wed, 14 May 2025 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212859;
	bh=VQBOK2idp1nxsNCCEs74fOX/cJ4nuhcieBGWeFG1D/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Du1CDjSyWSoA/EGDHyC2KaC7ioh46+/frf7hBPrUuxcmVMtDLpQh2YGmf6Htgda82
	 D/1VYuweFU0f5lW1SJN0O3pk/xfVGwWGQcCoCbwPd5Nq/WNgHhAasRRtgnbpwQoyyP
	 gARh7W+PfZYovJQVDG6V1+YPmdz7UCYBLTWrZTXgNyrBqj4ULhM5PlTPqTsSuAm4lN
	 4ay46Z+yRtFYfSxTUU4wYvhuW5/2wdkQDW30QzT08o/3qT7TmoL+n9Wc62BsGIXlm4
	 C6q7kiAQ4hevMYDsCsWzCGu9VHmwvgGB1MtT+OPFrCXz10lrREuDR+h7XdxoKYqdb+
	 oKPjomluptx/w==
Date: Wed, 14 May 2025 10:54:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Message-ID: <aCRaN27p32c9gxDN@finisterre.sirena.org.uk>
References: <20250425082551.1467042-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RJEVfGPvKI8lIx/3"
Content-Disposition: inline
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
X-Cookie: Well begun is half done.


--RJEVfGPvKI8lIx/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 25, 2025 at 04:25:47PM +0800, Chen-Yu Tsai wrote:

> This series is meant as an example on how to use macros and range cases
> to shorten the MediaTek audio frontend drivers. The drivers have large
> tables describing the registers and register fields for every supported
> audio DMA interface. (Some are actually skipped!) There's a lot of
> duplication which can be eliminated using macros. This should serve as
> a reference for the MT8196 AFE driver that I had commented on.

AngeloGioacchino?

--RJEVfGPvKI8lIx/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWjYACgkQJNaLcl1U
h9D/1Af/XElCtNyti+25emI4YNKEfk2R9v0BZ0vK0d5J9W/iLMsLIU37Tr+WcgFA
oxm/P+uo3MjQwbQUj7c8d5XOXFtpMoUR+QlEIGuR43vkTM+e02n9CqGaY9m408WM
LHUx6i1REXPRha8FgKbFvcWsDqdSnATl04GWrGOKTXNH8QhZbLL884SCxYwZGaty
HLrBvsUYhiFN/LHz4RUCCuvm42rp4lA7/5EQ07+QEy3tHqmRYSxyegKkkQ++v3Og
EslpX2I7nIyz2X0+U0Y9rSJfYBWQR2APwqSq/AKqzlp6YkbTv9MTO6KUhCr4k4ah
F7qUWkQs6HfYygh4haJYsdX0s9WacA==
=PgTh
-----END PGP SIGNATURE-----

--RJEVfGPvKI8lIx/3--
