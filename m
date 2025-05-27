Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF3B242D69
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333547; cv=none; b=IH7uOonD4WYqFgpZP5TV1putz/hLZL7LFbL4Q79R6GIt9UufrkL1+7dxEBVKwq1aFRi4WvZrf+pXjcr6NXt/EHdJSMqhXYAfE8NUe37l7b6VTTyxgq9XBtltfS1Ep19fQ7HEAGgqw2rQ5IUBnwEBQg+8++yTp5JDHQqwa9oe1BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333547; c=relaxed/simple;
	bh=HOHrdBTeSaAxKTmZHtbLi3StXijXs5pu3qt6hrqX6PY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKVd4YLd9YcZheUl3g1pGTx1ikLRh5iVi6vL1d3laCx0pCDWwuIcMmktJcQzKVUkIdSJBUNdjpCu8Wc5nrgtWawn2cB6LAdR2Ig0DQCDVCf7makIsAeh/SFsVKhZ1hceOpTbqVIAXxJHkGgOw/OBIN3MIKXp1RdAID66yK9jTQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhVuu+m+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhVuu+m+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so488479766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748333543; x=1748938343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzj9YsRu706sjD1Xp/emKY7PTlORkH1Xl9Vd6icqqpY=;
        b=RhVuu+m+C4uWEUCWdSbPh2DxIUrVbSZXlxBkS8V9ihHTLMHlbX07An8Kb5RVdLRSOR
         +8ctU1Y30oJF+Tpo6NFHI3aoLqQNEm6KquhhVe7FcjnF3rlPWRa/7DFZyXIhnu3ChP9h
         l/y80GzvlSXjxu4inhdEEqT2pgjaP5qit3xwAvoD2Sbnuib/AyOxjlDzcxAjKimZi6Q1
         tQ7wCLsBvMZx1rRvcZu3kkAEIq7zlLLzMTCnytdTUcnDWr2EZBcnqSnWAB/a6GTT2pIU
         sVHPeHm4RjAQDUpMNUOoca8yN2JeAJYDljmDOevWzxeVHMkyy6ntYYLYqDE7LTGVTGVg
         SfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333543; x=1748938343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzj9YsRu706sjD1Xp/emKY7PTlORkH1Xl9Vd6icqqpY=;
        b=c1nlidKrHhefG55FG1Yrq896+e0z5yC7BUZevIrJHcu8uK4JIRrvbc9f+KXcuyl3ED
         Kp6LkN6Aldep+RFsw7h212sVqZ/JP1VViHlth8WhvOCqRHlDit4iNOq6Rg4T6aiXhGS7
         +8N2oO1rCVqX8Cgdxgl6VlyKyQCTsb0KIXwVponOXHzk8rjw/dy3UvjV7e8We6t+huDH
         3ZACleczQ+SKVmfAbZWUB1GroYUTD3rXNgxh3c2+Qh1d54K7qS7EByO6bog2GliFGjxK
         O6X0oo0XDkDC1JuEJH1ExrKp6ZrWpPMy80WA3gRzYXx5R00qIkzy+tQA+KYz3tnEcBRT
         X+dg==
X-Forwarded-Encrypted: i=1; AJvYcCVOW7mYdzu99B3qRjyfWZabFYtBa/s1NOWvPaPr10AGHsHqPzzvoRLJ2RQ9B6vtF/7w9jqwUKnSmFWeexc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqL3oUPhB1X+YBlwpyJx61eedoBQgPXtfvwQtAe17TKe2/B8dU
	Ag7yOnGiDeoBD58K8y6fVLaCmoHNrZxuzrrRSOSPSJDSQZWWNsb85v5ckvNXeygZckK96JpPuOo
	uRi0FiPPbu0IOyaHycU0JD2o8phaD9Zc=
X-Gm-Gg: ASbGnctDKOiHs1ZFEMPTRPR3ytZnDMO+fd9g5TZ31L2ttVXGUn2HCQPB35zWOuxSHPL
	vKVnoLYXHeDMspI1CSJtuUETkxb2v38qkXLRe5dpwsMfvlyPPseR5lAsuC4WSqsWCJBKNPJeNnP
	/WOe78BmURvFdy3RADumG5Oc6LAh89lyhk5jLZCuYSBLc=
