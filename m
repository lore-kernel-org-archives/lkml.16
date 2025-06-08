Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682551E9B22
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749371179; cv=none; b=kLOWPMGsBWIdvl2OuEPeNVRF/TpRYm2c+UfdHVxzgHHRR/FCdQaUDNLqy/SUJH6qIVx3JQqPIJHAgoDuQe3pCj8EIQRkDAXgwPqWmB8fBEg9jKGKUzP6sRrS+3uziFuNurEeyqesmig1L4H4OlqSQzeIz471pHhXpI2Mw4O4V3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749371179; c=relaxed/simple;
	bh=ciKtv5tY3UOml9g4xyAobazuLH8q3T2fCCRzyJqLmvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBU5yHCM1qqkTQia//HGRBRoKix/bFsCcFq1gLonRH9PuLU0wavpzGO9Jy7lT0UcsxGUvTojNNnQzuXWRc6ETqndzRBpTD8KkOZoD7QX2YPyApiDOPDdcHbGhsz7VZLpI4lWHfdC88YXWn7YRI5KCnRKOiVSVX6p06Akdl0hI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VM7GcUDb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VM7GcUDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A15C4CEF9
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749371179;
	bh=ciKtv5tY3UOml9g4xyAobazuLH8q3T2fCCRzyJqLmvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VM7GcUDbeIMoQ6TPItjDBUGgO9/9wd3IBF0H8Xc2wsCcGNR5OadsUxDskqBV+jwGA
	 IOWGPDAZBy68chj4+zZ/mJ5LfFzH6xRWHzkME5IdMN4m9x0XpaRxsKE0CM0DGtOIzp
	 1vaHQ4i6QvLFAQAidUXuRYF7pPYLBCMSXyjlyN+plyuWyNKJPMYxoOXG4CHzbwH1Ea
	 tD+66lbUDW77X0cjMmiPphizSLJqThBCz9MkvZk11ARokECSzMF6MXYSSB8VGQLx04
	 /lfERzmpiXVd+bJ9WSPpoD+XjCJEe2hmFqCkcXOj+34ff2Rea4rhM1byfuPIEOmn4/
	 pO5hcTVbJslNA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so372030a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 01:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhZzBeh9SJfJFWS+gmBYDgF1sqIs/z+J2a4jDM0rOqikCcxN800MPzf3DUloGabWIMvBKnVG669IyTN8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfdJpYxwv1QAAApNeRoH9gnz0ATziF57hVOyDIkHPjIxkKHwB
	c+zAEWfs0tW7dP6A6P8YsfQnl89Lve9O/fEO6aiSgbsR4tHY6jsQ5dQTRRi8Yzf/eo8c7kbFN1b
	TxUNda+j/FTC6z9CdWWW76iPSlOW9MYU=
X-Google-Smtp-Source: AGHT+IH8ywOhyW7It5jOsPSL4IvaGuwYjypnPp+FnZV+koCiiAXJvZdFGqGn7J6NGm3oUNDtoRmQEdibRzR3mg03jYY=
X-Received: by 2002:a05:6402:27d2:b0:602:17a1:c672 with SMTP id
 4fb4d7f45d1cf-60773ec86a5mr7822723a12.8.1749371177276; Sun, 08 Jun 2025
 01:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748505446.git.zhoubinbin@loongson.cn> <54790f0ba91449d140b0f7a5162bdca518bc16d4.1748505446.git.zhoubinbin@loongson.cn>
