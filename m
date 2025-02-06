Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C75227B8B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846720; cv=none; b=pgZ3f3pCEpL4Knd6VVW7ed46x1pzUnt3Ed3m2Aav3DULDZbEYuXa7fo5+HgO9RW/xzIP0KVH5TMejtm3NO/VVvCoO0AEPtDSslo6J78s37VNiq5iwF1e7bfzwFiayXI4sNipCuscgUItL4B/00FQmkQC5lh7bt67OP2f5zZlZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846720; c=relaxed/simple;
	bh=QErVAa9F9QDSBjW7aOMYhUcLni/CvnqKEaeBZ5HyBe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyk8oja+lSHmNoi3zW+6PExlnNP6EqSyszp5pzvFVAmyjcYf6kVYA/Zk+eexIzegYnoHo4Y3Ej9ObbnghMgs+xvcrgWgCEVRRE17MJrJ96eTv9yzvvxFWIjYYVUZYr3/gObfLvUZEzkiu65e22+op4OCjF9NX55cmfZ3FKYd078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAmhmIkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAmhmIkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0565C4CEE2;
	Thu,  6 Feb 2025 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738846720;
	bh=QErVAa9F9QDSBjW7aOMYhUcLni/CvnqKEaeBZ5HyBe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAmhmIkklJ+Skh/zlmc4M18J2KN78KxaZk6H4HZmTChmdEX6jbL8nQTu/oyg63DJM
	 Gm1EdYt2YMmUHOu6ooaETWNcBbDUMVZoRIeiXb1uS5CGZnyPNg74EI9lk6Zg8nMljO
	 cLdKLLcwamBwSAxAl9Alwn9zdkL9/68Wb3poI6fRpTgpTGzfNzVXKDyFV+kgXI4u12
	 f3okxkCrqrpIPCrtdeQzQpjHPrv/NQUbxI0xFecID58AC3721VZqoIZNGvE/4uopMO
	 T/czA4pABgDxj87ZR6gED9iF+zS0JSroMlJ5nOF/Swfvwse33ejVR0NHealYgtOrMD
	 osmRy+zeGJ1DQ==
Date: Thu, 6 Feb 2025 12:58:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
Message-ID: <f81d5101-1dd2-4ff4-9a23-403b6efbcdf3@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
 <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
 <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HBzs3mEsUm8vemp0"
Content-Disposition: inline
In-Reply-To: <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
X-Cookie: With your bare hands?!?


--HBzs3mEsUm8vemp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 12:45:28PM +0000, Isaac Scott wrote:
> On Thu, 2025-02-06 at 12:28 +0000, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> I have checked, and it applies on top of linux-next next-20250206,
> which includes my previous patch you have already applied:

> [1/3] regulator: ad5398: change enable bit name to improve readibility
>       commit: 19d022d67d7353f0e6e9ba255435d3de93862ac4
> [3/3] regulator: ad5398: Add device tree support
>       commit: 5a6a461079decea452fdcae955bccecf92e07e97

> Have I applied it to the wrong branch?

You didn't include a Fixes tag or otherwise mention that this was a fix
for a recent change so I was applying this as a fix for Linus' tree.

--HBzs3mEsUm8vemp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeksfsACgkQJNaLcl1U
h9CsYQf/aICTj4y3xrq5A4Cn5Svl+u/pFZvKPlGpoCwIPQapWQmlAswTC3/Pryiu
obx7sXxE2aSgggK7omlVrEqCVAjAZcEZVDKAUzLkvrPf4HVM31XmYPJ2S1BVgB3v
tuOi8/IOE8rAi5UhWA/nRw2QR/z+jXiwWIqZQkoUF/0NWb4xeoiWt5C/v3YfARIC
2KOWPr/603/rUExTczTmYqQRbgMOpCOLx3J/dmdGE+dpAwBWCFLYaGTbG5WHlS41
MWmtGD2QQZDnfzvgXKgBcUja2iWK0/kxLdhk4lvSIv31FwipxctcmaqO/eJn9ott
GfmSkBccfj/GaBFsGjv9g6+NWJtqXA==
=H+YX
-----END PGP SIGNATURE-----

--HBzs3mEsUm8vemp0--
