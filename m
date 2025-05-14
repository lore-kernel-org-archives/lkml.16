Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601F282ED;
	Wed, 14 May 2025 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237851; cv=none; b=hlAFfV2juk/vlp+OmY42Nt6CccLwXgLL09ylvsAKKcuOawRaHeGVcOTAPoJrLqCOZGp4+P77uH/VXswwRmphx5VFa4Ui7FMXSSXpFWSKbbOeVnZrbYrScU0BomW+26P3Ctz/8PJXzIIAGHILyhUsyXtkLAleLxu7ZWu5UR9iZls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237851; c=relaxed/simple;
	bh=KYcDtelwc+CQhffPMVw7iv8P+rH8uAeIxnknCg0hfjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wuu3xcb8ivUdfObcvlbLlBlRAamaiyqH3U/bKAYqitla+Qq+PpDB/f0LyXHOCRgIf3Fi+ta8ckJ13pbsnqvKY/VfHeloUDRnBaaBWmM6gu3HudstqsobJsBkqqnoTmp2lbNhiyjvRpZmnkb1FA+R6ye7EM5fEvwIO9yyDGtJCRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLrafxgV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLrafxgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE800C4CEE3;
	Wed, 14 May 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237850;
	bh=KYcDtelwc+CQhffPMVw7iv8P+rH8uAeIxnknCg0hfjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLrafxgV6GzrNiib24vzEJkseU++71XKHooh2UjpdDPq3ctaMbW7nqeQfg84NjTi3
	 tkb/Non8CtO7n34xE9ddB4DzD9C54g4G8NQC6coIruWeYHVII58656z1fE6kofmmh8
	 OF/VVcP0UnxchE5nFJM6VG6AWdPScJN8/sO3sqoNFo8VVIBTR3gis+i6ZLL6jDkUso
	 6xtDyB/JwPqhtjUqEPZJW+KhXSM7momvCoxHbakF6rAhKq8QlAoMib7B7kTipt1rL5
	 sz2BH9CEzfKtUfk/1ivsWrh/q+CRZTPosVJC7FeuK0AP2eYdsFIrrCTIySB0VTktTl
	 Vsc08h8ZkFzUQ==
Date: Wed, 14 May 2025 17:50:46 +0200
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
Message-ID: <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zn34bd8tAQ2Lmo08"
Content-Disposition: inline
In-Reply-To: <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
X-Cookie: Well begun is half done.


--Zn34bd8tAQ2Lmo08
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 05:38:40PM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 4:40 PM CEST, Daniel Almeida wrote:

> > By the way, IIUC, regulator_disable() does not disable a regulator necessarily.
> > It just tells the system that you don't care about it being enabled anymore. It can
> > still remain on if there are other users.

> Hmm, so a `struct regulator` might already be enabled and calling
> `regulator_enable` doesn't do anything?

It takes a reference to the regulator.  This may or may not result in a
change in an underlying physical regulator.

--Zn34bd8tAQ2Lmo08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgku9UACgkQJNaLcl1U
h9Ci8wf9GqNo0Cri3dG3onMfDV5aJMf/mJ8NBJoFfqD9DH6rkCXK1qpO4ZCU9SGp
QSGWqxFbhPAg8lEOWRfVsqI4LHCIStgN1QYQwEcUeFFbB2p6id+aT762/fWioqQC
ilg2DH6PYzflFhmGAwZ3eN0MHz38BOKbqYayL+ud0SkrutiRX2SFQK0VXC6j+rNY
i0KlUgFcYb21FYy1Hm0n5y4pdePWpgBKGYDyM7yDpGrtrCnOj3o7qOL0smbqV4bx
SWHNoKvWNGZgTDNHnNwiBVx4SOQnLEpbAh6qaiCGWeA5cEOSjBxgY9bmgOVeKGuu
0xOT4smNNj8sYGT5Y3ECOgEMtrxHPA==
=ZCvN
-----END PGP SIGNATURE-----

--Zn34bd8tAQ2Lmo08--
