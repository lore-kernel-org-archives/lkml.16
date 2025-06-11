Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0335897
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648880; cv=none; b=EfW6sXDbOVTnFz0GCfVoqWoENDcM1eS3u+cbrzNdbyrOZkSc5rIeqq35oX8eSDSXaAHCQg+8yeEAL7FVcLyo1SxvsHCYadgq6PVnr3xO2CDO7+bV3JWWl6lK4vJkGvp9mH+YJUzRan6BFNtlW49HBSvJijjNGE0ue46HbOzliGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648880; c=relaxed/simple;
	bh=ex8KsKH12LSMtycnf5SABL9oUeYEALDAkNqEcx61TOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV2AUyqqd5aqxScRuKGNNrOr2vvLKoCk4dT7UErndPzwCp5xfpJrkfulfiJKnuNrdcr3L8RQV3D5+Wn324hzLQrSrLq8NCDxQNJ8Nmpa7wzK+BrcmASXxw+JWJ+m1EpqmP9IoQImdgi9VluqHjWsfVuYpUSluKcOmhZeRgsqsXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv8dgwwV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv8dgwwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB50C4CEEE;
	Wed, 11 Jun 2025 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648880;
	bh=ex8KsKH12LSMtycnf5SABL9oUeYEALDAkNqEcx61TOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uv8dgwwV3cs6KC7bXZI/xwvXIASvVzPBn7up6NpqkjrfknAGRGvp0+mDdJ+70u/ND
	 X6eT7GD2n0EVwcN3UvoJHqEYZ1XjHf9TpVk64Do2He1nCZ+aUT29QG8vsyqqN4I1uV
	 S72woiGKNQEOVasrQ2mNU+9rvQQTdiX8iOGdlV1a0g4biN5xtV6BpIR7Vv7T8Vx9Ty
	 1LTe9xdJl87V9UZhTRYG5Qqfr47NDx0vRWZ5scq0Z/C7OR8tarjmlvYOWTYG4vx7tq
	 49tmAJ0Ws0SZ0tPc99o8sRqQs4ogBk50cQVXAvycaC4RbZWVrP1qOV+dxXkA6gqTKZ
	 yPIdmKJq+5hpg==
Date: Wed, 11 Jun 2025 14:34:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64/Kconfig: add LSUI Kconfig
Message-ID: <07190b99-5e8c-4de0-b460-248ec39996f4@sirena.org.uk>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UQjXRDhZmiaJX03S"
Content-Disposition: inline
In-Reply-To: <20250611104916.10636-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--UQjXRDhZmiaJX03S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 11:49:12AM +0100, Yeoreum Yun wrote:

> +menu "v9.6 architectural features"
> +
> +config AS_HAS_LSUI
> +	def_bool $(as-instr,.arch_extension lsui)
> +
> +endmenu # "v9.6 architectural features"
> +

This is adding a menu with no user selectable options, does that not
result in a confusing user experience?  We do often add toolchain
feature checks inside the menus but that's usually associated with
hiding a user selectable option, if there isn't one (or any other option
for that arch version yet) we should probably put the check elsewhere.

--UQjXRDhZmiaJX03S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJheoACgkQJNaLcl1U
h9DOLAf/V3EtUSflmw97gKJt14F9sBXTVsVEsGkxJ9wunrkYfb8CyI9bOFFVyXq4
iRkpd8JSCLaYfaPJcGCVAq/CRZxKpraMUmtdYkHTMQIM/9IsOg7CQv7UXfFopMiQ
DB8QxQ2OTS8eeShNDkYxG3uC445EaE/ZvI86ZO9LtFIQH8gV8bvLBvfZy8JDohp2
Ds0uH1xWljks77BY9LqcdgQkolE5EnFlR2mWZQ+x7I246zsNGheOcRaV+FJ2Q5rL
+s9B7EOynd2TBvGlGnOr6cEOIqYfVvcl9sr/f+MVPEC2Q/YjsuIqaQYHxHnD4b85
q9l0ng7lE+usfRkYZ42wG2IVVGsBEg==
=4/M5
-----END PGP SIGNATURE-----

--UQjXRDhZmiaJX03S--
