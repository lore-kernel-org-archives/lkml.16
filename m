Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FD2E6138
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651262; cv=none; b=jvnkCE7lPxYWYya/bcMM/e0HKAhzYUowcpuN9kfghDvXFXsYDWPG1jOu3Gni2ACEk86sDJt2Ieh2WNwMfuqQ0GXypr9OFvn+WmsrJwtUm11lH/0o5rqYSGrce0G6/zfS+tcoNUIjdGF1W4Xs7PdUlQa8Ag0jKdmuV4VfvSlOm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651262; c=relaxed/simple;
	bh=3ltj/FmqAZ7QuNyBZnXsvt0qatnm/T9l1m84EX22EFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LP4yxzwCPQ6WqDKc1T7HCuQ5A6KUqXReTT4aXnd6z8QbTNEyyibWma3sG8i68Zo+GJZq3v54C/0IbiWxgQ2k9dxyrfMVDUmpRZpyQlq+hRr9Y+VQP4XujPlB8q2YJ31Ml+cOoCcGJ3Zxg7ck/IOaDKwZpYDCwq7TCIVlop5W030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsDUsth1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsDUsth1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16783C4CEE3;
	Wed, 11 Jun 2025 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651262;
	bh=3ltj/FmqAZ7QuNyBZnXsvt0qatnm/T9l1m84EX22EFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BsDUsth10QpiJL7THtTgD+ziLCgb8HxBK1eqLm6Ove4ilnd/7Z27eninlqd/814rv
	 5NHPjyF7+vpMTnHbgI6TMBf4r8nsAig8dlSl/BZRLBua+KUUGjuoVGbil49dpYZZ1r
	 6fSDhype/+BRl0pKAkbaoYCSdOgYmGM7ah439NDO5A62XYQyzodpfr3V7PufY5RGaA
	 bxWATM45OCT1/FfUE4amKvXEKzT6xvmGsCLek+pY7f0a+vfP0DCKaLr3gyxbAV4Zgq
	 Lf1vCXRibWWFeTM9geYd8dOaCY1uOgo4Hp4UeGq6on4WXXbHa5p7/MCuZv2MeeQ8hu
	 Ihni+XdsEhhvQ==
Date: Wed, 11 Jun 2025 15:14:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] arm64/cpufeature: add MTE_STORE_ONLY feature
Message-ID: <ea76d2f7-897a-42cf-b327-7391478cc486@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHmyzTM6zYC1FDH5"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-2-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--hHmyzTM6zYC1FDH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:47:56AM +0100, Yeoreum Yun wrote:
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.
>=20
> add MTE_STORE_ONLY feature.

Reviewed-by: Mark Brown <broonie@kernel.org>

--hHmyzTM6zYC1FDH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJjzYACgkQJNaLcl1U
h9DLewf7Br2u+NGtNFaA7jt2w7hoA9uhEO1bpq25k9ho86z7V7zRqjFHJQ+dDyHL
V7VIXqnh92lmnJRWh8ZvGDKM25FxUBAQzql+DCeHdi3xC3RX9Vu37WXMJr5b0LZz
oDCUHpszIOsmX/DMYlhQ9Af4ioEYoi+xdCn2jUb6JdO1jAbPcTKRPIZVqv64JVQ7
jaEhM+49KtZ+KXoDxKe/bJoiV9YD4SP6/wVNLM/xY3ZBf/8zwcfUgFNOwXdED96b
KOhHvX6NVj+MOR0Sa39p8PF8kRVccDqux7eouE77egS1r+IDlOdrDgBnI6KelVeM
ilLlU8bkZfN6pWCNlIRsO0cWwDCeSA==
=zCgO
-----END PGP SIGNATURE-----

--hHmyzTM6zYC1FDH5--
