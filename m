Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C2220687
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445214; cv=none; b=ZKB9K1Vyt12UwFzc4OzfxkoJ2B7DfJzB3SuHL1xi7RWiVQUin86wcP3HWyCTV8cfJ2wR6evioG9uwFcgTNL/UcRLpjK4RZnYb37FcXLARQLMxERSILIcGgb/joWWC85FkG8wIsHFLMGsk6KgfjKz97F6TQUfOwxpG0Di+fLmOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445214; c=relaxed/simple;
	bh=d/GlD2KP1uZD+1yoFhPJcFL2TMCqvOPZQ9p8ZBOmw+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWQ8moOI+HmyuoKB+d7ThEaxUzJ4bwKul5uFq+7p61xtxh71v/50tK+RGcxvMNQUuUzQ1JgaBHkf+Jqc5tAdyLMXadQLVRc2UeprWbvsBZ8a2ACY1ROFc3yl/+uvgqWSMm4pfqDaJxQ70xp4gBxZISMt0UFOPF4TmY9nzAd1dpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=y96jXFFa; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="y96jXFFa"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2eb5cbe41e1so1315487fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1750445212; x=1751050012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8NHYIJCrgO6+UfKO/xAGNidF0eDJbqLbRizmGJ3qXI=;
        b=y96jXFFaiIEOrDspEKhUGxTaQDDZOwiIr/ChcftT+A/mPY1dMuH6RGjSalToyZP5Tc
         Kp2ffpiQU7FwykNqviwoy66PVlZmoqflWZSUxjhS8tZs4/u81OeDX9Nj6cIB7r9MxwMK
         +IXH1mR5rkl6mMB4u54nidHOhyyI2ZC2W7Gou5x4BS21rTG4MZ268FIykfN4mEa12N1c
         j3lDmmX88HOYIB3lKPeiszx1I28WpUcveEkPuKUsfhn598WofyWplUkug7mBsJhK4O3H
         OXp3pOeLsmiXhwafam+Zqguc/jUEuDxjmWjXBWb1clT2X0pSfqRU0bpk7BZgt52RSlXN
         h+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750445212; x=1751050012;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8NHYIJCrgO6+UfKO/xAGNidF0eDJbqLbRizmGJ3qXI=;
        b=EvH822pmlW0fEc7+Pfirk31r9BDuRMJgtKM8NDW94ShBXNjdFM4eotei4YnsghBa0g
         rGVnoeFhEWOUAGY/xHbfFdlwKYaEEWIwKdK7qtjpL4SD582Kra3TBWECFyc2oemOyjD0
         QWCCBpN9YW+YtaNaFKtPyRt+Dt/VFElgSdyrGQd88Hq8s5Zt0IytLf8fNB3DoXIlCZDg
         yZ5MwPoqocL2Yac1PYIcUKIVl/DmNhxHsho25esG4DaByHR6Uj+20II4xV171JvLa+pP
         ezUJZGKsmxuZN1xd4F6WB+Q6ZCXTDnOlklVkw8Cji1bXl4a+2gqveD6FhoMxkoKMTH0z
         KU8w==
X-Forwarded-Encrypted: i=1; AJvYcCXjiXFBxfr1BTDi/FiZARVE0J1SfelBYnkBBxN2QWQYv1CWJl53erEaCZ10pZVNvsyMZuwgc824kVgy/Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhjvvcEEj631nkv6FHyGDbt4dG8Wutj+jcYrb2k1+1ptkfOf8
	Xu5ZNf65DUVTUnNPxheMzy+SDCpuVjb/bYKwxieEj9cTWpC1pMCaiL5V9nJHviKa4fQ=
X-Gm-Gg: ASbGncs77/32DGQW+9OEHBl+uCJYOh0d7sfpqYlLpeECQ9CdnFM/zR/9SUWulwId9ri
	o4Qf2MVY+mkHrrAH1skOxcwpxSlEaJ78E5S4VwCvcc9woEpfao1fO0nzKWYCfVCvGhpBf+xIoyj
	a1x8QltAnO0BW6Uf7ezo3iFOg2AbbQOjkrYEUl+I3kXyDvc3jQV5T18gu+83ihP5+Zr05jBb3f0
	rK+1OC+CiK3ktaFm9gsN0mXPI4r1l4GtN7FaQEnBzKXrkN0sWjKU/htlaVucWmfaKEh0eFsg13h
	XteDl8H2JPe86ALyBmatMbIYxa3ngaVSOfIKHy2wh+Y21bmRyT6ok2bSNrRLivjWwZAf4xfDmZQ
	=
