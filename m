Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1CB2F4A;
	Thu,  3 Apr 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669070; cv=none; b=dCpwutOuWwkQyFQhpamsQIj/5u+w4t0l0sKaJD7oJTwnwh1SANyQDWYf/R4e6Gsl+o91jTRFChu0VT+iF5Km3Y7sZkSkBoshsBZxCaNVIRevhjxji92UAuYtMk2x9VXMhIk7Pgr1/ibcM/TYqK+sI6fdRu4oWO9ThI2b7XIh43M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669070; c=relaxed/simple;
	bh=xxy4IB9V+YReFFQ75CIvILVkd625+dHYGZ3SClcB5ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIqlRqc4I3d/JzzmtBgc1n+xflBMXJlxxtsuT1XAAnqXyT020WtAaZxWVUNapd9dIkOS/+kgKCHh1dJMBLwGkc/3W9NSgEbMjhM+0JyoNRzzwuQ9ivjEvt2YKoGy/F80ti67+f2I7vvcAbwyd3IS0qVf3WT3BSDY4jkwm9qRT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=qI/xXcjl; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MFA2khVH reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qI/xXcjl";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MFA2khVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743669067; x=1775205067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z30Hkz7WP91LKSi1mbcYaIhwFiizr5KX8hW+28FpYjM=;
  b=qI/xXcjl7R/DWnLqs99s66PnF5zwSJZyt+i7A70D2a3zJNhur1MBrEXa
   WaMH3cRvyTXdUhspLmWYWWAuBf+6jokK5AeYaao/DqGAaL30tYHCPq8Bc
   TL49OvC0Qf1tPU93DXrbl96MiTvmGA/NIXSk/yFs6xefrQjcAQ8YB/OAE
   fgfb9p+sSUVzvQUO7aeruvwhCWteoZYHuo7LdS/Qq9XzJDpmhyWF8nVNa
   ysHevItix14BSmKKXXnKfM4oMzKxLsdh2fFbxURR/Ch/AplNy5EubB6Aw
   U1NDVkMOcfVOsVSwTzIcELJR0f5q0BhTKBNMKkjJ2Imb6gmyUh6ZDMyW/
   g==;
X-CSE-ConnectionGUID: vMhXcl4PRBKz0akpcwaElA==
X-CSE-MsgGUID: bvHI11ApQxCSbxlZcR24Gg==
X-IronPort-AV: E=Sophos;i="6.15,184,1739833200"; 
   d="scan'208";a="43316639"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 03 Apr 2025 10:30:57 +0200
X-CheckPoint: {67EE4741-18-903EAEAC-E04C76C8}
X-MAIL-CPID: 08543546ED19CD2066CD1002AB8F1EFC_5
X-Control-Analysis: str=0001.0A006398.67EE4741.0034,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB29C160A4C;
	Thu,  3 Apr 2025 10:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743669052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z30Hkz7WP91LKSi1mbcYaIhwFiizr5KX8hW+28FpYjM=;
	b=MFA2khVHsO9qV5hdk9cd0/pcVX682KD0GtS0M6VN3AxVm9+XSFCVn04K24B8iQNljR9cJj
	G67QnYXLq+84Y7oOpvWOsPipUVPHdp6Z2fjxr5xPpEozOo/8I5Ag81ioDDdizDu2NzZvck
	QStRpM0Dq9q5sBTSEaWb3rOfX0vqk7o2vSVlF4exzCjmQLiKLeVuSkG9d7hstguUx0XOHt
	27DIa7zuLPkP2LTN2IP7v77YQ7Z7SgMNoB7bZ3wDaWBoeC0qJBACV+ReT+gfJ6sPuUVIP/
	8P3cqLxozVoRjdkU/gq8cH8FY/oJ3OZkkXRoxvbeXvkQ9jwSMNSnBhypeVd0zQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v4 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Thu, 03 Apr 2025 10:30:51 +0200
Message-ID: <12639974.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250401154404.45932-4-laurentiumihalcea111@gmail.com>
References:
 <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-4-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Dienstag, 1. April 2025, 17:44:01 CEST schrieb Laurentiu Mihalcea:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
