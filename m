Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C125A62E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822029; cv=none; b=sgxPAXjTzNSEHz08DaB39hpoScD1ek3xq17gUBU34vtaoP0HZeEZBlPvIfr4N0djElpGgWYTmNs+E1BvkUQIWRqNGmhS/KMRocpdtyay52Iq+vMMsC1mCkaJs6bJHZrMY8m3RWEjzkVh9GAvImq0e7zrjVkFuLpkakD3MIDDnb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822029; c=relaxed/simple;
	bh=TzaC5F/34ze80jqx91fjVtxmtYeM5S4kzBik7NxwHhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXRQRagL0Gac1nFxIlITv2GcSy/DftKya2BEPChAYRaTAHu1wT2XcDALbi1Guo9kfQP/VBLIvSEr5OhLro67hcnbAPLKyv6LYBwep6EhpYV27ZHbpSYQFhJVt8s130hY8Hk87S5xZpzpjh4ckBdNxPQ9T3/Dwrb6j6xTEQpeMpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgUAiugH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgUAiugH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E59C4CEE4;
	Wed, 21 May 2025 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747822029;
	bh=TzaC5F/34ze80jqx91fjVtxmtYeM5S4kzBik7NxwHhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgUAiugHXphRBD17o3cAucyoZXqmQMZ6vEwqtoKg7FVvAFK0MezPSsQi0o+ML31vc
	 UZwOFhqf/6Sl9e+7uF+k8tDWR3J7Qzj4abb7Q3vMQ8pA4740tBXsNLYzx2923v5V05
	 W54sP3bX6rCYqIYneAZ2MGYxJbDu5/sPZdKh+5QBhaPC6m/kxIKmLIVd/rrwMog0hC
	 qVbpx0aGvKd2bvizlXr8BUZXiDKh/DslhJMuOePaACKCKaBBJamULraB37Cj6r4KKU
	 ghSku52QwjoPCSpQvlAP+g+Zyi3K2e4i6fvpwBstgkF6gAIWian+LQHRTyzZ+OK1Cb
	 G4UlnfrIk9GPQ==
Date: Wed, 21 May 2025 11:07:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: core: do not ignore repeated requests on
 stepped regulators
Message-ID: <65ea2969-b528-4a7d-b6ae-21376fe2e517@sirena.org.uk>
References: <20250521-regulator-stepping-v1-1-b681ad012c0f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k5qcTD3KBFY121W5"
Content-Disposition: inline
In-Reply-To: <20250521-regulator-stepping-v1-1-b681ad012c0f@bootlin.com>
X-Cookie: 42


--k5qcTD3KBFY121W5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 10:47:24AM +0200, Romain Gantois wrote:
> Currently, the regulator_set_voltage() function will assume a noop if a
> consumer requests the same voltage range twice in a row.
>=20
> This can lead to unexpected behavior if the target regulator has a maximum
> voltage step constraint. With such constraints, the regulator core may
> clamp the requested voltage to a lesser value, to ensure that the voltage
> delta stays under the specified limit.

No, if there's an issue here we should handle it the first time we set
the voltage by doing multiple steps in one set_voltage() call.  Having
individual client drivers all having to repeatedly call set_voltage() is
obviously not a good API.

--k5qcTD3KBFY121W5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgtpcgACgkQJNaLcl1U
h9A78Qf9GOQYlI0H5HoY6sia+l8Gdmup2wk8FQdCBbzHmfp9SR2uDd65F0Fg0dkL
KN4j4unzaogew1puE9Zvy8lYzDnYoIOJ4i327nuRolqfo+F4YhyRXOsw4Yl7qk7j
KEvR1v+f+RLWCuuq9zMbOO0ZQVWu5e8yaBkza7IGWC1JTS0BN86lWd0z15XKtulT
+9fHANtunmZX+KBzTCYuTXb6LNGdjfyYSNGDasShsZjSgL5iPdiFGXtM/yp/UYsN
qrf2vP8wlTftTYbfSbZEBj8s9YKtfa48h+ImNU1ZbUO4ZokjUlgG8xWiJSscXFZV
gAzWwPhF4JcYTB1HoEFcz1pKBfvdFg==
=p6w4
-----END PGP SIGNATURE-----

--k5qcTD3KBFY121W5--
