Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FD73BEEC4;
	Mon,  5 May 2025 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746488807; cv=none; b=EUk8WYVHvijMxkb/oDtKTg9urau13uFJvo2Vq+cE6NEHHIGj1NJa/JtgEVyY7J2Bl11T1dq7s3CbdfvbMFlIUyADp3ztSaBs5nZODrLbtMter6BBJ50xHp4FitnzKfx14K3cUcPn+5PQ5Q2tkX1YQuWTnIOrrmWiznIvPo9d5KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746488807; c=relaxed/simple;
	bh=UeOCuz5zLz9Hfn9Seyw2+sMVfIxYrZpEEHdtvOg6Ois=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUfHVrh82o/KWnjsl6Oie6mr7lS83Y8vxOG/96BB4Pr+VWKdiJNy7Oo1PdTibY6YOqvp/9RelIy4y4/W4KbGV2TeAg3+J1llDuSA7bUnYmwZ5+ectzbyqoLKelkMZ0WhXTwRQ/9ffvVGpvaNSzgh1zSTid1KijgWi87tJnMTTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUmxiq81; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUmxiq81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6670AC4CEE4;
	Mon,  5 May 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746488806;
	bh=UeOCuz5zLz9Hfn9Seyw2+sMVfIxYrZpEEHdtvOg6Ois=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUmxiq81k4tB2y02GgkfpHgRNMBDPDbvRFztNF2GoPmdaTC3oDDTI1iJOESLNPlXG
	 OH7ulLu4FuKY1YvI2QWa82uFK38UqboYCY8aSlJPoU2MLQULbIL6DeZ0yBeC/k2Jm3
	 CsJAoi3n2ksWZZR3hU12PupSpsjOQVdA1usYHnVArKVW+LDj/ft3eObDrIIGL6OZiY
	 tj3kcCI2i/BlIw4QlkcQj97BWsT0auI4CxmAWiTbxq1XQfkOk+TwI6QR5eB3iwMOcb
	 51wYfwGLZlcL/Y+lpdtRa01bEHv+4Mz0ggBdjRGCDNwHvTbc6qYSQXxRqYAsWtQ0YM
	 FTqsDK/3ph+Hg==
Date: Tue, 6 May 2025 08:46:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
Message-ID: <aBlN4bSkTE7qC4a9@finisterre.sirena.org.uk>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
 <8ab556fc-2bbe-486a-ac19-05226134e66c@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iQh3Vg34ZQQXjtTX"
Content-Disposition: inline
In-Reply-To: <8ab556fc-2bbe-486a-ac19-05226134e66c@opensource.cirrus.com>
X-Cookie: Well begun is half done.


--iQh3Vg34ZQQXjtTX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 28, 2025 at 06:34:31PM +0100, Richard Fitzgerald wrote:
> On 7/4/25 16:16, Stefan Binding wrote:
> > Firmware based registers may be different addresses across different
> > device ids and revision ids. Create a structure to store and access
> > these addresses.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--iQh3Vg34ZQQXjtTX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgZTeEACgkQJNaLcl1U
h9C93gf/VcPLkgS3B7FpiCh2gQOksUNp78n0emO6NHjuD20HZX154vcKglY3yUVC
RYHXDIkwzuKznfyN5rfJTB4XqDdr23+ZO2HG5kTQ9djc9739W8eJ4vkf5zX2mfYV
CH5Oila9l5qf06RCB1vws0wY5s44H+y1DFtMR9B3ZhBWkRr2iM1A0jbqLHpm/Ou9
LCWY3a6NqkbscqGBsjNWnjoK6MTniC0oAsXpLBSNQNz/IA3Iv5OJVisEwMcQK2WJ
hP5oXsRjJSQcIY3hyKgOkvia18ncsLkEs5WzWyQCdiIVQwBco2RgBHE+pQkajUGs
blqHDwdHCGg7I/HWVJouyTM4liYZfQ==
=c8ch
-----END PGP SIGNATURE-----

--iQh3Vg34ZQQXjtTX--
