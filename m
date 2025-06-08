Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B31EB1AF
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749368622; cv=none; b=fGYjE3w72mPLxRKx1u4/4IKl1/pMfnOiGu9F2FFKwmZNrFhHMct86wZymyK/u4yAL+91t34HDDUqiUPdIPrMDu843GmztBVBBX5RjbQ8AeVB61HlrgQw1bXPOpwHTodNkX7mQ30I6FsXtlXUyl0fRNcM40n0NbxmxXbvd9yxWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749368622; c=relaxed/simple;
	bh=/Vf86A0ebxGilNdhG1dz5TC6E56Cz1PRMYHsT3di8Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKiLX0+1bVfOlDMmqo+LKnvlIN4giC9JqrFFJ6ne8xCZzS7tP0md1pffXankq3TBMM1DI7arTsY6+jzxARHVJItuqZelnOX+ZzzyBn06SwoUkMTPCD4dHH8waBEDMrZ8yOGQUmTGL5aXWo85itgQODPBDygYtOjUz8xjBZGwgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isNxsDYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isNxsDYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA59C4AF09
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749368622;
	bh=/Vf86A0ebxGilNdhG1dz5TC6E56Cz1PRMYHsT3di8Iw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=isNxsDYBKwyw936JgPxipKQsoXDeyh5p1PHkQ7JTknaq1JJlSJ48Z2OpixgbMcJoc
	 g4NeVa9b6HL7Y1c6bxIsr23VSQ0XwUEn+qklvN8lN/o2fDuCrU4os3sTr1q+9OUPx2
	 l4jtIDVHNJGCtK1MClTNXr17gXBLNkTQOAJPP1ykewWbNS0f1y8D/NobIJhst+sRB2
	 Q5W+TNrDl/hcnYqF5jc9X4cnKiODe+yC5hK7inYIJbWIpp4ji0PSFKXE/ZowWicjR/
	 rgMojzNjab9mSX6fsIaQJoFwMFpsXmjyGyq+1zwRmPC9RZbOVBjW/WkBS57cgejj1L
	 pn/eTpPDraemw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso1785633a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 00:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1UIkL2GiFvf8ocGnQHsheyAJfxGNGX/Psm/h9cX8Qmm+g2Kabn3XUissZYAE62c6j/dKFpKMBpIqVWYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkoadtKYPw7k9UPZUEX2naEMlITUWvM+e/gbjirf372uVzyQc
	soNXb86YSTpmkYSEKjEH9C0bSRTCxcadinjMO+2bxAtnTJzApeN+sPVSUIlxw0k3gLo4h9JZMI0
	af0H3VSW0ib0iYpgE6gRGvI/lMAGgSr8=
X-Google-Smtp-Source: AGHT+IFFS/PUZhCHROxSOVmpOinMUsY8Yc2US6M/1MG6XogHFtohhk/zQUPmdqfFY9Ayh2erR5xGyePNeoiGmdVSHHc=
X-Received: by 2002:a05:6402:4307:b0:607:28e4:d70e with SMTP id
 4fb4d7f45d1cf-607743a60b9mr9221323a12.17.1749368620583; Sun, 08 Jun 2025
 00:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748505446.git.zhoubinbin@loongson.cn> <47fd3483be9bb14d0f70edc7c6fbc2aef827be11.1748505446.git.zhoubinbin@loongson.cn>
In-Reply-To: <47fd3483be9bb14d0f70edc7c6fbc2aef827be11.1748505446.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Jun 2025 15:43:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6smO0RV2pvOb6acD4R_jP3x8zgmu9j+hSWEsNmdLv8Jw@mail.gmail.com>
X-Gm-Features: AX0GCFv96RTCuZ5r6f2xj1nDRXksieL8Xfp3h3lHgte1xz8EoulxxBX4bZVGWyI
Message-ID: <CAAhV-H6smO0RV2pvOb6acD4R_jP3x8zgmu9j+hSWEsNmdLv8Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Thu, May 29, 2025 at 8:23=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The Loongson-2K Board Management Controller provides an PCIe interface
> to the host to access the feature implemented in the BMC.
>
> The BMC is assembled on a server similar to the server machine with
> Loongson-3C6000 CPUs. It supports multiple sub-devices like DRM.
Technically the BMC is not bound to Loongson-3C6000, so replace it
with Loongson-3, or a long list
"Loongson-3C5000/Loongson-3D5000/Loongson-3C6000/Loongson-3D6000".

