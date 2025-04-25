Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A121ADC7;
	Fri, 25 Apr 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580621; cv=none; b=CA1k7z/sqEqUyCAAf3cgWlZ4Vvu7+UMZI5gRifApZTTt8E/HFyOQSTJOgUV1aiEwLhSkqgucYLoyOyBXSY004vxCyyGCmk12OcnXHY+5T7BIV0//k78WlVGAq3hIVqo08+e/9MhEfmLD7fO+T0XnEQrUOLVQzBFVCML+PkIdlj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580621; c=relaxed/simple;
	bh=bZ91MEiyxGJ+ih7aS840VX6sQU1UAjNRi3/bWS5vYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mu8tpsRvp35zE8O8CKE28jvcWXN6rOHfYXH/D5p2Sd7Cib57siaDbnc2II0T86PXXw7oDfa1vbZX8JIOfe4kC+B/SeutEuDS+LawlWnL0qkcoTnRqz6LtiZ1Oa8lyNhOSQY13CxE1caSm8USoBQoB8ylWE1CAYpYYVLsLb8cUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jv3m1US5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jv3m1US5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF02C4CEE4;
	Fri, 25 Apr 2025 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745580621;
	bh=bZ91MEiyxGJ+ih7aS840VX6sQU1UAjNRi3/bWS5vYXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jv3m1US5TqR475jRNTDb4Fw8/9MtU6dpe3tatdXTZtWeYYoM7jEZnh63UAYGimNOu
	 fw2wD2rS4Cat0Xs5yC0RSzF497Hni3PsF+pNS6qa4Epbc2+A2hOF02PUKlblg+l9ID
	 5o0mTnBkizn9DGOH1dLW6eyMXxUzmbLVCZ/Tnx5B94UJYP6LodIO0bbD10iZM3yp5w
	 xoQnEPDPjJl9s3mcmwHtPw975GkY+ZuFZ9VAhHkzvK3tHirLzSBYFl2KWcrpqQIf2u
	 wC2xcdASJ5MbESVe3BoeczY6myUjNCaLWYdVjb+unnHaX8vtKeH1qt2jBN/Q2YCXDV
	 3xLGt/XDsA/vg==
Date: Fri, 25 Apr 2025 12:30:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	LKML <linux-kernel@vger.kernel.org>,
	Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp resume
 path
Message-ID: <960fe8e8-3146-47f6-9ca5-8d203f887c57@sirena.org.uk>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
 <6f4ee1e8-aa28-4d20-96bc-b2a7343ddbcc@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wKinTASeDFOSyzfb"
Content-Disposition: inline
In-Reply-To: <6f4ee1e8-aa28-4d20-96bc-b2a7343ddbcc@web.de>
X-Cookie: Debug is human, de-fix divine.


--wKinTASeDFOSyzfb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 10:55:16AM +0200, Markus Elfring wrote:
> > update chip data using dev_get_drvdata(dev->parent) instead of
> > dev_get_platdata(dev).

> * Would you get into the mood to replace the text =E2=80=9Cderef=E2=80=9D=
 in the summary phrase?
>=20
> * Can a cover letter usually be helpful for such a patch series?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--wKinTASeDFOSyzfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgLckUACgkQJNaLcl1U
h9AeuAf/ZUzdF4n/GKCb9AEu6x5bSa7c/xMV4hdOZVd9T6FPyeGPM2ZtzBX+jbEm
JL88i6eU8qcMTzYICJblC2L8DE9Fql4fqaSRPoDeq8WtEtQo93meuSVJ7JZ4q4Qy
SOQ4QUnZ8TtC0jZyjjEKYnHJZOa/pFrHLXqmwbDOAv4NXZ0hMmFB+UAc7Ep9yyXz
rSWqZUOqdP++UH9MQngeeCF7Ms/6Awupb0yC8llFp4t4kbFNBjBc5QU9+sGwYjSg
aeuiS05HwFcYWZYG/+yDgpUTIJF0I2VGQD+Cwq1C/ydf/JW6OIqUc82b7ZWtlB9D
AF0QRZgiIvvW7Be88siOcQgkz99P2w==
=SNML
-----END PGP SIGNATURE-----

--wKinTASeDFOSyzfb--
