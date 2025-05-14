Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574E23CE;
	Wed, 14 May 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238939; cv=none; b=U1IB/X0FP6OFDzkONd+9sxx4n0Es4BIwXifJMLTUa8o5EBcKKDe9+DtZecpr4oNjxvGQpP28p0fCsi7m4N1Af3Qb8tRFtzvZA5VhrmApzLxpkmrXO+74ql1Z8c3ESoCHHlTANNGExp82TjsndkZdnJfEFawzBjLAV3vCE2eUtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238939; c=relaxed/simple;
	bh=WSQlp+Dh5QGr6EurTALLy9/PXCYuEoCNVlxnRZuV284=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQl+XeCaweEuJri/uVoLn7jZsbKm1xXjfcb1VvtlVBhaaxZjLw2y/SxIA+Oq3YuNgFohFw1Cxb4/txY4USKdNB9CPjnWOXDTc4FbuD8ifmMUgDtC29etOcH1PwZNuMs07MHMBi3vgXoUzbn1PeQvnWE0wpK6b80wLTTIExXsgLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gpqj+bCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gpqj+bCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1788C4CEE3;
	Wed, 14 May 2025 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238938;
	bh=WSQlp+Dh5QGr6EurTALLy9/PXCYuEoCNVlxnRZuV284=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gpqj+bCOZePXoGUhl6GNYU+4uRTymJYRb1tLtydhiM2k+quJrJPO7O1l0oi83NBgB
	 5NC1wmRjfA5qXQztQG7KTvBMUP6HjG9gDj8ZyUCcnoP3pxRVyVFAZtUPqOg/JkPokA
	 tWWtRcXTk6ThbX8TXHU5C8VQVlsoPtcars+iAp3VawHIpOFgsNAw0S8VJ82ANTOIoO
	 GMsmteGjhDuPgmRhoN7rjF8TY4s4GEgNSx3Olv0x/VimrLXypeW6ehEQbHJBU2enU4
	 Y5SSO53qC57LUuU5YHgPGecIoG+TJYqdfQ2Fs0XvSreYo7gX7lZ+GEo/ybwbZTLG41
	 c+lkhmFejK5Aw==
Date: Wed, 14 May 2025 18:08:53 +0200
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
Message-ID: <aCTAFY5USLIchVWL@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
 <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
 <D9W0FJ6MKPTE.1NI5HK0TJRHCM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/SyjG8EBHfpAPEFc"
Content-Disposition: inline
In-Reply-To: <D9W0FJ6MKPTE.1NI5HK0TJRHCM@kernel.org>
X-Cookie: Well begun is half done.


--/SyjG8EBHfpAPEFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 06:05:11PM +0200, Benno Lossin wrote:

> Gotcha. So calling `regulator_enable` twice on the same regulator is
> fine?

Yes, absolutely.  You might potentially see this with a multi-function
device where multiple functions on the device need the same supply in
order to help reduce coordination requirements.

> If that is the case -- and after re-reading the functions exposed on
> both types `EnabledRegulator` and `Regulator` -- I am confused why we
> even need two different type states? Both expose the same functions
> (except `enable` and `disable`) and I don't otherwise see the purpose of
> having two types.

IIUC the point is to allow Rust's type system to keep track of the
reference on the regulator, otherwise the user code has to keep track of
the number of enables it's done like it currently does in C code.

--/SyjG8EBHfpAPEFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkwBQACgkQJNaLcl1U
h9BJGAf9FQgChgXlHSQEhzdwlEizPZdPeQ6ua4OKfpaORUGdObaNFzP12L3qLbwH
Zr1EMaDF1AZcNygWeLauyI5z+kXBegmu63Hr7pKhuwgAkxw/pq5nrvtMbIu8oM8m
ajic8V2NsNHowlm/oJw16eDLTn/swjQ15RlRr45llf3nIfRE2NVxtXkvwZq6vmgw
wcIflCDzDH/Nmxl0QBsFZo+TH31McUP7KmARzS8M83lTgV5w1ERBye1o0KYXliT0
1F4OCUsoTNjZN/CGM2mZMzQADVayDJcRBxVs1u9VdAMu4jCi3XgimZDGK7q6AHWl
Il5EDOTCw3mAZFWgNrNpvawhbb/9yA==
=Mm35
-----END PGP SIGNATURE-----

--/SyjG8EBHfpAPEFc--
