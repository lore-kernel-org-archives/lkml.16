Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8561FCCFB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572701; cv=none; b=rcBv+Is1RqBwq+f884iQV9Z3JwWnnu7jboGoG/pDM37Byp2QWJHb+1J8jodVy7RR2HP4uc+f83JIkr7hYXZlcXVt2teK/+Rh8DxoWKUVgnzWML1SAujWOmagyRB0ISgI5zJwQaMmOz5iSns56zOH0Wy3eOOggG0aCdojf8STi0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572701; c=relaxed/simple;
	bh=ooOT2rKH01xRVfhY+LiqQ3NcHKveDaejDZwyLiH3c8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svDRU8A1TxowZOYKKucZq5qcKDJnDuLScz4fN1ikmZ+IBWTJXZMK982mkAobW4DGEOCip3NhSDZFKIVc6WjeuFis2FetGnfJOioBwhGo0VEY271gSDtF4Cr9QFONzCbLhqVYLcVmZtrGZgw17x807ZSJ2rsotind7Tb+FpBf5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=VAawBuQ/; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="VAawBuQ/"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46b1d40ac6bso35427471cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572698; x=1739177498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=za34CkI9FT1rB9oDtYlDukqoAc5AmHLtrlnO18JC4mE=;
        b=VAawBuQ/Issl2K3JgPf+lQDI15527dwg3oiG7YLxnYBM/SHVwt8u39/3RWi5ChGw3W
         kYGktmkRvVbpMozvwAQeGW9DvVK2iut86BIrsXDaQFfcFW542xUl4lV0CPphd5MCSWHw
         c9cAWl+Evy6syUpSNMZe/VVfhsN9DgsbW4py6rSz1JG+fZfd1e9B46i+mfr43hwYbBVE
         g3Qj3hHGPewOkt5IDmfnmlQ1SosKAa3Ed6g8/K4GfMNswdDSjQAU662UnnbhiAjG1+j4
         FXkzpVyjY6lC1L0iLHhnye5P/2IMeHvbL1JWXcjWYmSBUqxxmGzmO3IOG020xg/PGuz0
         DvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572698; x=1739177498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=za34CkI9FT1rB9oDtYlDukqoAc5AmHLtrlnO18JC4mE=;
        b=iPOUm9LCabLuqhRHa+oaU7DsL/WhumD4tTkH/zmo0nOYQ9hFZYP5ma6UeY/7HSTIYf
         1KJcocd//pW6SskUBTLc9BArpfc04aKKmSoUCB4cdc8Ks0LU3T4fOrOf+0GzxCPJZO0N
         4tpXpXvUTWikT8AQRI31nEzWifsQskR94s4yI0LfqdfBKPKBD87UTrm7BIv3eZRBrpNA
         ApuZeWlFgvpgqge8rTJcykbP0VTl1TOVb/2Lg6+9c+9UhWANXo8aWl2kGatTy7hWyD15
         e1aex7Xm/rJptNEUFQ2Ru6TgVDVWXhBtL6ysN79jbGYIwW8W4t+IrJdO54k5HeP8BhXz
         VIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM5mtyvhER5lHZitTJjs/xv0lMmurfHWi6CRrf6Bs9bDZqiKs7SJpX9eT/IUTEleIgWJmdHh7Ya/4b2zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywX4YsBMcYTf0/AVo1hZjlBCfGK4zgTqSlUjkypn2FI4WAM8LA
	OwAYliY+ypP8Z4CtOQZycmNJ/yx85va9u1Xm3PwDWER+2UkrKzsKdpBSsJKdPog=
