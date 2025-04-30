Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D2257AC6;
	Wed, 30 Apr 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027428; cv=none; b=OO6T2iIBeZviODQruH6tGS+SxMdih4ZVQOpMzfEFI0m/p/Zs9wHJCpaS5vBhQRo3GY4fj+tR1OhvWAdgf8AUlM+r9+dhdr86cCKlFpiABnxYPwW6conu+fs/5xbiCE54H4lv6+NN+eFnh5Ty58//yYIoHVGzehWxq7rmpCfOqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027428; c=relaxed/simple;
	bh=szeQj+bnY9ogQvY4OUwIgus6AzzTlktdYaxtxFfhJIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpXOumpEtILBUBcO4lsF7idyDC704pAJWvP3dbOfec0XAe0XlkX3izwKtP0MINUrJ0svpzg5f4RF1eskmMzjcsWskFKob7+EhAjvAkAV/lV7xzJnhOaB1Uwms+wRvS+Vc4MCso9W8eFmO0NA2OQfjLvPRFgIxi/ZCz4MCyK/D1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ml/JC1N9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ml/JC1N9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E293C4CEEC;
	Wed, 30 Apr 2025 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027428;
	bh=szeQj+bnY9ogQvY4OUwIgus6AzzTlktdYaxtxFfhJIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml/JC1N9U9Q1EOkGUdxqyDMwN5oXs6mnxag8VzQw28/OoNJArBckIP3pLeFBKW9ro
	 RcXLw49kpTtAm06RDPMIH5NhkjsFyd4Nsq4ctPWZxJU2LrubnQBNDydTpc6DBmM+cb
	 XrgYWVDRD6Yh5JwUV1EFh3fC9cHTMU0EA6Z8+2RHxIGE+2NJi80TuU9xfHB7oNifh5
	 29tn5y7HKs8eipTx1V5yp5ZMg9ceCwbygZEkpFi8a9yOuuF0FrM28zhQqaS82ochkk
	 W7UpDWv/FulscnvtCe2XDBqpgCHqfa26xMaDCQRWpJOJQC5aqI//7WdUTFzdKEv43e
	 CD0pN63FTVk4w==
Date: Wed, 30 Apr 2025 16:37:01 +0100
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
Message-ID: <20250430-snort-raider-dbf10d14993f@spud>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="87W6SvIbW2ImtIsk"
Content-Disposition: inline
In-Reply-To: <20250430-radiance-rebuilt-2caa906d5e6f@spud>


--87W6SvIbW2ImtIsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> >=20
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-c=
v1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_devi=
ce *pdev)
> > =20
> >  static const struct of_device_id cv1800_clk_ids[] =3D {
> >  	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> > +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
>=20
> Given the same data is used here, should there not be fallbacks in the
> dt for some of these? For example, 1812 to 1800? Or is that not okay,
> because 1800 is not a real device id?
>=20
> >  	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> > +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
> >  	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> > +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },

Actually, this one is a better example. sg2000 is not marked deprecated.
sg2002 uses the same match data. Why is no fallback to sg2000 used for
the sg2002 case?

--87W6SvIbW2ImtIsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJDnQAKCRB4tDGHoIJi
0lfMAP45MQndFPi3Xx3SJU+Ys3AnOJrH+Tuj9GmF7L47GJab3QD8Dhn3UBrka0Uc
I2WbsNSSF8pSxW1RW9HI8WsMjkO3WA4=
=WPBL
-----END PGP SIGNATURE-----

--87W6SvIbW2ImtIsk--
