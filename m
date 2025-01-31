Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43D1C5D72;
	Fri, 31 Jan 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738331657; cv=none; b=oKtf7SJU5BS8UAkSKySlUo/CcUAU6I/10XYfAfCHuIjW7vdYhyyK79FSs/gpLg1+aZAiWgsWOLJ19SaRMRsfsSUdaTLqTyY01WjHEn1gvga8ua/EjK/rZ3805jiZh9A41W9bo+NZinyF7OsUQCySnr6crQ6AaAsKJ61dZNXw9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738331657; c=relaxed/simple;
	bh=3Z35BJI9mvy50yMjGm4PIrv9QpGNucM7XHgLdenAYEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zqme7o16Ll7+pof9RQx+2hvM3Akg6GSLc1rMyxHPwWBltp0cQO92v+uxYm+/1gqAcMcSq7ATtNzXi1vE1G7YSqbMeZORmVYG172mNPHMgrrXf/DVcfbCdvLA/n25g4NlPabAruZv1jeWRxE90TSD4sW9ai2vrFz3sW/k1H3+1sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dX/L/JSs; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ctYS/y5c reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dX/L/JSs";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ctYS/y5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738331654; x=1769867654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QZB+c4vz3gK2C8YI8nQ7dnMMdgQ34mpMKt5yfmxvEw=;
  b=dX/L/JSsGJOHSKpqe6ldMwsGlkdP0vCQIsa4ep65Y5Rus4hvQub+xWRD
   SU3X5btLjn1WyZmYtxhnxlQPsyGjELwJHeenlEWjZk+Otj5kGvJ9RK3By
   kI8/7DAfonHwclWW3dZejtfk8R4efNhUzfcVQfVrguAeobbxCP9kUGmVw
   UvDCiF6XTRxZ5ApVEs0se9VFTBa8Vi/Wguq2X6TkzTOqLhyh14/EkqtGf
   Iv1uNQ7LcmQ+ruoniK3Az73BuxMwkw0wL7rhy8cy6cmN+ZVUYGEFTvXP9
   XvHCqsj+U+5v9Vgma29LOUGFNeE7I5a6WKUutJ+Y+B66vgZfmrqBCsTcT
   g==;
X-CSE-ConnectionGUID: uVW/17usSSK4EMO6sCV8Qw==
X-CSE-MsgGUID: /Ot5scxoR66WHux+Z85ozw==
X-IronPort-AV: E=Sophos;i="6.13,248,1732575600"; 
   d="scan'208";a="41406968"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jan 2025 14:54:12 +0100
X-CheckPoint: {679CD604-4-1CE016C0-E589DA3E}
X-MAIL-CPID: 9363A84F764F3A6F88C9FCC0A2363E63_1
X-Control-Analysis: str=0001.0A682F22.679CD604.0039,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D7E616B67E;
	Fri, 31 Jan 2025 14:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738331647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QZB+c4vz3gK2C8YI8nQ7dnMMdgQ34mpMKt5yfmxvEw=;
	b=ctYS/y5c7PF26SO1xRPJM4kzDAhkuSj+fTmkB7ftrnzZ311QeHVto2eZ1NqW3RYXDmp4M+
	IMm5/6D+h6mgHHB6ZoedzbwqkTM2xIYH1OKxs+Z0Uhb1upA2tl2MoxqMyvYQNdzgXDFhi1
	oWPj5N1VBqhoOCCv5ecCr338zQCB1QuIXIyDMFUxZHO+6V5NBDkYUpRJZSROsIRr1XfiT8
	lMGYwnpcFCWNdFJFYt1zWmNSLFVOj4UEHC3rRdpTeQzT9+ymA4a8qHkiEnBcH4jduhvx+N
	HwyWctti29LZcVcMOy39V6NDQqTPsuffK/PKq+isgzDtow27asHR85wu8QPBuA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
Date: Fri, 31 Jan 2025 14:54:06 +0100
Message-ID: <4961006.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z5ur+NF9UlXJSWtL@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com> <20250130130101.1040824-4-alexander.stein@ew.tq-group.com> <Z5ur+NF9UlXJSWtL@lizhi-Precision-Tower-5810>
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