X-Gm-Gg: ASbGncsHX7lSIsioVyX/ib6iat/QnbAMcITp9tuvmHJLnLlBxVUAExAC1AMOV0OREz3
	4H0JOrzRQOD0KbUXNk8kDvrzp1ABN88uvyLHN2TJkH+34h//UO1uFTXmpbIGknI3ShRQ45SdWxc
	Y6w+JfHR7RLqzMBONycB1jgPqqT+CWcBDckGKuDsZtPpkufoHFYEyYSe1U3vYVzeRBjt5ABIJns
	zzCRgwfLkKJLV35BnVImZUgc0E51weXL0jxhq4YfZVoqtgZTPgXJgLXGmTA3Zjd+F80FXaDqZ32
	IzRNO6i/74sWCzK9wxPBxMxo7vUOCOKv5LGIlywQbK72+YfuwvU0kE4=
X-Google-Smtp-Source: AGHT+IEoObq3l1eHc/KzGX6ro+9oImA6MqQqrEasNZYsOOAQgB+gfdqPDc6JsUyC/VlMlSWe4speGA==
X-Received: by 2002:ac8:5a8d:0:b0:46b:1c07:12c5 with SMTP id d75a77b69052e-46fea0f1ef8mr149763641cf.17.1738572697937;
        Mon, 03 Feb 2025 00:51:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:36 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 11/17] irqchip: Add driver for the RISC-V RPMI system MSI service group
Date: Mon,  3 Feb 2025 14:19:00 +0530
Message-ID: <20250203084906.681418-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPMI specification defines a system MSI service group which
allows application processors to receive MSIs upon system events
such as graceful shutdown/reboot request, CPU hotplug event, memory
hotplug event, etc.

Add an irqchip driver for the RISC-V RPMI system MSI service group
to directly receive system MSIs in Linux kernel.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                    |   7 +
 drivers/irqchip/Makefile                   |   1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c    | 283 +++++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h |  13 +
 4 files changed, 304 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index be063bfb50c4..2ae44354735b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -597,6 +597,13 @@ config RISCV_IMSIC_PCI
 	depends on PCI_MSI
 	default RISCV_IMSIC
 
+config RISCV_RPMI_SYSMSI
+	bool
+	depends on MAILBOX
+	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_MSI_IRQ
+	default RISCV
+
 config SIFIVE_PLIC
 	bool
 	depends on RISCV
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 25e9ad29b8c4..7164aae58b47 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
+obj-$(CONFIG_RISCV_RPMI_SYSMSI)		+= irq-riscv-rpmi-sysmsi.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
 obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