X-Google-Smtp-Source: AGHT+IGvXifjETCnN4g1olyDwWNAcDk+oFv5m2B4XET98iABiZega1zQLzY80woia5ktb/6ap2w1Cg==
X-Received: by 2002:a05:6870:d288:b0:2ea:73fb:7850 with SMTP id 586e51a60fabf-2eeee4cb6b9mr2820332fac.24.1750445211862;
        Fri, 20 Jun 2025 11:46:51 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:680:2e07:b628:1be4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee6655a2c7sm491389fac.17.2025.06.20.11.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:46:51 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:46:46 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v5 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core
 driver
Message-ID: <aFWslonzXrSfTASW@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1750301674.git.zhoubinbin@loongson.cn>
 <82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin@loongson.cn>

On Fri, Jun 20, 2025 at 10:06:27AM +0800, Binbin Zhou wrote:
> The Loongson-2K Board Management Controller provides an PCIe interface
> to the host to access the feature implemented in the BMC.
> 
> The BMC is assembled on a server similar to the server machine with
> Loongson-3 CPU. It supports multiple sub-devices like DRM and IPMI.
> 
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mfd/Kconfig         |  11 +++
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/ls2k-bmc-core.c | 156 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 169 insertions(+)
>  create mode 100644 drivers/mfd/ls2k-bmc-core.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 96992af22565..a1081c4211b0 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2389,6 +2389,18 @@ config MFD_INTEL_M10_BMC_PMCI
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_LS2K_BMC_CORE
> +	bool "Loongson-2K Board Management Controller Support"
> +	select MFD_CORE

Also, from the recent bug report, this is missing a depends on PCI.

> +	help
> +	  Say yes here to add support for the Loongson-2K BMC which is a Board
> +	  Management Controller connected to the PCIe bus. The device supports
> +	  multiple sub-devices like display and IPMI. This driver provides common
> +	  support for accessing the devices.
> +
> +	  The display is enabled by default in the driver, while the IPMI interface
> +	  is enabled independently through the IPMI_LS2K option in the IPMI section.
> +
>  config MFD_QNAP_MCU
>  	tristate "QNAP microcontroller unit core driver"
>  	depends on SERIAL_DEV_BUS
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 5e5cc279af60..6bad54edca34 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -282,6 +282,8 @@ obj-$(CONFIG_MFD_INTEL_M10_BMC_CORE)   += intel-m10-bmc-core.o
>  obj-$(CONFIG_MFD_INTEL_M10_BMC_SPI)    += intel-m10-bmc-spi.o
>  obj-$(CONFIG_MFD_INTEL_M10_BMC_PMCI)   += intel-m10-bmc-pmci.o
>  
> +obj-$(CONFIG_MFD_LS2K_BMC_CORE)		+= ls2k-bmc-core.o
> +
>  obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
>  obj-$(CONFIG_MFD_ATC260X_I2C)	+= atc260x-i2c.o
>  
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> new file mode 100644
> index 000000000000..9ee1edf286e7
> --- /dev/null
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson-2K Board Management Controller (BMC) Core Driver.
> + *
> + * Copyright (C) 2024-2025 Loongson Technology Corporation Limited.
> + *
> + * Authors:
> + *	Chong Qiao <qiaochong@loongson.cn>
> + *	Binbin Zhou <zhoubinbin@loongson.cn>
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
> +/* LS2K BMC resources */
> +#define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
> +#define LS2K_IPMI_RES_SIZE		0x1C
> +#define LS2K_IPMI0_RES_START		(SZ_16M + 0xF00000)
> +#define LS2K_IPMI1_RES_START		(LS2K_IPMI0_RES_START + LS2K_IPMI_RES_SIZE)
> +#define LS2K_IPMI2_RES_START		(LS2K_IPMI1_RES_START + LS2K_IPMI_RES_SIZE)
> +#define LS2K_IPMI3_RES_START		(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
> +#define LS2K_IPMI4_RES_START		(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
> +
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
> + * Currently the Loongson-2K BMC hardware does not have an I2C interface to adapt to the
> + * resolution. We set the resolution by presetting "video=1280x1024-16@2M" to the BMC memory.
> + */
> +static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
> +{
> +	char *mode;
> +	int depth, ret;
> +
> +	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> +	mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	/* The resolution field starts with the flag "video=". */
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
> +
> +static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
> +{
> +	struct simplefb_platform_data pd;
> +	resource_size_t base;
> +	int ret;
> +
> +	ret = pci_enable_device(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ls2k_bmc_parse_mode(dev, &pd);
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
> +		dev_err(&dev->dev, "Failed to removed firmware framebuffers: %d\n", ret);
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
> +module_pci_driver(ls2k_bmc_driver);
> +
> +MODULE_DESCRIPTION("Loongson-2K BMC Core driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.1
> 