Am Donnerstag, 30. Januar 2025, 17:42:32 CET schrieb Frank Li:
> On Thu, Jan 30, 2025 at 02:01:00PM +0100, Alexander Stein wrote:
> > i.MX8M OCOTP supports a specific peripheral or function being fused
> > which means disabled, so
> >  - Introduce disable_fuse for a list of possible fused peripherals.
> >  - Iterate all nodes to check accessing permission. If not
> >    allowed to be accessed, detach the node
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/nvmem/Kconfig     |   3 ++
> >  drivers/nvmem/imx-ocotp.c | 105 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 107 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index 8671b7c974b93..ba5c928cab520 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called nvmem-imx-ocotp.
> >
> > +	  If built as modules, any other driver relying on this working
> > +	  as access controller also needs to be a module as well.
> > +
> >  config NVMEM_IMX_OCOTP_ELE
> >  	tristate "i.MX On-Chip OTP Controller support"
> >  	depends on ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> > index c5086a16450ac..e3ea026a37d0d 100644
> > --- a/drivers/nvmem/imx-ocotp.c
> > +++ b/drivers/nvmem/imx-ocotp.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> > +#include <dt-bindings/nvmem/fsl,imx8mn-ocotp.h>
> >
> >  #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
> >  					       * OTP Bank0 Word0
> > @@ -91,11 +92,20 @@ struct ocotp_ctrl_reg {
> >  	u32 bm_rel_shadows;
> >  };
> >
> > +#define OCOTP_MAX_NUM_GATE_WORDS 4
> > +
> > +struct disable_fuse {
> > +	u32 fuse_addr;
> > +	u32 mask;
> > +};
> > +
> >  struct ocotp_params {
> >  	unsigned int nregs;
> >  	unsigned int bank_address_words;
> >  	void (*set_timing)(struct ocotp_priv *priv);
> >  	struct ocotp_ctrl_reg ctrl;
> > +	u32 num_disables;
> > +	struct disable_fuse *disables;
> >  };
> >
> >  static int imx_ocotp_wait_for_busy(struct ocotp_priv *priv, u32 flags)
> > @@ -552,11 +562,25 @@ static const struct ocotp_params imx8mm_params =
=3D {
> >  	.ctrl =3D IMX_OCOTP_BM_CTRL_DEFAULT,
> >  };
> >
> > +struct disable_fuse imx8mn_disable_fuse[] =3D {
> > +		[IMX8MN_OCOTP_M7_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT(8) =
},
> > +		[IMX8MN_OCOTP_M7_MPU_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT=
(9) },
> > +		[IMX8MN_OCOTP_M7_FPU_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT=
(10) },
> > +		[IMX8MN_OCOTP_USB_OTG1_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D B=
IT(11) },
> > +		[IMX8MN_OCOTP_GPU3D_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT(=
24) },
> > +		[IMX8MN_OCOTP_MIPI_DSI_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D B=
IT(28) },
> > +		[IMX8MN_OCOTP_ENET_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT(2=
9) },
> > +		[IMX8MN_OCOTP_MIPI_CSI_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D B=
IT(30) },
> > +		[IMX8MN_OCOTP_ASRC_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT(3=
1) },
> > +};
>=20
> Can we direct define IMX8MN_OCOTP_M7_DISABLE as BIT(8), so avoid this
> map data?

This would be possible for imx8mn, but not for imx8mp which uses
multiples fuses for disables. This is an excerpt from imx8mp WIP
> struct disable_fuse imx8mp_disable_fuse[] =3D {
> 	[IMX8MP_OCOTP_CAN_DISABLE]		=3D { .fuse_addr =3D 16, .mask =3D BIT(28) },
> 	[IMX8MP_OCOTP_CAN_FD_DISABLE]		=3D { .fuse_addr =3D 16, .mask =3D BIT(29=
) },
> 	[IMX8MP_OCOTP_VPU_VC8000E_DISABLE]	=3D { .fuse_addr =3D 16, .mask =3D BI=
T(30) },
> 	[IMX8MP_OCOTP_IMG_ISP1_DISABLE]		=3D { .fuse_addr =3D 20, .mask =3D BIT(=
0) },
> 	[IMX8MP_OCOTP_IMG_ISP2_DISABLE]		=3D { .fuse_addr =3D 20, .mask =3D BIT(=
1) },
> 	[IMX8MP_OCOTP_IMG_DEWARP_DISABLE]	=3D { .fuse_addr =3D 20, .mask =3D BIT=
(2) },
> };

