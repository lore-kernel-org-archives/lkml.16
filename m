Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78B12E5B;
	Fri, 27 Jun 2025 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983389; cv=none; b=KKjZ3T/CorX6mUFicaaMEwp6MVe3xIgo4kneUlVoXZ+BrcDl/B43s81Wtx6/gFbkqhu1DE5RDqmAOBM0Iv/VXzBNEi+k52moNpnKJpyHCqGJZe6BTZcgP/fNkeKTRQ7DxTKLcDZGQ/z4YoDMGqupb92lb1vvXULgNR3V1N/8gFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983389; c=relaxed/simple;
	bh=Drbs52CyKM+EsOpE81VcTWNKkqjmlBxF8J1HXfdBQek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx6hmEPu+UBqijiFSz1RJuHEAmc7Z2GwNfBowoaiSYsc5Gs8iaJFHvR/UEYbKJSgCyr1qFH/zcTolFWRcJDNyrc+Fjc1/NlK285KX1saYeb2f8x2Qs9tqXJvGDeqvtUEy4kikvJ3U0iPY23zlJKLghJkQt8DTY1EeXD81+QjhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdd22rWu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdd22rWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4121FC4CEEB;
	Fri, 27 Jun 2025 00:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750983389;
	bh=Drbs52CyKM+EsOpE81VcTWNKkqjmlBxF8J1HXfdBQek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdd22rWuQTBh9UZwpcJ97lO61MCgnbk64wUJ0KWL/TfSmDcaBdS9qZjIUrQjytM6K
	 KDr3+4K15j9mE/fT0wt2TOWeFArxvTtcixOOmKojFhgNs+FZVq66IFrP0NwW6WcqDs
	 rvx3X5OcyWJR+WaPfS6RKKFebfGHosN7dVc87fCZ8clpT/4M8DLWKV/VHwqMUHjXWQ
	 ezvuSAzQxaLKq7W000Lgglvpci/UVjIBYoxWC7L7xSZOyBYO86UbZnZxiz2Q4PLAxz
	 Mqx9/5V/d3N/hye93jQpbShDpnxLaU9yMa4AQrVlqoQrQbg2kIVsTQBMHj67UE4xHr
	 8dgVn7h7iJQ9Q==
Date: Thu, 26 Jun 2025 17:16:28 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
Message-ID: <aF3i3L4BF6YgUMcO@vaman>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611081804.1196397-3-inochiama@gmail.com>

