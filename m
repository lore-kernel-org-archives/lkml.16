Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F2D149C6F;
	Thu, 22 May 2025 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906764; cv=none; b=C5Mn7o7G6Zdbsq+d7n04YmDj6rARZXL7BzEA3HFXjVbtOAbJ2+fPDK196hJ2yppnCGLE1Rqs1zg6EJpwzi//Wq8aUpTfvIWeWsBgRbq6j5rEZCkilIioixFVWdF1EZNJFEQsArZ68SqvpWXojfmfOt4Nd2NVWcwCt+flYSafzfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906764; c=relaxed/simple;
	bh=XkUZaXEuPJjOE4XtfYmseHhoW1SLXX358nT2uRh33e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtB3aXzNrW0oiiybWGZmAcfydGNo8I0YzECXRUhWLpLs5HA4bXEYYZhs1ydCS7tVaj9HDsV9/8Q26QlkpD7pAxugxtQiNKGJ/qaDPlbvR3H+2pCNcmozDJcnhQ12UJDMD8TzvH3DEEkIT+6UEbgege2UE6kjGObFdut78Dd31IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHXobV7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHXobV7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2542C4CEE4;
	Thu, 22 May 2025 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747906763;
	bh=XkUZaXEuPJjOE4XtfYmseHhoW1SLXX358nT2uRh33e8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHXobV7YpmPmy46EYlhTqrWdgTfepm5NctySwrSYD86AusvWhOcKaXJOjIc51xffe
	 HAMWAF6gpAYuRrioR9gyLMmDXCWEbWzeigKtb4hgK5mhidhrAm6p6aon/PL4x3xvJJ
	 unLUadQqDkoC8TDSrfFRqv9OxEs2E9C7TjipTuP3tSc65RZ7RMfO7FVs78u57jK3yl
	 04uQ5L28oNXiiE+olO2kQ2dlwZgbNBamWBjEkocOFiKQP7ooqrj/g54Pk+agMw3cj5
	 dkfUiH/Xk+f/4p8vBk1rQasMjKSz/H6VYekyZ3oh/mSIEFZul6K2d9scXpH03emvF0
	 9qcVE9iZoz8iA==
Date: Thu, 22 May 2025 10:39:19 +0100
From: Lee Jones <lee@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v2 3/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function
 support
Message-ID: <20250522093919.GC1199143@google.com>
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
 <eff0c02e30118c45463f4b6488c895bf3ec9edb9.1747276047.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eff0c02e30118c45463f4b6488c895bf3ec9edb9.1747276047.git.zhoubinbin@loongson.cn>

On Thu, 15 May 2025, Binbin Zhou wrote:

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
>  #define LS2K_IPMI_RES_SIZE	0x1c
> @@ -27,6 +32,9 @@
>  #define LS2K_IPMI3_RES_START	(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
>  #define LS2K_IPMI4_RES_START	(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
>  
> +#define LS2K_BMC_RESET_DELAY	(60 * HZ)
> +#define LS2K_BMC_RESET_WAIT	(10 * HZ)
> +
>  static struct resource ls2k_display_resources[] = {
>  	DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-res"),
>  };
> @@ -60,6 +68,227 @@ static struct mfd_cell ls2k_bmc_cells[] = {
>  	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
>  };
>  
> +static const u32 index[] = { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24,
> +			     0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
> +static const u32 cindex[] = { 0x4, 0x10, 0x3c };

What are these?  You need to define them or at least provide a comment
that describes what they are and how they're used.

> +struct ls2k_bmc_pci_data {
> +	u32 d80c;
> +	u32 d71c;
> +	u32 data[14];
> +	u32 cdata[3];

To the uninitiated, this is all gibberish.

Either change the nomenclature or provide commentary.

> +};
> +
> +struct ls2k_bmc_pdata {
> +	struct device *dev;
> +	struct work_struct reset_work;
> +	unsigned long reset_time;

This always appears to be jiffies - is it used elsewhere?

> +	struct ls2k_bmc_pci_data pci_data;
> +};
> +
> +static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *ppdev)
> +{
> +	u32 addr;
> +
> +	pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
> +	addr &= PCI_BASE_ADDRESS_MEM_MASK;
> +
> +	return addr ? true : false;
> +}
> +
> +static bool ls2k_bmc_check_pcie_connected(struct pci_dev *parent,
> +					  struct ls2k_bmc_pdata *priv)
> +{
> +	void __iomem *mmio;
> +	int sts, ret;
> +
> +	mmio = pci_iomap(parent, 0, 0x100);

Why 0x100?  This should be defined.

> +	if (!mmio)
> +		return false;
> +
> +	writel(readl(mmio) | 0x8, mmio);
> +
> +	ret = readl_poll_timeout_atomic(mmio + 0xc, sts, (sts & 0x11) == 0x11,
> +					1000, 1000000);
> +	if (ret) {

All of the magic numbers in this function should be defined.

> +		pci_iounmap(parent, mmio);
> +		dev_err(priv->dev, "PCIE train failed status=0x%x\n", sts);
> +		return false;
> +	}
> +
> +	pci_iounmap(parent, mmio);
> +	return true;
> +}
> +
> +static int ls2k_bmc_recover_pci_data(void *data)
> +{
> +	struct ls2k_bmc_pdata *priv = data;
> +	struct pci_dev *pdev = to_pci_dev(priv->dev);
> +	struct pci_dev *parent = pdev->bus->self;
> +	bool ready, dirty;
> +	u32 i;
> +
> +	pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
> +	pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
> +	pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);