Notice the fuse_addr of 16 and 20.

> > +
> >  static const struct ocotp_params imx8mn_params =3D {
> >  	.nregs =3D 256,
> >  	.bank_address_words =3D 0,
> >  	.set_timing =3D imx_ocotp_set_imx6_timing,
> >  	.ctrl =3D IMX_OCOTP_BM_CTRL_DEFAULT,
> > +	.num_disables =3D ARRAY_SIZE(imx8mn_disable_fuse),
> > +	.disables =3D imx8mn_disable_fuse,
> >  };
> >
> >  static const struct ocotp_params imx8mp_params =3D {
> > @@ -589,6 +613,81 @@ static void imx_ocotp_fixup_dt_cell_info(struct nv=
mem_device *nvmem,
> >  	cell->read_post_process =3D imx_ocotp_cell_pp;
> >  }
> >
> > +static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 id)
> > +{
> > +	u32 addr, mask, ret, val;
> > +
> > +	if (id >=3D priv->params->num_disables) {
> > +		dev_err(priv->dev, "Index %d too large\n", id);
> > +		return -EACCES;
> > +	}
> > +
> > +	addr =3D priv->params->disables[id].fuse_addr;
> > +	mask =3D priv->params->disables[id].mask;
> > +
> > +	ret =3D imx_ocotp_read(priv, addr, &val, sizeof(val));
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(priv->dev, "id:%d addr:%#x mask:0x%08x\n", id, addr, mask);
> > +	/* true means disabled */
> > +	if (val & mask)
> > +		return -EACCES;
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct devi=
ce_node *parent)
> > +{
> > +	struct device *dev =3D priv->dev;
> > +
> > +	for_each_available_child_of_node_scoped(parent, child) {
> > +		struct of_phandle_args args;
> > +		u32 id, idx =3D 0;
> > +
> > +		while (!of_parse_phandle_with_args(child, "access-controllers",
> > +						   "#access-controller-cells",
> > +						   idx++, &args)) {
> > +			of_node_put(args.np);
> > +			if (args.np !=3D dev->of_node)
> > +				continue;
> > +
> > +			/* Only support one cell */
> > +			if (args.args_count !=3D 1) {
> > +				dev_err(dev, "wrong args count\n");
> > +				continue;
> > +			}
> > +
> > +			id =3D args.args[0];
> > +
> > +			dev_dbg(dev, "Checking node: %pOF disable ID: %d\n", child, id);
> > +
> > +			if (imx_ocotp_check_access(priv, id)) {
> > +				of_detach_node(child);
> > +				dev_info(dev, "%pOF: disabled by fuse, device driver will not be p=
robed\n",
> > +					 child);
> > +			}
> > +		}
> > +
> > +		imx_ocotp_grant_access(priv, child);
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> Can we have one method to share above code logic to avoid copy-paste to
> every ocotp driver? Anyway, we can improve that later.

I need to check with STM32 implementation. The imx-ocotp-ele might use the
same function as here.

Best regards,
Alexander

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
>=20
> > +
> > +static int imx_ocotp_access_control(struct ocotp_priv *priv)
> > +{
> > +	struct device_node *root __free(device_node) =3D of_find_node_by_path=
("/");
> > +
> > +	if (!priv->params->disables)
> > +		return 0;
> > +
> > +	if (WARN_ON(!root))
> > +		return -EINVAL;
> > +
> > +	return imx_ocotp_grant_access(priv, root);
> > +}
> > +
> >  static int imx_ocotp_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -622,9 +721,13 @@ static int imx_ocotp_probe(struct platform_device =
*pdev)
> >  	imx_ocotp_clr_err_if_set(priv);
> >  	clk_disable_unprepare(priv->clk);
> >
> > +	platform_set_drvdata(pdev, priv);
> > +
> >  	nvmem =3D devm_nvmem_register(dev, &imx_ocotp_nvmem_config);
> > +	if (IS_ERR(nvmem))
> > +		return PTR_ERR(nvmem);
> >
> > -	return PTR_ERR_OR_ZERO(nvmem);
> > +	return imx_ocotp_access_control(priv);
> >  }
> >
> >  static struct platform_driver imx_ocotp_driver =3D {
> > --
> > 2.34.1
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


