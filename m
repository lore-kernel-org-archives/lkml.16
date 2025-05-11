Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15EB257AED
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970986; cv=none; b=BnLNNiwBvFvwTSUlqNQF94PffkA3pHpzg3M/5E9CCpvZ7FQV12LVATnPqIb8/17jWq25wT6/fYQKP++cHIc2V7sKPwv+Ea+FgwyEuyTyml5u4I0bC/K9XhI3fDUYZcKQaNLztMLv7O0Pf3L6VY7TD071FY+CUMgjXHUiVDiXLlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970986; c=relaxed/simple;
	bh=Y4vHAlFkhOKdHSTrf6MC05HMPDfK1GqfCwTsDy5gq4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRze/sHBleQJmoBOjwrL5tz395AOj8aZYljsdncgK/h4m+aDm2UAYbK54khIEpXPk0VblxYAK19P5t/uUVwjdIOxz6LhfSClfiaCZsa99/pk/43tpnUb5jS3FmoQicsV0tbeiqk2P15smJvxXj5ag16Q7WkT+9mvDMBvQiBoHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=PyY7lDBh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="PyY7lDBh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7418e182864so2630952b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970984; x=1747575784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cxg75+BmbsVK8by8Jg0JGFQhw+Q08MYdBoH8jGW6Ls=;
        b=PyY7lDBhenPvom9m8Wq5SusMuuy4mI1Pr5niaxcGcYT2rnC5E/8PzuhZECmUL/VTM8
         vxw3dGh2bfMxZkw9mb24qWbKD+WDBUpqaHNl9ssfijEzQwmvkG4Su2gJSoYmD112NbCU
         4m0dwx+PSjhHl9vh18t++sYUCgjq4h44JFtWIxYWtQJQqsCwONM9wqT5vRxpMW62pX3e
         x9C8tzDsqNg9xcKX2bVl7Mal/hdVTimahTRp+vfYADVVtY8Id6YyXHsoVRZfV4iceDjz
         BA3vJxphqcXyQ0ByX5DSh4wla1NQPcC0TgdbtRbHb1TsbNJsgMD6eEMP/njzzDOo5M+5
         DHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970984; x=1747575784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cxg75+BmbsVK8by8Jg0JGFQhw+Q08MYdBoH8jGW6Ls=;
        b=ZiZKtDanGGLW2IP1LsXFUyj3W2HglQivIUlyEx4BmGgiC0sHtxbITqtfJ3b2RIytG/
         qzVdPuULE0E76NnVnpRY8mo2u7knrm6Q/RnqhhNJBAV+tmY2hEQ2MAIMw7VuebLvwZ2M
         AaDnYd/1HqoRca1gaqWd5ihfiq5v2wWs/M9PuW6DUgIxJ20b3svYjb83qYBDEeroXyKo
         GcPe4DTmJbvH0UpWP3yelk/xtV5p3dPoc0ZNaDTXaAcRbBFqVqLrdhBsC8qjYnqaCZgQ
         V2J1hh4nLVGId/KZNZTwhFFfVSgTwheYDZ4ByW11zpMQEW6suIR8hZtutNwqF1tEkquu
         QwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4NUv4orM3uaFgTfZwTWUQ7thH1B6VpbeW05w4HT2QmRRSnyJVITh8b3pSvh2VlU6wfE6MkdAhKSe4qRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuwM+vq6z6HGgRz4rhslz/Mehrm2HmEFw5o9OVTSRPnoF2C1iR
	1KT+CCjrJoGyrIbNBiHh6MUxHy6Hl199ts66sEDqiwfkjyYKZAqxr5YqhaTRZsY=
X-Gm-Gg: ASbGnct/KZsykfKZnH4LcVthzjTP8gOrR4IfZ4h6j4SdKgJyb38+XAgCgGXeEpSGEWJ
	6qX9v826SkrhCVnhX+s4B/Bg5VLhCr1zJ5YH8lKuhcIiIMnR5pt7jPVcc9kmWzX3iZd6BTX97in
	sNF4HXWV8tF8KFVVi9fH8MvSIr+MPelhMB01wl43bPH5ofHbj55MUM7iLepr6Q91AvnYLPQFtcS
	gEho3hjHOvBXQD11VNTtPRj7edKpExw9Y7qBah9eW0hjxr2ZJBINtoY3lC0Q16etvak8w1cMpkN
	CPCBRjwkFhrrlzdxE6hXNiNcEqzRvWKXfkVeaGLT7o649IW4gy0Umt2esEpHH79mcHz/3A6Kk/N
	jJfEk3K0opUIQEg==
X-Google-Smtp-Source: AGHT+IGimxLIrk98Pq6CzitTPHpo8INIdEParac2p+qEDKU8VjpHbzTRWz5rjvW160LTHxYOVVCdIA==
X-Received: by 2002:a17:902:c7ca:b0:22f:c91f:d05f with SMTP id d9443c01a7336-22fc91fd077mr102748145ad.46.1746970983702;
        Sun, 11 May 2025 06:43:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:03 -0700 (PDT)
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
Subject: [PATCH v3 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Date: Sun, 11 May 2025 19:09:37 +0530
Message-ID: <20250511133939.801777-22-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                 |  2 +-
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 41 +++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

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
index 9f14a92290c4..cfe8d45dba97 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -3,11 +3,13 @@
  * Copyright (C) 2025 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/module.h>
@@ -212,6 +214,8 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpmi_sysmsi_priv *priv;
+	struct irq_domain *msi_domain;
+	u32 id;
 	int rc;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -240,6 +244,21 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 	}
 	priv->nr_irqs = rc;
 
+	if (is_acpi_node(dev_fwnode(dev))) {
+		u32 nr_irqs;
+
+		rc = riscv_acpi_get_gsi_info(dev_fwnode(dev), &priv->gsi_base, &id,
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
@@ -249,8 +268,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
+		if (is_of_node(dev_fwnode(dev))) {
 			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev))
 			return -EPROBE_DEFER;
@@ -261,6 +285,10 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 					  priv->nr_irqs, priv, priv))
 		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
 	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
 	return 0;
 }
@@ -270,10 +298,17 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
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

