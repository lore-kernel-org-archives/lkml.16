Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6641F12FC;
	Tue, 11 Feb 2025 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285002; cv=none; b=sTnPzwKrIM37JPyX6DaNKLg3BLeenaOgxQzNs8q+TyE1PX7QpnoY57l8CF0mioZGKxsQPi6QlVSuVju/JekNmAhYYgXV6OWXSxiIEEi5siVFVQ2QNRj818zm80n6J6eBG5MKNLFYMEQBWB7BCxvcYpW2QLMZDJys1qMzsuansnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285002; c=relaxed/simple;
	bh=7XJ6sQ813gzNVi5Pa7MHabJXhmjCnD8PQpmTLIBUuuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke9W5jo2+PHAIyBCDI20mDCNDqgpthbP+9UmnlYGknvUzj39FbcyQRF7eBNq9XZl3TZmF4vRLI4YqcnllXTXmE8JbzQmvkM/P35d5yylGzWgSPqpMQpUV5mlZgxVGF99dliqdvbikmty+ixsLk516p9Q5eH/JXRUshKrHtxSkNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJsTwJOP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJsTwJOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5763C4CEDD;
	Tue, 11 Feb 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739285002;
	bh=7XJ6sQ813gzNVi5Pa7MHabJXhmjCnD8PQpmTLIBUuuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJsTwJOPPIOkN+bybboObQfcrCNtKQklymfNMMm5DRS4232F30N5KrYSmwTmrg8lN
	 bKnELzFvf9aUiHiVmpuBZwgCBy+wF/clIuWhKveLR7BYxeT4X9tsWYIhupG3CFoNMm
	 hjFA7xyFRQ+b1eviFDGjfjZPt1NckdixJCrZ8n2Q+/g9vC++W4edliV6Muj1DFQ/CI
	 NyLtpNhuhQSYDP9euLuGHNb63FJ7ZHCycgu9XRkpIr46TfLh5kl5AXRzwEg/5EN2Zt
	 dI7AN8RwAUc1Tm5P9kPQtrX3BiuhxvEGSIH7S54BPGCc1HJg1jf4Hd6kky+H8X0fbj
	 aYlh2S4Coaquw==
Date: Tue, 11 Feb 2025 14:43:17 +0000
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
Message-ID: <20250211-crier-gas-7efc51783cf3@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-defensive-lent-04936dac6bdd@spud>
 <579dbdce-e61e-48ed-8685-a2cda9d753c3@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yP3MvfkNzMIcLd+h"
Content-Disposition: inline
In-Reply-To: <579dbdce-e61e-48ed-8685-a2cda9d753c3@rivosinc.com>


--yP3MvfkNzMIcLd+h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:16:45AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the vector extensions. From the
> > kernel's perfective, it's not required to differentiate between the
> > conditions for all the various vector subsets - it's the firmware's job
> > to not report impossible combinations. Instead, the kernel only has to
> > check that the correct config options are enabled and to enforce its
> > requirement of the d extension being present for FPU support.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  3 ++
> >  arch/riscv/kernel/cpufeature.c      | 57 +++++++++++++++++++----------
> >  2 files changed, 40 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/a=
sm/cpufeature.h
> > index 569140d6e639..5d9427ccbc7a 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -56,6 +56,9 @@ void __init riscv_user_isa_enable(void);
> >  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> >  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> >  			    ARRAY_SIZE(_bundled_exts), NULL)
> > +#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validat=
e) \
> > +	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> > +			    ARRAY_SIZE(_bundled_exts), _validate)
> > =20
> >  /* Used to declare extensions that are a superset of other extensions =
(Zvbb for instance) */
> >  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index c6ba750536c3..40a24b08d905 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -109,6 +109,35 @@ static int riscv_ext_zicboz_validate(const struct =
riscv_isa_ext_data *data,
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data=
 *data,
> > +				       const unsigned long *isa_bitmap)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_=
data *data,
> > +					   const unsigned long *isa_bitmap)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > +		return -EINVAL;
> > +
> > +	if (!IS_ENABLED(CONFIG_FPU))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The kernel doesn't support systems that don't implement both of
> > +	 * F and D, so if any of the vector extensions that do floating point
> > +	 * are to be usable, both floating point extensions need to be usable.
> > +	 */
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
>=20
> I think this should also be modified to be like this:
>=20
>   if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> 	  return 0;
>=20
>   return -EPROBEDEFER;
>=20
> That won't actually change the way it works since RISCV_ISA_EXT_d (and
> all single letter extensions) is always probed before the others though.

I don't think so, there's no point deferring since we know that the
extensions this is used for cannot become true afterwards. I'll add a
comment justifying it.

--yP3MvfkNzMIcLd+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tiBQAKCRB4tDGHoIJi
0muEAPsGqCMsvt9Wk798W6VjgLphAcoDAkn3u/euA10G3WgSlAD+PzU6dcrNPwC/
TRcmECWfmlyz3+wAVQTlJeZFAyoK/w8=
=TcVj
-----END PGP SIGNATURE-----

--yP3MvfkNzMIcLd+h--
