Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDFE175D53
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695515; cv=none; b=LBg4vVRK2daE9IB54NyZdS8hmnxPVr3IL7t4BicZPWo4JzzuajTEBAmVPiKETXwvPIKgz7e/sx1lwtayhJgEbXs8YZKcOLb8NW24ZEWO6Qxa79sOeJVkZhagAJJFumtCAn2MdrHarWMDILPZ/J4Z07d64ICnIc7OfdOHMrVgh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695515; c=relaxed/simple;
	bh=kSWdw8IVCVEdiiVxcwOCCea5RImdBd+3SVN/TuOIsmo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DnTlvsl7lY9mEynd/3Onx+3z2w7A1dCgrlGZtXh84selaPl97eePXi3SUanjm/saOxDi6yEJMM4bO8aOOn30mfEdAAJ3k/ftfEXKv6VvMdbxsnYTXLsB36U4BQXSslqxEAPjOA/nZUYXujOj77M+aRKs0zoPR/a2HcQqNsKtj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-0001pr-Kw; Thu, 08 May 2025 11:11:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-001hZ8-0z;
	Thu, 08 May 2025 11:11:35 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxHz-0003qM-0i;
	Thu, 08 May 2025 11:11:35 +0200
Message-ID: <a3febd3718397d7cf067e2ae637c2d633388f89f.camel@pengutronix.de>
Subject: Re: [PATCH v6 5/6] reset: spacemit: define three more CCUs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 11:11:35 +0200
In-Reply-To: <20250506210638.2800228-6-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
	 <20250506210638.2800228-6-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
> Define these resets so they can be used.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
>  drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
>  include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
>=20
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
> index 6b1845e899e5f..bddc83aff23cd 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_da=
ta =3D {
>  	.num		=3D ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
> =20
> +static const struct spacemit_ccu_data k1_ccu_rcpu_data =3D {

The /* No clocks in the RCPU CCU */ comment belongs here, instead of in
the reset driver.

I wonder though, if these units have no clocks, why are they called
CCUs? It doesn't make much sense to me to add their compatibles to the
ccu-k1 driver only to load the reset aux driver. Why not just add a
platform driver next to the aux driver in reset-spacemit.ko for these
three?

> +	.reset_name	=3D "rcpu-reset",
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_rcpu2_data =3D {
> +	.reset_name	=3D "rcpu2-reset",
> +};
> +
> +static const struct spacemit_ccu_data k1_ccu_apbc2_data =3D {
> +	.reset_name	=3D "apbc2-reset",
> +};
> +
>  static int spacemit_ccu_register(struct device *dev,
>  				 struct regmap *regmap,
>  				 struct regmap *lock_regmap,
> @@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[]=
 =3D {
>  		.compatible	=3D "spacemit,k1-syscon-apmu",
>  		.data		=3D &k1_ccu_apmu_data,
>  	},
> +	{
> +		.compatible	=3D "spacemit,k1-syscon-rcpu",
> +		.data		=3D &k1_ccu_rcpu_data,
> +	},
> +	{
> +		.compatible	=3D "spacemit,k1-syscon-rcpu2",
> +		.data		=3D &k1_ccu_rcpu2_data,
> +	},
> +	{
> +		.compatible	=3D "spacemit,k1-syscon-apbc2",
> +		.data		=3D &k1_ccu_apbc2_data,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
> index 19a34f151b214..27434a1928261 100644
> --- a/drivers/reset/spacemit/k1.c
> +++ b/drivers/reset/spacemit/k1.c
> @@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apm=
u_reset_data =3D {
>  	.count		=3D ARRAY_SIZE(apmu_resets),
>  };
> =20
> +static const struct ccu_reset_data rcpu_resets[] =3D {
> +	[RESET_RCPU_SSP0]	=3D RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_I2C0]	=3D RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART1]	=3D RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_IR]		=3D RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_CAN]	=3D RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART0]	=3D RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_HDMI_AUDIO]	=3D RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k1_rcpu_reset_data =3D {
> +	/* No clocks in the RCPU CCU */

This information is not useful in the reset driver.

regards
Philipp
