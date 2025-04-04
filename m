Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF51BEF87;
	Fri,  4 Apr 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765067; cv=none; b=rHV7KXyvCGn0QWrfLl6Jhhv8xRjKL/BpteqDApv5qYUKZ3nhBdQ59jXDBLhdf/rEaY6myq28tNCrDcddTfT7uS1t/0vya0ZMLA8Xcu+hIgSxW0djgdZ5mIM7L+utJvYf+I8oxiCJnUEQymQ1pipxqpHjy0VCwscvM2sTWQXVsRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765067; c=relaxed/simple;
	bh=PxW9C9uE2sPn+4J3bcvgkKgFGQt0vPUOZGSNVIJBhW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTbz0bGdz1Hlo5jN/Qr+ajWLhOnhdZ1SXvgcTXJkbgIuiPIaoye+fdYEO6sWvfUBiUcgLhIh6/Hq/qR05BeAerS9xAuq5pDPs1MbxL2/xGhdFuGcOXK0DUzg1rPbN6GiP1MVWeScxyhgYy9Ka2SzWttxtNjLN8czis23g9axT30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIGPRwcg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIGPRwcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEDEC4CEDD;
	Fri,  4 Apr 2025 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743765066;
	bh=PxW9C9uE2sPn+4J3bcvgkKgFGQt0vPUOZGSNVIJBhW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIGPRwcgNe+LrpmucRUeB6TYyfDmOz4zcF22kG1wiCAB2TN0wSlTet7gWXtbvEUHn
	 OcgwRKO3f7e8yxYG52oo+CES6+qfbKq9C2T/Vnk0Qzuv9p1QQhpyKuzHLPc6qSEbNX
	 aX0VuYPEf53boA40M1uDh1TgGlpevRp/LH4lxqdmMgqWP4E4bLUgFM39z+aQprf9rE
	 HWS44gbSipCCMkdj5mTaiV0fiS2hL8CyVy1wIujogU/TDhRliGhgO7rZ3wZfj3620g
	 ojYKfzKlqBCq1L2SbghpU4s+z7KgYHlwZr7dHx475APcyleKPcyvAxih3r7arSaWbq
	 dLw9Xusgebqkg==
Date: Fri, 4 Apr 2025 13:11:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 2/2] memory/mediatek: Add an interface to get current
 DDR data rate
Message-ID: <20250404-soft-pumpkin-bettong-09abfc@shite>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-3-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403065030.22761-3-crystal.guo@mediatek.com>


Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

memory: mediatek:

On Thu, Apr 03, 2025 at 02:48:48PM GMT, Crystal Guo wrote:
> Add MediaTek DRAMC driver to provide an interface that can
> obtain current DDR data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  drivers/memory/Kconfig              |   1 +
>  drivers/memory/Makefile             |   1 +
>  drivers/memory/mediatek/Kconfig     |  20 +++
>  drivers/memory/mediatek/Makefile    |   2 +
>  drivers/memory/mediatek/mtk-dramc.c | 223 ++++++++++++++++++++++++++++
>  5 files changed, 247 insertions(+)
>  create mode 100644 drivers/memory/mediatek/Kconfig
>  create mode 100644 drivers/memory/mediatek/Makefile
>  create mode 100644 drivers/memory/mediatek/mtk-dramc.c
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index c82d8d8a16ea..b1698549ff81 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -227,5 +227,6 @@ config STM32_FMC2_EBI
>  
>  source "drivers/memory/samsung/Kconfig"
>  source "drivers/memory/tegra/Kconfig"
> +source "drivers/memory/mediatek/Kconfig"

m goes before s, so this goes before samsung source.

>  
>  endif
> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index d2e6ca9abbe0..c0facf529803 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
>  
>  obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
>  obj-$(CONFIG_TEGRA_MC)		+= tegra/
> +obj-$(CONFIG_MEDIATEK_MC)	+= mediatek/
>  obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
>  obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
>  
> diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
> new file mode 100644
> index 000000000000..eadc11ec0f1c
> --- /dev/null
> +++ b/drivers/memory/mediatek/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config MEDIATEK_MC
> +	bool "MediaTek Memory Controller support"
> +	default y

Why this has to be enabled for every compile test build? Look how other
platforms do it.

I'll fix the tegra.


> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  This option allows to enable MediaTek memory controller drivers,
> +	  which may include controllers for DRAM or others.
> +
> +if MEDIATEK_MC
> +
> +config MTK_DRAMC
> +	tristate "MediaTek DRAMC driver"
> +	default y

This matters less, could stay or could be also ARCH_MDIATEK.

> +	help
> +	  This driver is for the DRAM Controller found in MediaTek SoCs
> +	  and provides a sysfs interface for reporting the current DRAM
> +	  data rate.
> +
> +endif

...

> +
> +static unsigned int read_reg_field(void __iomem *base, unsigned int offset, unsigned int mask)
> +{
> +	unsigned int val = readl(base + offset);
> +	unsigned int shift = __ffs(mask);
> +
> +	return (val & mask) >> shift;
> +}
> +
> +static int mtk_dramc_probe(struct platform_device *pdev)

Weird ordering. probe() is one of the last functions. Only other driver
struct functions (like remove, suspend/resume) go after, not some
regular code.

> +{
> +	struct mtk_dramc *dramc;
> +	const struct mtk_dramc_pdata *pdata;
> +
> +	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc), GFP_KERNEL);
> +	if (!dramc)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
> +
> +	pdata = of_device_get_match_data(&pdev->dev);
> +	if (!pdata)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "No platform data available\n");

