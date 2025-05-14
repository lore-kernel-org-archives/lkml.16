Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99108BE5;
	Wed, 14 May 2025 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208783; cv=none; b=m7G93B5SwUgMMI4XCWhgc939ZMEJDFYuPpVwOwswLM69xphZvRsfmCyo3igXL8381m/UnDjVHbx8OARRmzM7I/XcIwxlG7cjlHcOciWMLBePJmV15Z+3GBwJdgvneYdrVTV0bL+5ek3RIKbWP9yzojI14CfefQCZbXOTLnPZ2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208783; c=relaxed/simple;
	bh=rfDQfgtv3xLeYnfs7pDKBNzlwIXZcCoWs6/XJvQhg+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMYIB3LtV3c4Sdl5u1QdD6c9uLixg0G5RMnXiIjlP+V16xhQL42LJBUMezQFlkk4xz5rE/Al6iSEiQOgoWS4KkgVpAKRXuuX1AyY49A9e9eSlKbPN4/Va08jiImp7s7eOU4eDeyuNQcBmypSEbljj/Qsbr1U5PwhaWYavwMkZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxAJRXBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxAJRXBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33944C4CEE9;
	Wed, 14 May 2025 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747208783;
	bh=rfDQfgtv3xLeYnfs7pDKBNzlwIXZcCoWs6/XJvQhg+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxAJRXBGytmEm8LbbJAC0qdi52fwr4EZNsd3lbsWO4psYT+bCsFkiotjqNp/eSLCg
	 jvThvNLFEUJwWrsi3TUeIfoYQg5QKW7ZP1gDmT0OdabirNXksPa4iktDojvJHvKOlf
	 dPCaEy9yiOIwPfH/eAY7i9UJ0VvWTFNLeljXvR7vAyQP/RggIWUHcz6PgDcyiStYP1
	 kMAEeoR4wcGBB79G5G0wYt5EPdAEmywQOpGQbHqxMyr4SvjZDn3GXAB5WSuJDs1/EZ
	 5A45qxxroFu0vpLKtLS+V4uZ1h2tI5AwWD02XVTkHKWfsJkSFnsojI9xaCk4g+b75a
	 sOReevnXTO4rg==
Date: Wed, 14 May 2025 09:46:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Benno Lossin <lossin@kernel.org>
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4y6Au4AFL2ezRFuH"
Content-Disposition: inline
In-Reply-To: <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
X-Cookie: Well begun is half done.


--4y6Au4AFL2ezRFuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 10:01:05PM +0200, Benno Lossin wrote:
> On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:

> > +/// A [`Regulator`] that is known to be enabled.
> > +///
> > +/// # Invariants
> > +///
> > +/// - [`EnabledRegulator`] is a valid regulator that has been enabled.

> This isn't fully clear what it's supposed to mean to me. Maybe mention
> the `regulator_enable` function?

I suspect this is adequately clear to someone with the domain specific
knowledge required to be using the API.

> > +impl EnabledRegulator {
> > +    fn as_ptr(&self) -> *mut bindings::regulator {
> > +        self.inner.inner.as_ptr()
> > +    }

> > +    /// Disables the regulator.
> > +    pub fn disable(self) -> Result<Regulator> {
> > +        // Keep the count on `regulator_get()`.
> > +        let regulator = ManuallyDrop::new(self);

> Why don't we drop the refcount if the `regulator_disable` call fails?

If you fail to disable the regulator then the underlying C code won't
drop it's reference count.

--4y6Au4AFL2ezRFuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkSkIACgkQJNaLcl1U
h9Dv4wgAgU+bBTBuz2E8M7b7LeWUq2wa2YcF7KyE61r+Z+bYmh+IyMaJB6iTN4wB
F2QquiKHdzjk/jPk0bB+GyTgnijp5vwgEIkKnwNr9uMS8uz0yNxtZ+1KqN5iivBX
/HAm3Oqeuy7spPKgnk7UwPFzvRRs+upt2aUTjrGlXWaWpS/E0ATQijQiAlviOnKR
n2YhWMn3NrqF1gtHDBvVs8jqaPq0xdxxRwgSFadcKQBAx9afJ+IHQWhYYjLFLQw3
MTy93QrUWCLEflSWcjlhbg9F4UikpZ4v9MQOqs5ShJpeDI9IAyxA+DbtzrB7ijd+
g1db6PPNnjYzyKQUZMegU3H5lUvP+Q==
=qFXf
-----END PGP SIGNATURE-----

--4y6Au4AFL2ezRFuH--
