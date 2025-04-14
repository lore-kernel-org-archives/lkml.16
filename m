Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA4268C75;
	Mon, 14 Apr 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626349; cv=none; b=G3MnGhOvGE1TBbKIoMmNvJM/r8BYQOwkikGMCoHguQ02UPkwQfFVoKa9TH85ZTiG4HNjGVLYHM34XbaoF3r+S3ouUHtnH9qu8pIQT7heUurnp6Mar7Z+TzqVRbe3Mw/e8xHjUd4DmlUQ6bnbFxxC8uZBD6Vz24IAWDqV3EIvs7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626349; c=relaxed/simple;
	bh=bl8BfAV621uanXZNR0S0HLnYSKjXIcTr8aYHoHGc9zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbipSn7LqhVYEx0cxb0zDGhgGacTK4Xv+aMdR/sueuc1IkowxpLBd4ajSNhiKMeLHc7CCCVYNE5CaOQEPxMQy/CNzAjqLv1X82vfmSSfh3kYUNSw6spYJ/qllA/lcqyRnR/R2zofRboDzca6y3xOJpKTPzU8Exh5E7V6GoALQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KgzHsE2/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KgzHsE2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744626345;
	bh=bl8BfAV621uanXZNR0S0HLnYSKjXIcTr8aYHoHGc9zQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KgzHsE2/SoDtI8JVC+b72sH/U+Et+tQBmLOV9hIDcYdAow6lG7x+0yuZsIyzrd9qu
	 azJPDrcZZAsLTbkZynnCw4Kh/+V80dghJ4VI7WUi/c2wvXpUssGH8ifmyHhO3Lzd0M
	 axSs23lyRuXjYH7MrRvIISSG0lyGZiCWD+ATPBCt5LU8vX69e7hOCUBZkRaUwWYzbH
	 AG5SWsOXFXX4Cewgbt55t6qACuR+v4OjEpHwY03Vo+neGna6v2UyrPMa2HbrbFNJxB
	 iFhuxn7ipuUZ1Ptn//6Uesi86pSnczmAKu0QMF07EILUl5Prhf7HrhFYMfUc+Y46uh
	 drexMz8zuE/5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F10017E0809;
	Mon, 14 Apr 2025 12:25:44 +0200 (CEST)
Message-ID: <4216ff34-66dc-4601-b2d4-0a51595d0b59@collabora.com>
Date: Mon, 14 Apr 2025 12:25:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/5] phy: mediatek: xsphy: support type switch by pericfg
To: Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250413085806.8544-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/04/25 10:58, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Patch from Sam Shih <sam.shih@mediatek.com> found in MediaTek SDK
> released under GPL.
> 
> Get syscon and use it to set the PHY type.
> Extend support to PCIe and SGMII mode in addition to USB2 and USB3.
> 

That's really exactly the same code that is in phy-mtk-tphy.c ... and actually
there's a whole lot of code that is duplicated between TPHY and XSPHY...

It's even possible to just add the XSPHY to the TPHY driver and call it a day
if we really want to, but I'll leave that decision to the maintainer.

Another way would be to add a phy-mtk-tphy-common.c and migrate all of the common
code that can be shared from both XSPHY and TPHY in there....

Besides, if you check the register layout - even that is something like 90% the
same (actually, looks like even more than that, but for the sake of being
conservative...) so this really points me at believing that, despite the naming
change, those IPs are just incremental versions, or XSPHY is simply a reduced
functionality TPHY.

Either way, those are sharing really too much code to just keep duplicating :-)

P.S.: Those comments are only for the code, not for the binding.

