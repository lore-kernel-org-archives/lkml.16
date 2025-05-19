Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617AF26C38A;
	Mon, 19 May 2025 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648506; cv=none; b=I/VDY+fNeBwaRljf4ZaItdVj8bxQXtaqWxzoVyqTvvc1rGTPonyqce8xOTmVkCwISc9AFVAFqIrER1qqU0z/DEMS+Q94naVSec9sFVFwR6pm2l5hVri9pFIUHS7m7IDXLlMHmLLFkVccr9PUW2IPA6BVI2qsUwazk10u4wal2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648506; c=relaxed/simple;
	bh=/FQqZ10ZgU+2P7qX7bdQeJsMsvRz6mGQibQYFrg5EI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fglo+1AfsAv3y51PnIx5RfVYeEWVIqMGPBl57zxd/wRU5AhgJl6tiRkNVdktv6lOahRmtv4WfOBnLx8orMPM/I0QhcRGMZ77u049InM9Fw9dHJMCLzmbr2GebcdNSR3Yi5BD/sur3klYcG+DsFkSYc5C+ms28OlyZcOjyjU3LLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXeRA9oM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXeRA9oM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02CFC4CEE4;
	Mon, 19 May 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648506;
	bh=/FQqZ10ZgU+2P7qX7bdQeJsMsvRz6mGQibQYFrg5EI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXeRA9oMI0esb2PbHOtABMIFrzyMxsjhrVJxs3zECjBnvalfU5Rl891ImzhjY50GL
	 6WhpR27YtoHrHjfzwQQrilS+dQPAK2Sj4mJE0Xtu/79ypN08dL3Ovvww2UOycuAYkY
	 iujgaFXYtQ7+5wggkwy2QLNc2TNyfkROZlyx6MAvp+R54V0cE74v5sU4O4v6GXFAwP
	 ocBTlCAwgJc2I6uuyzUAiKs22IP9Xn38pZPTd75bdighMnDQr+ucrIYjpN7tTYuXK6
	 Hj4c8fEiFtA6dYC8RI4ugLuZe9g4Zgzo6iL0aTx05JbYvnqJxjLrKF1hIUzeNPduFd
	 azjCBO3C/ekLA==
Date: Mon, 19 May 2025 10:55:00 +0100
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
Message-ID: <95ae81a3-4800-4598-a910-31c27d543b06@sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
 <D9ZATG8GW7VO.3CE92MUKXU65Q@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mTBjc+BQINn/dqrn"
Content-Disposition: inline
In-Reply-To: <D9ZATG8GW7VO.3CE92MUKXU65Q@nvidia.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--mTBjc+BQINn/dqrn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 18, 2025 at 09:51:33PM +0900, Alexandre Courbot wrote:
> On Sun May 18, 2025 at 9:20 PM JST, Mark Brown wrote:

> > It's so that if you have multiple logical users within the device (eg,
> > an interrupt handler and code for normal operation) they can work
> > independently of each other.  You could also request the regulator
> > multiple times but that's often not idiomatic.

> I guess this means that we want to preserve this use-case with Rust as
> well?

Perhaps.  It might be that the multiple requests approach is more
idiomatic in rust than it is un C.

--mTBjc+BQINn/dqrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgq//MACgkQJNaLcl1U
h9CKoAf/flSbL/qnzPHqhbIdNUKRs5Vl5f3D0ZZQTgS0vz1EJJjojGI0b7RdtCur
SldQwJ/Fjc8Bj6FBUU5kA39dKS+b3ySUBJruhPwd3T9u5tQqaUym4jME4L9CJc/8
BztHbn8XtaCDFC7CMQ/lkTlWUe+xe94O/6KyzTIi68pmnVs4aQ/TFpGf/hs7WqV8
dFYuJ/txzp80S3odK8AbFtvERJxGaWpYDhP2cCoZNgKWGZB1i6MuRUkU/AHTJgU9
N2pq/Cissbmo6LxzdomWvzqCfv14RT05VGDK0rCyjUcT4MU9n5paP4pvJjWoI7iq
IR7hZb0RdZ99AdspcDLWuCmq5IzNZA==
=FD/f
-----END PGP SIGNATURE-----

--mTBjc+BQINn/dqrn--
