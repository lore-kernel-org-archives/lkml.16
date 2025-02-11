Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076251F417C;
	Tue, 11 Feb 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275609; cv=none; b=U8F6oYArTglD6H35frqzu4jQHuPv6nvsToGk/isM9EGo8/iYYsXiSRov1rdnYtIrxeR1JB3Z50lmq0kk9kIEosvAnjgZ/8vf6WD8fGq/eUjYZUhRjLfLsAtz7+mYh+L9s6hkmm1Lf7wE31hE50yFLQkYKU3Whc3Hc1qCPvvBCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275609; c=relaxed/simple;
	bh=i7+ekkT9TnIZYnI8SWpO1ROV9Pa3oWltrv4zlRMPpAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hi5R4lVoBFL0breH9+/aU5eJA01sKdIv0LY4S+rwNE4jHd2uNS9KMlRRnybP/K0hQaAsw1addZ4YG/PAvpO9D/8eloRxrycfvREhrmoNBLw+hoMGyBJ2i/oCq/cpa+oGxsvoujOaGawCqz5W4/0Qq5ghdmoJtemneP3HMsRVgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkQW98gJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkQW98gJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41443C4CEDD;
	Tue, 11 Feb 2025 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739275608;
	bh=i7+ekkT9TnIZYnI8SWpO1ROV9Pa3oWltrv4zlRMPpAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkQW98gJjoQ4CF6Mxndd5RcnONq0pHOBrXhErcD8ckKyL41UVwmMF4zoqAnd1bisB
	 QM16aFq+WbqQaEflbrxARxJFBYNVcZ7iOK/FEcpYwurGNY1qhzaD+mGzn3eD8ox9am
	 oR3VjwsIwwHUIEC+TfUYEBP52aVyEn4fb1EHt3mhxSFAXLagSYZs9tCbbapBWNUCxq
	 +NrzGJOWkX818kGoY+q+s3SNMbwRD86jRY8EaMRdUlR3l340W0LiUt+/1OPtCudC1/
	 263EPNtkhfUnR6Y/hKaa8qeUZaUnMUYbCoLps9Lig0M/ydlU6bsSBkG+ehfJkz8byu
	 n9wq4xHTZMFww==
Date: Tue, 11 Feb 2025 12:06:44 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] RISC-V: add f & d extension validation checks
Message-ID: <20250211-phobia-spiritism-3c0ffba5315d@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-stifle-remake-4e497e96fd66@spud>
 <cfd0a7d1-464f-468d-9302-46d6b28efe5f@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YYCpN0mPd1hMFh+l"
Content-Disposition: inline
In-Reply-To: <cfd0a7d1-464f-468d-9302-46d6b28efe5f@rivosinc.com>


--YYCpN0mPd1hMFh+l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:22:13AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the floating point extensions.
> >=20
> > The check for "d" might be slightly confusingly shorter than that of "f=
",
> > despite "d" depending on "f". This is because the requirement that a
> > hart supporting double precision must also support single precision,
> > should be validated by dt-bindings etc, not the kernel but lack of
> > support for single precision only is a limitation of the kernel.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 1c148ecea612..ad4fbaa4ff0d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -109,6 +109,29 @@ static int riscv_ext_zicboz_validate(const struct =
riscv_isa_ext_data *data,
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
> > +				const unsigned long *isa_bitmap)
> > +{
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
> > +		pr_warn_once("This kernel does not support systems with F but not D\=
n");
> > +		return -EINVAL;
> > +	}
>=20
> While I tested to remove the RISCV_ISA_EXT_d from the input isa bitmap
> and it worked, I didn't realized that it was due to the probe order of
> single letter extensions. D is probed before F so that works as
> expected. But returning -EPROBEDEFER would not allow to display the
> warn_once or wrongly display it if D was not yet probed. So I'm inclined
> to keep it as is and rely on probe order (a bit fragile but for single
> letter extensions, that seems acceptable).

I guess it's worth adding a comment to that effect.

> > +
> > +	if (!IS_ENABLED(CONFIG_FPU))
> > +		return -EINVAL;
>=20
> I would have actually move that chunk before the
> __riscv_isa_extension_available() check so that the whole function body
> is elided if FPU is disabled.

I think you're right, but for another reason too - warning when someone
has turned off CONIFG_FPU doesn't make sense.

--YYCpN0mPd1hMFh+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6s9UwAKCRB4tDGHoIJi
0mlpAPsHpRmdh/Bp/K38cfzgKnrQzJ05SFAo2DNse6NjPs0maQD/eLtlJ7siAn9q
UQsqvwfZVOoiVkZ2sFfrw2hiMSUT/QA=
=BtAZ
-----END PGP SIGNATURE-----

--YYCpN0mPd1hMFh+l--
