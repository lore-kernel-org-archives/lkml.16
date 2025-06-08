Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87713C3CD
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749368738; cv=none; b=a+pC3Up5Z690o4pJMmISDctSuLKSp6J5RWQZUALlV4uceVkFqMoxYFPOio6Iha+YQ2tG4rtLqoQyx1wy0eN8noVB+xGfKQzulk+ZbBOh27/BGp8Hd3AP6223Cq3Axzi/wHJ2UKCzbhD9dzlS/dxkHhFBPGVJHmYcmiUgtL7Fgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749368738; c=relaxed/simple;
	bh=ViI2T46sFsE2M2eJ+AsfB8fxQS0qJtQGyUSaJmesw0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOh/Xd9YWZjOQiKa5imU4lwfLe/gk/Tsi5fcTYzBlACxRTQp1+mmm5y/Af/qfJuIGMU+i7GZJ3xqtQ9LD3NOo5r1x/za6JzIU+zOR7PFyIOXF59rIR0Ec5a8dQalSIjsEaLvlqG86zKMlSOpKp32qRx8Cu58HfXndmwlYcIaHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffdaPPLJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffdaPPLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E82C4CEF5
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749368737;
	bh=ViI2T46sFsE2M2eJ+AsfB8fxQS0qJtQGyUSaJmesw0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ffdaPPLJs4E7vUx4CteoVjxwQp/d9oGRy5xxdR6vHlrqQcjIb5L90tVh9Lncjm8ho
	 OZpZGQM4QQ777ERglHpLF6VXRdQiyDty1rVxGJZ9EUf5zOXOmzNuHCQw3vNwUrRelP
	 lQQMBfZ+hsvzg5Mg2xHLSoOoyJ6/8et0Uyymv5JHZP46IXcfqMWS75SSxsAywPLOOO
	 RQpQasLROLCfHkWpsa++pMBH9DTcUVUwDRCL3X80Q/qQYRFoThBAoY/lMDFWTze/zu
	 yOo2jXahJUCg8lyw2fXq2+xOwIaYZYcSU0TrUGuFkMnsld92KASgu7ja5NkjeqU4fw
	 x2Tfhg/dJcyjg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so1261613a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 00:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCTaT5BY9AFPnJ22EXi0E9V+ZNBO9Oux5O9NdDMUyNXV3CImzd09hQOBCUQ+t7GcnX+PcA1Y+aGepuRZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpt3Fk3lOAxGD9n/ogLcP8xQbhisKeuBO8IBHkTwlF/lj02EI
	aXZrHHBPOHHi417/gnx2mxWiVsrs+1E5RpWiQqp73qQznUXrPG+515Gff6sRaDLG/HUiunT3Oh+
	Ib0z0MQG/TiMH/5azLxnnxP+eJvSnY2o=
X-Google-Smtp-Source: AGHT+IEMxiC61/WdIzKDDhTsddX3se4U2/Ek3Y5G+M7rk+ts69pqUn08kEk+NWD2RirZytq1A5O9kffxy+5LYh5IL3U=
X-Received: by 2002:a05:6402:510c:b0:602:28d9:d555 with SMTP id
 4fb4d7f45d1cf-607748963dfmr7945203a12.32.1749368736343; Sun, 08 Jun 2025
 00:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748505446.git.zhoubinbin@loongson.cn> <01805f8d1b9c8e6564a2d6d83964f78ed29b8f1f.1748505446.git.zhoubinbin@loongson.cn>
