Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5A1E7C23;
	Mon, 19 May 2025 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648461; cv=none; b=PWYkJycBcns8EB5NRSmPm3f37rAKBV7aOs6G4/UL7OMgRVu15tfx56g6swGVcbKXBvpjzQwQ2moFmcdfzsLi/tYMupdbhI/Ex0FHdEt8iFGl9tjKHE6XVMazEItlO+M8/JtPkRC+6Z1CQ626sTPdh5++R6D6f+N7a5Ag0Sjr2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648461; c=relaxed/simple;
	bh=DFFOAzVD86oBuWB8xD83Nl7jY0fzFKtlxQNJuDGQT20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYOBiSQ8jT85JE8IEPndx00yCpaB3vpTUy0lwUOnBAQPFMLeQd4t5wnu65ngzgvHGNionx4RuuSu/qqq/vlaGfDCy2fRAyjYCjiTOXDX6HW4e4nBb77FEyKfElu7HfMJIjfeiXpOS+VWejRui2kHyXk+E9RipCXetFvZ58hR//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qdj2cK8L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qdj2cK8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D2AC4CEEB;
	Mon, 19 May 2025 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648457;
	bh=DFFOAzVD86oBuWB8xD83Nl7jY0fzFKtlxQNJuDGQT20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qdj2cK8LJBEz8MGniiTT1hxuTTKh5wCbloWkc1xwjzZhoN6u+sHt+bPYh9rrmbH2m
	 0UIgpunv/MNugV3AcHBwLyWECFxMUO7KYQPXG86Vw8zEeAW7mcyQe3Xs3VZSbJbUOE
	 P/iUwZRKruLmkN16ilfHdp0rnbc7CQ87aopBnnQ9wKOrnHSYgBGHEWibrBRsqR6kpK
	 TRyXf8j1gsMw6qnYmoTwRWEtfxhMJwaFHrjpjqsO/4XpUDlcaDBk1/hcQ84lRg9OYG
	 9MC4SJ6Bbe94NJs7z2N6U91SSx99sqWr+7rfgeBcSupERXxUzdcaPzAVM52eZffm28
	 50HhYJ0ygmLiw==
Date: Mon, 19 May 2025 10:54:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
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
Message-ID: <9cb3fe58-de4c-4481-a36f-673d85dc0ecd@sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <aCnP6QNDzCUUjplk@finisterre.sirena.org.uk>
 <D9ZARI7RQWFF.459GMJWNQ6FJ@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U9Opw1V5NbdahB53"
Content-Disposition: inline
In-Reply-To: <D9ZARI7RQWFF.459GMJWNQ6FJ@nvidia.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--U9Opw1V5NbdahB53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 18, 2025 at 09:49:00PM +0900, Alexandre Courbot wrote:

> What things that are possible with the C API do you think should *not*
> ever be done? That's typically around these kind of restrictions that
> Rust abstractions should be designed, so you cannot end up in any
> undesired state no matter what sequence of methods you call.

There's nothing that should *never* be used, but there's a bunch of
things like _is_enabled() and _get_optional() where the uses are
specialist and people are far too enthusiastic about using them.

--U9Opw1V5NbdahB53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgq/8EACgkQJNaLcl1U
h9Cl1Af/bZ47GBacVp3rA0OCc3pnL6FoSOq5YE/JWF5vh/pozuxWEQ/seVxUmy8O
OfWcFVqrEskcg8CSCIbWnhPTVmU2nlrkGRo+RLCKcgIAsqkthFLCuD8UVLTia+uq
1wkaTdrmjCZi8Kx5mT1Oyb87FZrkUqF3aYuAu7GAgD4xNT8cRDm2WyosypJYIBdC
+VMzfSFnA9LyRzkyWf1vP4MeLbmC0KhL1sVQysbc8eqwqmj99yKsfnfEmqWOzbNh
P+KKbcd/xx7abp6tOtroAfvGxDHHQAVRoVTLt+zlxzuUeKHVD8iVgMHQGI5IC47h
czv3mC2q4xTMxNDK5eqhL1bmKmraGg==
=eO59
-----END PGP SIGNATURE-----

--U9Opw1V5NbdahB53--