On 11-06-25, 16:18, Inochi Amaoto wrote:
> Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
> this driver does not support OTG mode as lack of document.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/phy/Kconfig                  |   1 +
>  drivers/phy/Makefile                 |   1 +
>  drivers/phy/sophgo/Kconfig           |  19 +++
>  drivers/phy/sophgo/Makefile          |   2 +
>  drivers/phy/sophgo/phy-cv1800-usb2.c | 222 +++++++++++++++++++++++++++
>  5 files changed, 245 insertions(+)
>  create mode 100644 drivers/phy/sophgo/Kconfig
>  create mode 100644 drivers/phy/sophgo/Makefile
>  create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 58c911e1b2d2..678dd0452f0a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -122,6 +122,7 @@ source "drivers/phy/renesas/Kconfig"
>  source "drivers/phy/rockchip/Kconfig"
>  source "drivers/phy/samsung/Kconfig"
>  source "drivers/phy/socionext/Kconfig"
> +source "drivers/phy/sophgo/Kconfig"
>  source "drivers/phy/st/Kconfig"
>  source "drivers/phy/starfive/Kconfig"
>  source "drivers/phy/sunplus/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c670a8dac468..bfb27fb5a494 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -35,6 +35,7 @@ obj-y					+= allwinner/	\
>  					   rockchip/	\
>  					   samsung/	\
>  					   socionext/	\
> +					   sophgo/	\
>  					   st/		\
>  					   starfive/	\
>  					   sunplus/	\
> diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
> new file mode 100644
> index 000000000000..2c943bbe1f81
> --- /dev/null
> +++ b/drivers/phy/sophgo/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Sophgo platforms
> +#
> +
> +if ARCH_SOPHGO || COMPILE_TEST
> +
> +config PHY_SOPHGO_CV1800_USB2
> +	tristate "Sophgo CV18XX/SG200X USB 2.0 PHY support"
> +	depends on MFD_SYSCON
> +	depends on USB_SUPPORT
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the USB 2.0 PHY used with
> +	  the DWC2 USB controller in Sophgo CV18XX/SG200X
> +	  series SoC.
> +	  If unsure, say N.
> +
> +endif # ARCH_SOPHGO || COMPILE_TEST
> diff --git a/drivers/phy/sophgo/Makefile b/drivers/phy/sophgo/Makefile
> new file mode 100644
> index 000000000000..318060661759
> --- /dev/null
> +++ b/drivers/phy/sophgo/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_SOPHGO_CV1800_USB2)	+= phy-cv1800-usb2.o
> diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
> new file mode 100644
> index 000000000000..1d21db7f875b
> --- /dev/null
> +++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#define REG_USB_PHY_CTRL		0x048
> +
> +#define PHY_ID_OVERWRITE_EN		BIT(6)
> +#define PHY_ID_OVERWRITE_MODE		BIT(7)
> +#define PHY_ID_OVERWRITE_MODE_HOST	FIELD_PREP(BIT(7), 0)
> +#define PHY_ID_OVERWRITE_MODE_DEVICE	FIELD_PREP(BIT(7), 1)
> +
> +#define PHY_APP_CLK_RATE		125000000
> +#define PHY_LPM_CLK_RATE		12000000
> +#define PHY_STB_CLK_RATE		333334
> +
> +struct cv1800_usb_phy {
> +	struct phy	*phy;
> +	struct regmap	*syscon;
> +	spinlock_t	lock;
> +	struct clk	*usb_app_clk;
> +	struct clk	*usb_lpm_clk;
> +	struct clk	*usb_stb_clk;
> +	bool		support_otg;
> +};
> +
> +static int cv1800_usb_phy_set_mode(struct phy *_phy,
> +				   enum phy_mode mode, int submode)
> +{
> +	struct cv1800_usb_phy *phy = phy_get_drvdata(_phy);
> +	unsigned int regval = 0;
> +	int ret;
> +
> +	switch (mode) {
> +	case PHY_MODE_USB_DEVICE:
> +		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
> +		break;
> +	case PHY_MODE_USB_HOST:
> +		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
> +		break;
> +	case PHY_MODE_USB_OTG:
> +		if (!phy->support_otg)
> +			return 0;
> +
> +		ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
> +		if (ret)
> +			return ret;
> +
> +		regval = FIELD_GET(PHY_ID_OVERWRITE_MODE, regval);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
> +				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE,
> +				  regval);
> +}
> +
> +static ssize_t dr_mode_write(struct file *file, const char __user *_buf,
> +			     size_t count, loff_t *ppos)
> +{
> +	struct seq_file *seq = file->private_data;
> +	struct cv1800_usb_phy *phy = seq->private;
> +	enum phy_mode mode;
> +	char buf[16];
> +
> +	if (copy_from_user(&buf, _buf, min_t(size_t, sizeof(buf) - 1, count)))
> +		return -EFAULT;
> +
> +	if (sysfs_streq(buf, "host"))
> +		mode = PHY_MODE_USB_DEVICE;
> +	else if (sysfs_streq(buf, "peripheral"))
> +		mode = PHY_MODE_USB_DEVICE;
> +	else if (sysfs_streq(buf, "otg"))
> +		mode = PHY_MODE_USB_OTG;
> +	else
> +		return -EINVAL;
> +
> +	return cv1800_usb_phy_set_mode(phy->phy, mode, 0);
> +}
> +
> +static int dr_mode_show(struct seq_file *seq, void *v)
> +{
> +	struct cv1800_usb_phy *phy = seq->private;
> +	unsigned long flags;
> +	unsigned int regval;
> +	bool is_host = true;
> +	int ret;
> +
> +	spin_lock_irqsave(&phy->lock, flags);
> +	ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
> +	spin_unlock_irqrestore(&phy->lock, flags);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (regval & PHY_ID_OVERWRITE_MODE)
> +		is_host = false;
> +
> +	if (!(regval & PHY_ID_OVERWRITE_EN))
> +		seq_puts(seq, "otg: ");
> +
> +	seq_puts(seq, is_host ? "host\n" : "peripheral\n");
> +
> +	return 0;
> +}