In-Reply-To: <01805f8d1b9c8e6564a2d6d83964f78ed29b8f1f.1748505446.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Jun 2025 15:45:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H41kek9HmM99dZRak2wu24e12ytYu+4Ji-Zo0TkxXmv=g@mail.gmail.com>
X-Gm-Features: AX0GCFt4I7HLiM-K0sxDHw6ATO2018f3KDTcxmIN0cLyV0f8WNgLpCy4hoPCmgU
Message-ID: <CAAhV-H41kek9HmM99dZRak2wu24e12ytYu+4Ji-Zo0TkxXmv=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ipmi: Add Loongson-2K BMC support
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
> This patch adds Loongson-2K BMC IPMI support.
>
> According to the existing design, we use software simulation to
> implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
>
> Also since both host side and BMC side read and write kcs status, fifo fl=
ag
> is used to ensure data consistency.
>
> The single KCS message block is as follows:
>
> +------------------------------------------------------------------------=
-+
> |FIFO flags| KCS register data | CMD data | KCS version | WR REQ | WR ACK=
 |
> +------------------------------------------------------------------------=
-+
>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmi_si.h      |   7 ++
>  drivers/char/ipmi/ipmi_si_intf.c |   3 +
>  drivers/char/ipmi/ipmi_si_ls2k.c | 190 +++++++++++++++++++++++++++++++
>  4 files changed, 201 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
>
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index e0944547c9d0..17308dd6be20 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -8,6 +8,7 @@ ipmi_si-y :=3D ipmi_si_intf.o ipmi_kcs_sm.o ipmi_smic_sm.=
o ipmi_bt_sm.o \
>         ipmi_si_mem_io.o
>  ipmi_si-$(CONFIG_HAS_IOPORT) +=3D ipmi_si_port_io.o
>  ipmi_si-$(CONFIG_PCI) +=3D ipmi_si_pci.o
> +ipmi_si-$(CONFIG_MFD_LS2K_BMC) +=3D ipmi_si_ls2k.o
>  ipmi_si-$(CONFIG_PARISC) +=3D ipmi_si_parisc.o
>
>  obj-$(CONFIG_IPMI_HANDLER) +=3D ipmi_msghandler.o
> diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
> index 508c3fd45877..f38ea4f4c891 100644
> --- a/drivers/char/ipmi/ipmi_si.h
> +++ b/drivers/char/ipmi/ipmi_si.h
> @@ -101,6 +101,13 @@ void ipmi_si_pci_shutdown(void);
>  static inline void ipmi_si_pci_init(void) { }
>  static inline void ipmi_si_pci_shutdown(void) { }
>  #endif
> +#ifdef CONFIG_MFD_LS2K_BMC
> +void ipmi_si_ls2k_init(void);
> +void ipmi_si_ls2k_shutdown(void);
> +#else
> +static inline void ipmi_si_ls2k_init(void) { }
> +static inline void ipmi_si_ls2k_shutdown(void) { }
> +#endif
>  #ifdef CONFIG_PARISC
>  void ipmi_si_parisc_init(void);
>  void ipmi_si_parisc_shutdown(void);
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si=
_intf.c
> index 7fe891783a37..c13d5132fffc 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2120,6 +2120,7 @@ static int __init init_ipmi_si(void)
>
>         ipmi_si_pci_init();
>
> +       ipmi_si_ls2k_init();
>         ipmi_si_parisc_init();
>
>         mutex_lock(&smi_infos_lock);
> @@ -2334,6 +2335,8 @@ static void cleanup_ipmi_si(void)
>
>         ipmi_si_pci_shutdown();
>
> +       ipmi_si_ls2k_shutdown();
> +
>         ipmi_si_parisc_shutdown();
>
>         ipmi_si_platform_shutdown();
> diff --git a/drivers/char/ipmi/ipmi_si_ls2k.c b/drivers/char/ipmi/ipmi_si=
_ls2k.c
> new file mode 100644
> index 000000000000..71159e9882b7
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmi_si_ls2k.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Loongson-2K BMC IPMI
> + *
> + * Copyright (C) 2024-2025 Loongson Technology Corporation Limited.
> + *
> + * Authors:
> + *     Chong Qiao <qiaochong@loongson.cn>
> + *     Binbin Zhou <zhoubinbin@loongson.cn>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#include "ipmi_si.h"
> +
> +#define LS2K_KCS_FIFO_IBFH     0x0
> +#define LS2K_KCS_FIFO_IBFT     0x1
> +#define LS2K_KCS_FIFO_OBFH     0x2
> +#define LS2K_KCS_FIFO_OBFT     0x3
> +
> +/* KCS registers */
> +#define LS2K_KCS_REG_STS       0x4
> +#define LS2K_KCS_REG_DATA_OUT  0x5
> +#define LS2K_KCS_REG_DATA_IN   0x6
> +#define LS2K_KCS_REG_CMD       0x8
> +
> +#define LS2K_KCS_CMD_DATA      0xa
> +#define LS2K_KCS_VERSION       0xb
> +#define LS2K_KCS_WR_REQ                0xc
> +#define LS2K_KCS_WR_ACK                0x10
> +
> +#define LS2K_KCS_STS_OBF       BIT(0)
> +#define LS2K_KCS_STS_IBF       BIT(1)
> +#define LS2K_KCS_STS_SMS_ATN   BIT(2)
> +#define LS2K_KCS_STS_CMD       BIT(3)
> +
> +#define LS2K_KCS_DATA_MASK     (LS2K_KCS_STS_OBF | LS2K_KCS_STS_IBF | LS=
2K_KCS_STS_CMD)
> +
> +static bool ls2k_registered;
> +
> +static unsigned char ls2k_mem_inb_v0(const struct si_sm_io *io, unsigned=
 int offset)
