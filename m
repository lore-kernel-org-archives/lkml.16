Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2970814;
	Thu, 22 May 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905733; cv=none; b=WejBbLysCIh2ISyZFOp+SQNKFKUKJcdcu8RZvJt6IICQMKVXosIzA9iphiMQQ/iDvf/+MtJKuhaUZ4M05lySk1orSyAVzDOkDnuuhc04ma3bRmXj8FfvEbspv7rAkl8H95ylr69vtx78itUHqsrLnP58AtzxNkRNdVd1mbdZec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905733; c=relaxed/simple;
	bh=i8dCkvq7F3CC+MwXu1caXMU8e1Ced2QXY+V/762C0us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUAM7SPtAUIRWYipnwtICeLpar9DMWG8CrYVglxJLKgNNW9nnTFfEmQx7i/qWzi6mTq0ZTPAA9sg+EkVyI7l2E3UYmOsjydMf2lZBFEyUjvRltvNiYTzSNHRvL9I3EppUYcE9LAshMZupec53XdCiwXdFsUxuX1iT0vb4jB4gIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvf8sQ3Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvf8sQ3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1F6C4CEE4;
	Thu, 22 May 2025 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747905732;
	bh=i8dCkvq7F3CC+MwXu1caXMU8e1Ced2QXY+V/762C0us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvf8sQ3QJCgeX1omXxuD4whjqsxDfAtoPBsLnnHsxiciXqFCLODHbd7H+dngc9K6p
	 0REgwotVacoRiUR+qkzBnjCWynYenu62Y/bVHjjVXSdjTyoxBLg750KAVPAk3XGbWr
	 wPDViXnVo7AqhTn6Rh6pcjEZK1hdPtMJHlQ7Hi8ajnHz4YPAes6CGCZl8BYH5HCrJ7
	 OZTusff9JIQxpiAX95Iucp8QOTzER+moZvZSfyULP7MZP/6+tys+QFxoLpPNH6Ngz/
	 J915U6eA55BJDa/pQwgRbxReXH4oUigHs/4kggxWZKfedz02hfybU/fwy1hIWTvGzu
	 +u2CiaPUXviPQ==
Date: Thu, 22 May 2025 10:22:08 +0100
From: Lee Jones <lee@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v2 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core
 driver
Message-ID: <20250522092208.GB1199143@google.com>
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
 <778675bfe1040cd1bf4d281dc5c5f20edc4145c1.1747276047.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <778675bfe1040cd1bf4d281dc5c5f20edc4145c1.1747276047.git.zhoubinbin@loongson.cn>

Just "core driver" in the subject line, rather than "MFD core driver".

> The Loongson-2K Board Management Controller provides an PCIe
> interface to the host to access the feature implemented in the BMC.
> 
> The BMC is assembled on a server similar to the server machine with
> Loongson-3C6000 CPUs. It supports multiple sub-devices like DRM.
> 
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mfd/Kconfig       |  13 ++++
>  drivers/mfd/Makefile      |   2 +
>  drivers/mfd/ls2kbmc-mfd.c | 156 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 171 insertions(+)
>  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 22b936310039..04e40085441d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2422,5 +2422,18 @@ config MFD_UPBOARD_FPGA
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called upboard-fpga.
>  
> +config MFD_LS2K_BMC
> +	tristate "Loongson-2K Board Management Controller Support"
> +	depends on LOONGARCH
> +	default y if LOONGARCH
> +	select MFD_CORE
> +	help
> +	  Say yes here to add support for the Loongson-2K BMC
> +	  which is a Board Management Controller connected to the PCIe bus.
> +	  The device supports multiple sub-devices like DRM.
> +	  This driver provides common support for accessing the devices;
> +	  additional drivers must be enabled in order to use the
> +	  functionality of the BMC device.

This paragraph has some odd line breaks.  Please re-align.

>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 948cbdf42a18..18960ea13b64 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -290,3 +290,5 @@ obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
>  obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
> +
> +obj-$(CONFIG_MFD_LS2K_BMC)	+= ls2kbmc-mfd.o
> diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> new file mode 100644
> index 000000000000..b309f6132c24
> --- /dev/null
> +++ b/drivers/mfd/ls2kbmc-mfd.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson-2K Board Management Controller (BMC) MFD Core Driver.

Remove the MFD part.  It's not a thing - we made it up.

> + * Copyright (C) 2024 Loongson Technology Corporation Limited.

No changes since 2024?

> + *
> + * Originally written by Chong Qiao <qiaochong@loongson.cn>
> + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>

"Mainline"

Typically we just do:

Authors:
	Author One <one@corp.com>
	Author Two <two@corp.com>

