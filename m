Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9096FB9;
	Tue, 11 Feb 2025 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277302; cv=none; b=TavpuWnTDj2uceOR452pjj4rsAoEKTlsJZRy3RfR03QYlnvLwybqkDRkrai/ifbLIU0+GgWy/zH0+8PGVQRZtou2O5z0o1Miawdp+1LaWBFDPVbMIoOuXbgZSaEJ72Xl20xsdp4dNf/imivkkPK2IAiksAeWQ4RaufgBIllLOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277302; c=relaxed/simple;
	bh=MA14njnJTflw/O+wK7u99/DEzkLn82WquM8a6RvG0Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD6QKXjp1LWGm4yNBHo99i+fyPdC+mCr2JszHmuwWbBXmX+toD7arc3hz5FOT8Ia1z0c+9HKDqL0dKapGejBZUIjgzuJT0xrCQOol4uRe6o3BBPKfTz5f9R9x1rKymti6eZOKS3dohLo0JicxAcyGT7LOH/QEkAizLjMJdQ6ypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOjrMX6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOjrMX6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AFAC4CEDD;
	Tue, 11 Feb 2025 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739277302;
	bh=MA14njnJTflw/O+wK7u99/DEzkLn82WquM8a6RvG0Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOjrMX6LCFqH0i2YuNm9+qyiW/Eb92E4QreqJ2T9+GlDiXgX0Jte8aGHcOXFbLmxU
	 gQ1FfAm54IJx1GhDUrrdjH9AIggQvdCusC3fd1kDlkCVNHxIhJj5b2aG7ddaErmAsw
	 SKZjQCI59+Vm0NVrZ+wjJt9cquceo3ChPd0QGEg3DcSvZ59tXQfJnSRGMHhtqzQ3LW
	 cRr2VhUJauJVgc0rulls9zzoMF9hrFZ+OB0fQ+a99AMpgwkh+8RcMxCvrZOemrBJ1r
	 LHVP06OAVbozyEKNRRUey2NkYmJo0FjUSDwT54h8h7pPxJRJex5recJzei7hoixe/P
	 RT/tET6XJS7jg==
Date: Tue, 11 Feb 2025 12:34:57 +0000
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
Message-ID: <20250211-implode-mute-8ff31f44bdf9@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <f1ce7aa9-63e3-41bd-9bb0-a54ebc714dff@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2QQXwfJwMNFQMRKG"
Content-Disposition: inline
In-Reply-To: <f1ce7aa9-63e3-41bd-9bb0-a54ebc714dff@rivosinc.com>


--2QQXwfJwMNFQMRKG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 09:45:44AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
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
> >=20
> > Link: https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
> >  1 file changed, 33 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 40a24b08d905..1c148ecea612 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -138,6 +138,23 @@ static int riscv_ext_vector_float_validate(const s=
truct riscv_isa_ext_data *data
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_vector_crypto_validate(const struct riscv_isa_ext=
_data *data,
> > +					    const unsigned long *isa_bitmap)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * It isn't the kernel's job to check that the binding is correct, so
> > +	 * it should be enough to check that any of the vector extensions are
> > +	 * enabled, which in-turn means that vector is usable in this kernel
> > +	 */
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X=
))
> > +		return -EINVAL;
>=20
> After a second thought, I think it should be this:
>=20
> if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
> 	return 0;
>=20
> return -EPROBEDEFER;
>=20
> Extensions can be enabled later (but can not be "reverted") so check for
> the extension to be present (in which case it's ok), or wait for it to
> be (potentially) enabled.

Ah, of course it is operating on the /resolved/ isa, not the source one.
Makes me thing the parameter of all the validate callbacks should be
"resolved_isa_bitmap" instead of "isa_bitmap" to make things clearer?


--2QQXwfJwMNFQMRKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tD8QAKCRB4tDGHoIJi
0rbMAP4r/yeGzY8gnolAtoXxntJZm835aG220lRMaGrFycBfywD/dVqx4BlphFDL
rdGYdaDO/nBthbezTn7ZCNX4CIT5QAM=
=5wwm
-----END PGP SIGNATURE-----

--2QQXwfJwMNFQMRKG--
