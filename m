Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013161E5734
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163021; cv=none; b=lPDKb5zUlEKQ4L7KPDfSKv+4a+WvpvV9J5dIFEicQuyULMrVuNg2Uu9rqYJ1mjH4aQQZq9e7boQxV+BAYDqk+qgxBdJqj8bYuz5qY9PArgznJsmZa8zPxHcy3ZiCfMR096dQsdMdlMzOVkG3Lr7aUKIkhJv4aEai00ZrFcmu2BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163021; c=relaxed/simple;
	bh=YzdL1KMPOnix9KLBwQGvplL/otnn20kqRApoLPaxoOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7KWk5g48P1EIpFGiQ9x1MZE+AK9PQw30vGEK6oNx29MRJ12moP5KPo0EC/S/F3a4iTT9Jiv9IsGszGQiplYfs4qwRp0p4PsW8Y/z3Pio3gJ9fCdqPxpQT/EDo/hVV01zn56I19S1lpJFWRdkvTw19tRxsu1taRaaj7tyJz1c/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bKKwgEv6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bKKwgEv6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso954009b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163017; x=1748767817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V6QbiInxE/Um6Eyr5jQlxs29QfT2mwTqovmMoRPQuU=;
        b=bKKwgEv6HgQpW+/OvcBFyBBAFCmqu+M5AUTCQHnvEDWQLhTrXKujmAxqS0AzQ8wfaN
         2GBQQxtbJkkHpnFZZJWIRq7cFqSrYAU7MUEc69FgSizxu9lqD7UAf3fn+mq4vZkUB+dn
         pgBx74gGnjQDBMkkiucmcIrJU42dSt6TETsdThlAgoA0yGUNIkC4k7hh03S8Cax+tfAI
         hOiWsbtNnj6iGIimfDacfyn43amHenWpyqhyVeIUS43CPRb+UDitU9VVUOwE6Z9/bCmW
         4S7ptHErVgonHUkmZidkYqgBUf0oXIP+ab8HNKDzFt0flLeWLP4FxFFR7gODzcUDKz+t
         ZLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163017; x=1748767817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V6QbiInxE/Um6Eyr5jQlxs29QfT2mwTqovmMoRPQuU=;
        b=Q4YW1EAEpaQfcI+k0snUle83o7nimk6ngCimV5EO1OnMagnnGnODKMtLSPeIzOsqCm
         pwfmA0IU/3RQeSpBL8dflTLh4VghjGMoeCQ+PQZJdIq6iBni01TZqs2kk+MRrok0nCuM
         1ZPRinOrrrOz4LlAnd/Qll0ebf2hU77k8eGiRzUijZ0ClkbTIEJMIdAbTR/aKx2DLEjb
         lKHeMg3u79AC3XML0WiYVGEKXD7Lr7BVWYZ+BOrnhj7xxPUZaqWCBgySJbfnuVWWBxq1
         8kj6+TzRDoANclb5Oq460GtV4hEBn50rjbzFEps+6SDwJQJWBq++6FMUMAXKDD9bFvng
         q5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWGBY6IBZs8GMi8DVw0xMmSY8sVufLWYzreX4FdBzFQNaadX06WL0YHaCLIltOU2fjFpHBcPz7BZS4+LZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmS8PbWEr10O7Oh6simuH80qIcuvwQQf0wyE9+WZjhwo4m5oFk
	LYiWePVLgTBvoXH1wTJl9bexg+3KHxrsPLqy3+PWLf10oyXftvrH/OvcUXGsZd7QZtc=
X-Gm-Gg: ASbGncsW4r6nCYktfc8rgCFYo6qJ3tKsvXZlSEzdN3KJOVuylOK17Xs24NyosJgKNhe
	c81Augzh3JdcOGwyG61pEJ2f6jllNulPE6VP959+oixgVfk0PTDnh5v6AagqdxKu7qsrXxSTHTg
	LjqMsEl21bdF6jGslf9BXH85gMk323XTM8bpOCPDobICW1ENViU5S4u/bN2oGNwUcjMFiUKFGK/
	yKbqB3HyubjCSNGSlsbFOlgUULyz1FyVfi14rc+3gl1ztcExL5omojqMCEJ62dAGEJUHs/CLpG5
	NyU2dGlpYIkK1KSVvxjgLgBjcHRPHWi5RtNkAfDbvHKja0bWBs39iROFOPujCfZ89dO8TcvCX01
	hXLCBL4vV
X-Google-Smtp-Source: AGHT+IHA6vG3gnOFkfnCkqjtNt9jIgboUuMsLJqr0O3oyAfcFRpaKdyOG2hZOtww2NGmCEAF3xsiNQ==
X-Received: by 2002:a05:6a20:6f08:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-2188c28ac6fmr8436680637.23.1748163017053;
        Sun, 25 May 2025 01:50:17 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:16 -0700 (PDT)
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
Subject: [PATCH v4 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Sun, 25 May 2025 14:17:08 +0530
Message-ID: <20250525084710.1665648-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 48 ++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 83700fc2ddc9..132e56a596fc 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -614,7 +614,7 @@ config RISCV_IMSIC
 
 config RISCV_RPMI_SYSMSI
 	bool
-	depends on MAILBOX
+	depends on RISCV && MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_MSI_IRQ
 	default RISCV
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index d7b19fb7bf4e..6d27c036928a 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2025 Ventana Micro Systems Inc. */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/irq.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/irqdomain.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
@@ -209,6 +211,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct irq_domain *msi_domain;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -240,6 +245,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -249,8 +270,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
-			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		if (is_of_node(fwnode)) {
+			of_msi_configure(dev, to_of_node(fwnode));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -265,6 +291,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -274,10 +307,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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