> + */
> +
> +#include <linux/aperture.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/pci_ids.h>
> +#include <linux/platform_data/simplefb.h>
> +#include <linux/platform_device.h>
> +
> +#define LS2K_DISPLAY_RES_START (SZ_16M + SZ_2M)
> +#define LS2K_IPMI_RES_SIZE	0x1c
> +#define LS2K_IPMI0_RES_START	(SZ_16M + 0xf00000)
> +#define LS2K_IPMI1_RES_START	(LS2K_IPMI0_RES_START + LS2K_IPMI_RES_SIZE)
> +#define LS2K_IPMI2_RES_START	(LS2K_IPMI1_RES_START + LS2K_IPMI_RES_SIZE)
> +#define LS2K_IPMI3_RES_START	(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
> +#define LS2K_IPMI4_RES_START	(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)

Line them _all_ up please.  One more tab should do it.

> +static struct resource ls2k_display_resources[] = {
> +	DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-res"),
> +};
> +
> +static struct resource ls2k_ipmi0_resources[] = {
> +	DEFINE_RES_MEM_NAMED(LS2K_IPMI0_RES_START, LS2K_IPMI_RES_SIZE, "ipmi0-res"),
> +};
> +
> +static struct resource ls2k_ipmi1_resources[] = {
> +	DEFINE_RES_MEM_NAMED(LS2K_IPMI1_RES_START, LS2K_IPMI_RES_SIZE, "ipmi1-res"),
> +};
> +
> +static struct resource ls2k_ipmi2_resources[] = {
> +	DEFINE_RES_MEM_NAMED(LS2K_IPMI2_RES_START, LS2K_IPMI_RES_SIZE, "ipmi2-res"),
> +};
> +
> +static struct resource ls2k_ipmi3_resources[] = {
> +	DEFINE_RES_MEM_NAMED(LS2K_IPMI3_RES_START, LS2K_IPMI_RES_SIZE, "ipmi3-res"),
> +};
> +
> +static struct resource ls2k_ipmi4_resources[] = {
> +	DEFINE_RES_MEM_NAMED(LS2K_IPMI4_RES_START, LS2K_IPMI_RES_SIZE, "ipmi4-res"),
> +};
> +
> +static struct mfd_cell ls2k_bmc_cells[] = {
> +	MFD_CELL_RES("simple-framebuffer", ls2k_display_resources),
> +	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi0_resources),
> +	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi1_resources),
> +	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi2_resources),
> +	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi3_resources),
> +	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
> +};
> +
> +/*
> + * Currently the Loongson-2K0500 BMC hardware does not have an i2c interface to

I2C

> + * adapt to the resolution.

Remove the line break here.

> + * We set the resolution by presetting "video=1280x1024-16@2M" to the bmc memory.

BMC

> + */
> +static int ls2k_bmc_get_video_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
> +{
> +	char *mode;
> +	int depth, ret;
> +
> +	/* The pci mem bar last 16M is used to store the string. */

PCI

BAR's (maybe?)

> +	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	/* env at last 16M's beginning, first env is "video=" */

This doesn't make sense to me - please reword.

> +	if (!strncmp(mode, "video=", 6))
> +		mode = mode + 6;
> +
> +	ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
> +	if (ret)
> +		return ret;
> +
> +	pd->stride = pd->width * depth / 8;
> +	pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
> +
> +	return 0;
> +}

Surely there is a standard format / API for this already?



> +static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
> +{
> +	int ret = 0;

There is no need to pre-initialise this.

> +	resource_size_t base;
> +	struct simplefb_platform_data pd;

Reverse these please (reverse Christmas tree is preferred).
> +
> +	ret = pci_enable_device(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ls2k_bmc_get_video_mode(dev, &pd);
> +	if (ret)
> +		goto disable_pci;
> +
> +	ls2k_bmc_cells[0].platform_data = &pd;
> +	ls2k_bmc_cells[0].pdata_size = sizeof(pd);
> +	base = dev->resource[0].start + LS2K_DISPLAY_RES_START;
> +
> +	/* Remove conflicting efifb device */
> +	ret = aperture_remove_conflicting_devices(base, SZ_4M, "simple-framebuffer");
> +	if (ret) {
> +		dev_err(&dev->dev, "Remove firmware framebuffers failed: %d\n", ret);

"Failed to removed firmware framebuffers"

> +		goto disable_pci;
> +	}
> +
> +	return devm_mfd_add_devices(&dev->dev, PLATFORM_DEVID_AUTO,
> +				    ls2k_bmc_cells, ARRAY_SIZE(ls2k_bmc_cells),
> +				    &dev->resource[0], 0, NULL);
> +
> +disable_pci:
> +	pci_disable_device(dev);
> +	return ret;
> +}
> +
> +static void ls2k_bmc_remove(struct pci_dev *dev)
> +{
> +	pci_disable_device(dev);
> +}
> +
> +static struct pci_device_id ls2k_bmc_devices[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> +
> +static struct pci_driver ls2k_bmc_driver = {
> +	.name = "ls2k-bmc",
> +	.id_table = ls2k_bmc_devices,
> +	.probe = ls2k_bmc_probe,
> +	.remove = ls2k_bmc_remove,
> +};
> +

Remove this line.

> +module_pci_driver(ls2k_bmc_driver);
> +
> +MODULE_DESCRIPTION("Loongson-2K BMC driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.1
> 

-- 
Lee Jones [李琼斯]
