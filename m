Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444E5145329;
	Wed, 14 May 2025 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212804; cv=none; b=NsgfiYLflP0qvXSNmOacfT4WDJQEeDsamhFZqQ+f6/zi/2lqdpKqbfGHdUCVf81EgNfks1/emq4qxKAeVrzVoP+ri+ZVvbHT4rg5ARk+K9hA26xUWezCL0GLIvRcL2Tla4HCcUmlmLw3LuejWOogdouYZby2T471njwcSWSA4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212804; c=relaxed/simple;
	bh=q++puNXp1cf6l7PFPPbpGdYzBcOZqke20tD19wRnI5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bzmdq14vq8XCHp9pda8AFaPHFHZ6DYJ51438infhoTWRL9H8PPTzE0/Paj6vFYEaXkNJ+r7fpGDQk7VKo+ovTgQbOdsecjPar9TkQZUhnK+jI8PC5BLArMBR2k1FV8AK9hCa8uSOt5KeZo85Kc9EsjN8SpSXEZiiSfNd1xk6NT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrTGZcyK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrTGZcyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFF4C4CEE9;
	Wed, 14 May 2025 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212803;
	bh=q++puNXp1cf6l7PFPPbpGdYzBcOZqke20tD19wRnI5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrTGZcyKY4r6SYohKRWTUgvFZdJxBgv8VlnwdiXzsjhFS38l4gy4/CG4XjvOItlAp
	 N46EfEbklsN6gdpD+76ceG6CPo2x1SKjqSX8/zfltEd8mcMxzO0/zFJnjDavrrQ5Os
	 i5Fq9nQAA5EdNXbRkQRZ35/KtPLxeUjMw0o1rQVdmXFb9OUZT73v0cUQo8hEJLLxM1
	 am03BsVB5Nyb0W4CzU8hcHlc8jWT+d1saNate8xHrVoYiIe8EGXqn3Yb2k8O5wbjw6
	 Ep7h5jvP9IRARWD5bP+4o8IP96Rn2jNdHMFQNAO6zOsYdzZPsvXxH6Z6hY0QpAA8J3
	 lPGJeJogMQdgA==
Date: Wed, 14 May 2025 09:53:20 +0100
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
Subject: Re: [PATCH v2 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
Message-ID: <aCRaAEJSphC7uWY0@vaman>
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
 <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>

On 18-04-25, 21:19, Ze Huang wrote:
> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
> only USB mode is supported; PCIe support is not included in this change.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  drivers/phy/spacemit/Kconfig          |   8 ++
>  drivers/phy/spacemit/Makefile         |   1 +
>  drivers/phy/spacemit/phy-k1-combphy.c | 251 ++++++++++++++++++++++++++++++++++
>  3 files changed, 260 insertions(+)
> 
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> index 0136aee2e8a2f5f484da136b26f80130794b992c..ccc6bf9ea49f4988a27f79a4dcd024b18cbd78b0 100644
> --- a/drivers/phy/spacemit/Kconfig
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -11,3 +11,11 @@ config PHY_SPACEMIT_K1_USB2
>  	help
>  	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
>  	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> +
> +config PHY_SPACEMIT_K1_COMBPHY
> +	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	help
> +	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> index fec0b425a948541b39b814caef0b05e1e002d92f..1fd0c65f2c5cd10ea2f70e43e62c70588d1ffae9 100644
> --- a/drivers/phy/spacemit/Makefile
> +++ b/drivers/phy/spacemit/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_COMBPHY)	+= phy-k1-combphy.o
>  obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit/phy-k1-combphy.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a291b7a78fae2f4072b74c1d2cc65847ed821bec
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-combphy.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 PCIE/USB3 PHY driver
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/usb/of.h>
> +
> +#define COMBPHY_USB_REG1		0x68
> +#define  COMBPHY_USB_REG1_VAL		0x00
> +#define COMBPHY_USB_REG2		0x48
> +#define  COMBPHY_USB_REG2_VAL		0x603a2276
> +#define COMBPHY_USB_REG3		0x08
> +#define  COMBPHY_USB_REG3_VAL		0x97c
> +#define COMBPHY_USB_REG4		0x18
> +#define  COMBPHY_USB_REG4_VAL		0x00
> +#define  COMBPHY_USB_TERM_SHORT_MASK	0x3000
> +#define  COMBPHY_USB_TERM_SHORT_VAL	0x3000
> +#define COMBPHY_USB_PLL_REG		0x08
> +#define  COMBPHY_USB_PLL_MASK		0x01
> +#define  COMBPHY_USB_PLL_VAL		0x01
> +#define COMBPHY_USB_LFPS_REG		0x58
> +#define  COMBPHY_USB_LFPS_MASK		0x700
> +#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03

Same comment as other patch

> +
> +#define COMBPHY_MODE_SEL	BIT(3)
> +#define COMBPHY_WAIT_TIMEOUT	1000
> +
> +struct spacemit_combphy_priv {
> +	struct device *dev;
> +	struct phy *phy;
> +	struct reset_control *phy_rst;
> +	void __iomem *phy_ctrl;
> +	void __iomem *phy_sel;
> +	bool rx_always_on;
> +	u8 lfps_threshold;
> +	u8 type;
> +};
> +
> +static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl(reg + offset);
> +	tmp = (tmp & ~(mask)) | val;
> +	writel(tmp, reg + offset);
> +}
> +
> +static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
> +				       u32 offset, u32 mask, u32 val)
> +{
> +	u32 reg_val;
> +	int ret = 0;

Superfluous init, drop it pls

> +
> +	ret = read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
> +				1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
> +				priv->phy_ctrl + offset);
> +
> +	return ret;

