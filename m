Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F81D79BE;
	Sun, 18 May 2025 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570671; cv=none; b=cc1azdUxMzf6hLUI2wrIi+1WB5Pvf+6SgpDcI1GbriuXaz/0hYuVl55D0vTpKYlXA3x/fafdFNlCTCMTB8Gimm2FaDYw9oncHKEsgApNizKk7clT9CadJrzoxtoWXO32LjqWaOx+WR7pbXIL79RF2+h7FWBVgZHlyJwhoMKd5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570671; c=relaxed/simple;
	bh=qRqEMjCS/5nwHP3iOK2qM2VlypMZTUXXI4Qr8RsEkQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljJe4NC3a/w1roxJXQGo29IK9R7kxc/dXE6B9PXR8Xv1fF+5IviNU+pndVbkdT3HPxkrFUZEoBDFZk5WoiBJjcAYjha3ckOaYo0R8MzvJ/Gl1fo1S5S5OWIsroOhQVSRY10+JQAdrpM3LUs6p9E7m9Xu/j+Wj+BAc3eOfQQYzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aq2Ze2bP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aq2Ze2bP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049C6C4CEE7;
	Sun, 18 May 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747570670;
	bh=qRqEMjCS/5nwHP3iOK2qM2VlypMZTUXXI4Qr8RsEkQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aq2Ze2bPRkgNX7YCXRuG29Zt0lbTfgdmEyoMcs9YgNE0gOzLNF9Fx9hL1lDTxuxpJ
	 g7N9ePbcsH9YC+Kv4Evrw6aG5vXvZCpCCk5Evj8E36WIwKX+2ufa3u5zZKVkcwSW+k
	 Bap6LJL1OY0tqL9arusHpeD7HkbreGC1HImH/mZHYi5WGS5bkycnA5oFXFhSeZ3U85
	 wxowY1U12wBcgXPbZ4jbVwKeowZrHSolv+ZUOBDE1+R2GmxgeYD3OWz+U047/BW4JF
	 Le/E7CzLLG8WH3VGWjbRvty6p6Ne03arzINzljL3pNrMVmazouGMMVOGTtzhws6ggT
	 7SgVXrgyyRInQ==
Date: Sun, 18 May 2025 13:17:45 +0100
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
Message-ID: <aCnP6QNDzCUUjplk@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yy5eHZ9GGsovGg5S"
Content-Disposition: inline
In-Reply-To: <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
X-Cookie: Well begun is half done.


--yy5eHZ9GGsovGg5S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 18, 2025 at 11:28:01AM +0900, Alexandre Courbot wrote:

> Alongside the `Enabled` and `Disabled` states, there would be a third
> state (`Dynamic`?) in which the regulator could either be enabled or
> disabled. This `Dynamic` state is the only one providing `enable` and
> `disable` methods (as well as `is_enabled`) to change its operational
> state without affecting its type.

Note that checking is_enabled() is a red flag, it's only there for
bootstrapping purposes as drivers are probing where there's some
different sequence might be needed - the use cases are quite limited,
most drivers shold just enable the regulator and initialise the
device.

--yy5eHZ9GGsovGg5S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgpz+kACgkQJNaLcl1U
h9DF+gf/TVClygl+BDj4B4tT1e8KwZkYd2ocZklLT273lJeHqA7LFayXjQggEfD3
5/rIHZAtyfD87yPKMTToMaSrdGBnBfjCZsO6txpTWWzgSuCAzimH90IuDOROOFhq
WX0Y1LeWaBLhZzbnMgOuy+tbNZ2ljm/8dGhhIQh3kbOwwWr+0S0nLQneK+0Vq9+I
cb+zJ+kxP+Aq2vGaoqvXV3kvQ0jNSRyXBY1b07yosiPDHg1osJIvycv3rJOeGZP8
ykymzFQetABgBBBLJI1cl3VUapglDrrmMPhjgnnr6wBSgyRBqspe52lGdZOcS+bX
siiuaXJSZEC+qMw9PhoEotIb6jfJfQ==
=vGWf
-----END PGP SIGNATURE-----

--yy5eHZ9GGsovGg5S--