You need to provide commentary throughout this driver!

> +
> +	for (i = 2000; i > 0 ; i--) {

Why 2000?  Please define and explain it.

> +		dirty = ls2k_bmc_bar0_addr_is_set(parent);

Since these are bools, you can put the function in an if() statement.

> +		if (!dirty)
> +			break;
> +		mdelay(1);

Why?  What are we waiting for?

> +	};
> +
> +	if (i == 0)
> +		dev_warn(priv->dev, "The PCI Bar is not cleared.\n");

But it's okay to continue?  Why?

> +	for (i = 0; i < ARRAY_SIZE(index); i++)
> +		pci_write_config_dword(parent, index[i], priv->pci_data.data[i]);
> +
> +	pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
> +	pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
> +
> +	/* Check if the pcie is connected */

PCI-E

> +	ready = ls2k_bmc_check_pcie_connected(parent, priv);

As above.

> +	if (!ready)
> +		return ready;
> +
> +	dev_dbg(priv->dev, "The PCIE recovered done.\n");

How useful is this once development is complete?

> +	/* Waiting for u-boot ddr config ready */

Will it always be U-Boot?

Should be "U-Boot" and "DDR".

> +	mdelay(jiffies_to_msecs(LS2K_BMC_RESET_WAIT));

Why not define the value in ms already?

> +	ready = ls2k_bmc_bar0_addr_is_set(parent);

As above.