new file mode 100644
index 000000000000..3022f0924c94
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/smp.h>
+
+struct rpmi_sysmsi_get_attrs_rx {
+	s32 status;
+	u32 sys_num_msi;
+	u32 p2a_db_index;
+	u32 flag0;
+	u32 flag1;
+};
+
+#define RPMI_SYSMSI_MSI_ATTRIBUTES_FLAG0_PREF_PRIV	BIT(0)
+
+struct rpmi_sysmsi_set_msi_state_tx {
+	u32 sys_msi_index;
+	u32 sys_msi_state;
+};
+
+struct rpmi_sysmsi_set_msi_state_rx {
+	s32 status;
+};
+
+#define RPMI_SYSMSI_MSI_STATE_ENABLE			BIT(0)
+#define RPMI_SYSMSI_MSI_STATE_PENDING			BIT(1)
+
+struct rpmi_sysmsi_set_msi_target_tx {
+	u32 sys_msi_index;
+	u32 sys_msi_address_low;
+	u32 sys_msi_address_high;
+	u32 sys_msi_data;
+};
+
+struct rpmi_sysmsi_set_msi_target_rx {
+	s32 status;
+};
+
+struct rpmi_sysmsi_priv {
+	struct device *dev;
+	struct mbox_client client;
+	struct mbox_chan *chan;
+	u32 nr_irqs;
+	u32 gsi_base;
+};
+
+static int rpmi_sysmsi_get_num_msi(struct rpmi_sysmsi_priv *priv)
+{
+	struct rpmi_sysmsi_get_attrs_rx rx;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_GET_ATTRIBUTES,
+					  NULL, 0, &rx, sizeof(rx));
+	ret = rpmi_mbox_send_message(priv->chan, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(rx.status);
+
+	return rx.sys_num_msi;
+}
+
+static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
+				     u32 sys_msi_index, u32 sys_msi_state)
+{
+	struct rpmi_sysmsi_set_msi_state_tx tx;
+	struct rpmi_sysmsi_set_msi_state_rx rx;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	tx.sys_msi_index = sys_msi_index;
+	tx.sys_msi_state = sys_msi_state;
+	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_STATE,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	ret = rpmi_mbox_send_message(priv->chan, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(rx.status);
+
+	return 0;
+}
+
+#define rpmi_sysmsi_mask(__priv, __msi_index)		\
+	rpmi_sysmsi_set_msi_state(__priv, __msi_index, 0)
+#define rpmi_sysmsi_unmask(__priv, __msi_index)		\
+	rpmi_sysmsi_set_msi_state(__priv, __msi_index, RPMI_SYSMSI_MSI_STATE_ENABLE)
+
+static int rpmi_sysmsi_set_msi_target(struct rpmi_sysmsi_priv *priv,
+				      u32 sys_msi_index, struct msi_msg *m)
+{
+	struct rpmi_sysmsi_set_msi_target_tx tx;
+	struct rpmi_sysmsi_set_msi_target_rx rx;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	tx.sys_msi_index = sys_msi_index;
+	tx.sys_msi_address_low = m->address_lo;
+	tx.sys_msi_address_high = m->address_hi;
+	tx.sys_msi_data = m->data;
+	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_TARGET,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	ret = rpmi_mbox_send_message(priv->chan, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(rx.status);
+
+	return 0;
+}
+
+static void rpmi_sysmsi_irq_mask(struct irq_data *d)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	ret = rpmi_sysmsi_mask(priv, d->hwirq);
+	if (ret)
+		dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n",
+			 (u32)d->hwirq, ret);
+	irq_chip_mask_parent(d);
+}
+
+static void rpmi_sysmsi_irq_unmask(struct irq_data *d)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	irq_chip_unmask_parent(d);
+	ret = rpmi_sysmsi_unmask(priv, d->hwirq);
+	if (ret)
+		dev_warn(priv->dev, "Failed to unmask hwirq %d (error %d)\n",
+			 (u32)d->hwirq, ret);
+}
+
+static void rpmi_sysmsi_write_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	/* For zeroed MSI, do nothing as of now */
+	if (!msg->address_hi && !msg->address_lo && !msg->data)
+		return;
+
+	ret = rpmi_sysmsi_set_msi_target(priv, d->hwirq, msg);
+	if (ret)
+		dev_warn(priv->dev, "Failed to set target for hwirq %d (error %d)\n",
+			 (u32)d->hwirq, ret);
+}
+
+static void rpmi_sysmsi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
+{
+	arg->desc = desc;
+	arg->hwirq = (u32)desc->data.icookie.value;
+}
+
+static int rpmi_sysmsi_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+				 unsigned long *hwirq, unsigned int *type)
+{
+	struct msi_domain_info *info = d->host_data;
+	struct rpmi_sysmsi_priv *priv = info->data;
+
+	if (WARN_ON(fwspec->param_count < 1))
+		return -EINVAL;
+
+	/* For DT, gsi_base is always zero. */
+	*hwirq = fwspec->param[0] - priv->gsi_base;
+	*type = IRQ_TYPE_NONE;
+	return 0;
+}
+
+static const struct msi_domain_template rpmi_sysmsi_template = {
+	.chip = {
+		.name			= "RPMI-SYSMSI",
+		.irq_mask		= rpmi_sysmsi_irq_mask,
+		.irq_unmask		= rpmi_sysmsi_irq_unmask,
+#ifdef CONFIG_SMP
+		.irq_set_affinity	= irq_chip_set_affinity_parent,
+#endif
+		.irq_write_msi_msg	= rpmi_sysmsi_write_msg,
+		.flags			= IRQCHIP_SET_TYPE_MASKED |
+					  IRQCHIP_SKIP_SET_WAKE |
+					  IRQCHIP_MASK_ON_SUSPEND,
+	},
+
+	.ops = {
+		.set_desc		= rpmi_sysmsi_set_desc,
+		.msi_translate		= rpmi_sysmsi_translate,
+	},
+
+	.info = {
+		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
+		.flags			= MSI_FLAG_USE_DEV_FWNODE,
+		.handler		= handle_simple_irq,
+		.handler_name		= "simple",
+	},
+};
+
+static int rpmi_sysmsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpmi_sysmsi_priv *priv;
+	int rc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	/* Setup mailbox client */
+	priv->client.dev		= priv->dev;
+	priv->client.rx_callback	= NULL;
+	priv->client.tx_block		= false;
+	priv->client.knows_txdone	= true;
+	priv->client.tx_tout		= 0;
+
+	/* Request mailbox channel */
+	priv->chan = mbox_request_channel(&priv->client, 0);
+	if (IS_ERR(priv->chan))
+		return PTR_ERR(priv->chan);
+
+	/* Get number of system MSIs */
+	rc = rpmi_sysmsi_get_num_msi(priv);
+	if (rc < 1) {
+		mbox_free_channel(priv->chan);
+		return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");
+	}
+	priv->nr_irqs = rc;
+
+	/* Set the device MSI domain if not available */
+	if (!dev_get_msi_domain(dev)) {
+		/*
+		 * The device MSI domain for OF devices is only set at the
+		 * time of populating/creating OF device. If the device MSI
+		 * domain is discovered later after the OF device is created
+		 * then we need to set it explicitly before using any platform
+		 * MSI functions.
+		 */
+		if (is_of_node(dev->fwnode))
+			of_msi_configure(dev, to_of_node(dev->fwnode));
+
+		if (!dev_get_msi_domain(dev))
+			return -EPROBE_DEFER;
+	}
+
+	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
+					  &rpmi_sysmsi_template,
+					  priv->nr_irqs, priv, priv))
+		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
+
+	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
+	return 0;
+}
+
+static const struct of_device_id rpmi_sysmsi_match[] = {
+	{ .compatible = "riscv,rpmi-system-msi" },
+	{}
+};
+
+static struct platform_driver rpmi_sysmsi_driver = {
+	.driver = {
+		.name		= "rpmi-sysmsi",
+		.of_match_table	= rpmi_sysmsi_match,
+	},
+	.probe = rpmi_sysmsi_probe,
+};
+builtin_platform_driver(rpmi_sysmsi_driver);
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index f43d0874ad68..9bf3f20c5e70 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -90,6 +90,7 @@ static inline int rpmi_to_linux_error(int rpmi_error)
 }
 
 /** RPMI service group IDs */
+#define RPMI_SRVGRP_SYSTEM_MSI		0x00002
 #define RPMI_SRVGRP_CLOCK		0x00008
 
 /** RPMI clock service IDs */
@@ -105,6 +106,18 @@ enum rpmi_clock_service_id {
 	RPMI_CLK_SRV_ID_MAX_COUNT,
 };
 
+/** RPMI system MSI service IDs */
+enum rpmi_sysmsi_service_id {
+	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_SYSMSI_SRV_GET_ATTRIBUTES = 0x2,
+	RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES = 0x3,
+	RPMI_SYSMSI_SRV_SET_MSI_STATE = 0x4,
+	RPMI_SYSMSI_SRV_GET_MSI_STATE = 0x5,
+	RPMI_SYSMSI_SRV_SET_MSI_TARGET = 0x6,
+	RPMI_SYSMSI_SRV_GET_MSI_TARGET = 0x7,
+	RPMI_SYSMSI_SRV_ID_MAX_COUNT,
+};
+
 /** RPMI linux mailbox attribute IDs */
 enum rpmi_mbox_attribute_id {
 	RPMI_MBOX_ATTR_SPEC_VERSION = 0,
-- 
2.43.0

