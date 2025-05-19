Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08E1373;
	Mon, 19 May 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648619; cv=none; b=fqMNQzRYHWyniy56yxVl40BZZN9FzvXge4nNBG3cvolT+g56PUt+/0zzgmcXsKeRlD7lo3TH53qNtyR7a9jMRzPvDgqRYSZARPz9bkUIL1NmqKtFo5puQCb0i5MUTig0WUQmXAAhLs1zLrTWkBOGuNVaU7mACMzFBY6bt73lgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648619; c=relaxed/simple;
	bh=pg3qEe7mu5NKTwZC9ZZ9ghJjhuiODRp6zXIMcY1mVdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9qjAJnmSxsWN5t/wznR0UFAcz7UZsJRp7GO69rImy+AHX/jvTbpkiu9e3EY2WD3FS1zaEXaapLMHQgC8OzAGxa2plKMZODwSuFuWSNStO6EGM5JHdHjFeYfkWd0zs4Gzc9Y0luyddHB5TFvZCNUnq1uNtuCnMVubJU/RVaYjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV0C0XEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV0C0XEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9392C4CEE4;
	Mon, 19 May 2025 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648619;
	bh=pg3qEe7mu5NKTwZC9ZZ9ghJjhuiODRp6zXIMcY1mVdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oV0C0XEP8EdYIlUY/ofFJ918rQY+5SIBmUfEhr5wAsbTzg15qzOsi+HEKf8iF8JDd
	 1Za2hOrdh5VGi8wa5EkC2qLtOnY6h6mTzBA/t2e5Wv0bbS8rpk/OjDbAvoORyQbdxm
	 ey0AUGD2hlwhE1WLV2AzZnBWkfynQWm8rhYz8rsXJTEDrjqYyLMVWd+Mip5qEIeq71
	 gyBPpkczj3+bUXDCOXr41cipUuYuVZ5wHtC6XN7FLR9YKfSdT9bu0HtOBZdxCq6c1J
	 0xaQMcZeY8nrZ2kHyldFKyXCO5MZoukmkrkUfDVhhpebMZxLwPZIf/W6w/M9EOclPD
	 TvZmgFW0YUFEg==
Date: Mon, 19 May 2025 10:56:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <a1a6b2f8-af42-4942-ab62-678e37381d08@sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
 <D9ZCD8D6J5QW.14H6VM9LQ5R2Z@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Abso7yGLCqB1s/Kg"
Content-Disposition: inline
In-Reply-To: <D9ZCD8D6J5QW.14H6VM9LQ5R2Z@kernel.org>
X-Cookie: We have ears, earther...FOUR OF THEM!


--Abso7yGLCqB1s/Kg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 18, 2025 at 04:04:24PM +0200, Benno Lossin wrote:

> I'm not sure if I understand correctly, so I'll just try to echo it and
> see if it's correct :)

> The `enable`/`disable` functions change a refcount on the underlying
> regulator that tracks if the regulator actually is enabled/disabled.
> Asking the hardware to enable or disable a regulator can fail, but if we
> already know that it is enabled, only the refcount is incremented.

Yes.

>     It's okay to leak this enabled-refcount, since when the regulators
> actual refcount (so the one adjusted by `_get` & `_put`) hits zero, we
> can also disable the regulator. So the enabled-refcount is essentially a
> weak refcount that only does something while the regulator exists.

No.  You should not leak any refcount, the per consumer refcount
duplicates what's being done for the regulator as a whole, one should
never be incremented or decremented without the other (but there may be
multiple consumers to choose from).

--Abso7yGLCqB1s/Kg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrAGEACgkQJNaLcl1U
h9DSPwf6A4tOzyIKBgmJbDqG1Af9/Im1pOfuv4PSHWiGzP0DhjNs92Utn3RXdh+K
9KJDgdZDy+a43hWxZtE6Q9GEriWfbLL7Crjyis9dHLZjHWbOUlxd0NRreXMcHDoL
iXy5X03g5O8Gkw+UCdE42aOts+49gWjz1L453KA2VF2jhmGZHhULozw5aAltqfCe
k7kdqd8ENs53i2RZZiDf+VZmkazw/eoiF+lADsS9GaTE1ff+hnXAe3XqCkps3ctO
O6KDeFcFN+1OexN/KaOg+zavHAjeCG43KOeWgB7Q7eFYWfOw0AbAvbX4cmpFNJ6R
3XuxnRfjf7eA/0YL4w0p+/5OlzC28w==
=zMuN
-----END PGP SIGNATURE-----

--Abso7yGLCqB1s/Kg--
