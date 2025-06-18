Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0181FECB1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249039; cv=none; b=juMYHryj7a1cnRczjeFHazvbZFw1HrEaq4X1mOKvVwsq3PixDEeEonjuGFDfYgIcAR0CqF66NyepIlI7WDvyBBAHjMJy8sTOqT2W2nFP3+yLpxkWMhHyt5vkCp8UAEYTCZuVh7dSiPZB0mhfC66mPVed7Jhnc06mPO/EKgl+UYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249039; c=relaxed/simple;
	bh=MnWssIe2gPHfcipP/eIFfuXpaV0J/C/5d3IRgfnAQHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdMWpi/RmyxaqLxRq6P1sgxPuCs8z4G5ogrWmfCgPTBfG9Yuwwk9uw9iqVphC+1PYQxhTiKksVT2EZPxe9rH7K7aHIaol1aCQsIMmi0c6dmlElN4ZHE5bCFn8P5Ge1gjhZ0VGyZh1MgVNu1P2ln40hBjgXELKYe75o2XGNLpAm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IT9Jo25x; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IT9Jo25x"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742caef5896so5651016b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249037; x=1750853837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=IT9Jo25xCdbOPiCQnMOb/NCrHUZL141F24OYef1o/vRfqJQqaa1utLlidO5nCzL/v/
         W7NdcdBAxmAouYVw3vls1qbI3e5xG0OH3eI3K+C4XPtPAA8wgkO3EDvDtaq9Bj+U8nNY
         aINZL4IEq6nDGHvJ8RpJitcy6QSeO0hGlgritiolGw/xh1ETXn208kT9LPl9fuRj49ST
         guvCwFhsbJdZF4jrsNeLInAQECy1obulVm46esbNgVpIhyqJeIlZuPYW+v2HkVKjc/Xx
         JaTbWp0L4MmNq3W8asZ3uUBEsL7Iof0zpS/8f9I99XaifQN2Is+8B+O024AAui1udMqm
         OfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249037; x=1750853837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4qfR8q3szE7n/ZgMiX3NXp6iFpiigvvy3GXc1Xt1a0=;
        b=o6MGRmKj2CnxjQygosM6PnLrE0J/D6Ej7Fix2Lc+t1pZX9IBgBjkJrxEgEnajDsJOL
         r9+ygkDymUwW6GTmwyFy2mgc6DavY8gCa13pUqahQ17RQILjm+IviFTshe/GvKPK0gLX
         rjhq+8fk/nD0AuGKTbDTxf6ogSufvW8GrcYvexQjsew/yWkhLPcOszc0EvJyHnqx/4n3
         904gXLPpQGy3feJdmpTvvIWofneyMGokVtm8JzoUw2MeboqnPYeAcQF4FHxAueoAw2Jx
         tJJtECDqrm18qniUhBum8y+tqXTC0v7Do2cNJL5pjjgoiOdM5jHCzaRuUaALFE/b9jEw
         yxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgsSBWEpSqVBjxyxWX29/lAnbp9JvUxjRybgeH3zS0w/u49/vrHAGxKgJW3zVg3esUyeum3mMUtmwCdWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6v2u6roTeU51ar966PtUmmHKa8IOvH+sYezSDWzcvhsbEqKz
	bOAjG+FR6LXq3abWSnXaIBpH8BC9I+5CU8dP+j8/rGOcGZdbgAPYPU+/DKU/kp1q8+o=
X-Gm-Gg: ASbGnctQFPYwW51LzI/Cxt7UPcMXoN+h8M/lnlxvIt6eRadrAYvyL7TV256AEB+JEEI
	lQ2a6ADPkSB6ENif+CrDPrBeIsoXzceHEz8gETmRZ3eclznd3lFHcofeM0QUReNnx+rQAIF1aKr
	EyCBttgBm+V6iSyVAam9qZyN+3oJXRfpoPs8DvLlDwgvlC55YcCA5UJjN9csfDhA9OeNDCau61G
	sBkepdys1Xs9CpmbYbkoJdDA81dxYgF1i+EDGD83utzWoLUdR7HEUdzXO0BP3yZrqzrXE2xbPcS
	N7rVcYn2GYLdlBmlrrndWMH9FeXH6WxroGGvSFTetBjzREFYSlSZs/BedMooCx3hc757APntgef
	AuLGRYJPAcXxv6zKnLaJBr/f+s5JG
X-Google-Smtp-Source: AGHT+IGZxm5K+fImPTj80yc/09wm99fEy6jDG9RVHP9Gj1V5pfPQ80BXgbZFOxeJiG+mqaum26We2w==
X-Received: by 2002:a05:6a00:14c2:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-7489ce0c6bbmr28455044b3a.8.1750249036547;
        Wed, 18 Jun 2025 05:17:16 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:16 -0700 (PDT)
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
Subject: [PATCH v6 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed, 18 Jun 2025 17:43:56 +0530
Message-ID: <20250618121358.503781-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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

