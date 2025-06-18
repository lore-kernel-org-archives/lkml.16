Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484A1A23AF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750222268; cv=none; b=aXQ2ipcq5isn/QqhHWcjQ6wMs1f0eUPF6oNdOZ5uS+aHIP1l1ThdTvuIJodxIQzmVe3Qig/7nZSEtLpqrXJdxN4K/O7K0XEmRiFCbVE+aIouBxkrf9+NPU0Z7eCi3G+ZHR1sSfnarDJOYtN70BVfGdL3fE8Z4eIL0SAHsJxq2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750222268; c=relaxed/simple;
	bh=EVg34ruMui1x+lzC4ApIPzztuFsowkWWTbWEs5MHD7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4n6gsUnHpnZdKFTEmcRlrUOh3te/56bHg5sSBk5cY2AmO8Hfg8IvCMBTeZyrct3DTzsg27CcB2JSZx5bw2i847odZ+DJscVFozBzwyJ4iyEYdFkpuRcZp6PE0PIKxJ8/40CQapXzC2FBauAobirCbhj6Gfpk7PQCcViXG+gFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XiuofoWC; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XiuofoWC"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55351af2fc6so7132602e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750222262; x=1750827062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvDANxco1DRIW7F0kxuWPGbFFPaTHT1kYYgWshxHAyY=;
        b=XiuofoWC6bRFRoYBM2PjDsHFC8rrndQXkBUsy7/ig7WXFrdf/1bBFKnYaTtuNPgv9Q
         1Ypx7R2XDFSNatjptKksBVp/iw0GxkncpxPAKygKQ5WfCeP3NLn3lAA40BeBY02N1XWN
         li8UOsM83St9r1FmAY8iCpmN7xh6x4K98wyDqyHI/YfGPDrbouDsoGkUhTnv3WuaniGW
         zXw2IbMfk79qpMfp9B2DDq+lAk6A3D5L/0eXa8VEn90wkLBphz83Akm5WDf57gpS3K77
         V1cEOQhqRUZb34wCwthFVPaa5NzNRc4bbR700WXJqq2WZ8U7EQPj12hMvizOAB9Z/oWA
         Ovmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750222262; x=1750827062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvDANxco1DRIW7F0kxuWPGbFFPaTHT1kYYgWshxHAyY=;
        b=jB2yJceMqGo3vDSEY9lPpeK4VhTTcJIklINwqcW8MMwdsFo5hR8mRcxgAsAiYXyoVI
         Vzy7hcQcgdp0iEEr/jxpTUTvMNxkFZSBcbkEnrpbSchPWZJ9BIWhxwyW/Vk2ta3yTFmp
         +xKRnCZiJ5tvmZMtQ5uEYyQmXP07VdwK5tsO1xBIVOLA849k1n/IEAVE5dipL5+RogrZ
         MnZNNOBsCbZ7xIUe/QRWwFT33ThX7pZJEoQTG3+pt7jwO3kPkLo4N8fsWmll3/7+UNV3
         IefQm31MT1FF+u5ptpYXVTJzVeXbrrC2OLRhi1b943u71TKziA8ybR0dkQ1l6FHldTcj
         XbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVszij3Yxg2Ivziqe5TxjfzA3srk9TM4Dv+yq8D5pymtTE3MwA3Jwp+NCVSInR3SDqFVF7YPbi2ZLQYrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx96XF+LdQFn5QWNEVE9ncQnrPHNb4OPVmYsQtDQn1Ri+XECnlT
	RGL65X4O2bJqxj6rRaX96L7RVrZqk1qGsIQNZiNNhUxp6mmbTiPbZkrh5QegK2UzvMtHtH3rNF4
	3ymseEZvweIqnBHwDhAjiADqgh8UO8vl7Uoa5QjvyZg==
X-Gm-Gg: ASbGncstLiWcNsGTIrdx+dFXaMb0mSxufSY306EG+MvpfZGmxuKkF5rvFRYyVMAPMwl
	XV/M2dM+DD0X83PaL40p5XXR3bz5iYwqsdb8LLp7qonoiiwAljrsIekwzxoXeDCOiYsB8r66ynk
	UJBJjtVrF8lJDPHCim+mJ/as3wQTmzZ4QD/ovtljdrNw==
