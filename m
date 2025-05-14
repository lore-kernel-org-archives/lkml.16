Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B2171C9;
	Wed, 14 May 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211278; cv=none; b=aIU6Go3RngmU4NM5zsL6XUsOQgKOCz0VSTd9Biu+ZTHfcN+pKlAn29a8qkjCFKZr7LcF4naC/WQ0Q5jr1+ZtTlxNEQSRMQPb4LkiCX0e6zOZzEwdIOXFqeQ8fLkMsh94kZZHbXDnxzsgbqmCe0yW9bDT+PvWL+2xKxxAob4bp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211278; c=relaxed/simple;
	bh=8Zv0UFAoaukRSf4iAndUnXCe6GZ51x88VKQ7WQYC9L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBrCLQ2VzyQplj82UDaugXykKiuPpdZDYnOvLv8O4aL1RA7K4B0G54vSf0vgvu4EQtO1DxMsSnDPZ8frJyfvQGKBonnKvLayeq10mMfh/qlGBpZw6DMsxcZEMTF85TuHSCqHCbC67YDBTgCZK7ssePvtCWdR664m4fxAWukEuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uk3y1BYK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uk3y1BYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510A3C4CEE9;
	Wed, 14 May 2025 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211278;
	bh=8Zv0UFAoaukRSf4iAndUnXCe6GZ51x88VKQ7WQYC9L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uk3y1BYKYuONg++9dhhTM74lr1fBw+UZXQ7LSRM7LxNQCMphUosRkFJJOepIIUgPy
	 jS9suTsnuTeewso4BmTv/0GPRxqos3NkAFlS34U6Zu8whTm/3gaHzrIUHrtj01CmS0
	 j4NlsWo4HEk6IWb+wgJhJh8xV93Ix8y2zVa7Hzci1kUisDkWat+f7LEGQNvWCFfOW/
	 2bFglSz7PfKjzNl6FJwXePAkX4kzmX6MTNkCrSH9l6Kx59Gh7YI6JUHfYgXd3FawTx
	 n/KHbngyTKsG0GZHWZZyoaGgCnL4HRwuwVXyGnWBiv3ZBkgve6QBJBnP0x7wUQ0XyX
	 BIUX61wl1ZHoA==
Date: Wed, 14 May 2025 10:27:52 +0200
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
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <aCRUCIQtypqIS4Ra@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2H11X6Z9uQqYo2UY"
Content-Disposition: inline
In-Reply-To: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
X-Cookie: Well begun is half done.


--2H11X6Z9uQqYo2UY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:44:08PM -0300, Daniel Almeida wrote:
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>=20
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>=20
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.

Please also add the new file to the MAINTAINERS entry for the regulator
API, otherwise this looks fine from a regulator API point of view.

--2H11X6Z9uQqYo2UY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkVAcACgkQJNaLcl1U
h9CBtQf+LdvA9Pq3fw9YeJCwIkbFO+2Q1YgfdogGK1+wPKEziI6+ecmgTxHulGd6
mPSAMgE7H5MPyRbyJhI4mf/A95n8vNUQdg0OJTmlIAmo/19nSt1ZB2jILFJmDdmx
hNxL98bmYSD/YI1drzz3mfhpYUgtGY8HrO636pQYs7mhnAC+C62ElwnpAJ7QEUkA
9JOrXUu9S2JBSjhbWOII/5iJ1ysZ05tO6y5YFfAvqAoJoJFVTiGAyosWfZBXpUST
z98UD5w0/YEQkT+fEUqroTKODu1C8jDELhbybz8U83BPMHW9KXXaGsru2iWFD4aF
ycqcc7cd7jDSCToYvkpSX9ZcCV/Okg==
=dge/
-----END PGP SIGNATURE-----

--2H11X6Z9uQqYo2UY--
