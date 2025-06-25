Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09225DCE3;
	Wed, 25 Jun 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856406; cv=none; b=Eb6nHZwR/HJQPb1zl3YT6+kwN3Vr4jaCE5dLEBI9UQliVlu5gPo3BX0vwiFEd5Lh1A8b1Y/cjsWNw2S+8YW+OG5xq0dBDQJERQQ5xKUbdejw0shN4vHiRDGAaKXRpdgL2lSH/5lhmx+xgYwpiRLSnmunp92gufP5QO051WG5G/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856406; c=relaxed/simple;
	bh=vHZOLOxUOXqLChOAWe78z0H43RWaYWuJUBxuOWinPSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YT/yXlIcqx9gkl0F0RAvO3m+dxZgIy154blL/ny+AHFJrJwwny19Imki4S7UT9XmGx6Q7BQ5MDC/8qeRUP3lWLWkyB1dBcSAk1nGEhcepWetP7oIhczeo7subOhCMUpmJZuS1nm7g8iubJqcCqPRKtwFSRHGi17uxrAOuw+LciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+FSU+Q1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+FSU+Q1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213F3C4CEEA;
	Wed, 25 Jun 2025 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750856405;
	bh=vHZOLOxUOXqLChOAWe78z0H43RWaYWuJUBxuOWinPSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+FSU+Q1GU523W8SJnwaLVuoYap1xOesCc60d/mSus1f7T2WoJ2Nxt2Yo7Vw+4Xv/
	 /4Cjban+Zw1RtQQr7WECEv5IDDV3PYhmuxJQpdRztu0IjQNU/a3wtUvA4uRjYEvzJ3
	 XdpQJOp2qYgRU9i2s1FWZJbWuAuz1zII7KWihOOQg0pOlQ2YbZrLI8xi5K6Sz8toi4
	 +0ub2tsoSmoC7udguAeOgJCZiuScSxzBCmZOZ9V8QeIX8BmymloZyLIccCky1DPx35
	 3N4bt/x9VxRkB0ksQZxqzQ4QvQsYuI5ZbxPOzidXMLXl91Wg9lFOEoMp6xmYW0l3Ia
	 +ANCgGeuxNNvQ==
Date: Wed, 25 Jun 2025 14:00:01 +0100
From: Conor Dooley <conor@kernel.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] : Re: [PATCH] clk: microchip: mpfs: Fix incorrect
 MSSPLL ID in error message
Message-ID: <20250625-reconvene-lyricist-8bfbf0c6ee36@spud>
References: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
 <20250624-monotype-disorder-aedee5ef7cfa@spud>
 <cf197270-bdca-4624-a2ad-9bb56429b5b7@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lSQe9zTW71F2Yj1B"
Content-Disposition: inline
In-Reply-To: <cf197270-bdca-4624-a2ad-9bb56429b5b7@oracle.com>


--lSQe9zTW71F2Yj1B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 10:39:16PM +0530, ALOK TIWARI wrote:
>=20
>=20
> On 6/24/2025 9:29 PM, Conor Dooley wrote:
> > On Sun, Jun 22, 2025 at 11:03:49AM -0700, Alok Tiwari wrote:
> > > The error message in mpfs_clk_register_mssplls() incorrectly
> > > printed a constant CLK_MSSPLL_INTERNAL instead of the actual
> > > PLL ID that failed to register.
> > Huh, that's weird. Did you actually encounter this happening, or is this
> > some sort of patch based on the output from a tool?
> > I ask because I don't see how this could ever actually report a
> > constant, when the array it loops over only has a single element.
> > Feels like we should just do something like the following (if we do
> > anything at all)
> >=20
> > Cheers,
> > Conor.
> >=20
> > diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/c=
lk-mpfs.c
> > index c22632a7439c5..ed6d5e6ff98ec 100644
> > --- a/drivers/clk/microchip/clk-mpfs.c
> > +++ b/drivers/clk/microchip/clk-mpfs.c
> > @@ -148,22 +148,18 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_cl=
ks[] =3D {
> >   };
> >   static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_=
msspll_hw_clock *msspll_hws,
> > -				     unsigned int num_clks, struct mpfs_clock_data *data)
> > +				     struct mpfs_clock_data *data)
> >   {
> > -	unsigned int i;
> > +	struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[0];
> >   	int ret;
> > -	for (i =3D 0; i < num_clks; i++) {
> > -		struct mpfs_msspll_hw_clock *msspll_hw =3D &msspll_hws[i];
> > +	msspll_hw->base =3D data->msspll_base;
> > +	ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> > +				     CLK_MSSPLL_INTERNAL);
> > -		msspll_hw->base =3D data->msspll_base;
> > -		ret =3D devm_clk_hw_register(dev, &msspll_hw->hw);
> > -		if (ret)
> > -			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> > -					     CLK_MSSPLL_INTERNAL);
> > -
> > -		data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
> > -	}
> > +	data->hw_data.hws[msspll_hw->id] =3D &msspll_hw->hw;
> >   	return 0;
> >   }
> > @@ -386,8 +382,7 @@ static int mpfs_clk_probe(struct platform_device *p=
dev)
> >   	clk_data->dev =3D dev;
> >   	dev_set_drvdata(dev, clk_data);
> > -	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(m=
pfs_msspll_clks),
> > -					clk_data);
> > +	ret =3D mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, clk_data);
> >   	if (ret)
> >   		return ret;
>=20
>=20
> Thanks Conor. This patch based on static tool.
>=20
> You are right, there is only a single MSSPLL internal clock, so the loop
> isn't strictly necessary.
> We could either remove the loop entirely (as you suggested),
> or alternatively, just tweak the error message to something like:
> "failed to register MSSPLL internal id: %d\n"

The loop doesn't do anything, so it should probably be removed.

> This would help distinguish it from the error messages used for the MSSPLL
> output and cfg clocks.
>=20
> I also noticed that similar generic messages are used elsewhere, like:
> "failed to register clock id: %d\n" in mpfs_clk_register_cfgs()
> "failed to register clock id: %d\n" in mpfs_clk_register_periphs()
>=20
> Would it make sense to update those as well for clarity, or do you think
> it's better to keep the patch minimal and leave them as is?

I dunno, I don't think there's anything particularly wrong with those,
the IDs are unique across the whole driver. You need to look up the IDs
anyway to understand the error message, so changing those prints
provides no extra info IMO.

--lSQe9zTW71F2Yj1B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFvy0QAKCRB4tDGHoIJi
0pmvAQCVowLYQ+nseeBVvAj1iEHXJVREPX47v1J5Bfg4zIr95AEA6sXHshThgwct
aE6P6LFHjkPucomg+AlA48SgVrTcpwU=
=nvzq
-----END PGP SIGNATURE-----

--lSQe9zTW71F2Yj1B--
