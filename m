Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2A1F473C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443152; cv=none; b=FTV8OzddsHdSRboH2R4nxyYvj30e+oFHRp1iL0GhgWhW5K22NeuKYBw4FW4MigVi5RUDqc9N3RtgrS9LMvRf93pZjlf/WCcG/VqEVtwFhLUWhYTrgfUbw102e7ojf/MU1zIQNvxrx6t8oeMHV+3Nouzqe0WQO6uwz3mZ5jZxFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443152; c=relaxed/simple;
	bh=MDmnkq8+Itlg3khoIZNBGAIgH4Fb/xMO2XKebl8pjFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlkXkVwZj2LT62iYuhzuV0t6BWEBWNTL3Yn4qlGutx1xFyHHqve4PcumzmdOvWv2yBr2gPDuouZoPKRswq6vC10XUxtIuFHTLY5oYMFqMEGVCChz5DEHJ4QCmuYGEqTR0fdZvbfK/OFSlg0dAMHLsM3VqXrB58XjH7/T/nHZIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=We/bsCcO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="We/bsCcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33433C4CEED;
	Wed, 28 May 2025 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443150;
	bh=MDmnkq8+Itlg3khoIZNBGAIgH4Fb/xMO2XKebl8pjFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We/bsCcOlCTZfNb1DUVQgicc8PAfli6EFlqnWncULdYK/TmHdJHOWhZ3OUh/jaFSL
	 omS7gB7RwuJ8+veFWfewUHEoWJXQpWK0tVAKSOF+R/e0zjVWZJHXOW6OJJpwSNh0hn
	 72TsGoFyuwUtCR1jN9H03yfHdfOfwUvg5p4Ve75BiwFeA4UGwOb1vyHy8nZD5zq2vN
	 JpaNchKBLi7KHvlpn4nC7Hk4BvdPXiugKaagEE5mIZbthW1y9cCnEMwdfHV1E35J+f
	 ol4MPdBSldz7PxoFjq16jzWZ+EyGbkD0DpSf7USAZH4agtpg1KwXp4tNs+iivUbIYZ
	 zI2nK49X6e8dw==
Date: Wed, 28 May 2025 15:39:07 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: cpufeature: add validation for zfa, zfh and zfhmin
Message-ID: <20250528-stuffing-parasitic-89064d69d780@spud>
References: <20250527100001.33284-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KDMI6SrfLb5YgK4d"
Content-Disposition: inline
In-Reply-To: <20250527100001.33284-1-cleger@rivosinc.com>


--KDMI6SrfLb5YgK4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:00:00PM +0200, Cl=E9ment L=E9ger wrote:
> These extensions depends on the F one. Add a validation callback
> checking for the F extension to be present. Now that extensions are
> correctly reported using the F/D presence, we can remove the
> has_fpu() check in hwprobe_isa_ext0().
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--KDMI6SrfLb5YgK4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcgCgAKCRB4tDGHoIJi
0tcIAP96A+ZQ0TxlKr55JHZ0NuqQ1MG8NvB7955IHUTsvSSHSwEAiC6UiaVfS5AS
pw2FqoPvoXb/TdUUyuHoIubHVOoX5ws=
=g5Ge
-----END PGP SIGNATURE-----

--KDMI6SrfLb5YgK4d--
