Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4629221F20
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433415; cv=none; b=WlsBXh01T0x8c9775r95Ptu5/tpcz2IPCLeR1T1v+vCAELC/yq3LSmRDHr8E3CDyouG0ESin5/ysUsEQRp0a/gxG/rqUHtj2uMrdaDKTpGUYRoDMUqhLZdiAqn7+CQurOL4vbuDljMv2ZNLI/ugCGKNxPy9kwGVcc5gJbYtt/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433415; c=relaxed/simple;
	bh=MnWssIe2gPHfcipP/eIFfuXpaV0J/C/5d3IRgfnAQHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpg6tFqY4lkbTvM+zBSJHkbSZ7ZvZqgl6eQX8buw79RsO93ImolaZXBRG0pK0HADcMaAgjbMIvgt8yarfLbswR/YGpY/kPnLTnGQOwlV4QNpT7lnRKi1xvvYWmNg3LD2poRXa3cRHT49wF6f8SeKbmNclypWca0uw7FrkAdzpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=VmV/HXWb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="VmV/HXWb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2366e5e4dbaso62211705ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433413; x=1752038213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=VmV/HXWbgXKfhol/oezCExwtDqo8rz8f8/fOQyRbSDWyE3eCoUDcjykVIz9WVdvBm9
         8s8Eje0kJ6oCZwZtBeqhFpbtapJjE3QHvjmmv2/bHBtbWWH+pQ4kDZHqZAwdsJrApwAx
         J9WRExciZ6/7bUpCjuSAejwzE3Nn80cg6G9Gx7CbuFMPk0UOCs9Ym+gjBNX7LY5l+ss6
         tykg1iCyevJP7dCAoAW9mYPRAOFWn/wxp3jouytad0wUka8qCX8pNleiJEHiCSSnbN0K
         mJ3clnoQbzE9KhiC577HTsz2TLllDVz7pNqffsaiAYv8LFpn8r1vUzjzgQDvee/zV3e8
         EHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433413; x=1752038213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=U+FfyN+sM2AohOsYgH+3MYG5xaPMnuq687FzzM5E4x0NOpO47PHzjmhv7DiZPoDY4J
         9NhI56QKz2+lBNElPyYW0vcb8ISGZTGNVkV/5zxSYH5jXZAra4tnZ5gQqa7UWPWvxHp+
         IrBuF9W2iV5Xg4a1zG8FJF4yCAr5pDlLr3Om4WuDCK4zEzdm6E4dvLDmRJpEG45o9ZaX
         3iiKF3par6Q1xaIgEcwWtTLlngSYXXUI0K59Gzx93FlBSvJiik5vF0Ik//iN2VnA5zyG
         cEMBS1AfgzkzCi0lvPsVsl47gIEIrWIhwxldNaZXzDl4xUhx6vBwbuSNR02kKMDu5O3k
         Djgg==
X-Forwarded-Encrypted: i=1; AJvYcCXMt5AzIgUB4AFBbJXJKDdoEtkNyMrXH2jF9OMhpPBcl2Tnxow40haDRypX8lEgQE6IppZTumXEQ5s7wRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Bxhzr81gbMDSTBEaa0Vs/TrtehZx2GiRHmIgxpOtTq+qzsIU
	wr+8evJ9b6qRg6K6GphAoPMDaLOtRql0ylPTN0nyn6h1I1COO/Z1ACAjuWATxd75R9k=
X-Gm-Gg: ASbGncvoNQ53vXmFUKMl5//qpBaie7haPU3ATJhIfYSpirCJjHayGeCWXVJ3d/Vb9uh
	OV1aITQ1LEOJE6mJ2dAvbPCMCnkov/3OW28DdbDVCXM3U7Rwsg4r6FGVI7QmETZwBWXJb1/BAgG
	M5PQ/VdUnXa4dqzKrjymI73Oefgz75e73xLdX4lXgfiEY7IpNTU6LLFULkJKDUPPQACm5tPTWv8
	FEBeL7nCLzVJM1xZghiL4RY0Xh2jMAV3jbIU1z1JYelY3NzAnLFYbkwB68prjtUDZnO5xsUY0xL
	TwlwhgHKYF8y6hPf8A3F6SZWU8hnN3UqWvwmpNnva2SF3OvYZYZFJBF6UMFSINpFQlo/4zBrG3s
	bTYpPFdfqVgKWjozniTUt4/52Ghw=
X-Google-Smtp-Source: AGHT+IEB3xOr/KqlSjqwIoxg7iMcYneYBHYIFdD/yKkygLO37mz3QttZMjHHl/DW5Dvd44FsOdfqIA==
X-Received: by 2002:a17:902:f542:b0:235:e1e4:edb0 with SMTP id d9443c01a7336-23c6e83ea60mr21119575ad.22.1751433412835;
        Tue, 01 Jul 2025 22:16:52 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:52 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 22/24] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed,  2 Jul 2025 10:43:43 +0530
Message-ID: <20250702051345.1460497-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 47 +++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 96bf6aa55681..dfa8cc0e23dd 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -619,7 +619,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index c42fceab71fa..6b64a93d3c87 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2025 Ventana Micro Systems Inc. */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/device.h>
@@ -9,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -209,6 +211,8 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -239,6 +243,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	}
 	priv->nr_irqs = rc;
 
+	fwnode = dev_fwnode(dev);
+	if (is_acpi_node(fwnode)) {
+		u32 nr_irqs;
+
+		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
+					     &nr_irqs, NULL);
+		if (rc) {
+			dev_err(dev, "failed to find GSI mapping\n");
+			return rc;
+		}
+
+		/* Update with actual GSI range */
+		if (nr_irqs != priv->nr_irqs)
+			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
+	}
+
 	/* Set the device MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
 		/*
@@ -248,8 +268,15 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			struct irq_domain *msi_domain;
+
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -264,6 +291,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -273,10 +307,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 	{}
 };
 
+static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
+	{ "RSCV0006" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
+
 static struct platform_driver rpmi_sysmsi_driver = {
 	.driver = {
-		.name		= "rpmi-sysmsi",
-		.of_match_table	= rpmi_sysmsi_match,
+		.name			= "rpmi-sysmsi",
+		.of_match_table		= rpmi_sysmsi_match,
+		.acpi_match_table	= acpi_rpmi_sysmsi_match,
 	},
 	.probe = rpmi_sysmsi_probe,
 };
-- 
2.43.0

