Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDCC151990;
	Thu,  6 Feb 2025 00:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738800936; cv=none; b=inCU820y0tCvXW6i9VqqHUle89Z2k3o9Rgy1j/pDAgJyBjnTvHOmu5QF9F4/JkjH0OdYZ49ds7CK37ZJFEwiZfI1QtKjpOfXbAHX8AWlqikPWfoUsY52xotUE+IwPluDtbKah9pl5pl279JiEboiJG1PeVLHNchuEJ0MmECm3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738800936; c=relaxed/simple;
	bh=tKt+M7z5GeYnCETHjzL9LZlH0W3reEoFEVVWDfXpGNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFuwehmMd3b8PgCTo6Lt4/6Wjyjv8+3ZnribHrJFM6YQsbTctU/ozwXnCXA7Lxm5KrGUKLqxA2jdnmLFHZwQ3xo/Iy18PTTmlZjnc8CqHP73Oqtau9EcQ3F+Ti88AVYKz/AZXDXc4/OcVfbypDKbhTMBaPLtjqfOCFDw39cnWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAMN6iQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAMN6iQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3F9C4CED1;
	Thu,  6 Feb 2025 00:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738800936;
	bh=tKt+M7z5GeYnCETHjzL9LZlH0W3reEoFEVVWDfXpGNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAMN6iQoemECVtG4TPro1NyLybz/j9NEOV+VKO/R57ZdAV6P15MWfWBDPzBQMniOe
	 hVauJg5Er0eHyCqvaN8eoCQFKazkDlfIQsYz5ginsBqHqJ3T9uoLIeHqGjlpWtuP9B
	 4cJw1JZ6MjDE3yWy+3x3l6qW0p0EPnwEeArRIJd07VfgKAyeQylt92PF+BKoDAhHdG
	 kYcwxr8+WsoH2UasqRpcaf5xN/IaKSU+m8YQE2J7H82FcHwo7HDzlM9BdxM3auhBP0
	 7ksqd7WMtbQYeMVZAj9mYTSKFjQUWPE/3wy2q/nq6PTlKggq+BWOXJxl7ygwwV4an2
	 SQx0k7VxfEhzQ==
Date: Thu, 6 Feb 2025 00:15:31 +0000
From: Mark Brown <broonie@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: max98095: Remove unused max98095_jack_detect
Message-ID: <1853fc7c-39d4-4d15-819d-7c9426f671b0@sirena.org.uk>
References: <20250205014458.486207-1-linux@treblig.org>
 <dc0bc826-6105-49f1-8a59-bb4881e9143e@sirena.org.uk>
 <Z6Nbr4XIN421orTF@gallifrey>
 <Z6P7CaRSk4RD3jLc@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5MWThAhpG1DynhMw"
Content-Disposition: inline
In-Reply-To: <Z6P7CaRSk4RD3jLc@gallifrey>
X-Cookie: Earth is a beta site.


--5MWThAhpG1DynhMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2025 at 11:58:01PM +0000, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (linux@treblig.org) wrote:

> > > No, this is exported for machine drivers which might not be in tree.

> > Ah OK; of course it would be nice if they were in the tree.


>   Is that also true of mt6359_accdet_enable_jack_detect ?
> I can't find any callers in tree.

Yes, and any other jack detection control following the same pattern.

--5MWThAhpG1DynhMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmej/yIACgkQJNaLcl1U
h9Dzogf9EVOf0PmZ7Sz6x9H3DycccoiN+KstI5zwFg/8qe4anFRy4NKT7eRrHgWx
hBa5FGAxx1GQ47OVxg55zGZwrIVVSD7oR1XOvH/ZsAF7kzWQxHNxPSLZ/pVDBseh
n3Mpeg4Z/NMU/KnmOebjALc71mnFWOiYXUaiBcxvkple9yTPWGaBVew71vNF0JWa
lKH1nMCVS8XhJUKgKyA1n0Vl9aGrUDsYCc+TuaQ4cLDpeIcbpUS5L302WD0oEjnF
AqGtYTT8OGcCC4YY6SolkbMrLBOZCofMM4D4xK4nU3vETrCcRpAdNAsIgzv3u/w7
8fD6Y36ysibfJ5c8Q425gRaybVBcPQ==
=lYX8
-----END PGP SIGNATURE-----

--5MWThAhpG1DynhMw--
