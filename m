Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962F8B665
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743208001; cv=none; b=Wt/njK2MlvVYz5BHVD9YZt1qdaTZEsf4msfcg7hQ+BfgFwh4UYF3WTUYu9gwwIi73PtYaD3afvY3wGVHmg4KyoUjZMo6tt3Qf4yxgzTGlwvS7hYFwtbhW8b3l3g6kVotg9VxaWG+0lsqWPtOjM0VLM5kuxcnBYb0BrWSXw88VZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743208001; c=relaxed/simple;
	bh=2QocWXouPzFbNBT7tZSzO62XxUsHtQujpCc1OOzOSP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmCobePRfHl55xu5zfU1l+43qQGoN8jEkQq9SgRt/zUwKR848k2MXWjIb/XNqhD5m/dsA2F1YH3WPLNjn6xuH/OXxErWgb6rUaE5bDfJqEjlXcycP9iRDgO56bCXf+BaIme2RTvRNd3V2aeptfQFLZufN7XKFnRyp/fqhqshp10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzW0X/NJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzW0X/NJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE031C4CEEA;
	Sat, 29 Mar 2025 00:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743208001;
	bh=2QocWXouPzFbNBT7tZSzO62XxUsHtQujpCc1OOzOSP4=;
	h=Date:From:To:Cc:Subject:From;
	b=DzW0X/NJaKQjIZQcLVcdqwUwnijFQeY5UVXW4QpwPzirZt69v320C/Ik/76Tbtvq7
	 rciC/dXC74YPtitxkpksvuHLPbTUFshsaOGwRpTrLgmXfN8PZzuQa0Ae3K9b46txs+
	 My0GdtJqZtejxGr/HNMrlZzwlhs5fP8UDWHfYEEBsHeCkYJ8lCcKh5zIZGD9VqOu3y
	 bT55UZ50fReTmvM/ONqV/gvUvMHIKwGys2Zb9IAdOsLGbYIYhuJoBkgG+ilJtook2F
	 H3gLOiOPvthVupjhlFGfm6OeU8kJV/PkpzRbn4LjFUXw8jugKQW8Peur3bSIf5Qal3
	 U0I7R8kzku3xA==
Received: by venus (Postfix, from userid 1000)
	id F26C41809A2; Sat, 29 Mar 2025 01:26:38 +0100 (CET)
Date: Sat, 29 Mar 2025 01:26:38 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [GIT PULL] hsi changes for hsi-6.15
Message-ID: <qfwp3ydt4iu6cwb24bjmwakhfyw4t3zhbdew6zw7wdunes6ndg@qe6gtjusgln6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6apbzqn7obveqkwp"
Content-Disposition: inline


--6apbzqn7obveqkwp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [GIT PULL] hsi changes for hsi-6.15
MIME-Version: 1.0

Hi Linus,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi.git tags/hsi-for-6.15

for you to fetch changes up to e3f88665a78045fe35c7669d2926b8d97b892c11:

  HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition (2025-02-25 02:07:09 +0100)

----------------------------------------------------------------
HSI changes for the 6.15 series

* ssi_protocol: fix potential use after free after module removal

----------------------------------------------------------------
Kaixin Wang (1):
      HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition

 drivers/hsi/clients/ssi_protocol.c | 1 +
 1 file changed, 1 insertion(+)

--6apbzqn7obveqkwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfnPj4ACgkQ2O7X88g7
+pqAGg//XbL+XgEnI3pjlfd30rDxcnLAeY8bHZsr2YEDUvd3hXuJeGFdnt7+lxER
bt/NTOVDKnL+4FABFMxED+p7DhTYyTLSQfRlLE/8yQzZrUrbyR0yMrDX+bpUeTrz
NXENRgV7Oqssb3EwA29TdqqpY8x5g7LRJXLOxhxW+0apBBjwdi/ZetFl17lJIEDO
vlJibmN87ZCLVOQiqHnwbR9z7p1oVmJROela9s8hhOnjaJO1JItyD7PVpKhVb+py
2K23ZZ7Q4l+11lA8s9K+x+VSCacMleAE7YAhLhhelqjXYdm2FW82s4UyH0mhBb/g
Rrfk6Hr3597kksMNWnY0qkJ4bXonZpXyc48rPK9CuVf5Q+RgK9rasNnZ4l5XIalQ
NLH4rNFpW3Nd1xdeVfro4AfhojKUsxlevMAP0+R2GQjH1FbsgEdUCGnd5q7z2b2P
ATD3hgi5Ymv4vOm0MzDka4BKk+dZ0F+OrzbF0Xp5kdpc1L64GWJJzRbfA8dbOolD
IcdY2uIkmd7fmKqRYqCcBOaIl7l6TVnEgLFmBeRFpIHdu9ezQ4wFaWj4/KJz3tM3
pIfD2OUG8JhStwoMmwXoRLyrDPG4iJF19Wrj2zi46SQPLVv/9TPS5r9IWj4PkUI9
q7N6JsnuoZOezZJHxrsQ+5ZgD9rptMR5yZ3gRp1r+w0ejaXvoR4=
=jAbb
-----END PGP SIGNATURE-----

--6apbzqn7obveqkwp--