This should be done by host controller and not phy and then use apis to
set the mode for phy from controller, pls see other driver on how they
do this

> +
> +DEFINE_SHOW_STORE_ATTRIBUTE(dr_mode);
> +
> +static int cv1800_usb_phy_set_clock(struct cv1800_usb_phy *phy)
> +{
> +	int ret;
> +
> +	ret = clk_set_rate(phy->usb_app_clk, PHY_APP_CLK_RATE);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_set_rate(phy->usb_lpm_clk, PHY_LPM_CLK_RATE);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_set_rate(phy->usb_stb_clk, PHY_STB_CLK_RATE);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Should this not be return ret here? or just do return clk_set_rate()
here


> +}
> +
> +static const struct phy_ops cv1800_usb_phy_ops = {
> +	.set_mode	= cv1800_usb_phy_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int cv1800_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *parent = dev->parent;
> +	struct cv1800_usb_phy *phy;
> +	struct phy_provider *phy_provider;
> +	int ret;
> +
> +	if (!parent)
> +		return -ENODEV;
> +
> +	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	phy->syscon = syscon_node_to_regmap(parent->of_node);
> +	if (IS_ERR_OR_NULL(phy->syscon))
> +		return -ENODEV;
> +
> +	phy->support_otg = false;
> +
> +	spin_lock_init(&phy->lock);
> +
> +	phy->usb_app_clk = devm_clk_get_enabled(dev, "app");
> +	if (IS_ERR(phy->usb_app_clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->usb_app_clk),
> +			"Failed to get app clock\n");
> +
> +	phy->usb_lpm_clk = devm_clk_get_enabled(dev, "lpm");
> +	if (IS_ERR(phy->usb_lpm_clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->usb_lpm_clk),
> +			"Failed to get lpm clock\n");
> +
> +	phy->usb_stb_clk = devm_clk_get_enabled(dev, "stb");
> +	if (IS_ERR(phy->usb_stb_clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->usb_stb_clk),
> +			"Failed to get stb clock\n");
> +
> +	phy->phy = devm_phy_create(dev, NULL, &cv1800_usb_phy_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +			"Failed to create phy\n");
> +
> +	ret = cv1800_usb_phy_set_clock(phy);
> +	if (ret)
> +		return ret;
> +
> +	debugfs_create_file("dr_mode", 0644, phy->phy->debugfs,
> +			    phy, &dr_mode_fops);
> +
> +	phy_set_drvdata(phy->phy, phy);
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id cv1800_usb_phy_ids[] = {
> +	{ .compatible = "sophgo,cv1800b-usb2-phy" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_usb_phy_ids);
> +
> +static struct platform_driver cv1800_usb_phy_driver = {
> +	.probe = cv1800_usb_phy_probe,
> +	.driver = {
> +		.name = "cv1800-usb2-phy",
> +		.of_match_table = cv1800_usb_phy_ids,
> +	 },
> +};
> +module_platform_driver(cv1800_usb_phy_driver);
> +
> +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
> +MODULE_DESCRIPTION("CV1800/SG2000 SoC USB 2.0 PHY driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.49.0

-- 
~Vinod
