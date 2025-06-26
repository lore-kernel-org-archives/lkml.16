Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EED2750E8;
	Thu, 26 Jun 2025 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936121; cv=none; b=Q4NFeHzQBpe9gadPMpC1d444v+ivgebmhfXpTB3zc7Gwup8+k51sj2rtuNk+n1JXqRV84yJsq3IQSjyvcZLbfkKhkSTXOPQiWGE1Fq/PU2bBUcRleaHn6KqUrO6GhlhvC++RQqwJIFPivtX3tg9vX+lyo4hR/xfLKtvn0BOWmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936121; c=relaxed/simple;
	bh=up7Cs0PRFSAEYYIexNfbEfm+HjdkJ76x55E+y+QPstQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1ylW4uaVnoejLVvg3q2hUHKrEzzSMvvG+drWa1UC6YEHcGNDfiE+Xuf95TpGE9BWmwI4bk9F2s32HOhOSGx+QRihnk/5DB6V3f82XM62dLkV53K4/P/1DdkzCgQvSOi1L1PjKwiGzPnsg6Pg7OW2KH66fNXHvy6VICAlseiB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+U7zJV4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+U7zJV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D660C4CEEB;
	Thu, 26 Jun 2025 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750936120;
	bh=up7Cs0PRFSAEYYIexNfbEfm+HjdkJ76x55E+y+QPstQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+U7zJV4idWqfEM5gHGt2o+1C8t3tdx721UpgwtU0Epu+pjEbBa/VYRHV4BgrIm6w
	 M2mgTtV9FZBMNJBbr0Rx5DjdOp9959VO0YIOAF5LnubCdJS8y042DbxBUQ+6T9SZdh
	 R4zHirpioV7wBuwXZq6w0kNJj0yi5c+v6iV9nb6Tbv/9F87MhbWj6t9S4LD2ybC8ow
	 nFP3OFc+en+AEx90oX0A5tl1tsRm3xSXJtLXZeIbygEt+5prQ2veyML7Y6qy4SK9Nh
	 vb3klNPsdusKJEZgoIbURxCD3/ZRFqTDJ//uhBXGDrukPsV12gwFizFLhcBNQ1MzuU
	 suCHxygB/oGPw==
Date: Thu, 26 Jun 2025 12:08:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pieterjan Camerlynck <p.camerlynck@televic.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Arun Raghavan <arun@asymptotic.io>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting
 in consumer mode
Message-ID: <aF0qMiPiNfDBXZld@finisterre.sirena.org.uk>
References: <20250625130648.201331-1-arun@arunraghavan.net>
 <20250625235757.68058-3-arun@arunraghavan.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5z5oGHyWYUf3RoG"
Content-Disposition: inline
In-Reply-To: <20250625235757.68058-3-arun@arunraghavan.net>
X-Cookie: Do not cut switchbacks.


--K5z5oGHyWYUf3RoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 07:56:16PM -0400, Arun Raghavan wrote:
> From: Arun Raghavan <arun@asymptotic.io>
>=20
> In a setup with an external clock provider, when running the receiver
> (arecord) and triggering an xrun with xrun_injection, we see a channel
> swap/offset. This happens sometimes when running only the receiver, but
> occurs reliably if a transmitter (aplay) is also concurrently running.

Please don't send new patches or versions in reply to old threads, it
makes it harder to follow what's going on.

--K5z5oGHyWYUf3RoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhdKi8ACgkQJNaLcl1U
h9A28wf+LigIwA5J/nqjjSzl5OykFKzStn0zkkz7CjEoM0S32nzT/hU7vMdAhhVl
0e9wF5rySlYduxZXG3Dhfw/4yPAPG/EudUxyaVw6Lpu7WjofNMQKZeDJgkpFp+nv
dsvj34UtK/HmHsE9EiuZfmbxWT9Mdk6q4EcZ6Fto/A17pYM177GMDXZcKir/+SWA
kzqN7tWuILE/thdnhkda9mKcmdm7kVh1cMI/qPt7NVNTcf+IrQBoIrxj02O+QqSr
4LyFMdg5OfMAUAslWpNgdvm2z7O+71PS6nFYGvxVeMuWc3L2qN8bG1WixPSjuMO/
11JrR/ldTRYL80Qgzz8+k6QYI3VIew==
=IlG0
-----END PGP SIGNATURE-----

--K5z5oGHyWYUf3RoG--
