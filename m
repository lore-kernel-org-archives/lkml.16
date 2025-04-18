Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829D1A76D0;
	Fri, 18 Apr 2025 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744975815; cv=none; b=SRFgwT+qzrFrfoQ20KOjiidq79tZ1p0Y8sf8d4Z4O8soTC5rIoPHa6JKxdxFprB1AV+Ld80DjelfjtVG59a5ygCcEzFqpHF2De/e7hu8l39OwkNWxERKIgLetJscwMkqNImbC5In/xaMKQD0RT80Phg1X0mZXgqg44rlYVlT7MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744975815; c=relaxed/simple;
	bh=yNO/Vv11a/JNX5B7+Pdq/at6wgGWnlT9+n3hN8pOBzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrUYdlUuzXdIwFK2NkjPQzXpr4T08ZZnZVlh75pjqJSUDym+7owHffRfOlCl8Y48UUXy4aFBvbAb1GGx4PTgHGuqnojMWKjLh8h+5ukuiWoFTYhoCpnEicgxB8hca9AFflUFu4OpHdZfRj8Cy/ZWxP0FufBS0OEc0ceesrKNi3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiByg55X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiByg55X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B3DC4CEE2;
	Fri, 18 Apr 2025 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744975815;
	bh=yNO/Vv11a/JNX5B7+Pdq/at6wgGWnlT9+n3hN8pOBzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiByg55Xfnr4eelEkmxAH7NdKKRQ+cA8HY7+HclMeCvg7c7jkhguGTwVHzS+y++mN
	 Ash4JUtwAqWDVUlc5IDef0bax1HCRFiHdeqsORE0LUnWFtNdD80VwqGBuoUm85o6G9
	 MRsJ8QpXNlACPP1U0xaJ2bmCt9zzkxBJnLkArVgjcNdspWw3BPr4EKu2mwnBmQP+A0
	 yVv4OcBb97VgmQptxtouEwwP24vjwNsP5MFAUd6IXzURc/YDTRJQtniSTuQemduv1A
	 oGYJpzDJGH2BsXFF8m1h3Gd7ISbC/4UsF6BIbDzLyrTyQkjKqBpUwJ1epVKd1yc91T
	 RPJx3aEzYhetQ==
Date: Fri, 18 Apr 2025 17:00:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bincai Liu <bincai.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 5/5] drm/mediatek: Add eDP phy driver for mt8196
Message-ID: <aAI3wkJmNH6ZcdfO@vaman>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
 <20250418065313.8972-6-bincai.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418065313.8972-6-bincai.liu@mediatek.com>

On 18-04-25, 14:52, Bincai Liu wrote:
> Add code to support eDP phy for mt8196.

Why is the patch title not "phy: add eDP phy...." why is this tagged
drm? 

> 
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> ---
>  drivers/phy/mediatek/Makefile      |   1 +
>  drivers/phy/mediatek/phy-mtk-edp.c | 262 +++++++++++++++++++++++++++++
>  2 files changed, 263 insertions(+)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-edp.c
> 
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 1b8088df71e8..49d9ea42497a 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -4,6 +4,7 @@
>  #
>  
>  obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
> +obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-edp.o
>  obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
> diff --git a/drivers/phy/mediatek/phy-mtk-edp.c b/drivers/phy/mediatek/phy-mtk-edp.c
> new file mode 100644
> index 000000000000..fadcbda55b70
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-edp.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2022 MediaTek Inc.
> + * Copyright (c) 2022 BayLibre
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define PHYD_OFFSET			0x0000
> +#define PHYD_DIG_LAN0_OFFSET		0x1000
> +#define PHYD_DIG_LAN1_OFFSET		0x1100
> +#define PHYD_DIG_LAN2_OFFSET		0x1200
> +#define PHYD_DIG_LAN3_OFFSET		0x1300
> +#define PHYD_DIG_GLB_OFFSET		0x1400
> +
> +#define DP_PHY_DIG_PLL_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x10)
> +#define FORCE_PWORE_STATE_FLDMASK		GENMASK(2, 0)
> +#define FORCE_PWORE_STATE_VALUE			0x7
> +
> +#define IPMUX_CONTROL			(PHYD_DIG_GLB_OFFSET + 0x98)
> +#define EDPTX_DSI_PHYD_SEL_FLDMASK		0x1
> +#define EDPTX_DSI_PHYD_SEL_FLDMASK_POS		0
> +
> +#define DP_PHY_DIG_TX_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x74)
> +#define TX_LN_EN_FLDMASK			0xf
> +
> +#define mtk_edp_PHY_DIG_PLL_CTL_1	(PHYD_DIG_GLB_OFFSET + 0x14)
> +#define TPLL_SSC_EN				BIT(8)
> +
> +#define mtk_edp_PHY_DIG_BIT_RATE		(PHYD_DIG_GLB_OFFSET + 0x3C)
> +#define BIT_RATE_RBR				0x1
> +#define BIT_RATE_HBR				0x4
> +#define BIT_RATE_HBR2				0x7
> +#define BIT_RATE_HBR3				0x9
> +
> +#define mtk_edp_PHY_DIG_SW_RST		(PHYD_DIG_GLB_OFFSET + 0x38)
> +#define DP_GLB_SW_RST_PHYD			BIT(0)
> +#define DP_GLB_SW_RST_PHYD_MASK			BIT(0)
> +
> +#define DRIVING_FORCE			0x30
> +#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK	0x6
> +#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK_POS	1
> +#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK		0x18
> +#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK_POS	3
> +
> +struct mtk_edp_phy {
> +	struct regmap *regs;
> +};
> +
> +enum DPTX_LANE_NUM {
> +	DPTX_LANE0 = 0x0,
> +	DPTX_LANE1 = 0x1,
> +	DPTX_LANE2 = 0x2,
> +	DPTX_LANE3 = 0x3,
> +	DPTX_LANE_MAX,
> +};
> +
> +enum DPTX_LANE_COUNT {
> +	DPTX_LANE_COUNT1 = 0x1,
> +	DPTX_LANE_COUNT2 = 0x2,
> +	DPTX_LANE_COUNT4 = 0x4,
> +};
> +
> +static void mtk_edptx_phyd_reset_swing_pre(struct mtk_edp_phy *edp_phy)
> +{
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN2_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN3_OFFSET + DRIVING_FORCE,
> +			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
> +			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
> +}
> +
> +static int mtk_edp_phy_init(struct phy *phy)
> +{
> +	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(edp_phy->regs, IPMUX_CONTROL, 0,
> +			   EDPTX_DSI_PHYD_SEL_FLDMASK);
> +
> +	regmap_update_bits(edp_phy->regs, DP_PHY_DIG_PLL_CTL_0,
> +			   FORCE_PWORE_STATE_VALUE,
> +			   FORCE_PWORE_STATE_FLDMASK);
> +
> +	return 0;

consider making this void return type

-- 
~Vinod
