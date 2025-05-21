Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D0514A627;
	Wed, 21 May 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838535; cv=none; b=EadCp5YjRA5j37tDN2pgB/m8vM+Bwq0m2vMqRJYRk0DYarf1XV9CDnXs4NON0AtcssSItL4saI8/WtS4tbq/UPwJsPN94QySuq4ZOdNFlLzRLclRetST2AHQeNyIBqjaE8b5GXgnOO2OeECXwyVmD1WbqdNoXVuZQgUxQFTHxbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838535; c=relaxed/simple;
	bh=LBNFvz6isHb0XpIaBbzzP2bkphvC+OQsaypRWo1qlS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRImfZ98hvSwP+HecfrC3G56ljzGraREeC8mZ6/XTa1sJlymUDUrJKwuSnJ3h+iVUyLp6YO7sWSXFYL280+fC++GK2yQBsCWWfabIY1ByYWgw7IFDGNp4GYqUty5SEElW8IJMrur5bSOgRUPO2JvSyJC4UzporV0WSSa3qWVCdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15eccc973;
	Wed, 21 May 2025 22:42:05 +0800 (GMT+08:00)
Date: Wed, 21 May 2025 22:42:05 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: add common driver to support flattened
 DT
Message-ID: <aC3mPZRCJbq7wg1T@jean.localdomain>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-2-7609c8baa2a6@whut.edu.cn>
 <20250519233723.zky3t6ynchg2a32z@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519233723.zky3t6ynchg2a32z@synopsys.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE1OVh5CSh5CTE9JGE5MH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96f34b614703a1kunmbf1ba85e166a3a
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mio6STo4FjE1Mh1ISi1WNThM
	C0sKCjRVSlVKTE9MQ0hDTklMS0hPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFKS0hDQzcG

On Mon, May 19, 2025 at 11:37:35PM +0000, Thinh Nguyen wrote:
> On Sun, May 18, 2025, Ze Huang wrote:
> > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > `dwc3-common` driver. This enables direct binding of the DWC3 core driver
> > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >  drivers/usb/dwc3/Kconfig       |   9 ++
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-common.c | 191 +++++++++++++++++++++++++++++++++++++++++
> 
> Let's rename the dwc3-common to dwc3-generic-plat. I'd associate
> "common" to common code that exists in all drivers; where as this is
> mainly for generic platform driver.
> 

You're right, will do.

> >  3 files changed, 201 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 310d182e10b50b253d7e5a51674806e6ec442a2a..852f94f906e4f339dcbb562e1ce708409ba77b76 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
> >  	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
> >  	  Say 'Y' or 'M' if you have one such device.
> >  
> > +config USB_DWC3_COMMON
> 
> Let's rename to USB_DWC3_GENERIC_PLAT.

Will do

> I would expect to also have USB_DWC3_GENERIC_PCI at some point in the future.
> 
> Side note: flattened driver for PCI driver will allow the dwc3
> host controllers to take advantage of MSIX interrupts going through the
> dwc3 code path.
>

Thanks for pointing that out.

I don’t have a convenient setup to test PCI-based DWC3 controllers by the time,
but I’ll definitely look into it when the opportunity arises.

