Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380CAD51;
	Wed, 14 May 2025 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237737; cv=none; b=D6qBlaIoMkiNZrELVDp05v482VGfnukyMkirST0DF75lDD7vtRK9SxT/gtXCnuibDA3W9RStpdR4YiLWouX0ma6iuj3m80Y6JncsAqyvW6q/EKOD3Znf+ScLrwDpfxAXi8/kzKLlzT4YFVzql/rlGsX99Ae6v11ENBUe3jYJqXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237737; c=relaxed/simple;
	bh=G8Q0kX8PK638L+wu+43JSjMwEk+F1tTPv6OdXp9j0qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbvWNQ/SSiQw/Z3VDSHepDPfU2dXQFOMGAxxc6t2RJY/j4d65mpRFOSf110OLPFVYJiHJWr7H8Vl8otw5Nixuac/hAdErYrAXd9rJdCVoo0//senykmbRIzuF1vtzDgfiET8+Nn2evTf7pYKuqVw6DGPNHtylmQsb/HcHNXz1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9FJpY9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9FJpY9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E83CC4CEE3;
	Wed, 14 May 2025 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237735;
	bh=G8Q0kX8PK638L+wu+43JSjMwEk+F1tTPv6OdXp9j0qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9FJpY9E2ye81JqjvBIn/VBY3yl0s/jG1kwPNUgx5YAYtpXLHS69QyrDPdPlxrYPz
	 ykHof9kFHHey4pG7xWksI5SJmaH/y1cfvt3UEokRs4Wheg8fsPXONUTgzYC5SoIIdM
	 SlUp7mXzn/R34c7SUOoYoNZlWEUJA4GF5BpUQTLMfhBH+TJX+MFjx3u6fDFP7Xrl2H
	 BbZt7hSMri70hiRzFSYNaL3ztXueo3zAxYnADugpf8YzcHdlIcc/NgV35rcYllTE5G
	 BFXWroD2Jh8B3vJW6KNuTStgSbtVZhJusCfVhWNsb4q0j0tOBan4EJgn8aQIWuVWjw
	 jBHUhocjSNZdQ==
Date: Wed, 14 May 2025 17:48:50 +0200
From: Mark Brown <broonie@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aCS7Yr8TIGES8BNN@finisterre.sirena.org.uk>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bSUu2JMEoV86MG8Y"
Content-Disposition: inline
In-Reply-To: <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
X-Cookie: Well begun is half done.


--bSUu2JMEoV86MG8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 11:40:15AM -0300, Daniel Almeida wrote:

> By the way, IIUC, regulator_disable() does not disable a regulator necessarily.
> It just tells the system that you don't care about it being enabled anymore. It can
> still remain on if there are other users.

Or just if there's no physical control of the regulator, or no
permission to control it.  It's logically disabled from the point of
view of the consumer - the consumer can't assume that the regulator will
be enabled unless it holds a reference on the regulator.

--bSUu2JMEoV86MG8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgku18ACgkQJNaLcl1U
h9CziAf+OykOs7aikWp2nWBW17COTpwbaU+F5X1oQheAP4W0NqKY5n1uxIl4ohEv
z9A6+QfvF3mlgZEJXU7JPVuCTs7QIKTMid9vC1FZdkSH4s3bPE4rZUnvkMvSU6Dg
MAWQWMjnIqAZ1flx0GyImzFprgLYRXTN5659ZrjV6bWE1W+pp/eLYj0vKSJvdaho
rQaaP53h87/sGJEeRjfIVtgK5/4Ic+zwB/TrB2U+3OeZ1slfTUPDvwklWn58roB3
3emQGVWlxZdWvKM7c9kME551epig7eeK1fjkPKJvwmzPZswXaxS4rQRslsPowyhF
+4DjlEI2YrI9jUirbTjXnlxeAD8TzA==
=knCX
-----END PGP SIGNATURE-----

--bSUu2JMEoV86MG8Y--
