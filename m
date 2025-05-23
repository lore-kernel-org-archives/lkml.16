Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB9B220F4F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985229; cv=none; b=fMDKFNkm9vsjtaa2ikEIWWcei+JHQlZQv3gUybAefNBZ746ruK7gxyyF3+AYAV7aRFnsidRP8OYI+fGbddB7SVs6Ckldnmv/NRzOyxOo2apCCKfl4lUK0+c/nJwqWsbXqzKKi2ltJ7quJGL/CDkPGMMstYHfIksaG+JwXppYA+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985229; c=relaxed/simple;
	bh=Z/l7ToxGpCTkXxBI0uuJX+Lg2l3QGNfUGbJ+bY5ub5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oh3546Cfr8yYZNzYfJjXLO7OKbeWFO5JFCMlURNkfEIjhTpHDC8IogsI+DbytdGhsZ9P1pQ5hob6O4rzc/GPJWAmkv/vswoySxeUXqmzlXzWcPSwllA3wwsAItND94htcuOq9YQnfKtne1lJEiejEIWvP/6uqNVvZomg8sEw/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDjJHWW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDjJHWW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1F2C4CEF3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747985228;
	bh=Z/l7ToxGpCTkXxBI0uuJX+Lg2l3QGNfUGbJ+bY5ub5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mDjJHWW+xYJpD+KazjOR8KLhe3vj9Pa2bTGiREI4dfCEXxaGAdwjDrDB9yVQHu/fy
	 GI9yVk2RDM+QDBWKioX5/AIAcVVCJEJ32mukhhHxzN81aj/aHkiWRKNgOE/MShdgIH
	 li4RN3T478sEIe6+W0wsELRNWOwQzeKffNiASl5+/xG24lE5H3l8EtmsqfiKjNpg3E
	 2l/uiIVP/BmV7Q1GLse6nldx3yLInK3s9khByW/L4rTM0gcDPdqkAJeK6TwmdQ2nmP
	 pE8eAL93WNXfFeOmfgehGsSFdo8lnJw5OivIWOBfSgclu24XfWnoO+sRiFJWHBQHwd
	 E2AMc9hqr7S4g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6016d401501so12302235a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:27:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXpFydIfLMBvzqghQTFhCmiMgA6vLUtoI/kDSlTJIhRlLoKmrRxQs+1Y1cICB/0dCwoPz2glf8z/dR+gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PGx2ky3V/Ww5SGc2pQ681z9UmdcZ73ipZU5JC56Z1YtBDpsb
	KSVdy+UOhSsH4r06ozulIZPwtoaUukK5mN0n5xSKY8kEVSWrd92sk0T6IMsuUow0FXKbWe1NL2n
	EOj1UgTzPT8qBsPxnC1hmrZAGHR5zgHE=
X-Google-Smtp-Source: AGHT+IHQnuY9HROjlnDm7vS12apb64c4BxIGvliJw2D2sqQ8ZPiGfxgitA9Lq7A+l3j0hMKlJwInferOzBY88kS0kxo=
X-Received: by 2002:a05:6402:50d4:b0:5fb:ad3c:cee9 with SMTP id
 4fb4d7f45d1cf-602916118a7mr1816329a12.28.1747985227277; Fri, 23 May 2025
 00:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn> <eff0c02e30118c45463f4b6488c895bf3ec9edb9.1747276047.git.zhoubinbin@loongson.cn>