> configurations meant to restrict access to certain peripherals.
> Some of the configurations include:
>=20
> 	1) Marking masters as trusted for R/W. Based on this
> 	(and the configuration of the accessed peripheral), the bridge
> 	may choose to abort the R/W transactions issued by certain
> 	masters.
>=20
> 	2) Allowing/disallowing write accesses to peripherals.
>=20
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.
>=20
> Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
> to a power domain and may lose their configuration when the domain is
> powered off. This is why the configuration has to be restored when the
> domain is powered on.
>=20
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/bus/Kconfig      |  6 +++
>  drivers/bus/Makefile     |  1 +
>  drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 drivers/bus/imx-aipstz.c
>=20
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index ff669a8ccad9..fe7600283e70 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -87,6 +87,12 @@ config HISILICON_LPC
>  	  Driver to enable I/O access to devices attached to the Low Pin
>  	  Count bus on the HiSilicon Hip06/7 SoC.
> =20
> +config IMX_AIPSTZ
> +	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
> +	depends on ARCH_MXC
> +	help
> +	  Enable support for IMX AIPSTZ bridge.
> +
>  config IMX_WEIM
>  	bool "Freescale EIM DRIVER"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index cddd4984d6af..8e693fe8a03a 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+=3D fsl-mc/
> =20
>  obj-$(CONFIG_BT1_APB)		+=3D bt1-apb.o
>  obj-$(CONFIG_BT1_AXI)		+=3D bt1-axi.o
> +obj-$(CONFIG_IMX_AIPSTZ)	+=3D imx-aipstz.o
>  obj-$(CONFIG_IMX_WEIM)		+=3D imx-weim.o
>  obj-$(CONFIG_INTEL_IXP4XX_EB)	+=3D intel-ixp4xx-eb.o
>  obj-$(CONFIG_MIPS_CDMM)		+=3D mips_cdmm.o
> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
> new file mode 100644
> index 000000000000..44db40dae71b
> --- /dev/null
> +++ b/drivers/bus/imx-aipstz.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#define IMX_AIPSTZ_MPR0 0x0
> +
> +struct imx_aipstz_config {
> +	u32 mpr0;
> +};
> +
> +static void imx_aipstz_apply_default(void __iomem *base,
> +				     const struct imx_aipstz_config *default_cfg)
> +{
> +	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
> +}
> +
> +static int imx_aipstz_probe(struct platform_device *pdev)
> +{
> +	const struct imx_aipstz_config *default_cfg;
> +	void __iomem *base;
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				     "failed to get/ioremap AC memory\n");
> +
> +	default_cfg =3D of_device_get_match_data(&pdev->dev);

Shouldn't you use the configuration setup by trusted firmware (TF-A)?

> +
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	dev_set_drvdata(&pdev->dev, base);
> +
> +	pm_runtime_set_active(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);
> +
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static int imx_aipstz_runtime_resume(struct device *dev)
> +{
> +	const struct imx_aipstz_config *default_cfg;
> +	void __iomem *base;
> +
> +	base =3D dev_get_drvdata(dev);
> +	default_cfg =3D of_device_get_match_data(dev);
> +
> +	/* restore potentially lost configuration during domain power-off */
> +	imx_aipstz_apply_default(base, default_cfg);

Shouldn't you store the configuration at suspend and restore that one
instead of this fixed one?

What's going to happen if trusted firmware decides that Cortex-A53 domain
is not allowed to access AIPSTZ?

Best regards
Alexander

> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx_aipstz_pm_ops =3D {
> +	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +/*
> + * following configuration is equivalent to:
> + *	masters 0-7 =3D> trusted for R/W + use AHB's HPROT[1] to det. privile=
ge
> + */
> +static const struct imx_aipstz_config imx8mp_aipstz_default_cfg =3D {
> +	.mpr0 =3D 0x77777777,
> +};
> +
> +static const struct of_device_id imx_aipstz_of_ids[] =3D {
> +	{ .compatible =3D "fsl,imx8mp-aipstz", .data =3D &imx8mp_aipstz_default=
_cfg },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
> +
> +static struct platform_driver imx_aipstz_of_driver =3D {
> +	.probe =3D imx_aipstz_probe,
> +	.driver =3D {
> +		.name =3D "imx-aipstz",
> +		.of_match_table =3D imx_aipstz_of_ids,
> +		.pm =3D pm_ptr(&imx_aipstz_pm_ops),
> +	},
> +};
> +module_platform_driver(imx_aipstz_of_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge drive=
r");
> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


