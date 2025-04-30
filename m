Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57215DBC1;
	Wed, 30 Apr 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027226; cv=none; b=H5wKYZMdWFoPpD8O3ZpPcJDo70WrS8g4AZhe9T6SuoMJ/GLs9d6INwKUHqpZbR3OwglAna5nhN8XgMoFt0CMeAZmioe5f3pUxvD8/aVPg2+A7LYKvr0R7Y5l2BhD/R2u7bC1KD6W6itCDCmZrwOk6FC2DFNPEvBWyA0PgDKLTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027226; c=relaxed/simple;
	bh=GHWKyQrFtLFEsAd9D7tQib4YQeKEyzwclNeqeYd5kDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5SEJ7L6eHtc5KffqnBJJ2iswER8cwKrDX/VVah/pth15KADbzKSSet8zDpZNb8xpbKt/1gjGMFu5uNz7RlA0x7SQ+ss6BBANuYRg00jOIv0Kn1kxduZeBTMqkYakT1gA7ltS3LyRDjiaZM9wfCv2iy5JMMZDmWP2jM+UV6uMyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlCi7ebi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlCi7ebi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4915C4CEE7;
	Wed, 30 Apr 2025 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027225;
	bh=GHWKyQrFtLFEsAd9D7tQib4YQeKEyzwclNeqeYd5kDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlCi7ebiNQ2BeVFzNkiHJCVx2MJpTnsEJyICSPJLgM37NV9QR6HzhAOKxILNrsyBU
	 23bQE9a1E3Wtqkv5QqeIX9Ie6gp/+w1qVmuI+6vPSpvYJf+cCFAEVwBkg4UOdj4Ve6
	 1dTWm+j9zifDYh0uPTZev0uqikTu4AmG5UoCSmWDhuoq1Qn2CQ9Zn8Y+UQ+Z+KiLID
	 2JMle4z70AZRD3IDR9ZwGWLgKU12xysOE9QxCG4kMJ4W1upVvzbMcXwv5NALZyQ5x4
	 PGAfvELPB89tzkjbmB0Ttw9kDAwAZ6rdrUkvS+tCXzj95WXihFKS9xqmklDV/3Wu4x
	 AcEKRHaBrmj1w==
Date: Wed, 30 Apr 2025 16:33:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <20250430-radiance-rebuilt-2caa906d5e6f@spud>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sMKL3DI6Jh6onOT5"
Content-Disposition: inline
In-Reply-To: <20250430020932.307198-3-inochiama@gmail.com>


--sMKL3DI6Jh6onOT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> Add of device id definition for newly added precise compatible.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/clk/sophgo/clk-cv1800.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1=
800.c
> index e0c4dc347579..e10221df6385 100644
> --- a/drivers/clk/sophgo/clk-cv1800.c
> +++ b/drivers/clk/sophgo/clk-cv1800.c
> @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device=
 *pdev)
> =20
>  static const struct of_device_id cv1800_clk_ids[] =3D {
>  	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },

Given the same data is used here, should there not be fallbacks in the
dt for some of these? For example, 1812 to 1800? Or is that not okay,
because 1800 is not a real device id?

>  	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
>  	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
> --=20
> 2.49.0
>=20

--sMKL3DI6Jh6onOT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJC0wAKCRB4tDGHoIJi
0kMAAP9ZKNc6a0xYBkYr8oqooliJY8N3PWy3hSRIU/+E2sr52AEAjzrVNBdoDTN3
S37PalSpc7ohjoXJsyX87gDgmKv1kwE=
=EuHX
-----END PGP SIGNATURE-----

--sMKL3DI6Jh6onOT5--
