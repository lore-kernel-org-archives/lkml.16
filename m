Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40D27FD68
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705390; cv=none; b=bTeT+vVzjgM9qAH27nWV96Tl2J6py51+UbpheCYGCM2NbdW6ICngZAvkyq8ZeqwhCmH9ARV+wmmt2Uxu1lYKlfAecsVuC0E6d9qWYdJamx3ooXFsDpSKoVYXWH1UefwHrwoxy/s17LKrZZsj6lOk7suApMC3JafF9BjnfHYmtaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705390; c=relaxed/simple;
	bh=JpGjNbvJ68b1+c8DHkGd85uMGGsQlUTSW2ospchYelE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AlNb2t0nipi97xwiRGIlcruTH2cmYuZ0/WwnyFnAhelE1o+5scU1amJoWlSfra43ghqValUkg9hBXZlGCY9ZOyn/kD/FZqRry/VzvxBG+5FbaatfU2enK7Sl9O4f7tcG81lRTS6qe7G9ccclrgkK0Pxld7M7f1bx+dEVosNgdAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bYu-0001z5-0U; Tue, 15 Apr 2025 10:22:32 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bYs-000O14-3C;
	Tue, 15 Apr 2025 10:22:31 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bYs-0003Kq-2s;
	Tue, 15 Apr 2025 10:22:30 +0200
Message-ID: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
 sboyd@kernel.org,  robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 15 Apr 2025 10:22:30 +0200
In-Reply-To: <20250414191715.2264758-7-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
	 <20250414191715.2264758-7-elder@riscstar.com>
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

On Mo, 2025-04-14 at 14:17 -0500, Alex Elder wrote:
> Enable support for three additional syscon CCUs which support reset
> controls but no clocks:  ARCPU, RCPU2, and APBC2.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>=20
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
> index 7494c97c3c7ec..cd1a0668bd203 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -130,6 +130,36 @@
>  #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>  #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
> =20
> +/* RCPU register offsets */
> +#define RCPU_SSP0_CLK_RST		0x0028
> +#define RCPU_I2C0_CLK_RST		0x0030
> +#define RCPU_UART1_CLK_RST		0x003c
> +#define RCPU_CAN_CLK_RST		0x0048
> +#define RCPU_IR_CLK_RST			0x004c
> +#define RCPU_UART0_CLK_RST		0x00d8
> +#define AUDIO_HDMI_CLK_CTRL		0x2044
> +
> +/* RCPU2 register offsets */
> +#define RCPU2_PWM0_CLK_RST		0x0000
> +#define RCPU2_PWM1_CLK_RST		0x0004
> +#define RCPU2_PWM2_CLK_RST		0x0008
> +#define RCPU2_PWM3_CLK_RST		0x000c
> +#define RCPU2_PWM4_CLK_RST		0x0010
> +#define RCPU2_PWM5_CLK_RST		0x0014
> +#define RCPU2_PWM6_CLK_RST		0x0018
> +#define RCPU2_PWM7_CLK_RST		0x001c
> +#define RCPU2_PWM8_CLK_RST		0x0020
> +#define RCPU2_PWM9_CLK_RST		0x0024
> +
> +/* APBC2 register offsets */
> +#define APBC2_UART1_CLK_RST		0x0000
> +#define APBC2_SSP2_CLK_RST		0x0004
> +#define APBC2_TWSI3_CLK_RST		0x0008
> +#define APBC2_RTC_CLK_RST		0x000c
> +#define APBC2_TIMERS0_CLK_RST		0x0010
> +#define APBC2_KPC_CLK_RST		0x0014
> +#define APBC2_GPIO_CLK_RST		0x001c
> +
>  struct ccu_reset_data {
>  	u32 offset;
>  	u32 assert_mask;
> @@ -1177,6 +1207,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_=
data =3D {
>  	.reset_num	=3D ARRAY_SIZE(apmu_reset_data),
>  };
> =20
> +static const struct ccu_reset_data rcpu_reset_data[] =3D {
> +	[RESET_RCPU_SSP0]	=3D RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_I2C0]	=3D RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART1]	=3D RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_IR]		=3D RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_CAN]	=3D RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART0]	=3D RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_HDMI_AUDIO]	=3D RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
> +};
> +
> +static struct spacemit_ccu_data k1_ccu_rcpu_data =3D {

Could be const.

> +	/* No clocks in the RCPU CCU */
> +	.reset_data	=3D rcpu_reset_data,
> +	.reset_num	=3D ARRAY_SIZE(rcpu_reset_data),
> +};
> +
> +static const struct ccu_reset_data rcpu2_reset_data[] =3D {
> +	[RESET_RCPU2_PWM0]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM1]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM2]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM3]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM4]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM5]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM6]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM7]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM8]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM9]	=3D RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +};
> +
> +static struct spacemit_ccu_data k1_ccu_rcpu2_data =3D {

const

> +	/* No clocks in the RCPU2 CCU */
> +	.reset_data	=3D rcpu2_reset_data,
> +	.reset_num	=3D ARRAY_SIZE(rcpu2_reset_data),
> +};
> +
> +static const struct ccu_reset_data apbc2_reset_data[] =3D {
> +	[RESET_APBC2_UART1]	=3D RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_SSP2]	=3D RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_TWSI3]	=3D RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
> +	[RESET_APBC2_RTC]	=3D RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
> +	[RESET_APBC2_TIMERS0]	=3D RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)=
),
> +	[RESET_APBC2_KPC]	=3D RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
> +	[RESET_APBC2_GPIO]	=3D RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),

Superfluous parentheses.

> +};
> +
> +static struct spacemit_ccu_data k1_ccu_apbc2_data =3D {

const

> +	/* No clocks in the APBC2 CCU */
> +	.reset_data	=3D apbc2_reset_data,
> +	.reset_num	=3D ARRAY_SIZE(apbc2_reset_data),
> +};
> +
>  static int spacemit_reset_update(struct reset_controller_dev *rcdev,
>  				 unsigned long id, bool assert)
>  {
> @@ -1351,6 +1432,18 @@ static const struct of_device_id of_k1_ccu_match[]=
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

regards
Philipp