X-Google-Smtp-Source: AGHT+IHM+nvWRi5XKpXq3bpDtK6mbzuWQDoeBKqcTeUkr9X71mBMqoPFDjALAoRUQrIdevbLfDDeKighD+XSXNAtJCA=
X-Received: by 2002:a17:907:9715:b0:ad8:8841:b393 with SMTP id
 a640c23a62f3a-ad88841b3a0mr242301366b.6.1748333541895; Tue, 27 May 2025
 01:12:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn> <eff0c02e30118c45463f4b6488c895bf3ec9edb9.1747276047.git.zhoubinbin@loongson.cn>
 <20250522093919.GC1199143@google.com>
In-Reply-To: <20250522093919.GC1199143@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 27 May 2025 16:12:09 +0800
X-Gm-Features: AX0GCFtUvGwWhptJ7AeyI6YFo1JEdBivjGlzMCNGbxWmTHSaUbnoVZm7GeKRuIs
Message-ID: <CAMpQs4K9yWGrscgjHCEoQ+L2bCHE5hKfJunYpk5rWZzv17Co7A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

Thanks for your detailed review.

On Thu, May 22, 2025 at 5:39=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 15 May 2025, Binbin Zhou wrote:
>
> > Since the display is a sub-function of the Loongson-2K BMC, when the
> > BMC reset, the entire BMC PCIe is disconnected, including the display
> > which is interrupted.
> >
> > Not only do you need to save/restore the relevant PCIe registers
> > throughout the reset process, but you also need to re-push the display
> > to the monitor at the end.
> >
> > Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/mfd/ls2kbmc-mfd.c | 242 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 242 insertions(+)
> >
> > diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> > index b309f6132c24..4d35a13b3da5 100644
> > --- a/drivers/mfd/ls2kbmc-mfd.c
> > +++ b/drivers/mfd/ls2kbmc-mfd.c
> > @@ -9,8 +9,11 @@
> >   */
> >
> >  #include <linux/aperture.h>
> > +#include <linux/delay.h>
> >  #include <linux/errno.h>
> >  #include <linux/init.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kbd_kern.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/module.h>
> > @@ -18,6 +21,8 @@
> >  #include <linux/pci_ids.h>
> >  #include <linux/platform_data/simplefb.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/stop_machine.h>
> > +#include <linux/vt_kern.h>
> >
> >  #define LS2K_DISPLAY_RES_START (SZ_16M + SZ_2M)
> >  #define LS2K_IPMI_RES_SIZE   0x1c
> > @@ -27,6 +32,9 @@
> >  #define LS2K_IPMI3_RES_START (LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZ=
E)
> >  #define LS2K_IPMI4_RES_START (LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZ=
E)
> >
> > +#define LS2K_BMC_RESET_DELAY (60 * HZ)
> > +#define LS2K_BMC_RESET_WAIT  (10 * HZ)
> > +
> >  static struct resource ls2k_display_resources[] =3D {
> >       DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-re=
s"),
> >  };
> > @@ -60,6 +68,227 @@ static struct mfd_cell ls2k_bmc_cells[] =3D {
> >       MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
> >  };
> >
> > +static const u32 index[] =3D { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24=
,
> > +                          0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
> > +static const u32 cindex[] =3D { 0x4, 0x10, 0x3c };
>
> What are these?  You need to define them or at least provide a comment
> that describes what they are and how they're used.
>
> > +struct ls2k_bmc_pci_data {
> > +     u32 d80c;
> > +     u32 d71c;
> > +     u32 data[14];
> > +     u32 cdata[3];
>
> To the uninitiated, this is all gibberish.
>
> Either change the nomenclature or provide commentary.

These are the indexes of the PCI-E configuration space that need to be
saved, which can be found in include/uapi/linux/pci_regs.h. I will
redefine them as follows:

/* For LS2K BMC parent device -- LS7A2000 */
struct ls2k_bmc_parent_pci_data {
        u32 pci_command;
        u32 base_address[6];
        u32 rom_addreess;
        u32 interrupt_line;
        u32 msi_hi;
        u32 msi_lo;
        u32 devctl;
        u32 linkcap;
        u32 linkctl_sts;
        u32 symbol_timer;
        u32 gen2_ctrl;
};

/* For LS2K BMC */
struct ls2k_bmc_pci_data {
        u32 pci_command;
        u32 base_address0;
        u32 interrupt_line;
};

>
> > +};
> > +
> > +struct ls2k_bmc_pdata {
> > +     struct device *dev;
> > +     struct work_struct reset_work;
> > +     unsigned long reset_time;
>
> This always appears to be jiffies - is it used elsewhere?

Emm, It's only used in ls2k_bmc_interrupt(), and I didn't seem to need
to put it here.
>
> > +     struct ls2k_bmc_pci_data pci_data;
> > +};
> > +
> > +static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *ppdev)
> > +{
> > +     u32 addr;
> > +
> > +     pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
> > +     addr &=3D PCI_BASE_ADDRESS_MEM_MASK;
> > +
> > +     return addr ? true : false;
> > +}
> > +
> > +static bool ls2k_bmc_check_pcie_connected(struct pci_dev *parent,
> > +                                       struct ls2k_bmc_pdata *priv)
> > +{
> > +     void __iomem *mmio;
> > +     int sts, ret;
> > +
> > +     mmio =3D pci_iomap(parent, 0, 0x100);
>
> Why 0x100?  This should be defined.

This is ls7a2000 pcie port bar0 register, I will define it.
>
> > +     if (!mmio)
> > +             return false;
> > +
> > +     writel(readl(mmio) | 0x8, mmio);
> > +
> > +     ret =3D readl_poll_timeout_atomic(mmio + 0xc, sts, (sts & 0x11) =
=3D=3D 0x11,
> > +                                     1000, 1000000);
> > +     if (ret) {
>
> All of the magic numbers in this function should be defined.

ok, I will do it.
>
> > +             pci_iounmap(parent, mmio);
> > +             dev_err(priv->dev, "PCIE train failed status=3D0x%x\n", s=
ts);
> > +             return false;
> > +     }
> > +
> > +     pci_iounmap(parent, mmio);
> > +     return true;
> > +}
> > +
> > +static int ls2k_bmc_recover_pci_data(void *data)
> > +{
> > +     struct ls2k_bmc_pdata *priv =3D data;
> > +     struct pci_dev *pdev =3D to_pci_dev(priv->dev);
> > +     struct pci_dev *parent =3D pdev->bus->self;
> > +     bool ready, dirty;
> > +     u32 i;
> > +
> > +     pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
> > +     pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
> > +     pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
>
> You need to provide commentary throughout this driver!
>
> > +
> > +     for (i =3D 2000; i > 0 ; i--) {
>
> Why 2000?  Please define and explain it.
>
> > +             dirty =3D ls2k_bmc_bar0_addr_is_set(parent);
>
> Since these are bools, you can put the function in an if() statement.

ok...
>
> > +             if (!dirty)
> > +                     break;
> > +             mdelay(1);
>
> Why?  What are we waiting for?

Since reading ls2k bmc will be stuck after the pcie port is reset, we
read bar0 of ls7a2000 (the parent device of ls2k bmc) to determine
whether it is reset or not, and we can only start the training after
the reset is successful.
>
> > +     };
> > +
> > +     if (i =3D=3D 0)
> > +             dev_warn(priv->dev, "The PCI Bar is not cleared.\n");
>
> But it's okay to continue?  Why?
>
> > +     for (i =3D 0; i < ARRAY_SIZE(index); i++)
> > +             pci_write_config_dword(parent, index[i], priv->pci_data.d=
ata[i]);
> > +
> > +     pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
> > +     pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
> > +
> > +     /* Check if the pcie is connected */
>
> PCI-E
>
> > +     ready =3D ls2k_bmc_check_pcie_connected(parent, priv);
>
> As above.
>
> > +     if (!ready)
> > +             return ready;
> > +
> > +     dev_dbg(priv->dev, "The PCIE recovered done.\n");
>
> How useful is this once development is complete?
>
> > +     /* Waiting for u-boot ddr config ready */
>
> Will it always be U-Boot?
>
> Should be "U-Boot" and "DDR".
>
> > +     mdelay(jiffies_to_msecs(LS2K_BMC_RESET_WAIT));
>
> Why not define the value in ms already?
>
> > +     ready =3D ls2k_bmc_bar0_addr_is_set(parent);
>
> As above.
>
> > +     if (!ready)
> > +             return ready;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(cindex); i++)
> > +             pci_write_config_dword(pdev, cindex[i], priv->pci_data.cd=
ata[i]);
> > +
> > +     return 0;
> > +}
> > +
> > +static void ls2k_bmc_events_fn(struct work_struct *work)
> > +{
> > +     struct ls2k_bmc_pdata *priv =3D container_of(work, struct ls2k_bm=
c_pdata, reset_work);
> > +
> > +     /*
> > +      * The pcie is lost when the BMC resets,
>
> Strange line-breaks.  Pick a limit (80-100, etc) and stick to it.
>
> > +      * at which point access to the pcie from other CPUs
> > +      * is suspended to prevent a crash.
> > +      */
> > +     stop_machine(ls2k_bmc_recover_pci_data, priv, NULL);
> > +
> > +#ifdef CONFIG_VT
>
> No avoidable #ifery in C-files please.

This is to avoid possible compilation failures caused by randconfig
(CONFIG_VT is not defined).
>
> > +     /* Re-push the display due to previous pcie loss. */
> > +     set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> > +#endif
> > +
> > +     dev_info(priv->dev, "Loongson-2K BMC recovered done.\n");
>
> Remove this line - we want clean bootlogs.
>
> > +}
> > +
> > +static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> > +{
> > +     struct ls2k_bmc_pdata *priv =3D arg;
> > +
> > +     if (system_state !=3D SYSTEM_RUNNING)
> > +             return IRQ_HANDLED;
> > +
> > +     /* Skip interrupt in LS2K_BMC_RESET_DELAY */
> > +     if (time_after(jiffies, priv->reset_time + LS2K_BMC_RESET_DELAY))
> > +             schedule_work(&priv->reset_work);
> > +
> > +     priv->reset_time =3D jiffies;
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +#define BMC_RESET_GPIO                       14
> > +#define LOONGSON_GPIO_REG_BASE               0x1fe00500
> > +#define LOONGSON_GPIO_REG_SIZE               0x18
> > +#define LOONGSON_GPIO_OEN            0x0
> > +#define LOONGSON_GPIO_FUNC           0x4
> > +#define LOONGSON_GPIO_INTPOL         0x10
> > +#define LOONGSON_GPIO_INTEN          0x14
>
> Put these up with the reset of the defines.
>
> > +/* The gpio interrupt is a watchdog interrupt that is triggered when t=
he BMC resets. */
> > +static int ls2k_bmc_gpio_reset_handler(struct ls2k_bmc_pdata *priv)
>
> Why are we now doing GPIO things in here?  Why not a GPIO driver?

As I note below, our gpio controller hardware does not support
interrupt cascading for gpio_to_irq(), so this approach was taken.
>
> > +{
> > +     int gsi =3D 16 + (BMC_RESET_GPIO & 7);
> > +     void __iomem *gpio_base;
> > +     int irq, ret =3D 0;
> > +
> > +     /* Since Loongson-3A hardware does not support GPIO interrupt cas=
cade,
> > +      * chip->gpio_to_irq() cannot be implemented,
> > +      * here acpi_register_gsi() is used to get gpio irq.
> > +      */
>
> Use proper multi-line commentary as per the Coding Style documentation.

I see.
>
> > +     irq =3D acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_AC=
TIVE_LOW);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     gpio_base =3D ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_S=
IZE);
> > +     if (!gpio_base) {
> > +             ret =3D PTR_ERR(gpio_base);
> > +             goto acpi_failed;
> > +     }
> > +
> > +     writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO)=
,
> > +            gpio_base + LOONGSON_GPIO_OEN);
> > +     writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPI=
O),
> > +            gpio_base + LOONGSON_GPIO_FUNC);
> > +     writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_G=
PIO),
> > +            gpio_base + LOONGSON_GPIO_INTPOL);
> > +     writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPI=
O),
> > +            gpio_base + LOONGSON_GPIO_INTEN);
> > +
> > +     ret =3D devm_request_irq(priv->dev, irq, ls2k_bmc_interrupt,
> > +                            IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kb=
mc gpio", priv);
> > +     if (ret)
> > +             dev_err(priv->dev, "ls2kbmc gpio request_irq(%d) failed\n=
", irq);
>
> "LS2KBMC" and "GPIO", etc.

All code formatting related issues will be fixed in the next release.
>
> > +
> > +     iounmap(gpio_base);
> > +
> > +acpi_failed:
> > +     acpi_unregister_gsi(gsi);
> > +
> > +     return ret;
> > +}
> > +
> > +static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_b=
mc_pdata *priv)
> > +{
> > +     struct pci_dev *parent =3D pdev->bus->self;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(index); i++)
> > +             pci_read_config_dword(parent, index[i], &priv->pci_data.d=
ata[i]);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(cindex); i++)
> > +             pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cd=
ata[i]);
> > +
> > +     pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
> > +     priv->pci_data.d80c =3D (priv->pci_data.d80c & ~(3 << 17)) | BIT(=
17);
> > +
> > +     pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
> > +     priv->pci_data.d71c |=3D BIT(26);
>
> No magic numbers please.  Define them all.