> +{
> +       void __iomem *addr =3D io->addr;
> +       int reg_offset;
> +
> +       if (offset & BIT(0)) {
> +               reg_offset =3D LS2K_KCS_REG_STS;
> +       } else {
> +               writeb(readb(addr + LS2K_KCS_REG_STS) & ~LS2K_KCS_STS_OBF=
,
> +                      addr + LS2K_KCS_REG_STS);
Newline is unnecessary here.

Huacai

> +               reg_offset =3D LS2K_KCS_REG_DATA_OUT;
> +       }
> +
> +       return readb(addr + reg_offset);
> +}
> +
> +static unsigned char ls2k_mem_inb_v1(const struct si_sm_io *io, unsigned=
 int offset)
> +{
> +       void __iomem *addr =3D io->addr;
> +       unsigned char inb =3D 0, cmd;
> +       bool obf, ibf;
> +
> +       obf =3D readb(addr + LS2K_KCS_FIFO_OBFH) ^ readb(addr + LS2K_KCS_=
FIFO_OBFT);
> +       ibf =3D readb(addr + LS2K_KCS_FIFO_IBFH) ^ readb(addr + LS2K_KCS_=
FIFO_IBFT);
> +       cmd =3D readb(addr + LS2K_KCS_CMD_DATA);
> +
> +       if (offset & BIT(0)) {
> +               inb =3D readb(addr + LS2K_KCS_REG_STS) & ~LS2K_KCS_DATA_M=
ASK;
> +               inb |=3D FIELD_PREP(LS2K_KCS_STS_OBF, obf)
> +                   | FIELD_PREP(LS2K_KCS_STS_IBF, ibf)
> +                   | FIELD_PREP(LS2K_KCS_STS_CMD, cmd);
> +       } else {
> +               inb =3D readb(addr + LS2K_KCS_REG_DATA_OUT);
> +               writeb(readb(addr + LS2K_KCS_FIFO_OBFH), addr + LS2K_KCS_=
FIFO_OBFT);
> +       }
> +
> +       return inb;
> +}
> +
> +static void ls2k_mem_outb_v0(const struct si_sm_io *io, unsigned int off=
set,
> +                            unsigned char val)
> +{
> +       void __iomem *addr =3D io->addr;
> +       unsigned char sts =3D readb(addr + LS2K_KCS_REG_STS);
> +       int reg_offset;
> +
> +       if (sts & LS2K_KCS_STS_IBF)
> +               return;
> +
> +       if (offset & BIT(0)) {
> +               reg_offset =3D LS2K_KCS_REG_CMD;
> +               sts |=3D LS2K_KCS_STS_CMD;
> +       } else {
> +               reg_offset =3D LS2K_KCS_REG_DATA_IN;
> +               sts &=3D ~LS2K_KCS_STS_CMD;
> +       }
> +
> +       writew(val, addr + reg_offset);
> +       writeb(sts | LS2K_KCS_STS_IBF, addr + LS2K_KCS_REG_STS);
> +       writel(readl(addr + LS2K_KCS_WR_REQ) + 1, addr + LS2K_KCS_WR_REQ)=
;
> +}
> +
> +static void ls2k_mem_outb_v1(const struct si_sm_io *io, unsigned int off=
set,
> +                            unsigned char val)
> +{
> +       void __iomem *addr =3D io->addr;
> +       unsigned char ibfh, ibft;
> +       int reg_offset;
> +
> +       ibfh =3D readb(addr + LS2K_KCS_FIFO_IBFH);
> +       ibft =3D readb(addr + LS2K_KCS_FIFO_IBFT);
> +
> +       if (ibfh ^ ibft)
> +               return;
> +
> +       reg_offset =3D (offset & BIT(0)) ? LS2K_KCS_REG_CMD : LS2K_KCS_RE=
G_DATA_IN;
> +       writew(val, addr + reg_offset);
> +
> +       writeb(offset & BIT(0), addr + LS2K_KCS_CMD_DATA);
> +       writeb(!ibft, addr + LS2K_KCS_FIFO_IBFH);
> +       writel(readl(addr + LS2K_KCS_WR_REQ) + 1, addr + LS2K_KCS_WR_REQ)=
;
> +}
> +
> +static void ls2k_mem_cleanup(struct si_sm_io *io)
> +{
> +       if (io->addr)
> +               iounmap(io->addr);
> +}
> +
> +static int ipmi_ls2k_mem_setup(struct si_sm_io *io)
> +{
> +       unsigned char version;
> +
> +       io->addr =3D ioremap(io->addr_data, io->regspacing);
> +       if (!io->addr)
> +               return -EIO;
> +
> +       version =3D readb(io->addr + LS2K_KCS_VERSION);
> +
> +       io->inputb =3D version ? ls2k_mem_inb_v1 : ls2k_mem_inb_v0;
> +       io->outputb =3D version ? ls2k_mem_outb_v1 : ls2k_mem_outb_v0;
> +       io->io_cleanup =3D ls2k_mem_cleanup;
> +
> +       return 0;
> +}
> +
> +static int ipmi_ls2k_probe(struct platform_device *pdev)
> +{
> +       struct si_sm_io io;
> +
> +       memset(&io, 0, sizeof(io));
> +
> +       io.si_info      =3D &ipmi_kcs_si_info;
> +       io.io_setup     =3D ipmi_ls2k_mem_setup;
> +       io.addr_data    =3D pdev->resource[0].start;
> +       io.regspacing   =3D resource_size(&pdev->resource[0]);
> +       io.dev          =3D &pdev->dev;
> +
> +       dev_dbg(&pdev->dev, "addr 0x%lx, spacing %d.\n", io.addr_data, io=
.regspacing);
> +
> +       return ipmi_si_add_smi(&io);
> +}
> +
> +static void ipmi_ls2k_remove(struct platform_device *pdev)
> +{
> +       ipmi_si_remove_by_dev(&pdev->dev);
> +}
> +
> +struct platform_driver ipmi_ls2k_platform_driver =3D {
> +       .driver =3D {
> +               .name =3D "ls2k-ipmi-si",
> +       },
> +       .probe  =3D ipmi_ls2k_probe,
> +       .remove =3D ipmi_ls2k_remove,
> +};
> +
> +void ipmi_si_ls2k_init(void)
> +{
> +       platform_driver_register(&ipmi_ls2k_platform_driver);
> +       ls2k_registered =3D true;
> +}
> +
> +void ipmi_si_ls2k_shutdown(void)
> +{
> +       if (ls2k_registered)
> +               platform_driver_unregister(&ipmi_ls2k_platform_driver);
> +}
> --
> 2.47.1
>
>
