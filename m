Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651720FAB1;
	Mon, 19 May 2025 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655214; cv=none; b=Bre41J3bkSbCp7u5RYhgkUKYVYd+SBPCfxlg0cyHzmDKsbdWRadypMgbCWympjYEPVtHjaxgBoY9S3GFii3bo9sJc2uTc8yDnlESWvC8eF5jqciMhxGOJ6rMkdkVKhNY8e9c2LMmzN78sl4NsN0Wb56q49lgdcVN63s9BrzaXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655214; c=relaxed/simple;
	bh=nm3LGyLWXkhbDyn1AMc/CsG+dk7eWxFfEtG6Iw41JEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1awj4TsbJUTSfYUvIdUoV0qmTr8G4qYuoaWkyASErIS3YtXl+kzmbVL2G6UZliW0LscqlXMXzdr4UOJZhj75oh6rUX+PIWTWYxsCo+r6lyfZMkHbKm+R32cTUPJ+yedbb92Tvp30Sp9xiFDF9dFdx3CDXT36V92jOSt11zcehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKfZD/ME; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKfZD/ME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C2BC4CEE4;
	Mon, 19 May 2025 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747655214;
	bh=nm3LGyLWXkhbDyn1AMc/CsG+dk7eWxFfEtG6Iw41JEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKfZD/MEIRGj1GsuB9XtVfAjscYwafEzajAL9B2eQW6b1Xx1pNw77ZH152otjyovi
	 eFbYWglEUohrfwvbCVUgI8cl2admXBDn8cMY943b/Xjye/RfiVoyD3KGt4qFi27189
	 U85hoo/qhAkYizhX05t9a7DMe/1yzm36wqAQJV+divrV3rp0jowK06+If4v/HPOLFq
	 8j4+8KqiBOOwT8F/TrqUUjns1iD2uQ8/yTutN1pDK9RSHTDYfRiXng/ECcWXJO1LZW
	 WZVIxoeoZuwyAz590YTJqLbtyb+K+OEc/u4RUOU1ePWoN/Kdf3e9rVjslBKJquP6Rc
	 yHtNym1FAVNxA==
Date: Mon, 19 May 2025 12:46:48 +0100
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
Message-ID: <8229a161-52b8-4265-8296-8f1ac49bab62@sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
 <D9ZCD8D6J5QW.14H6VM9LQ5R2Z@kernel.org>
 <a1a6b2f8-af42-4942-ab62-678e37381d08@sirena.org.uk>
 <DA03MG3VURVI.37CBV5WEEKJSH@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AJrHgbJohquwKjgK"
Content-Disposition: inline
In-Reply-To: <DA03MG3VURVI.37CBV5WEEKJSH@kernel.org>
X-Cookie: We have ears, earther...FOUR OF THEM!


--AJrHgbJohquwKjgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 01:25:56PM +0200, Benno Lossin wrote:
> On Mon May 19, 2025 at 11:56 AM CEST, Mark Brown wrote:

> > No.  You should not leak any refcount, the per consumer refcount
> > duplicates what's being done for the regulator as a whole, one should
> > never be incremented or decremented without the other (but there may be
> > multiple consumers to choose from).

> What stops the last `regulator_put` to also call `regulator_disable` a
> correct number of times?

We obviously could but the regulator API defaults to not doing anything
unless explicitly told to since getting things wrong can physically
damage the system.  We've no idea if just disabling the regulator would
be safe at this point so we just don't touch anything and complain about
it.

> What are the kinds of problems that one could encounter when not calling
> `regulator_disable` before `regulator_put` or if `regulator_enable` was
> never called to begin with?

If you don't disable the regulator you've just leaked a reference which
is obviously a problem.

--AJrHgbJohquwKjgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrGicACgkQJNaLcl1U
h9CAeQf/WC1/S9s8A8jbmFO+CtRWGyHJNcH0Rl6Rv+Of6S6Nvgo15YL4q+5X7uUX
tGORWpDkcmlQK6Z1bVXsckg9RMpLEV0ZpbonPzrPu10trGvbIkn0Y4vTWMY3AxMN
/sTndl4n71+oxgUz3axaBsyoXFCnQZNJZ7kQbFjfgXHEDyOaSZTi+6O3D5SpYAzl
4ipc4gkY915zi3zPcgteORTn0urGiJt71mqRvBq5mPn2mjXbuscDDqa2DNdWD9yY
ReqvzwMz7Aqf1uMKevMViuGJ5S3ZZTMJqAlCGKUIgDJFcN0vO83uehYqpUBcra0I
2T3SvuLRPU9XU3/DkyE3iVIKlq834g==
=nTet
-----END PGP SIGNATURE-----

--AJrHgbJohquwKjgK--
