Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806F7221F06;
	Wed, 14 May 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212671; cv=none; b=P/8TT3aJjTncLt2XufLaod5VZytQ+AuEyqE7X9MVWsNnh8Ry3HUDAlr2W5VA5SA8jdbale/OPn1NPau7dgu4kJea+p9rHXUX0mqaJWqEqAWFVODwuT3S/PTehcRycjrYH63zekronj+mPIuaHfo7waRE9JNT7fgEo1xNi7z2/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212671; c=relaxed/simple;
	bh=7KkDWWcRgm3PmtJK+aAn5sYt/3mOneubs8iEDFWHSlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDWkKa39JH0VXDrMWL7/T3ocf+iRcfTcy6SEdbXZ/LKzDpuJvpFlv9QgRhCv0d7+8q7cByGIfZ4NPdSL2oiuuwSam1MbXSmVz8htxS8Tjt6QuBdrrxPjwO1qJTzluWZrm5wPIxudq9y60o2wr2fPOYkzI/3uePKBygiyX1Yb/h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUaL+BYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUaL+BYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2F6C4CEE9;
	Wed, 14 May 2025 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212671;
	bh=7KkDWWcRgm3PmtJK+aAn5sYt/3mOneubs8iEDFWHSlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUaL+BYqtavrlWK7oaPX9f9VX6ZNq2MCaHFZVwDEBX0ZVbc1y3fBnWgUwVyar16B6
	 27vDATl7HWckbintyT8CV5pEy7oRPiVciKPhFkrTgHnLYLXTb+gfDGLy3b5Df54FBa
	 dozLnwYpFG6hoFQV50g+bgVwMsd5hD9ClBDmPa4gr/mBpldS7l6qMwgs1bPnh33frx
	 0m/fswXLpdkBIzXDIcXrH/fSy+GXMLyb+l5tV+ig8MX30dlhM2y+g7rco97s7RKIea
	 EEwalUG4jBCZvv5JMQE3axxI55kY8ebKvADCF1TnQ+13eYg3X8ykzandtXchVRlQ7w
	 WLY7c1ndb1wSA==
Date: Wed, 14 May 2025 09:51:08 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] phy: spacemit: support K1 USB2.0 PHY controller
Message-ID: <aCRZfOQS0JTWKUdX@vaman>
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
 <20250418-b4-k1-usb3-phy-v2-v2-3-b69e02da84eb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-b4-k1-usb3-phy-v2-v2-3-b69e02da84eb@whut.edu.cn>

Hi,

On 18-04-25, 21:19, Ze Huang wrote:
> Add support for SpacemiT K1 USB2.0 PHY.

Can you please add more details of this device, which SoC is this, and
what are the capablities of this phy

> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  drivers/phy/Kconfig                |   1 +
>  drivers/phy/Makefile               |   1 +
>  drivers/phy/spacemit/Kconfig       |  13 ++++
>  drivers/phy/spacemit/Makefile      |   2 +
>  drivers/phy/spacemit/phy-k1-usb2.c | 131 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 148 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 8d58efe998ec5fd50054eed2c90d6ecce6bd5dd8..fca589aa7926eb5bce14e99785cf32cf0395202e 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -114,6 +114,7 @@ source "drivers/phy/renesas/Kconfig"
>  source "drivers/phy/rockchip/Kconfig"
>  source "drivers/phy/samsung/Kconfig"
>  source "drivers/phy/socionext/Kconfig"
> +source "drivers/phy/spacemit/Kconfig"
>  source "drivers/phy/st/Kconfig"
>  source "drivers/phy/starfive/Kconfig"
>  source "drivers/phy/sunplus/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index e281442acc752820fe0bd638dfe38986a37c2a78..05993ff8a15daf7e2583b5f9b9b37ac584a30609 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -34,6 +34,7 @@ obj-y					+= allwinner/	\
>  					   rockchip/	\
>  					   samsung/	\
>  					   socionext/	\
> +					   spacemit/	\
>  					   st/		\
>  					   starfive/	\
>  					   sunplus/	\
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..0136aee2e8a2f5f484da136b26f80130794b992c
> --- /dev/null
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for SpacemiT platforms
> +#
> +config PHY_SPACEMIT_K1_USB2
> +	tristate "SpacemiT K1 USB 2.0 PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	depends on USB_COMMON
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
> +	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fec0b425a948541b39b814caef0b05e1e002d92f
> --- /dev/null
> +++ b/drivers/phy/spacemit/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4a5684f3185f61f9d865b0fb52644bb280756d00
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 USB 2.0 PHY driver
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/of.h>
> +
> +#define USB2_PHY_REG01			0x04
> +#define  USB2_PHY_REG01_VAL		0x60ef
> +#define  USB2_PHY_REG01_PLL_IS_READY	BIT(0)
> +#define USB2_PHY_REG04			0x10
> +#define  USB2_PHY_REG04_AUTO_CLEAR_DIS	BIT(2)
> +#define USB2_PHY_REG0D			0x34
> +#define  USB2_PHY_REG0D_VAL		0x1c
> +#define USB2_PHY_REG26			0x98
> +#define  USB2_PHY_REG26_VAL		0xbec4

What are these values referred to, why are you defining fixed values for
driver to use and not set the register bits?
> +
> +#define USB2D_CTRL_RESET_TIME_MS	50
> +
> +struct spacemit_usb2phy {
> +	struct phy	*phy;
> +	struct clk	*clk;
> +	void __iomem	*base;
> +};
> +
> +static int spacemit_usb2phy_init(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +	void __iomem *base = sphy->base;
> +	u32 val;
> +	int ret;
> +
> +	ret = clk_prepare_enable(sphy->clk);
> +	if (ret) {
> +		dev_err(&phy->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * make sure the usb controller is not under reset process before
> +	 * any configuration
> +	 */
> +	usleep_range(150, 200);
> +	writel(USB2_PHY_REG26_VAL, base + USB2_PHY_REG26); /* 24M ref clk */
> +
> +	ret = read_poll_timeout(readl, val, (val & USB2_PHY_REG01_PLL_IS_READY),
> +				500, USB2D_CTRL_RESET_TIME_MS * 1000, true,
> +				base + USB2_PHY_REG01);
> +	if (ret) {
> +		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
> +		return ret;
> +	}
> +
> +	/* release usb2 phy internal reset and enable clock gating */
> +	writel(USB2_PHY_REG01_VAL, base + USB2_PHY_REG01);
> +	writel(USB2_PHY_REG0D_VAL, base + USB2_PHY_REG0D);
> +
> +	/* auto clear host disc */
> +	val = readl(base + USB2_PHY_REG04);
> +	val |= USB2_PHY_REG04_AUTO_CLEAR_DIS;
> +	writel(val, base + USB2_PHY_REG04);
> +
> +	return 0;
> +}
> +
> +static int spacemit_usb2phy_exit(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(sphy->clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_usb2phy *sphy;
> +
> +	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> +	if (!sphy)
> +		return -ENOMEM;
> +
> +	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(sphy->clk))
> +		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> +
> +	sphy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sphy->base))
> +		return PTR_ERR(sphy->base);
> +
> +	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	if (IS_ERR(sphy->phy))
> +		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
> +
> +	phy_set_drvdata(sphy->phy, sphy);
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> +	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ /* sentinal */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> +
> +static struct platform_driver spacemit_usb2_phy_driver = {
> +	.probe	= spacemit_usb2phy_probe,
> +	.driver = {
> +		.name   = "spacemit-usb2-phy",
> +		.of_match_table = spacemit_usb2phy_dt_match,
> +	},
> +};
> +module_platform_driver(spacemit_usb2_phy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.49.0
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
~Vinod