In-Reply-To: <eff0c02e30118c45463f4b6488c895bf3ec9edb9.1747276047.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 23 May 2025 15:26:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H611AP6HM+5oFw_W1AufnStixDAL7zbYaw0j-6kbNLxkg@mail.gmail.com>
X-Gm-Features: AX0GCFt3blzFRD6FpQd1Ke-1eOOtRrgqGQ-aF4gGbdtAybKC1uAYxjdPiA_kzI8
Message-ID: <CAAhV-H611AP6HM+5oFw_W1AufnStixDAL7zbYaw0j-6kbNLxkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
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
> Since the display is a sub-function of the Loongson-2K BMC, when the
> BMC reset, the entire BMC PCIe is disconnected, including the display
> which is interrupted.
>
> Not only do you need to save/restore the relevant PCIe registers
> throughout the reset process, but you also need to re-push the display
> to the monitor at the end.
>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mfd/ls2kbmc-mfd.c | 242 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 242 insertions(+)
>
> diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> index b309f6132c24..4d35a13b3da5 100644
> --- a/drivers/mfd/ls2kbmc-mfd.c
> +++ b/drivers/mfd/ls2kbmc-mfd.c
> @@ -9,8 +9,11 @@
>   */
>
>  #include <linux/aperture.h>
> +#include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/kbd_kern.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/core.h>
>  #include <linux/module.h>
> @@ -18,6 +21,8 @@
>  #include <linux/pci_ids.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/stop_machine.h>
> +#include <linux/vt_kern.h>
>
>  #define LS2K_DISPLAY_RES_START (SZ_16M + SZ_2M)
>  #define LS2K_IPMI_RES_SIZE     0x1c
> @@ -27,6 +32,9 @@
>  #define LS2K_IPMI3_RES_START   (LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZ=
E)
>  #define LS2K_IPMI4_RES_START   (LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZ=
E)
>
> +#define LS2K_BMC_RESET_DELAY   (60 * HZ)
> +#define LS2K_BMC_RESET_WAIT    (10 * HZ)
> +
>  static struct resource ls2k_display_resources[] =3D {
>         DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-re=
s"),
>  };
> @@ -60,6 +68,227 @@ static struct mfd_cell ls2k_bmc_cells[] =3D {
>         MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
>  };
>
> +static const u32 index[] =3D { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24,
> +                            0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
> +static const u32 cindex[] =3D { 0x4, 0x10, 0x3c };
> +
> +struct ls2k_bmc_pci_data {
> +       u32 d80c;
> +       u32 d71c;
> +       u32 data[14];
> +       u32 cdata[3];
> +};
> +
> +struct ls2k_bmc_pdata {
> +       struct device *dev;
> +       struct work_struct reset_work;
> +       unsigned long reset_time;
> +       struct ls2k_bmc_pci_data pci_data;
> +};
> +
> +static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *ppdev)
> +{
> +       u32 addr;
> +
> +       pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
> +       addr &=3D PCI_BASE_ADDRESS_MEM_MASK;
> +
> +       return addr ? true : false;
> +}
> +
> +static bool ls2k_bmc_check_pcie_connected(struct pci_dev *parent,
> +                                         struct ls2k_bmc_pdata *priv)
> +{
> +       void __iomem *mmio;
> +       int sts, ret;
> +
> +       mmio =3D pci_iomap(parent, 0, 0x100);
> +       if (!mmio)
> +               return false;
> +
> +       writel(readl(mmio) | 0x8, mmio);
> +
> +       ret =3D readl_poll_timeout_atomic(mmio + 0xc, sts, (sts & 0x11) =
=3D=3D 0x11,
> +                                       1000, 1000000);
> +       if (ret) {
> +               pci_iounmap(parent, mmio);
> +               dev_err(priv->dev, "PCIE train failed status=3D0x%x\n", s=
ts);
> +               return false;
> +       }
> +
> +       pci_iounmap(parent, mmio);
> +       return true;
> +}
> +
> +static int ls2k_bmc_recover_pci_data(void *data)
> +{
> +       struct ls2k_bmc_pdata *priv =3D data;
> +       struct pci_dev *pdev =3D to_pci_dev(priv->dev);
> +       struct pci_dev *parent =3D pdev->bus->self;
> +       bool ready, dirty;
> +       u32 i;
> +
> +       pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
> +       pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
> +       pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
> +
> +       for (i =3D 2000; i > 0 ; i--) {
> +               dirty =3D ls2k_bmc_bar0_addr_is_set(parent);
> +               if (!dirty)
> +                       break;
> +               mdelay(1);
> +       };
> +
> +       if (i =3D=3D 0)
> +               dev_warn(priv->dev, "The PCI Bar is not cleared.\n");
> +
> +       for (i =3D 0; i < ARRAY_SIZE(index); i++)
> +               pci_write_config_dword(parent, index[i], priv->pci_data.d=
ata[i]);
> +
> +       pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
> +       pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
> +
> +       /* Check if the pcie is connected */
> +       ready =3D ls2k_bmc_check_pcie_connected(parent, priv);
> +       if (!ready)
> +               return ready;
> +
> +       dev_dbg(priv->dev, "The PCIE recovered done.\n");
> +
> +       /* Waiting for u-boot ddr config ready */
> +       mdelay(jiffies_to_msecs(LS2K_BMC_RESET_WAIT));
> +       ready =3D ls2k_bmc_bar0_addr_is_set(parent);
> +       if (!ready)
> +               return ready;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cindex); i++)
> +               pci_write_config_dword(pdev, cindex[i], priv->pci_data.cd=
ata[i]);
> +
> +       return 0;
> +}
> +
> +static void ls2k_bmc_events_fn(struct work_struct *work)
> +{
> +       struct ls2k_bmc_pdata *priv =3D container_of(work, struct ls2k_bm=
c_pdata, reset_work);
> +
> +       /*
> +        * The pcie is lost when the BMC resets,
> +        * at which point access to the pcie from other CPUs
> +        * is suspended to prevent a crash.
> +        */
> +       stop_machine(ls2k_bmc_recover_pci_data, priv, NULL);
> +
> +#ifdef CONFIG_VT
> +       /* Re-push the display due to previous pcie loss. */
> +       set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +#endif
> +
> +       dev_info(priv->dev, "Loongson-2K BMC recovered done.\n");
> +}
> +
> +static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> +{
> +       struct ls2k_bmc_pdata *priv =3D arg;
> +
> +       if (system_state !=3D SYSTEM_RUNNING)
> +               return IRQ_HANDLED;
> +
> +       /* Skip interrupt in LS2K_BMC_RESET_DELAY */
> +       if (time_after(jiffies, priv->reset_time + LS2K_BMC_RESET_DELAY))
> +               schedule_work(&priv->reset_work);
> +
> +       priv->reset_time =3D jiffies;
> +
> +       return IRQ_HANDLED;
> +}
> +
> +#define BMC_RESET_GPIO                 14
> +#define LOONGSON_GPIO_REG_BASE         0x1fe00500
> +#define LOONGSON_GPIO_REG_SIZE         0x18
> +#define LOONGSON_GPIO_OEN              0x0
> +#define LOONGSON_GPIO_FUNC             0x4
> +#define LOONGSON_GPIO_INTPOL           0x10
> +#define LOONGSON_GPIO_INTEN            0x14
> +
> +/* The gpio interrupt is a watchdog interrupt that is triggered when the=
 BMC resets. */
