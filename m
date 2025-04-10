Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE92165E9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280511; cv=none; b=ifZ9uupLt7ORDqeoCcmDZsSdB2mDCK3ARUqxKPS/RGQHVG4lZrO0UGa3qlTn0UimZJK6ZP8Isq9JsKKy3VQrmFczfyhAJ2rbjyWzBNTh0p1y9pQoJDjonld302ndu9CRPLH6AnPr9oMf4flr6laovu3fT+dR6OoPeg2lhrbl/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280511; c=relaxed/simple;
	bh=UQ1IvRSCRSbhc1Hlr/Yycuqw9SEYIVv6v4trUn6pPIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2YVwuAfPDbuZfVW0Z9d0zVTaAruE8G1LymDmh3NTk0sokNyiocaZdtUN7IxRaSuigoGTGqQxmaSWJ6C40E3WdherZU2tkQBi9520TlxJ8NRhkRqXocJrckt8H50js648d48ybssyL/MN5B9iJVAyHDVxttWypf2jpOf3F4a7YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKQj9bsw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKQj9bsw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D3EC4CEDD;
	Thu, 10 Apr 2025 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744280510;
	bh=UQ1IvRSCRSbhc1Hlr/Yycuqw9SEYIVv6v4trUn6pPIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKQj9bswWywx7TJJoaEBwFw4KXtbt4h2DKmnIeM1Di2oNsLsyHlOSJzoMbrcVxsWQ
	 SJYjzRFc7FRBfbEeTKPs6cIGiIq68v8ntPgssbzdjujQ+ekt4oyTK5vh0SX6qcID3f
	 87tIuCNOQD0mz7Jho3a+sUGEkGa1jV6XBiZWlvRWWudj9RiFOU84Z3lPEZc8unBPJ4
	 slRnRW21p4BO2fZwjz84nTysaOmeWRsDw2d4e4HQxvN0ljewplIapkqDSiUjii4Cym
	 RBxyPxZPNZ+ZbDYZcjiWZS2n4YoYCmK2mLoWGWpTM05El7ZuHBTMyLz6dh00hAtCC/
	 JqfsAThVg6/Gg==
Date: Thu, 10 Apr 2025 11:21:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Allow for riscv-clock to pick up mmio address.
Message-ID: <20250410-squeezing-outcast-f717ff17817c@spud>
References: <20250409143816.15802-1-aleksa.paunovic@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tFc/ze0LDYRx+0Dl"
Content-Disposition: inline
In-Reply-To: <20250409143816.15802-1-aleksa.paunovic@htecgroup.com>


--tFc/ze0LDYRx+0Dl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2025 at 02:38:55PM +0000, Aleksa Paunovic wrote:
> From: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>
>=20
> Allows faster rdtime access via GCR.U mtime shadow register on p8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

> +#if defined(CONFIG_RISCV_TIME_MMIO)
> +	gcru =3D of_find_compatible_node(NULL, NULL, "mti,p8700-gcru");

Firstly, this is an undocumented compatible, so you'll need to create a
binding for it before you can use it. Not much to say on the use of the
compatible in the driver without more information on what the device
looks like.

Secondly, the option you have added is generically named and described,
yet only functions on this p8700 platform. At a minimum, it needs to
explain the platforms where it is relevant, and probably also should
depend on the kconfig option that enables building a dt etc for the
p8700 platform in the first place.

Cheers,
Conor.

> +	if (gcru) {
> +		if (!of_property_read_u64_index(gcru, "reg", 0, &mmio_addr)) {
> +			riscv_time_val =3D ioremap((long)mmio_addr, 8);
> +			if (riscv_time_val) {
> +				pr_info("Using mmio time register at 0x%llx\n",
> +					mmio_addr);
> +				static_branch_enable(
> +					&riscv_time_mmio_available);
> +			} else {
> +				pr_warn("Unable to use mmio time at 0x%llx\n",
> +					mmio_addr);
> +			}
> +			of_node_put(gcru);
> +		}
> +	}
> +#endif


--tFc/ze0LDYRx+0Dl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/ebugAKCRB4tDGHoIJi
0rl/AQDbGzCkjJQEsHIRMxKSPxfqIETRiNCXHm2seBMv2mCWyAD/cx1SfocGoajP
MnAzkYvx/SxFsY7Ca6bk0h/1fuXEow0=
=giwb
-----END PGP SIGNATURE-----

--tFc/ze0LDYRx+0Dl--
