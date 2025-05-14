Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F771D6DBF;
	Wed, 14 May 2025 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223459; cv=none; b=DgSSXTpZzAxPozPrN88Yu1wAKvN4y6J6MDRTOrAbJbYtNme+JOFeI6A/jhaUumz9bKuRGpbQtrx0EDbe/dNFu5zVg1ARD+PWZl5ja/XtCML58ajh+asmOzZB2Z6GFF1yR3Bsxh5t0D2tPyEB566gLeS2CPPv+c5u8Q1OOiJAfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223459; c=relaxed/simple;
	bh=bjnesNIKGMW8LXvTMiDQ7YqYCXpSIUpFqjIFOdH4h9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuIjNx7Uosb0myaU9nAehY/0et8Xa6ZffOaHFrjpuD/dHd74l6zifYza1dSPrVGoRYVC2UyuT3KAitIgd2zWZCcYGQXUZPud2OlE4WhSKnnXVaf7vrNtwTppFf9nXUIgM30Rl9DC/mzWZK2b1w8DYC6Yqni1/paPwlKUsh3RYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbuJLwtu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbuJLwtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F96CC4CEE9;
	Wed, 14 May 2025 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223458;
	bh=bjnesNIKGMW8LXvTMiDQ7YqYCXpSIUpFqjIFOdH4h9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QbuJLwtuvM5d83b0dgnmi073E9cpCi6ZHPewviamggWEzr9u0lIfvX/EndPFTPFx9
	 JrRsdhUq3gZ9b8jGXt74EHTEsXW5Lp+GtoshJGhxnNVh3u9P3CaPZ8Ebjdy6ORsV7c
	 W6dfG/WBXKBkaX+mLNuxdlCLFej8vxWUgDja07alNzT9LX4hkpQvEQcErsMJQGRcXs
	 RTkHKZLGDhinDkh1hyXsUbQdBZRwWFZ1tpTxU6fcajKzOy/Tg7f4uSCOLSo1NXRCiz
	 wHiEM8tWQ2vTzTdwjY3CySMDvfQs1wZLZlJngFtOOM0NN44MiyzMNYdlHI/x3KcH/X
	 dyN0bXi6IIpjQ==
Date: Wed, 14 May 2025 13:50:54 +0200
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
Message-ID: <aCSDnjxVENpimTyf@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>
 <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
 <aCRti2d5x2bL0mj6@finisterre.sirena.org.uk>
 <D9VTC578EVTH.2HFJ9TNPFW8NQ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Be6ir4uh/0vPNV6r"
Content-Disposition: inline
In-Reply-To: <D9VTC578EVTH.2HFJ9TNPFW8NQ@kernel.org>
X-Cookie: Well begun is half done.


--Be6ir4uh/0vPNV6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 12:31:38PM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 12:16 PM CEST, Mark Brown wrote:

> > Practically speaking if the regulator disable fails the system is having
> > an extremely bad time and the actual state of the regulator is not clear.
> > Users might want to try some attempt at retrying, one of which could
> > possibly succeed in future, but realistically if this happens there's
> > something fairly catastrophic going on.  Some critical users might want
> > to care and have a good idea what makes sense for them, but probably the
> > majority of users of the API aren't going to have a good strategy here.

> Makes sense. So does `regulator_disable` take ownership of the refcount?
> If yes, then just put that in the comment above the `ManuallyDrop` & in
> the `Drop` impl of `EnabledRegulator`.

In the C API the disable operation just fails and it's treated as though
you hadn't done anything from a refcounting point of view.

--Be6ir4uh/0vPNV6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkg54ACgkQJNaLcl1U
h9BuMwf/cVNojiSuufurFyShJsakDIqncWXfiMtmSGlObtYFi9acK4B3VoAdK2f5
Zv7oNJsejRXV61I5qEmtfFMpwosvABJ6WIevetFp5jiWzxv57x6WBMfJXZn+7xNG
qfJE9ruzPN6HpSDeIMv8WMroPrcVJLCKIzc9bgcux3PfYWl/VA69kFDSqUIIQrN6
g+4m+clGyzFW+V6kmwq3I4SJz18Bw5C8nbKnO1DPUSPSERE1oPEV/EQJzo0MTKsB
LVfHYibFSzW+Vw1c7+AEdyV0pnvgC9SlFztOmcLJnaJr771JL9cYpA2hJM8t2LQl
HTTKTzfmMLncBq5gMU52yCP7tGZAJw==
=WIZX
-----END PGP SIGNATURE-----

--Be6ir4uh/0vPNV6r--
