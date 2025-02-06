Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE320C473;
	Thu,  6 Feb 2025 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840787; cv=none; b=N254PrNl9eQ9IFbKHf/BfVtWbsnibyErqSJzH3b2xbAeoKrRVq744S4jKpBIZhNbdJRIxqXPQiq/EiCySSXJIYQkomDphs1aLwhMbSwo442NaLQQAmBU+JqRTnsH7BmodszPqHqGvJXW7YLm9xjN8vObxZeyCO3MNSBs7whthvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840787; c=relaxed/simple;
	bh=3XahQA8TQAgihPAyJGt25gw9A3FPf+HkIq/LUtxGP0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVSzONqXyjk13XStcMMsoEfQ6iI99i4TrQP4AOAwXRATJdTc/by9WbX8YV1sonLKGODYkG+Ig9pQckhLw3PcDYFo06XKuDnQBo7OFvYm3L3zsqNBaRWnyzs3lcsDizCbsRIoJMmeOylxUoAcjq48Od6H/OpgO5pSbdD8iw0L6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBvz8toN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBvz8toN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50286C4CEE0;
	Thu,  6 Feb 2025 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738840787;
	bh=3XahQA8TQAgihPAyJGt25gw9A3FPf+HkIq/LUtxGP0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBvz8toNMyQ6ZjYf/IQq9RRVau1wIWEhGT6FxGSGHStmdqm7sNhXRYBqIQwINV2ar
	 XAu8OAohsqsvvlbpMuUoEhmV0NDoJT3cyr1IEySvpieiTroP51g6D4wOHJw3Q3d6va
	 miWNmARGY/FAdLouIPUldsp5fo9RtTAq6Q7uy0mNgBZGmdKQCz7q2UZ7B0pN5k8BwX
	 8PeD0mG5T01NAY9irTXqYo18NyrWeefyhCTOo9fgV1jR2A9HRw0D6IJAS6XLD4IoEx
	 8q0wonF5v5mNRYhAiKoA5vNQbSocZRHTcxP6xlNzIv3KZ2uEFMhhc+RTnrunbt0SSR
	 pncO6pJNP414g==
Date: Thu, 6 Feb 2025 11:19:43 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] RISC-V: add vector extension validation checks
Message-ID: <20250206-silica-outscore-b2ec7ff9e945@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-defensive-lent-04936dac6bdd@spud>
 <0df559c7-920d-4d89-b1c8-75380750e7e1@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V6mvoxu1BVi3A3Yn"
Content-Disposition: inline
In-Reply-To: <0df559c7-920d-4d89-b1c8-75380750e7e1@rivosinc.com>


--V6mvoxu1BVi3A3Yn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 11:08:57AM +0100, Cl=E9ment L=E9ger wrote:
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >  static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> >  				 const unsigned long *isa_bitmap)
> >  {
> > @@ -326,12 +355,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
> >  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> >  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> > -	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, r=
iscv_ext_vector_float_validate),
> >  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> > -	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv=
_xlinuxenvcfg_exts,
> > -					  riscv_ext_zicbom_validate),
> > -	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv=
_xlinuxenvcfg_exts,
> > -					  riscv_ext_zicboz_validate),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv=
_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv=
_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
>=20
> This chunk seems to just remove line wrapping for existing code, not
> sure if this is intended.

I probably removed the line wrapping from it in passing because I found
the array very difficult to follow once all the validate callbacks were
added to it with correct line wrapping applied. I did intend to not line
wrap what I was adding, I forgot I removed line wrapping for existing
stuff too.


--V6mvoxu1BVi3A3Yn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6SazgAKCRB4tDGHoIJi
0mMmAP93yvPqPwcG5qUxXWQ3qHHgVY+taj5FOU7P3hoG2VFyBQEAyHkOHxBY8WCW
xApKqajWM/qiauG9iUUCYYs7+cSzDwM=
=SMY1
-----END PGP SIGNATURE-----

--V6mvoxu1BVi3A3Yn--
