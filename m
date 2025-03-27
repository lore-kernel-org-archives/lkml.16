Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EB440C;
	Thu, 27 Mar 2025 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075129; cv=none; b=AlGwAJRnstwOl2PD1TIIda1Q/jtv5x4bi9aogDCOPHj3LHlLyig0LJO2Yqhr3OoOC5UYvF+6XF/B5IjvAqstb4MA063vbhFZO3w5LQPdYoUEPguzPH6MaI9iOL4Z91xstrhrd5N1MuDHDcYXb+xHm+b0JPj3/4YWlWXp5XLE2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075129; c=relaxed/simple;
	bh=XAQmSGPGcH9aB1wqp617XxDqcfh5oqFVkf0PMvmTdXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gORYOQWMGfGLv9iiO1l4L8hrHI6jfA7F8/IXnUzPXYDTfHVT0G7VtkeyX0A225zsYvLcra84C3QZOxajaFrE/23oj7vK0olv227HO+6Vscj40H9oRN4FzdwxZIRWXdGfJfP+7Rfw541ANzzdEPTAODOp3D7e8jbLIeMOE7mWrac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh1O7qM1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh1O7qM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC80C4CEDD;
	Thu, 27 Mar 2025 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743075129;
	bh=XAQmSGPGcH9aB1wqp617XxDqcfh5oqFVkf0PMvmTdXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uh1O7qM1Cv5KnelWc1Nsc47+nL6BNQOA+Mr6fhQMm234hBvR75gZDaZMgpwUO+wxy
	 fyLN1msb2wHDp78AztEbJH454/MHrgx+hseEgdq8/J4xEhpkmx6xBYxxtfbLAKRP7b
	 4sJPzcfcFNYCmc8H3nMMPl1juKf0gGP8ybYbUecyeFQndOIg74ZtyU2jTji2JprvK+
	 Pw6P2g28uCA+lWis/epQW/wTgN9/O0SS7JZwy6sZGmMCMj80PWCFvMUepj3pGvtpir
	 CqzoobQEjkMFv9bd9PQ15PwJToLTt/GgJvR762OckiNbEqvldHdlJFgkreBgRIHzIx
	 fuZuCLcxy1/uA==
Date: Thu, 27 Mar 2025 11:32:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <a98eb789-4c49-4607-ad15-76e260888d64@sirena.org.uk>
 <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FKjPZJMp6SZBcqWd"
Content-Disposition: inline
In-Reply-To: <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
X-Cookie: Multics is security spelled sideways.


--FKjPZJMp6SZBcqWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 26, 2025 at 04:49:26PM -0300, Daniel Almeida wrote:
> > On 26 Mar 2025, at 15:56, Mark Brown <broonie@kernel.org> wrote:

> >> +    /// Disables the regulator.
> >> +    pub fn disable(self) -> Result<Regulator> {
> >> +        // Keep the count on `regulator_get()`.
> >> +        let regulator = ManuallyDrop::new(self);

> > This looks like user code could manually call it which feels like asking
> > for trouble?

> Yes, user code can call this. My understanding is that drivers may want to
> disable the regulator at runtime, possibly to save power when the device is
> idle?

> What trouble are you referring to?

My understanding was that the enable was done by transforming a
Regulator into an EnabledRegulator but if you can explicitly call
disable() on an EnabledRegulator without destroying it then you've got
an EnabledRegulator which isn't actually enabled.  Perhaps it's not
clear to me how the API should work?

--FKjPZJMp6SZBcqWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmflNzIACgkQJNaLcl1U
h9DMggf/b4lbWi031tbHHABWyBD5XIojue2XPe9oALWUHqXLWbUApO8S1OZa8hLF
JkbE33EdHqiiFtad//64e72p72zezakjJBV46I9pZl5V6Crgd2T6wd4n61YDQ0ye
aYXPcDZyCC5W5d9GPcfhiRfgrw5zZ70FPoVZEPViIAZQdDK7M9kJh7BT4sayQvPv
N+DHwTovsyv2c5I9YHfKkGgXE7pqQw477J+25zdjFc4NqF269b69xz8APiA5YxZJ
7VJ2dSSN7RRkCmFo4TcfSosIBfFinBDPybU/71P+hzYGTzb5/aNmRyxKDctAfTEy
COJ6nJ+EUdZ5aFPrbNRmDVcJL789KA==
=mC8Y
-----END PGP SIGNATURE-----

--FKjPZJMp6SZBcqWd--
