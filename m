Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6766220F4A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985200; cv=none; b=FnWx+7rYQwDgJJlZkZJNRNhw9D8ciFGUQVm7hYXEy9gcF2DoCoIiriwh4yZEtfksPtclrhKMZ5GlFP5yygtM/oxh+UUlzgE+4aNoXwHpllf0uFTMR/GKohFc7YzElZt9hVOc2FCoi6+VW42/BprCSjEaoLtSwPnoVxH74KDhTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985200; c=relaxed/simple;
	bh=hRw6JEfyUmpV43sNYoGmrWGm59WPslKvwIq+R+btiEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhsHMTy8l9lbUl9I+2A4eq6Bx0vGySnNtUT4R07rGtvhhRhiqZvW5gqcmoFpehSM6jZ4zoCoXmupWFM5ZBGcAMzIE0m1UaInNY0e6Ac4DgLh10ASDlhkcwxYI6KmH3YjGzHQUhPpZEY4us00gyPjfgMX/FeQBsxLdizR81j+cTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH21Ub4b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH21Ub4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A807C4CEF3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747985200;
	bh=hRw6JEfyUmpV43sNYoGmrWGm59WPslKvwIq+R+btiEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pH21Ub4bIdBs1znuhtl7nZrCPYCjYg9XD0rwCkmxf9vNmUfV06iUlHnPPedSksLtw
	 ixekRPrqlNmk6fuQIArOYR3zUCTJm+jPr/58CStPdLAPgr9lsO4E7zSD1VIeV2aq09
	 YTbOpToMLI/CznB44SFW0m9rp0c4mublExsmffey6ZI/etmgF6KHyxtZXhzPhrFpMm
	 nArmP9h3Zgdf0Y5QVDqql+hV+nEbkhL/36PWMbBMDHGGRmZMcdhW79XTxRkuh24nvq
	 PF2rEj2goVGYTBsHArpnUytmn3sXdCOyVTYmNCoplCC2gBsafH1VHmvorBxc3qhuDH
	 YAOp1RfAW3ctA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-601c5cd15ecso8557418a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGN5udArDu367FLGGK2L5sTUH10NaoZTihRorV+a7xWr9ChKe4PLDNpn68QMUVkWzLS7hkMQoBYbmJwts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfCQ7N41DXrwipgOuwHVXz70mmNp1Cl+z+jmXSGnU6m65e7zI2
	G2dny22p4o8D2UDehr7vUdyADhMHV8afnCGDLeUwZnQWOPBTkxhBnsVb+4cQVfi3s2hFzjSHCRQ
	1euBMwFlJBhPaiqkWRM+C3O840PGchGo=
X-Google-Smtp-Source: AGHT+IFTvLSVaAaQETvlSMQmIPbxLZCqqjnR3eLQI6xZMa1d7ZuvSTk+vSzvBSXpO5P4kb1wk4himYzH104mriMhlQY=
X-Received: by 2002:a05:6402:234a:b0:601:f50d:3117 with SMTP id
 4fb4d7f45d1cf-601f50d3411mr15186382a12.10.1747985198902; Fri, 23 May 2025
 00:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn> <778675bfe1040cd1bf4d281dc5c5f20edc4145c1.1747276047.git.zhoubinbin@loongson.cn>
In-Reply-To: <778675bfe1040cd1bf4d281dc5c5f20edc4145c1.1747276047.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 23 May 2025 15:26:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7P_Tdqte0xe7NnwU0k2N0Em+5Le2xOHHNm08LTDLs9sg@mail.gmail.com>
X-Gm-Features: AX0GCFtQmBgi6ZngWh9bVy_Ok4yZN20BZYLFjMXAIy08ICwyuVp-u-L_06dEKlo
Message-ID: <CAAhV-H7P_Tdqte0xe7NnwU0k2N0Em+5Le2xOHHNm08LTDLs9sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Thu, May 15, 2025 at 10:32=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
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
> +         Say yes here to add support for the Loongson-2K BMC
> +         which is a Board Management Controller connected to the PCIe bu=
s.
> +         The device supports multiple sub-devices like DRM.
> +         This driver provides common support for accessing the devices;
> +         additional drivers must be enabled in order to use the
> +         functionality of the BMC device.
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
> diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> new file mode 100644
> index 000000000000..b309f6132c24
> --- /dev/null
> +++ b/drivers/mfd/ls2kbmc-mfd.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson-2K Board Management Controller (BMC) MFD Core Driver.
> + *
> + * Copyright (C) 2024 Loongson Technology Corporation Limited.
> + *
> + * Originally written by Chong Qiao <qiaochong@loongson.cn>
> + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
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
> +#define LS2K_IPMI_RES_SIZE     0x1c
> +#define LS2K_IPMI0_RES_START   (SZ_16M + 0xf00000)
> +#define LS2K_IPMI1_RES_START   (LS2K_IPMI0_RES_START + LS2K_IPMI_RES_SIZ=
E)
> +#define LS2K_IPMI2_RES_START   (LS2K_IPMI1_RES_START + LS2K_IPMI_RES_SIZ=
E)
> +#define LS2K_IPMI3_RES_START   (LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZ=
E)
> +#define LS2K_IPMI4_RES_START   (LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZ=
E)
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
> + * Currently the Loongson-2K0500 BMC hardware does not have an i2c inter=
face to
Don't limit it to Loongson-2K0500, use Loongson-2K or LS2K instead.

Huacai

> + * adapt to the resolution.
> + * We set the resolution by presetting "video=3D1280x1024-16@2M" to the =
bmc memory.
> + */
> +static int ls2k_bmc_get_video_mode(struct pci_dev *pdev, struct simplefb=
_platform_data *pd)
> +{
> +       char *mode;
> +       int depth, ret;
> +
> +       /* The pci mem bar last 16M is used to store the string. */
> +       mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + S=
Z_16M, SZ_16M);
> +       if (!mode)
> +               return -ENOMEM;
> +
> +       /* env at last 16M's beginning, first env is "video=3D" */
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
> +       int ret =3D 0;
> +       resource_size_t base;
> +       struct simplefb_platform_data pd;
> +
> +       ret =3D pci_enable_device(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ls2k_bmc_get_video_mode(dev, &pd);
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
> +               dev_err(&dev->dev, "Remove firmware framebuffers failed: =
%d\n", ret);
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
> +
> +module_pci_driver(ls2k_bmc_driver);
> +
> +MODULE_DESCRIPTION("Loongson-2K BMC driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.47.1
>
>
