Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7818722FF2D;
	Tue, 11 Feb 2025 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281513; cv=none; b=X6i5guLpHN2htH9thidLeEvrTcMUwUTBIgxnMYWMyp3e5NTSsgb1hlkHDq+tI49cce6WqV8gXm7vu+wwkp5CZqSZ7aWlHbl4VmiolBCclEdTAr9+2XHlvWL/3qj+flhTFFT83mzX+buXEYB1Ncukd0ZWx87Qis18iIXUyrThyu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281513; c=relaxed/simple;
	bh=gfp/lscMg8Zqo5eVValThcg9uc0spTm0nNpPie2Egn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTtsrcixP/irt33uGr7y+ccegBVyRZ0Dar0KB4ShSF8oj6o1KZOxzNO2gDoIJKSqBfmZ8etkc5Ogu7ssuMaLPHM+E5e05e1g2OZM0T9mj79TK7nqsNgPvbiZcePIsBdkNHBYWEHzdYygeK9c8ge6Ua35z0dd5jsgbeYV4TR8qXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ho6Q784H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ho6Q784H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9529EC4CEDD;
	Tue, 11 Feb 2025 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281512;
	bh=gfp/lscMg8Zqo5eVValThcg9uc0spTm0nNpPie2Egn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ho6Q784Hr4pay/kPWa7uGDgtMy2D2FV4ugDHgSlsJ90OhNcI6+j44Dhy/rxmPRxRU
	 6KpHg2E1U+Rkd8IZntVBCl7qRFB27olxZOmxcfinJqgwVkkZRZ+D0TRb4QfGnGw5Tc
	 iBxKbaCZGLt8tfVEO76QPX/ft9d5qWgIcdKztRm+BtJpUTE6hWj+5lvgVbCsBmiEtH
	 VBBclUr0pnOlRWzH5M7jXbluxLrSHPe2HC+i8/eJyVL0MqYBXSe1xYN3N6JBmw/j0V
	 NP2ezJMEYH/NieO2HnxhwWEmAB8WGD8cY03OHDS90szEfPDkhWBDQX7/3+okNjH8qc
	 vMAqBfV/xvhxg==
Date: Tue, 11 Feb 2025 13:45:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Message-ID: <20250211-dizziness-eclair-2ef49cc5ad0e@spud>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
 <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
 <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Se8lg8BspTeEI14q"
Content-Disposition: inline
In-Reply-To: <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>


--Se8lg8BspTeEI14q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 08:42:39AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 10, 2025 at 03:38:58PM +0100, Cl=E9ment L=E9ger wrote:
> >=20
> >=20
> > On 06/12/2024 06:58, Inochi Amaoto wrote:
> > > Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> > > were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> > > the riscv-isa-manual.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  arch/riscv/include/asm/hwcap.h | 3 +++
> > >  arch/riscv/kernel/cpufeature.c | 3 +++
> > >  2 files changed, 6 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> > > index 869da082252a..14cc29f2a723 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -100,6 +100,9 @@
> > >  #define RISCV_ISA_EXT_ZICCRSE		91
> > >  #define RISCV_ISA_EXT_SVADE		92
> > >  #define RISCV_ISA_EXT_SVADU		93
> > > +#define RISCV_ISA_EXT_ZFBFMIN		94
> > > +#define RISCV_ISA_EXT_ZVFBFMIN		95
> > > +#define RISCV_ISA_EXT_ZVFBFWMA		96
> > > =20
> > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > =20
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index c0916ed318c2..5cfcab139568 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> > >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> > >  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> > >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> > > +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
> >=20
> > Hi Inochi,
> >=20
> > You could add a validation callback to that extension:
> >=20
> > static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
> > 			       const unsigned long *isa_bitmap)
> > {
> > 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> > 		return 0;
> >=20
> > 	return -EPROBE_DEFER;
> > }
> >=20
> >   ...
> >   __RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN,
> > riscv_ext_f_depends),
> >=20
> >=20
> > But I'm ok with the current state of that patch since I have the same
> > thing coming for other extensions as well.=20
>=20
>=20
> I think it is good for me to add the check, and I wonder it is possible
> to add the extra check for zvfbfmin and zvfbfwma like this:
>=20
> static int riscv_ext_zvfbfmin_validate(const struct riscv_isa_ext_data *d=
ata,
> 				       const unsigned long *isa_bitmap)
> {
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_v))
> 		return 0;

This is not needed I think, V "turns on" Zve32f. If anything, you should
be checking for CONFIG_RISCV_ISA_V here ^^

You /could/ call the resulting riscv_vector_f_validate(), since this is
nothing specific to Zvfvfmin, and could be used for another extension
that requires a Zve32f or Zve64 minimum base.

>=20
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32F))
> 		return 0;
>=20
> 	return -EPROBE_DEFER;
> }
>=20
> static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *d=
ata,
> 				       const unsigned long *isa_bitmap)
> {
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZFBFMIN) &&
> 	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVFBFMIN))
> 		return 0;
>=20
> 	return -EPROBE_DEFER;
> }
>=20
> > So with or without my previous comment fixed:
> >=20
> > Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >=20
> > Thanks,
> >=20
> > Cl=E9ment
> >=20
>=20
> Thanks,
>=20
> Regards,
> Inochi
>=20
> > >  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> > >  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> > >  	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> > > @@ -373,6 +374,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> > >  	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d=
_exts),
> > >  	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f=
_exts),
> > >  	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x=
_exts),
> > > +	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
> > > +	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
> > >  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
> > >  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
> > >  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> >=20

--Se8lg8BspTeEI14q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tUYgAKCRB4tDGHoIJi
0jpAAQCJT260gZ44MqS5WAFaSS3YHM7pcKksbbBcRbLLRJRt1QEA1VuoISvTOdKy
o4hirdu8NCqh0sYTznq3JAJE5ckAFw4=
=fqGt
-----END PGP SIGNATURE-----

--Se8lg8BspTeEI14q--
