Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADC28E56D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552430; cv=none; b=qkNq1r7570NpQ907HEd6CC/JGwzxsXR1uE+pkEf8XxnL1i01ASLog5O2jxwxvdXalMsv2OI3Y4I2daE+cC7Z7RdqqRQ+g/jVaSgoSnM1vKZEpM+vqGWLR/lKFApwIBtttq4zUpqK6ociUc1Uknzk/GxnWLGRZ2OPn12rccNvB6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552430; c=relaxed/simple;
	bh=ApG+TqazgePfngwgF8UcC0MB1PI19Gz6v9CqRzVQNfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0/kWgqN3LAjYLFOMA1PTjn6/C4fmQ9m0P+4WNLYR1A3LMGxXCyn9Rga6kTYrf/tIBbLlUMT2scP73VgUz2EqlW5gAMUypY1pfbjUpYoe/+fraT76g1xZnUFC3XrQ/elj4eu2ZFl5d2AIbAMA1fmWKV5HR4LbECbJqwDaSKthlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=VzVtmgQ1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="VzVtmgQ1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742af84818cso3673308b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749552428; x=1750157228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FP3kf43rac5NeyS0tfBg63Ga8H9gH2daKAu3CycI9m8=;
        b=VzVtmgQ1M8qpWjZBfCGO7762Bjdg2buOTsVqTqNs95gFn5EtFSTlywkN3lz5zbhHpc
         3lXMT4HiAGvGVZVqTXUQKj5qIwK5hxmfhZVF/dAQ1jUrwXSps2K3NSWZ49B8/psOGwXJ
         vCmJcP4mf10mmG1gQI6PkJGKmrFndkHKU8YK3eTm0rnM3XBX4xlyNsvCcJvIBA9sW8tN
         YucCtORk83BfcGr+F0vPwfFTsdN/CAOzrIJzbW//ITY5AiRqQUSGD1iWidyyNIZeCxwu
         JLhtVrVDu4+UMHuqoKpb4EuOTUGQ5xOgFuVAmGOCpkgi/S/plVngxN4JGl063BQ8nu87
         7XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552428; x=1750157228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP3kf43rac5NeyS0tfBg63Ga8H9gH2daKAu3CycI9m8=;
        b=Hh1jrCw1xuqEzZmINdkgcASDSs8liQ4oP6GAokDF2Oj/TdnCaid9QBE4mlP92kRwjB
         Vl/kiHSPIov4vr9GhwG7pulXVl6bXXltE/YroRNERNoOITueJPeobSaxfEZQ+Qv0xx3/
         j6tew4s2PBfaa/uaCstwb6kXp2wca9HzvmeP0dpZqNCAYEP87wKK911QBcl7nNrBvTwc
         Y0QtnM5DxB4MuGkYxFpk1dCIjWV6q6dW0oyVj7HPZLb27Hu2CT56nffkrsEn0drnXSwW
         rjeDKbXohKRokeqyyoDyAhWcEiiIVC8Ucss1RxjfgkCvs5i4onvhcFWLLN14LPIjpqUA
         uGEw==
X-Gm-Message-State: AOJu0Yxh4S/lJfmKd7X+bW6GOm6BAwQ1IsMProhRJO5HKB0E56IJOMkr
	qGCgovJUNqTMaSsaYagcNu0kS/ymPvRYIX3rCOwAMKJ6adhBem7KHDgfb3L0yLoab8C3gZvCekv
	J3s9SJzs=
X-Gm-Gg: ASbGncvFqQHLIcz4yQTgm7Erf5gkon23G6kUFubVei1KyajlYl971uVi6r+vqsebwEk
	iJL1D7I/stuv1TG8M/QGBUtQG8Q5WCzeoEBNySkzcIrRGMvC3nOZ+bX2kGMq0P44qXzo12OmdoM
	FY/8aEMqzaJOOZfNOZEu07qwQZZ8ifGhSKUyaX0d02WDA+nvvpXXbSChsN+5Gg9y7k9A1r6BHjx
	Dczn1ozlpdxY+zRIrpifgYTpOvV0sHTG+i554c98RCCGBZ3PaNko9T6X7ZQ2H4YhmxAquEJM8xa
	S6UPEH+WiaAqL6sYgL8vxCOMixFhLqSNBdK/pJHr64+Cd0s5AfdIvSf2LXqn1Bbdu3uT0JQB
X-Google-Smtp-Source: AGHT+IHO3whMIsadT1gQS1uvXLzDhfAzklgArmoSaPyZ84SGmfZlfdnm+MiFoYtdG6mfvNnmI8Mwbw==
X-Received: by 2002:a05:6a00:194d:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-74827e7faa7mr22225344b3a.7.1749552427592;
        Tue, 10 Jun 2025 03:47:07 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7152448b3a.73.2025.06.10.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:47:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 3/3] iommu/riscv: Add ACPI support
Date: Tue, 10 Jun 2025 16:16:41 +0530
Message-ID: <20250610104641.700940-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610104641.700940-1-sunilvl@ventanamicro.com>
References: <20250610104641.700940-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V IO Mapping Table (RIMT) provides the information about the IOMMU
to the OS in ACPI. Add support for ACPI in RISC-V IOMMU drivers by using
RIMT data.

The changes at high level are,

a) Register the IOMMU with RIMT data structures.
b) Enable probing of platform IOMMU in ACPI way using the ACPIID defined
   for the RISC-V IOMMU in the BRS spec [1]. Configure the MSI domain if
   the platform IOMMU uses MSIs.

[1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi-id.adoc

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Link: https://lore.kernel.org/r/20250514055723.1328557-5-sunilvl@ventanamicro.com
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
 drivers/iommu/riscv/iommu.c          | 10 ++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 725e919b97ef..83a28c83f991 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -10,6 +10,8 @@
  *	Tomasz Jeznach <tjeznach@rivosinc.com>
  */
 
+#include <linux/acpi.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
@@ -46,6 +48,7 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	enum riscv_iommu_igs_settings igs;
 	struct device *dev = &pdev->dev;
 	struct riscv_iommu_device *iommu = NULL;
+	struct irq_domain *msi_domain;
 	struct resource *res = NULL;
 	int vec, ret;
 
@@ -76,8 +79,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	switch (igs) {
 	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
 	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev_fwnode(dev))) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			dev_warn(dev, "failed to find an MSI domain\n");
@@ -150,6 +158,12 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 	{},
 };
 
+static const struct acpi_device_id riscv_iommu_acpi_match[] = {
+	{ "RSCV0004", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, riscv_iommu_acpi_match);
+
 static struct platform_driver riscv_iommu_platform_driver = {
 	.probe = riscv_iommu_platform_probe,
 	.remove = riscv_iommu_platform_remove,
@@ -158,6 +172,7 @@ static struct platform_driver riscv_iommu_platform_driver = {
 		.name = "riscv,iommu",
 		.of_match_table = riscv_iommu_of_match,
 		.suppress_bind_attrs = true,
+		.acpi_match_table = riscv_iommu_acpi_match,
 	},
 };
 
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bb57092ca901..45a263c9e0d5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -12,6 +12,8 @@
 
 #define pr_fmt(fmt) "riscv-iommu: " fmt
 
+#include <linux/acpi.h>
+#include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -1651,6 +1653,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_iodir_off;
 	}
 
+	if (!acpi_disabled) {
+		rc = rimt_iommu_register(iommu->dev);
+		if (rc) {
+			dev_err_probe(iommu->dev, rc, "cannot register iommu with RIMT\n");
+			goto err_remove_sysfs;
+		}
+	}
+
 	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
 	if (rc) {
 		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
-- 
2.43.0