In-Reply-To: <54790f0ba91449d140b0f7a5162bdca518bc16d4.1748505446.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Jun 2025 16:26:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6r0E5=B+AqYmg7r7=QB3KrRm79ZyniOhZh7CTBvoQe5w@mail.gmail.com>
X-Gm-Features: AX0GCFtq-c4jODyV5cXTEWUnG3uYYQNdCllPfz7n0_hencYchyZxrIGKVFrtU08
Message-ID: <CAAhV-H6r0E5=B+AqYmg7r7=QB3KrRm79ZyniOhZh7CTBvoQe5w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
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
> Since the display is a sub-function of the Loongson-2K BMC, when the
> BMC reset, the entire BMC PCIe is disconnected, including the display
> which is interrupted.
>
> Quick overview of the entire LS2K BMC reset process:
>
> There are two types of reset methods: soft reset (BMC-initiated reboot
> of IPMI reset command) and BMC watchdog reset (watchdog timeout).
>
> First, regardless of the method, an interrupt is generated (PCIe interrup=
t
> for soft reset/GPIO interrupt for watchdog reset);
>
> Second, during the interrupt process, the system enters bmc_reset_work,
> clears the bus/IO/mem resources of the LS7A PCI-E bridge, waits for the B=
MC
> reset to begin, then restores the parent device's PCI configuration space=
,
> waits for the BMC reset to complete, and finally restores the BMC PCI
> configuration space.
>
> Display restoration occurs last.
>
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mfd/ls2kbmc-mfd.c | 326 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 326 insertions(+)
>
> diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
> index 9dbcb5b371f9..d6e5676ad0ab 100644
> --- a/drivers/mfd/ls2kbmc-mfd.c
> +++ b/drivers/mfd/ls2kbmc-mfd.c
> @@ -10,8 +10,12 @@
>   */
>
>  #include <linux/aperture.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/kbd_kern.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/core.h>
>  #include <linux/module.h>
> @@ -19,6 +23,8 @@
>  #include <linux/pci_ids.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/stop_machine.h>
> +#include <linux/vt_kern.h>
>
>  /* LS2K BMC resources */
>  #define LS2K_DISPLAY_RES_START         (SZ_16M + SZ_2M)
> @@ -29,6 +35,44 @@
>  #define LS2K_IPMI3_RES_START           (LS2K_IPMI2_RES_START + LS2K_IPMI=
_RES_SIZE)
>  #define LS2K_IPMI4_RES_START           (LS2K_IPMI3_RES_START + LS2K_IPMI=
_RES_SIZE)
>
> +#define LS7A_PCI_CFG_SIZE              0x100
> +
> +/* LS7A bridge registers */
> +#define LS7A_PCIE_PORT_CTL0            0x0
> +#define LS7A_PCIE_PORT_STS1            0xC
> +#define LS7A_GEN2_CTL                  0x80C
> +#define LS7A_SYMBOL_TIMER              0x71C
> +
> +/* Bits of LS7A_PCIE_PORT_CTL0 */
> +#define LS2K_BMC_PCIE_LTSSM_ENABLE     BIT(3)
> +
> +/* Bits of LS7A_PCIE_PORT_STS1 */
> +#define LS2K_BMC_PCIE_LTSSM_STS                GENMASK(5, 0)
> +
> +/* Bits of LS7A_GEN2_CTL */
> +#define LS7A_GEN2_SPEED_CHANG          BIT(17)
> +#define LS7A_CONF_PHY_TX               BIT(18)
> +
> +/* Bits of LS7A_SYMBOL_TIMER */
> +#define LS7A_MASK_LEN_MATCH            BIT(26)
> +
> +/* Interval between interruptions */
> +#define LS2K_BMC_INT_INTERVAL          (60 * HZ)
> +
> +/* Maximum time to wait for U-Boot and DDR config to be ready with ms. *=
/
> +#define LS2K_BMC_RESET_WAIT_TIME       10000
> +
> +/* It's an experience value */
> +#define LS7A_BAR0_CHECK_MAX_TIMES      2000
> +
> +#define LS2K_BMC_RESET_GPIO            14
> +#define LOONGSON_GPIO_REG_BASE         0x1fe00500
> +#define LOONGSON_GPIO_REG_SIZE         0x18
> +#define LOONGSON_GPIO_OEN              0x0
> +#define LOONGSON_GPIO_FUNC             0x4
> +#define LOONGSON_GPIO_INTPOL           0x10
> +#define LOONGSON_GPIO_INTEN            0x14
> +
>  static struct resource ls2k_display_resources[] =3D {
>         DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-re=
s"),
>  };
> @@ -62,6 +106,275 @@ static struct mfd_cell ls2k_bmc_cells[] =3D {
>         MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
>  };
>
> +/* Index of the bridge PCI configuration space to be restored at BMC res=
et. */
Replacing bridge with parent is a little better to understand.

> +struct ls2k_bmc_bridge_pci_data {
> +       u32 pci_command;
> +       u32 base_address[6];
> +       u32 rom_addreess;
> +       u32 interrupt_line;
> +       u32 msi_hi;
> +       u32 msi_lo;
> +       u32 devctl;
> +       u32 linkcap;
> +       u32 linkctl_sts;
> +       u32 symbol_timer;
> +       u32 gen2_ctrl;
> +};
And from simple to complex, I prefer move ls2k_bmc_bridge_pci_data
after ls2k_bmc_pci_data.