why use local variable?

> +}
> +
> +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
> +{
> +	int ret = 0;
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
> +		break;
> +	default:
> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
> +{
> +	void __iomem *base = priv->phy_ctrl;
> +	int ret;
> +
> +	writel(COMBPHY_USB_REG1_VAL, base + COMBPHY_USB_REG1);
> +	writel(COMBPHY_USB_REG2_VAL, base + COMBPHY_USB_REG2);
> +	writel(COMBPHY_USB_REG3_VAL, base + COMBPHY_USB_REG3);
> +	writel(COMBPHY_USB_REG4_VAL, base + COMBPHY_USB_REG4);
> +
> +	ret = spacemit_combphy_wait_ready(priv, COMBPHY_USB_PLL_REG,
> +					  COMBPHY_USB_PLL_MASK,
> +					  COMBPHY_USB_PLL_VAL);
> +
> +	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
> +	spacemit_reg_update(base, COMBPHY_USB_LFPS_REG,
> +			    COMBPHY_USB_LFPS_MASK,
> +			    (priv->lfps_threshold << 8));
> +
> +	if (priv->rx_always_on)
> +		spacemit_reg_update(base, COMBPHY_USB_REG4,
> +				    COMBPHY_USB_TERM_SHORT_MASK,
> +				    COMBPHY_USB_TERM_SHORT_VAL);
> +
> +	if (ret)
> +		dev_err(priv->dev, "USB3 PHY init timeout!\n");
> +
> +	return ret;
> +}
> +
> +static int spacemit_combphy_init(struct phy *phy)
> +{
> +	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = spacemit_combphy_set_mode(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to set mode for PHY type %x\n",
> +			priv->type);
> +		goto out;
> +	}
> +
> +	ret = reset_control_deassert(priv->phy_rst);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to deassert rst\n");
> +		goto err_rst;
> +	}
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		ret = spacemit_combphy_init_usb(priv);
> +		break;
> +	default:
> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret)
> +		goto err_rst;
> +
> +	return 0;
> +
> +err_rst:
> +	reset_control_assert(priv->phy_rst);
> +out:
> +	return ret;
> +}
> +
> +static int spacemit_combphy_exit(struct phy *phy)
> +{
> +	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
> +
> +	reset_control_assert(priv->phy_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy *spacemit_combphy_xlate(struct device *dev,
> +					  const struct of_phandle_args *args)
> +{
> +	struct spacemit_combphy_priv *priv = dev_get_drvdata(dev);
> +
> +	if (args->args_count != 1) {
> +		dev_err(dev, "invalid number of arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (priv->type != PHY_NONE && priv->type != args->args[0])
> +		dev_warn(dev, "PHY type %d is selected to override %d\n",
> +			 args->args[0], priv->type);
> +
> +	priv->type = args->args[0];
> +
> +	if (args->args_count > 1)
> +		dev_dbg(dev, "combo phy idx: %d selected",  args->args[1]);
> +
> +	return priv->phy;
> +}
> +
> +static const struct phy_ops spacemit_combphy_ops = {
> +	.init = spacemit_combphy_init,
> +	.exit = spacemit_combphy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_combphy_probe(struct platform_device *pdev)
> +{
> +	struct spacemit_combphy_priv *priv;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->phy_ctrl = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +	if (IS_ERR(priv->phy_ctrl))
> +		return PTR_ERR(priv->phy_ctrl);
> +
> +	priv->phy_sel = devm_platform_ioremap_resource_byname(pdev, "sel");
> +	if (IS_ERR(priv->phy_sel))
> +		return PTR_ERR(priv->phy_sel);
> +
> +	priv->lfps_threshold = COMBPHY_USB_LFPS_THRES_DEFAULT;
> +	device_property_read_u8(&pdev->dev, "spacemit,lfps-threshold", &priv->lfps_threshold);
> +
> +	priv->rx_always_on = device_property_read_bool(&pdev->dev, "spacemit,rx-always-on");
> +	priv->type = PHY_NONE;
> +	priv->dev = dev;
> +
> +	priv->phy_rst = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(priv->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy_rst),
> +				     "failed to get phy reset\n");
> +
> +	priv->phy = devm_phy_create(dev, NULL, &spacemit_combphy_ops);
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create combphy\n");
> +
> +	dev_set_drvdata(dev, priv);
> +	phy_set_drvdata(priv->phy, priv);
> +	phy_provider = devm_of_phy_provider_register(dev, spacemit_combphy_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_combphy_of_match[] = {
> +	{ .compatible = "spacemit,k1-combphy", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
> +
> +static struct platform_driver spacemit_combphy_driver = {
> +	.probe	= spacemit_combphy_probe,
> +	.driver = {
> +		.name = "spacemit-k1-combphy",
> +		.of_match_table = spacemit_combphy_of_match,
> +	},
> +};
> +module_platform_driver(spacemit_combphy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
> +MODULE_LICENSE("GPL");

Could this be single driver with different init register sequences?

> 
> -- 
> 2.49.0

-- 
~Vinod
