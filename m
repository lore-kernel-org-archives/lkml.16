Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53501E520D
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163011; cv=none; b=gOkH06+EXRWClz0ClVBHxDJdZ4NbKVccxuAXMVeVkbYvvAsPt19cD590loNl4LTpp6DWxiZw+0lZcOU7SjzvTiSoG970ZDt4H6FKwMnrlrPC7NPZL669e8QWGXbfV5bdhz4wcwS7738xxt003IwENz2FwHDeSTp6u+9cFGuS/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163011; c=relaxed/simple;
	bh=3EMexVZnQ/uKL1p2c69xumak9aK8eue/GT+CZvSc6Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJM27q5lgeHU/iAW53EN62rhiwmc5utFc7AYdhQOJjHqkSlcTemySf7q23kLVfh9O48P7viq9wKTLK2mPmlpFXIMfeoMolJ5nlJ8j42N/73Sr99Hqs/TVUnGRJ4nq4vX6IuNSTlgzLrZVdB4aESVEr/ijmhQyhA+PeuiUKxMYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Vb7gsRNy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Vb7gsRNy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c7a52e97so1035378b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163009; x=1748767809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=;
        b=Vb7gsRNyvxhtpaq2q80iin3aAnk45+Q/xJggVDwZX20pzdygGfUsbQVXIfI/173/zv
         D5sir32o83aWOWzQTCY9yRGX4+NOh/u+Zu1+HW3mVdh5R1Yj+W+CnpuSp8lHRmJXdgm8
         9tgA6glRYOWqkalSb7QeDLB4wkEBorq4vaUYNTsCXwzLwPRWdNQSU0Y6EX43WYorIXIS
         t5y4hZFsY/GSex2rTLsZLY+EG4JtK1+yeAScU08ma9Do4UlvcMmyAjjI4gXRpt5oMd6A
         OgOPSSWx61xWaCBMI0VnFE+PWnVP97UTutXvhreQBEWi55ue/wdffFHtv5kuEuf5xrKR
         vAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163009; x=1748767809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfqImwLemjECQIdHoY3dB5j6bAppUnYCVT8DSb3UZSo=;
        b=wOH/4CEYFodw6FT9rnTvPiMaEa7HBoyRzXVvBgq9y5ra3jTi7QLG5amPd+zmwRLMVO
         ZA4k78NbKMizXn1JyKPI0cTA96RZAut80FAA1BT9H73vDYBnXGKKdkaLPTLKOfvMHft2
         yBXLYngQxyD3SITrxnpShciQLCUZuMO7YWwB8kQVFZgohJjsUMTULwGPbeJymyFd++Ep
         5qEYXzOm2GBxHFY6lsvlJtQiEC3HrcoeWsbR2V5Q/mIrjRjCG41GztkrW4i7GQu1t5+c
         S7BYLQDECJPw03EjMvgEDzv31ooEYsaUTwndd3L/pbhCuKYhz98CPTGP0+0Sc6Fp17EZ
         /j1g==
X-Forwarded-Encrypted: i=1; AJvYcCUof7H6gPmBU2bHgC0h4oO1kxHwE73AM4mt74RJ6FktcBErN9lnVSO06RH2X4UFmwpXp2qj9umbumGHCCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQGn/S0Az/svd5UJNZX0SFA9AXcDVSE0CBVqeMihw+i9k6LUA
	xn36oZ+J3rCsamWj9NuXEM5vAkdcky07EMRiRInToW00VCWHvaATYZvUq3OMdZmySQA=
X-Gm-Gg: ASbGncsq4aCYJNapFzYxdu7larWaFUDm3lHUCrxRwa10ict5bnkp98mCKUJXCaOnIk4
	JB3l9WPxGoNXBWKteKMrcMzUxMNJF2iemHfSbz61xgtCZ4o0sL0KW+lV0/Q2fgy77ZmfDS8eVyU
	4WL6Qawkio3T4Im/XVRF4MG/c+733eDTgzw0XrsKjuD+F0V1vqMRD28r3J0r+B2p/OnI9anzrgn
	hAMIAC+H8bBe3pKiug1JtzPaJ2xjmDsWE6PJO+cKUqwzFVDreDE+VdcxhiYXMPQxm8GIJYkqLFw
	oDTMQcijG0dor6mzQX/334yPYBdHpylMrvLfWKnJF1oLPbUEEvSSKSaIudZj/0PQHezeSU/DzBY
	meHFw2rUo
X-Google-Smtp-Source: AGHT+IGBMpKQMQCTT7NisaoM1o5YYuoZlK0DnedslPvydIVxR6+tdzcYF9ryA8HgQTUtwWvs2xaGbQ==
X-Received: by 2002:a05:6a21:4781:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2188c28bc20mr7948535637.19.1748163008895;
        Sun, 25 May 2025 01:50:08 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:08 -0700 (PDT)
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
Subject: [PATCH v4 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Sun, 25 May 2025 14:17:07 +0530
Message-ID: <20250525084710.1665648-21-apatel@ventanamicro.com>
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

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 28 +++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 121ee5fd3d0d..3d71af6321c3 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -6,9 +6,11 @@
  */
 
 #include <asm/sbi.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
@@ -767,6 +769,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int i, msi_idx, rc;
 	u32 *channel_ids;
@@ -892,6 +895,8 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 
 	/* Set the MSI domain if not available */
 	if (!dev_get_msi_domain(dev)) {
+		struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 		/*
 		 * The device MSI domain for OF devices is only set at the
 		 * time of populating/creating OF device. If the device MSI
@@ -899,8 +904,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -945,6 +955,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
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
@@ -964,10 +981,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
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

