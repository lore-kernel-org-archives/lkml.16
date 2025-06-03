Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252F3FE4;
	Tue,  3 Jun 2025 02:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748919100; cv=none; b=aYW2Mg/TpIpyutQAbLgEDdT5/XGZ8Ym3SMsyI+bEqNySv5hwp/xRh3kxIYz78ToXPiuRA+LHrvusspTOtHL9164nkslCtJSRsAFgZa+dUufH1XVXVUWxnXOxjbvgOPY3RN7XGfkTw+GHQNouAfF0JYlGoakgNG4o7AKgXaoG2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748919100; c=relaxed/simple;
	bh=B1WHkTA/AVGmWkvwkjHz/kdq3q+F+2tdkd1y47SsRm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zg+9qgNfsdXfma4vbjie/3YyXoL0VX+dNt0dLHuAJzVeWqAf7m9SwFQLQ5ldRmHjHTXQ7bCam0IaByivME4nf2HlNLud/eelsFNOT09f9jYzFkjlwaBCFlY7rAf25qNz+ypoV8fvX87qprFnt6N/51QWn2SMW5UBrruuIiZv14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.17.176.245])
	by smtp.qiye.163.com (Hmail) with ESMTP id 174b4f471;
	Tue, 3 Jun 2025 10:51:27 +0800 (GMT+08:00)
Date: Tue, 3 Jun 2025 10:51:27 +0800
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
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Message-ID: <aD5jL5DK6S8ii-DT@jean.localdomain>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
 <20250603012029.4agja77rdoneeyrl@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603012029.4agja77rdoneeyrl@synopsys.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx0aVhoaQ04dShhOGUsZQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKTFVKTE1VSU9OWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9733b3704a03a1kunmed4d47e729eccc
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6DDo4MjEwHzcRHBchDzA5
	PT0KChBVSlVKTE9DQkpCS0NDSUNKVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKTFVKTE1VSU9OWVdZCAFZQU1NS0s3Bg++

On Tue, Jun 03, 2025 at 01:20:35AM +0000, Thinh Nguyen wrote:
> On Mon, May 26, 2025, Ze Huang wrote:
> > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >  drivers/usb/dwc3/Kconfig             |   9 ++
> >  drivers/usb/dwc3/Makefile            |   1 +
> >  drivers/usb/dwc3/dwc3-generic-plat.c | 189 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 199 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 310d182e10b50b253d7e5a51674806e6ec442a2a..082627f39c9726ee4e0c5f966c5bc454f5541c9a 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
> >  	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
> >  	  Say 'Y' or 'M' if you have one such device.
> >  
> > +config USB_DWC3_GENERIC_PLAT
> > +       tristate "DWC3 Generic Platform Driver"
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
> > index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > +obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
> > diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
...
> > +
> > +static void dwc3_generic_remove(struct platform_device *pdev)
> > +{
> > +	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
> > +
> > +	dwc3_core_remove(&dwc3->dwc);
> > +
> > +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> > +	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
> > +
> > +	reset_control_assert(dwc3->resets);
> > +}
> > +
> > +static int __maybe_unused dwc3_generic_suspend(struct device *dev)
> 
> We shouldn't need __maybe_unused attr with the new PM macros.
> 

Will drop these attr

> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = dwc3_pm_suspend(&dwc3->dwc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused dwc3_generic_resume(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = dwc3_pm_resume(&dwc3->dwc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused dwc3_generic_runtime_suspend(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_suspend(&dwc3->dwc);
> > +}
> > +
> > +static int __maybe_unused dwc3_generic_runtime_resume(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_resume(&dwc3->dwc);
> > +}
> > +
> > +static int __maybe_unused dwc3_generic_runtime_idle(struct device *dev)
> > +{
> > +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> > +
> > +	return dwc3_runtime_idle(&dwc3->dwc);
> > +}
> > +
> > +static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> > +	SET_RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> > +			   dwc3_generic_runtime_idle)
> > +};
> > +
> > +static const struct of_device_id dwc3_generic_of_match[] = {
> > +	{ .compatible = "spacemit,k1-dwc3", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> > +
> > +static struct platform_driver dwc3_generic_driver = {
> > +	.probe		= dwc3_generic_probe,
> > +	.remove		= dwc3_generic_remove,
> > +	.driver		= {
> > +		.name	= "dwc3-generic-plat",
> > +		.of_match_table = dwc3_generic_of_match,
> > +#ifdef CONFIG_PM_SLEEP
> 
> Use the new pm_ptr/pm_sleep_ptr.
> 

Thanks for pointing it out, I missed this part. I will fix it

> Thanks,
> Thinh
> 
> > +		.pm	= &dwc3_generic_dev_pm_ops,
> > +#endif /* CONFIG_PM_SLEEP */
> > +	},
> > +};
> > +module_platform_driver(dwc3_generic_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");
> > 
> > -- 
> > 2.49.0
> > 
