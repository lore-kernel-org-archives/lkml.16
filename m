Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73822CBC8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623162; cv=none; b=gxjCyufvs/yOe6Ai3iZsbtnfQP1CnSwOsNbA8P1LfdT3Z1SF9TDfgf8t0H4fbP6LEL+awrNRRP3ujniES0tKdwn4C4SEdGaYfByoBf4UxaLhSwMFG2onoCtJFbt2eQ7moqO36PhW47qySrVHNgoJMhRQnmJK1XqrmAe1dlxRlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623162; c=relaxed/simple;
	bh=cQmAlJ5DFIrp9Ji0v7+dFRa1ZwSMWPgUy9FslwKC2dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoIIyVMRAjMODlzQPfJ3dEmhT8Jk+bK327UH22rClgzEUcgkaIzSJsiFwNdj5W0ghygj/SU6fSCBf8NbVkz1sDHgT2/dpFpILqT1582cWWVK5a8pB7tQMjrU66eyFJoPw2XWRK3BP70UQ1z4gXXS4XngY7jqTSvnvUuy50VJyQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hqrc5TNT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hqrc5TNT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23539a1a421so54448785ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623160; x=1750227960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS9j9gcN2wQKo26dVWHCAmNvKNHMO5vB8LdZytpDdd4=;
        b=hqrc5TNTS9M8+N8B0SE7yj2jD25tFsNRyQ3GJ0vXrKXZLUMhf25QjuXVJElNTQ55Ab
         by6LrT+Y8/hLcuKrYJDD5XRTkYXxofMwbDnHajswEH/gc+cavqUj7inKxvciMmP5l2Wn
         LMY+qmX7UXwWX5ZU8qkb+d3PYRQtPvrOqmMYzDs1gUDwWLWGoQ68+5CIEY4YgHiXwxTt
         oTaKEPC929o0nBonjBmomiu+t9FPLkZwFvI9UBv17V/JWwOliPFIdmEig+wOxt2w0SuC
         xH+fAuUQSbJDuQ+r3QxI+Gte7aLkVAX0zew16meSH2bYqVmkY6A/fkBXK8USTEEQO8Oj
         LA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623160; x=1750227960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS9j9gcN2wQKo26dVWHCAmNvKNHMO5vB8LdZytpDdd4=;
        b=ZxOmXtV1jC6GTIsaT6P69+59G8kiImO0jFoNNTLr/fPNHU15RLjj3KJlfhZ0gyolOr
         jZ1na4rK9RoGs27z3C/vrW0wqkfNN2TaOiS8jWo+gFFKnHs5KTb3bEj4UI0gXej+6xx3
         +OeaCQjoH3aXWzH3/HUoCFGGJQ1dtx+yPx9FFb1XHjwBoZ6VF71153tGOKEWaEuNeFlZ
         b1ZEvL91D344JDP7YzVkk+iii3tHv/+Xq2vaVbLrFXm4L3ULvyO/fLQobvqvKmq6NjYB
         8K+l71jNS/qciNM5+6/DJCSYy6rCgc82NP20tEWtagP5hocHbnBQHY6R8qtIICVBooAv
         KNQA==
X-Forwarded-Encrypted: i=1; AJvYcCUFZBnLE/duDODnhFHsg+7mUFz9YigpLy/ftir4qm7Zkam/jUNphdBWCd/erTdo4Jztf+cvenJ3B0DfTZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfYCxhevWsCMltUZx5W81VzJz7wyr7c8SgydeQ9b6lLnanK8Fq
	rDwYQl9xGWn9PObk3qFRF6GaHWqSjE3SYGdFYsx0gcK7U+tuMbE+gBg2ADkX61XqFsY=
X-Gm-Gg: ASbGncslFzCBv/3tfNjoaBkogL2snwUfkGfqmozLIKuuC6pAYFgB9iJiLGzIa6wbtIf
	ZwsxvklOLe96JvziZGB8a/JSfny0fB/ok0j8p56XmpHd3dd5XjySMQJyoRTTmUOrGIEMeIdzY0N
	1KP73Bj0Aqexr9AKITmQu176Zw9xhVUsSRNypBG1g0b2xNAYKSsbyurjC10s5reC+hMhrBnIRyj
	Hb1C6Fo1de1r4SlTnDtGBJYvmrGa5ZQrTDcXi6wMQfmPaDJ7QaDyLXSGD3t5auofb2KGwT6o77A
	I9v9vFIIRArstDwXaUeH/Cg1tPUXaMAZudqqAZDWdeoX+QEQmajLEBEGfES8e6BzO/SxM/NTnFW
	NJFJbehymT7fVaBMYma4ALRy+Bg==
X-Google-Smtp-Source: AGHT+IGgdyPwstKE3+iWn8KD2dTBYhJpnWD6M3so2zeNZkFWSUS5/H3BXTX0WABWmKEEx/TX7p+X9A==
X-Received: by 2002:a17:903:2a8d:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23641a99d80mr28376795ad.14.1749623160046;
        Tue, 10 Jun 2025 23:26:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:59 -0700 (PDT)
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
Subject: [PATCH v5 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Wed, 11 Jun 2025 11:52:36 +0530
Message-ID: <20250611062238.636753-22-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
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
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 46 +++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 4 deletions(-)

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
index 06f64936802a..d424067d22a8 100644
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
@@ -211,6 +213,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct irq_domain *msi_domain;
+	struct fwnode_handle *fwnode;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -241,6 +246,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -250,8 +271,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (dev_of_node(dev))
+		if (is_of_node(fwnode)) {
 			of_msi_configure(dev, dev_of_node(dev));
+		} else if (is_acpi_device_node(fwnode)) {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			mbox_free_channel(priv->chan);
@@ -266,6 +292,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
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
@@ -275,10 +308,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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

