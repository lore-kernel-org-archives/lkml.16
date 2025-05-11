Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD7256C9E
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970917; cv=none; b=Nu1TXSYvO9vBK9Xm2GK4y/SixfC6tCBTDdffNKH1mTCNxkXbRBZW46TCpzCSKzKnjwuVsh0j7yrB37vUQkfqk+3mIdpsNGKJyJh02EtW7rSyIv9c689/x/hkYi0ErF1kP2/e+slfqgVPljzNswIL2HcNyqQ4FljpBJxNanWXpTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970917; c=relaxed/simple;
	bh=/9SgN8MNDz2o8DvnneB6AUDwjLnGYO40Cq4fTsr/BMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKIxUgDt55NYpVRxCGfZAki473Yf2ILF2BhWwCiBz29mMxGIfkz6eyez8DBB7r69bnKAId6WZ8UZcwss8o+2MQYYzYtvZgO8NBY14Sm/Cc15W+TTe5puvii/5U3bL2rLP17VMCZOlVLIanmhqlAu3rO9iUHL0TKUgWoTi6Y7XxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pRHWm4AB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pRHWm4AB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e8461d872so33909465ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970915; x=1747575715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1dqV3EbcOv1csn2CQlOTtmle0pRezW6DWEKp2r8Lv0=;
        b=pRHWm4ABxJM7ORvp249OavmQQaUY7gleZyNuDLPgzI+8n3i+cEnaZXDjz8pQJQXNdQ
         9bQLtehTqgMa6shZSkHgdOI2kHu4bH6r8GhNgm4Ov2yD3FdWf4xM/zJpAj4Lt6visOWw
         9zqb+nBg+g47OGrJdyFky+7mSJkthZJuyPKgRz2O5kRCTAoQJrs0+5n0poRdNdFcDGPu
         7QitfZFK/JnWt6IR+wIhuMqc3z24fOO/GVwslDyHwyNGwrzN9UyajQwzShitE7ul4e0H
         ALNQebXYxMjMMnFQyXa+4FGyX6V34TBkgeHEmf0i0800Nj+hYzwvtDuJnu8Po5Du7crg
         Qeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970915; x=1747575715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1dqV3EbcOv1csn2CQlOTtmle0pRezW6DWEKp2r8Lv0=;
        b=X5ApKtciEA9fmzt3pcDcETzBw2dO91K8j3hija4nFsEtHEWeI2dtMBJzCVaVsi3CAp
         +z4ZVzW27xrp/Uw7Pill/8hADC0WFRvXjcwUq8sRWHlRpI3zTSgIIAM45Ab2jhZ4xU8v
         XFWISRtmgT8hkHktp9iRPxhPn+fM1GxMEd6wKPxM/cJMhVlrFRi2Tl3H+QMWMFGAztvV
         JP5EVITxKjuJP+UCcQCBhjWhURetMxAEJX3Q8xwqh+OxHYXWNM9NZO7PGfhvR0vMGf+L
         rYInRSn6TuC9oB+ChaD4T1A5CBpH9ChTMCItRprTvFroVwN1W2KmKOV+CLu39kDVgR4D
         k/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWqtTv4UI3heVVk+vo2kPk0r6lfkK2TxAFrPrMyNI6zUwfEEb55mQLSdf87JC+dRTnNLDVZG9Zz/Wx5jNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRgeEszYrlOTn1jPapnozf3pnKwNxobm4mtMM+/FOGINqFeQ6A
	0e9V68sLFJtk94GEsxaXpfQWjJJLe4kHpNPZPC4RRGjN0BDFfpK/Emr421NJ514=
X-Gm-Gg: ASbGncuIiImhzWYwSGaJHelArXd2+Te/v57NJ36WgIf4VyIFwHu52CDWxfo1WU8SzFW
	U2PCAXx8ga1hpxeb7cT9YCAk9Ckj+uw9bMICg2TdH1uva6Jkq8SUP52WMkL/Azc6uxCYs5YvPX1
	MoOESYoYIAjeRvpmVcFxotASh1AQd1L2pMNQaBH9pP8z+Z4pR8A1e4PBWpmd1YadO+K/qtFUfpa
	zeHvnc2j3fPAqdB8Ks3mLDZMIVdh6W/fVpbsVqJh4GSVBparr9qrtQoTK365YSSWbL5Um+5DlPE
	7G124F9rVfhgWRYfQzRUA9IzhRdfbc7Bq0zDAfPC8c5uEzjsiRC1mZDeXzaFsMONQrKqupTSrp7
	gTSOmgYVtwR+fVA==
X-Google-Smtp-Source: AGHT+IHMfmDHaDKwjjl61QoY3NY7gsNShlHPLNrcULK+uitNekT/q94LQBcj8+S04ZdXvGYiVVULSA==
X-Received: by 2002:a17:903:946:b0:220:cb1a:da5 with SMTP id d9443c01a7336-22fc8d98a39mr146678125ad.40.1746970914734;
        Sun, 11 May 2025 06:41:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:54 -0700 (PDT)
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
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI service group
Date: Sun, 11 May 2025 19:09:29 +0530
Message-ID: <20250511133939.801777-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c    | 280 +++++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h |  13 +
 4 files changed, 301 insertions(+)
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 08bb3b031f23..83700fc2ddc9 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -612,6 +612,13 @@ config RISCV_IMSIC
 	select GENERIC_MSI_IRQ
 	select IRQ_MSI_LIB
 
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
index 365bcea9a61f..515280da499c 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
+obj-$(CONFIG_RISCV_RPMI_SYSMSI)		+= irq-riscv-rpmi-sysmsi.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
 obj-$(CONFIG_THEAD_C900_ACLINT_SSWI)	+= irq-thead-c900-aclint-sswi.o
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
new file mode 100644
index 000000000000..9f14a92290c4
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -0,0 +1,280 @@
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
+	struct device		*dev;
+	struct mbox_client	client;
+	struct mbox_chan	*chan;
+	u32			nr_irqs;
+	u32			gsi_base;
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
+	ret = rpmi_sysmsi_set_msi_state(priv, d->hwirq, 0);
+	if (ret) {
+		dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n",
+			 (u32)d->hwirq, ret);
+	}
+	irq_chip_mask_parent(d);
+}
+
+static void rpmi_sysmsi_irq_unmask(struct irq_data *d)
+{
+	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
+	int ret;
+
+	irq_chip_unmask_parent(d);
+	ret = rpmi_sysmsi_set_msi_state(priv, d->hwirq, RPMI_SYSMSI_MSI_STATE_ENABLE);
+	if (ret) {
+		dev_warn(priv->dev, "Failed to unmask hwirq %d (error %d)\n",
+			 (u32)d->hwirq, ret);
+	}
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
+	if (ret) {
+		dev_warn(priv->dev, "Failed to set target for hwirq %d (error %d)\n",
+			 (u32)d->hwirq, ret);
+	}
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
+		if (is_of_node(dev_fwnode(dev)))
+			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
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
index dfffe4804ec7..7cd6507c153b 100644
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

