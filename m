Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA2C8F6F;
	Sun, 18 May 2025 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570856; cv=none; b=tZuEY63n20NEN4AcQUksKydN0Rl/Qp7Kors4L/gBLhnGWVLmWAYJdw3r6A0zZAOCEm5L60wn/BwOAwR7bCwzKuUCuR68NNG4/bOuargYYMsWE1tdO3OqL0zNhQmVnc9MBqwE5bFZA+LO8hOCV8XEgQUC/M5qBktfdcY79PSVwjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570856; c=relaxed/simple;
	bh=UyKpUKddEJ+oERKRxQKR8VkjAd9wR35tSb4T9lHOyRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1AZBgJT6FoziweRLVE89mm+WgKmT1d0i7klgOgV+C80VO89sdjUTp47d8is9gTMmCK4J0mHf2QPIXid/7G+TH633aCjhQydku5+QpkmCIFsYW8wf88sLURJLMDkWVW5kxY1aNFJT6gLOj7ognJuTpkYuuG5bzmei4o/CZ6BFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSASnRZN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSASnRZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04DCC4CEE7;
	Sun, 18 May 2025 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747570856;
	bh=UyKpUKddEJ+oERKRxQKR8VkjAd9wR35tSb4T9lHOyRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSASnRZN7KCsCUC00c6c0rWlPJBbTAM3gb9IH8/Ac6KygBwlOScVM8IhzQELJIx80
	 enqkSoD2fxrMODmwwONG7HkYgnF60CPcYax577FF6Jd/AiCQWePs2QavQPwDrLeajD
	 ixcnK3vX41WYCxgCMMbTUvUBfddYjJViSzziCrehZF+DVqGXJzfQH3sS0xbP5To7vH
	 odRXzYLO6PpZT8vAYXvk1gDI6VKhO7erU0Xbqsc/UmbpCXbXIPxyTLC1POyPChK4mb
	 T/XS3ce/6iax1rINSQ8qSVbGaOdt39guNM0uFh1TKruNA+1sjW8E+0Dv9+bTue3Vgf
	 ZXy/QYX3kVnVQ==
Date: Sun, 18 May 2025 13:20:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>,
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
Message-ID: <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HKgl7rMaCFFVN8U+"
Content-Disposition: inline
In-Reply-To: <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
X-Cookie: Well begun is half done.


--HKgl7rMaCFFVN8U+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 18, 2025 at 05:14:41PM +0900, Alexandre Courbot wrote:

> The initial proposal does such clamping by design, but I also suspect
> the C API behave like it does for good reasons (which I am not familiar
> enough to be aware of unfortunately).

It's so that if you have multiple logical users within the device (eg,
an interrupt handler and code for normal operation) they can work
independently of each other.  You could also request the regulator
multiple times but that's often not idiomatic.

Originally we didn't actually refcount within the individual consumers
at all and only refcounted on the underlying regulator, the per consumer
reference count is mainly there for debugging purposes.

--HKgl7rMaCFFVN8U+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgp0KIACgkQJNaLcl1U
h9DtTAf+I7xFJSBlZdGeJRs8jk8voYXmUv1iHu1GZqT03SFqSsF/8MXYcSQHXbob
WnCas2orqehi6+Q61y2AY//KGahu2jMvpH3gK2wePgj5puz6J8ibv+xNilh0sFwp
RstLRnjbEdDL4s+4TDlOsiTfgtfmRSjcUs5LwdU13bgQFlo52ZXcx4JFo4xaOd5F
HhrKwbUBkoWp5o05Nt+BxFOkRZNlBoRDk76UVLxBAgdE0KDyjiimZkQH2GVY6mgE
NlwEqwfk988J7b65YlUfVr5rUPKfOu/I9bG8atArWpjDWo0U5qVUhZ23Hw46usV/
Mbyflg7A4T82UryOP8avLIuIIIFN0g==
=oLfx
-----END PGP SIGNATURE-----

--HKgl7rMaCFFVN8U+--
