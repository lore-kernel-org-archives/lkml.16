Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0691624E9;
	Wed, 14 May 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233375; cv=none; b=jEzS84kSU/KjxcMlCG7zS403lAEcZrMsZdmfGzdrMrvYHKoqjfy7POsSlM8xa1BEq8mDpR0JxnoZaDvjW9q9nS+RgPo2YkrG/N9jYiyp2Ecd7AeJAtXGA8TOl0seqMXR2WEnC18yvPVF0oRJ8kfk0bQ4Cdo7ZlBVZFqirIHDqPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233375; c=relaxed/simple;
	bh=t/uPvQl5SO699WAK2gwjv1DwR8/P78GRzFmmIsaqUe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLAl8N32KcwrLtGhBZBCx6/tuPRH3zlN/adMxUHnzbFoY3uMOsj3qBJjJl4VA1/Vc4h5CgbX4Sbr+IvMtaQmOPNQIaDeKbf/CdzMf5rnd7iaXeQpeb+Zvlu6268oFfp383bOKUIQAZaLbM8fpIR7GpzAgd1qWJv2m0VrtkyVXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3X/1foP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3X/1foP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F61C4CEE3;
	Wed, 14 May 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747233374;
	bh=t/uPvQl5SO699WAK2gwjv1DwR8/P78GRzFmmIsaqUe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3X/1foPhOD3r0WP8EG2by5OEvVZPzSSU98aXZEVBHolHg3vFHyolHi5hlbNTTpaF
	 Fn9JNJ54/o9EXEBNnNCnmvwh9pywmXLIq/29nG2diKO4LnJm4Z72uCaRTgfAhuL3Q0
	 AW8nl2GmuVEjP5cdYLGEU8szMrJC6ME3D1yILxckEzaSCREa4D6ThTtMy67wjoDnhT
	 tyM+aTqaD7nIYGSwkRq3PKFug2sIvXLbKA/j1kERCJAfs3Zfx02bJyfAv6U+5hPVT7
	 lZkOiD6gzcG1GgyWef04ti5LQPoClpb+bDtAfV6ghuvE2+m/PpS/UwDpRpIjyn42j+
	 NqQNJ8AVq28PQ==
Date: Wed, 14 May 2025 16:36:09 +0200
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Message-ID: <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
References: <20250425082551.1467042-1-wenst@chromium.org>
 <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4b3JjsI8btsM/C/"
Content-Disposition: inline
In-Reply-To: <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
X-Cookie: Well begun is half done.


--G4b3JjsI8btsM/C/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 03:49:48PM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/04/25 10:25, Chen-Yu Tsai ha scritto:

> > This series is meant as an example on how to use macros and range cases
> > to shorten the MediaTek audio frontend drivers. The drivers have large
> > tables describing the registers and register fields for every supported
> > audio DMA interface. (Some are actually skipped!) There's a lot of
> > duplication which can be eliminated using macros. This should serve as
> > a reference for the MT8196 AFE driver that I had commented on.

> Sorry for the very long wait here; the entire series is

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Unfortunately this doesn't apply against current code (I guess due to
development in the intervening time), could you please check and resend?

--G4b3JjsI8btsM/C/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkqlkACgkQJNaLcl1U
h9BagAf+LbiTr/XEhuAQvngZeJHld91IJrIAjQzha/eW6VThB0hPAijghqc0XSvL
bI33d35Hm/Y3ZsiIfOhqqg1nL0C4JRcJtF2AJnWXQCBuTq3ROom0xl4ZZjhZkuJb
jnqxMh4TyM6ogM4TGCwhmTlV/LFYEKfL951hYfY5XtAuj+7io5CHnRPj5eJcBhat
Y0Xj2jiWcWdH1zlJbTk9NYUZHq56sJS1nSXqupRpEkgGNLbX3vkSqjcUlSMOI5Bi
MNsc6fUgHxEIZUippP3c3NSw6g5WJRTnnM+W6XilhWmIaP8wl8fGdQKWyIIpcoaS
Qq/1byLn9CAo9+9VrYHQjTDiwcmE3A==
=zlK1
-----END PGP SIGNATURE-----

--G4b3JjsI8btsM/C/--
