Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6041C863B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656206; cv=none; b=qszpAh2m0kXSIbxV0hwOM/2KPHRRPoBN6nP6WdwGezahQLM6sw/NMQsyE8SGo+YQrIK34hdlgGctnalWWWoCF+5iZcYhKFhuO1w7Dkh9vOG0Q37lO1/deQAZ24d9crI2K8G5OX95srlnszTUxT9EBjjob0UZLGldgbmzijRkw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656206; c=relaxed/simple;
	bh=iE0MsktbDEMe3NLkiMxHJ519do5Gp8up7Y9Iq9kO5V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBqAslI50XwQI142T6zN9QyEUwaMiT0c9+E7EyVj+UqJnMacTyFXalOX2/HM9qHMma/1NbjTHWbEdZG1OvsEGJxNMdGH2fqqdljwPllsyM86R8Yq1+OI0rGhCAXSzwyWOSoeolGyedlHBabr9SKs5l9TnJCMgGYRxRRnbLYx5uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXQjSNxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXQjSNxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8156CC4CEEA;
	Wed, 11 Jun 2025 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656205;
	bh=iE0MsktbDEMe3NLkiMxHJ519do5Gp8up7Y9Iq9kO5V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXQjSNxCJTeqeegmbFdkSEgGydMfw1q2EzY7nfu6TP79lu6Y1w/QZ4alluV9H/1rB
	 LY4OpXs/tAy3LXTiRgQyzMByUxajWO62YlX7Y6dyPcUSxII/za5Ll5j144M3v5VCXj
	 6ymDsMBUlNvy+c2o7QvA760lkfYcETuIjYFKi3NrKyq4+L1Ln94PWSh6g68h46LOYD
	 wnLWBq6GKD/rv060wPTqVnGpL6ZwlIxcAhsNX0+WarpP1TePGzqd7S9DPF7IwX4XbX
	 JndHjGb/UCOO7/v5wU8YxtJ9dm+8kXTbbiboKj3e4yv1qqGfGSvF+69NU5oU6FOOQE
	 St1Fji7ZadEUg==
Date: Wed, 11 Jun 2025 16:36:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] prctl: introduce PR_MTE_STORE_ONLY
Message-ID: <ec2c5126-86da-45a2-b9fb-06433583f13c@sirena.org.uk>
References: <20250611150417.44850-1-yeoreum.yun@arm.com>
 <20250611150417.44850-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z1q5nUGgyyOUCQhx"
Content-Disposition: inline
In-Reply-To: <20250611150417.44850-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--z1q5nUGgyyOUCQhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:04:12PM +0100, Yeoreum Yun wrote:
> PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> opeartion only.
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Tested-by: Mark Brown <broonie@kernel.org>

Sorry, that should've been

Reviewed-by: Mark Brown <broonie@kernel.org>

--z1q5nUGgyyOUCQhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJooYACgkQJNaLcl1U
h9Dzbgf/YGEQLbpkxxNiUEd6pltNKikXu/3VHVIRPWWzDDb5wtSuHFhoIqeN3nYe
WmJpaGNEUQyoVK6kkUh7TTirgED4cKJMG89RKFq6XXFVfd4yZbeKsLUhJwOk+zy4
NYu5zdnoM004pbgzdgaaw2tR2sbKTXu3j3O2dIxfMGUXYbREbsLDFHr4EbGXrUaj
R6ZtqSqrnr+F+Gs+Tu9T3lnbQgBBHUHIb8epsLCBr3rMpJQjmIiX5KfFq8nJ3dqk
gv2Gps01wkUk7KNglhjKuxWYr1kttGldT4Osdcj37Jj5fVK9wVQwbPGrUKARot5h
FVeg9ImfpHiVkxJ2Tyb2E5ts3b8Jig==
=Xip3
-----END PGP SIGNATURE-----

--z1q5nUGgyyOUCQhx--
