Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160B0231858;
	Tue, 10 Jun 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568905; cv=none; b=Fejks5JyUaixCdHYllyzgkrH33xkEG+E2GFoqrH3loLIlw2QguvCxLMyrpWtvkezVOFL0ugbOlxE/hbfozwx2Qi2DcSynIh98cmxWt5jaBUujHFkBKJVoAyX12Su9qGxr5gu2qigKRVMPAaNPsysHPxmdOrPZVq4uQgD0DkWD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568905; c=relaxed/simple;
	bh=ZDPC+Zvhv6bvCgKo7qyJDoaCmns1b7BJIKlJTcGDLPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaI34peGmGOTmAiQN9/ioQa3a1qBxUk4ojhUWDS1b9/DWW2exKKWgS4dQ/e9/BicDpO5bZBek7jkOrhhdsfC52vRqcZuXVU26XXL/QvmnhWC9cLPEQe03xpNgr7/Dyr4t324ddb4iXBPJoYqnbENibzys5Rbjit0Oa1wraqmVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB/itAkO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB/itAkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B73C4CEED;
	Tue, 10 Jun 2025 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749568904;
	bh=ZDPC+Zvhv6bvCgKo7qyJDoaCmns1b7BJIKlJTcGDLPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OB/itAkOa1IIGbT5iloMMpzs9GpLqPzU8C6RD284AUu2XEPIzb87tI2EbWXRV4v2R
	 nAKJM5GpUwWe1h39l3K8pRHzrzjlyRAohuGTZooi6gJ3PgrwtIDFsBjVCj0CsvzBHt
	 ANvbIBFfgU540mG4rHI3goAEzm2+G8Vd/TU6NvcimXNzh9qU3P0E1afzTrmbohDn4T
	 JCtYxHX7vA8jngp7QKTb1hOCHX2buD+wWlkZfgjtrNdSJ6JJ4jh9P8n76/4g5tBO5l
	 rGy+nLcpLeX4tbMAR6P0mYsFjtzDCM/cT3cNlp2jUNn/ZYJAd0LZ4xg4KHEpzFYwNY
	 scDw4zCxazlSw==
Date: Tue, 10 Jun 2025 16:21:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/6] kselftest/arm64/mte: preparation for mtefar test
Message-ID: <6b13e414-9377-4806-abd5-fdebda6c14f2@sirena.org.uk>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
 <20250610150144.2523945-5-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GOU5km0pmcdcSUm"
Content-Disposition: inline
In-Reply-To: <20250610150144.2523945-5-yeoreum.yun@arm.com>
X-Cookie: When in doubt, follow your heart.


--+GOU5km0pmcdcSUm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 04:01:42PM +0100, Yeoreum Yun wrote:
> If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault ad=
dress
> are preserved in response to synchronous tag check faults (SEGV_MTESERR).
>=20
> This patch is preparation for testing FEAT_MTE_TAGGED_FAR.
> It shouldn't change the test result.

I'm not clear from the above what the change is intended to do (ie, how
does it prepare for testing FEAT_MTE_TAGGED_FAR).  I think this could
usefully be split out into multiple commits (eg, adding logging of the
additional si_ fields separately, or splitting the renaming MT_CLEAR_TAG
to MT_CLEAR_TAGS), it's kind of hard to review as is.

> @@ -45,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, v=
oid *uc)
>  		}
>  		/* Compare the context for precise error */
>  		else if (si->si_code =3D=3D SEGV_MTESERR) {
> +		 	if ((!mtefar_support && si_atag) || (si_atag !=3D MT_FETCH_ATAG(cur_=
mte_cxt.trig_addr))) {
> +			  ksft_print_msg("Invalid MTE synchronous exception caught for addres=
s tag! si_tag=3D%x, si_atag: %x\n", si_tag, si_atag);
> +			  exit(1);
> +			}

We should really exit with a kselftest error rather than just a number,
though I see this is just copying the existing style for the file so
*shrug*.

--+GOU5km0pmcdcSUm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhITYIACgkQJNaLcl1U
h9A4kgf/QplQ4dWFT6f/xxxKyypU2qtRmPJRXs/iiAORuXfp1kEonCeiT4uAi3+F
M3uLr8ISj6doJQcRo6YA5czQ+3uwL+iB35MEWJPxuPgdE4Fedxytn/9fs9A1FTfs
zft71Zjl+3xUdSR8uWJeCnwvYRnI2FPQmSx6HQRVlCOQ02FC8sLbsgTikN+H5+uZ
ojjS49eRV7qEd+Oj7vQ/BojjxQr0OSGmMkox964ZhpiBKjIgjg78aA9OsYBy00Mb
WzVXqYbANk3Xx8oMn7Ei6K9OIDuPacGYZOAZqF28BEPhCwnoHgLicOTFlIh5M+O0
XXSh6nKKo3EbB6cVs/iL2jv+rGT0yw==
=8x/9
-----END PGP SIGNATURE-----

--+GOU5km0pmcdcSUm--
