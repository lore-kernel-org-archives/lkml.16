Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CB2E8E17
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249030; cv=none; b=qUbJlGITYWSBl8E/pXU+NW8vW55OT74+7mM67RuKe1L0rZ0mhIY08GhVONzd3Z5ok0wYre5v29dq0bdzT1kD8Ln5iPA3G437cZYWl62hMGyo1I+oSjDMENMu46+p8EBIuy8qEMWRFWtbiy+ioM/3r98A9cLPQ50AheOuMTbNSfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249030; c=relaxed/simple;
	bh=g6OipK2dNx3Ey9Dhweye/KK3qb66qyoTirMQXslr048=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpWPDlO/WnN7V4aV7kts4RaH/9YhidRpAi5GUZouxDR7e5GQqqKW+rzpoS7OEqcQupn53Vl0909OhdXJKpEoNlcKFDAbu5OxeQxxkkSrOtLmafQ4F13VDzzRFJ4bRBJDzrutcjGqVwRiqnJ/ByIO94POWpuWta30ZdINgBhprOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YvR4o9cY; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YvR4o9cY"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso8121593a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249028; x=1750853828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUhpwTX4n1+Ryhj35+Z6PkHkJ1jozXai7DpNR9V4xvU=;
        b=YvR4o9cYV3gtDfruDmLh+X76JbNnFAR+XP0ZEggUKyzfFKBB3ao23flH0V/lyfCqga
         U+4Tr1gDWhCQ+96E63n4mSSdg2t89o0wSP8Q0kPB3U0uvCUMpXOfpHpH5UCM8J+Hm7uQ
         jmul6zdTXZZTR87wYzPKVzekocKGrVKo70O8nzMCXraRXOXFmDctl1yM0rO8wha9GlsI
         9Pnv2w8BZQZF+f+4yEGZBL4i13EYm6MD7eW7sE+yM+LQvMdCaZJYCRUPd+aqzvh/h3qn
         /fZPsh4ZP54Ys/vUuzJ75C8sZV040BEoeu6+3VkEUZHRWxavriOwFn0kqFthb4uq0YFh
         au+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249028; x=1750853828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUhpwTX4n1+Ryhj35+Z6PkHkJ1jozXai7DpNR9V4xvU=;
        b=G83gFgEiTp+uHMJAmHPpxd9vitdiwyrzE6/ZuOtJXiMwK8BbbYd20kab9AJl/z9+m1
         Uykjl20emcc7TAItJzxmDqDxIfkxyK9iVO8kL5RDlBU/HYB1dQLK9C2eaInDWQvttQfz
         biNEBqT4P8XKXIEZJoFQ69wasph7mQeDL994B0hyLdbvUzzjYRAHIwFO7BObw498gv97
         3W5j42CJHOvmNvRiifl8dN/tIV8xiPRMzcrHKmTWqQoT4k9bWzt1Np7yNFevLvUgl2oG
         iLQmuTJzOJTth++Yh7IMzhP/L9nsG2+VLUKHYfXDj+wn5hJNJ4sP3b0OFqy4B1F3JF8G
         ew8g==
X-Forwarded-Encrypted: i=1; AJvYcCUYcLXea/nlIS8vIS69Aerh366H5FzbPqmci0qZKKmt3+Totv5yLFgl9F5jQ5jtaF7yMaXGSXdzj/IX3oU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CpJaL4rVIw1n9r2GYaS4jzZxLF3k+2tqEGTwJRReeN7Rn38S
	N/MFcDov2u7YTOOI3wtgze9BwTcwdgsS+KTwKg6JPaEDtksD5NmnHhq9hU9pob8xp4c=
X-Gm-Gg: ASbGncsNgnYNweiMQ1WkU5mlflcIhJrTfQXPFvYyznf9pF2BQD0KFZRFh3u6aB6wWon
	qyM6E9i8UYzEKB1nCgdjFn/kzKxmy+W5iIcwGrNyIj56DnDbX2LJ34uLFsSDSiwSMl2T8rYw1XZ
	GRMl1y5LE4pvb5c6WshrpSzMvHDTerNI7ZutFuxveT7e1s5FrlvR46VS8I0cPvXpqJ/dGpp0D1f
	N1AJ3yrCrw922O+i2pImBUlFfdETiS2V/fANkZ74VrnuaWFHHjpUYaTLn64Oc2J3haRH7U0/Ixb
	sksbiCLxJ6eCV7mtn7vgGA21C0gX/nnT4wLmdA3xvf1P3DEMVRh0cGLAp2uQumqHcvhfqLMKaPH
	j3sgWtz1ixyQQ32J1lA==
X-Google-Smtp-Source: AGHT+IFE6quWJkl2csNe+aAmuz+xVKTGmBp2V0J9lQvhod/0F9ABAe+poyvH/tQKvdDDGrYHyVdAVA==
X-Received: by 2002:a05:6a21:513:b0:21a:de8e:5cbb with SMTP id adf61e73a8af0-21fbd550de1mr24741695637.25.1750249027864;
        Wed, 18 Jun 2025 05:17:07 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:07 -0700 (PDT)
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
Subject: [PATCH v6 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Wed, 18 Jun 2025 17:43:55 +0530
Message-ID: <20250618121358.503781-21-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index a94c7bc692a8..8c3f82fa37d6 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -5,9 +5,11 @@
  * Copyright (C) 2025 Ventana Micro Systems Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/mm.h>
@@ -779,6 +781,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 	u32 i, *channel_ids __free(kfree) = NULL;
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int msi_idx, rc;
 
@@ -901,6 +904,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -908,8 +913,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -954,6 +964,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev)
+		acpi_dev_clear_dependencies(adev);
+#endif
+
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -973,10 +990,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = mpxy_mbox_acpi_match,
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0

