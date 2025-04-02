Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F581EE7C2;
	Wed,  2 Apr 2025 19:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623806; cv=none; b=n3R5DvvwSBLuggHcQAtpeK1Rw4UJU0kzyWnTklIJtQVgnZB+1cT/ND4ea6wBP2dDGMKSxesxAof31dH45mLuY5OHYNNt3UhTfQfLX565t8p628aMDAr0Sq2I66fS4gX28gZF/rcKWoulxcqaQgJb90e+44V8RIDZQaEJDG2jp+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623806; c=relaxed/simple;
	bh=momLojQ/gzc39QlT8N9SPT3tOf55duwwyeqwYHFwRTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f03Ft6XsPDUPMGtkzHnQKYkRf9qRel4219RMqaeutv1YbskFB/OwhbhqTwlyrA4uD495w05OqK9q3xkrwDrZu3a37IUSJ8DDJKKm3h9WarYx2vUCRGE1WDF14hpwjBVRb3EMKKpO6XQLdz55R4aikuiScRDHoCLmVtPtXO7/Xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGH2pdGw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGH2pdGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2E9C4CEDD;
	Wed,  2 Apr 2025 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743623805;
	bh=momLojQ/gzc39QlT8N9SPT3tOf55duwwyeqwYHFwRTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGH2pdGw+qt5CjQfKwckzDLxz3QSD1BrPZM5yFvAG/jd5CQ0etct53jalcbtZu8gE
	 2pmqCgK7SIfozXsqJdjDZWMCh0kE4bxYNxhRw+vSIBrE7IiHSuMhHwRdayB2ANOwCi
	 klyAhtvvV8JoxXr7obTjCiYpb1mX3CnfHwLeysxbx+EU6wbuh3Zy6fplNLvm1yDTuS
	 nwdiITgXjaqhsnAOLDYYs7RzMSWuLxMGXkbiEX86iLQ2JD8IyyratdvskOWHVPKx7N
	 oT0sRUlaFkI5HcR2JWFqQwIJQ/czFfay/cy2V1yK8oZ0W5/zX7nBe8R4eyrMLdYFN/
	 GFCtSfGxNXYfQ==
Date: Wed, 2 Apr 2025 20:56:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, linux-sound@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Ethan Carter Edwards <ethan@ethancedwards.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Fix null-ptr-deref in
 avs_component_probe()
Message-ID: <6ad612ff-4bef-46ac-89c9-c97bfe8fa617@sirena.org.uk>
References: <20250402141411.44972-1-bsdhenrymartin@gmail.com>
 <4481af92-9573-4f40-ad65-a2d6b3ca2e0e@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mhPyN08Z6mviwWrV"
Content-Disposition: inline
In-Reply-To: <4481af92-9573-4f40-ad65-a2d6b3ca2e0e@web.de>
X-Cookie: To stay youthful, stay useful.


--mhPyN08Z6mviwWrV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2025 at 09:18:27PM +0200, Markus Elfring wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> =E2=80=A6
>                                                        failed?
>=20
> Can a summary phrase like =E2=80=9CPrevent null pointer dereference
> in avs_component_probe()=E2=80=9D a bit nicer?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--mhPyN08Z6mviwWrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmftlnYACgkQJNaLcl1U
h9DIKAf/c4tEasLOGCJe5UTVxS97dZyN7F3MzxUyFCcK75lfYxxvbbViJEh748CU
Jd52IHBUFIssi6h+TQvPfBBsPOILCvE2y/TySbsEMShLgOBd2VEawBtN7l/Ee1aZ
C6sj4VFARsVtseRYQEMeL1+ZW9yS6rtGWDasYA50yBU8qX3s5CHeK1amN/cP9TQI
0nRzKCYA3G8YDut7MxsFQhX72l+P6WeV91SRGqpzisIcGJebTHogjB7BI+b1AHsv
M7nP9tF3vPY8IxfpHEYpaWaieWeGp233MJaYmmCFbUN40dz+9i/F3iVXBJVfUkzm
kVielGvenoFK5CHEwSCtJCvExWXDGQ==
=MqqG
-----END PGP SIGNATURE-----

--mhPyN08Z6mviwWrV--
