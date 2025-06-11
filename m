Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872D1BD9CE;
	Wed, 11 Jun 2025 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655780; cv=none; b=Df7boUBvBigvG1WsmJjIqGmz2OGiDYTBP0cnt4UC5NFAVXQqwrNuUtei4lyfmJwNo+WkUJU/f3WyXP97C7nWzDqOlBbwebNSO6bfT13m2QG77FuN/u1uSZVHcz0ij0B2EdpRVuDnSFkuXwHVINzfUc9rm/dMvQVRs3jotstxuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655780; c=relaxed/simple;
	bh=n8VN7KS5iGSvBwzdJdE/AaBiH44qZJzVl4sIq9CD4MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBUIFHUIN1G4qnIgKOwULJ/JXu0bbRBTxub6CDN8NMqMvl+8Z89+V1NjECI3BaoxqVYB0PTWvFNkqNB1H83FbDYrDe0CnJcckyVcYLCJkOXjLpB7m97hQ9NIYmVxDVE1ppGM592MX1fC0c03BcGugB2FNiP84tg3cYkmHqFaD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz1O+OKO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz1O+OKO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030F0C4CEE3;
	Wed, 11 Jun 2025 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655779;
	bh=n8VN7KS5iGSvBwzdJdE/AaBiH44qZJzVl4sIq9CD4MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gz1O+OKOkBNhiT66HRpiwpzAnv0/E2cRN0kSYC+fuGrpmuafe5hz/0VNewitFUd8o
	 fDmwpZ7iZUa7SCUp59NqamhiDON4pS1gQeIFEdC5wQWcdiGev6ZkJgE8+LTDdd8FoX
	 5Jv3kdNU44YtzuHWrfOYFCjEikM1d1hye0nwtg3pzn8dF7/4KCD1kc7M7em4gyBoLU
	 nycc9h2Ls1Q1kr8alF2X+0qVSZxXc4nEUNqMJ1gbXtdYDui3gGTN0GaNuPJeYEt77T
	 DYhDtUYOMsTFWZQfKMHcaNvtLqxtqc2jNUh2xcVcLR2vAfUVzW3XwQTy6PH1x46f2D
	 2cXLFTk9VRcVQ==
Date: Wed, 11 Jun 2025 16:29:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 9/9] kselftest/arm64/mte: add mtefar tests on
 check_mmap_options
Message-ID: <22c43b81-9e7b-4e49-96bf-ff242ea0cb6e@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-10-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qyujq2+uQI7uLhxI"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-10-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--Qyujq2+uQI7uLhxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 02:58:18PM +0100, Yeoreum Yun wrote:
> If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault ad=
dress
> are preserved in response to synchronous tag check faults (SEGV_MTESERR).
>=20
> This patch adds new test cases using address tags (bits 63:60),
> corresponding to each existing test in check_mmap_option.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Qyujq2+uQI7uLhxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJoN0ACgkQJNaLcl1U
h9AFUgf9FX/DvUnHGLW/uorzyHhr+bDqnu4nGYEZpT00NYUHOVAorHI+6MjbgKll
GnAugE2VFVKxWDy4+s2qIJDuOXGcJQmn96SwAv1vrHSzQdGXS39uDhS2UH64AuvR
XCEvjFuATQ6ijpE5ynuhHLdVex+Ra0dxzLazfWukXMtNuHoIENKd+JMsr4dAw8Lp
rYyU/k+OUML9huovKbjloW8joyelbNYtePbIq/rcOWVFpVfHcIAi7jL4a/NZSQhi
fK87bl2zOzalNiW4ENPW3VFMEPiXOCkp/WQ6sZhJKVI4h+USDF/ymwfYa6gnWy1K
D8ENSzMrMq1Uafw5IgvHtIp1W70YHA==
=dcR8
-----END PGP SIGNATURE-----

--Qyujq2+uQI7uLhxI--