> 
> > +       tristate "DWC3 Platform common Driver"
> > +       depends on OF && COMMON_CLK
> > +       default USB_DWC3
> > +       help
> > +         Support USB3 functionality in simple SoC integrations.
> > +         Currently supports SpacemiT DWC USB3 IP.
> > +         Say 'Y' or 'M' if you have one such device.
> > +
> >  config USB_DWC3_ST
> >  	tristate "STMicroelectronics Platforms"
> >  	depends on (ARCH_STI || COMPILE_TEST) && OF
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..ad1b0705c4d464f19e79ed0c3c63d942446e4742 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > +obj-$(CONFIG_USB_DWC3_COMMON)		+= dwc3-common.o
> > diff --git a/drivers/usb/dwc3/dwc3-common.c b/drivers/usb/dwc3/dwc3-common.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..afd9a7bec14b68dfd4f2353d714041882660a1a4
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-common.c
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * dwc3-common.c - DesignWare USB3 common driver
> > + *
> > + * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
> > + *
> > + * Inspired by dwc3-qcom.c and dwc3-of-simple.c
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include "glue.h"
> > +
> > +struct dwc3_common {
> > +	struct device		*dev;
> > +	struct dwc3		dwc;
> > +	struct clk_bulk_data	*clks;
> > +	int			num_clocks;
> > +	struct reset_control	*resets;
> > +};
> > +
> > +static int dwc3_common_probe(struct platform_device *pdev)
> > +{
> > +	struct dwc3_probe_data probe_data = {};
> > +	struct device *dev = &pdev->dev;
> > +	struct dwc3_common *dwc3c;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	dwc3c = devm_kzalloc(dev, sizeof(*dwc3c), GFP_KERNEL);
> > +	if (!dwc3c)
> > +		return -ENOMEM;
> > +
> > +	dwc3c->dev = dev;
> > +
> > +	platform_set_drvdata(pdev, dwc3c);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "missing memory resource\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dwc3c->resets = of_reset_control_array_get_optional_exclusive(dev->of_node);
> > +	if (IS_ERR(dwc3c->resets))
> > +		return dev_err_probe(dev, PTR_ERR(dwc3c->resets), "failed to get reset\n");
> > +
> > +	ret = reset_control_assert(dwc3c->resets);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to assert reset\n");
> > +
> > +	usleep_range(10, 1000);
> > +
> > +	ret = reset_control_deassert(dwc3c->resets);
> > +	if (ret) {
> > +		dev_err(dev, "failed to deassert reset\n");
> > +		goto reset_assert;
> > +	}
> > +
> > +	ret = clk_bulk_get_all(dwc3c->dev, &dwc3c->clks);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to get clocks\n");
> > +		goto reset_assert;
> > +	}
> > +
> > +	dwc3c->num_clocks = ret;
> > +
> > +	ret = clk_bulk_prepare_enable(dwc3c->num_clocks, dwc3c->clks);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clocks\n");
> > +		goto reset_assert;
> > +	}
> > +
> > +	dwc3c->dwc.dev = dev;
> > +	probe_data.dwc = &dwc3c->dwc;
> > +	probe_data.res = res;
> > +	probe_data.ignore_clocks_and_resets = true;
> > +	ret = dwc3_core_probe(&probe_data);
> > +	if (ret)  {
> > +		dev_err(dev, "failed to register DWC3 Core\n");
> > +		goto clk_disable;
> > +	}
> > +
> > +	return 0;
> > +
> > +clk_disable:
> > +	clk_bulk_disable_unprepare(dwc3c->num_clocks, dwc3c->clks);
> > +	clk_bulk_put_all(dwc3c->num_clocks, dwc3c->clks);
> > +
> > +reset_assert:
> > +	reset_control_assert(dwc3c->resets);
> > +
> > +	return ret;
> > +}
> > +
> > +static void dwc3_common_remove(struct platform_device *pdev)
> > +{
> > +	struct dwc3_common *dwc3c = platform_get_drvdata(pdev);
> > +
> > +	dwc3_core_remove(&dwc3c->dwc);
> > +
> > +	clk_bulk_disable_unprepare(dwc3c->num_clocks, dwc3c->clks);
> > +	clk_bulk_put_all(dwc3c->num_clocks, dwc3c->clks);
> > +
> > +	reset_control_assert(dwc3c->resets);
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> 
> Use the new SYSTEM_SLEEP_PM_OPS macros and we can do away with these PM
> guards.
> 

Will follow, thanks

> > +static int dwc3_common_suspend(struct device *dev)
> > +{
> > +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = dwc3_pm_suspend(&dwc3c->dwc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	clk_bulk_disable_unprepare(dwc3c->num_clocks, dwc3c->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dwc3_common_resume(struct device *dev)
> > +{
> > +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = clk_bulk_prepare_enable(dwc3c->num_clocks, dwc3c->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = dwc3_pm_resume(&dwc3c->dwc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int dwc3_common_runtime_suspend(struct device *dev)
> > +{
> > +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_suspend(&dwc3c->dwc);
> > +}
> > +
> > +static int dwc3_common_runtime_resume(struct device *dev)
> > +{
> > +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_resume(&dwc3c->dwc);
> > +}
> > +
> > +static int dwc3_common_runtime_idle(struct device *dev)
> > +{
> > +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_idle(&dwc3c->dwc);
> > +}
> > +
> > +static const struct dev_pm_ops dwc3_common_dev_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_common_suspend, dwc3_common_resume)
> > +	RUNTIME_PM_OPS(dwc3_common_runtime_suspend, dwc3_common_runtime_resume,
> > +		       dwc3_common_runtime_idle)
> > +};
> > +#endif /* CONFIG_PM_SLEEP */
> > +
> > +static const struct of_device_id dwc3_common_of_match[] = {
> > +	{ .compatible = "spacemit,k1-dwc3", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_common_of_match);
> > +
> > +static struct platform_driver dwc3_common_driver = {
> > +	.probe		= dwc3_common_probe,
> > +	.remove		= dwc3_common_remove,
> > +	.driver		= {
> > +		.name	= "dwc3-common",
> > +		.of_match_table = dwc3_common_of_match,
> > +#ifdef CONFIG_PM_SLEEP
> > +		.pm	= &dwc3_common_dev_pm_ops,
> > +#endif /* CONFIG_PM_SLEEP */
> > +	},
> > +};
> > +module_platform_driver(dwc3_common_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare USB3 common driver");
> > 
> > -- 
> > 2.49.0
> > 
> 
> Thanks for the work. Going forward, I hope more platforms will move to
> this and take advantage of this new flattened model.
> 

Thanks for the feedback! Looking forward to seeing it adopted more widely :-)

> Thanks,
> Thinh
