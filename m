Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35E41C63
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922416; cv=none; b=b7vWQOUk1BIjF/14BLxWlWSHHVBa8CyEDWR+rUhKmEV96YWUyFNbx3sG8Y/GfT04hq1KzDi13oLDgcMXP0ur0Jicl9SKItxanqkfMnn3Uh4rSXu7IaN1NC8Jid7KIQYpiqA4Z+9PNnxm95sL/ALX+CwncpxHs2y+3R4oHlq/FI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922416; c=relaxed/simple;
	bh=BXoIu9lIRCxXGVix/w/w1QRW9YroSu67gr4aoiczmV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRxt0lX560KfNT53kMr+VmZ4aBKgJom2aAlDdL2ooOw5gEV+Q6ZHciGBf9HIxLEWIykiGyGfKcjjx0VYy28d+0cWJJaWhPGPFbomn1b4K6z7GC9LGunPHP9LFT+3DiGjX56S+iI50X9Me6deEk32elbQGm+il4i2RZ2mpbH7hmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=xA3w6PLw; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="xA3w6PLw"
Date: Thu, 17 Apr 2025 16:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744922402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzO6F4FFtyFyATTtMp481S5NCp9VVguPoo6SfeBb16I=;
	b=xA3w6PLwfcpyZQZZB01hOMCyuCNSZM/ra0338yL62tabVvYiR8ZIHWf3u93ytA+/E6oQ+H
	Qpb2g3PQUT6jdwikmih3GbHgixsbZ1UmmHTA/rdzehCD4/ngxBpdnY59FsrN/LFGgip1E7
	beJnPlVDJhgsGiT46ix5O+jcN/LJNLjG2Ek5QEYAqsCaD10G7Gf94W2Fb7dSPqMGEGwAHD
	IxQdmYmICQqckRwJweWEsOmY2W7q7AX0cZIiavg1vEY7LVGcSkkLWMPpxt6UlCXpiNKtTx
	rLbz9xjrxtpDqJi1uVkm2UzDvdurKBoZhfb6DbTAmqoc79b7QRXhlfAEyNLOUA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <aAFnHNSQ_4Kvo6WR@blossom>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-2-b88851e34afb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-spmi-nvmem-v2-2-b88851e34afb@gmail.com>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Apr 17, 2025 at 10:14:50PM +0200, Sasha Finkelstein via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> This driver exposes a SPMI device as an NVMEM device.
> It is intended to be used with e.g. PMUs/PMICs that are used to
> hold power management configuration, such as used on Apple Silicon
> Macs.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                |  1 +
>  drivers/nvmem/Kconfig      | 13 ++++++++++
>  drivers/nvmem/Makefile     |  2 ++
>  drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 78 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7b2d0df81b387ba5398957131971588dc7b89dc..63c12f901aed1f3e6de8227d6db34af1bd046fe6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
>  F:	drivers/irqchip/irq-apple-aic.c
>  F:	drivers/nvme/host/apple.c
>  F:	drivers/nvmem/apple-efuses.c
> +F:	drivers/nvmem/spmi-nvmem.c
>  F:	drivers/pinctrl/pinctrl-apple-gpio.c
>  F:	drivers/pwm/pwm-apple.c
>  F:	drivers/soc/apple/*
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b933e147154bb40b5d41b5730518d2..c25c599fc79648e890ccc4e003224c9a218f393f 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -310,6 +310,19 @@ config NVMEM_SNVS_LPGPR
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-snvs-lpgpr.
>  
> +config NVMEM_SPMI
> +	tristate "Generic SPMI NVMEM"
> +	depends on SPMI
> +	select REGMAP_SPMI
> +	help
> +	  Say y here to build a generic driver to expose a SPMI device
> +	  as a NVMEM provider. This can be used for PMIC/PMU devices which
> +	  are used to store power and RTC-related settings on certain
> +	  platforms, such as Apple Silicon Macs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-spmi.
> +
>  config NVMEM_SPMI_SDAM
>  	tristate "SPMI SDAM Support"
>  	depends on SPMI
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5b77bbb6488bf89bfb305750a1cbf4a6731a0a58..b639f4284184db026bb27b11e04d54b8f7ff166f 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -64,6 +64,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
>  nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
>  obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
>  nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
> +obj-$(CONFIG_NVMEM_SPMI)		+= nvmem_spmi.o
> +nvmem_spmi-y				:= spmi-nvmem.o
>  obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
>  nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
>  obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
> diff --git a/drivers/nvmem/spmi-nvmem.c b/drivers/nvmem/spmi-nvmem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fff6162cb22dd7ab45883f004f5b63ebae014698
> --- /dev/null
> +++ b/drivers/nvmem/spmi-nvmem.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Generic SPMI NVMEM driver
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/spmi.h>
> +#include <linux/regmap.h>
> +
> +static const struct regmap_config spmi_regmap_config = {
> +	.reg_bits	= 16,
> +	.val_bits	= 8,
> +	.max_register	= 0xffff,
> +};
> +
> +static int spmi_nvmem_probe(struct spmi_device *sdev)
> +{
> +	struct regmap *regmap;
> +	struct nvmem_config nvmem_cfg = {
> +		.dev = &sdev->dev,
> +		.name = "spmi_nvmem",
> +		.id = NVMEM_DEVID_AUTO,
> +		.word_size = 1,
> +		.stride = 1,
> +		.size = 0xffff,
> +		.reg_read = (void *)regmap_bulk_read,
> +		.reg_write = (void *)regmap_bulk_write,
> +	};
> +
> +	regmap = devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	nvmem_cfg.priv = regmap;
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(&sdev->dev, &nvmem_cfg));
> +}
> +
> +static const struct of_device_id spmi_nvmem_id_table[] = {
> +	{ .compatible = "spmi-nvmem" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, spmi_nvmem_id_table);
> +
> +static struct spmi_driver spmi_nvmem_driver = {
> +	.probe = spmi_nvmem_probe,
> +	.driver = {
> +		.name = "spmi-nvmem",
> +		.of_match_table	= spmi_nvmem_id_table,
> +	},
> +};
> +
> +module_spmi_driver(spmi_nvmem_driver);
> +
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_DESCRIPTION("SPMI NVMEM driver");
> 
> -- 
> 2.49.0
> 
> 
