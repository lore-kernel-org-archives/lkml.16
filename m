Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4430A1D5CD4;
	Thu,  5 Jun 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129640; cv=none; b=Mt9L5ewsjfHpZiCuJ2iYfGMLrv/VuSiq/XSEV0fuiePw4TZNbfP45vQzGwXJ0fQ4dqKr1zg7mbQc/mVyCtsEBkZ03sQ07T/MSN96ipQ3VsegXsX7my22cbwIudlce7ocA5OSxh0q3SUI+b3VVDmPSa8DMNAnsusStTgM3T2KpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129640; c=relaxed/simple;
	bh=ulpJLGkdr3aB5V2EPPVcPC0luGjyJhwWd+aMeKsU8qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCS5k10i+FOFb3xtw9yJobjYtA/zuzSq6wRx5vq2DUrTEVwSWUII7p7ezAAM1OYBvzsWQ6H0wlSS6EeaSzVIb9Q0EkYaWFPjrbG7P8rfnHldyneKr5h+hNqDjLwfog0vjeEscZIGqKqDsSTAqjgTZWYs0c0+Sgt2pg2xniX88RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.17.176.245])
	by smtp.qiye.163.com (Hmail) with ESMTP id 17a6df1b1;
	Thu, 5 Jun 2025 21:15:25 +0800 (GMT+08:00)
Date: Thu, 5 Jun 2025 21:15:24 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] phy: spacemit: support K1 USB2.0 PHY controller
Message-ID: <aEGYbFB4jk8HrZXx@jean.localdomain>
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
 <20250527-b4-k1-usb3-phy-v2-v5-3-2d366b0af999@whut.edu.cn>
 <20250605125837-GYA98953@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605125837-GYA98953@gentoo>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0JJVh1PQh8fGR0aQ0oZHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKTFVKTE1VSU9OWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a97403b69ac03a1kunmb30ee9d3f12f
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Cio4DTE6OSI9DFEqLhor
	TD0wCxBVSlVKTE9CSklCSElNS09PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKTFVKTE1VSU9OWVdZCAFZQUJMSks3Bg++

On Thu, Jun 05, 2025 at 12:58:37PM +0000, Yixun Lan wrote:
> Hi Ze,
> 
> few minor comments..
> On 20:01 Tue 27 May     , Ze Huang wrote:
> > The SpacemiT K1 SoC includes three USB ports:
> > 
> > - One USB2.0 OTG port
> > - One USB2.0 host-only port
> > - One USB3.0 port with an integrated USB2.0 DRD interface
> > 
> > Each of these ports is connected to a USB2.0 PHY responsible for USB2
> > transmission.
> > 
> > This commit adds support for the SpacemiT K1 USB2.0 PHY, which is
> > compliant with the USB 2.0 specification and supports both 8-bit 60MHz
> > and 16-bit 30MHz parallel interfaces.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >  drivers/phy/Kconfig                |   1 +
> >  drivers/phy/Makefile               |   1 +
> >  drivers/phy/spacemit/Kconfig       |  13 ++++
> >  drivers/phy/spacemit/Makefile      |   2 +
> >  drivers/phy/spacemit/phy-k1-usb2.c | 144 +++++++++++++++++++++++++++++++++++++
> >  5 files changed, 161 insertions(+)
> > 
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 8d58efe998ec5fd50054eed2c90d6ecce6bd5dd8..fca589aa7926eb5bce14e99785cf32cf0395202e 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -114,6 +114,7 @@ source "drivers/phy/renesas/Kconfig"
> >  source "drivers/phy/rockchip/Kconfig"
> >  source "drivers/phy/samsung/Kconfig"
> >  source "drivers/phy/socionext/Kconfig"
> > +source "drivers/phy/spacemit/Kconfig"
> >  source "drivers/phy/st/Kconfig"
> >  source "drivers/phy/starfive/Kconfig"
> >  source "drivers/phy/sunplus/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index e281442acc752820fe0bd638dfe38986a37c2a78..05993ff8a15daf7e2583b5f9b9b37ac584a30609 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -34,6 +34,7 @@ obj-y					+= allwinner/	\
> >  					   rockchip/	\
> >  					   samsung/	\
> >  					   socionext/	\
> > +					   spacemit/	\
> >  					   st/		\
> >  					   starfive/	\
> >  					   sunplus/	\
> > diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0136aee2e8a2f5f484da136b26f80130794b992c
> > --- /dev/null
> > +++ b/drivers/phy/spacemit/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Phy drivers for SpacemiT platforms
> > +#
> > +config PHY_SPACEMIT_K1_USB2
> > +	tristate "SpacemiT K1 USB 2.0 PHY support"
> > +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> > +	depends on COMMON_CLK
> > +	depends on USB_COMMON
> > +	select GENERIC_PHY
> > +	help
> > +	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
> > +	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> > diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..fec0b425a948541b39b814caef0b05e1e002d92f
> > --- /dev/null
> > +++ b/drivers/phy/spacemit/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> > diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ee64af07478ea02b421473e6f73fd37a3a135e7d
> > --- /dev/null
> > +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> > @@ -0,0 +1,144 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * SpacemiT K1 USB 2.0 PHY driver
> > + *
> > + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
> keep email address consistent with your SoF?
> 

