Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F86D202990;
	Wed, 14 May 2025 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226923; cv=none; b=MvorQac2it+Eb2uFxxq9Ew/EC4dEeNgJi1Kn2FyYtFSXEH7Z+lAtDvRnXITgnN53L4FEC4h/hShqbo1PQtSvGXi8V5uJPCzd7eueJW2YnM07hl5F1wOvjC1tFjknEMA5W/hVzFvJY7DMLJngtphukp8Y9cUQAMmRBdSjkkv/eFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226923; c=relaxed/simple;
	bh=+TzFHFe0qJMx5mw0cAJgDn8UO6/adeXTHJer83ShHSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrpKQrkwi/MoLfAFSuDI7UbEqikVYC4jTDktpmi3+oV+8JqjqhIYwrdUJ1wcV5o62IorBH8Prmh6xkC38mkYIvTlZhA06IGBjNuGHGH8qJn4ExHDc4+70MM8bu2BhbrLhcvgahcQC6x00Zxv/oUPR5UfV8O8PpwFh04RNq+nN1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p82HrRJe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p82HrRJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C6C4CEE9;
	Wed, 14 May 2025 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747226922;
	bh=+TzFHFe0qJMx5mw0cAJgDn8UO6/adeXTHJer83ShHSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p82HrRJeyLpNNB9i/i9altOoEdRFOaTIod9bZC9qgw39Cc2sTBiFzc1ScHDtcU2AO
	 yjHT2O4BYQkzmnWZ/d30AINiMNkUVwqASIqXZNF1lQh6+/QcD9nGHGtawsDVBsIn87
	 yhpaCVB3VmrvRtDmUCbbtwm80lG1FPtgECxgR6hgUvEVVDfeYLzln1r1trcrJUAPMA
	 cXnlInGr9PY5lJEaEXDmGLUbpHU/qCaBiR9nJ4xrmWo5GNwuh0j2XFpH971XlSLC7F
	 nB/pEvuBYa09XWQ1qmKOB3ZN5zRh7H9J3XI+Go1VLapLnmloAMhMe47vwnSVmcuoyX
	 4kx/YbjIwepxg==
Date: Wed, 14 May 2025 14:48:38 +0200
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
Message-ID: <aCSRJnKu3-igA2PK@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>
 <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
 <aCRti2d5x2bL0mj6@finisterre.sirena.org.uk>
 <D9VTC578EVTH.2HFJ9TNPFW8NQ@kernel.org>
 <aCSDnjxVENpimTyf@finisterre.sirena.org.uk>
 <D9VVPGM147GP.3V338KUZGRQ6D@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MAQKhxvsN9di15OB"
Content-Disposition: inline
In-Reply-To: <D9VVPGM147GP.3V338KUZGRQ6D@kernel.org>
X-Cookie: Well begun is half done.


--MAQKhxvsN9di15OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 02:23:04PM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 1:50 PM CEST, Mark Brown wrote:

> > In the C API the disable operation just fails and it's treated as though
> > you hadn't done anything from a refcounting point of view.

> But if it succeeds it takes ownership? The function `regulator_disable`
> is also used in the `Drop` impl of the `EnabledRegulator`, so it better
> give up the refcount, otherwise we would leak it.

I can't understand what you are saying at all, sorry.  What does "take
ownership" mean, and what is the "it" here?  We are talking about the
case where regulator_disable() fails here, that means it didn't do what
it was asked to do.

--MAQKhxvsN9di15OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkkSUACgkQJNaLcl1U
h9AbCAf+JDgxG+eMT6GWzObSNk/49wLjU8w1oZgaMIKQlJNrgbR+INIAM0IG1K4r
OFaplfJbZLG0dGHHHGCVD/GOuMT+g5V3067D8h5XG99ydVjzAity0ddH7cyxX33r
11mxCAZXN4YupDyBR1+UDcG/WtP+I5aRgk9QhVASVnz+rg90U28k0mpPbQ/4P1Be
oc2bxfa8sGjDWU2uFcaTPUhhGBp5KIeTAJzOUfLzOMyiA2z5V96k70rdFLVjEYmv
U48/fM/P6nvLw/I7sbXGfoigiqi+HywkN6gegWe7XuZxuKs2XNNzv/FGiubVOqbK
1DIDEhiVDy/QEiTe/OfO30jxq5FGDA==
=ZMYb
-----END PGP SIGNATURE-----

--MAQKhxvsN9di15OB--