> +static int ls2k_bmc_gpio_reset_handler(struct ls2k_bmc_pdata *priv)
> +{
> +       int gsi =3D 16 + (BMC_RESET_GPIO & 7);
> +       void __iomem *gpio_base;
> +       int irq, ret =3D 0;
> +
> +       /* Since Loongson-3A hardware does not support GPIO interrupt cas=
cade,
Loongson-3A here should be Loongson-3 or Loongson.

> +        * chip->gpio_to_irq() cannot be implemented,
> +        * here acpi_register_gsi() is used to get gpio irq.
> +        */
> +       irq =3D acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_AC=
TIVE_LOW);
> +       if (irq < 0)
> +               return irq;
> +
> +       gpio_base =3D ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_S=
IZE);
> +       if (!gpio_base) {
> +               ret =3D PTR_ERR(gpio_base);
> +               goto acpi_failed;
> +       }
> +
> +       writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO)=
,
> +              gpio_base + LOONGSON_GPIO_OEN);
> +       writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPI=
O),
> +              gpio_base + LOONGSON_GPIO_FUNC);
> +       writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_G=
PIO),
> +              gpio_base + LOONGSON_GPIO_INTPOL);
> +       writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPI=
O),
> +              gpio_base + LOONGSON_GPIO_INTEN);
> +
> +       ret =3D devm_request_irq(priv->dev, irq, ls2k_bmc_interrupt,
> +                              IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kb=
mc gpio", priv);
> +       if (ret)
> +               dev_err(priv->dev, "ls2kbmc gpio request_irq(%d) failed\n=
", irq);
> +
> +       iounmap(gpio_base);
> +
> +acpi_failed:
> +       acpi_unregister_gsi(gsi);
> +
> +       return ret;
> +}
I prefer to inline the ls2k_bmc_gpio_reset_handler() function to
ls2k_bmc_pdata_initial(), or at least move it after
ls2k_bmc_save_pci_data().


Huacai

> +
> +static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc=
_pdata *priv)
> +{
> +       struct pci_dev *parent =3D pdev->bus->self;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(index); i++)
> +               pci_read_config_dword(parent, index[i], &priv->pci_data.d=
ata[i]);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cindex); i++)
> +               pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cd=
ata[i]);
> +
> +       pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
> +       priv->pci_data.d80c =3D (priv->pci_data.d80c & ~(3 << 17)) | BIT(=
17);
> +
> +       pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
> +       priv->pci_data.d71c |=3D BIT(26);
> +}
> +
> +static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, struct ls2k_bmc_=
pdata *priv)
> +{
> +       int ret;
> +
> +       ls2k_bmc_save_pci_data(pdev, priv);
> +
> +       INIT_WORK(&priv->reset_work, ls2k_bmc_events_fn);
> +
> +       ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrup=
t,
> +                              IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kb=
mc pcie", priv);
> +       if (ret) {
> +               dev_err(priv->dev, "ls2kbmc pcie request_irq(%d) failed\n=
", pdev->irq);
> +               return ret;
> +       }
> +
> +       return ls2k_bmc_gpio_reset_handler(priv);
> +}
> +
>  /*
>   * Currently the Loongson-2K0500 BMC hardware does not have an i2c inter=
face to
>   * adapt to the resolution.
> @@ -101,12 +330,25 @@ static int ls2k_bmc_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
>  {
>         int ret =3D 0;
>         resource_size_t base;
> +       struct ls2k_bmc_pdata *priv;
>         struct simplefb_platform_data pd;
>
>         ret =3D pci_enable_device(dev);
>         if (ret)
>                 return ret;
>
> +       priv =3D devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (IS_ERR(priv)) {
> +               ret =3D -ENOMEM;
> +               goto disable_pci;
> +       }
> +
> +       priv->dev =3D &dev->dev;
> +
> +       ret =3D ls2k_bmc_pdata_initial(dev, priv);
> +       if (ret)
> +               goto disable_pci;
> +
>         ret =3D ls2k_bmc_get_video_mode(dev, &pd);
>         if (ret)
>                 goto disable_pci;
> --
> 2.47.1
>