> +
> +/* Index of the BMC PCI configuration space to be restored at BMC reset.=
 */
> +struct ls2k_bmc_pci_data {
> +       u32 pci_command;
> +       u32 base_address0;
> +       u32 interrupt_line;
> +};
> +
> +struct ls2k_bmc_pdata {
> +       struct device *dev;
> +       struct work_struct bmc_reset_work;
> +       struct ls2k_bmc_bridge_pci_data bridge_pci_data;
> +       struct ls2k_bmc_pci_data bmc_pci_data;
Also here.

> +};
> +
> +static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *ppdev)
> +{
> +       u32 addr;
> +
> +       pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
> +
> +       return addr & PCI_BASE_ADDRESS_MEM_MASK ? true : false;
> +}
> +
> +static bool ls2k_bmc_check_pcie_connected(struct pci_dev *parent,
> +                                         struct ls2k_bmc_pdata *priv)
Newline is unnecessary here. And rename the function to
ls2k_bmc_pcie_is_connected() can keep consistency with
ls2k_bmc_bar0_addr_is_set().

> +{
> +       void __iomem *base;
> +       int sts, ret;
> +
> +       base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
> +       if (!base)
> +               return false;
> +
> +       writel(readl(base + LS7A_PCIE_PORT_CTL0) | LS2K_BMC_PCIE_LTSSM_EN=
ABLE,
> +              base + LS7A_PCIE_PORT_CTL0);
Newline is unnecessary here.

> +
> +       ret =3D readl_poll_timeout_atomic(base + LS7A_PCIE_PORT_STS1, sts=
,
> +                                       (sts & LS2K_BMC_PCIE_LTSSM_STS) =
=3D=3D 0x11,
> +                                       1000, 1000000);
Newline is unnecessary here.

> +       if (ret) {
> +               pci_iounmap(parent, base);
> +               dev_err(priv->dev, "PCIE train failed status=3D0x%x\n", s=
ts);
> +               return false;
> +       }
> +
> +       pci_iounmap(parent, base);
> +       return true;
> +}
> +
> +static void ls2k_bmc_restore_bridge_pci_data(struct pci_dev *parent, str=
uct ls2k_bmc_pdata *priv)
> +{
> +       int base, i =3D 0;
> +
> +       pci_write_config_dword(parent, PCI_COMMAND, priv->bridge_pci_data=
.pci_command);
> +
> +       for (base =3D PCI_BASE_ADDRESS_0; base <=3D PCI_BASE_ADDRESS_5; b=
ase +=3D 4, i++)
> +               pci_write_config_dword(parent, base, priv->bridge_pci_dat=
a.base_address[i]);
> +
> +       pci_write_config_dword(parent, PCI_ROM_ADDRESS, priv->bridge_pci_=
data.rom_addreess);
> +       pci_write_config_dword(parent, PCI_INTERRUPT_LINE, priv->bridge_p=
ci_data.interrupt_line);
> +
> +       pci_write_config_dword(parent, parent->msi_cap + PCI_MSI_ADDRESS_=
LO,
> +                              priv->bridge_pci_data.msi_lo);
> +       pci_write_config_dword(parent, parent->msi_cap + PCI_MSI_ADDRESS_=
HI,
> +                              priv->bridge_pci_data.msi_hi);
> +       pci_write_config_dword(parent, parent->pcie_cap + PCI_EXP_DEVCTL,
> +                              priv->bridge_pci_data.devctl);
> +       pci_write_config_dword(parent, parent->pcie_cap + PCI_EXP_LNKCAP,
> +                              priv->bridge_pci_data.linkcap);
> +       pci_write_config_dword(parent, parent->pcie_cap + PCI_EXP_LNKCTL,
> +                              priv->bridge_pci_data.linkctl_sts);
> +
> +       pci_write_config_dword(parent, LS7A_GEN2_CTL, priv->bridge_pci_da=
ta.gen2_ctrl);
> +       pci_write_config_dword(parent, LS7A_SYMBOL_TIMER, priv->bridge_pc=
i_data.symbol_timer);
> +}
> +
> +static int ls2k_bmc_recover_pci_data(void *data)
> +{
> +       struct ls2k_bmc_pdata *priv =3D data;
> +       struct pci_dev *pdev =3D to_pci_dev(priv->dev);
> +       struct pci_dev *parent =3D pdev->bus->self;
> +       u32 i;
> +
> +       /*
> +        * Clear the bus, io and mem resources of the PCI-E bridge to zer=
o, so that
> +        * the processor can not access the LS2K PCI-E port, to avoid cra=
shing due to
> +        * the lack of return signal from accessing the LS2K PCI-E port.
> +        */
> +       pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
> +       pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
> +       pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
> +
> +       /*
> +        * When the LS2K BMC is reset, the LS7A PCI-E port is also reset,=
 and its PCI
> +        * BAR0 register is cleared. Due to the time gap between the GPIO=
 interrupt
> +        * generation and the LS2K BMC reset, the LS7A PCI BAR0 register =
is read to
> +        * determine whether the reset has begun.
> +        */
> +       for (i =3D LS7A_BAR0_CHECK_MAX_TIMES; i > 0 ; i--) {
> +               if (!ls2k_bmc_bar0_addr_is_set(parent))
> +                       break;
> +               mdelay(1);
> +       };
> +
> +       if (i =3D=3D 0)
> +               return false;
> +
> +       ls2k_bmc_restore_bridge_pci_data(parent, priv);
> +
> +       /* Check if PCI-E is connected */
> +       if (!ls2k_bmc_check_pcie_connected(parent, priv))
> +               return false;
> +
> +       /* Waiting for U-Boot and DDR config ready */
> +       mdelay(LS2K_BMC_RESET_WAIT_TIME);
> +       if (!ls2k_bmc_bar0_addr_is_set(parent))
> +               return false;
> +
> +       /* Restore LS2K BMC pci config data */
s/pci/PCI/g

> +       pci_write_config_dword(pdev, PCI_COMMAND, priv->bmc_pci_data.pci_=
command);
> +       pci_write_config_dword(pdev, PCI_BASE_ADDRESS_0, priv->bmc_pci_da=
ta.base_address0);
> +       pci_write_config_dword(pdev, PCI_INTERRUPT_LINE, priv->bmc_pci_da=
ta.interrupt_line);
> +
> +       return 0;
> +}
> +
> +static void ls2k_bmc_events_fn(struct work_struct *work)
> +{
> +       struct ls2k_bmc_pdata *priv =3D container_of(work, struct ls2k_bm=
c_pdata, bmc_reset_work);
> +
> +       /*
> +        * The pcie is lost when the BMC resets, at which point access to=
 the pcie
s/pcie/PCI-E/g

> +        * from other CPUs is suspended to prevent a crash.
> +        */
> +       stop_machine(ls2k_bmc_recover_pci_data, priv, NULL);
> +
> +#ifdef CONFIG_VT
> +       /* Re-push the display due to previous pcie loss. */
> +       set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +#endif
> +}
> +
> +static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> +{
> +       struct ls2k_bmc_pdata *priv =3D arg;
> +       static unsigned long last_jiffies;
> +
> +       if (system_state !=3D SYSTEM_RUNNING)
> +               return IRQ_HANDLED;
> +
> +       /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
> +       if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
> +               schedule_work(&priv->bmc_reset_work);
> +               last_jiffies =3D jiffies;
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/*
> + * Saves the BMC parent device (LS7A) and its own PCI configuration spac=
e registers
> + * that need to be restored after BMC reset.
> + */
> +static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc=
_pdata *priv)
> +{
> +       struct pci_dev *parent =3D pdev->bus->self;
> +       int base, i =3D 0;
> +
> +       pci_read_config_dword(parent, PCI_COMMAND, &priv->bridge_pci_data=
.pci_command);
> +
> +       for (base =3D PCI_BASE_ADDRESS_0; base <=3D PCI_BASE_ADDRESS_5; b=
ase +=3D 4, i++)
> +               pci_read_config_dword(parent, base, &priv->bridge_pci_dat=
a.base_address[i]);
> +
> +       pci_read_config_dword(parent, PCI_ROM_ADDRESS, &priv->bridge_pci_=
data.rom_addreess);
> +       pci_read_config_dword(parent, PCI_INTERRUPT_LINE, &priv->bridge_p=
ci_data.interrupt_line);
> +
> +       pci_read_config_dword(parent, parent->msi_cap + PCI_MSI_ADDRESS_L=
O,
> +                             &priv->bridge_pci_data.msi_lo);
> +       pci_read_config_dword(parent, parent->msi_cap + PCI_MSI_ADDRESS_H=
I,
> +                             &priv->bridge_pci_data.msi_hi);
> +
> +       pci_read_config_dword(parent, parent->pcie_cap + PCI_EXP_DEVCTL,
> +                             &priv->bridge_pci_data.devctl);
> +       pci_read_config_dword(parent, parent->pcie_cap + PCI_EXP_LNKCAP,
> +                             &priv->bridge_pci_data.linkcap);
> +       pci_read_config_dword(parent, parent->pcie_cap + PCI_EXP_LNKCTL,
> +                             &priv->bridge_pci_data.linkctl_sts);
> +
> +       pci_read_config_dword(parent, LS7A_GEN2_CTL, &priv->bridge_pci_da=
ta.gen2_ctrl);
> +       priv->bridge_pci_data.gen2_ctrl |=3D FIELD_PREP(LS7A_GEN2_SPEED_C=
HANG, 0x1)
> +                                        | FIELD_PREP(LS7A_CONF_PHY_TX, 0=
x0);
Newline is unnecessary here.

> +
> +       pci_read_config_dword(parent, LS7A_SYMBOL_TIMER, &priv->bridge_pc=
i_data.symbol_timer);
> +       priv->bridge_pci_data.symbol_timer |=3D LS7A_MASK_LEN_MATCH;
> +
> +       pci_read_config_dword(pdev, PCI_COMMAND, &priv->bmc_pci_data.pci_=
command);
> +       pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &priv->bmc_pci_da=
ta.base_address0);
> +       pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &priv->bmc_pci_da=
ta.interrupt_line);
> +}
> +
> +static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, struct ls2k_bmc_=
pdata *priv)
> +{
> +       int gsi =3D 16 + (LS2K_BMC_RESET_GPIO & 7);
> +       void __iomem *gpio_base;
> +       int irq, ret;
> +
> +       ls2k_bmc_save_pci_data(pdev, priv);
> +
> +       INIT_WORK(&priv->bmc_reset_work, ls2k_bmc_events_fn);
> +
> +       ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrup=
t,
> +                              IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kb=
mc pcie", priv);
> +       if (ret) {
> +               dev_err(priv->dev, "LS2KBMC PCI-E request_irq(%d) failed\=
n", pdev->irq);
> +               return ret;
> +       }
> +
> +       /*
> +        * Since Loongson-3 hardware does not support GPIO interrupt casc=
ade,
> +        * chip->gpio_to_irq() cannot be implemented, here acpi_register_=
gsi() is used
> +        * to get gpio irq.
> +        * The gpio interrupt is a watchdog interrupt that is triggered w=
hen the BMC resets.
s/gpio/GPIO/g


Huacai

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
> +       writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(LS2K_BMC_RESET_=
GPIO),
> +              gpio_base + LOONGSON_GPIO_OEN);
> +       writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(LS2K_BMC_RESE=
T_GPIO),
> +              gpio_base + LOONGSON_GPIO_FUNC);
> +       writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(LS2K_BMC_RE=
SET_GPIO),
> +              gpio_base + LOONGSON_GPIO_INTPOL);
> +       writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(LS2K_BMC_RESE=
T_GPIO),
> +              gpio_base + LOONGSON_GPIO_INTEN);
> +
> +       ret =3D devm_request_irq(priv->dev, irq, ls2k_bmc_interrupt,
> +                              IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kb=
mc gpio", priv);
> +       if (ret)
> +               dev_err(priv->dev, "LS2KBMC GPIO request_irq(%d) failed\n=
", irq);
> +
> +       iounmap(gpio_base);
> +
> +acpi_failed:
> +       acpi_unregister_gsi(gsi);
> +       return ret;
> +}
> +
>  /*
>   * Currently the Loongson-2K BMC hardware does not have an I2C interface=
 to adapt to the
>   * resolution. We set the resolution by presetting "video=3D1280x1024-16=
@2M" to the BMC memory.
> @@ -101,6 +414,7 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, =
struct simplefb_platform_da
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)
>  {
>         struct simplefb_platform_data pd;
> +       struct ls2k_bmc_pdata *priv;
>         resource_size_t base;
>         int ret;
>
> @@ -108,6 +422,18 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const=
 struct pci_device_id *id)
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
>         ret =3D ls2k_bmc_parse_mode(dev, &pd);
>         if (ret)
>                 goto disable_pci;
> --
> 2.47.1
>
>
