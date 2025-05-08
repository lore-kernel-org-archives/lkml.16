Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072112857C6;
	Thu,  8 May 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724993; cv=none; b=Ts2U6DdCB4ZZdp0lL1EGrFTJudWyfQaPApp8qsLtV6v/jpoBjsWPbJl6qyt9UipciHPo5EhzDFfah3HzMHaPbr67O9GNvuW/7vaN8olCxMuOCKMH8euo42fJ5xaTLEeaHROSKMLLDRxWDM/FUjKjBNawpP/LGSogQ/NfdIYElLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724993; c=relaxed/simple;
	bh=gQodK5JfVOXtPnBzyz99RmmsQOndxj4nPxWZpIbjFOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwBNCXmMG60aNXB08HpQDCDRss9MLHjXmYAVBgJSeVXXZ7PYc5H/wW08tcR5VL2VNV1VyzJJuolwO0rPcA6WQulTNdfQmrPuIMuG1ohl91DSe9Pu5n8Rp9KKZYPSKhk77GUVxy/uu8M+BEX8wiq1g44yR+LWfviPhvVWPGh+Mm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vOhdnG0q; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vOhdnG0q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EGPk/Tt/2qDyRfjXQZ3zYQiX9knYW6iwQMERQK1aJE4=; b=vOhdnG0qzqDU4CNFiUnuuoBqQH
	HBGomoXyfW5Qz/RqNR+35vtfzklUWfN9SCEqDgxUy6i6qpxZPW8nHZp7Ui4/1DmmPrkDr23v3YVDY
	/VkgTjFWwgBz5NoITHDbjESAkRSFkz1X9i7Ie8wAQiKOnpBGz01jPxaXZCcty1xJ4SWeFVcoLraY8
	iE0OfxQM/pvpJI/cj1lKMm5X2vKLwpzS3dd8kQR2WMDd62i5fuPMmpacQuWHbI2BZiuHTDSYw4c/B
	/6clbreWO5UKQEysslFFkvR6BYuEufJnFHtyx+DOud/7Sek1VlpVRsy7y+Re5eUSI/7ohGbz3gt/+
	ady/LVlA==;
Received: from [61.8.144.177] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD4xY-000812-CK; Thu, 08 May 2025 19:23:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/5] phy: rockchip: naneng-combphy: Add SoC prefix to register
 definitions
Date: Thu, 08 May 2025 19:22:58 +0200
Message-ID: <5378239.31r3eYUQgx@phil>
In-Reply-To: <20250508135242.14706-1-ziyao@disroot.org>
References:
 <20250508134332.14668-2-ziyao@disroot.org>
 <20250508135242.14706-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 8. Mai 2025, 15:52:42 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Yao Zi:
