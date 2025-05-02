Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931D221FDF;
	Fri,  2 May 2025 23:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228307; cv=none; b=VVpqg4mBDTWigzk3wOILvz35bkgzPD0qpBu6UZ/1bngJDJSXAYvKJDjR+EtRXKYhHFW4cIgx2xHwjg8DRf8rAUoP4coUcxNpLkl585WVO9oKoDyjcXwnG9k/fQp+AuZHfdKnk+kZQCKtIfM+nPgrbVzf9+/uMtXZq8F84xtnpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228307; c=relaxed/simple;
	bh=eb5KciJXkl3HDPCEw0qiCLQRmvO8SKa4rXPKIEeTS9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pun2Rhv7H04Jo7IQWnPSAa43jOxqFr4+WP0p6/++4nq6HdeK1REVFdx6WCaMbRYp0tVnNV0feR01xcFezfNAxikLfXEQVwwLU3AsnTkRhg2jHadoQfF15f2R1tNJADcovydcQUeJqwiY0SQzljl3pd3pDIY2fpvJdV2mhPjK+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9ONNAha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9ONNAha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423B4C4CEE4;
	Fri,  2 May 2025 23:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746228306;
	bh=eb5KciJXkl3HDPCEw0qiCLQRmvO8SKa4rXPKIEeTS9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9ONNAhaly/rlbvcsPcoJCObm6AmTSQzEtUZyWGZIjPeO4fXhnATFAuU4QSs8MrIQ
	 +3tlQk/pCz8s3M2FcMwfQn9igjQUiOOXPHi9JNLvkaF7iy8D7oOAjMNhQLI3V+kEjP
	 GZRldtmAwfVnDVelpgqaXhOcVzX147Ny6NoB8ddRSyXafjIdP1AjBNT0x82pLMDdHd
	 YFEItrynP09QPLAsrQzJGScU4EsaH8pOEUOlr6c/CN5KhbCsKSx3dFesDOG9W5e92P
	 elRNVZu4PbXNipx94ap/zNFUKAErZ9Bm+Qg8B9zTOEdpi7SVoZno+1HeNtqq4jemRJ
	 JYrCYFt2owt6Q==
Date: Sat, 3 May 2025 08:25:02 +0900
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for
 the v6.16 merge window
Message-ID: <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250502074743.GC3865826@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SyMKlR+M/ktQmLQY"
Content-Disposition: inline
In-Reply-To: <20250502074743.GC3865826@google.com>
X-Cookie: Well begun is half done.


--SyMKlR+M/ktQmLQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 08:47:43AM +0100, Lee Jones wrote:
> Enjoy!
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags=
/ib-mfd-regulator-v6.16

You need to specify a separate url and pushurl for the git remote so git
generates PRs with a public URL people can use.

--SyMKlR+M/ktQmLQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgVVE4ACgkQJNaLcl1U
h9DMJQf/SHQS3n+pyc/R3Nl0jWWt4mg7G/MxocIr1vqBItuwh/nnyqoF3SHZ7QFJ
4Kt6BB+MZvcQy1dYhyGpu1qblsvhQkc8kQfV9Bj+TgukAb9Dec/z5Xu9Z0krArTP
x0IQstkMWY6dIMuuAbOLWgMJwIzEL4KthLMKVpkkbyxRRm/qKf+YRf6kZUOB0uJK
H7RC7hj3aectvZGUNs6tiqIGPQALsGWp3QXATHIJ9hH0xsRWDWBdPJ4nvs7RFLkq
vl1GyqeEkTiaP2y+v8QFlY7j/ICb5v/8kBxSaN6WnUs35GzY/YNCT4OgZl4UuaWL
fEHej/HmLyScw6Qe/2b76kaRsejjpA==
=UZez
-----END PGP SIGNATURE-----

--SyMKlR+M/ktQmLQY--
