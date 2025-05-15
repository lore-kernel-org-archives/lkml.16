Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB1F15278E;
	Thu, 15 May 2025 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297193; cv=none; b=qH3pI+uD2ohN6X5fgd1OLKjldrCDY8Ksp6DFUJO4PxXwByZQaOpIJDuq/G2AB5AFAn3I4edYeuSHIPMyrYeccp5TRWfj+cS5dy4vlxBazCLQSzNCMAldLV2CstsgovCLX9HczzieH3Kc3hMe8cZV7ZbsyotIKdkVffzVK6z8l3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297193; c=relaxed/simple;
	bh=EBgEc80X4JujFpyfHDJXv8CR/kytYB6nQV6DMuwd/WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3kbWjLGjtesi3gna1n2rhTQU2urG8/MsShNu6hme+u6vDc1UTkGU7pqXV7N5yHzhuQkdnoNUa7FSN3SR0BCuWCH786b3YrokN/0HLQ8xheOHWtSoyxVjv6lYIk2r+unlAnw54Eoienu/EkT3koKAMFdS047fGNmQ411cAzgViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW3EGD3y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW3EGD3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C97C4CEE7;
	Thu, 15 May 2025 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297193;
	bh=EBgEc80X4JujFpyfHDJXv8CR/kytYB6nQV6DMuwd/WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PW3EGD3yvFbnJjQ+FVii/BHgOInyv7T8Awd8oQaHNiFDO+nHSygZCzwSOP/mAB/bE
	 kH6C63NviCmMBhy/iv+G+uHA3qc9FyiK4lgsL5byFdF0dwmzPvneqCf6iq67HOjddT
	 RyyLZr4WLrgSPBrBC2AyJ9965sP4i69qKzZhP3eocgb6qO5651i7D3GrAvd9vABc0V
	 /O62NgFJwg67VCVMSrfsYTp/fJ2no3Nr1BELwwzb/0oMbyFKSnlb7+whP74VXEWY74
	 Pz+7SpHab4Eb+839kcN22A8PJngC0hFoMTQ/DQ8+ca39DnfeqGHhwmkTDv4uZS/stZ
	 e5byVg3CZn3rA==
Date: Thu, 15 May 2025 10:19:47 +0200
From: Mark Brown <broonie@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <aCWjox6uWXVgcZ6v@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
 <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
 <4EF1B72A-826A-4435-A586-B7E0EB2DCF84@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tNFcK0XXE5jlzrk"
Content-Disposition: inline
In-Reply-To: <4EF1B72A-826A-4435-A586-B7E0EB2DCF84@collabora.com>
X-Cookie: Well begun is half done.


--5tNFcK0XXE5jlzrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 01:10:52PM -0300, Daniel Almeida wrote:
> > On 14 May 2025, at 12:50, Mark Brown <broonie@kernel.org> wrote:

> >> Hmm, so a `struct regulator` might already be enabled and calling
> >> `regulator_enable` doesn't do anything?

> > It takes a reference to the regulator.  This may or may not result in a
> > change in an underlying physical regulator.

> I assume these are two different reference counts, right? One for
> regulator_get()/regulator_put(), and one for
> regulator_enable()/regulator_disable().

> Looking at regulator_dev, I can see both "use_count" and "open_count" for
> example.

Yes, there are separate counts for gets and enables.

--5tNFcK0XXE5jlzrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglo6MACgkQJNaLcl1U
h9D1Cwf/T/AtpAdruFmQVXLbKGny0TzH/ysi006l6eAn0eaPS+gtSKozhTu+y28w
uWNqektDXR/6LaKpF2MwxS2+ftYqg/fp5jx9WcXIEFaxrN9dqPXFatLCuFFMV3bG
1f+Ep06VONie7Ghe9+yip3hiU4KWI+Ogh//+2QrvEsi5vyU64q3ITYtk6zY7faL+
WPAQsEGz/G0e6K2aQwZtWbRS/Yh2LcjPRWuTk4fOXLCcS3+Z95oul67Z6rmlgBcW
jQ03ZNgYBPWttosKSZ/WJ8n0qsEdVQYBLG6dFAgIOOAW5UfDaervDENkzGESNAFL
Uzx1ZLsKoVIuw+IMlXLtg0tZ1HIowg==
=sJ+h
-----END PGP SIGNATURE-----

--5tNFcK0XXE5jlzrk--
