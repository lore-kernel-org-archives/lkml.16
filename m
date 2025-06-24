Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A42D662A;
	Tue, 24 Jun 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780803; cv=none; b=osH8ectk1LZsBnsMClU6pfBmhmxE4m6PHXZqUAMQKw9jbHpT55qsPx5KUW5RGQj+Ggiofc+e416kopBVat9QTG/czolGzY7IvJjuTe2hr8j8aq0QLI2ON90J1wHdXkna24TZ6Yw85o9EVegQnIv4Qu5ExApbAhVCZL+PCrfnSgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780803; c=relaxed/simple;
	bh=oAj6M5RJNPj9zPVNfLaIS7Hz87nTWDNolCrwMJkPsAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vp8XyFMHap45oqZq4hqvL8Ivf5LAlqIov7n3RJtorPqG0MuuVXZ8Drk799R/2Gyt0UuEx1wiTelH9FBnSkCIm7QCVKyrjpscgFm8Jc3ZCk8GFPN7i8ykAWjXejLkKl6K1fAevbFy8oH9zcRHSIWPlQPwdaErAvJCEAQstPkjnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdctnZWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdctnZWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05257C4CEE3;
	Tue, 24 Jun 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750780802;
	bh=oAj6M5RJNPj9zPVNfLaIS7Hz87nTWDNolCrwMJkPsAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdctnZWYTC2OySmeHB0kk3tnxgJZhoD2Eszg4FdDvvp+inSJCTCGaDxjW5Lgqn03T
	 pCrEQrvJU7EuKdEChDca44k/Bi3meJzZNJ1HpC/L7VmFBlsc8bgdxqXyTHa3BX1LW5
	 pUdH9oU7w9n+Ipb7C0SZR+f3x91NOtFln7yoANDlOujkjcu/Kg3FPjylHH1BCpoeJh
	 /ks5EEIbWYW8Gbq0WgH/6rq6+r3SnqtUx/MOaR62bnRhpj97dE0f2ZwGn7WmHwLsln
	 ijKFARQzyMJ65Ttx9CarMFe0ZyAwVGIGYu+Xd3winavaZacvw087EBZbB8TswaPzMP
	 gpzs14eDgxrzQ==
Date: Tue, 24 Jun 2025 16:59:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: microchip: mpfs: Fix incorrect MSSPLL ID in error
 message
Message-ID: <20250624-monotype-disorder-aedee5ef7cfa@spud>
References: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kYIau9vyQZzfZ+VS"
Content-Disposition: inline
In-Reply-To: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>


--kYIau9vyQZzfZ+VS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:03:49AM -0700, Alok Tiwari wrote:
> The error message in mpfs_clk_register_mssplls() incorrectly
> printed a constant CLK_MSSPLL_INTERNAL instead of the actual
> PLL ID that failed to register.

Huh, that's weird. Did you actually encounter this happening, or is this
some sort of patch based on the output from a tool?
I ask because I don't see how this could ever actually report a
constant, when the array it loops over only has a single element.
Feels like we should just do something like the following (if we do
anything at all)

Cheers,
Conor.

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-m=
pfs.c
index c22632a7439c5..ed6d5e6ff98ec 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -148,22 +148,18 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_clks[]=
 =3D {
 };
=20
 static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspl=
l_hw_clock *msspll_hws,
-				     unsigned int num_clks, struct mpfs_clock_data *data)
+				     struct mpfs_clock_data *data)
 {
-	unsigned int i;
+	struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[0];
 	int ret;
=20
-	for (i =3D 0; i < num_clks; i++) {
-		struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[i];
+	msspll_hw->base =3D data->msspll_base;
+	ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
+				     CLK_MSSPLL_INTERNAL);
=20
-		msspll_hw->base =3D data->msspll_base;
-		ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
-					     CLK_MSSPLL_INTERNAL);
-
-		data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
-	}
+	data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
=20
 	return 0;
 }
@@ -386,8 +382,7 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	clk_data->dev =3D dev;
 	dev_set_drvdata(dev, clk_data);
=20
-	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_=
msspll_clks),
-					clk_data);
+	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, clk_data);
 	if (ret)
 		return ret;
=20

>=20
> Update it to msspll_hw->id for accurate diagnostics
>=20
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/clk/microchip/clk-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> index c22632a7439c5..d12b7120f16ff 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -160,7 +160,7 @@ static int mpfs_clk_register_mssplls(struct device *d=
ev, struct mpfs_msspll_hw_c
>  		ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> -					     CLK_MSSPLL_INTERNAL);
> +					     msspll_hw->id);
> =20
>  		data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
>  	}
> --=20
> 2.46.0
>=20

--kYIau9vyQZzfZ+VS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFrLfgAKCRB4tDGHoIJi
0vgFAP9GyzbHnazol+NlKh5je3tRgPsVvN7IpkQiog8B5K4D0QEA2xnruSiwTK/I
46n97dx2MdGT4uUpeQbsfTsUm0KjmwM=
=SyNN
-----END PGP SIGNATURE-----

--kYIau9vyQZzfZ+VS--