I will define them as following:

#define LS2K_BMC_GEN2_CTL               0x80c
#define LS2K_BMC_SYMBOL_TIMER           0x71c

#define LS2K_BMC_GEN2_SPEED_CHANGE      BIT(17)
#define LS2K_BMC_CONF_PHY_TX            BIT(18)

#define LS2K_BMC_MASK_LEN_MATCH         BIT(26)

>
> > +}
> > +
> > +static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, struct ls2k_bm=
c_pdata *priv)
> > +{
> > +     int ret;
> > +
> > +     ls2k_bmc_save_pci_data(pdev, priv);
> > +
> > +     INIT_WORK(&priv->reset_work, ls2k_bmc_events_fn);
> > +
> > +     ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrup=
t,
> > +                            IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kb=
mc pcie", priv);
> > +     if (ret) {
> > +             dev_err(priv->dev, "ls2kbmc pcie request_irq(%d) failed\n=
", pdev->irq);
> > +             return ret;
> > +     }
> > +
> > +     return ls2k_bmc_gpio_reset_handler(priv);
> > +}
> > +
> >  /*
> >   * Currently the Loongson-2K0500 BMC hardware does not have an i2c int=
erface to
> >   * adapt to the resolution.
> > @@ -101,12 +330,25 @@ static int ls2k_bmc_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
> >  {
> >       int ret =3D 0;
> >       resource_size_t base;
> > +     struct ls2k_bmc_pdata *priv;
> >       struct simplefb_platform_data pd;
> >
> >       ret =3D pci_enable_device(dev);
> >       if (ret)
> >               return ret;
> >
> > +     priv =3D devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (IS_ERR(priv)) {
> > +             ret =3D -ENOMEM;
> > +             goto disable_pci;
> > +     }
> > +
> > +     priv->dev =3D &dev->dev;
> > +
> > +     ret =3D ls2k_bmc_pdata_initial(dev, priv);
> > +     if (ret)
> > +             goto disable_pci;
> > +
> >       ret =3D ls2k_bmc_get_video_mode(dev, &pd);
> >       if (ret)
> >               goto disable_pci;
> > --
> > 2.47.1
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--
Thanks.
Binbin
