Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB842214203;
	Thu,  6 Feb 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841083; cv=none; b=nUGw5IClF0HpS36BGjEB4uJABAq9DrP1jGmSeE92IcNSqVXRUQHrwZnvJhc8Zhsvi/GHsIQhA7lpDlpPJYWPkBMPvOn0YzrQDzA2mpTEFbW+hPAuCE8HS7Nej+Xlsi15fm2w8yyvcWRSMj1YpGU1J1twkuoh4BhLhPXmA18tdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841083; c=relaxed/simple;
	bh=sNzc9rpJrSGgiXFYTxSNOLd9piOIMO0s74xHHWxepHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur/aDpQKGcXVXy6tLR0ajQxTv9kRTvZcP8loPEwOkPIQn/zxrTV0tJ4sfjTiaPUheBdEjq4qaxqWmdCzxbrBGHZCNFWm34/ZbULLltQrJBJQk/tNPfuikPyLg4Ba5VHtWGtAocj4BjcSf/K4A3nTLXBxrN8c55zvXh9VzQGSlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G90odWPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G90odWPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5272FC4CEDD;
	Thu,  6 Feb 2025 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841082;
	bh=sNzc9rpJrSGgiXFYTxSNOLd9piOIMO0s74xHHWxepHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G90odWPxAXNcL5p8b/ZM6942sxWRYqIyydeudZGXD7kDgY9UdK6wJb20MdLg/aSp0
	 9IDUywrkI2UzLH+JdHjbcyKaq+jnZOSfai2sF8LU+n1oxJKC6fzU8scOHU7e8NC10r
	 BTTlrg0L4UgJkjQICHlroN4o6IoU8OYMoNxQhBW5+2EHF+ClinNegdSlybx7vazQLW
	 cgYYu+wxSa/LHSL8crd+mR/i/SpuC1eWFtX/0+FADDTDWQRREH+ptLR34MpyG6upJ5
	 BgxACN0F58lagv7sBgUSiTBxamJ5sd6D5NBRV0pZLOkoYicvbU7d8sHXHdozPOWaxf
	 P81Kwk0ihXTdA==
Date: Thu, 6 Feb 2025 11:24:38 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20250206-overcook-legibly-0350a9af8a2a@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1iqbN1jWYKwYUDZR"
Content-Disposition: inline
In-Reply-To: <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>


--1iqbN1jWYKwYUDZR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 11:20:35AM +0100, Cl=E9ment L=E9ger wrote:
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the vector crpyto extensions.
> > Currently riscv_isa_extension_available(<vector crypto>) will return
> > true on systems that support the extensions but vector itself has been
> > disabled by the kernel, adding validation callbacks will prevent such a
> > scenario from occuring and make the behaviour of the extension detection
> > functions more consistent with user expectations - it's not expected to
> > have to check for vector AND the specific crypto extension.
> >=20
> > The 1.0.0 Vector crypto spec states:
> > 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> > 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> > 	or application ("V") base Vector Extension. All of the other
> > 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> > 	application ("V") base Vector Extension.
> > and this could be used as the basis for checking that the correct base
> > for individual crypto extensions, but that's not really the kernel's job
> > in my opinion and it is sufficient to leave that sort of precision to
> > the dt-bindings. The kernel only needs to make sure that vector, in some
> > form, is available.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
>=20
> To which part of the commit does this refer to ?

Copy-paste mistake when splitting in two, whoops.

> > @@ -397,8 +414,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> >  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> >  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
> > -	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
> > -	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvb=
b_exts, riscv_ext_vector_x_validate),
> > +	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vec=
tor_crypto_validate),

>=20
> I'm not sure if I already made that comment, so here we go again.
> Shouldn't Zvbb use riscv_ext_vector_crypto_validate() as well ?  The
> spec states that Zvbb is a superset of Zvkb and Zvkb uses the
> riscv_ext_vector_crypto_validate() validation callback. I guess Zvbc
> should also use it based on your spec excerpt in the commmit log.

Zvbc does use it, no? I'll amend the Zvbb one, there should only be two
users of the "x" variant.

--1iqbN1jWYKwYUDZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Sb9QAKCRB4tDGHoIJi
0ldwAP983+O6h9quEOj+A8/HT/Ck02DGt4dHGhmvorY2AWRn6AEA45wAgwsU68ns
s/Feax0psZjLxql/U1SmCwWvWvDHiAc=
=FI6o
-----END PGP SIGNATURE-----

--1iqbN1jWYKwYUDZR--
