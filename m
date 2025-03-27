Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD891531E1;
	Thu, 27 Mar 2025 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088024; cv=none; b=ib9g9asQeS8HfyKKX1HTPta0PUey2ZDTXojzuKQuX2dX/SpAgZPJkocLYuuFdFAhqCd4jPHG+viUNWIK5z3EOOvMm72KwAlP8SFFgg+IXPVr9aqufSMlpHap1xixRdKao1J6vOxbVT3oK3nx4tvMYo40HNqmQOWn3g2hYqG/pWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088024; c=relaxed/simple;
	bh=x2reJLSWX+cp6sO7ytQo1ksI0rQfspbr+6o7HOUNB40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltjHEKoVNGdq91HySTTVCvo7oRxli4iTJKvNJt2yeVspI6LrQ53KEEXkeq9MYDtMU3akCDC/aj5MSUeS1IEx328fECUQhJFYa9Gn4CFLaUyxzfN2dl8x0AEUsJ+cd92KeELPCZ2UrRRVfEp+hiIjqtT75iUDpAE6yRyuyFRtdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvPjxZ4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvPjxZ4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FF8C4CEED;
	Thu, 27 Mar 2025 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743088023;
	bh=x2reJLSWX+cp6sO7ytQo1ksI0rQfspbr+6o7HOUNB40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvPjxZ4WPE8fn4uMNzBS71aFmbc+E0akaCOweiWDtj4B4BSxvhFNBP/GUJsF7K0Bc
	 5bBfuZAu7/OYvPgg+fOVoNgfR11+PXaOmO0cVPzebKJT+uPqusteAaH4SbzKcG1sAi
	 EJcZbptYF416kPlpzl3DVa9i+ER1anCEfGDcwvmKQ40+s8+iv+z1D+5Q5MzzZJNDuk
	 RZnb96mnSrgSQwiyceQy8KBeCbE607nxE9iJgFESF9Pm1WBpXE/1nyjXvlJJxVGC4k
	 S5MxjmI2VwxLq2P3Y6J8rwrR2X2W6QCQlGX9nE0WI4/qED9Zcpiiccoysu/Tttr0DN
	 8ymAAsDMMmcpw==
Date: Thu, 27 Mar 2025 15:06:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <93581b77-7126-4d93-bc65-e1bc24f1ba77@sirena.org.uk>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <opip2gbm6tpjqnx4hqk4mghbkhv7egexeqs5ukfn7oz3mm7nev@y7qffwz5ckdz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8amVInRnHjhg5JCD"
Content-Disposition: inline
In-Reply-To: <opip2gbm6tpjqnx4hqk4mghbkhv7egexeqs5ukfn7oz3mm7nev@y7qffwz5ckdz>
X-Cookie: Multics is security spelled sideways.


--8amVInRnHjhg5JCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 27, 2025 at 02:46:30PM +0100, Sebastian Reichel wrote:
> On Wed, Mar 26, 2025 at 03:39:33PM -0300, Daniel Almeida wrote:

> > +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> > +        // SAFETY: It is safe to call `regulator_get()`, on a device pointer
> > +        // received from the C code.
> > +        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;

> I think it's worth discussing using regulator_get() VS
> regulator_get_optional(). We somehow ended up with the C regulator
> API being more or less orthogonal to other in-kernel C APIs (clocks,
> gpio, reset, LED) with the _optional suffixed version returning
> -ENODEV for a missing regulator (and thus needing explicit handling)
> and the normal version creating a dummy regulator (and a warning).

regulator was first here...

> Considering the Rust API is new, it would be possible to let the
> Rust get() function call regulator_get_optional() instead and then
> introduce something like get_or_dummy() to call the normal
> regulator_get() C function.

> I see reasons in favor and against this. I just want to make sure it
> has been considered before the API is being used, which makes it a
> lot harder to change.

Unless rust somehow magically allows devices to work without power this
would just be broken.

--8amVInRnHjhg5JCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmflaZAACgkQJNaLcl1U
h9DDaAf+J6/JAUsghoQCNC12ESMZbImBjWXjl+SJNvREj/BjI2u5hMzpJDz+EKOT
/X4JXo4rlL0g3o2y27JH4KyCRp39gVEOT2um6VgPcUnBgZSgdrO5pt3LpBTXUhvr
FgkBvrs9a+sRuOSZ3tqwK/uaStKS99ZV1dMgVyZPz3hCPSHJjclQ4eOgxxg/qRTR
DBCGUV93I4n1vlU4ur2C64C5hiojeXdtqBejJ1z8eHzzfkFqPa5iSlNPFPo3ynZZ
jOwM31Kn83EiVOe4L61gwHXd7CNZLGD9UPk0SaSiHFi7JlWjuYwrkZGdlhtoXyew
Hyv+QotIRtURu9fyoHIglt24g+4t8g==
=Z0Ik
-----END PGP SIGNATURE-----

--8amVInRnHjhg5JCD--
