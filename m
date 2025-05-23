Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CC619F11B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984221; cv=none; b=KzVX2peZyVktn/TRutLNO7yTAQik/JICA02RJFaVbFN0fpJ/jVveEhDosSBHBZGcd6kxA0jzityDZuZrApO6S8chVs0JZYWWI7xx8+DeirSS0ZrS8NNhzay/hb2niQ9VnlCmUyHRRLOIypEQJn+0klrCM+44llTuC8TL/LBDEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984221; c=relaxed/simple;
	bh=s0qj1HYVUZC1F16YM/EAqBluZl24qRKoyx4kOGu0q8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EX7ZYQdyKd4DgUwzhvzj7qgrsFmXtyqUbWhgwfiiqEPlAPJhi32mW8L4aiZKXSOQ6bja7wWAkmf7LgYd5QF5DMWB3dDUy8BgYhhZjroOp2w6x5P72sMD0zMSPyRBvwoKoq60GJXuWSjQe5/CTWcf2mAEvliibgvuOQmX5QrNjY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEDO75yN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEDO75yN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad5574b59c0so1097410766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747984218; x=1748589018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psWq3z8m85bqv4VpT7bLMSWTFKID89rBSYBA4nH9rFw=;
        b=cEDO75yNF0QtMyzyM5ZPHuSQe92rCaerQxN96CwdUpp22ld3UUw43GZhh9zw2TNL+f
         QUrQv9OrP2MZ6aH8ZIlAchPTBM+AhpdDGTASPhRt73WFNvMtqYwQTD00wQNaZQx/toqS
         7ycdkVauzltTRsSQIszm7qcZov/tvfZHkGicJ48SWTLpuY5OFYyrxrnkZnGRLxIgQR3o
         heaHaFxVDrlmFZSXZqI7jeWPD5rXNt2U3adE/4QGEjJ+ltoDVyE/6uXdON5tlGOQ0wP9
         esyo+ZteRUsU5KjrM5KI2Aht+1hvNZVDP5U5w4j5yHG8gK4bYc1vGL+zd7Fr2Dn48LyO
         9I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984218; x=1748589018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psWq3z8m85bqv4VpT7bLMSWTFKID89rBSYBA4nH9rFw=;
        b=lX917jsl7BPw3H76WFhRmRT6wUm9SOdM4JLhmGS7ojVvD3UyVNe+Dkg9jNRXFJzk41
         9qHcub5vzFy4A+rSYHCOkgdJCIDQoxz/qQNB4XNYb+oB/UnZI5jGHToTBSqtfc77TzTA
         FPjbTTDixaQs24pl4Z1VsNxnQk9uVtSnJ045RGVYDsrtuOEZhtcNq9ab3kcsLPX0EBhq
         /9maTeM1Sps1ENQHHgkcJr8z2jLaVGQqxZHQUEZ4UlCgzJsTPy5Jk3JeecoUpak5chCX
         Xmzm6pUPACz4Xoht2+bgDO0TEUSuVM893DXaivoOBxnzZFg5yeXvHto7vhjyTENd6OcG
         m5XA==
X-Forwarded-Encrypted: i=1; AJvYcCXfXBvtEeYNa7YyjVXLb/0c/JyjA5qftvmqdby5W+l8sPMJSIAAeZQXXo+kHkNuKhYO4Po1RPykw4tI32c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyZxyBcmNW/ZRqyC3O92MxvEMNPPWvA6koteSn/meBaljvPz5
	5tpdSSZI35RgBnYM17Xeui7FzD/qprjH2lNGrFjC+kRB3kX7ajudbjt+pXO86SiqVpA6DalDY+D
	4HuLjDSo2ydZI55FuCJJACrMGj1XGX4ITfCfnivZjXg==
X-Gm-Gg: ASbGncvYyqsqZvLbFp4MOllCgZHbfAzWC9QVkKXNQLyJk+hrxvbKg71T/5fF44y/udu
	AFvIP58JLgxZw2rw5NksE0mpU9k8+Rx53y5xlc8EROkQ8dwdcDwmCbVMyO02TDEDuxwFOKeuRbL
	7jD0TODpfNyy1Mdp5HvzyKh/ataC5pkT7kC5Y=
X-Google-Smtp-Source: AGHT+IGAUWXACG5WwPLjQk0XIMVgHZ2GR2I0S2finLg9ytbRe6xt7N0y1Qz8suntOMz2kmChuw+V3HIoS4AE+EzWjbM=
X-Received: by 2002:a17:907:3d10:b0:acb:33c6:5c71 with SMTP id
 a640c23a62f3a-ad536c1a834mr2408937866b.29.1747984217646; Fri, 23 May 2025
 00:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn> <778675bfe1040cd1bf4d281dc5c5f20edc4145c1.1747276047.git.zhoubinbin@loongson.cn>
 <20250522092208.GB1199143@google.com>
