Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93D2DCC1C;
	Fri, 23 May 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748008916; cv=none; b=iisiJ44M5QxMWbZEuNZC3uRa1IcJvHQIR1HQqD1aiYOEvg7H5BgTUOhpCgoJdQpu+fbQNl41wsS85XLrGOMon0eqwkJrcaBRNVtPRDPb1JtXPAE8LdxRl8NwQ5Vw7ReZmPbjV9k39ejSoBEv9qEaVGJqoOyxJtHP2IO9F6uFttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748008916; c=relaxed/simple;
	bh=FUoxvHyX1Aje1ITADw8BQkNCkmambL6fwBLuYMEdP9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keoeiVS+QVfW1Rw7Kqgb5I/WvDrHha9tR6aPAoQmgbN0ikYkQ4w1fgL2vaN/2B++M3/foRd3PsXcmQpihIXqVR1hsfA9U69+28zE8dhsUd/6zRNRCagUqjioOloZO33sjkRiDGo5ROk7SYHk8ioFhJs8gNDMos30y61VMeydwWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FD145Q+r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FD145Q+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49205C4CEE9;
	Fri, 23 May 2025 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748008916;
	bh=FUoxvHyX1Aje1ITADw8BQkNCkmambL6fwBLuYMEdP9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FD145Q+r7i7udHZ+el4mHJQuKBAiAHjIT2c/dXAd6iiAwqtcN+41ZVR4sIFRESeqx
	 74TqAlBTPwBPK++EvJFf/eQcUd6mUdIls+nIom+uEBUU87r6brXRdihSejMJFrFngh
	 JCNMymGuZFoACO9O9QIojZh9bDAP+Q5lsm3csM2fxrssKJTmKlFJA/znmOMxl8B1Zb
	 e0KrsObVDH/z92Jm13P/8yax2DpWIsOEEpG+yXbnPqhWi+I55AC6cGy0WyB5PycJeY
	 5rSKMm0fBzm8KOsVlXOHPmAcl6yeYCBcPVA1aPgRgdVRamVxXKY8CH/mrVGTKNBBd1
	 C3VxAuDD5pNJA==
Date: Fri, 23 May 2025 15:01:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-ID: <aDB_0Lln89dZnoG1@finisterre.sirena.org.uk>
References: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpBzIUko9+Y7RG2z"
Content-Disposition: inline
In-Reply-To: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
X-Cookie: Well begun is half done.


--fpBzIUko9+Y7RG2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 23, 2025 at 03:12:11PM +0200, Martijn de Gouw wrote:
> Make the PWM mode on the buck controllers configurable from devicetree.
> Some boards require forced PWM mode to keep the supply ripple within
> acceptable limits under light load conditions.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--fpBzIUko9+Y7RG2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgwf88ACgkQJNaLcl1U
h9DZ7Qf8CJUda5IebGoZsBRvg5B+1fbZIexcrYA8Ux4VBLkrbU/3y/IS0jIkznz6
3nZCkzgL1r07bKr/3NBkqEuwzSvij1TxMIC5qyA0cC0kWuDkS7hYg7TtMemMaGK/
tTVJpjR7uV/criQNuuHkCgWlBOsUrpFAtmngIDcgSwFN3j0ytNl3uF/agZYvybDP
nZ2MPg9mDi3obpYXJALcQLnf1zXgSEFQSdpKRL+PDAlsSZ8IIHF+61T3GdRHwrx5
oSBnd2N1qhcp1H2Zd/+GrEHSg/s/slnSlA1boR2r1uCBaY9CVEZWsPgQ4RKWwgHe
NrsgT+giwPLrycFDlDpzuHF9oJ/SZA==
=9TrN
-----END PGP SIGNATURE-----

--fpBzIUko9+Y7RG2z--
