Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EF79CF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830328; cv=none; b=Jm1JvzErLTDP+Vk1261BUvnFBwDmEceIHAzQei85OECVwWXDXHaxayQXlW1NhvU73c7HOVP2n9MPyyh16EosT1vqkFlV9lGxjGhxnPnOAifrHXpPKvW7nbK1EfGqbDXl7T1f0c1hAknTRaeg7czFd0imHe9kyI/mLqEnUKv5UkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830328; c=relaxed/simple;
	bh=fMe4GJl2U+oM6kikbPqxC/xSrL1klr4ugpaio1HDWH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evHGQxX40fjVxxIb1CpTFOWUJ04nWP5ySI1Mf0DpjW36MtjI3ZhzfQcYpREmjAr+povX8htVz4SRqOzMC8mAgRY6ZMDnNVoWZqsfqF2S8Y7Zt2l0r9Ax6iiggp+051fCYCIT3AOSjHej4PVt5hMjnA3f8lexN8K0Oej93L1tb8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acqBl7qF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acqBl7qF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6D7C4CEE7;
	Wed, 21 May 2025 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747830328;
	bh=fMe4GJl2U+oM6kikbPqxC/xSrL1klr4ugpaio1HDWH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acqBl7qFyvJlwAGNeLBHrZzkuoNJjdbb5WW8RcC+bVIWz9CtT7xJ9/xT5ZG4rqOXV
	 Rhp/pq5ho/o0Vrr2NS5NB7nj4JVD3lIjVp7Rhl4r3gvUbq8Upcvgaf6Djzk55/8rOY
	 gRvICTh5dbbnzQn/fHbQHEt1WtPMz1ZWocZCm1PbKibvFvueoQYiLT5tCP0bMeSvBo
	 ZbNMydOOrSXZcd4XzT888s+xBOLnpBFrN+OtFTtPoPZjHcIRZpKRJHRnLBAsgTN0wN
	 fV3NSDH55BOngjeSkFrXBC2Y/bksdw2SwGeNl15/2/4RBtuOFN6a2SB58Vd05QfzbI
	 85crK0yB2LZ/w==
Date: Wed, 21 May 2025 13:25:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: core: do not ignore repeated requests on
 stepped regulators
Message-ID: <9b06c8ac-87a8-49d4-bf0b-89c73ea933ff@sirena.org.uk>
References: <20250521-regulator-stepping-v1-1-b681ad012c0f@bootlin.com>
 <65ea2969-b528-4a7d-b6ae-21376fe2e517@sirena.org.uk>
 <6190301.lOV4Wx5bFT@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzW2MNSmwyEGNhSa"
Content-Disposition: inline
In-Reply-To: <6190301.lOV4Wx5bFT@fw-rgant>
X-Cookie: 42


--mzW2MNSmwyEGNhSa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 01:50:22PM +0200, Romain Gantois wrote:
> On Wednesday, 21 May 2025 12:07:05 CEST Mark Brown wrote:

> > No, if there's an issue here we should handle it the first time we set
> > the voltage by doing multiple steps in one set_voltage() call.  Having
> > individual client drivers all having to repeatedly call set_voltage() is
> > obviously not a good API.

> Understood, would it make sense to handle this directly in=20
> regulator_set_voltage_unlocked()?  For example by checking for a max_uV_s=
tep=20
> condition and repeating calls to regulator_do_balance_voltage() until the=
=20
> resulting voltage stabilizes?

Yes, handling it there seems sensible.

--mzW2MNSmwyEGNhSa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgtxjMACgkQJNaLcl1U
h9B/egf/REtz+H2xjYEpfb239fB8UY9jlC3eam5JPFJy6V63T9wxuRkxSBStYP+k
oVWf8goXjj2QO1f/JdqaGeOi2CKOMyeZMAvFzKaAGcUVBjpfze/MAfYiuZ07A9AL
EKmlHnsn16AJXOoKXa2My4jCMxgPBr3euqGhpqcOTrVKJ/wZ4e7ru+5HNRsVorS6
lmpZhNb6qXZVclJKdADui1AuZHpLfL6w9v5XoGokgfFUprBq7CFm9gkZe+Uau41D
i/PzNLwNaJlQFkW16lvY5MyAav7w/xYizOFI3qNigMOt6fh+RQVR5Wg6cpkD440j
vyl+7g20TcTQ9XqBIvYp4KNI59z1vw==
=cxY5
-----END PGP SIGNATURE-----

--mzW2MNSmwyEGNhSa--
