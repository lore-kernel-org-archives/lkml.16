Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E11A83E8;
	Wed, 11 Jun 2025 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655229; cv=none; b=D33aeH1vSxSoSKZoG9TyR5n8kuEn3kgOsrEmSsclrlAcGAi+QC2XTnZtlw+p1mX/8HPBJ2kZDktwPKlRY91XuqXqN7b2d/nQJqXj6qRq8T8vgan4Xu9uHLHNxCvD2y7EzLeb299iGqz+tEIK3AWDFHSdbDKmKWxkihUUEdDiJrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655229; c=relaxed/simple;
	bh=doqV80or5FFXZrFJ4XVxJqCcisBBjET6FQ2n9ahub0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpWz0E36Ix8Hwk3kY9jVchwJmnGA06QllrurAk1YGt/VMoQjd2LJHasUBegMvEuDV19kfI1zgl0jZt86qZRJGb7KEJjJ/R/1Gsn99xPNQvbeG3eab2LMPK0bEqLdZ3u7UyIK+QYl0MYDX5P/qWsiF531bCEaVHS/rGKYPIbhOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBfaOG2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBfaOG2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AAAC4CEEA;
	Wed, 11 Jun 2025 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655229;
	bh=doqV80or5FFXZrFJ4XVxJqCcisBBjET6FQ2n9ahub0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBfaOG2dCW9MelJdcsJ7M7PJxO9mfCeNhStKdABckr06yt5avy4OZ9JbI9B+2JOFq
	 oZKZx/6SQCU4g8bgG10/PyAOsU8wnCnvL6gu88omNVcfvFl/p0R5jQP5Ygfl2b3GLn
	 vxhV0CI60qhadkL3doN/eC3pOjMuLJ34qJuA7wTVxVBP42KrwhccjUffIa2NzUbl5F
	 eVDa3XsBm++zsKzJOen29QAwvzsiVW4McAbE/T6q/FjdEd7zKEug+aKb7f+J41Lesr
	 +sPFvEOXwHchTcJ5IGHazcEt3P/dNDGtrpn7uPfe0gQggTdnUypApryeEu45PFztys
	 k1QutgF3XktBA==
Date: Wed, 11 Jun 2025 16:20:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 5/9] kselftest/arm64/mte: check MTE_FAR feature is
 supported
Message-ID: <319315bf-48f3-4482-99f0-e8cb03ce049b@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-6-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LLcsBgYhYhSy6VHW"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-6-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--LLcsBgYhYhSy6VHW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 02:58:14PM +0100, Yeoreum Yun wrote:
> To run the MTE_FAR test when cpu supports MTE_FAR feature,
> check the MTE_FAR feature is supported in mte test.

Reviewed-by: Mark Brown <broonie@kernel.org>

--LLcsBgYhYhSy6VHW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJnrYACgkQJNaLcl1U
h9DTogf/XEk8iMJBi79waQjbN4WVhdwRu16ZFgYl5bfzdpd2P2Wax05Rwfiy+Heb
jCCSLf3+Z2KtUWm20Qavvb86/tnscSg72xIrc8piejxltT5yJeJwJzCv8tcRyJdf
+s0LMSfwoNVePKIQkldVgUQ2Dxukz+0xVE/tN/62dgxRU+/fCKDuiU/K3zZphNfo
Da8ps0g1pqHwm7ee45Q2AW62x83TYU2+Wfj0keaAj7rJ+EgAezJ8WybmtSQpA2XL
SUhttLWjlqG0eHt4ljxpz+8raoXbClNu48CwJEVYCHQS1hUlBGOseUOOE6KNYNxN
Z1bNUQVdjn7hzOSL1zCJ/iLOtOrDmQ==
=jV/l
-----END PGP SIGNATURE-----

--LLcsBgYhYhSy6VHW--
