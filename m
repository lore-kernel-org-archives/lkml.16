Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0326B774
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856060; cv=none; b=G8j6xhkLcq1AbrTawyKqHL5AXprmW1+RQStOCPwu1hlr+eyaFiQF7HBV7Id8/9+1JXLJjwvHiOSvfFxnymVcLmD2jZjvhSJh8BD3wbQBzklnAncA2K4nEKdRMyiPO1/Rc6TI5Ex6DYYvqfbA/KGvseIRzER6YVAxIFtm7GmLEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856060; c=relaxed/simple;
	bh=4ODlo4NCGapsyQT3x6q33ftK/BJIybrpczdYBg4zG+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNAYQS8CjcQuy+AJMATa96GZVVcXdMu4tlAWxm56lPlYsRz0Hsua+0rosGxkNl7H6DxZ7SClKl5GCaeUdLiGFSCYOIwpiq10wN5tAQr+0wuEtL7fkHYZKVSXHf5ZYIzlXrU76WCDOVnkum4AhvmuutrQV1nBLhObQ6Rp2ENqdC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oaImb+BO; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oaImb+BO"
Message-ID: <0f968b01-b607-46a7-b712-dba4a1b63290@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749856044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qzh0q3kPhCowjX0P+3Cs7CCHVbnsaoKh1I97INlJ1oA=;
	b=oaImb+BOoyPj+TKewR04u7RSfMiPNudSQ+eYJR3N1hcJaFLm2ixS2ZsJVkTgytubIxs/Ao
	m+pXM5/By2yCbPsz7rnFYbS9ar6V1Fw2KTbvPc/qnn/b1wCVeSbVsg657C+uzi6wqjOjJU
	DNo9c2yvdYMuax/GwQBomIqznl5CEEw=
Date: Fri, 13 Jun 2025 16:07:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak
 <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250611062238.636753-13-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 6/10/25 11:22 PM, Anup Patel wrote:
> The RPMI specification defines a system MSI service group which
> allows application processors to receive MSIs upon system events
> such as graceful shutdown/reboot request, CPU hotplug event, memory
> hotplug event, etc.
>
> Add an irqchip driver for the RISC-V RPMI system MSI service group
> to directly receive system MSIs in Linux kernel.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   drivers/irqchip/Kconfig                    |   7 +
>   drivers/irqchip/Makefile                   |   1 +
>   drivers/irqchip/irq-riscv-rpmi-sysmsi.c    | 285 +++++++++++++++++++++
>   include/linux/mailbox/riscv-rpmi-message.h |  13 +
>   4 files changed, 306 insertions(+)
>   create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 0d196e447142..96bf6aa55681 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -617,6 +617,13 @@ config RISCV_IMSIC
>   	select GENERIC_MSI_IRQ
>   	select IRQ_MSI_LIB
>   
> +config RISCV_RPMI_SYSMSI
> +	bool
> +	depends on MAILBOX
> +	select IRQ_DOMAIN_HIERARCHY
> +	select GENERIC_MSI_IRQ
> +	default RISCV
> +
>   config SIFIVE_PLIC
>   	bool
>   	depends on RISCV
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 23ca4959e6ce..4fd966aa78ab 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
>   obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
>   obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
>   obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
> +obj-$(CONFIG_RISCV_RPMI_SYSMSI)		+= irq-riscv-rpmi-sysmsi.o
>   obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
>   obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
>   obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
> diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> new file mode 100644
> index 000000000000..06f64936802a
> --- /dev/null
> +++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2025 Ventana Micro Systems Inc. */
> +
> +#include <linux/bits.h>
> +#include <linux/bug.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
> +#include <linux/dev_printk.h>
> +#include <linux/errno.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +struct rpmi_sysmsi_get_attrs_rx {
> +	__le32 status;
> +	__le32 sys_num_msi;
> +	__le32 flag0;
> +	__le32 flag1;
> +};
> +
> +#define RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV	BIT(0)
> +
> +struct rpmi_sysmsi_set_msi_state_tx {
> +	__le32 sys_msi_index;
> +	__le32 sys_msi_state;
> +};
> +
> +struct rpmi_sysmsi_set_msi_state_rx {
> +	__le32 status;
> +};
> +
> +#define RPMI_SYSMSI_MSI_STATE_ENABLE			BIT(0)
> +#define RPMI_SYSMSI_MSI_STATE_PENDING			BIT(1)
> +
> +struct rpmi_sysmsi_set_msi_target_tx {
> +	__le32 sys_msi_index;
> +	__le32 sys_msi_address_low;
> +	__le32 sys_msi_address_high;
> +	__le32 sys_msi_data;
> +};
> +
> +struct rpmi_sysmsi_set_msi_target_rx {
> +	__le32 status;
> +};
> +
> +struct rpmi_sysmsi_priv {
> +	struct device		*dev;
> +	struct mbox_client	client;
> +	struct mbox_chan	*chan;
> +	u32			nr_irqs;
> +	u32			gsi_base;
> +};
> +
> +static int rpmi_sysmsi_get_num_msi(struct rpmi_sysmsi_priv *priv)
> +{
> +	struct rpmi_sysmsi_get_attrs_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
> +					  NULL, 0, &rx, sizeof(rx));
> +	ret = rpmi_mbox_send_message(priv->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(le32_to_cpu(rx.status));
> +
> +	return le32_to_cpu(rx.sys_num_msi);
> +}
> +
> +static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
> +				     u32 sys_msi_index, u32 sys_msi_state)
> +{
> +	struct rpmi_sysmsi_set_msi_state_tx tx;
> +	struct rpmi_sysmsi_set_msi_state_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.sys_msi_index = cpu_to_le32(sys_msi_index);
> +	tx.sys_msi_state = cpu_to_le32(sys_msi_state);
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_STATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret = rpmi_mbox_send_message(priv->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(le32_to_cpu(rx.status));
> +
> +	return 0;
> +}
> +
> +static int rpmi_sysmsi_set_msi_target(struct rpmi_sysmsi_priv *priv,
> +				      u32 sys_msi_index, struct msi_msg *m)
> +{
> +	struct rpmi_sysmsi_set_msi_target_tx tx;
> +	struct rpmi_sysmsi_set_msi_target_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.sys_msi_index = cpu_to_le32(sys_msi_index);
> +	tx.sys_msi_address_low = cpu_to_le32(m->address_lo);
> +	tx.sys_msi_address_high = cpu_to_le32(m->address_hi);
> +	tx.sys_msi_data = cpu_to_le32(m->data);
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_TARGET,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret = rpmi_mbox_send_message(priv->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(le32_to_cpu(rx.status));
> +
> +	return 0;
> +}
> +
> +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int ret;
> +
> +	ret = rpmi_sysmsi_set_msi_state(priv, hwirq, 0);
> +	if (ret)
> +		dev_warn(priv->dev, "Failed to mask hwirq %lu (error %d)\n", hwirq, ret);
> +	irq_chip_mask_parent(d);
> +}
> +
> +static void rpmi_sysmsi_irq_unmask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int ret;
> +
> +	irq_chip_unmask_parent(d);
> +	ret = rpmi_sysmsi_set_msi_state(priv, hwirq, RPMI_SYSMSI_MSI_STATE_ENABLE);
> +	if (ret)
> +		dev_warn(priv->dev, "Failed to unmask hwirq %lu (error %d)\n", hwirq, ret);
> +}
> +
> +static void rpmi_sysmsi_write_msg(struct irq_data *d, struct msi_msg *msg)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +	int ret;
> +
> +	/* For zeroed MSI, do nothing as of now */
> +	if (!msg->address_hi && !msg->address_lo && !msg->data)
> +		return;
> +
> +	ret = rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
> +	if (ret) {
> +		dev_warn(priv->dev, "Failed to set target for hwirq %lu (error %d)\n",
> +			 hwirq, ret);
> +	}
> +}
> +
> +static void rpmi_sysmsi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
> +{
> +	arg->desc = desc;
> +	arg->hwirq = desc->data.icookie.value;
> +}
> +
> +static int rpmi_sysmsi_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
> +				 unsigned long *hwirq, unsigned int *type)
> +{
> +	struct msi_domain_info *info = d->host_data;
> +	struct rpmi_sysmsi_priv *priv = info->data;
> +
> +	if (WARN_ON(fwspec->param_count < 1))
> +		return -EINVAL;
> +
> +	/* For DT, gsi_base is always zero. */
> +	*hwirq = fwspec->param[0] - priv->gsi_base;
> +	*type = IRQ_TYPE_NONE;

Why do we set the type to IRQ_TYPE_NONE ?
Either we shouldn't care about the type here  or edge type as it is only 
MSI driver.
We also throw a warning for user if the any other irq type is passed in 
msi_translate call back.

> +	return 0;
> +}
> +
> +static const struct msi_domain_template rpmi_sysmsi_template = {
> +	.chip = {
> +		.name			= "RPMI-SYSMSI",
> +		.irq_mask		= rpmi_sysmsi_irq_mask,
> +		.irq_unmask		= rpmi_sysmsi_irq_unmask,
> +#ifdef CONFIG_SMP
> +		.irq_set_affinity	= irq_chip_set_affinity_parent,
> +#endif
> +		.irq_write_msi_msg	= rpmi_sysmsi_write_msg,
> +		.flags			= IRQCHIP_SET_TYPE_MASKED |
> +					  IRQCHIP_SKIP_SET_WAKE |
> +					  IRQCHIP_MASK_ON_SUSPEND,
> +	},
> +
> +	.ops = {
> +		.set_desc		= rpmi_sysmsi_set_desc,
> +		.msi_translate		= rpmi_sysmsi_translate,
> +	},
> +
> +	.info = {
> +		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
> +		.flags			= MSI_FLAG_USE_DEV_FWNODE,
> +		.handler		= handle_simple_irq,
> +		.handler_name		= "simple",
> +	},
> +};
> +
> +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpmi_sysmsi_priv *priv;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = dev;
> +
> +	/* Setup mailbox client */
> +	priv->client.dev		= priv->dev;
> +	priv->client.rx_callback	= NULL;
> +	priv->client.tx_block		= false;
> +	priv->client.knows_txdone	= true;
> +	priv->client.tx_tout		= 0;
> +
> +	/* Request mailbox channel */
> +	priv->chan = mbox_request_channel(&priv->client, 0);
> +	if (IS_ERR(priv->chan))
> +		return PTR_ERR(priv->chan);
> +
> +	/* Get number of system MSIs */
> +	rc = rpmi_sysmsi_get_num_msi(priv);
> +	if (rc < 1) {
> +		mbox_free_channel(priv->chan);
> +		if (rc)
> +			return dev_err_probe(dev, rc, "Failed to get number of system MSIs\n");
> +		else
> +			return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");
> +	}
> +	priv->nr_irqs = rc;
> +
> +	/* Set the device MSI domain if not available */
> +	if (!dev_get_msi_domain(dev)) {
> +		/*
> +		 * The device MSI domain for OF devices is only set at the
> +		 * time of populating/creating OF device. If the device MSI
> +		 * domain is discovered later after the OF device is created
> +		 * then we need to set it explicitly before using any platform
> +		 * MSI functions.
> +		 */
> +		if (dev_of_node(dev))
> +			of_msi_configure(dev, dev_of_node(dev));
> +
> +		if (!dev_get_msi_domain(dev)) {
> +			mbox_free_channel(priv->chan);
> +			return -EPROBE_DEFER;
> +		}
> +	}
> +
> +	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> +					  &rpmi_sysmsi_template,
> +					  priv->nr_irqs, priv, priv)) {
> +		mbox_free_channel(priv->chan);
> +		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
> +	}
> +
> +	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
> +	return 0;
> +}
> +
> +static const struct of_device_id rpmi_sysmsi_match[] = {
> +	{ .compatible = "riscv,rpmi-system-msi" },
> +	{}
> +};
> +
> +static struct platform_driver rpmi_sysmsi_driver = {
> +	.driver = {
> +		.name		= "rpmi-sysmsi",
> +		.of_match_table	= rpmi_sysmsi_match,
> +	},
> +	.probe = rpmi_sysmsi_probe,
> +};
> +builtin_platform_driver(rpmi_sysmsi_driver);
> diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
> index 476a2d64d972..06d2f8b38969 100644
> --- a/include/linux/mailbox/riscv-rpmi-message.h
> +++ b/include/linux/mailbox/riscv-rpmi-message.h
> @@ -91,6 +91,7 @@ static inline int rpmi_to_linux_error(int rpmi_error)
>   }
>   
>   /* RPMI service group IDs */
> +#define RPMI_SRVGRP_SYSTEM_MSI		0x00002
>   #define RPMI_SRVGRP_CLOCK		0x00008
>   
>   /* RPMI clock service IDs */
> @@ -106,6 +107,18 @@ enum rpmi_clock_service_id {
>   	RPMI_CLK_SRV_ID_MAX_COUNT
>   };
>   
> +/* RPMI system MSI service IDs */
> +enum rpmi_sysmsi_service_id {
> +	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
> +	RPMI_SYSMSI_SRV_GET_ATTRIBUTES = 0x02,
> +	RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES = 0x03,
> +	RPMI_SYSMSI_SRV_SET_MSI_STATE = 0x04,
> +	RPMI_SYSMSI_SRV_GET_MSI_STATE = 0x05,
> +	RPMI_SYSMSI_SRV_SET_MSI_TARGET = 0x06,
> +	RPMI_SYSMSI_SRV_GET_MSI_TARGET = 0x07,
> +	RPMI_SYSMSI_SRV_ID_MAX_COUNT
> +};
> +
>   /* RPMI Linux mailbox attribute IDs */
>   enum rpmi_mbox_attribute_id {
>   	RPMI_MBOX_ATTR_SPEC_VERSION,