> All supported variants of naneng-combphy follow a register layout
> similar to the RK3568 variant with some exceptions of SoC-specific
> registers.
>=20
> Add RK3568 prefix for the common set of registers and the corresponding
> SoC prefix for SoC-specific registers, making usage of definitions clear
> and preparing for future COMBPHY variants with a different register
> layout.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../rockchip/phy-rockchip-naneng-combphy.c    | 560 +++++++++---------
>  1 file changed, 288 insertions(+), 272 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index ce91fb1d5167..1d1c7723584b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -21,78 +21,80 @@
>  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> =20
>  /* COMBO PHY REG */
> -#define PHYREG6				0x14
> -#define PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
> -#define PHYREG6_PLL_DIV_SHIFT		6
> -#define PHYREG6_PLL_DIV_2		1
> -
> -#define PHYREG7				0x18
> -#define PHYREG7_TX_RTERM_MASK		GENMASK(7, 4)
> -#define PHYREG7_TX_RTERM_SHIFT		4
> -#define PHYREG7_TX_RTERM_50OHM		8
> -#define PHYREG7_RX_RTERM_MASK		GENMASK(3, 0)
> -#define PHYREG7_RX_RTERM_SHIFT		0
> -#define PHYREG7_RX_RTERM_44OHM		15
> -
> -#define PHYREG8				0x1C
> -#define PHYREG8_SSC_EN			BIT(4)
> -
> -#define PHYREG10			0x24
> -#define PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
> -#define PHYREG10_SSC_PCM_3500PPM	7
> -
> -#define PHYREG11			0x28
> -#define PHYREG11_SU_TRIM_0_7		0xF0
> -
> -#define PHYREG12			0x2C
> -#define PHYREG12_PLL_LPF_ADJ_VALUE	4
> -
> -#define PHYREG13			0x30
> -#define PHYREG13_RESISTER_MASK		GENMASK(5, 4)
> -#define PHYREG13_RESISTER_SHIFT		0x4
> -#define PHYREG13_RESISTER_HIGH_Z	3
> -#define PHYREG13_CKRCV_AMP0		BIT(7)
> -
> -#define PHYREG14			0x34
> -#define PHYREG14_CKRCV_AMP1		BIT(0)
> -
> -#define PHYREG15			0x38
> -#define PHYREG15_CTLE_EN		BIT(0)
> -#define PHYREG15_SSC_CNT_MASK		GENMASK(7, 6)
> -#define PHYREG15_SSC_CNT_SHIFT		6
> -#define PHYREG15_SSC_CNT_VALUE		1
> -
> -#define PHYREG16			0x3C
> -#define PHYREG16_SSC_CNT_VALUE		0x5f
> -
> -#define PHYREG17			0x40
> -
> -#define PHYREG18			0x44
> -#define PHYREG18_PLL_LOOP		0x32
> -
> -#define PHYREG21			0x50
> -#define PHYREG21_RX_SQUELCH_VAL		0x0D
> -
> -#define PHYREG27			0x6C
> -#define PHYREG27_RX_TRIM_RK3588		0x4C
> -
> -#define PHYREG30			0x74
> -
> -#define PHYREG32			0x7C
> -#define PHYREG32_SSC_MASK		GENMASK(7, 4)
> -#define PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
> -#define PHYREG32_SSC_DIR_SHIFT		4
> -#define PHYREG32_SSC_UPWARD		0
> -#define PHYREG32_SSC_DOWNWARD		1
> -#define PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
> -#define PHYREG32_SSC_OFFSET_SHIFT	6
> -#define PHYREG32_SSC_OFFSET_500PPM	1
> -
> -#define PHYREG33			0x80
> -#define PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
> -#define PHYREG33_PLL_KVCO_SHIFT		2
> -#define PHYREG33_PLL_KVCO_VALUE		2
> -#define PHYREG33_PLL_KVCO_VALUE_RK3576	4
> +#define RK3568_PHYREG6				0x14
> +#define RK3568_PHYREG6_PLL_DIV_MASK		GENMASK(7, 6)
> +#define RK3568_PHYREG6_PLL_DIV_SHIFT		6
> +#define RK3568_PHYREG6_PLL_DIV_2		1
> +
> +#define RK3568_PHYREG7				0x18
> +#define RK3568_PHYREG7_TX_RTERM_MASK		GENMASK(7, 4)
> +#define RK3568_PHYREG7_TX_RTERM_SHIFT		4
> +#define RK3568_PHYREG7_TX_RTERM_50OHM		8
> +#define RK3568_PHYREG7_RX_RTERM_MASK		GENMASK(3, 0)
> +#define RK3568_PHYREG7_RX_RTERM_SHIFT		0
> +#define RK3568_PHYREG7_RX_RTERM_44OHM		15
> +
> +#define RK3568_PHYREG8				0x1C
> +#define RK3568_PHYREG8_SSC_EN			BIT(4)
> +
> +#define RK3568_PHYREG11				0x28
> +#define RK3568_PHYREG11_SU_TRIM_0_7		0xF0
> +
> +#define RK3568_PHYREG12				0x2C
> +#define RK3568_PHYREG12_PLL_LPF_ADJ_VALUE	4
> +
> +#define RK3568_PHYREG13				0x30
> +#define RK3568_PHYREG13_RESISTER_MASK		GENMASK(5, 4)
> +#define RK3568_PHYREG13_RESISTER_SHIFT		0x4
> +#define RK3568_PHYREG13_RESISTER_HIGH_Z		3
> +#define RK3568_PHYREG13_CKRCV_AMP0		BIT(7)
> +
> +#define RK3568_PHYREG14				0x34
> +#define RK3568_PHYREG14_CKRCV_AMP1		BIT(0)
> +
> +#define RK3568_PHYREG15				0x38
> +#define RK3568_PHYREG15_CTLE_EN			BIT(0)
> +#define RK3568_PHYREG15_SSC_CNT_MASK		GENMASK(7, 6)
> +#define RK3568_PHYREG15_SSC_CNT_SHIFT		6
> +#define RK3568_PHYREG15_SSC_CNT_VALUE		1
> +
> +#define RK3568_PHYREG16				0x3C
> +#define RK3568_PHYREG16_SSC_CNT_VALUE		0x5f
> +
> +#define RK3568_PHYREG18				0x44
> +#define RK3568_PHYREG18_PLL_LOOP		0x32
> +
> +#define RK3568_PHYREG32				0x7C
> +#define RK3568_PHYREG32_SSC_MASK		GENMASK(7, 4)
> +#define RK3568_PHYREG32_SSC_DIR_MASK		GENMASK(5, 4)
> +#define RK3568_PHYREG32_SSC_DIR_SHIFT		4
> +#define RK3568_PHYREG32_SSC_UPWARD		0
> +#define RK3568_PHYREG32_SSC_DOWNWARD		1
> +#define RK3568_PHYREG32_SSC_OFFSET_MASK	GENMASK(7, 6)
> +#define RK3568_PHYREG32_SSC_OFFSET_SHIFT	6
> +#define RK3568_PHYREG32_SSC_OFFSET_500PPM	1
> +
> +#define RK3568_PHYREG33				0x80
> +#define RK3568_PHYREG33_PLL_KVCO_MASK		GENMASK(4, 2)
> +#define RK3568_PHYREG33_PLL_KVCO_SHIFT		2
> +#define RK3568_PHYREG33_PLL_KVCO_VALUE		2
> +#define RK3576_PHYREG33_PLL_KVCO_VALUE		4
> +
> +/* RK3588 COMBO PHY registers */
> +#define RK3588_PHYREG27				0x6C
> +#define RK3588_PHYREG27_RX_TRIM			0x4C
> +
> +/* RK3576 COMBO PHY registers */
> +#define RK3576_PHYREG10				0x24
> +#define RK3576_PHYREG10_SSC_PCM_MASK		GENMASK(3, 0)
> +#define RK3576_PHYREG10_SSC_PCM_3500PPM		7
> +
> +#define RK3576_PHYREG17				0x40
> +
> +#define RK3576_PHYREG21				0x50
> +#define RK3576_PHYREG21_RX_SQUELCH_VAL		0x0D
> +
> +#define RK3576_PHYREG30				0x74
> =20
>  struct rockchip_combphy_priv;
> =20
> @@ -405,9 +407,8 @@ static int rk3562_combphy_cfg(struct rockchip_combphy=
_priv *priv)
>  	switch (priv->type) {
>  	case PHY_TYPE_PCIE:
>  		/* Set SSC downward spread spectrum */
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK,
> -					 PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT,
> -					 PHYREG32);
> +		val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT;
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val, RK3568_P=
HYREG32);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> @@ -416,29 +417,30 @@ static int rk3562_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  		break;
>  	case PHY_TYPE_USB3:
>  		/* Set SSC downward spread spectrum */
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK,
> -					 PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT,
> -					 PHYREG32);
> +		val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT;
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val,
> +					 RK3568_PHYREG32);
> =20
>  		/* Enable adaptive CTLE for USB3.0 Rx */
> -		rockchip_combphy_updatel(priv, PHYREG15_CTLE_EN,
> -					 PHYREG15_CTLE_EN, PHYREG15);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG15_CTLE_EN,
> +					 RK3568_PHYREG15_CTLE_EN, RK3568_PHYREG15);
> =20
>  		/* Set PLL KVCO fine tuning signals */
> -		rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK, BIT(3), PHYREG3=
3);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 BIT(3), RK3568_PHYREG33);
> =20
>  		/* Set PLL LPF R1 to su_trim[10:7]=3D1001 */
> -		writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
> +		writel(RK3568_PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + RK3568_PHYREG12=
);
> =20
>  		/* Set PLL input clock divider 1/2 */
> -		val =3D FIELD_PREP(PHYREG6_PLL_DIV_MASK, PHYREG6_PLL_DIV_2);
> -		rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK, val, PHYREG6);
> +		val =3D FIELD_PREP(RK3568_PHYREG6_PLL_DIV_MASK, RK3568_PHYREG6_PLL_DIV=
_2);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG6_PLL_DIV_MASK, val, RK356=
8_PHYREG6);
> =20
>  		/* Set PLL loop divider */
> -		writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
> +		writel(RK3568_PHYREG18_PLL_LOOP, priv->mmio + RK3568_PHYREG18);
> =20
>  		/* Set PLL KVCO to min and set PLL charge pump current to max */
> -		writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
> +		writel(RK3568_PHYREG11_SU_TRIM_0_7, priv->mmio + RK3568_PHYREG11);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_usb, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, fal=
se);
> @@ -456,11 +458,12 @@ static int rk3562_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  	case REF_CLOCK_24MHz:
>  		if (priv->type =3D=3D PHY_TYPE_USB3) {
>  			/* Set ssc_cnt[9:0]=3D0101111101 & 31.5KHz */
> -			val =3D FIELD_PREP(PHYREG15_SSC_CNT_MASK, PHYREG15_SSC_CNT_VALUE);
> -			rockchip_combphy_updatel(priv, PHYREG15_SSC_CNT_MASK,
> -						 val, PHYREG15);
> +			val =3D FIELD_PREP(RK3568_PHYREG15_SSC_CNT_MASK,
> +					 RK3568_PHYREG15_SSC_CNT_VALUE);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG15_SSC_CNT_MASK,
> +						 val, RK3568_PHYREG15);
> =20
> -			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
> +			writel(RK3568_PHYREG16_SSC_CNT_VALUE, priv->mmio + RK3568_PHYREG16);
>  		}
>  		break;
>  	case REF_CLOCK_25MHz:
> @@ -470,19 +473,20 @@ static int rk3562_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE) {
>  			/* PLL KVCO tuning fine */
> -			val =3D FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE);
> -			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -						 val, PHYREG33);
> +			val =3D FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 RK3568_PHYREG33_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +						 val, RK3568_PHYREG33);
> =20
>  			/* Enable controlling random jitter, aka RMJ */
> -			writel(0x4, priv->mmio + PHYREG12);
> +			writel(0x4, priv->mmio + RK3568_PHYREG12);
> =20
> -			val =3D PHYREG6_PLL_DIV_2 << PHYREG6_PLL_DIV_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK,
> -						 val, PHYREG6);
> +			val =3D RK3568_PHYREG6_PLL_DIV_2 << RK3568_PHYREG6_PLL_DIV_SHIFT;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG6_PLL_DIV_MASK,
> +						 val, RK3568_PHYREG6);
> =20
> -			writel(0x32, priv->mmio + PHYREG18);
> -			writel(0xf0, priv->mmio + PHYREG11);
> +			writel(0x32, priv->mmio + RK3568_PHYREG18);
> +			writel(0xf0, priv->mmio + RK3568_PHYREG11);
>  		}
>  		break;
>  	default:
> @@ -493,20 +497,21 @@ static int rk3562_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  	if (priv->ext_refclk) {
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE && rate =3D=3D REF_CLOCK_100MHz) {
> -			val =3D PHYREG13_RESISTER_HIGH_Z << PHYREG13_RESISTER_SHIFT;
> -			val |=3D PHYREG13_CKRCV_AMP0;
> -			rockchip_combphy_updatel(priv, PHYREG13_RESISTER_MASK, val, PHYREG13);
> -
> -			val =3D readl(priv->mmio + PHYREG14);
> -			val |=3D PHYREG14_CKRCV_AMP1;
> -			writel(val, priv->mmio + PHYREG14);
> +			val =3D RK3568_PHYREG13_RESISTER_HIGH_Z << RK3568_PHYREG13_RESISTER_S=
HIFT;
> +			val |=3D RK3568_PHYREG13_CKRCV_AMP0;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG13_RESISTER_MASK, val,
> +						 RK3568_PHYREG13);
> +
> +			val =3D readl(priv->mmio + RK3568_PHYREG14);
> +			val |=3D RK3568_PHYREG14_CKRCV_AMP1;
> +			writel(val, priv->mmio + RK3568_PHYREG14);
>  		}
>  	}
> =20
>  	if (priv->enable_ssc) {
> -		val =3D readl(priv->mmio + PHYREG8);
> -		val |=3D PHYREG8_SSC_EN;
> -		writel(val, priv->mmio + PHYREG8);
> +		val =3D readl(priv->mmio + RK3568_PHYREG8);
> +		val |=3D RK3568_PHYREG8_SSC_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG8);
>  	}
> =20
>  	return 0;
> @@ -553,9 +558,9 @@ static int rk3568_combphy_cfg(struct rockchip_combphy=
_priv *priv)
>  	switch (priv->type) {
>  	case PHY_TYPE_PCIE:
>  		/* Set SSC downward spread spectrum. */
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK,
> -					 PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT,
> -					 PHYREG32);
> +		val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT;
> +
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val, RK3568_P=
HYREG32);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> @@ -565,30 +570,28 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> =20
>  	case PHY_TYPE_USB3:
>  		/* Set SSC downward spread spectrum. */
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK,
> -					 PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT,
> -					 PHYREG32);
> +		val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT,
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val, RK3568_P=
HYREG32);
> =20
>  		/* Enable adaptive CTLE for USB3.0 Rx. */
> -		val =3D readl(priv->mmio + PHYREG15);
> -		val |=3D PHYREG15_CTLE_EN;
> -		writel(val, priv->mmio + PHYREG15);
> +		val =3D readl(priv->mmio + RK3568_PHYREG15);
> +		val |=3D RK3568_PHYREG15_CTLE_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG15);
> =20
>  		/* Set PLL KVCO fine tuning signals. */
> -		rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -					 PHYREG33_PLL_KVCO_VALUE << PHYREG33_PLL_KVCO_SHIFT,
> -					 PHYREG33);
> +		val =3D RK3568_PHYREG33_PLL_KVCO_VALUE << RK3568_PHYREG33_PLL_KVCO_SHI=
=46T;
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK, val, RK3=
568_PHYREG33);
> =20
>  		/* Enable controlling random jitter. */
> -		writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
> +		writel(RK3568_PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + RK3568_PHYREG12=
);
> =20
>  		/* Set PLL input clock divider 1/2. */
> -		rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK,
> -					 PHYREG6_PLL_DIV_2 << PHYREG6_PLL_DIV_SHIFT,
> -					 PHYREG6);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG6_PLL_DIV_MASK,
> +					 RK3568_PHYREG6_PLL_DIV_2 << RK3568_PHYREG6_PLL_DIV_SHIFT,
> +					 RK3568_PHYREG6);
> =20
> -		writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
> -		writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
> +		writel(RK3568_PHYREG18_PLL_LOOP, priv->mmio + RK3568_PHYREG18);
> +		writel(RK3568_PHYREG11_SU_TRIM_0_7, priv->mmio + RK3568_PHYREG11);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_usb, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, fal=
se);
> @@ -598,16 +601,16 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> =20
>  	case PHY_TYPE_SATA:
>  		/* Enable adaptive CTLE for SATA Rx. */
> -		val =3D readl(priv->mmio + PHYREG15);
> -		val |=3D PHYREG15_CTLE_EN;
> -		writel(val, priv->mmio + PHYREG15);
> +		val =3D readl(priv->mmio + RK3568_PHYREG15);
> +		val |=3D RK3568_PHYREG15_CTLE_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG15);
>  		/*
>  		 * Set tx_rterm=3D50ohm and rx_rterm=3D44ohm for SATA.
>  		 * 0: 60ohm, 8: 50ohm 15: 44ohm (by step abort 1ohm)
>  		 */
> -		val =3D PHYREG7_TX_RTERM_50OHM << PHYREG7_TX_RTERM_SHIFT;
> -		val |=3D PHYREG7_RX_RTERM_44OHM << PHYREG7_RX_RTERM_SHIFT;
> -		writel(val, priv->mmio + PHYREG7);
> +		val =3D RK3568_PHYREG7_TX_RTERM_50OHM << RK3568_PHYREG7_TX_RTERM_SHIFT;
> +		val |=3D RK3568_PHYREG7_RX_RTERM_44OHM << RK3568_PHYREG7_RX_RTERM_SHIF=
T;
> +		writel(val, priv->mmio + RK3568_PHYREG7);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_sata, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_sata, true);
> @@ -642,11 +645,11 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  	case REF_CLOCK_24MHz:
>  		if (priv->type =3D=3D PHY_TYPE_USB3 || priv->type =3D=3D PHY_TYPE_SATA=
) {
>  			/* Set ssc_cnt[9:0]=3D0101111101 & 31.5KHz. */
> -			val =3D PHYREG15_SSC_CNT_VALUE << PHYREG15_SSC_CNT_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG15_SSC_CNT_MASK,
> -						 val, PHYREG15);
> +			val =3D RK3568_PHYREG15_SSC_CNT_VALUE << RK3568_PHYREG15_SSC_CNT_SHIF=
T;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG15_SSC_CNT_MASK,
> +						 val, RK3568_PHYREG15);
> =20
> -			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
> +			writel(RK3568_PHYREG16_SSC_CNT_VALUE, priv->mmio + RK3568_PHYREG16);
>  		}
>  		break;
> =20
> @@ -658,24 +661,26 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE) {
>  			/* PLL KVCO  fine tuning. */
> -			val =3D PHYREG33_PLL_KVCO_VALUE << PHYREG33_PLL_KVCO_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -						 val, PHYREG33);
> +			val =3D RK3568_PHYREG33_PLL_KVCO_VALUE << RK3568_PHYREG33_PLL_KVCO_SH=
IFT;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +						 val, RK3568_PHYREG33);
> =20
>  			/* Enable controlling random jitter. */
> -			writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
> +			writel(RK3568_PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + RK3568_PHYREG1=
2);
> =20
> -			val =3D PHYREG6_PLL_DIV_2 << PHYREG6_PLL_DIV_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK,
> -						 val, PHYREG6);
> +			val =3D RK3568_PHYREG6_PLL_DIV_2 << RK3568_PHYREG6_PLL_DIV_SHIFT;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG6_PLL_DIV_MASK,
> +						 val, RK3568_PHYREG6);
> =20
> -			writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
> -			writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
> +			writel(RK3568_PHYREG18_PLL_LOOP, priv->mmio + RK3568_PHYREG18);
> +			writel(RK3568_PHYREG11_SU_TRIM_0_7, priv->mmio + RK3568_PHYREG11);
>  		} else if (priv->type =3D=3D PHY_TYPE_SATA) {
>  			/* downward spread spectrum +500ppm */
> -			val =3D PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT;
> -			val |=3D PHYREG32_SSC_OFFSET_500PPM << PHYREG32_SSC_OFFSET_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
> +			val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT;
> +			val |=3D RK3568_PHYREG32_SSC_OFFSET_500PPM <<
> +			       RK3568_PHYREG32_SSC_OFFSET_SHIFT;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val,
> +						 RK3568_PHYREG32);
>  		}
>  		break;
> =20
> @@ -687,20 +692,21 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  	if (priv->ext_refclk) {
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE && rate =3D=3D REF_CLOCK_100MHz) {
> -			val =3D PHYREG13_RESISTER_HIGH_Z << PHYREG13_RESISTER_SHIFT;
> -			val |=3D PHYREG13_CKRCV_AMP0;
> -			rockchip_combphy_updatel(priv, PHYREG13_RESISTER_MASK, val, PHYREG13);
> -
> -			val =3D readl(priv->mmio + PHYREG14);
> -			val |=3D PHYREG14_CKRCV_AMP1;
> -			writel(val, priv->mmio + PHYREG14);
> +			val =3D RK3568_PHYREG13_RESISTER_HIGH_Z << RK3568_PHYREG13_RESISTER_S=
HIFT;
> +			val |=3D RK3568_PHYREG13_CKRCV_AMP0;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG13_RESISTER_MASK, val,
> +						 RK3568_PHYREG13);
> +
> +			val =3D readl(priv->mmio + RK3568_PHYREG14);
> +			val |=3D RK3568_PHYREG14_CKRCV_AMP1;
> +			writel(val, priv->mmio + RK3568_PHYREG14);
>  		}
>  	}
> =20
>  	if (priv->enable_ssc) {
> -		val =3D readl(priv->mmio + PHYREG8);
> -		val |=3D PHYREG8_SSC_EN;
> -		writel(val, priv->mmio + PHYREG8);
> +		val =3D readl(priv->mmio + RK3568_PHYREG8);
> +		val |=3D RK3568_PHYREG8_SSC_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG8);
>  	}
> =20
>  	return 0;
> @@ -759,8 +765,8 @@ static int rk3576_combphy_cfg(struct rockchip_combphy=
_priv *priv)
>  	switch (priv->type) {
>  	case PHY_TYPE_PCIE:
>  		/* Set SSC downward spread spectrum */
> -		val =3D FIELD_PREP(PHYREG32_SSC_MASK, PHYREG32_SSC_DOWNWARD);
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
> +		val =3D FIELD_PREP(RK3568_PHYREG32_SSC_MASK, RK3568_PHYREG32_SSC_DOWNW=
ARD);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val, RK3568_P=
HYREG32);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
> @@ -770,32 +776,33 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> =20
>  	case PHY_TYPE_USB3:
>  		/* Set SSC downward spread spectrum */
> -		val =3D FIELD_PREP(PHYREG32_SSC_MASK, PHYREG32_SSC_DOWNWARD);
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
> +		val =3D FIELD_PREP(RK3568_PHYREG32_SSC_MASK, RK3568_PHYREG32_SSC_DOWNW=
ARD);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val, RK3568_P=
HYREG32);
> =20
>  		/* Enable adaptive CTLE for USB3.0 Rx */
> -		val =3D readl(priv->mmio + PHYREG15);
> -		val |=3D PHYREG15_CTLE_EN;
> -		writel(val, priv->mmio + PHYREG15);
> +		val =3D readl(priv->mmio + RK3568_PHYREG15);
> +		val |=3D RK3568_PHYREG15_CTLE_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG15);
> =20
>  		/* Set PLL KVCO fine tuning signals */
> -		rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK, BIT(3), PHYREG3=
3);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK, BIT(3),
> +					 RK3568_PHYREG33);
> =20
>  		/* Set PLL LPF R1 to su_trim[10:7]=3D1001 */
> -		writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
> +		writel(RK3568_PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + RK3568_PHYREG12=
);
> =20
>  		/* Set PLL input clock divider 1/2 */
> -		val =3D FIELD_PREP(PHYREG6_PLL_DIV_MASK, PHYREG6_PLL_DIV_2);
> -		rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK, val, PHYREG6);
> +		val =3D FIELD_PREP(RK3568_PHYREG6_PLL_DIV_MASK, RK3568_PHYREG6_PLL_DIV=
_2);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG6_PLL_DIV_MASK, val, RK356=
8_PHYREG6);
> =20
>  		/* Set PLL loop divider */
> -		writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
> +		writel(RK3568_PHYREG18_PLL_LOOP, priv->mmio + RK3568_PHYREG18);
> =20
>  		/* Set PLL KVCO to min and set PLL charge pump current to max */
> -		writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
> +		writel(RK3568_PHYREG11_SU_TRIM_0_7, priv->mmio + RK3568_PHYREG11);
> =20
>  		/* Set Rx squelch input filler bandwidth */
> -		writel(PHYREG21_RX_SQUELCH_VAL, priv->mmio + PHYREG21);
> +		writel(RK3576_PHYREG21_RX_SQUELCH_VAL, priv->mmio + RK3576_PHYREG21);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, fal=
se);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, fal=
se);
> @@ -804,14 +811,14 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> =20
>  	case PHY_TYPE_SATA:
>  		/* Enable adaptive CTLE for SATA Rx */
> -		val =3D readl(priv->mmio + PHYREG15);
> -		val |=3D PHYREG15_CTLE_EN;
> -		writel(val, priv->mmio + PHYREG15);
> +		val =3D readl(priv->mmio + RK3568_PHYREG15);
> +		val |=3D RK3568_PHYREG15_CTLE_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG15);
> =20
>  		/* Set tx_rterm =3D 50 ohm and rx_rterm =3D 43.5 ohm */
> -		val =3D PHYREG7_TX_RTERM_50OHM << PHYREG7_TX_RTERM_SHIFT;
> -		val |=3D PHYREG7_RX_RTERM_44OHM << PHYREG7_RX_RTERM_SHIFT;
> -		writel(val, priv->mmio + PHYREG7);
> +		val =3D RK3568_PHYREG7_TX_RTERM_50OHM << RK3568_PHYREG7_TX_RTERM_SHIFT;
> +		val |=3D RK3568_PHYREG7_RX_RTERM_44OHM << RK3568_PHYREG7_RX_RTERM_SHIF=
T;
> +		writel(val, priv->mmio + RK3568_PHYREG7);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_sata, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_sata, true);
> @@ -833,19 +840,21 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_24m, true);
>  		if (priv->type =3D=3D PHY_TYPE_USB3 || priv->type =3D=3D PHY_TYPE_SATA=
) {
>  			/* Set ssc_cnt[9:0]=3D0101111101 & 31.5KHz */
> -			val =3D FIELD_PREP(PHYREG15_SSC_CNT_MASK, PHYREG15_SSC_CNT_VALUE);
> -			rockchip_combphy_updatel(priv, PHYREG15_SSC_CNT_MASK,
> -						 val, PHYREG15);
> +			val =3D FIELD_PREP(RK3568_PHYREG15_SSC_CNT_MASK,
> +					 RK3568_PHYREG15_SSC_CNT_VALUE);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG15_SSC_CNT_MASK,
> +						 val, RK3568_PHYREG15);
> =20
> -			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
> +			writel(RK3568_PHYREG16_SSC_CNT_VALUE, priv->mmio + RK3568_PHYREG16);
>  		} else if (priv->type =3D=3D PHY_TYPE_PCIE) {
>  			/* PLL KVCO tuning fine */
> -			val =3D FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK=
3576);
> -			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -						 val, PHYREG33);
> +			val =3D FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 RK3576_PHYREG33_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +						 val, RK3568_PHYREG33);
> =20
>  			/* Set up rx_pck invert and rx msb to disable */
> -			writel(0x00, priv->mmio + PHYREG27);
> +			writel(0x00, priv->mmio + RK3588_PHYREG27);
> =20
>  			/*
>  			 * Set up SU adjust signal:
> @@ -853,11 +862,11 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  			 * su_trim[15:8],  PLL LPF R1 adujst bits[9:7]=3D3'b011
>  			 * su_trim[31:24], CKDRV adjust
>  			 */
> -			writel(0x90, priv->mmio + PHYREG11);
> -			writel(0x02, priv->mmio + PHYREG12);
> -			writel(0x57, priv->mmio + PHYREG14);
> +			writel(0x90, priv->mmio + RK3568_PHYREG11);
> +			writel(0x02, priv->mmio + RK3568_PHYREG12);
> +			writel(0x57, priv->mmio + RK3568_PHYREG14);
> =20
> -			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
> +			writel(RK3568_PHYREG16_SSC_CNT_VALUE, priv->mmio + RK3568_PHYREG16);
>  		}
>  		break;
> =20
> @@ -869,15 +878,16 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE) {
>  			/* gate_tx_pck_sel length select work for L1SS */
> -			writel(0xc0, priv->mmio + PHYREG30);
> +			writel(0xc0, priv->mmio + RK3576_PHYREG30);
> =20
>  			/* PLL KVCO tuning fine */
> -			val =3D FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK=
3576);
> -			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -						 val, PHYREG33);
> +			val =3D FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 RK3576_PHYREG33_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +						 val, RK3568_PHYREG33);
> =20
>  			/* Set up rx_trim: PLL LPF C1 85pf R1 1.25kohm */
> -			writel(0x4c, priv->mmio + PHYREG27);
> +			writel(0x4c, priv->mmio + RK3588_PHYREG27);
> =20
>  			/*
>  			 * Set up SU adjust signal:
> @@ -887,20 +897,23 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  			 * su_trim[23:16], CKRCV adjust
>  			 * su_trim[31:24], CKDRV adjust
>  			 */
> -			writel(0x90, priv->mmio + PHYREG11);
> -			writel(0x43, priv->mmio + PHYREG12);
> -			writel(0x88, priv->mmio + PHYREG13);
> -			writel(0x56, priv->mmio + PHYREG14);
> +			writel(0x90, priv->mmio + RK3568_PHYREG11);
> +			writel(0x43, priv->mmio + RK3568_PHYREG12);
> +			writel(0x88, priv->mmio + RK3568_PHYREG13);
> +			writel(0x56, priv->mmio + RK3568_PHYREG14);
>  		} else if (priv->type =3D=3D PHY_TYPE_SATA) {
>  			/* downward spread spectrum +500ppm */
> -			val =3D FIELD_PREP(PHYREG32_SSC_DIR_MASK, PHYREG32_SSC_DOWNWARD);
> -			val |=3D FIELD_PREP(PHYREG32_SSC_OFFSET_MASK, PHYREG32_SSC_OFFSET_500=
PPM);
> -			rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
> +			val =3D FIELD_PREP(RK3568_PHYREG32_SSC_DIR_MASK,
> +					 RK3568_PHYREG32_SSC_DOWNWARD);
> +			val |=3D FIELD_PREP(RK3568_PHYREG32_SSC_OFFSET_MASK,
> +					  RK3568_PHYREG32_SSC_OFFSET_500PPM);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val,
> +						 RK3568_PHYREG32);
> =20
>  			/* ssc ppm adjust to 3500ppm */
> -			rockchip_combphy_updatel(priv, PHYREG10_SSC_PCM_MASK,
> -						 PHYREG10_SSC_PCM_3500PPM,
> -						 PHYREG10);
> +			rockchip_combphy_updatel(priv, RK3576_PHYREG10_SSC_PCM_MASK,
> +						 RK3576_PHYREG10_SSC_PCM_3500PPM,
> +						 RK3576_PHYREG10);
>  		}
>  		break;
> =20
> @@ -912,12 +925,13 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  	if (priv->ext_refclk) {
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE && rate =3D=3D REF_CLOCK_100MHz) {
> -			val =3D FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK=
3576);
> -			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -						 val, PHYREG33);
> +			val =3D FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 RK3576_PHYREG33_PLL_KVCO_VALUE);
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +						 val, RK3568_PHYREG33);
> =20
>  			/* Set up rx_trim: PLL LPF C1 85pf R1 2.5kohm */
> -			writel(0x0c, priv->mmio + PHYREG27);
> +			writel(0x0c, priv->mmio + RK3588_PHYREG27);
> =20
>  			/*
>  			 * Set up SU adjust signal:
> @@ -927,25 +941,25 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  			 * su_trim[23:16], CKRCV adjust
>  			 * su_trim[31:24], CKDRV adjust
>  			 */
> -			writel(0x90, priv->mmio + PHYREG11);
> -			writel(0x43, priv->mmio + PHYREG12);
> -			writel(0x88, priv->mmio + PHYREG13);
> -			writel(0x56, priv->mmio + PHYREG14);
> +			writel(0x90, priv->mmio + RK3568_PHYREG11);
> +			writel(0x43, priv->mmio + RK3568_PHYREG12);
> +			writel(0x88, priv->mmio + RK3568_PHYREG13);
> +			writel(0x56, priv->mmio + RK3568_PHYREG14);
>  		}
>  	}
> =20
>  	if (priv->enable_ssc) {
> -		val =3D readl(priv->mmio + PHYREG8);
> -		val |=3D PHYREG8_SSC_EN;
> -		writel(val, priv->mmio + PHYREG8);
> +		val =3D readl(priv->mmio + RK3568_PHYREG8);
> +		val |=3D RK3568_PHYREG8_SSC_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG8);
> =20
>  		if (priv->type =3D=3D PHY_TYPE_PCIE && rate =3D=3D REF_CLOCK_24MHz) {
>  			/* Set PLL loop divider */
> -			writel(0x00, priv->mmio + PHYREG17);
> -			writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
> +			writel(0x00, priv->mmio + RK3576_PHYREG17);
> +			writel(RK3568_PHYREG18_PLL_LOOP, priv->mmio + RK3568_PHYREG18);
> =20
>  			/* Set up rx_pck invert and rx msb to disable */
> -			writel(0x00, priv->mmio + PHYREG27);
> +			writel(0x00, priv->mmio + RK3588_PHYREG27);
> =20
>  			/*
>  			 * Set up SU adjust signal:
> @@ -954,16 +968,17 @@ static int rk3576_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
>  			 * su_trim[23:16], CKRCV adjust
>  			 * su_trim[31:24], CKDRV adjust
>  			 */
> -			writel(0x90, priv->mmio + PHYREG11);
> -			writel(0x02, priv->mmio + PHYREG12);
> -			writel(0x08, priv->mmio + PHYREG13);
> -			writel(0x57, priv->mmio + PHYREG14);
> -			writel(0x40, priv->mmio + PHYREG15);
> +			writel(0x90, priv->mmio + RK3568_PHYREG11);
> +			writel(0x02, priv->mmio + RK3568_PHYREG12);
> +			writel(0x08, priv->mmio + RK3568_PHYREG13);
> +			writel(0x57, priv->mmio + RK3568_PHYREG14);
> +			writel(0x40, priv->mmio + RK3568_PHYREG15);
> =20
> -			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
> +			writel(RK3568_PHYREG16_SSC_CNT_VALUE, priv->mmio + RK3568_PHYREG16);
> =20
> -			val =3D FIELD_PREP(PHYREG33_PLL_KVCO_MASK, PHYREG33_PLL_KVCO_VALUE_RK=
3576);
> -			writel(val, priv->mmio + PHYREG33);
> +			val =3D FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
> +					 RK3576_PHYREG33_PLL_KVCO_VALUE);
> +			writel(val, priv->mmio + RK3568_PHYREG33);
>  		}
>  	}
> =20
> @@ -1033,30 +1048,28 @@ static int rk3588_combphy_cfg(struct rockchip_com=
bphy_priv *priv)
>  		break;
>  	case PHY_TYPE_USB3:
>  		/* Set SSC downward spread spectrum */
> -		rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK,
> -					 PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT,
> -					 PHYREG32);
> +		val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT;
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val, RK3568_P=
HYREG32);
> =20
>  		/* Enable adaptive CTLE for USB3.0 Rx. */
> -		val =3D readl(priv->mmio + PHYREG15);
> -		val |=3D PHYREG15_CTLE_EN;
> -		writel(val, priv->mmio + PHYREG15);
> +		val =3D readl(priv->mmio + RK3568_PHYREG15);
> +		val |=3D RK3568_PHYREG15_CTLE_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG15);
> =20
>  		/* Set PLL KVCO fine tuning signals. */
> -		rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -					 PHYREG33_PLL_KVCO_VALUE << PHYREG33_PLL_KVCO_SHIFT,
> -					 PHYREG33);
> +		val =3D RK3568_PHYREG33_PLL_KVCO_VALUE << RK3568_PHYREG33_PLL_KVCO_SHI=
=46T,
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK, val, RK3=
568_PHYREG33);
> =20
>  		/* Enable controlling random jitter. */
> -		writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
> +		writel(RK3568_PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + RK3568_PHYREG12=
);
> =20
>  		/* Set PLL input clock divider 1/2. */
> -		rockchip_combphy_updatel(priv, PHYREG6_PLL_DIV_MASK,
> -					 PHYREG6_PLL_DIV_2 << PHYREG6_PLL_DIV_SHIFT,
> -					 PHYREG6);
> +		rockchip_combphy_updatel(priv, RK3568_PHYREG6_PLL_DIV_MASK,
> +					 RK3568_PHYREG6_PLL_DIV_2 << RK3568_PHYREG6_PLL_DIV_SHIFT,
> +					 RK3568_PHYREG6);
> =20
> -		writel(PHYREG18_PLL_LOOP, priv->mmio + PHYREG18);
> -		writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
> +		writel(RK3568_PHYREG18_PLL_LOOP, priv->mmio + RK3568_PHYREG18);
> +		writel(RK3568_PHYREG11_SU_TRIM_0_7, priv->mmio + RK3568_PHYREG11);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, fal=
se);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, fal=
se);
> @@ -1064,16 +1077,16 @@ static int rk3588_combphy_cfg(struct rockchip_com=
bphy_priv *priv)
>  		break;
>  	case PHY_TYPE_SATA:
>  		/* Enable adaptive CTLE for SATA Rx. */
> -		val =3D readl(priv->mmio + PHYREG15);
> -		val |=3D PHYREG15_CTLE_EN;
> -		writel(val, priv->mmio + PHYREG15);
> +		val =3D readl(priv->mmio + RK3568_PHYREG15);
> +		val |=3D RK3568_PHYREG15_CTLE_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG15);
>  		/*
>  		 * Set tx_rterm=3D50ohm and rx_rterm=3D44ohm for SATA.
>  		 * 0: 60ohm, 8: 50ohm 15: 44ohm (by step abort 1ohm)
>  		 */
> -		val =3D PHYREG7_TX_RTERM_50OHM << PHYREG7_TX_RTERM_SHIFT;
> -		val |=3D PHYREG7_RX_RTERM_44OHM << PHYREG7_RX_RTERM_SHIFT;
> -		writel(val, priv->mmio + PHYREG7);
> +		val =3D RK3568_PHYREG7_TX_RTERM_50OHM << RK3568_PHYREG7_TX_RTERM_SHIFT;
> +		val |=3D RK3568_PHYREG7_RX_RTERM_44OHM << RK3568_PHYREG7_RX_RTERM_SHIF=
T;
> +		writel(val, priv->mmio + RK3568_PHYREG7);
> =20
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_sata, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_sata, true);
> @@ -1095,11 +1108,11 @@ static int rk3588_combphy_cfg(struct rockchip_com=
bphy_priv *priv)
>  	case REF_CLOCK_24MHz:
>  		if (priv->type =3D=3D PHY_TYPE_USB3 || priv->type =3D=3D PHY_TYPE_SATA=
) {
>  			/* Set ssc_cnt[9:0]=3D0101111101 & 31.5KHz. */
> -			val =3D PHYREG15_SSC_CNT_VALUE << PHYREG15_SSC_CNT_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG15_SSC_CNT_MASK,
> -						 val, PHYREG15);
> +			val =3D RK3568_PHYREG15_SSC_CNT_VALUE << RK3568_PHYREG15_SSC_CNT_SHIF=
T;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG15_SSC_CNT_MASK,
> +						 val, RK3568_PHYREG15);
> =20
> -			writel(PHYREG16_SSC_CNT_VALUE, priv->mmio + PHYREG16);
> +			writel(RK3568_PHYREG16_SSC_CNT_VALUE, priv->mmio + RK3568_PHYREG16);
>  		}
>  		break;
> =20
> @@ -1110,23 +1123,25 @@ static int rk3588_combphy_cfg(struct rockchip_com=
bphy_priv *priv)
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_100m, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE) {
>  			/* PLL KVCO fine tuning. */
> -			val =3D 4 << PHYREG33_PLL_KVCO_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG33_PLL_KVCO_MASK,
> -						 val, PHYREG33);
> +			val =3D 4 << RK3568_PHYREG33_PLL_KVCO_SHIFT;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
> +						 val, RK3568_PHYREG33);
> =20
>  			/* Enable controlling random jitter. */
> -			writel(PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + PHYREG12);
> +			writel(RK3568_PHYREG12_PLL_LPF_ADJ_VALUE, priv->mmio + RK3568_PHYREG1=
2);
> =20
>  			/* Set up rx_trim: PLL LPF C1 85pf R1 1.25kohm */
> -			writel(PHYREG27_RX_TRIM_RK3588, priv->mmio + PHYREG27);
> +			writel(RK3588_PHYREG27_RX_TRIM, priv->mmio + RK3588_PHYREG27);
> =20
>  			/* Set up su_trim:  */
> -			writel(PHYREG11_SU_TRIM_0_7, priv->mmio + PHYREG11);
> +			writel(RK3568_PHYREG11_SU_TRIM_0_7, priv->mmio + RK3568_PHYREG11);
>  		} else if (priv->type =3D=3D PHY_TYPE_SATA) {
>  			/* downward spread spectrum +500ppm */
> -			val =3D PHYREG32_SSC_DOWNWARD << PHYREG32_SSC_DIR_SHIFT;
> -			val |=3D PHYREG32_SSC_OFFSET_500PPM << PHYREG32_SSC_OFFSET_SHIFT;
> -			rockchip_combphy_updatel(priv, PHYREG32_SSC_MASK, val, PHYREG32);
> +			val =3D RK3568_PHYREG32_SSC_DOWNWARD << RK3568_PHYREG32_SSC_DIR_SHIFT;
> +			val |=3D RK3568_PHYREG32_SSC_OFFSET_500PPM <<
> +			       RK3568_PHYREG32_SSC_OFFSET_SHIFT;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, val,
> +						 RK3568_PHYREG32);
>  		}
>  		break;
>  	default:
> @@ -1137,20 +1152,21 @@ static int rk3588_combphy_cfg(struct rockchip_com=
bphy_priv *priv)
>  	if (priv->ext_refclk) {
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
>  		if (priv->type =3D=3D PHY_TYPE_PCIE && rate =3D=3D REF_CLOCK_100MHz) {
> -			val =3D PHYREG13_RESISTER_HIGH_Z << PHYREG13_RESISTER_SHIFT;
> -			val |=3D PHYREG13_CKRCV_AMP0;
> -			rockchip_combphy_updatel(priv, PHYREG13_RESISTER_MASK, val, PHYREG13);
> -
> -			val =3D readl(priv->mmio + PHYREG14);
> -			val |=3D PHYREG14_CKRCV_AMP1;
> -			writel(val, priv->mmio + PHYREG14);
> +			val =3D RK3568_PHYREG13_RESISTER_HIGH_Z << RK3568_PHYREG13_RESISTER_S=
HIFT;
> +			val |=3D RK3568_PHYREG13_CKRCV_AMP0;
> +			rockchip_combphy_updatel(priv, RK3568_PHYREG13_RESISTER_MASK, val,
> +						 RK3568_PHYREG13);
> +
> +			val =3D readl(priv->mmio + RK3568_PHYREG14);
> +			val |=3D RK3568_PHYREG14_CKRCV_AMP1;
> +			writel(val, priv->mmio + RK3568_PHYREG14);
>  		}
>  	}
> =20
>  	if (priv->enable_ssc) {
> -		val =3D readl(priv->mmio + PHYREG8);
> -		val |=3D PHYREG8_SSC_EN;
> -		writel(val, priv->mmio + PHYREG8);
> +		val =3D readl(priv->mmio + RK3568_PHYREG8);
> +		val |=3D RK3568_PHYREG8_SSC_EN;
> +		writel(val, priv->mmio + RK3568_PHYREG8);
>  	}
> =20
>  	return 0;
>=20