> +	if (!ready)
> +		return ready;
> +
> +	for (i = 0; i < ARRAY_SIZE(cindex); i++)
> +		pci_write_config_dword(pdev, cindex[i], priv->pci_data.cdata[i]);
> +
> +	return 0;
> +}
> +
> +static void ls2k_bmc_events_fn(struct work_struct *work)
> +{
> +	struct ls2k_bmc_pdata *priv = container_of(work, struct ls2k_bmc_pdata, reset_work);
> +
> +	/*
> +	 * The pcie is lost when the BMC resets,

Strange line-breaks.  Pick a limit (80-100, etc) and stick to it.

> +	 * at which point access to the pcie from other CPUs
> +	 * is suspended to prevent a crash.
> +	 */
> +	stop_machine(ls2k_bmc_recover_pci_data, priv, NULL);
> +
> +#ifdef CONFIG_VT

No avoidable #ifery in C-files please.

> +	/* Re-push the display due to previous pcie loss. */
> +	set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +#endif
> +
> +	dev_info(priv->dev, "Loongson-2K BMC recovered done.\n");

Remove this line - we want clean bootlogs.

> +}
> +
> +static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> +{
> +	struct ls2k_bmc_pdata *priv = arg;
> +
> +	if (system_state != SYSTEM_RUNNING)
> +		return IRQ_HANDLED;
> +
> +	/* Skip interrupt in LS2K_BMC_RESET_DELAY */
> +	if (time_after(jiffies, priv->reset_time + LS2K_BMC_RESET_DELAY))
> +		schedule_work(&priv->reset_work);
> +
> +	priv->reset_time = jiffies;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +#define BMC_RESET_GPIO			14
> +#define LOONGSON_GPIO_REG_BASE		0x1fe00500
> +#define LOONGSON_GPIO_REG_SIZE		0x18
> +#define LOONGSON_GPIO_OEN		0x0
> +#define LOONGSON_GPIO_FUNC		0x4
> +#define LOONGSON_GPIO_INTPOL		0x10
> +#define LOONGSON_GPIO_INTEN		0x14

Put these up with the reset of the defines.

> +/* The gpio interrupt is a watchdog interrupt that is triggered when the BMC resets. */
> +static int ls2k_bmc_gpio_reset_handler(struct ls2k_bmc_pdata *priv)

Why are we now doing GPIO things in here?  Why not a GPIO driver?

> +{
> +	int gsi = 16 + (BMC_RESET_GPIO & 7);
> +	void __iomem *gpio_base;
> +	int irq, ret = 0;
> +
> +	/* Since Loongson-3A hardware does not support GPIO interrupt cascade,
> +	 * chip->gpio_to_irq() cannot be implemented,
> +	 * here acpi_register_gsi() is used to get gpio irq.
> +	 */

Use proper multi-line commentary as per the Coding Style documentation.

> +	irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
> +	if (irq < 0)
> +		return irq;
> +
> +	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
> +	if (!gpio_base) {
> +		ret = PTR_ERR(gpio_base);
> +		goto acpi_failed;
> +	}
> +
> +	writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_OEN);
> +	writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_FUNC);
> +	writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_INTPOL);
> +	writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPIO),
> +	       gpio_base + LOONGSON_GPIO_INTEN);
> +
> +	ret = devm_request_irq(priv->dev, irq, ls2k_bmc_interrupt,
> +			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", priv);
> +	if (ret)
> +		dev_err(priv->dev, "ls2kbmc gpio request_irq(%d) failed\n", irq);

"LS2KBMC" and "GPIO", etc.

> +
> +	iounmap(gpio_base);
> +
> +acpi_failed:
> +	acpi_unregister_gsi(gsi);
> +
> +	return ret;
> +}
> +
> +static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_pdata *priv)
> +{
> +	struct pci_dev *parent = pdev->bus->self;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(index); i++)
> +		pci_read_config_dword(parent, index[i], &priv->pci_data.data[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(cindex); i++)
> +		pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cdata[i]);
> +
> +	pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
> +	priv->pci_data.d80c = (priv->pci_data.d80c & ~(3 << 17)) | BIT(17);
> +
> +	pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
> +	priv->pci_data.d71c |= BIT(26);

No magic numbers please.  Define them all.

> +}
> +
> +static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, struct ls2k_bmc_pdata *priv)
> +{
> +	int ret;
> +
> +	ls2k_bmc_save_pci_data(pdev, priv);
> +
> +	INIT_WORK(&priv->reset_work, ls2k_bmc_events_fn);
> +
> +	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
> +			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", priv);
> +	if (ret) {
> +		dev_err(priv->dev, "ls2kbmc pcie request_irq(%d) failed\n", pdev->irq);
> +		return ret;
> +	}
> +
> +	return ls2k_bmc_gpio_reset_handler(priv);
> +}
> +
>  /*
>   * Currently the Loongson-2K0500 BMC hardware does not have an i2c interface to
>   * adapt to the resolution.
> @@ -101,12 +330,25 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	int ret = 0;
>  	resource_size_t base;
> +	struct ls2k_bmc_pdata *priv;
>  	struct simplefb_platform_data pd;
>  
>  	ret = pci_enable_device(dev);
>  	if (ret)
>  		return ret;
>  
> +	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (IS_ERR(priv)) {
> +		ret = -ENOMEM;
> +		goto disable_pci;
> +	}
> +
> +	priv->dev = &dev->dev;
> +
> +	ret = ls2k_bmc_pdata_initial(dev, priv);
> +	if (ret)
> +		goto disable_pci;
> +
>  	ret = ls2k_bmc_get_video_mode(dev, &pd);
>  	if (ret)
>  		goto disable_pci;
> -- 
> 2.47.1
> 

-- 
Lee Jones [李琼斯]