Cheers,
Angelo

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/phy/mediatek/phy-mtk-xsphy.c | 85 +++++++++++++++++++++++++++-
>   1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
> index 7c248f5cfca5..c0ddb9273cc3 100644
> --- a/drivers/phy/mediatek/phy-mtk-xsphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
> @@ -11,10 +11,12 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   
>   #include "phy-mtk-io.h"
>   
> @@ -81,12 +83,22 @@
>   #define XSP_SR_COEF_DIVISOR	1000
>   #define XSP_FM_DET_CYCLE_CNT	1024
>   
> +/* PHY switch between pcie/usb3/sgmii */
> +#define USB_PHY_SWITCH_CTRL	0x0
> +#define RG_PHY_SW_TYPE		GENMASK(3, 0)
> +#define RG_PHY_SW_PCIE		0x0
> +#define RG_PHY_SW_USB3		0x1
> +#define RG_PHY_SW_SGMII		0x2
> +
>   struct xsphy_instance {
>   	struct phy *phy;
>   	void __iomem *port_base;
>   	struct clk *ref_clk;	/* reference clock of anolog phy */
>   	u32 index;
>   	u32 type;
> +	struct regmap *type_sw;
> +	u32 type_sw_reg;
> +	u32 type_sw_index;
>   	/* only for HQA test */
>   	int efuse_intr;
>   	int efuse_tx_imp;
> @@ -259,6 +271,10 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
>   			inst->efuse_intr, inst->efuse_tx_imp,
>   			inst->efuse_rx_imp);
>   		break;
> +	case PHY_TYPE_PCIE:
> +	case PHY_TYPE_SGMII:
> +		/* nothing to do */
> +		break;
>   	default:
>   		dev_err(xsphy->dev, "incompatible phy type\n");
>   		return;
> @@ -305,6 +321,62 @@ static void u3_phy_props_set(struct mtk_xsphy *xsphy,
>   				     RG_XTP_LN0_RX_IMPSEL, inst->efuse_rx_imp);
>   }
>   
> +/* type switch for usb3/pcie/sgmii */
> +static int phy_type_syscon_get(struct xsphy_instance *instance,
> +			       struct device_node *dn)
> +{
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	/* type switch function is optional */
> +	if (!of_property_present(dn, "mediatek,syscon-type"))
> +		return 0;
> +
> +	ret = of_parse_phandle_with_fixed_args(dn, "mediatek,syscon-type",
> +					       2, 0, &args);
> +	if (ret)
> +		return ret;
> +
> +	instance->type_sw_reg = args.args[0];
> +	instance->type_sw_index = args.args[1] & 0x3; /* <=3 */
> +	instance->type_sw = syscon_node_to_regmap(args.np);
> +	of_node_put(args.np);
> +	dev_info(&instance->phy->dev, "type_sw - reg %#x, index %d\n",
> +		 instance->type_sw_reg, instance->type_sw_index);
> +
> +	return PTR_ERR_OR_ZERO(instance->type_sw);
> +}
> +
> +static int phy_type_set(struct xsphy_instance *instance)
> +{
> +	int type;
> +	u32 offset;
> +
> +	if (!instance->type_sw)
> +		return 0;
> +
> +	switch (instance->type) {
> +	case PHY_TYPE_USB3:
> +		type = RG_PHY_SW_USB3;
> +		break;
> +	case PHY_TYPE_PCIE:
> +		type = RG_PHY_SW_PCIE;
> +		break;
> +	case PHY_TYPE_SGMII:
> +		type = RG_PHY_SW_SGMII;
> +		break;
> +	case PHY_TYPE_USB2:
> +	default:
> +		return 0;
> +	}
> +
> +	offset = instance->type_sw_index * BITS_PER_BYTE;
> +	regmap_update_bits(instance->type_sw, instance->type_sw_reg,
> +			   RG_PHY_SW_TYPE << offset, type << offset);
> +
> +	return 0;
> +}
> +
>   static int mtk_phy_init(struct phy *phy)
>   {
>   	struct xsphy_instance *inst = phy_get_drvdata(phy);
> @@ -325,6 +397,10 @@ static int mtk_phy_init(struct phy *phy)
>   	case PHY_TYPE_USB3:
>   		u3_phy_props_set(xsphy, inst);
>   		break;
> +	case PHY_TYPE_PCIE:
> +	case PHY_TYPE_SGMII:
> +		/* nothing to do, only used to set type */
> +		break;
>   	default:
>   		dev_err(xsphy->dev, "incompatible phy type\n");
>   		clk_disable_unprepare(inst->ref_clk);
> @@ -403,12 +479,15 @@ static struct phy *mtk_phy_xlate(struct device *dev,
>   
>   	inst->type = args->args[0];
>   	if (!(inst->type == PHY_TYPE_USB2 ||
> -	      inst->type == PHY_TYPE_USB3)) {
> +	      inst->type == PHY_TYPE_USB3 ||
> +	      inst->type == PHY_TYPE_PCIE ||
> +	      inst->type == PHY_TYPE_SGMII)) {
>   		dev_err(dev, "unsupported phy type: %d\n", inst->type);
>   		return ERR_PTR(-EINVAL);
>   	}
>   
>   	phy_parse_property(xsphy, inst);
> +	phy_type_set(inst);
>   
>   	return inst->phy;
>   }
> @@ -510,6 +589,10 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
>   			dev_err(dev, "failed to get ref_clk(id-%d)\n", port);
>   			return PTR_ERR(inst->ref_clk);
>   		}
> +
> +		retval = phy_type_syscon_get(inst, child_np);
> +		if (retval)
> +			return retval;
>   	}
>   
>   	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);


