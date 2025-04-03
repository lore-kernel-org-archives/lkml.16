Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074A24EF7E;
	Thu,  3 Apr 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694294; cv=none; b=USlBhv8dk/l8tmxsbsgE6pjdpmzIi1+1abeHZB7lxIxehhIFkMC33QHz+ucikzOr69ywxUrpdPS/TUaVvLKqfr2asb/9DKRqZRAv+52NRVCdh4wXU3deTjKoNJzwG8d6mGsDtl2oEcGTWX5ODfU20BkgEsUuMlGTN2vVrwjfKgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694294; c=relaxed/simple;
	bh=ywX+w2ejjtUoTP/P9MQhvoCasOtZWG+Jw8XsR6yk9go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB+r0mlW45NhU2zrus+QhWbuI8e90HUnN1qlPZffDaD8WMvkOiYNsezZRD9Sh11coAKellXCXTvPsgkkAXP9YFfE5jteeW9fO4ZzQRic0FOImWBi6IMy9CHl0q1SwfweifXP7nCvkFTcvcVgnAlFnyLmNsvWHn1AQNAkJxf+rKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqfZ6V6U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqfZ6V6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6767C4CEE3;
	Thu,  3 Apr 2025 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694294;
	bh=ywX+w2ejjtUoTP/P9MQhvoCasOtZWG+Jw8XsR6yk9go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqfZ6V6UNUu3lFHFKlnWCFVf8rHkyRYnqyntQk3cBIEeN9D4/LoxCTSZJgW7yfBFw
	 miqP/U+jpNlGpizBr3zB6cTiljXWfDLbAYLk+uRYUpf+vZ5Vq6EL0PPf7LHOEBuP6/
	 vZ6IlzmuWuJ3ExrrU8Z2/cwIhh631e1RU4YiY1+VZUxfvvoAsWFmajL2dyn0AjxSma
	 oCAMfxcoCySUelgF0jbMD7mQWKiXkECfibQzjHMBpa0Hi4lN8mDa2jZUaweIfFi3MA
	 PSx5rzUZimG/QHVy+IrlfNtDP+2+y5nTp/2sSL4wqQKtCSLOxrCavn6nlDNngJfQAi
	 5ofujHMot9g8A==
Date: Thu, 3 Apr 2025 16:31:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation/arm64: reflects FEAT_MTE_TAGGED_FAR
 description
Message-ID: <93497fc3-3da9-43f1-8b22-cf0d3f3e7de2@sirena.org.uk>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
 <20250403141535.23496-4-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxRN7uTMagz9u5lh"
Content-Disposition: inline
In-Reply-To: <20250403141535.23496-4-yeoreum.yun@arm.com>
X-Cookie: Logic is the chastity belt of the mind!


--oxRN7uTMagz9u5lh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:15:35PM +0100, Yeoreum Yun wrote:
> When FEAT_MTE_TAGGED_FAR feature is supported, the value of address bits
> [63:60] is preserved on synchronous tag check fault.
>=20
> This patch reflects the above feature in the documentation.
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

I saw the subject line and was looking for the elf_hwcaps.rst update in
this patch, though really it should be in patch 1.

--oxRN7uTMagz9u5lh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfuqc8ACgkQJNaLcl1U
h9DNfwf+LDTdUjy+phURiCQ64ZN0TgTHnloTqsXKJJLs2WB63AGO04uu9pLprQ8q
H5VcxoVmgSoFdTh0eRWorj5490VGcxWXOEBKfL3oe6/EC+KH+5uWu1RzUuV0W5Ff
Rr6NRfix45cj4OaYCiTOxdC7+5Tbb5R76t5R+UFJn3Ap7fIOlT5l8PAnLMmsNzNu
atAAI9WFGAS7I7Vu9CKjnFEwOhL200RgJNFpzyS+gg6WXlfMc3zaRCEoJQ0K/fgF
wLhgmuFE2xk+ZoOBykztgNhGy0JtnrW/5csyLC1cGyEYsxz6L3S2bFqjuxiruCcO
rM8gtkBASbMayS6KsVHTWp8RlbIZIg==
=BWMY
-----END PGP SIGNATURE-----

--oxRN7uTMagz9u5lh--
