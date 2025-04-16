Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B8219A8B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826951; cv=none; b=khUOLjTlJNvHS0H5peXthhY3aFAIw33yjHttL80skI0p/WF2/XwCOxOq4kPZqeqXYDgk6AaRsU7L6DpA7H3v5AqtzUzgEhIfwUHcYC9L6TbEAUMSNuFFgQl+r0WSovsZUCAGbxCG+JWWot6/8FMMSe2jJHVqyE6t6CZZJWluxMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826951; c=relaxed/simple;
	bh=Tofc44tRyxEKXnUa2bwDyx3eVUfRCpuW6m9vhkYuuCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMZr86IXIFi6dBYwzrCIWhuObqC7otiRfZCUvaxZyk6JsRQ/TrFhtaSQ4suzoBB0sPNS4VRJV56qd5pVTj3Z6/zK36k/p6VXSot/62Htue0CWBF7qTqCZk4tg4li9Y6NchD85chjEBS4akHte7QhsIvUpPKbG8yiSd/03T9v2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=DnrhDyEK; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="DnrhDyEK"
Date: Wed, 16 Apr 2025 14:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744826946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Z/ycPhzFOp7kqim8jOWP2MgWDZ24W6IrXcEl8cuJ58=;
	b=DnrhDyEKSAHD2fzWhfxYKAMLqUZToFlUYZMgSO+5+GZ3c4t3esiForHeklefv6nSkYv15V
	f1840w5Kopq2OZImcX4hNi7zsQ1tdLtx5/iNlV9Dl0zFAlOoPFCYjPGhxcW2jjG9FFXvpr
	Rdy2YeX/ZKLv84JBoidMlckAU+DZoGYGvvoCAy7UWyzxQCF3qP6bZy2NvOyXQkKTbN+ms7
	olCblvgUlVdi9MICJo+Ln+3BI6Hezht9UN5N7tiEyFbQIdJyzWITTElI6ppeNLhMlYUNQe
	DN+7NAzASQnQroPDyeTYWCS+XcIoE5hPGkUyCWpWkfNv6O0puB+LKcUqc8Dpuw==
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
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <Z__yPpi43VdDqPYM@blossom>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
X-Migadu-Flow: FLOW_OUT

This should have a Co-developed-by tag in addition to the two sign-offs,
given you've made significant changes.

> This driver exposes a SPMI device as an NVMEM device.
> It is intended to be used with e.g. PMUs/PMICs that are used to
> hold power management configuration, such as used on Apple Silicon
> Macs.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                |  1 +
>  drivers/nvmem/Kconfig      | 14 +++++++++++
>  drivers/nvmem/Makefile     |  2 ++
>  drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 79 insertions(+)
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
> index 8671b7c974b933e147154bb40b5d41b5730518d2..9ec907d8aa6ef7df0ea45cc35e92d8239d2705ee 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -310,6 +310,20 @@ config NVMEM_SNVS_LPGPR
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-snvs-lpgpr.
>  
> +config NVMEM_SPMI
> +	tristate "Generic SPMI NVMEM"
> +	default ARCH_APPLE
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
