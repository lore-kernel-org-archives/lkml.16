Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46F1E0B86;
	Mon, 19 May 2025 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658822; cv=none; b=Tc/5Uu3NiGNIBpPmRlcHPhiviBA78FdzxCriCy+nmUCI8fhL3YR/gufeocyabDdztM/5AyTCUxp+YTHk+SkuMW6QQtVi2mu626OZdEmfqVTOPGyzNGFwFKyCOzZxy5/PcvZJVIRICGeaWKpmfVE5YqKhoiNuTgoQxBQrhH3Uy7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658822; c=relaxed/simple;
	bh=COvNHhxfOFdcPkYswikn5zrTUNVBmHzZqGP2ItG+TfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/eFQQSqeLDI7lsBHbjhsBPZ0gOIQf5TtKrw+k+Iz9nbMP0Ivj3ogRgXRky6Io9Nm/QfrQX8PZQ/N0Cql5FmWLp3Ofguo+Y/gtKrSTPYxF25okmUrykivKwCbk4tuoNBpchk8MGbxcHLrUr3WPR9SuyDjtxra09Z7D/Nbu5k7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fn+PSvuf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fn+PSvuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE2BC4CEE4;
	Mon, 19 May 2025 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747658821;
	bh=COvNHhxfOFdcPkYswikn5zrTUNVBmHzZqGP2ItG+TfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fn+PSvufpLJ5jRCahyjS4VPPLIuMe1NFJox9OdV0SaTO15h6AHrRqACWfXAc1VpXa
	 /evqVnMVE5qx/MVM51A4V3gqKhBSBh1LB50fR+oyeA9Yv96e25QXv1Jo7mNQujEVr9
	 4rLvUWRDsKvp5Eeob9FwEZbcnVjOoxga+xnzPT5OLxxr2VK0olwf1WPtf5xDUpbAKi
	 5Jf61le612jeDo7yL1NuOFygtrng1PJxAsdtkA/f4+lwiWGHR3b28dvz+Z3qnFPI3n
	 lhRAvalWPcwyteS4XwSJjCsG3cmdoPMVeEU4sd1L928YNtlvNV+IK1CHuhheHzv+69
	 e7qws5d5cPb/Q==
Date: Mon, 19 May 2025 13:46:55 +0100
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
Message-ID: <ca6ed5c1-5b39-4e22-8294-88380885bb65@sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
 <D9ZCD8D6J5QW.14H6VM9LQ5R2Z@kernel.org>
 <a1a6b2f8-af42-4942-ab62-678e37381d08@sirena.org.uk>
 <DA03MG3VURVI.37CBV5WEEKJSH@kernel.org>
 <8229a161-52b8-4265-8296-8f1ac49bab62@sirena.org.uk>
 <DA04ZK6NFF1N.35LFZRY7O7SG8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k6GpUpGM6uoPrUAq"
Content-Disposition: inline
In-Reply-To: <DA04ZK6NFF1N.35LFZRY7O7SG8@kernel.org>
X-Cookie: We have ears, earther...FOUR OF THEM!


--k6GpUpGM6uoPrUAq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 02:30:05PM +0200, Benno Lossin wrote:
> On Mon May 19, 2025 at 1:46 PM CEST, Mark Brown wrote:

> > If you don't disable the regulator you've just leaked a reference which
> > is obviously a problem.

> For sure. But I'm trying to figure out if this is a safety-related issue
> or not. Safety in Rust has a rather specific meaning that can be
> summarized with "no UB". So since the C side does nothing if the user
> screwed up the refcounts, it lets me to believe that we don't have any
> safety related issues when forgetting to call `regulator_disable`.

> Of course we still should strive for an API that makes that impossible
> or at least very hard, but we don't need to make the API `unsafe` or
> have to take special care. (At least if I understood correctly)

Yes, it's relatively unlikely that it would lead to any undefined
behaviour.  There is an API for crashing through the refcounts and
disabling if we detect some emergency, but that's very extreme.

--k6GpUpGM6uoPrUAq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrKD4ACgkQJNaLcl1U
h9DFtwf/YKX6XE2sVpe0n7HKco7rUCWFYlpVz27Vk1u89lmzUaDo1Xq1rgGmyAix
jyGn5bZ5sqNbs1OZlGfPNq1XNBSbMfyu41BEg8jmhSfRn153yIDXtoB3At0GVkD/
V+m3bH4sqc1WSdMaI50UmvQjOeuDRT/h7G6/S5gg63t5RmjCFOBo9EHsrZWZfLOF
dr87DgiAoZeGL0BPZbUmUX1RRrMbXgZzyAvdm9bXasv2Nuue4dAFVXyF32Nl2l7U
V/G1OVuN71x6cc9ASIZlTL0NBUeSi8I6dSgp1iGjwHm4iK0MdtJBenv7XHPO90NV
wqQfZzgWEYnzekwOQW4uNqNK3HtEZw==
=2l14
-----END PGP SIGNATURE-----

--k6GpUpGM6uoPrUAq--
