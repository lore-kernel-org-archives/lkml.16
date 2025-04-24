Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA61B4248;
	Thu, 24 Apr 2025 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508137; cv=none; b=rNdCpW3cXgcR6FyG+yxHT4Yl77C/SOxhRperkcBr5ZCUgipKoTb9qoqH7JaBM4zz0ZnvmMYfJM+/Cqb1vFMAKybDHiAqmHaWilj2yE4JeKK4tSuKk6ulM8oVi0qwmZQvGzagswsTGr6SqsSecYCOr31wfyiWKctbgz/E1edByJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508137; c=relaxed/simple;
	bh=65dnaZeGGnRWk84fmSR5N0SHVqJzZHHb308Lo+CMzec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5HvfP6qNSfWqLbJ16Qm+Nb8T2J4cG43Dyml4S7B+EnUj+kM0UnVyPtAH0DQVwEQtCrA4BeOh92IEg6CBs96hXyFfXfbHiqCiQtomLkAWLKCFjtJdJ4DedmUH9L84TCp28Tq4AwImrfsgf96ptE0fAvqrX9EO1gqcqZGnp7ej+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA6WggJ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA6WggJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5041C4CEE3;
	Thu, 24 Apr 2025 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745508136;
	bh=65dnaZeGGnRWk84fmSR5N0SHVqJzZHHb308Lo+CMzec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vA6WggJ/29pIOanuEdqC3Tx3NwpN+tlh+hCbV93ygPzarnMY6RZ6W/bG5XDWlbLit
	 0ccsCzpelrv5fcKG0LCi/zE/2pbnQjFN7OihYKasLLcWy9xsECFm+h75KbMoWgnmOg
	 FS8N+M223qtqmJHQ07UeP2RIbUDInyDqWddqVO7jgQx9x+r5Zl4TrB4PxcnKT5rr+r
	 qDEzkJ0i8K4jt09G/wC+NDq+s57Ym14Eo/o+eeMYunrrqEGsYaJDzkiWY11B5LRKCu
	 7GOn9aQOz/JrJCuBQ8JlNMTqZdiKexiXl4t4TQnQZIySidk0FF4BvdQRPJ8axON7+g
	 un5Fe0dXxxOTg==
Date: Thu, 24 Apr 2025 16:22:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support
 for K1 SoC
Message-ID: <20250424-untried-refueling-50c5902d63c9@spud>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
 <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iLvKFyQQzMUSgZV7"
Content-Disposition: inline
In-Reply-To: <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>


--iLvKFyQQzMUSgZV7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 05:40:49PM +0800, Yixun Lan wrote:
> Enable GPIO support, in order to activate follow-up GPIO LED,
> and ethernet reset pin.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Do you want me to grab this patch, or do you have a defconfig branch to
put it on?

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e175e0e4c27136c31761127ce6e1602..b8899d59dd345c50d877829c0=
5d0330f2986895c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -169,6 +169,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=3Dy
>  CONFIG_PINCTRL_TH1520=3Dy
>  CONFIG_GPIO_DWAPB=3Dy
>  CONFIG_GPIO_SIFIVE=3Dy
> +CONFIG_GPIO_SPACEMIT_K1=3Dy
>  CONFIG_POWER_RESET_GPIO_RESTART=3Dy
>  CONFIG_SENSORS_SFCTEMP=3Dm
>  CONFIG_CPU_THERMAL=3Dy
>=20
> --=20
> 2.49.0
>=20

--iLvKFyQQzMUSgZV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaApXIgAKCRB4tDGHoIJi
0hI1AP4wJfY4DSUsY0aboH5U9Y51POA1u9C+eijl9lhfdo39yAEApnknyL7FNdN+
gHFmfl8lby3E7vdc2xuWYXdZ5WTORw8=
=P7Hb
-----END PGP SIGNATURE-----

--iLvKFyQQzMUSgZV7--