X-Google-Smtp-Source: AGHT+IGMs2mj6zFdxoH8bRI/Drg3qVL/7EMjVCHSFyv13AaW9Y+4diFWe3TglpfNnP6ZF6B50iaip0sIfWWWkqQp1Ng=
X-Received: by 2002:a05:6512:1285:b0:553:65cf:4dfd with SMTP id
 2adb3069b0e04-553b6e7351amr4771609e87.3.1750222261963; Tue, 17 Jun 2025
 21:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com> <0f968b01-b607-46a7-b712-dba4a1b63290@linux.dev>
In-Reply-To: <0f968b01-b607-46a7-b712-dba4a1b63290@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 18 Jun 2025 10:20:50 +0530
X-Gm-Features: AX0GCFtMsGvEMfpTJ-tia-spaVIklkxbi6ErNN0FPovZ00QT1Zl1W9wD97dd3Nw
Message-ID: <CAK9=C2VyPDXmQZa0=Wo9x2t1bN92XjiEuF2GH51-s5sgkupXAA@mail.gmail.com>
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Atish Patra <atish.patra@linux.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 4:37=E2=80=AFAM Atish Patra <atish.patra@linux.dev>=
 wrote:
>
>
> On 6/10/25 11:22 PM, Anup Patel wrote:
> > The RPMI specification defines a system MSI service group which
> > allows application processors to receive MSIs upon system events
> > such as graceful shutdown/reboot request, CPU hotplug event, memory
> > hotplug event, etc.
> >
> > Add an irqchip driver for the RISC-V RPMI system MSI service group
> > to directly receive system MSIs in Linux kernel.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >   drivers/irqchip/Kconfig                    |   7 +
> >   drivers/irqchip/Makefile                   |   1 +
> >   drivers/irqchip/irq-riscv-rpmi-sysmsi.c    | 285 ++++++++++++++++++++=
+
> >   include/linux/mailbox/riscv-rpmi-message.h |  13 +
> >   4 files changed, 306 insertions(+)
> >   create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 0d196e447142..96bf6aa55681 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -617,6 +617,13 @@ config RISCV_IMSIC
> >       select GENERIC_MSI_IRQ
> >       select IRQ_MSI_LIB
> >
> > +config RISCV_RPMI_SYSMSI
> > +     bool
> > +     depends on MAILBOX
> > +     select IRQ_DOMAIN_HIERARCHY
> > +     select GENERIC_MSI_IRQ
> > +     default RISCV
> > +
> >   config SIFIVE_PLIC
> >       bool
> >       depends on RISCV
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 23ca4959e6ce..4fd966aa78ab 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -103,6 +103,7 @@ obj-$(CONFIG_RISCV_INTC)          +=3D irq-riscv-in=
tc.o
> >   obj-$(CONFIG_RISCV_APLIC)           +=3D irq-riscv-aplic-main.o irq-r=
iscv-aplic-direct.o
> >   obj-$(CONFIG_RISCV_APLIC_MSI)               +=3D irq-riscv-aplic-msi.=
o
> >   obj-$(CONFIG_RISCV_IMSIC)           +=3D irq-riscv-imsic-state.o irq-=
riscv-imsic-early.o irq-riscv-imsic-platform.o
> > +obj-$(CONFIG_RISCV_RPMI_SYSMSI)              +=3D irq-riscv-rpmi-sysms=
i.o
> >   obj-$(CONFIG_SIFIVE_PLIC)           +=3D irq-sifive-plic.o
> >   obj-$(CONFIG_STARFIVE_JH8100_INTC)  +=3D irq-starfive-jh8100-intc.o
> >   obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)        +=3D irq-thead-c900-aclin=
t-sswi.o
> > diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/=
irq-riscv-rpmi-sysmsi.c
> > new file mode 100644
> > index 000000000000..06f64936802a
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> > @@ -0,0 +1,285 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (C) 2025 Ventana Micro Systems Inc. */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/bug.h>
> > +#include <linux/device.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/errno.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/types.h>
> > +
> > +struct rpmi_sysmsi_get_attrs_rx {
> > +     __le32 status;
> > +     __le32 sys_num_msi;
> > +     __le32 flag0;
> > +     __le32 flag1;
> > +};
> > +
> > +#define RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV   BIT(0)
> > +
> > +struct rpmi_sysmsi_set_msi_state_tx {
> > +     __le32 sys_msi_index;
> > +     __le32 sys_msi_state;
> > +};
> > +
> > +struct rpmi_sysmsi_set_msi_state_rx {
> > +     __le32 status;
> > +};
> > +
> > +#define RPMI_SYSMSI_MSI_STATE_ENABLE                 BIT(0)
> > +#define RPMI_SYSMSI_MSI_STATE_PENDING                        BIT(1)
> > +
> > +struct rpmi_sysmsi_set_msi_target_tx {
> > +     __le32 sys_msi_index;
> > +     __le32 sys_msi_address_low;
> > +     __le32 sys_msi_address_high;
> > +     __le32 sys_msi_data;
> > +};
> > +
> > +struct rpmi_sysmsi_set_msi_target_rx {
> > +     __le32 status;
> > +};
> > +
> > +struct rpmi_sysmsi_priv {
> > +     struct device           *dev;
> > +     struct mbox_client      client;
> > +     struct mbox_chan        *chan;
> > +     u32                     nr_irqs;
> > +     u32                     gsi_base;
> > +};
> > +
> > +static int rpmi_sysmsi_get_num_msi(struct rpmi_sysmsi_priv *priv)
> > +{
> > +     struct rpmi_sysmsi_get_attrs_rx rx;
> > +     struct rpmi_mbox_message msg;
> > +     int ret;
> > +
> > +     rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_GET_ATTRI=
BUTES,
> > +                                       NULL, 0, &rx, sizeof(rx));
> > +     ret =3D rpmi_mbox_send_message(priv->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(le32_to_cpu(rx.status));
> > +
> > +     return le32_to_cpu(rx.sys_num_msi);
> > +}
> > +
> > +static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
> > +                                  u32 sys_msi_index, u32 sys_msi_state=
)
> > +{
> > +     struct rpmi_sysmsi_set_msi_state_tx tx;
> > +     struct rpmi_sysmsi_set_msi_state_rx rx;
> > +     struct rpmi_mbox_message msg;
> > +     int ret;
> > +
> > +     tx.sys_msi_index =3D cpu_to_le32(sys_msi_index);
> > +     tx.sys_msi_state =3D cpu_to_le32(sys_msi_state);
> > +     rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_S=
TATE,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(priv->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(le32_to_cpu(rx.status));
> > +
> > +     return 0;
> > +}
> > +
> > +static int rpmi_sysmsi_set_msi_target(struct rpmi_sysmsi_priv *priv,
> > +                                   u32 sys_msi_index, struct msi_msg *=
m)
> > +{
> > +     struct rpmi_sysmsi_set_msi_target_tx tx;
> > +     struct rpmi_sysmsi_set_msi_target_rx rx;
> > +     struct rpmi_mbox_message msg;
> > +     int ret;
> > +
> > +     tx.sys_msi_index =3D cpu_to_le32(sys_msi_index);
> > +     tx.sys_msi_address_low =3D cpu_to_le32(m->address_lo);
> > +     tx.sys_msi_address_high =3D cpu_to_le32(m->address_hi);
> > +     tx.sys_msi_data =3D cpu_to_le32(m->data);
> > +     rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_T=
ARGET,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(priv->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(le32_to_cpu(rx.status));
> > +
> > +     return 0;
> > +}
> > +
> > +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> > +{
> > +     struct rpmi_sysmsi_priv *priv =3D irq_data_get_irq_chip_data(d);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> > +     int ret;
> > +
> > +     ret =3D rpmi_sysmsi_set_msi_state(priv, hwirq, 0);
> > +     if (ret)
> > +             dev_warn(priv->dev, "Failed to mask hwirq %lu (error %d)\=
n", hwirq, ret);
> > +     irq_chip_mask_parent(d);
> > +}
> > +
> > +static void rpmi_sysmsi_irq_unmask(struct irq_data *d)
> > +{
> > +     struct rpmi_sysmsi_priv *priv =3D irq_data_get_irq_chip_data(d);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> > +     int ret;
> > +
> > +     irq_chip_unmask_parent(d);
> > +     ret =3D rpmi_sysmsi_set_msi_state(priv, hwirq, RPMI_SYSMSI_MSI_ST=
ATE_ENABLE);
> > +     if (ret)
> > +             dev_warn(priv->dev, "Failed to unmask hwirq %lu (error %d=
)\n", hwirq, ret);
> > +}
> > +
> > +static void rpmi_sysmsi_write_msg(struct irq_data *d, struct msi_msg *=
msg)
> > +{
> > +     struct rpmi_sysmsi_priv *priv =3D irq_data_get_irq_chip_data(d);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> > +     int ret;
> > +
> > +     /* For zeroed MSI, do nothing as of now */
> > +     if (!msg->address_hi && !msg->address_lo && !msg->data)
> > +             return;
> > +
> > +     ret =3D rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Failed to set target for hwirq %lu (=
error %d)\n",
> > +                      hwirq, ret);
> > +     }
> > +}
> > +
> > +static void rpmi_sysmsi_set_desc(msi_alloc_info_t *arg, struct msi_des=
c *desc)
> > +{
> > +     arg->desc =3D desc;
> > +     arg->hwirq =3D desc->data.icookie.value;
> > +}
> > +
> > +static int rpmi_sysmsi_translate(struct irq_domain *d, struct irq_fwsp=
ec *fwspec,
> > +                              unsigned long *hwirq, unsigned int *type=
)
> > +{
> > +     struct msi_domain_info *info =3D d->host_data;
> > +     struct rpmi_sysmsi_priv *priv =3D info->data;
> > +
> > +     if (WARN_ON(fwspec->param_count < 1))
> > +             return -EINVAL;
> > +
> > +     /* For DT, gsi_base is always zero. */
> > +     *hwirq =3D fwspec->param[0] - priv->gsi_base;
> > +     *type =3D IRQ_TYPE_NONE;
>
> Why do we set the type to IRQ_TYPE_NONE ?
> Either we shouldn't care about the type here  or edge type as it is only
> MSI driver.

Setting type to IRQ_TYPE_NONE is inspired from the generic
irq_domain_translate_onecell() implementation in kernel/irq/irqdomain.c

> We also throw a warning for user if the any other irq type is passed in
> msi_translate call back.

The #interrupt-cells is 1 for sysmsi driver so we don't even look
at fwspec->param[1] hence no need for any warning.

>
> > +     return 0;
> > +}
> > +
> > +static const struct msi_domain_template rpmi_sysmsi_template =3D {
> > +     .chip =3D {
> > +             .name                   =3D "RPMI-SYSMSI",
> > +             .irq_mask               =3D rpmi_sysmsi_irq_mask,
> > +             .irq_unmask             =3D rpmi_sysmsi_irq_unmask,
> > +#ifdef CONFIG_SMP
> > +             .irq_set_affinity       =3D irq_chip_set_affinity_parent,
> > +#endif
> > +             .irq_write_msi_msg      =3D rpmi_sysmsi_write_msg,
> > +             .flags                  =3D IRQCHIP_SET_TYPE_MASKED |
> > +                                       IRQCHIP_SKIP_SET_WAKE |
> > +                                       IRQCHIP_MASK_ON_SUSPEND,
> > +     },
> > +
> > +     .ops =3D {
> > +             .set_desc               =3D rpmi_sysmsi_set_desc,
> > +             .msi_translate          =3D rpmi_sysmsi_translate,
> > +     },
> > +
> > +     .info =3D {
> > +             .bus_token              =3D DOMAIN_BUS_WIRED_TO_MSI,
> > +             .flags                  =3D MSI_FLAG_USE_DEV_FWNODE,
> > +             .handler                =3D handle_simple_irq,
> > +             .handler_name           =3D "simple",
> > +     },
> > +};
> > +
> > +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct rpmi_sysmsi_priv *priv;
> > +     int rc;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +     priv->dev =3D dev;
> > +
> > +     /* Setup mailbox client */
> > +     priv->client.dev                =3D priv->dev;
> > +     priv->client.rx_callback        =3D NULL;
> > +     priv->client.tx_block           =3D false;
> > +     priv->client.knows_txdone       =3D true;
> > +     priv->client.tx_tout            =3D 0;
> > +
> > +     /* Request mailbox channel */
> > +     priv->chan =3D mbox_request_channel(&priv->client, 0);
> > +     if (IS_ERR(priv->chan))
> > +             return PTR_ERR(priv->chan);
> > +
> > +     /* Get number of system MSIs */
> > +     rc =3D rpmi_sysmsi_get_num_msi(priv);
> > +     if (rc < 1) {
> > +             mbox_free_channel(priv->chan);
> > +             if (rc)
> > +                     return dev_err_probe(dev, rc, "Failed to get numb=
er of system MSIs\n");
> > +             else
> > +                     return dev_err_probe(dev, -ENODEV, "No system MSI=
s found\n");
> > +     }
> > +     priv->nr_irqs =3D rc;
> > +
> > +     /* Set the device MSI domain if not available */
> > +     if (!dev_get_msi_domain(dev)) {
> > +             /*
> > +              * The device MSI domain for OF devices is only set at th=
e
> > +              * time of populating/creating OF device. If the device M=
SI
> > +              * domain is discovered later after the OF device is crea=
ted
> > +              * then we need to set it explicitly before using any pla=
tform
> > +              * MSI functions.
> > +              */
> > +             if (dev_of_node(dev))
> > +                     of_msi_configure(dev, dev_of_node(dev));
> > +
> > +             if (!dev_get_msi_domain(dev)) {
> > +                     mbox_free_channel(priv->chan);
> > +                     return -EPROBE_DEFER;
> > +             }
> > +     }
> > +
> > +     if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> > +                                       &rpmi_sysmsi_template,
> > +                                       priv->nr_irqs, priv, priv)) {
> > +             mbox_free_channel(priv->chan);
> > +             return dev_err_probe(dev, -ENOMEM, "failed to create MSI =
irq domain\n");
> > +     }
> > +
> > +     dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id rpmi_sysmsi_match[] =3D {
> > +     { .compatible =3D "riscv,rpmi-system-msi" },
> > +     {}
> > +};
> > +
> > +static struct platform_driver rpmi_sysmsi_driver =3D {
> > +     .driver =3D {
> > +             .name           =3D "rpmi-sysmsi",
> > +             .of_match_table =3D rpmi_sysmsi_match,
> > +     },
> > +     .probe =3D rpmi_sysmsi_probe,
> > +};
> > +builtin_platform_driver(rpmi_sysmsi_driver);
> > diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux=
/mailbox/riscv-rpmi-message.h
> > index 476a2d64d972..06d2f8b38969 100644
> > --- a/include/linux/mailbox/riscv-rpmi-message.h
> > +++ b/include/linux/mailbox/riscv-rpmi-message.h
> > @@ -91,6 +91,7 @@ static inline int rpmi_to_linux_error(int rpmi_error)
> >   }
> >
> >   /* RPMI service group IDs */
> > +#define RPMI_SRVGRP_SYSTEM_MSI               0x00002
> >   #define RPMI_SRVGRP_CLOCK           0x00008
> >
> >   /* RPMI clock service IDs */
> > @@ -106,6 +107,18 @@ enum rpmi_clock_service_id {
> >       RPMI_CLK_SRV_ID_MAX_COUNT
> >   };
> >
> > +/* RPMI system MSI service IDs */
> > +enum rpmi_sysmsi_service_id {
> > +     RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION =3D 0x01,
> > +     RPMI_SYSMSI_SRV_GET_ATTRIBUTES =3D 0x02,
> > +     RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES =3D 0x03,
> > +     RPMI_SYSMSI_SRV_SET_MSI_STATE =3D 0x04,
> > +     RPMI_SYSMSI_SRV_GET_MSI_STATE =3D 0x05,
> > +     RPMI_SYSMSI_SRV_SET_MSI_TARGET =3D 0x06,
> > +     RPMI_SYSMSI_SRV_GET_MSI_TARGET =3D 0x07,
> > +     RPMI_SYSMSI_SRV_ID_MAX_COUNT
> > +};
> > +
> >   /* RPMI Linux mailbox attribute IDs */
> >   enum rpmi_mbox_attribute_id {
> >       RPMI_MBOX_ATTR_SPEC_VERSION,

Regards,
Anup