I used my personal email since my .edu address might be revoked after
graduation.

> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/usb/of.h>
> > +
> > +#define USB2_PHY_REG01			0x04
> > +#define  USB2_PHY_REG01_VAL		0x60ef
> > +#define  USB2_PHY_REG01_PLL_IS_READY	BIT(0)
> > +#define USB2_PHY_REG04			0x10
> > +#define  USB2_PHY_REG04_AUTO_CLEAR_DIS	BIT(2)
> > +#define USB2_PHY_REG0D			0x34
> > +#define  USB2_PHY_REG0D_VAL		0x1c
> > +#define USB2_PHY_REG26			0x98
> > +#define  USB2_PHY_REG26_VAL		0xbec4
> > +
> > +#define USB2D_CTRL_RESET_TIME_MS	50
> > +
> > +struct spacemit_usb2phy {
> > +	struct phy	*phy;
> use space instead of tab? same as you do in 4/4 patch
> (It would be easy to break the alignment if adding more members in
> the future, or bring unnecessary changes if re-arrange alignment)

Thanks, will follow

> > +	struct clk	*clk;
> > +	struct regmap	*regmap_base;
> > +};
> > +
> > +static const struct regmap_config phy_regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = 0x200,
> > +};
> > +
> > +static int spacemit_usb2phy_init(struct phy *phy)
> > +{
> > +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> > +	struct regmap *map = sphy->regmap_base;
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(sphy->clk);
> > +	if (ret) {
> > +		dev_err(&phy->dev, "failed to enable clock\n");
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * make sure the usb controller is not under reset process before
> > +	 * any configuration
> > +	 */
> > +	usleep_range(150, 200);
> > +	regmap_write(map, USB2_PHY_REG26, USB2_PHY_REG26_VAL); /* 24M ref clk */
> > +
> > +	ret = regmap_read_poll_timeout(map, USB2_PHY_REG01, val,
> > +				       (val & USB2_PHY_REG01_PLL_IS_READY),
> > +				       500, USB2D_CTRL_RESET_TIME_MS * 1000);
> > +	if (ret) {
> > +		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
> > +		return ret;
> > +	}
> > +
> > +	/* release usb2 phy internal reset and enable clock gating */
> > +	regmap_write(map, USB2_PHY_REG01, USB2_PHY_REG01_VAL);
> > +	regmap_write(map, USB2_PHY_REG0D, USB2_PHY_REG0D_VAL);
> > +
> > +	/* auto clear host disc */
> > +	regmap_update_bits(map, USB2_PHY_REG04, USB2_PHY_REG04_AUTO_CLEAR_DIS,
> > +			   USB2_PHY_REG04_AUTO_CLEAR_DIS);
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_usb2phy_exit(struct phy *phy)
> > +{
> > +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> > +
> > +	clk_disable_unprepare(sphy->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct phy_ops spacemit_usb2phy_ops = {
> > +	.init = spacemit_usb2phy_init,
> > +	.exit = spacemit_usb2phy_exit,
> > +	.owner = THIS_MODULE,
> > +};
> > +
> > +static int spacemit_usb2phy_probe(struct platform_device *pdev)
> > +{
> > +	struct phy_provider *phy_provider;
> > +	struct device *dev = &pdev->dev;
> > +	struct spacemit_usb2phy *sphy;
> > +	void __iomem *base;
> > +
> > +	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> > +	if (!sphy)
> > +		return -ENOMEM;
> > +
> > +	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> > +	if (IS_ERR(sphy->clk))
> > +		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	sphy->regmap_base = devm_regmap_init_mmio(dev, base, &phy_regmap_config);
> > +	if (IS_ERR(sphy->regmap_base))
> > +		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base),
> ..
> > +				     "Failed to init regmap\n");
> no need to break line

OK

> > +
> > +	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> > +	if (IS_ERR(sphy->phy))
> > +		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
> > +
> > +	phy_set_drvdata(sphy->phy, sphy);
> > +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > +
> > +	return PTR_ERR_OR_ZERO(phy_provider);
> > +}
> > +
> > +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> > +	{ .compatible = "spacemit,k1-usb2-phy", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> > +
> > +static struct platform_driver spacemit_usb2_phy_driver = {
> > +	.probe	= spacemit_usb2phy_probe,
> > +	.driver = {
> > +		.name   = "spacemit-usb2-phy",
> > +		.of_match_table = spacemit_usb2phy_dt_match,
> > +	},
> > +};
> > +module_platform_driver(spacemit_usb2_phy_driver);
> > +
> > +MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
> > +MODULE_LICENSE("GPL");
> > 
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Yixun Lan (dlan)
> 
> 
> 
