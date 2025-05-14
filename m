Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5A270572;
	Wed, 14 May 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217809; cv=none; b=UOeaZLS3vlYx/gFJuQBz4gQi1NodfVjNMq2jRKcgDYrbh8eOLCNOaGmz7Dc4jOJWcFh2rG0ESDtxn2bXafV5Gvh3ESE+RUy1DCfHZTTO5S8WoT48l7PD8OVdHVv1LxuCQkJQRcIXT5LaxYSG8OiVOmrR2l52fFASpOgK/nejxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217809; c=relaxed/simple;
	bh=oCtyEl+NOfQyDc1IWfVhZUWDYE1ceWAqg6CDpX7/77A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3MavXGuQ0HFxfBq8QrIKrOIV7hJlc/Smm+gOkjON33e1+HeonnoIC1tiTDEFvGeK6YWvlOL3NRhC6RIKmlFGLd+v0h+Tk5osDNUY3Y6ssjEjW8vS+5cfSq2Fd+673QBPDp6HQuu75ATXfTtgLwhqw7KphvTduGTCjJ4qJ05wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j91Lsu+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j91Lsu+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B71BC4CEFD;
	Wed, 14 May 2025 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747217809;
	bh=oCtyEl+NOfQyDc1IWfVhZUWDYE1ceWAqg6CDpX7/77A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j91Lsu+BpGJDE0kvIn4V5dcLCYvOA6E79NPM3xmlvk8hFVfp/1Yh3CiNV3EBME8jI
	 REHrvyAIUZ/S7N63051S3/QP0kAX6iBRAmf5yJuKPStL9IQXHe5PYgptwt8iqc4GeZ
	 RGkThlYFqfdnp72kUhD9XdGYDR1KJOW7uTGQknvmPdawgb27d/ccq88w3B3ZEQk08u
	 UKsPSObsdyl8Wv0LvUSpiqnQIXgA3I2wVwRmtIquBtgJwiwA5f9VhhdnoQuVw8m2tE
	 XV0W6x+LxWcJo/5mqX2ohl8XmRc4LDrkmcdS9JaoARz+eHvDZ+gQL8ZbOI4w4s0VqO
	 l1DjH9lHwst7A==
Date: Wed, 14 May 2025 12:16:43 +0200
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
Message-ID: <aCRti2d5x2bL0mj6@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>
 <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eknOCiAO5QhR+QEZ"
Content-Disposition: inline
In-Reply-To: <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
X-Cookie: Well begun is half done.


--eknOCiAO5QhR+QEZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 11:37:46AM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 9:46 AM CEST, Mark Brown wrote:
> > On Tue, May 13, 2025 at 10:01:05PM +0200, Benno Lossin wrote:

> >> This isn't fully clear what it's supposed to mean to me. Maybe mention
> >> the `regulator_enable` function?

> > I suspect this is adequately clear to someone with the domain specific
> > knowledge required to be using the API.

> I still think it's useful to name the exact function that is meant by
> "enabled".

It's not clear to me that it's helpful to have to refer to the C API, as
opposed to just being free standing.

> >> Why don't we drop the refcount if the `regulator_disable` call fails?

> > If you fail to disable the regulator then the underlying C code won't
> > drop it's reference count.

> So if it fails, the regulator should stay alive indefinitely? Would be
> useful to explain that in the comment above the `ManuallyDrop`.

Practically speaking if the regulator disable fails the system is having
an extremely bad time and the actual state of the regulator is not clear.
Users might want to try some attempt at retrying, one of which could
possibly succeed in future, but realistically if this happens there's
something fairly catastrophic going on.  Some critical users might want
to care and have a good idea what makes sense for them, but probably the
majority of users of the API aren't going to have a good strategy here.

--eknOCiAO5QhR+QEZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkbYcACgkQJNaLcl1U
h9Am8Qf8C86IhOs2s/K19hiPXFhxdjQYOMCBzsE5/+5E1xtX3kF8cSebCdtzAGMz
D3oH80+SkCuOH2/LOQFiCPc2g/aLJ4Pt6Q+QrHQi9hYVTJveYqgd7oqD535dp3pH
jC9GZHL/WfrD+EQNR+viPu/O9Sn81kFWKPprLeyqfMAWZXeiUnPSYEYs9jOINGMB
5SlBXMp7SR86yKHzUgcNI0i+ZuXysOUQj7QDFlqOdexlhbHI2H67p//DaRAYuLgR
3HUBSO4OwCXxAG5WBjlmcVViViPZR/MvqzGq5L4WxUc/Vh/bC1kF7Ww4dtK23oDL
sB5ISU3Pgpyx8zMkJEv7yLSUO2H6dw==
=VwnR
-----END PGP SIGNATURE-----

--eknOCiAO5QhR+QEZ--