>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mfd/Kconfig       |  12 +++
>  drivers/mfd/Makefile      |   2 +
>  drivers/mfd/ls2kbmc-mfd.c | 156 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 170 insertions(+)
>  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 22b936310039..4993b0708fe5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2422,5 +2422,17 @@ config MFD_UPBOARD_FPGA
>           To compile this driver as a module, choose M here: the module w=
ill be
>           called upboard-fpga.
>
> +config MFD_LS2K_BMC
> +       tristate "Loongson-2K Board Management Controller Support"
> +       depends on LOONGARCH
> +       default y if LOONGARCH
> +       select MFD_CORE
> +       help
> +         Say yes here to add support for the Loongson-2K BMC which is a =
Board
> +         Management Controller connected to the PCIe bus. The device sup=
ports
> +         multiple sub-devices like DRM. This driver provides common supp=
ort for
like DRM and IPMI?

> +         accessing the devices; additional drivers must be enabled in or=
der to
> +         use the functionality of the BMC device.
And moving this block after MFD_INTEL_M10_BMC_PMCI is a little better
(BMC drivers are together).

> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 948cbdf42a18..18960ea13b64 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -290,3 +290,5 @@ obj-$(CONFIG_MFD_RSMU_I2C)  +=3D rsmu_i2c.o rsmu_core=
.o
>  obj-$(CONFIG_MFD_RSMU_SPI)     +=3D rsmu_spi.o rsmu_core.o
>
>  obj-$(CONFIG_MFD_UPBOARD_FPGA) +=3D upboard-fpga.o
> +
> +obj-$(CONFIG_MFD_LS2K_BMC)     +=3D ls2kbmc-mfd.o
Also move it after MFD_INTEL_M10_BMC_PMCI.

Huacai

> diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> new file mode 100644
> index 000000000000..9dbcb5b371f9
> --- /dev/null
> +++ b/drivers/mfd/ls2kbmc-mfd.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson-2K Board Management Controller (BMC) Core Driver.
> + *
> + * Copyright (C) 2024-2025 Loongson Technology Corporation Limited.
> + *
> + * Authors:
> + *     Chong Qiao <qiaochong@loongson.cn>
> + *     Binbin Zhou <zhoubinbin@loongson.cn>
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
> +#define LS2K_DISPLAY_RES_START         (SZ_16M + SZ_2M)
> +#define LS2K_IPMI_RES_SIZE             0x1C
> +#define LS2K_IPMI0_RES_START           (SZ_16M + 0xF00000)
> +#define LS2K_IPMI1_RES_START           (LS2K_IPMI0_RES_START + LS2K_IPMI=
_RES_SIZE)
> +#define LS2K_IPMI2_RES_START           (LS2K_IPMI1_RES_START + LS2K_IPMI=
_RES_SIZE)
> +#define LS2K_IPMI3_RES_START           (LS2K_IPMI2_RES_START + LS2K_IPMI=
_RES_SIZE)
> +#define LS2K_IPMI4_RES_START           (LS2K_IPMI3_RES_START + LS2K_IPMI=
_RES_SIZE)
> +
> +static struct resource ls2k_display_resources[] =3D {
> +       DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-re=
s"),
> +};
> +
> +static struct resource ls2k_ipmi0_resources[] =3D {
> +       DEFINE_RES_MEM_NAMED(LS2K_IPMI0_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi0-res"),
> +};
> +
> +static struct resource ls2k_ipmi1_resources[] =3D {
> +       DEFINE_RES_MEM_NAMED(LS2K_IPMI1_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi1-res"),
> +};
> +
> +static struct resource ls2k_ipmi2_resources[] =3D {
> +       DEFINE_RES_MEM_NAMED(LS2K_IPMI2_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi2-res"),
> +};
> +
> +static struct resource ls2k_ipmi3_resources[] =3D {
> +       DEFINE_RES_MEM_NAMED(LS2K_IPMI3_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi3-res"),
> +};
> +
> +static struct resource ls2k_ipmi4_resources[] =3D {
> +       DEFINE_RES_MEM_NAMED(LS2K_IPMI4_RES_START, LS2K_IPMI_RES_SIZE, "i=
pmi4-res"),
> +};
> +
> +static struct mfd_cell ls2k_bmc_cells[] =3D {
> +       MFD_CELL_RES("simple-framebuffer", ls2k_display_resources),
> +       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi0_resources),
> +       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi1_resources),
> +       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi2_resources),
> +       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi3_resources),
> +       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
> +};
> +
> +/*
> + * Currently the Loongson-2K BMC hardware does not have an I2C interface=
 to adapt to the
> + * resolution. We set the resolution by presetting "video=3D1280x1024-16=
@2M" to the BMC memory.
> + */
> +static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
> +{
> +       char *mode;
> +       int depth, ret;
> +
> +       /* The last 16M of PCI BAR0 is used to store the resolution strin=
g. */
> +       mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> +       if (!mode)
> +               return -ENOMEM;
> +
> +       /* The resolution field starts with the flag "video=3D". */
> +       if (!strncmp(mode, "video=3D", 6))
> +               mode =3D mode + 6;
> +
> +       ret =3D kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
> +       if (ret)
> +               return ret;
> +
> +       pd->stride =3D pd->width * depth / 8;
> +       pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
> +
> +       return 0;
> +}
> +
> +static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)
> +{
> +       struct simplefb_platform_data pd;
> +       resource_size_t base;
> +       int ret;
> +
> +       ret =3D pci_enable_device(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ls2k_bmc_parse_mode(dev, &pd);
> +       if (ret)
> +               goto disable_pci;
> +
> +       ls2k_bmc_cells[0].platform_data =3D &pd;
> +       ls2k_bmc_cells[0].pdata_size =3D sizeof(pd);
> +       base =3D dev->resource[0].start + LS2K_DISPLAY_RES_START;
> +
> +       /* Remove conflicting efifb device */
> +       ret =3D aperture_remove_conflicting_devices(base, SZ_4M, "simple-=
framebuffer");
> +       if (ret) {
> +               dev_err(&dev->dev, "Failed to removed firmware framebuffe=
rs: %d\n", ret);
> +               goto disable_pci;
> +       }
> +
> +       return devm_mfd_add_devices(&dev->dev, PLATFORM_DEVID_AUTO,
> +                                   ls2k_bmc_cells, ARRAY_SIZE(ls2k_bmc_c=
ells),
> +                                   &dev->resource[0], 0, NULL);
> +
> +disable_pci:
> +       pci_disable_device(dev);
> +       return ret;
> +}
> +
> +static void ls2k_bmc_remove(struct pci_dev *dev)
> +{
> +       pci_disable_device(dev);
> +}
> +
> +static struct pci_device_id ls2k_bmc_devices[] =3D {
> +       { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> +
> +static struct pci_driver ls2k_bmc_driver =3D {
> +       .name =3D "ls2k-bmc",
> +       .id_table =3D ls2k_bmc_devices,
> +       .probe =3D ls2k_bmc_probe,
> +       .remove =3D ls2k_bmc_remove,
> +};
> +module_pci_driver(ls2k_bmc_driver);
> +
> +MODULE_DESCRIPTION("Loongson-2K BMC driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.47.1
>
>
