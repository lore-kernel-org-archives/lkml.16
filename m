Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C218871F;
	Mon, 16 Jun 2025 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082717; cv=none; b=c1rHfohA6O3txzhujwAfRqx1Pr59Vnyz0HRuhV7d1hQMGVI027Sig3bK6+C6nmLdgm+rgTV3VePIn6q/0jRaFGqDMgwiyKgsVcSmo0JfDDbVexV762JjSCRrRxlIcPhiQ78SFABrVasbIEgUZEA1dDNr0448eOtOti2eyucDBrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082717; c=relaxed/simple;
	bh=Scf+tIClzenzBTDaxJzd/YKyboffRYXeS4q0KFfrPt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pn3h0vC9cHTy/AAO45K/aFHHvlMOeqV1Bh1KHBeozpmNl9+5bV1N1vy6PllM2WNEUfR/MVEGyZijPBU5TGec2k8DxKutOeH0FVGu/Vz2jNbglq5wjks7T1YCAWhwj90uGLKgq4RnB1lxGXVdOKrCTHNvay8V1xeE1DYSeYu2k5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usopKjWv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usopKjWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B33EC4CEEA;
	Mon, 16 Jun 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750082717;
	bh=Scf+tIClzenzBTDaxJzd/YKyboffRYXeS4q0KFfrPt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usopKjWv4unl7NrLvy7AKxA5aefW5s3uj8uP0yopGaQx1ZvAFvMokggDKYzMnPZGr
	 0r6t2rb6bleAUtWI6biWCC9DVuv7tX+1TMZU7ut9t+67TkPlp4vnDRA5l+/db6POtV
	 r6oaHB5o4VarR5nRYwjqjP37HmfyILBJnbvFeKbw5Z90e5tJePnI2QxV5h1+Dsh0WV
	 aKlGKo84mNhqwTWxH8iG3/sZjJhQ1KIrrmv3h2A8srYhbtgr5+OL7vaTxBCev2wpPu
	 Fcu/rrmoHg1+WGuDQiOwhe8YVSxxXZqnxiWKBWejHBD5mTIgv1pY33f9+pK3i5rqui
	 dhWPVu4e3l4EA==
Date: Mon, 16 Jun 2025 15:05:11 +0100
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
Subject: Re: [PATCH v4] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <db5fd836-6fa2-41eb-841c-98cd54f21687@sirena.org.uk>
References: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
 <DAN57NVEBNIF.270U4DKHZC13P@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2K9I++qEs4DQO3ot"
Content-Disposition: inline
In-Reply-To: <DAN57NVEBNIF.270U4DKHZC13P@nvidia.com>
X-Cookie: Keep out of the sunlight.


--2K9I++qEs4DQO3ot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 15, 2025 at 10:31:59PM +0900, Alexandre Courbot wrote:
> On Tue Jun 10, 2025 at 12:32 AM JST, Daniel Almeida wrote:

> > +impl<T: RegulatorState + 'static> Drop for Regulator<T> {
> > +    fn drop(&mut self) {
> > +        if core::any::TypeId::of::<T>() == core::any::TypeId::of::<Enabled>() {
> > +            // SAFETY: By the type invariants, we know that `self` owns a
> > +            // reference on the enabled refcount, so it is safe to relinquish it
> > +            // now.
> > +            unsafe { bindings::regulator_disable(self.inner.as_ptr()) };
> > +        }

> Do we want to keep enabled dynamic regulators enabled? IIUC that's what
> the C API does, so doing the same is ok, but let's at least mention that
> fact in the documentation.

I'm not sure what you mean by a "dynamic regulator" here but as
previously outlined we currently take a very conservative approach and
don't do things without being explicitly told to do so since getting
things wrong can result in physical damage to the system.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--2K9I++qEs4DQO3ot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhQJJYACgkQJNaLcl1U
h9Bepwf/Rh6UhiJoLnI/hQm3QU4w9bLhlxs4GjZI3v7lgbxiBqGtbKON+0eDc0zE
hvVNiWTG0i1Nfpk5/7GPbtLMQnluWnNwoVEwAzvmpKGa/R351QejZ8ajFGxAPPlv
n1d8u8bIMprZLWYdEZhQcDKUEA9nV3jnvJCTKNc7eIXOIyLz9CgBmAwc0zZ0Uap1
Un74PS1/9V9GZSEQqrvH8hBOgNoTjTU6t1TGroMlKq8wfSJPU3gSLwIla17Z+qbz
WsQbtChpq6QN8p/hNqr8LPvuy/9iBxaqOmsBobxDiJqWKm8o9OlCxNeOMG1MP5Yc
Im8Y6Md0avf/A7Z5v8ZJOMidnJPkWQ==
=iOov
-----END PGP SIGNATURE-----

--2K9I++qEs4DQO3ot--