Just return. That's impossible condition, so no need for printing errors.

> +
> +	dramc->pdata = pdata;

Why do you need pdata variable in the first place? Make this code
simple, not complicated.

> +
> +	dramc->anaphy_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dramc->anaphy_base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->anaphy_base),
> +				     "Unable to map ANAPHY base\n");
> +
> +	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(dramc->ddrphy_base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->ddrphy_base),
> +				     "Unable to map DDRPHY base\n");
> +
> +	platform_set_drvdata(pdev, dramc);
> +	return 0;
> +}
> +
> +static unsigned int mtk_fmeter_v1(struct mtk_dramc *dramc)
> +{
> +	const struct mtk_dramc_pdata *pdata = dramc->pdata;
> +	unsigned int shu_level, pll_sel, offset;
> +	unsigned int sdmpcw, posdiv, clkdiv, fbksel, sopen, async_ca, ser_mode;
> +	unsigned int prediv_freq, posdiv_freq, vco_freq;
> +	unsigned int final_rate;
> +
> +	shu_level = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
> +				   pdata->masks[DRAMC_DPHY_DVFS_SHU_LV]);

Don't creat your own wrappers. Use existing FIELD_PREP stuff.

> +	pll_sel = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
> +				 pdata->masks[DRAMC_DPHY_DVFS_PLL_SEL]);
> +	offset = pdata->shuffle_offset * shu_level;
> +
> +	sdmpcw = read_reg_field(dramc->anaphy_base,
> +				((pll_sel == 0) ?
> +				pdata->regs[DRAMC_APHY_SHU_PHYPLL2] :
> +				pdata->regs[DRAMC_APHY_SHU_CLRPLL2]) + offset,
> +				pdata->masks[DRAMC_APHY_PLL2_SDMPCW]);
> +	posdiv = read_reg_field(dramc->anaphy_base,
> +				((pll_sel == 0) ?
> +				pdata->regs[DRAMC_APHY_SHU_PHYPLL3] :
> +				pdata->regs[DRAMC_APHY_SHU_CLRPLL3]) + offset,
> +				pdata->masks[DRAMC_APHY_PLL3_POSDIV]);
> +	fbksel = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_SHU_PHYPLL4] + offset,
> +				pdata->masks[DRAMC_APHY_PLL4_FBKSEL]);
> +	sopen = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_ARPI0] + offset,
> +			       pdata->masks[DRAMC_APHY_ARPI0_SOPEN]);
> +	async_ca = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_CA_ARDLL1] + offset,
> +				  pdata->masks[DRAMC_APHY_ARDLL1_CK_EN]);
> +	ser_mode = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_B0_TX0] + offset,
> +				  pdata->masks[DRAMC_APHY_B0_TX0_SER_MODE]);
> +
> +	clkdiv = (ser_mode == 1) ? 1 : 0;
> +	posdiv &= ~(pdata->posdiv_purify);
> +
> +	prediv_freq = pdata->ref_freq_mhz * (sdmpcw >> pdata->prediv);
> +	posdiv_freq = (prediv_freq >> posdiv) >> 1;
> +	vco_freq = posdiv_freq << fbksel;
> +	final_rate = vco_freq >> clkdiv;
> +
> +	if (sopen == 1 && async_ca == 1)
> +		final_rate >>= 1;
> +
> +	return final_rate;
> +}
> +
> +/**
> + * mtk_dramc_get_data_rate - Calculate the current DRAM data rate
> + * @dev: Device pointer
> + *
> + * Return: DRAM Data Rate in Mbps or negative number for error
> + */
> +static unsigned int mtk_dramc_get_data_rate(struct device *dev)
> +{
> +	struct mtk_dramc *dramc = dev_get_drvdata(dev);
> +
> +	if (dramc->pdata->fmeter_version == 1)

Drop, it's not possible to have other case.

> +		return mtk_fmeter_v1(dramc);
> +
> +	dev_err(dev, "Frequency meter version %u not supported\n", dramc->pdata->fmeter_version);
> +	return -EINVAL;
> +}
> +
> +static ssize_t dram_data_rate_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)

No ABI doc.

Why existing interconnect interface is not suitable here?  This should
be an interconnect, otherwise what is the point of this driver? What do
you exactly configure here?


> +{
> +	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %u\n",
> +			mtk_dramc_get_data_rate(dev));
> +}
> +
> +static DEVICE_ATTR_RO(dram_data_rate);
> +
> +static struct attribute *mtk_dramc_attrs[] = {
> +	&dev_attr_dram_data_rate.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(mtk_dramc);
> +
> +static const struct mtk_dramc_pdata dramc_pdata_mt8196 = {
> +	.fmeter_version = 1,
> +	.ref_freq_mhz = 26,
> +	.regs = mtk_dramc_regs_mt8196,
> +	.masks = mtk_dramc_masks_mt8196,
> +	.posdiv_purify = BIT(2),
> +	.prediv = 7,
> +	.shuffle_offset = 0x700,
> +};
> +
> +static const struct of_device_id mtk_dramc_of_ids[] = {
> +	{ .compatible = "mediatek,mt8196-dramc", .data = &dramc_pdata_mt8196 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
> +
> +static struct platform_driver mtk_dramc_driver = {
> +	.probe = mtk_dramc_probe,
> +	.driver = {
> +		.name = "mtk-dramc",
> +		.of_match_table = mtk_dramc_of_ids,
> +		.dev_groups = mtk_dramc_groups,
> +	},
> +};
> +module_platform_driver(mtk_dramc_driver);
> +
> +MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.18.0
> 