In-Reply-To: <20250522092208.GB1199143@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 23 May 2025 15:10:04 +0800
X-Gm-Features: AX0GCFvIEPoY7TLdSh637kUPlWeIADhqYAt7EMIVJ2WvSxjuFhKsIiRg_NoYNP0
Message-ID: <CAMpQs4+dZjEzaBOrzknL2+5B5kkz5weZ2zWKu8GwHUoQZqPJ5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

Thanks for your detailed review.

On Thu, May 22, 2025 at 5:22=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Just "core driver" in the subject line, rather than "MFD core driver".
>
> > The Loongson-2K Board Management Controller provides an PCIe
> > interface to the host to access the feature implemented in the BMC.
> >
> > The BMC is assembled on a server similar to the server machine with
> > Loongson-3C6000 CPUs. It supports multiple sub-devices like DRM.
> >
> > Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/mfd/Kconfig       |  13 ++++
> >  drivers/mfd/Makefile      |   2 +
> >  drivers/mfd/ls2kbmc-mfd.c | 156 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 171 insertions(+)
> >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 22b936310039..04e40085441d 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -2422,5 +2422,18 @@ config MFD_UPBOARD_FPGA
> >         To compile this driver as a module, choose M here: the module w=
ill be
> >         called upboard-fpga.
> >
> > +config MFD_LS2K_BMC
> > +     tristate "Loongson-2K Board Management Controller Support"
> > +     depends on LOONGARCH
> > +     default y if LOONGARCH
> > +     select MFD_CORE
> > +     help
> > +       Say yes here to add support for the Loongson-2K BMC
> > +       which is a Board Management Controller connected to the PCIe bu=
s.
> > +       The device supports multiple sub-devices like DRM.
> > +       This driver provides common support for accessing the devices;
> > +       additional drivers must be enabled in order to use the
> > +       functionality of the BMC device.
>
> This paragraph has some odd line breaks.  Please re-align.
>
> >  endmenu
> >  endif
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 948cbdf42a18..18960ea13b64 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -290,3 +290,5 @@ obj-$(CONFIG_MFD_RSMU_I2C)        +=3D rsmu_i2c.o r=
smu_core.o
> >  obj-$(CONFIG_MFD_RSMU_SPI)   +=3D rsmu_spi.o rsmu_core.o
> >
> >  obj-$(CONFIG_MFD_UPBOARD_FPGA)       +=3D upboard-fpga.o
> > +
> > +obj-$(CONFIG_MFD_LS2K_BMC)   +=3D ls2kbmc-mfd.o
> > diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> > new file mode 100644
> > index 000000000000..b309f6132c24
> > --- /dev/null
> > +++ b/drivers/mfd/ls2kbmc-mfd.c
> > @@ -0,0 +1,156 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Loongson-2K Board Management Controller (BMC) MFD Core Driver.
>
> Remove the MFD part.  It's not a thing - we made it up.
>
> > + * Copyright (C) 2024 Loongson Technology Corporation Limited.
>
> No changes since 2024?
>
> > + *
> > + * Originally written by Chong Qiao <qiaochong@loongson.cn>
> > + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
>
> "Mainline"
>
> Typically we just do:
>
> Authors:
>         Author One <one@corp.com>
>         Author Two <two@corp.com>
>
> > + */
> > +
> > +#include <linux/aperture.h>
> > +#include <linux/errno.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/pci_ids.h>
> > +#include <linux/platform_data/simplefb.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define LS2K_DISPLAY_RES_START (SZ_16M + SZ_2M)
> > +#define LS2K_IPMI_RES_SIZE   0x1c
> > +#define LS2K_IPMI0_RES_START (SZ_16M + 0xf00000)
> > +#define LS2K_IPMI1_RES_START (LS2K_IPMI0_RES_START + LS2K_IPMI_RES_SIZ=
E)
> > +#define LS2K_IPMI2_RES_START (LS2K_IPMI1_RES_START + LS2K_IPMI_RES_SIZ=
E)
> > +#define LS2K_IPMI3_RES_START (LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZ=
E)
> > +#define LS2K_IPMI4_RES_START (LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZ=
E)
>
> Line them _all_ up please.  One more tab should do it.
>
> > +static struct resource ls2k_display_resources[] =3D {
> > +     DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-re=
s"),
> > +};
> > +
> > +static struct resource ls2k_ipmi0_resources[] =3D {
> > +     DEFINE_RES_MEM_NAMED(LS2K_IPMI0_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi0-res"),
> > +};
> > +
> > +static struct resource ls2k_ipmi1_resources[] =3D {
> > +     DEFINE_RES_MEM_NAMED(LS2K_IPMI1_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi1-res"),
> > +};
> > +
> > +static struct resource ls2k_ipmi2_resources[] =3D {
> > +     DEFINE_RES_MEM_NAMED(LS2K_IPMI2_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi2-res"),
> > +};
> > +
> > +static struct resource ls2k_ipmi3_resources[] =3D {
> > +     DEFINE_RES_MEM_NAMED(LS2K_IPMI3_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi3-res"),
> > +};
> > +
> > +static struct resource ls2k_ipmi4_resources[] =3D {
> > +     DEFINE_RES_MEM_NAMED(LS2K_IPMI4_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi4-res"),
> > +};
> > +
> > +static struct mfd_cell ls2k_bmc_cells[] =3D {
> > +     MFD_CELL_RES("simple-framebuffer", ls2k_display_resources),
> > +     MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi0_resources),
> > +     MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi1_resources),
> > +     MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi2_resources),
> > +     MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi3_resources),
> > +     MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
> > +};
> > +
> > +/*
> > + * Currently the Loongson-2K0500 BMC hardware does not have an i2c int=
erface to
>
> I2C
>
> > + * adapt to the resolution.
>
> Remove the line break here.
>
> > + * We set the resolution by presetting "video=3D1280x1024-16@2M" to th=
e bmc memory.
>
> BMC
>
> > + */
> > +static int ls2k_bmc_get_video_mode(struct pci_dev *pdev, struct simple=
fb_platform_data *pd)
> > +{
> > +     char *mode;
> > +     int depth, ret;
> > +
> > +     /* The pci mem bar last 16M is used to store the string. */
>
> PCI
>
> BAR's (maybe?)

/* The last 16M of PCI BAR0 is used to store the resolution string. */
>
> > +     mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> > +     if (!mode)
> > +             return -ENOMEM;
> > +
> > +     /* env at last 16M's beginning, first env is "video=3D" */
>
> This doesn't make sense to me - please reword.

How about:

/* The resolution field starts with the flag =E2=80=9Cvideo=3D=E2=80=9D. */
>
> > +     if (!strncmp(mode, "video=3D", 6))
> > +             mode =3D mode + 6;
> > +
> > +     ret =3D kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pd->stride =3D pd->width * depth / 8;
> > +     pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
> > +
> > +     return 0;
> > +}
>
> Surely there is a standard format / API for this already?
>
>
Now, simplefb_platform_data is mainly described in DTS and parsed by simple=
drm.
And when it is used as platform_data, there doesn't seem to be a
unified API to populate simplefb_platform_data. e.g. in
sysfb_simplefb[1], it is parsed using sysfb_parse_mode().

[1]: https://elixir.bootlin.com/linux/v6.15-rc1/source/drivers/firmware/sys=
fb_simplefb.c#L27
>
> > +static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device=
_id *id)
> > +{
> > +     int ret =3D 0;
>
> There is no need to pre-initialise this.
>
> > +     resource_size_t base;
> > +     struct simplefb_platform_data pd;
>
> Reverse these please (reverse Christmas tree is preferred).
> > +
> > +     ret =3D pci_enable_device(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ls2k_bmc_get_video_mode(dev, &pd);
> > +     if (ret)
> > +             goto disable_pci;
> > +
> > +     ls2k_bmc_cells[0].platform_data =3D &pd;
> > +     ls2k_bmc_cells[0].pdata_size =3D sizeof(pd);
> > +     base =3D dev->resource[0].start + LS2K_DISPLAY_RES_START;
> > +
> > +     /* Remove conflicting efifb device */
> > +     ret =3D aperture_remove_conflicting_devices(base, SZ_4M, "simple-=
framebuffer");
> > +     if (ret) {
> > +             dev_err(&dev->dev, "Remove firmware framebuffers failed: =
%d\n", ret);
>
> "Failed to removed firmware framebuffers"
>
> > +             goto disable_pci;
> > +     }
> > +
> > +     return devm_mfd_add_devices(&dev->dev, PLATFORM_DEVID_AUTO,
> > +                                 ls2k_bmc_cells, ARRAY_SIZE(ls2k_bmc_c=
ells),
> > +                                 &dev->resource[0], 0, NULL);
> > +
> > +disable_pci:
> > +     pci_disable_device(dev);
> > +     return ret;
> > +}
> > +
> > +static void ls2k_bmc_remove(struct pci_dev *dev)
> > +{
> > +     pci_disable_device(dev);
> > +}
> > +
> > +static struct pci_device_id ls2k_bmc_devices[] =3D {
> > +     { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> > +
> > +static struct pci_driver ls2k_bmc_driver =3D {
> > +     .name =3D "ls2k-bmc",
> > +     .id_table =3D ls2k_bmc_devices,
> > +     .probe =3D ls2k_bmc_probe,
> > +     .remove =3D ls2k_bmc_remove,
> > +};
> > +
>
> Remove this line.

All comments about code formatting will be changed in the next version.
>
> > +module_pci_driver(ls2k_bmc_driver);
> > +
> > +MODULE_DESCRIPTION("Loongson-2K BMC driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.47.1
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Thanks.
Binbin
